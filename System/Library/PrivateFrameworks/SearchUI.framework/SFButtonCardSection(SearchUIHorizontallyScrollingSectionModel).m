@implementation SFButtonCardSection(SearchUIHorizontallyScrollingSectionModel)

- (uint64_t)searchUIHorizontallyScrollingSectionModel_widthDimension
{
  return objc_msgSend(MEMORY[0x1E0DC3340], "estimatedDimension:", 1.0);
}

- (uint64_t)searchUIHorizontallyScrollingSectionModel_useBackground
{
  return 1;
}

@end
