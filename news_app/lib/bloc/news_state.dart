
// ignore_for_file: prefer_typing_uninitialized_variables

part of 'news_bloc.dart';

abstract class NewsState extends Equatable {
  const NewsState();
  
  @override
  List<Object> get props => [];
}

 class NewsInitial extends NewsState {}

 class Newsloadingstate extends NewsState{}

 class Newsloadedstate extends NewsState{
 final List<NewsModel>newsmodel;
 const Newsloadedstate({required this.newsmodel});
 }

 class NewsErrorstate extends NewsState{
   final errormessage;
   const NewsErrorstate({required this.errormessage});

 }
