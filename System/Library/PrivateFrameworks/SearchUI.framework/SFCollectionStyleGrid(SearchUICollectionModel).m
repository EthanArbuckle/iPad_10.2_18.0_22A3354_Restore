@implementation SFCollectionStyleGrid(SearchUICollectionModel)

- (id)searchUISectionModelForCardRowModels:()SearchUICollectionModel section:expandedCollectionSections:
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  +[SearchUISectionModel sectionModelWithGridRowModels:numberOfColumns:gridStyle:section:expandedCollectionSections:](SearchUISectionModel, "sectionModelWithGridRowModels:numberOfColumns:gridStyle:section:expandedCollectionSections:", v10, (int)objc_msgSend(a1, "numberOfColumns"), objc_msgSend(a1, "gridStyle"), v9, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
