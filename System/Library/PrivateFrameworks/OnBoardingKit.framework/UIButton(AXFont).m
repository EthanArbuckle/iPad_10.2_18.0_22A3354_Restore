@implementation UIButton(AXFont)

- (id)fontForStyle:()AXFont currentSizeCategory:maxSizeCategory:
{
  id v7;
  NSString *v8;
  void *v9;
  void *v10;

  v7 = a3;
  v8 = a5;
  if (UIContentSizeCategoryCompareToCategory(v8, a4) == NSOrderedAscending)
  {
    objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithPreferredContentSizeCategory:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:compatibleWithTraitCollection:", v7, v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)fontForStyle:()AXFont maxSizeCategory:
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = (void *)MEMORY[0x1E0DC3470];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "sharedApplication");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "preferredContentSizeCategory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "fontForStyle:currentSizeCategory:maxSizeCategory:", v8, v10, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
