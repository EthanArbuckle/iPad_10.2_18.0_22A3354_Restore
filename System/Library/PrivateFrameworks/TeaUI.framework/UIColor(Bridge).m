@implementation UIColor(Bridge)

+ (id)ts_dynamicColor:()Bridge withDarkStyleVariant:
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0DC3E88];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "traitCollectionWithUserInterfaceStyle:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithUserInterfaceStyle:", 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  v13[1] = v9;
  v14[0] = v7;
  v14[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "_dynamicColorWithColorsByTraitCollection:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (uint64_t)ts_systemDarkTealColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "systemDarkTealColor");
}

+ (uint64_t)ts_tableCellDefaultSelectionTintColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "tableCellDefaultSelectionTintColor");
}

+ (id)ts_activityIndicatorColor
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = (void *)MEMORY[0x1E0DC3658];
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.45);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 1.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "ts_dynamicColor:withDarkStyleVariant:", v1, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
