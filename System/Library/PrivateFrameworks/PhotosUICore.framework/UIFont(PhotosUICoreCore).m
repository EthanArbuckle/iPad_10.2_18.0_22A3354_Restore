@implementation UIFont(PhotosUICoreCore)

+ (id)px_preferredFontForTextStyle:()PhotosUICoreCore maxContentSizeCategory:withSymbolicTraits:
{
  id v7;
  NSString *v8;
  void *v9;
  NSString *v10;
  NSComparisonResult v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v7 = a3;
  v8 = a4;
  if ((NSString *)*MEMORY[0x1E0DC4938] == v8
    || (objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v9, "preferredContentSizeCategory"),
        v10 = (NSString *)objc_claimAutoreleasedReturnValue(),
        v11 = UIContentSizeCategoryCompareToCategory(v10, v8),
        v10,
        v9,
        v11 != NSOrderedDescending))
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "px_defaultFontForTextStyle:withSymbolicTraits:", v7, a5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = (void *)MEMORY[0x1E0DC1358];
    objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithPreferredContentSizeCategory:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", v7, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "fontDescriptorWithSymbolicTraits:", a5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v15, 0.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v16;
}

+ (id)px_defaultFontForTextStyle:()PhotosUICoreCore withSymbolicTraits:
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", a3, a4, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v4, 0.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)px_preferredFontForTextStyle:()PhotosUICoreCore contentSizeCategory:withSymbolicTraits:
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;

  v9 = a3;
  v10 = a4;
  if ((id)*MEMORY[0x1E0DC4938] == v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UIFont+PhotosUICore.m"), 25, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("contentSizeCategory != UIContentSizeCategoryUnspecified"));

  }
  v11 = (void *)MEMORY[0x1E0DC1358];
  objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithPreferredContentSizeCategory:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", v9, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "fontDescriptorWithSymbolicTraits:", a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v14, 0.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)px_preferredFontForTextStyle:()PhotosUICoreCore withSymbolicTraits:options:
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v0, 0.0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

@end
