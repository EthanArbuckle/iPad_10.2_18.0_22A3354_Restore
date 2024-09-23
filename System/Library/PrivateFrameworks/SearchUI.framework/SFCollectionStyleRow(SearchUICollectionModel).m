@implementation SFCollectionStyleRow(SearchUICollectionModel)

- (id)searchUISectionModelForCardRowModels:()SearchUICollectionModel section:expandedCollectionSections:
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  +[SearchUISectionModel sectionModelWithRows:drawPlattersIfNecessary:section:expandedCollectionSections:](SearchUISectionModel, "sectionModelWithRows:drawPlattersIfNecessary:section:expandedCollectionSections:", v10, objc_msgSend(a1, "drawPlattersIfNecessary"), v9, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
