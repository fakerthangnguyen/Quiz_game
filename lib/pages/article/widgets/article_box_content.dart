

import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_highlighter/flutter_highlighter.dart';
import 'package:flutter_highlighter/themes/a11y-dark.dart';
import 'package:provider/provider.dart';
import 'package:quiz_game/apps/untils/const.dart';
import 'package:quiz_game/apps/untils/parse_html.dart';
import 'package:quiz_game/models/question_model.dart';
import 'package:quiz_game/providers/question_provider.dart';
import 'package:quiz_game/repositories/question_repo.dart';

import '../../../widgets/button_custom.dart';
import 'article_modal.dart';


class ArticleBoxContent extends StatefulWidget {
  int idTopic;
  ArticleBoxContent({super.key, required this.idTopic});



  @override
  State<ArticleBoxContent> createState() => _ArticleBoxContentState();
}

class _ArticleBoxContentState extends State<ArticleBoxContent> {
  final PageController pageController = PageController();
  String valueInput = '';

  void handleSubmit(Question data) async {
    if(valueInput.isEmpty) return;
    await showModal(context, valueInput, data);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: context.read<QuestionProvider>().getQuestionList(widget.idTopic),
      builder: (context, snapshot) {
        if(snapshot.hasData){
          List<Question> data = snapshot.data as List<Question>;
           return ExpandablePageView.builder(
             onPageChanged: (value) {
               context.read<QuestionProvider>().setCurrentData(value);
             },
              controller: pageController,
              itemCount: data.length,
              itemBuilder: (context, index){
                return Container(
                  margin: const EdgeInsets.all(10.0),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 40.0
                  ),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(30.0),
                      )
                  ),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children:  [
                       Text(
                         data[index].title.toString(),
                        style: const TextStyle(
                            color: Colors.green,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: getHeight(context)*0.02),
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: const BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.all(
                              Radius.circular(30.0),
                            )
                        ),
                        width: getWidth(context),
                        child: HighlightView(
                          parsehtmlString(
                              data[index].question),
                          theme: a11yDarkTheme,
                          language: 'dart',
                          padding: const EdgeInsets.all(12.0),
                          textStyle: const TextStyle(
                              fontFamily: 'My awesome monospace font',
                              fontSize: 16
                          ),
                        ),
                      ),
                      SizedBox(height: getHeight(context)*0.02,),
                      const Text('Đáp án của bạn :',
                        style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15),),
                      SizedBox(height: getHeight(context)*0.02,),
                      TextFormField(
                        onChanged: (value) => valueInput = value,
                        textInputAction: TextInputAction.done,
                        onFieldSubmitted: (value) {},
                        style: const TextStyle(
                            color: Colors.black
                        ),
                        decoration: const InputDecoration(
                            hintText: 'Nhập đáp án của bạn tại đây',
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)
                            )
                        ),
                      ),
                      SizedBox(height: getHeight(context)*0.02),
                      ButtonCustom(
                        onTap:() => handleSubmit(data[index]),
                        title: 'Xem kết quả',

                      )
                    ],
                  ),
                );
              }
          );
        } else {
          return Container(
            child: const Center(
              child: Text('No data'),
            ),
          );
        }
      },

    );
  }
}