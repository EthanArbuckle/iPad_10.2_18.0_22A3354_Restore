@implementation UIFindNavigatorViewLayout

void __58___UIFindNavigatorViewLayout_commonButtonConfigWithTitle___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD v4[4];
  id v5;

  v3 = a2;
  objc_msgSend(v3, "setTitle:", *(_QWORD *)(a1 + 32));
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __58___UIFindNavigatorViewLayout_commonButtonConfigWithTitle___block_invoke_2;
  v4[3] = &unk_1E16B1A60;
  objc_copyWeak(&v5, (id *)(a1 + 40));
  objc_msgSend(v3, "setTitleTextAttributesTransformer:", v4);
  objc_destroyWeak(&v5);

}

id __58___UIFindNavigatorViewLayout_commonButtonConfigWithTitle___block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  NSString *v6;
  id v7;
  NSString *v8;
  NSComparisonResult v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  v7 = objc_loadWeakRetained(v2);
  objc_msgSend(v7, "preferredMaximumContentSizeCategory");
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  v9 = UIContentSizeCategoryCompareToCategory(v6, v8);

  if (v9 == NSOrderedDescending)
  {
    v10 = objc_loadWeakRetained(v2);
    objc_msgSend(v10, "preferredMaximumContentSizeCategory");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[UITraitCollection traitCollectionWithPreferredContentSizeCategory:](UITraitCollection, "traitCollectionWithPreferredContentSizeCategory:", v11);
    v12 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v12;
  }
  objc_msgSend(off_1E167A830, "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", CFSTR("UICTFontTextStyleSubhead"), v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v13, "pointSize");
  objc_msgSend(off_1E167A828, "boldSystemFontOfSize:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, *(_QWORD *)off_1E1678D90);

  return v14;
}

void __74___UIFindNavigatorViewLayout_commonButtonConfigWithImageName_isAccessory___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  +[UIImage _systemImageNamed:withConfiguration:](UIImage, "_systemImageNamed:withConfiguration:", v2, 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:", v4);

}

@end
