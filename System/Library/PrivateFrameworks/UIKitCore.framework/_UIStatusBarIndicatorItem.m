@implementation _UIStatusBarIndicatorItem

- (id)dependentEntryKeys
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[_UIStatusBarIndicatorItem indicatorEntryKey](self, "indicatorEntryKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)indicatorEntryKey
{
  return (NSString *)&stru_1E16EDF20;
}

- (BOOL)isTemplateImage
{
  return 1;
}

- (BOOL)flipsForRightToLeftLayoutDirection
{
  return 0;
}

- (id)systemImageNameForUpdate:(id)a3
{
  return 0;
}

- (BOOL)useMultiColorSystemImageForUpdate:(id)a3
{
  return 0;
}

- (id)imageNameForUpdate:(id)a3
{
  return 0;
}

- (id)imageForUpdate:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  unint64_t v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  int v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_UIStatusBarIndicatorItem systemImageNameForUpdate:](self, "systemImageNameForUpdate:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    +[UIImage _systemImageNamed:](UIImage, "_systemImageNamed:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      v8 = imageForUpdate____s_category;
      if (!imageForUpdate____s_category)
      {
        v8 = __UILogCategoryGetNode("StatusBar", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v8, (unint64_t *)&imageForUpdate____s_category);
      }
      v9 = *(NSObject **)(v8 + 8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v18 = 138412290;
        v19 = v6;
        _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_ERROR, "No system image for name %@", (uint8_t *)&v18, 0xCu);
      }
    }
    if (-[_UIStatusBarIndicatorItem useMultiColorSystemImageForUpdate:](self, "useMultiColorSystemImageForUpdate:", v4))
    {
      objc_msgSend(v7, "imageWithRenderingMode:", 1);
      v10 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v10;
    }
  }
  else
  {
    -[_UIStatusBarIndicatorItem imageNameForUpdate:](self, "imageNameForUpdate:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      +[_UIStatusBarImageProvider sharedProvider](_UIStatusBarImageProvider, "sharedProvider");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "styleAttributes");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "imageNamed:styleAttributes:", v6, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (-[_UIStatusBarIndicatorItem isTemplateImage](self, "isTemplateImage"))
      {
        v14 = v13;
        v15 = 2;
      }
      else
      {
        v14 = v13;
        v15 = 1;
      }
      objc_msgSend(v14, "imageWithRenderingMode:", v15);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v7 = 0;
    }
  }
  if (-[_UIStatusBarIndicatorItem flipsForRightToLeftLayoutDirection](self, "flipsForRightToLeftLayoutDirection"))
  {
    objc_msgSend(v7, "imageFlippedForRightToLeftLayoutDirection");
    v16 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v16;
  }

  return v7;
}

- (BOOL)crossfadeForUpdate:(id)a3
{
  return 0;
}

- (_UIStatusBarImageView)imageView
{
  _UIStatusBarImageView *imageView;

  imageView = self->_imageView;
  if (!imageView)
  {
    -[_UIStatusBarIndicatorItem _create_imageView](self, "_create_imageView");
    imageView = self->_imageView;
  }
  return imageView;
}

- (void)_create_imageView
{
  _UIStatusBarImageView *v3;
  _UIStatusBarImageView *v4;
  _UIStatusBarImageView *imageView;

  v3 = [_UIStatusBarImageView alloc];
  v4 = -[_UIStatusBarImageView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  imageView = self->_imageView;
  self->_imageView = v4;

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
  NSArray *currentImageNamePrefixes;
  NSArray *v15;
  NSArray *v16;
  NSArray *v17;
  char v18;
  void *v19;
  void *v20;
  uint64_t v21;
  _QWORD v23[4];
  id v24;
  NSArray *v25;
  objc_super v26;

  v6 = a3;
  v7 = a4;
  v26.receiver = self;
  v26.super_class = (Class)_UIStatusBarIndicatorItem;
  -[_UIStatusBarItem applyUpdate:toDisplayItem:](&v26, sel_applyUpdate_toDisplayItem_, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[_UIStatusBarIndicatorItem shouldUpdateIndicatorForIdentifier:](self, "shouldUpdateIndicatorForIdentifier:", v9))goto LABEL_20;
  v10 = objc_msgSend(v7, "isEnabled");

  if (v10)
  {
    v11 = objc_msgSend((id)objc_opt_class(), "instanceMethodForSelector:", sel_imageForUpdate_);
    v12 = +[_UIStatusBarIndicatorItem instanceMethodForSelector:](_UIStatusBarIndicatorItem, "instanceMethodForSelector:", sel_imageForUpdate_);
    objc_msgSend(v6, "styleAttributes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "imageNamePrefixes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v6, "dataChanged") & 1) == 0
      && (v11 == v12 || (objc_msgSend(v6, "styleAttributesChanged") & 1) == 0))
    {
      currentImageNamePrefixes = self->_currentImageNamePrefixes;
      v15 = v9;
      v16 = currentImageNamePrefixes;
      if (v15 == v16)
      {

LABEL_19:
        goto LABEL_20;
      }
      v17 = v16;
      if (v15 && v16)
      {
        v18 = -[NSArray isEqual:](v15, "isEqual:", v16);

        if ((v18 & 1) != 0)
        {
          v9 = v15;
LABEL_20:

          goto LABEL_21;
        }
      }
      else
      {

      }
    }
    -[_UIStatusBarIndicatorItem setCurrentImageNamePrefixes:](self, "setCurrentImageNamePrefixes:", v9);
    -[_UIStatusBarIndicatorItem imageForUpdate:](self, "imageForUpdate:", v6);
    v15 = (NSArray *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(v7, "identifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIStatusBarIndicatorItem imageViewForIdentifier:](self, "imageViewForIdentifier:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (-[_UIStatusBarIndicatorItem crossfadeForUpdate:](self, "crossfadeForUpdate:", v6))
      {
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __55___UIStatusBarIndicatorItem_applyUpdate_toDisplayItem___block_invoke;
        v23[3] = &unk_1E16E0278;
        v24 = v20;
        v25 = v15;
        +[_UIStatusBarAnimation animationWithBlock:](_UIStatusBarAnimation, "animationWithBlock:", v23);
        v21 = objc_claimAutoreleasedReturnValue();

        v8 = (void *)v21;
      }
      else
      {
        objc_msgSend(v20, "setImage:", v15);
      }

    }
    else
    {
      objc_msgSend(v7, "setEnabled:", 0);
    }
    goto LABEL_19;
  }
LABEL_21:

  return v8;
}

- (NSArray)currentImageNamePrefixes
{
  return self->_currentImageNamePrefixes;
}

- (void)setCurrentImageNamePrefixes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_currentImageNamePrefixes, 0);
}

@end
