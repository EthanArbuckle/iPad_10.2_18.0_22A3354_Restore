@implementation RFSimpleItemVisualElementCardSection(SearchUIHorizontallyScrollingSectionModel)

- (double)searchUIHorizontallyScrollingSectionModel_interItemSpacing
{
  return 6.0;
}

- (uint64_t)searchUIHorizontallyScrollingSectionModel_customSectionInsets
{
  uint64_t result;
  objc_super v3;

  result = objc_msgSend(MEMORY[0x1E0DBDA48], "isSiri");
  if ((result & 1) == 0)
  {
    v3.receiver = a1;
    v3.super_class = (Class)&off_1F033FC38;
    return (uint64_t)objc_msgSendSuper2(&v3, sel_searchUIHorizontallyScrollingSectionModel_customSectionInsets);
  }
  return result;
}

- (double)searchUIHorizontallyScrollingSectionModel_widthDimensionMultiplier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  int v10;
  double result;
  objc_super v12;

  objc_msgSend(a1, "image");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "visual_elements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "image_element");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sources");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "url");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "image_style");

  if (v9 > 0x1E)
    return 0.5;
  if (((1 << v9) & 0x44A000E1) != 0)
  {
    v10 = objc_msgSend(MEMORY[0x1E0DBDA48], "isMacOS");
    result = 0.666666667;
    if (v10)
      return 0.8;
    return result;
  }
  if (((1 << v9) & 0x2000E00) != 0)
  {
    v12.receiver = a1;
    v12.super_class = (Class)&off_1F033FC38;
    objc_msgSendSuper2(&v12, sel_searchUIHorizontallyScrollingSectionModel_widthDimensionMultiplier);
    return result;
  }
  result = 1.0;
  if (((1 << v9) & 0x1000100) == 0)
    return 0.5;
  return result;
}

@end
