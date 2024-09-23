@implementation SFLinkPresentationCardSection(SearchUIHorizontallyScrollingSectionModel)

- (double)searchUIHorizontallyScrollingSectionModel_widthDimensionMultiplier
{
  int v0;
  double result;

  v0 = objc_msgSend(MEMORY[0x1E0DBDA48], "isMacOS");
  result = 1.33333333;
  if (!v0)
    return 1.0;
  return result;
}

- (uint64_t)searchUIHorizontallyScrollingSectionModel_heightDimension
{
  return objc_msgSend(MEMORY[0x1E0DC3340], "absoluteDimension:", 128.0);
}

- (uint64_t)searchUIHorizontallyScrollingSectionModel_useBackground
{
  return 1;
}

@end
