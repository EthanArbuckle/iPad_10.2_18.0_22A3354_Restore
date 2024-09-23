@implementation SFCardSection(SearchUIGridSectionModel)

- (uint64_t)searchUIGridSectionModel_heightDimensionWithColumnCount:()SearchUIGridSectionModel
{
  return objc_msgSend(MEMORY[0x1E0DC3340], "estimatedDimension:", 1.0);
}

- (uint64_t)searchUIGridSectionModel_useBackground
{
  return 0;
}

- (uint64_t)searchUIGridSectionModel_useEstimatedHeight
{
  return 1;
}

- (double)searchUIGridSectionModel_interItemSpacing
{
  return 8.0;
}

- (double)searchUIGridSectionModel_groupInsetFor:()SearchUIGridSectionModel
{
  return *MEMORY[0x1E0DC3298];
}

@end
