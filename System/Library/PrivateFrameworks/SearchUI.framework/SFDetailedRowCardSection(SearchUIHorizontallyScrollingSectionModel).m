@implementation SFDetailedRowCardSection(SearchUIHorizontallyScrollingSectionModel)

- (double)searchUIHorizontallyScrollingSectionModel_widthDimensionMultiplier
{
  void *v2;
  double v3;
  double v4;
  double v5;
  objc_super v7;

  objc_msgSend(a1, "thumbnail");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "size");
  v3 = 1.0;
  if (v4 <= 150.0)
  {
    v7.receiver = a1;
    v7.super_class = (Class)&off_1F033A680;
    objc_msgSendSuper2(&v7, sel_searchUIHorizontallyScrollingSectionModel_widthDimensionMultiplier);
    v3 = v5;
  }

  return v3;
}

- (uint64_t)searchUIHorizontallyScrollingSectionModel_needsHeaderSeparator
{
  return 1;
}

- (double)_superGroupSpacing
{
  return 0.0;
}

- (double)searchUIHorizontallyScrollingSectionModel_additionalSectionInsets
{
  int v0;
  double result;

  v0 = objc_msgSend(MEMORY[0x1E0DBDA48], "isMacOS");
  result = 4.0;
  if (v0)
    return 2.0;
  return result;
}

@end
