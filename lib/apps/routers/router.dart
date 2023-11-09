import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_game/apps/routers/router_name.dart';
import 'package:quiz_game/pages/article/article_page.dart';
import 'package:quiz_game/pages/category/category_page.dart';
import 'package:quiz_game/pages/home/home_page.dart';

class RouterCustom {
  static final GoRouter router = GoRouter(
      routes: <RouteBase>[
        GoRoute(
          path: RoutersPath.homePath,
          builder: (BuildContext context, GoRouterState state) {
            return const HomePage();
          },
          routes: <RouteBase>[
            GoRoute(
              name: RoutersName.categoryName,
              path: RoutersPath.categoryPath,
              builder: (BuildContext context, GoRouterState state) {
                return const CategoryPage();
              },
              routes: <RouteBase>[
                GoRoute(
                  name: RoutersName.articleName,
                  path: RoutersPath.articlePath,
                  builder: (BuildContext context, GoRouterState state) {
                    Map data = state.extra as Map;

                    int id = data['id'];
                    String name = data['name'];
                    return ArticlePage(
                      idTopic: id,
                      name: name,
                    );
                  },
            ),
          ],
        ),
      ],
  )
  ]
  );

}