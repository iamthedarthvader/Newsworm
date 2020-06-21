import 'package:newsworm/models/cotegori_models.dart';

List<CategoryModel> getCategories(){
  List<CategoryModel> category=List<CategoryModel>();
  CategoryModel categoryModel=CategoryModel();
  categoryModel.categoryname="Business";
  categoryModel.imageUrl="https://images.unsplash.com/photo-1507679799987-c73779587ccf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1051&q=80";
  category.add(categoryModel);

//  2
  categoryModel=CategoryModel();
  categoryModel.categoryname="Entertainment";
  categoryModel.imageUrl="https://images.unsplash.com/photo-1514525253161-7a46d19cd819?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60";
  category.add(categoryModel);
//3
  categoryModel=CategoryModel();
  categoryModel.categoryname="General";
  categoryModel.imageUrl="https://images.unsplash.com/photo-1455849318743-b2233052fcff?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60";
  category.add(categoryModel);
  //4
  categoryModel=CategoryModel();
  categoryModel.categoryname="Health";
  categoryModel.imageUrl="https://images.unsplash.com/photo-1490818387583-1baba5e638af?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60";
  category.add(categoryModel);
//4
  categoryModel=CategoryModel();
  categoryModel.categoryname="Science";
  categoryModel.imageUrl="https://images.unsplash.com/photo-1451187580459-43490279c0fa?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60";
  category.add(categoryModel);
//5
  categoryModel=CategoryModel();
  categoryModel.categoryname="Sports";
  categoryModel.imageUrl="https://images.unsplash.com/photo-1587385789097-0197a7fbd179?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60";
  category.add(categoryModel);
//6
  categoryModel=CategoryModel();
  categoryModel.categoryname="Technology";
  categoryModel.imageUrl="https://images.unsplash.com/photo-1498050108023-c5249f4df085?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60";
  category.add(categoryModel);

 return category;
}