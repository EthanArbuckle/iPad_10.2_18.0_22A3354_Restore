@implementation SFAppIconCardSection(SearchUILeadingTrailingSectionModel)

- (void)customizeSection:()SearchUILeadingTrailingSectionModel isLeading:
{
  double v5;
  double v6;
  double v7;
  BOOL v8;
  double v9;
  double v10;
  BOOL v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  id v16;

  if (a4)
  {
    v16 = a3;
    v5 = (double)+[SearchUIAppIconUtilities numberOfAppIconsPerRow](SearchUIAppIconUtilities, "numberOfAppIconsPerRow");
    +[SearchUIAppIconUtilities appIconItemSize](SearchUIAppIconUtilities, "appIconItemSize");
    v7 = v6;
    v8 = +[SearchUIUtilities isIpad](SearchUIUtilities, "isIpad");
    v9 = 28.0;
    if (!v8)
      +[SearchUIAppIconUtilities idealHorizontalSpacingBetweenAppIcons](SearchUIAppIconUtilities, "idealHorizontalSpacingBetweenAppIcons", 28.0);
    v10 = (v5 + -1.0) * v9 + v5 * v7;
    v11 = +[SearchUIUtilities isIpad](SearchUIUtilities, "isIpad");
    v12 = 12.0;
    if (!v11)
    {
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen", 12.0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "bounds");
      v15 = (v14 + -32.0 - v10) * 0.5;

      v12 = fmax(v15, 0.0);
    }
    objc_msgSend(v16, "setLeadingFractionalWidth:", (v7 + v12 * 2.0) / v10);
    objc_msgSend(v16, "setVerticalSpacing:", 0.0);
    objc_msgSend(v16, "setPrefersSeparatorsInTrailingGroup:", 1);
    objc_msgSend(a1, "customizeRowModelsForAppTopHitWithShortcuts:", v16);

  }
}

- (uint64_t)preferredBackgroundStyleForIsLeadingPrimaryCard:()SearchUILeadingTrailingSectionModel
{
  if (a3)
    return 4;
  else
    return 5;
}

- (void)customizeRowModelsForAppTopHitWithShortcuts:()SearchUILeadingTrailingSectionModel
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  double v15;
  uint64_t v16;
  double v17;
  id v18;

  v18 = a3;
  objc_msgSend(v18, "rowModels");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  objc_msgSend(v18, "trailingRowModels");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v4)
  {
    v7 = 0;
    v8 = *MEMORY[0x1E0C9D820];
    v9 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    v10 = 110.0 / (double)v6;
    do
    {
      objc_msgSend(v18, "rowModels");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndexedSubscript:", v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = v12;
        v14 = v13;
        if (v7)
        {
          v15 = 0.0;
          if (v7 == 1)
            v16 = 2;
          else
            v16 = 8 * (v4 - 1 == v7);
          v17 = v10;
        }
        else
        {
          v16 = 5;
          v17 = v9;
          v15 = v8;
        }
        objc_msgSend(v13, "setCornerMask:", v16);
        objc_msgSend(v14, "setMinimumLayoutSize:", v15, v17);

      }
      ++v7;
    }
    while (v4 != v7);
  }

}

@end
