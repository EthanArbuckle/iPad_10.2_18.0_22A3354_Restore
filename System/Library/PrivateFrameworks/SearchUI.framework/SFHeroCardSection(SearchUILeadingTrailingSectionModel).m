@implementation SFHeroCardSection(SearchUILeadingTrailingSectionModel)

+ (void)customizeSection:()SearchUILeadingTrailingSectionModel isLeading:
{
  id v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  char isKindOfClass;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  int v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  id v23;

  v5 = a3;
  v23 = v5;
  if (a4)
  {
    objc_msgSend(v5, "rowModels");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7)
    {
      v8 = 0;
      do
      {
        objc_msgSend(v23, "rowModels");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectAtIndexedSubscript:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          objc_msgSend(v23, "rowModels");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectAtIndexedSubscript:", v8);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v13, "setShouldFillAvailableSpace:", 1);
        }
        ++v8;
        objc_msgSend(v23, "rowModels");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "count");

      }
      while (v8 < v15);
    }
    objc_msgSend(v23, "setLeadingFractionalWidth:", 0.666666667);
    objc_msgSend(v23, "setPreferredHeight:", 275.0);
  }
  else
  {
    v16 = objc_msgSend(MEMORY[0x1E0DBDA48], "isMacOS");
    v17 = 16.0;
    if (v16)
      v17 = 12.0;
    v18 = 0.0;
    objc_msgSend(v23, "setTrailingGroupContentInsets:", v17, 0.0, 0.0, 0.0);
    if (objc_msgSend(MEMORY[0x1E0DBDA48], "isMacOS"))
      v19 = 2.0;
    else
      v19 = 0.0;
    if (!objc_msgSend(MEMORY[0x1E0DBDA48], "isMacOS"))
      v18 = 8.0;
    +[SearchUIUtilities standardTableCellContentInset](SearchUIUtilities, "standardTableCellContentInset");
    objc_msgSend(v23, "setSectionInsets:", 4.0, v19, v18, v19 + v20);
    objc_msgSend(v23, "setCustomSectionInsets:", 1);
    objc_msgSend(v23, "setVerticalSpacing:", 0.0);
    objc_msgSend(v23, "setLeadingFractionalWidth:", 0.590163934);
    objc_msgSend(v23, "trailingRowModels");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "firstObject");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v22, "setMinimumLayoutSize:", 240.0, 1.79769313e308);
      objc_msgSend(v22, "setShouldFillAvailableSpace:", 1);
    }

  }
}

- (uint64_t)customizeSection:()SearchUILeadingTrailingSectionModel isLeading:
{
  return objc_msgSend(MEMORY[0x1E0D8C3F8], "customizeSection:isLeading:");
}

@end
