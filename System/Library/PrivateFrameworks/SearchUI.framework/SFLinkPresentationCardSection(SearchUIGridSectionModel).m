@implementation SFLinkPresentationCardSection(SearchUIGridSectionModel)

- (uint64_t)searchUIGridSectionModel_heightDimensionWithColumnCount:()SearchUIGridSectionModel
{
  return objc_msgSend(MEMORY[0x1E0DC3340], "absoluteDimension:", dbl_1DAE1D8E0[a3 > 1]);
}

- (uint64_t)searchUIGridSectionModel_useBackground
{
  return 1;
}

- (double)searchUIGridSectionModel_groupInsetFor:()SearchUIGridSectionModel
{
  return 0.0;
}

@end
