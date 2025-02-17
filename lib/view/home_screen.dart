import 'package:flutter/material.dart';
import 'package:p11_mvvm_solid_principle_api_provider/utils/routes/routes_name.dart';
import 'package:p11_mvvm_solid_principle_api_provider/utils/utils.dart';
import 'package:p11_mvvm_solid_principle_api_provider/view_model/home_view_model.dart';
import 'package:p11_mvvm_solid_principle_api_provider/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

import '../data/response/staus.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  // intilise homeViewModel
  HomeViewModel homeViewModel = HomeViewModel();

  @override
  void initState() {
    // TODO: implement initState
    homeViewModel.fetchMoviesListApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userPreferences = Provider.of<UserViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
        automaticallyImplyLeading: false,
        actions: [
          InkWell(
              onTap: (){
                userPreferences.remove().then((value) {
                  Navigator.pushNamed(context, RoutesName.login);
                });

              },
              child: Center(child: Text('Logout'))),
          SizedBox(width: 20,)
        ],
      ),
      body: ChangeNotifierProvider<HomeViewModel>(
          create: (BuildContext context) => homeViewModel,
          child: Consumer<HomeViewModel>(
              builder : (context, value , _){
                switch (value.moviesList.status){
                  case Status.LOADING:
                    return CircularProgressIndicator();
                  case Status.ERROR:
                    return Center(child: Text(value.moviesList.message.toString()));
                  case Status.COMPLETED:
                    return ListView.builder(
                      itemCount:value.moviesList.data!.movies!.length,
                        itemBuilder: (context, index){
                          return Card(
                            child: ListTile(
                              leading: Image.network(
                                  value.moviesList.data!.movies![index].posterUrl.toString(),
                                errorBuilder: (context,error, stack){
                                    return Icon(Icons.error,color: Colors.red,);
                                },
                                height: 40,
                                width: 40,
                                fit: BoxFit.cover,
                              ),
                              title: Text(value.moviesList.data!.movies![index].title.toString()),
                              subtitle: Text(value.moviesList.data!.movies![index].year.toString()),
                              trailing: Row(
                                children: [
                                  Text(Utils.averageRating(value.moviesList.data!.movies![index].ratings!).toStringAsFixed(1)),
                                  Icon(Icons.star, color: Colors.yellow,)
                                ],
                              ),
                            ),
                          );
                        }
                    );
                  default :
                    return Text('');
                }
                // return Container();
              }),
      ),
    );
  }
}
