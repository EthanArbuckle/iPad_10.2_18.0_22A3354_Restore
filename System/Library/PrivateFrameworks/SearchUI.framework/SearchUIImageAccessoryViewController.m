@implementation SearchUIImageAccessoryViewController

+ (BOOL)supportsRowModel:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "trailingThumbnail");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = 1;
  }
  else
  {
    v6 = (void *)objc_opt_class();
    objc_msgSend(v3, "identifyingResult");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "resultIsLegacySiriAction:", v7);

  }
  return v5;
}

+ (BOOL)resultIsLegacySiriAction:(id)a3
{
  id v3;
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  if (+[SearchUIUtilities resultIsSiriAction:](SearchUIUtilities, "resultIsSiriAction:", v3))
  {
    v4 = 1;
  }
  else
  {
    objc_msgSend(v3, "action");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "interactionContentType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "hasPrefix:", *MEMORY[0x1E0CBD4D0]) & 1) != 0)
    {
      v4 = 1;
    }
    else
    {
      objc_msgSend(v3, "userActivityRequiredString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v7 != 0;

    }
  }

  return v4;
}

- (id)setupView
{
  void *v2;
  void *v3;

  v2 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0DBD940], "cachedFontForTextStyle:isBold:isMacStyle:", *MEMORY[0x1E0DC4A88], 0, objc_msgSend(MEMORY[0x1E0DBDA48], "isMacOS"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSymbolFont:", v3);

  objc_msgSend(v2, "setProminence:", 1);
  return v2;
}

- (void)updateWithRowModel:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  SearchUISymbolImage *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)SearchUIImageAccessoryViewController;
  -[SearchUIAccessoryViewController updateWithRowModel:](&v23, sel_updateWithRowModel_, v4);
  if (objc_msgSend(v4, "useCompactVersionOfUI"))
  {
    v5 = 0;
    if (objc_msgSend(MEMORY[0x1E0DBDA48], "isMacOS"))
      v6 = 1;
    else
      v6 = 2;
  }
  else
  {
    v6 = 3;
    v5 = 2;
  }
  -[SearchUIAccessoryViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSymbolScale:", v6);

  -[SearchUIAccessoryViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAlignment:", v5);

  objc_msgSend(v4, "trailingThumbnail");
  v9 = (SearchUISymbolImage *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v10 = (void *)objc_opt_class();
    objc_msgSend(v4, "identifyingResult");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v10) = objc_msgSend(v10, "resultIsLegacySiriAction:", v11);

    if ((_DWORD)v10)
    {
      objc_msgSend(v4, "identifyingResult");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "contentType");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13)
      {
        v15 = v13;
      }
      else
      {
        objc_msgSend(v4, "action");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "interactionContentType");
        v15 = (id)objc_claimAutoreleasedReturnValue();

      }
      if ((objc_msgSend(v15, "isEqualToString:", *MEMORY[0x1E0CBD4E0]) & 1) != 0)
      {
        v17 = CFSTR("play");
      }
      else if ((objc_msgSend(v15, "isEqualToString:", *MEMORY[0x1E0CBD4E8]) & 1) != 0)
      {
        v17 = CFSTR("message");
      }
      else if ((objc_msgSend(v15, "isEqualToString:", *MEMORY[0x1E0CBD4C8]) & 1) != 0)
      {
        v17 = CFSTR("phone");
      }
      else if ((objc_msgSend(v15, "isEqualToString:", *MEMORY[0x1E0CBD4F0]) & 1) != 0)
      {
        v17 = CFSTR("video");
      }
      else if (objc_msgSend(v15, "isEqualToString:", *MEMORY[0x1E0CBD4D8]))
      {
        v17 = CFSTR("airplayvideo");
      }
      else
      {
        v17 = CFSTR("arrow.up.forward.app");
      }
      v9 = -[SearchUISymbolImage initWithSymbolName:]([SearchUISymbolImage alloc], "initWithSymbolName:", v17);
      -[SearchUISymbolImage setPreferredFill:](v9, "setPreferredFill:", 1);

    }
    else
    {
      v9 = 0;
    }
  }
  -[SearchUIAccessoryViewController view](self, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "updateWithImage:", v9);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || !objc_msgSend(v4, "useCompactVersionOfUI"))
  {
    -[SearchUIAccessoryViewController view](self, "view");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setMaximumLayoutSize:", 1.79769313e308, 1.79769313e308);

    v21 = *MEMORY[0x1E0C9D820];
    v22 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    -[SearchUIAccessoryViewController view](self, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setMinimumLayoutSize:", v21, v22);
  }
  else
  {
    -[SearchUIAccessoryViewController view](self, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[SearchUIThumbnailViewController applyImageConstraintsToImageView:isCompact:preventThumbnailScaling:usesCompactWidth:](SearchUIThumbnailViewController, "applyImageConstraintsToImageView:isCompact:preventThumbnailScaling:usesCompactWidth:", v19, objc_msgSend(v4, "useCompactVersionOfUI"), objc_msgSend(v4, "preventThumbnailImageScaling"), 0);
  }

}

- (unint64_t)type
{
  return 5;
}

- (BOOL)containsSymbolImage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  -[SearchUIAccessoryViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = (void *)MEMORY[0x1E0DBD970];
    -[SearchUIAccessoryViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "imageView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "image");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v4, "imageIsSymbol:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
