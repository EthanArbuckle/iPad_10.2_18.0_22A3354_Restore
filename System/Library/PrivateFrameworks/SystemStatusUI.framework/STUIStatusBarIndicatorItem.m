@implementation STUIStatusBarIndicatorItem

- (id)dependentEntryKeys
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[STUIStatusBarIndicatorItem indicatorEntryKey](self, "indicatorEntryKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  _QWORD v19[4];
  id v20;
  id v21;
  objc_super v22;

  v6 = a3;
  v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)STUIStatusBarIndicatorItem;
  -[STUIStatusBarItem applyUpdate:toDisplayItem:](&v22, sel_applyUpdate_toDisplayItem_, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[STUIStatusBarIndicatorItem shouldUpdateIndicatorForIdentifier:](self, "shouldUpdateIndicatorForIdentifier:", v9))
  {
LABEL_14:

    goto LABEL_15;
  }
  v10 = objc_msgSend(v7, "isEnabled");

  if (v10)
  {
    v11 = objc_msgSend((id)objc_opt_class(), "instanceMethodForSelector:", sel_imageForUpdate_);
    v12 = +[STUIStatusBarIndicatorItem instanceMethodForSelector:](STUIStatusBarIndicatorItem, "instanceMethodForSelector:", sel_imageForUpdate_);
    objc_msgSend(v6, "styleAttributes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "imageNamePrefixes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v6, "dataChanged") & 1) != 0
      || v11 != v12 && (objc_msgSend(v6, "styleAttributesChanged") & 1) != 0
      || (BSEqualObjects() & 1) == 0)
    {
      -[STUIStatusBarIndicatorItem setCurrentImageNamePrefixes:](self, "setCurrentImageNamePrefixes:", v9);
      -[STUIStatusBarIndicatorItem imageForUpdate:](self, "imageForUpdate:", v6);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        objc_msgSend(v7, "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[STUIStatusBarIndicatorItem imageViewForIdentifier:](self, "imageViewForIdentifier:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (-[STUIStatusBarIndicatorItem crossfadeForUpdate:](self, "crossfadeForUpdate:", v6))
        {
          v19[0] = MEMORY[0x1E0C809B0];
          v19[1] = 3221225472;
          v19[2] = __56__STUIStatusBarIndicatorItem_applyUpdate_toDisplayItem___block_invoke;
          v19[3] = &unk_1E8D633E0;
          v20 = v16;
          v21 = v14;
          +[STUIStatusBarAnimation animationWithBlock:](STUIStatusBarAnimation, "animationWithBlock:", v19);
          v17 = objc_claimAutoreleasedReturnValue();

          v8 = (void *)v17;
        }
        else
        {
          objc_msgSend(v16, "setImage:", v14);
        }

      }
      else
      {
        objc_msgSend(v7, "setEnabled:", 0);
      }

    }
    goto LABEL_14;
  }
LABEL_15:

  return v8;
}

- (BOOL)shouldUpdateIndicatorForIdentifier:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "defaultDisplayIdentifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  return v4 == v3;
}

- (void)setCurrentImageNamePrefixes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)imageForUpdate:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[STUIStatusBarIndicatorItem systemImageNameForUpdate:](self, "systemImageNameForUpdate:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      _STUIStatusBar_Log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v17 = 138412290;
        v18 = v6;
        _os_log_impl(&dword_1CFE2E000, v8, OS_LOG_TYPE_ERROR, "No system image for name %@", (uint8_t *)&v17, 0xCu);
      }

    }
    if (-[STUIStatusBarIndicatorItem useMultiColorSystemImageForUpdate:](self, "useMultiColorSystemImageForUpdate:", v4))
    {
      objc_msgSend(v7, "imageWithRenderingMode:", 1);
      v9 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v9;
    }
  }
  else
  {
    -[STUIStatusBarIndicatorItem imageNameForUpdate:](self, "imageNameForUpdate:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      +[STUIStatusBarImageProvider sharedProvider](STUIStatusBarImageProvider, "sharedProvider");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "styleAttributes");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "imageNamed:styleAttributes:", v6, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (-[STUIStatusBarIndicatorItem isTemplateImage](self, "isTemplateImage"))
      {
        v13 = v12;
        v14 = 2;
      }
      else
      {
        v13 = v12;
        v14 = 1;
      }
      objc_msgSend(v13, "imageWithRenderingMode:", v14);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v7 = 0;
    }
  }
  if (-[STUIStatusBarIndicatorItem flipsForRightToLeftLayoutDirection](self, "flipsForRightToLeftLayoutDirection"))
  {
    objc_msgSend(v7, "imageFlippedForRightToLeftLayoutDirection");
    v15 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v15;
  }

  return v7;
}

- (id)imageNameForUpdate:(id)a3
{
  return 0;
}

- (BOOL)flipsForRightToLeftLayoutDirection
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_currentImageNamePrefixes, 0);
}

- (STUIStatusBarImageView)imageView
{
  STUIStatusBarImageView *imageView;

  imageView = self->_imageView;
  if (!imageView)
  {
    -[STUIStatusBarIndicatorItem _create_imageView](self, "_create_imageView");
    imageView = self->_imageView;
  }
  return imageView;
}

- (void)_create_imageView
{
  id v3;
  STUIStatusBarImageView *v4;
  STUIStatusBarImageView *imageView;

  v3 = objc_alloc(-[STUIStatusBarIndicatorItem imageViewClass](self, "imageViewClass"));
  v4 = (STUIStatusBarImageView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  imageView = self->_imageView;
  self->_imageView = v4;

  -[STUIStatusBarImageView setFontStyle:](self->_imageView, "setFontStyle:", -[STUIStatusBarIndicatorItem fontStyle](self, "fontStyle"));
}

- (Class)imageViewClass
{
  return (Class)objc_opt_class();
}

- (int64_t)fontStyle
{
  return 0;
}

- (BOOL)useMultiColorSystemImageForUpdate:(id)a3
{
  return 0;
}

- (BOOL)crossfadeForUpdate:(id)a3
{
  return 0;
}

- (NSString)indicatorEntryKey
{
  return (NSString *)&stru_1E8D64C18;
}

- (BOOL)isTemplateImage
{
  return 1;
}

- (id)systemImageNameForUpdate:(id)a3
{
  return 0;
}

void __56__STUIStatusBarIndicatorItem_applyUpdate_toDisplayItem___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v6 = (void *)MEMORY[0x1E0DC3F10];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__STUIStatusBarIndicatorItem_applyUpdate_toDisplayItem___block_invoke_2;
  v7[3] = &unk_1E8D62C88;
  v8 = *(id *)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  objc_msgSend(v6, "animateWithDuration:delay:options:animations:completion:", 0, v7, a4, 0.333, 0.0);

}

uint64_t __56__STUIStatusBarIndicatorItem_applyUpdate_toDisplayItem___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setImage:", *(_QWORD *)(a1 + 40));
}

- (NSArray)currentImageNamePrefixes
{
  return self->_currentImageNamePrefixes;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

@end
