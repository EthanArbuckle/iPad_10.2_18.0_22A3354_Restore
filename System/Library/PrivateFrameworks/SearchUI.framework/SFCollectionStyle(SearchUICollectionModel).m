@implementation SFCollectionStyle(SearchUICollectionModel)

- (SearchUISectionModel)searchUISectionModelForCardRowModels:()SearchUICollectionModel section:expandedCollectionSections:
{
  return +[SearchUISectionModel sectionModelWithRows:drawPlattersIfNecessary:section:expandedCollectionSections:](SearchUISectionModel, "sectionModelWithRows:drawPlattersIfNecessary:section:expandedCollectionSections:", a3, 1, a4, a5);
}

@end
