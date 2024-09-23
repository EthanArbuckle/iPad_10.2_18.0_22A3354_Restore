@implementation _UIPageIndicatorImageView

- (void)invalidateIntrinsicContentSize
{
  objc_super v7;

  __asm { FMOV            V0.2D, #-1.0 }
  self->_cachedSize = _Q0;
  v7.receiver = self;
  v7.super_class = (Class)_UIPageIndicatorImageView;
  -[UIView invalidateIntrinsicContentSize](&v7, sel_invalidateIntrinsicContentSize);
}

- (void)setImage:(id)a3
{
  id v4;
  void *v5;
  char v6;
  id v12;
  double v13;
  double v14;
  id v15;
  BOOL v16;
  double v17;
  double v18;
  void *v19;
  _QWORD v20[5];
  objc_super v21;

  v4 = a3;
  -[UIImageView image](self, "image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if ((v6 & 1) == 0)
  {
    __asm { FMOV            V0.2D, #-1.0 }
    self->_cachedSize = _Q0;
    if ((objc_msgSend(v4, "isSymbolImage") & 1) == 0)
    {
      v12 = v4;
      objc_msgSend(v12, "size");
      if (v13 > 42.0 || v14 > 42.0)
      {
        v16 = v13 <= v14;
        v17 = v13 * 42.0 / v14;
        v18 = v14 * 42.0 / 42.0;
        if (v16)
          v18 = 42.0;
        else
          v17 = 42.0;
        objc_msgSend(v12, "imageByPreparingThumbnailOfSize:", v17, v18);
        v15 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v15 = v12;
      }
      v19 = v15;

      objc_msgSend(v19, "imageWithRenderingMode:", 2);
      v4 = (id)objc_claimAutoreleasedReturnValue();

    }
    v21.receiver = self;
    v21.super_class = (Class)_UIPageIndicatorImageView;
    -[UIImageView setImage:](&v21, sel_setImage_, v4);
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __38___UIPageIndicatorImageView_setImage___block_invoke;
    v20[3] = &unk_1E16B1B28;
    v20[4] = self;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v20);
  }

}

- (CGSize)sizeForImage:(id)a3 traits:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  double width;
  double height;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  double v20;
  double v21;
  id v22;
  BOOL v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CGSize result;

  v6 = a3;
  v7 = a4;
  -[UIImageView image](self, "image");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqual:", v6);
  if (!v9)
  {

LABEL_12:
    if (v7)
    {
      -[UIView _contentSizeCategoryLimitedTraitCollection:](self, v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[UIView traitCollection](self, "traitCollection");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView _contentSizeCategoryLimitedTraitCollection:](self, v16);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_15;
  }
  if (!v7)
  {

LABEL_7:
    width = self->_cachedSize.width;
    height = self->_cachedSize.height;
    if (width != -1.0 || height != -1.0)
      goto LABEL_27;
    goto LABEL_12;
  }
  -[UIView traitCollection](self, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqual:", v7);

  if (v11)
    goto LABEL_7;
  -[UIView _contentSizeCategoryLimitedTraitCollection:](self, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
LABEL_15:
  -[UIImageView _symbolConfigurationForImage:](self, "_symbolConfigurationForImage:", v6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "configurationWithTraitCollection:", v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v6, "isSymbolImage") & 1) == 0)
  {
    v19 = v6;
    objc_msgSend(v19, "size");
    if (v20 > 42.0 || v21 > 42.0)
    {
      v23 = v20 <= v21;
      v24 = v20 * 42.0 / v21;
      v25 = v21 * 42.0 / 42.0;
      if (v23)
        v25 = 42.0;
      else
        v24 = 42.0;
      objc_msgSend(v19, "imageByPreparingThumbnailOfSize:", v24, v25);
      v22 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = v19;
    }
    v6 = v22;

  }
  objc_msgSend(v6, "imageWithConfiguration:", v18);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "size");
  width = v27;
  height = v28;

  if (v9)
  {
    self->_cachedSize.width = width;
    self->_cachedSize.height = height;
  }

LABEL_27:
  v29 = width;
  v30 = height;
  result.height = v30;
  result.width = v29;
  return result;
}

- (void)setIndicatorView:(id)a3
{
  self->_indicatorView = (_UIPageIndicatorView *)a3;
}

- (_UIPageIndicatorImageView)initWithFrame:(CGRect)a3
{
  _UIPageIndicatorImageView *v3;
  _UIPageIndicatorImageView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIPageIndicatorImageView;
  v3 = -[UIImageView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[_UIPageIndicatorImageView prepare](v3, "prepare");
  return v4;
}

- (void)prepare
{
  void *v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[2];
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  __asm { FMOV            V0.2D, #-1.0 }
  self->_cachedSize = _Q0;
  -[_UIPageIndicatorImageView _updateSymbolConfiguration](self, "_updateSymbolConfiguration");
  v13[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[UIView registerForTraitChanges:withAction:](self, "registerForTraitChanges:withAction:", v8, sel__updateSymbolConfiguration);

  v12[0] = objc_opt_class();
  v12[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[UIView registerForTraitChanges:withAction:](self, "registerForTraitChanges:withAction:", v10, sel_invalidateIntrinsicContentSize, v12[0]);

}

- (void)_updateSymbolConfiguration
{
  void *v3;
  uint64_t v4;
  double v5;
  uint64_t v6;
  id v7;

  -[UIView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 != 8)
  {
    if (v4 == 5)
    {
      v5 = 8.0;
      goto LABEL_6;
    }
    if (v4 != 2)
    {
      +[UIImageSymbolConfiguration configurationWithTextStyle:scale:](UIImageSymbolConfiguration, "configurationWithTextStyle:scale:", CFSTR("UICTFontTextStyleFootnote"), 1);
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
  }
  v5 = 12.0;
LABEL_6:
  +[UIImageSymbolConfiguration configurationWithPointSize:](UIImageSymbolConfiguration, "configurationWithPointSize:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
LABEL_8:
  v7 = (id)v6;
  -[UIImageView setPreferredSymbolConfiguration:](self, "setPreferredSymbolConfiguration:", v6);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  -[UIImageView image](self, "image", a3.width, a3.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPageIndicatorImageView sizeForImage:traits:](self, "sizeForImage:traits:", v4, 0);
  v6 = v5;
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (_UIPageIndicatorImageView)initWithCoder:(id)a3
{
  _UIPageIndicatorImageView *v3;
  _UIPageIndicatorImageView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIPageIndicatorImageView;
  v3 = -[UIImageView initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[_UIPageIndicatorImageView prepare](v3, "prepare");
  return v4;
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("filters.vibrantColorMatrix.inputColorMatrix")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)_UIPageIndicatorImageView;
    v5 = -[UIImageView _shouldAnimatePropertyWithKey:](&v7, sel__shouldAnimatePropertyWithKey_, v4);
  }

  return v5;
}

- (_UIPageIndicatorView)indicatorView
{
  return self->_indicatorView;
}

@end
