@implementation SFMiniCardSection(SearchUIHorizontallyScrollingSectionModel)

- (double)searchUIHorizontallyScrollingSectionModel_widthDimensionMultiplier
{
  return 1.0;
}

- (uint64_t)searchUIHorizontallyScrollingSectionModel_needsHeaderSeparator
{
  return 1;
}

- (double)searchUIHorizontallyScrollingSectionModel_additionalSectionInsets
{
  int v0;
  double result;

  v0 = objc_msgSend(MEMORY[0x1E0DBDA48], "isMacOS");
  result = 12.0;
  if (v0)
    return 6.0;
  return result;
}

@end
