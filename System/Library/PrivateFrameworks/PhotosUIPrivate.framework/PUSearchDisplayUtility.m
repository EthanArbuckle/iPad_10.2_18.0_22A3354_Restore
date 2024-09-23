@implementation PUSearchDisplayUtility

+ (unint64_t)cornerMaskForCell:(id)a3 roundedCornerType:(int64_t)a4
{
  if ((unint64_t)(a4 - 1) > 2)
    return 0;
  else
    return qword_1AB0F00F0[a4 - 1];
}

+ (id)applyCornerMaskToCell:(id)a3 roundedCornerType:(int64_t)a4
{
  id v5;
  unint64_t v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a3;
  v6 = +[PUSearchDisplayUtility cornerMaskForCell:roundedCornerType:](PUSearchDisplayUtility, "cornerMaskForCell:roundedCornerType:", v5, a4);
  if (v6)
    v7 = 5.0;
  else
    v7 = 0.0;
  objc_msgSend(v5, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCornerRadius:", v7);

  objc_msgSend(v5, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setMaskedCorners:", v6);

  objc_msgSend(v5, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setMasksToBounds:", 1);

  return v5;
}

+ (id)genericCellFromCell:(id)a3 roundedCornerType:(int64_t)a4
{
  void *v4;

  +[PUSearchDisplayUtility applyCornerMaskToCell:roundedCornerType:](PUSearchDisplayUtility, "applyCornerMaskToCell:roundedCornerType:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSeparatorInset:", 0.0, 20.0, 0.0, 0.0);
  objc_msgSend(v4, "setSeparatorStyle:", 1);
  return v4;
}

+ (id)genericSuggestionsCellFont
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E0DC4A88]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(v2, "pointSize");
  objc_msgSend(v3, "systemFontOfSize:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)genericSuggestionsTitleCellFont
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E0DC4A88]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(v2, "pointSize");
  objc_msgSend(v3, "boldSystemFontOfSize:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (BOOL)indexPathIsLastRowInSection:(id)a3 tableView:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;

  v5 = a4;
  v6 = a3;
  v7 = objc_msgSend(v5, "numberOfRowsInSection:", objc_msgSend(v6, "section"));

  v8 = objc_msgSend(v6, "row");
  return v8 == v7 - 1;
}

+ (BOOL)indexPathIsFirstRowInSection:(id)a3 tableView:(id)a4
{
  return objc_msgSend(a3, "row") == 0;
}

+ (BOOL)hasLimitedScreenSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;

  v7 = *MEMORY[0x1E0D7C460];
  if (v4 == *MEMORY[0x1E0D7C468] && v6 == v7)
    return 1;
  if (v4 == v7)
    return v6 == *MEMORY[0x1E0D7C468];
  return 0;
}

@end
