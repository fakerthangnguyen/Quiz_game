
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:quiz_game/apps/routers/router_name.dart';
import 'package:quiz_game/providers/category_provider.dart';
import 'package:quiz_game/widgets/background_custom.dart';

import '../../apps/untils/const.dart';
import '../../models/category_model.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});
  @override
  Widget build(BuildContext context){
    return  Scaffold(
        body: Stack(
          children: [
             const BackgroundCustom(),
             SafeArea(
              child: FutureBuilder(
                future: context.read<CategoryProvider>().getListTopic(),
                builder: (context, snapshot) {
                  if (snapshot.hasData){
                    List<Category> data = snapshot.data as List<Category>;
                    return GridView.builder(
                      padding: EdgeInsets.symmetric(horizontal: paddingCustom(context)),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 2/1
                      ),
                      itemCount: data.length,
                      itemBuilder: (BuildContext context,int index){
                        return InkWell(
                          onTap: () {
                            context.goNamed(RoutersName.articleName, extra: {
                              'id' : data[index].id,
                              'name': data[index].name
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              color: Colors.primaries[index],
                            ),
                            child: Align(
                              child: Text(data[index].name),
                            ),
                          ),
                        );
                      },

                    );
                  } else {
                    return Container(
                      child: const Center(
                        child: Text('No data'),
                      ),
                    );
                  }
                },

              ),
            ),
          ],

        ),
    );
  }
}