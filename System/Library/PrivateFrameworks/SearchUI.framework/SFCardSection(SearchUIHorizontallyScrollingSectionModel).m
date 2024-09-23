@implementation SFCardSection(SearchUIHorizontallyScrollingSectionModel)

+ (double)searchUIHorizontallyScrollingSectionModel_idealItemWidth
{
  if (searchUIHorizontallyScrollingSectionModel_idealItemWidth_onceToken != -1)
    dispatch_once(&searchUIHorizontallyScrollingSectionModel_idealItemWidth_onceToken, &__block_literal_global_43);
  return *(double *)&searchUIHorizontallyScrollingSectionModel_idealItemWidth_idealItemWidth;
}

- (double)searchUIHorizontallyScrollingSectionModel_widthDimensionMultiplier
{
  return 2.0;
}

- (uint64_t)searchUIHorizontallyScrollingSectionModel_widthDimension
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  int v7;
  double v8;
  double v9;

  objc_msgSend((id)objc_opt_class(), "searchUIHorizontallyScrollingSectionModel_idealItemWidth");
  v3 = v2;
  objc_msgSend(a1, "searchUIHorizontallyScrollingSectionModel_widthDimensionMultiplier");
  v5 = v4;
  v6 = 1.0;
  if (v5 < 2.0)
  {
    v7 = objc_msgSend(MEMORY[0x1E0DBD9B0], "isSuperLargeAccessibilitySize", 1.0);
    v6 = 1.0;
    if (v7)
      v6 = 2.0;
  }
  v8 = v5 * v6;
  objc_msgSend(a1, "searchUIHorizontallyScrollingSectionModel_interItemSpacing");
  objc_msgSend(MEMORY[0x1E0DBD9B0], "deviceScaledRoundedValue:forView:", 0, v9 * (v8 + -1.0) + v3 * v8);
  return objc_msgSend(MEMORY[0x1E0DC3340], "absoluteDimension:");
}

- (uint64_t)searchUIHorizontallyScrollingSectionModel_heightDimension
{
  return objc_msgSend(MEMORY[0x1E0DC3340], "estimatedDimension:", 1.0);
}

- (uint64_t)searchUIHorizontallyScrollingSectionModel_useBackground
{
  return 0;
}

- (double)searchUIHorizontallyScrollingSectionModel_interItemSpacing
{
  return 8.0;
}

- (uint64_t)searchUIHorizontallyScrollingSectionModel_needsHeaderSeparator
{
  return 0;
}

- (double)searchUIHorizontallyScrollingSectionModel_additionalSectionInsets
{
  return *MEMORY[0x1E0DC3298];
}

- (double)searchUIHorizontallyScrollingSectionModel_customSectionInsets
{
  return *MEMORY[0x1E0DC3298];
}

@end
