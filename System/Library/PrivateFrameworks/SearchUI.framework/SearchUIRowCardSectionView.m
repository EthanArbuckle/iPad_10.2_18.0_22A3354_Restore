@implementation SearchUIRowCardSectionView

+ (BOOL)supportsRecyclingForCardSection:(id)a3
{
  return 1;
}

+ (BOOL)hasLeadingImageForCardSection:(id)a3
{
  id v3;
  void *v4;
  int v5;

  v3 = a3;
  objc_msgSend(v3, "image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = objc_msgSend(v3, "imageIsRightAligned") ^ 1;
  else
    LOBYTE(v5) = 0;

  return v5;
}

+ (BOOL)prefersNoSeparatorAboveRowModel:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;

  objc_msgSend(a3, "cardSection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leadingText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    LOBYTE(v6) = 0;
  }
  else
  {
    objc_msgSend(v4, "leadingSubtitle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      LOBYTE(v6) = 0;
    else
      v6 = objc_msgSend(a1, "hasLeadingImageForCardSection:", v4) ^ 1;

  }
  return v6;
}

- (id)setupContentView
{
  return (id)objc_opt_new();
}

- (void)updateWithRowModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  SearchUIDefaultBrowserAppIconImage *v11;
  SearchUIDefaultBrowserAppIconImage *v12;
  SearchUIDefaultBrowserAppIconImage *v13;
  void *v14;
  SearchUIDefaultBrowserAppIconImage *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  SearchUIDefaultBrowserAppIconImage *v21;
  uint64_t v22;
  objc_super v23;

  v4 = a3;
  objc_msgSend(v4, "cardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23.receiver = self;
  v23.super_class = (Class)SearchUIRowCardSectionView;
  -[SearchUICardSectionView updateWithRowModel:](&v23, sel_updateWithRowModel_, v4);

  objc_msgSend(v5, "punchoutOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "imageIsRightAligned")
    && v8
    && +[SearchUIUtilities appIsValidForBundleIdentifier:](SearchUIUtilities, "appIsValidForBundleIdentifier:", v8))
  {
    +[SearchUIUtilities bundleIdentifierForApp:](SearchUIUtilities, "bundleIdentifierForApp:", 14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqualToString:", v9);

    if (v10)
    {
      v11 = -[SearchUIDefaultBrowserAppIconImage initWithVariant:]([SearchUIDefaultBrowserAppIconImage alloc], "initWithVariant:", 2);
      if (!v11)
        goto LABEL_8;
    }
    else
    {
      +[SearchUIAppIconImage appIconForBundleIdentifier:variant:](SearchUIAppIconImage, "appIconForBundleIdentifier:variant:", v8, 2);
      v11 = (SearchUIDefaultBrowserAppIconImage *)objc_claimAutoreleasedReturnValue();
      if (!v11)
        goto LABEL_8;
    }
LABEL_11:
    v12 = v11;
    v13 = v12;
    goto LABEL_12;
  }
LABEL_8:
  if ((objc_msgSend(v5, "imageIsRightAligned") & 1) == 0)
  {
    v11 = 0;
    goto LABEL_11;
  }
  objc_msgSend(v5, "image");
  v12 = (SearchUIDefaultBrowserAppIconImage *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
LABEL_12:
  -[SearchUICardSectionView contentView](self, "contentView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __49__SearchUIRowCardSectionView_updateWithRowModel___block_invoke;
  v18[3] = &unk_1EA1F60F0;
  v19 = v14;
  v20 = v5;
  v21 = v12;
  v22 = 2;
  v15 = v12;
  v16 = v5;
  v17 = v14;
  objc_msgSend(v17, "performBatchUpdates:", v18);

}

void __49__SearchUIRowCardSectionView_updateWithRowModel___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  if (objc_msgSend(*(id *)(a1 + 40), "imageIsRightAligned"))
  {
    objc_msgSend(*(id *)(a1 + 32), "setLeadingImage:", 0);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "image");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    +[SearchUIImage imageWithSFImage:variantForAppIcon:](SearchUIImage, "imageWithSFImage:variantForAppIcon:", v2, *(_QWORD *)(a1 + 56));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[SearchUITLKImageConverter imageForSFImage:](SearchUITLKImageConverter, "imageForSFImage:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setLeadingImage:", v4);

  }
  objc_msgSend(*(id *)(a1 + 40), "leadingText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUITLKMultilineTextConverter richTextForSearchUIText:](SearchUITLKMultilineTextConverter, "richTextForSearchUIText:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setLeadingTitle:", v6);

  objc_msgSend(*(id *)(a1 + 40), "trailingText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUITLKMultilineTextConverter richTextForSearchUIText:](SearchUITLKMultilineTextConverter, "richTextForSearchUIText:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setTrailingTitle:", v8);

  objc_msgSend(*(id *)(a1 + 40), "leadingSubtitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUITLKMultilineTextConverter richTextForSearchUIText:](SearchUITLKMultilineTextConverter, "richTextForSearchUIText:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setLeadingSubtitle:", v10);

  objc_msgSend(*(id *)(a1 + 40), "trailingSubtitle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUITLKMultilineTextConverter richTextForSearchUIText:](SearchUITLKMultilineTextConverter, "richTextForSearchUIText:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setTrailingSubtitle:", v12);

  +[SearchUIImage imageWithSFImage:variantForAppIcon:](SearchUIImage, "imageWithSFImage:variantForAppIcon:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v14 = (id)objc_claimAutoreleasedReturnValue();
  +[SearchUITLKImageConverter imageForSFImage:](SearchUITLKImageConverter, "imageForSFImage:", v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setTrailingImage:", v13);

}

- (id)leadingTextView
{
  void *v2;
  void *v3;

  -[SearchUICardSectionView contentView](self, "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "leadingTextView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)dragTitleForCardSection:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v3 = a3;
  objc_msgSend(v3, "leadingText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUIUtilities stringForSFRichText:](SearchUIUtilities, "stringForSFRichText:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "leadingSubtitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v3, "leadingSubtitle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[SearchUIUtilities stringForSFRichText:](SearchUIUtilities, "stringForSFRichText:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByAppendingFormat:", CFSTR(", %@"), v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v9;
  }

  return v5;
}

+ (id)dragSubtitleForCardSection:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v3 = a3;
  objc_msgSend(v3, "trailingText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUIUtilities stringForSFRichText:](SearchUIUtilities, "stringForSFRichText:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "trailingSubtitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v3, "trailingSubtitle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[SearchUIUtilities stringForSFRichText:](SearchUIUtilities, "stringForSFRichText:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByAppendingFormat:", CFSTR(", %@"), v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v9;
  }

  return v5;
}

@end
