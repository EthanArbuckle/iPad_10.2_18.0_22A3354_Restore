@implementation _TVStackWrappingView

- (_TVStackWrappingView)initWithFrame:(CGRect)a3
{
  _TVStackWrappingView *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_TVStackWrappingView;
  result = -[_TVStackWrappingView initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result)
  {
    result->_usesBackgroundImage = 1;
    result->_usesBackdropImage = 1;
    result->_backdropBlurEffectStyle = 0x8000000000000000;
  }
  return result;
}

- (void)setBackgroundImage:(id)a3
{
  UIImage *v5;
  UIImage *v6;

  v5 = (UIImage *)a3;
  if (self->_backgroundImage != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_backgroundImage, a3);
    -[_TVStackWrappingView setNeedsLayout](self, "setNeedsLayout");
    v5 = v6;
  }

}

- (void)setUsesBackgroundImage:(BOOL)a3
{
  if (self->_usesBackgroundImage != a3)
  {
    self->_usesBackgroundImage = a3;
    -[_TVStackWrappingView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setStackView:(id)a3
{
  UICollectionView *v5;
  UICollectionView *stackView;
  UICollectionView *v7;

  v5 = (UICollectionView *)a3;
  stackView = self->_stackView;
  if (stackView != v5)
  {
    v7 = v5;
    -[UICollectionView removeFromSuperview](stackView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_stackView, a3);
    -[_TVStackWrappingView setNeedsLayout](self, "setNeedsLayout");
    v5 = v7;
  }

}

- (void)setBackdropImage:(id)a3
{
  UIImage *v5;
  UIImage *v6;

  v5 = (UIImage *)a3;
  if (self->_backdropImage != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_backdropImage, a3);
    -[_TVStackWrappingView setNeedsLayout](self, "setNeedsLayout");
    v5 = v6;
  }

}

- (void)setUsesBackdropImage:(BOOL)a3
{
  if (self->_usesBackdropImage != a3)
  {
    self->_usesBackdropImage = a3;
    -[_TVStackWrappingView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setBackdropBlurEffectStyle:(int64_t)a3
{
  if (self->_backdropBlurEffectStyle != a3)
  {
    self->_backdropBlurEffectStyle = a3;
    -[_TVStackWrappingView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setBackdropPeekGradient:(double)a3
{
  if (self->_backdropPeekGradient != a3)
  {
    self->_backdropPeekGradient = a3;
    -[_TVStackWrappingView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setBackdropInitialPeek:(double)a3
{
  if (self->_backdropInitialPeek != a3)
  {
    self->_backdropInitialPeek = a3;
    -[_TVStackWrappingView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setBackdropMaskFactor:(double)a3
{
  if (self->_backdropMaskFactor != a3)
  {
    self->_backdropMaskFactor = a3;
    -[_TVStackWrappingView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  int64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  UIImageView *backgroundImageView;
  UIImageView *v20;
  UIImageView *v21;
  UIImageView *v22;
  _TVStackBackdropView *backdropView;
  _TVStackBackdropMaskingView *maskedBackdropView;
  void *v25;
  _BOOL8 v26;
  _TVStackBackdropView *v27;
  _TVStackBackdropView *v28;
  _TVStackBackdropView *v29;
  _TVStackBackdropView *v30;
  void *v31;
  _TVStackBackdropMaskingView *v32;
  _TVStackBackdropMaskingView *v33;
  _TVStackBackdropMaskingView *v34;
  _TVStackBackdropMaskingView *v35;
  _TVStackBackdropView *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  _TVStackBackdropView *v41;
  double v42;
  void *v43;
  double v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  _TVStackWrappingView *v51;
  objc_super v52;

  v52.receiver = self;
  v52.super_class = (Class)_TVStackWrappingView;
  -[_TVStackWrappingView layoutSubviews](&v52, sel_layoutSubviews);
  -[_TVStackWrappingView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = -[_TVStackWrappingView backdropBlurEffectStyle](self, "backdropBlurEffectStyle");
  -[_TVStackWrappingView backdropInitialPeek](self, "backdropInitialPeek");
  v13 = v12;
  -[_TVStackWrappingView backdropPeekGradient](self, "backdropPeekGradient");
  v15 = v14;
  -[_TVStackWrappingView backdropMaskFactor](self, "backdropMaskFactor");
  v17 = v16;
  -[_TVStackWrappingView backgroundImage](self, "backgroundImage");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18 && -[_TVStackWrappingView usesBackgroundImage](self, "usesBackgroundImage"))
  {
    backgroundImageView = self->_backgroundImageView;
    if (!backgroundImageView)
    {
      _TVStackMakeImageView();
      v20 = (UIImageView *)objc_claimAutoreleasedReturnValue();
      v21 = self->_backgroundImageView;
      self->_backgroundImageView = v20;

      -[_TVStackWrappingView insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_backgroundImageView, 0);
      backgroundImageView = self->_backgroundImageView;
    }
    -[UIImageView setImage:](backgroundImageView, "setImage:", v18);
    -[UIImageView setFrame:](self->_backgroundImageView, "setFrame:", v4, v6, v8, v10);
  }
  else
  {
    -[UIImageView removeFromSuperview](self->_backgroundImageView, "removeFromSuperview");
    v22 = self->_backgroundImageView;
    self->_backgroundImageView = 0;

  }
  if (v11 == 0x8000000000000000)
  {
    -[_TVStackBackdropView removeFromSuperview](self->_backdropView, "removeFromSuperview");
    backdropView = self->_backdropView;
    self->_backdropView = 0;

    -[_TVStackBackdropMaskingView removeFromSuperview](self->_maskedBackdropView, "removeFromSuperview");
    maskedBackdropView = self->_maskedBackdropView;
    self->_maskedBackdropView = 0;

  }
  else
  {
    if (-[_TVStackWrappingView usesBackdropImage](self, "usesBackdropImage"))
    {
      -[_TVStackWrappingView backdropImage](self, "backdropImage");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v25 != 0;

    }
    else
    {
      v26 = 0;
    }
    v27 = self->_backdropView;
    if (!v27)
    {
      v28 = -[_TVStackBackdropView initWithBlurEffectStyle:]([_TVStackBackdropView alloc], "initWithBlurEffectStyle:", v11);
      v29 = self->_backdropView;
      self->_backdropView = v28;

      -[_TVStackWrappingView insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_backdropView, self->_backgroundImageView != 0);
      v27 = self->_backdropView;
    }
    __38___TVStackWrappingView_layoutSubviews__block_invoke(-[_TVStackBackdropView setBlurEffectStyle:](v27, "setBlurEffectStyle:", v11), self->_backdropView, v26);
    v30 = self->_backdropView;
    -[_TVStackWrappingView backdropImage](self, "backdropImage");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[_TVStackBackdropView setImage:](v30, "setImage:", v31);

    -[_TVStackBackdropView setFrame:](self->_backdropView, "setFrame:", v4, v6, v8, v10);
    v32 = self->_maskedBackdropView;
    if (v13 <= 0.0)
    {
      -[_TVStackBackdropMaskingView setAlpha:](v32, "setAlpha:", 0.0);
      v41 = self->_backdropView;
      v42 = 1.0 - v17;
    }
    else
    {
      if (!v32)
      {
        v33 = (_TVStackBackdropMaskingView *)objc_opt_new();
        v34 = self->_maskedBackdropView;
        self->_maskedBackdropView = v33;

        v35 = self->_maskedBackdropView;
        v36 = -[_TVStackBackdropView initWithBlurEffectStyle:]([_TVStackBackdropView alloc], "initWithBlurEffectStyle:", v11);
        -[_TVStackBackdropMaskingView setBackdropView:](v35, "setBackdropView:", v36);

        -[_TVStackWrappingView insertSubview:below:](self, "insertSubview:below:", self->_maskedBackdropView, self->_backdropView);
        v32 = self->_maskedBackdropView;
      }
      -[_TVStackBackdropMaskingView backdropView](v32, "backdropView");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setBlurEffectStyle:", v11);

      -[_TVStackBackdropMaskingView backdropView](self->_maskedBackdropView, "backdropView");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v38;
      if (v26)
      {
        -[_TVStackWrappingView backdropImage](self, "backdropImage");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "setImage:", v40);

      }
      else
      {
        objc_msgSend(v38, "setImage:", 0);
      }

      -[_TVStackBackdropMaskingView backdropView](self->_maskedBackdropView, "backdropView");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "setBounds:", v4, v6, v8, v10);

      if (v15 <= 0.0)
      {
        -[_TVStackBackdropMaskingView setFrame:](self->_maskedBackdropView, "setFrame:", v4, (v10 - v13) * v17, v8, v10 - (v10 - v13) * v17);
        -[_TVStackBackdropMaskingView layer](self->_maskedBackdropView, "layer");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "setShouldRasterize:", 0);

        -[_TVStackBackdropMaskingView backdropView](self->_maskedBackdropView, "backdropView");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        __38___TVStackWrappingView_layoutSubviews__block_invoke((uint64_t)v48, v48, v26);

        -[_TVStackBackdropMaskingView setAlpha:](self->_maskedBackdropView, "setAlpha:", 1.0);
        v41 = self->_backdropView;
        v42 = 0.0;
      }
      else
      {
        -[_TVStackBackdropMaskingView setGradientScale:](self->_maskedBackdropView, "setGradientScale:", v15 / v13);
        v44 = 0.7;
        if (!v26)
          v44 = 1.0;
        -[_TVStackBackdropMaskingView setGradientStop:](self->_maskedBackdropView, "setGradientStop:", v44);
        -[_TVStackBackdropMaskingView setFrame:](self->_maskedBackdropView, "setFrame:", 0.0, v10 - v13, v8, v13);
        -[_TVStackBackdropMaskingView layer](self->_maskedBackdropView, "layer");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "setShouldRasterize:", v26);

        -[_TVStackBackdropMaskingView backdropView](self->_maskedBackdropView, "backdropView");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        __38___TVStackWrappingView_layoutSubviews__block_invoke((uint64_t)v46, v46, 0);

        -[_TVStackBackdropMaskingView setAlpha:](self->_maskedBackdropView, "setAlpha:", 1.0);
        v41 = self->_backdropView;
        v42 = 1.0 - v17;
      }
    }
    -[_TVStackBackdropView setAlpha:](v41, "setAlpha:", v42);
  }
  -[_TVStackWrappingView stackView](self, "stackView");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = v49;
  if (v49)
  {
    objc_msgSend(v49, "superview");
    v51 = (_TVStackWrappingView *)objc_claimAutoreleasedReturnValue();

    if (v51 != self)
      -[_TVStackWrappingView addSubview:](self, "addSubview:", v50);
    objc_msgSend(v50, "setFrame:", v4, v6, v8, v10);
  }

}

- (void)configureSupplementaryCellLayoutAttributesWithAutomaticInsets:(UIEdgeInsets)a3 sectionIndex:(int64_t)a4
{
  double left;
  double top;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;
  void *v22;
  id v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t i;
  void *v51;
  uint64_t v52;
  void *v53;
  NSArray *supplementaryCellLayoutAttributes;
  double v55;
  double bottom;
  double right;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _QWORD v62[4];
  id v63;
  uint64_t *v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  int64_t v70;
  uint64_t v71;
  double *v72;
  uint64_t v73;
  void *v74;
  __int128 v75;
  __int128 v76;
  uint64_t v77;
  double *v78;
  uint64_t v79;
  uint64_t v80;
  _BYTE v81[128];
  uint64_t v82;

  bottom = a3.bottom;
  right = a3.right;
  left = a3.left;
  top = a3.top;
  v82 = *MEMORY[0x24BDAC8D0];
  -[_TVStackWrappingView stackView](self, "stackView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[_TVStackWrappingView bounds](self, "bounds");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;
    -[_TVStackWrappingView stackView](self, "stackView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)MEMORY[0x24BDBCEB8];
    -[_TVStackWrappingView headerSupplementaryViews](self, "headerSupplementaryViews");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "arrayWithCapacity:", objc_msgSend(v19, "count"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v77 = 0;
    v78 = (double *)&v77;
    v79 = 0x2020000000;
    v80 = 0;
    v71 = 0;
    v72 = (double *)&v71;
    v73 = 0x4010000000;
    v74 = &unk_222E82B8D;
    v21 = *(_OWORD *)(MEMORY[0x24BDF7718] + 16);
    v75 = *MEMORY[0x24BDF7718];
    v76 = v21;
    -[_TVStackWrappingView headerSupplementaryViews](self, "headerSupplementaryViews");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v62[0] = MEMORY[0x24BDAC760];
    v62[1] = 3221225472;
    v62[2] = __99___TVStackWrappingView_configureSupplementaryCellLayoutAttributesWithAutomaticInsets_sectionIndex___block_invoke;
    v62[3] = &unk_24EB866C8;
    v66 = v10;
    v67 = v12;
    v68 = v14;
    v69 = v16;
    v70 = a4;
    v64 = &v71;
    v65 = &v77;
    v23 = v20;
    v63 = v23;
    objc_msgSend(v22, "enumerateObjectsUsingBlock:", v62);

    objc_msgSend(v17, "contentOffset");
    v25 = v24;
    objc_msgSend(v17, "contentInset");
    v27 = v26;
    v55 = v25;
    objc_msgSend(v17, "tv_margin");
    v29 = v28;
    v31 = v30;
    v33 = v32;
    v35 = v34;
    v36 = v72[6];
    -[UIView tv_padding](self, "tv_padding");
    v41 = v29 + v36;
    if (top + v41 + v78[3] >= v37)
      v42 = top + v41 + v78[3];
    else
      v42 = v37;
    if (left + v31 >= v38)
      v43 = left + v31;
    else
      v43 = v38;
    if (bottom + v33 >= v39)
      v44 = bottom + v33;
    else
      v44 = v39;
    if (right + v35 >= v40)
      v45 = right + v35;
    else
      v45 = v40;
    if (-[_TVStackWrappingView shouldAdjustForTabBarSafeAreaInsets](self, "shouldAdjustForTabBarSafeAreaInsets"))
    {
      -[_TVStackWrappingView safeAreaInsets](self, "safeAreaInsets");
      if (v42 < v46)
        v42 = v46;
    }
    objc_msgSend(v17, "setContentInset:", v42, v43, v44, v45);
    if (v55 <= -v27)
    {
      objc_msgSend(v17, "contentOffset", -v27, v55);
      objc_msgSend(v17, "setContentOffset:");
    }
    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    v47 = v23;
    v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v58, v81, 16);
    if (v48)
    {
      v49 = *(_QWORD *)v59;
      do
      {
        for (i = 0; i != v48; ++i)
        {
          if (*(_QWORD *)v59 != v49)
            objc_enumerationMutation(v47);
          v51 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
          objc_msgSend(v51, "frame");
          objc_msgSend(v51, "setFrame:");
        }
        v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v58, v81, 16);
      }
      while (v48);
    }

    v52 = objc_msgSend(v47, "count");
    if (v52)
      v53 = (void *)objc_msgSend(v47, "copy");
    else
      v53 = 0;
    objc_storeStrong((id *)&self->_supplementaryCellLayoutAttributes, v53);
    if (v52)

    _Block_object_dispose(&v71, 8);
    _Block_object_dispose(&v77, 8);

  }
  else
  {
    supplementaryCellLayoutAttributes = self->_supplementaryCellLayoutAttributes;
    self->_supplementaryCellLayoutAttributes = 0;

  }
}

- (id)preferredFocusEnvironments
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  -[_TVStackWrappingView layoutIfNeeded](self, "layoutIfNeeded");
  -[_TVStackWrappingView stackView](self, "stackView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[_TVStackWrappingView stackView](self, "stackView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v5;
}

- (UICollectionView)stackView
{
  return self->_stackView;
}

- (NSArray)headerSupplementaryViews
{
  return self->_headerSupplementaryViews;
}

- (void)setHeaderSupplementaryViews:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 456);
}

- (BOOL)shouldAdjustForTabBarSafeAreaInsets
{
  return self->_shouldAdjustForTabBarSafeAreaInsets;
}

- (void)setShouldAdjustForTabBarSafeAreaInsets:(BOOL)a3
{
  self->_shouldAdjustForTabBarSafeAreaInsets = a3;
}

- (UIImage)backgroundImage
{
  return self->_backgroundImage;
}

- (BOOL)usesBackgroundImage
{
  return self->_usesBackgroundImage;
}

- (UIImage)backdropImage
{
  return self->_backdropImage;
}

- (BOOL)usesBackdropImage
{
  return self->_usesBackdropImage;
}

- (int64_t)backdropBlurEffectStyle
{
  return self->_backdropBlurEffectStyle;
}

- (double)backdropInitialPeek
{
  return self->_backdropInitialPeek;
}

- (double)backdropPeekGradient
{
  return self->_backdropPeekGradient;
}

- (double)backdropMaskFactor
{
  return self->_backdropMaskFactor;
}

- (NSArray)supplementaryCellLayoutAttributes
{
  return self->_supplementaryCellLayoutAttributes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supplementaryCellLayoutAttributes, 0);
  objc_storeStrong((id *)&self->_backdropImage, 0);
  objc_storeStrong((id *)&self->_backgroundImage, 0);
  objc_storeStrong((id *)&self->_headerSupplementaryViews, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_maskedBackdropView, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_backgroundImageView, 0);
}

@end
