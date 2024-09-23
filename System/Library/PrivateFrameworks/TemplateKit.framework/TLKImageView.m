@implementation TLKImageView

- (TLKImageView)init
{
  TLKImageView *v2;
  TLKProminenceView *v3;
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
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)TLKImageView;
  v2 = -[TLKView init](&v15, sel_init);
  if (v2)
  {
    v3 = -[TLKProminenceView initWithProminence:]([TLKProminenceView alloc], "initWithProminence:", 3);
    -[TLKImageView setPlaceholderView:](v2, "setPlaceholderView:", v3);

    -[TLKImageView placeholderView](v2, "placeholderView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[TLKImageView addSubview:](v2, "addSubview:", v4);

    v5 = (void *)objc_opt_new();
    -[TLKImageView setShadowContainer:](v2, "setShadowContainer:", v5);

    -[TLKImageView shadowContainer](v2, "shadowContainer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAllowsGroupOpacity:", 0);

    -[TLKImageView shadowContainer](v2, "shadowContainer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[TLKImageView addSubview:](v2, "addSubview:", v8);

    +[TLKView makeContainerShadowCompatible:](TLKView, "makeContainerShadowCompatible:", v2);
    v9 = (void *)objc_opt_new();
    -[TLKImageView setImageView:](v2, "setImageView:", v9);

    -[TLKImageView imageView](v2, "imageView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAccessibilityIgnoresInvertColors:", 1);

    -[TLKImageView imageView](v2, "imageView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[TLKLayoutUtilities requireIntrinsicSizeForView:](TLKLayoutUtilities, "requireIntrinsicSizeForView:", v11);

    -[TLKImageView shadowContainer](v2, "shadowContainer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[TLKImageView imageView](v2, "imageView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSubview:", v13);

    -[TLKImageView setProminence:](v2, "setProminence:", 1);
    v2->_symbolWeight = 4;
    v2->_symbolScale = 0;
  }
  return v2;
}

- (void)setTlkImage:(id)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  TLKImage *v10;

  v10 = (TLKImage *)a3;
  if (self->_tlkImage != v10)
  {
    objc_storeStrong((id *)&self->_tlkImage, a3);
    -[TLKView observer](self, "observer");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      -[TLKView observer](self, "observer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "batchUpdateCount");

      if (!v8)
      {
        -[TLKView observer](self, "observer");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "propertiesDidChange");

      }
    }
  }

}

- (void)setProminence:(unint64_t)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  if (self->_prominence != a3)
  {
    self->_prominence = a3;
    -[TLKView observer](self, "observer");
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (void *)v4;
      -[TLKView observer](self, "observer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "batchUpdateCount");

      if (!v7)
      {
        -[TLKView observer](self, "observer");
        v8 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "propertiesDidChange");

      }
    }
  }
}

- (void)setUseButtonColoring:(BOOL)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  if (self->_useButtonColoring != a3)
  {
    self->_useButtonColoring = a3;
    -[TLKView observer](self, "observer");
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (void *)v4;
      -[TLKView observer](self, "observer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "batchUpdateCount");

      if (!v7)
      {
        -[TLKView observer](self, "observer");
        v8 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "propertiesDidChange");

      }
    }
  }
}

- (void)setDisableCornerRounding:(BOOL)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  if (self->_disableCornerRounding != a3)
  {
    self->_disableCornerRounding = a3;
    -[TLKView observer](self, "observer");
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (void *)v4;
      -[TLKView observer](self, "observer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "batchUpdateCount");

      if (!v7)
      {
        -[TLKView observer](self, "observer");
        v8 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "propertiesDidChange");

      }
    }
  }
}

- (void)setAlignment:(unint64_t)a3
{
  uint64_t v4;
  id v5;

  if (self->_alignment != a3)
  {
    self->_alignment = a3;
    -[TLKImageView imageView](self, "imageView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (-[TLKImageView alignmentIsAspectFill](self, "alignmentIsAspectFill"))
      v4 = 2;
    else
      v4 = 0;
    objc_msgSend(v5, "setContentMode:", v4);
    -[TLKImageView updateSizeAndLayout](self, "updateSizeAndLayout");

  }
}

- (BOOL)alignmentIsAspectFill
{
  return (-[TLKImageView alignment](self, "alignment") & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (void)animateTransitionToImage:(id)a3
{
  id v4;

  v4 = a3;
  -[TLKImageView setAnimateNextImageTransition:](self, "setAnimateNextImageTransition:", 1);
  -[TLKImageView setTlkImage:](self, "setTlkImage:", v4);

}

- (void)updateWithUIImage:(id)a3 animateFadeIn:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  BOOL v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  TLKImageView *v22;
  id v23;

  v4 = a4;
  v6 = a3;
  if (-[TLKImageView animateNextImageTransition](self, "animateNextImageTransition"))
  {
    if (v6)
    {
      -[TLKImageView imageView](self, "imageView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CE86C0], "transition");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setSymbolImage:withContentTransition:", v6, v8);

      -[TLKImageView setAnimateNextImageTransition:](self, "setAnimateNextImageTransition:", 0);
    }
  }
  else
  {
    -[TLKImageView imageView](self, "imageView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setImage:", v6);

  }
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __48__TLKImageView_updateWithUIImage_animateFadeIn___block_invoke;
  v21 = &unk_1E5C06D50;
  v22 = self;
  v10 = v6;
  v23 = v10;
  +[TLKUtilities performAnimatableChanges:animated:](TLKUtilities, "performAnimatableChanges:animated:", &v18, v4);
  -[TLKImageView tlkImage](self, "tlkImage", v18, v19, v20, v21, v22);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "isTemplate"))
  {
    v12 = 0;
    v13 = 0;
    v14 = v10 == 0;
  }
  else
  {
    v15 = objc_msgSend(v11, "cornerRoundingStyle");
    v13 = 0;
    v12 = 0;
    v14 = v10 == 0;
    if (v10 && v15 == 3)
    {
      if ((objc_msgSend(v11, "supportsFastPathShadow") & 1) != 0)
      {
        v14 = 0;
        v12 = 0;
        v13 = 0;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 0;
        v12 = 1;
      }
    }
  }
  -[TLKImageView imageView](self, "imageView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setBackgroundColor:", v13);

  if (v12)
  -[TLKImageView updateSizeAndLayout](self, "updateSizeAndLayout");
  if (!v14)
  {
    -[TLKImageView delegate](self, "delegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "didUpdateWithImage:", v10);

  }
}

void __48__TLKImageView_updateWithUIImage_animateFadeIn___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v3 = a1 + 32;
  v2 = *(void **)(a1 + 32);
  v4 = 1.0;
  if (*(_QWORD *)(v3 + 8))
    v5 = 0.0;
  else
    v5 = 1.0;
  objc_msgSend(v2, "placeholderView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAlpha:", v5);

  if (*(_QWORD *)(a1 + 40))
    v7 = 1.0;
  else
    v7 = 0.0;
  objc_msgSend(*(id *)(a1 + 32), "shadowContainer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAlpha:", v7);

  v9 = *(_QWORD *)(a1 + 40);
  if (!v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "placeholderView");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v4 = (double)(objc_msgSend(v11, "isHidden") ^ 1);
  }
  objc_msgSend(*(id *)(a1 + 32), "badgeImageView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAlpha:", v4);

  if (!v9)
}

- (void)updateSizeAndLayout
{
  -[TLKImageView invalidateIntrinsicContentSizeIfNecessary](self, "invalidateIntrinsicContentSizeIfNecessary");
  -[TLKImageView setNeedsLayout](self, "setNeedsLayout");
}

- (void)invalidateIntrinsicContentSizeIfNecessary
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  BOOL v11;
  double v12;

  -[TLKImageView effectiveBaselineOffsetFromBottom](self, "effectiveBaselineOffsetFromBottom");
  v4 = v3;
  -[TLKImageView frame](self, "frame");
  v6 = v5;
  v8 = v7;
  -[TLKImageView intrinsicContentSize](self, "intrinsicContentSize");
  v11 = v6 == v10 && v8 == v9;
  if (!v11 || (-[TLKImageView lastBaselineOffset](self, "lastBaselineOffset"), v4 != v12))
  {
    -[TLKImageView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    -[TLKImageView setLastBaselineOffset:](self, "setLastBaselineOffset:", v4);
  }
}

- (CGSize)constrainedSizeForImageSize:(CGSize)a3 fittingSize:(CGSize)a4
{
  double height;
  double width;
  double v6;
  double v7;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGSize result;

  height = a4.height;
  width = a4.width;
  v6 = a3.height;
  v7 = a3.width;
  -[TLKImageView minimumLayoutSize](self, "minimumLayoutSize");
  v9 = v7;
  if (v7 < v10)
  {
    -[TLKImageView minimumLayoutSize](self, "minimumLayoutSize");
    v9 = v11;
  }
  -[TLKImageView minimumLayoutSize](self, "minimumLayoutSize");
  v12 = v6;
  if (v6 < v13)
  {
    -[TLKImageView minimumLayoutSize](self, "minimumLayoutSize");
    v12 = v14;
  }
  -[TLKImageView maximumLayoutSize](self, "maximumLayoutSize");
  if (v15 < width)
    width = v15;
  -[TLKImageView maximumLayoutSize](self, "maximumLayoutSize");
  if (v16 < height)
    height = v16;
  v17 = v7 / v6;
  if (v9 > width)
  {
    -[TLKImageView minimumLayoutSize](self, "minimumLayoutSize");
    if (width / v17 >= v18)
      v12 = width / v17;
    else
      v12 = v18;
    v9 = width;
  }
  if (v12 > height)
  {
    v9 = v17 * height;
    -[TLKImageView minimumLayoutSize](self, "minimumLayoutSize");
    if (v17 * height < v19)
      v9 = v19;
    v12 = height;
  }
  v20 = v9;
  v21 = v12;
  result.height = v21;
  result.width = v20;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TLKImageView;
  -[TLKImageView traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  -[TLKImageView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "hasDifferentColorAppearanceComparedToTraitCollection:", v4))
  {

LABEL_4:
    -[UIView tlk_updateWithCurrentAppearance](self, "tlk_updateWithCurrentAppearance");
    goto LABEL_5;
  }
  -[TLKImageView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "_vibrancy");
  v8 = objc_msgSend(v4, "_vibrancy");

  if (v7 != v8)
    goto LABEL_4;
LABEL_5:

}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TLKImageView;
  -[TLKImageView didMoveToWindow](&v3, sel_didMoveToWindow);
  -[UIView tlk_updateWithCurrentAppearance](self, "tlk_updateWithCurrentAppearance");
}

- (void)tlk_updateForAppearance:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  uint64_t v16;
  void *v17;
  unint64_t v18;
  unint64_t v19;
  _BOOL4 v20;
  int v21;
  _BOOL4 v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  _BOOL4 v30;
  int v31;
  void *v32;
  void *v33;
  _QWORD v34[4];
  id v35;
  TLKImageView *v36;
  uint64_t *v37;
  double v38;
  char v39;
  char v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  char v44;
  objc_super v45;

  v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)TLKImageView;
  -[UIView tlk_updateForAppearance:](&v45, sel_tlk_updateForAppearance_, v4);
  -[TLKImageView tlkImage](self, "tlkImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLKImageView lastTlkImage](self, "lastTlkImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[TLKImageView setLastTlkImage:](self, "setLastTlkImage:", v5);
  objc_msgSend(v5, "badgeImage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[TLKImageView badgeImageView](self, "badgeImageView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v9 = (void *)objc_opt_new();
      -[TLKImageView setBadgeImageView:](self, "setBadgeImageView:", v9);

      -[TLKImageView badgeImageView](self, "badgeImageView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setPlaceholderVisibility:", 2);

      -[TLKImageView badgeImageView](self, "badgeImageView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[TLKImageView addSubview:](self, "addSubview:", v11);

    }
  }
  -[TLKImageView badgeImageView](self, "badgeImageView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setHidden:", v7 == 0);

  objc_msgSend(v7, "setBadgeImage:", 0);
  -[TLKImageView badgeImageView](self, "badgeImageView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTlkImage:", v7);

  -[TLKImageView effectiveScreenScale](self, "effectiveScreenScale");
  v15 = v14;
  v16 = objc_msgSend(v4, "isDark");
  objc_msgSend(v5, "cachedImageForScale:isDarkStyle:", v16, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0;
  v42 = &v41;
  v43 = 0x2020000000;
  v44 = 0;
  if (v17)
  {
    -[TLKImageView updateWithUIImage:animateFadeIn:](self, "updateWithUIImage:animateFadeIn:", v17, 0);
  }
  else
  {
    if (v5 != v6)
    {
      v18 = -[TLKImageView placeholderVisibility](self, "placeholderVisibility");
      v22 = v5
         && ((v19 = v18, objc_msgSend(v5, "cornerRoundingStyle"))
          || ((v20 = -[TLKImageView disableCornerRounding](self, "disableCornerRounding"), v19 == 1)
            ? (v21 = 1)
            : (v21 = v20),
              v21 == 1))
         && v19 != 2;
      -[TLKImageView placeholderView](self, "placeholderView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setHidden:", !v22);

      -[TLKImageView updateWithUIImage:animateFadeIn:](self, "updateWithUIImage:animateFadeIn:", 0, 0);
    }
    v24 = objc_msgSend(v5, "supportsFastPathShadow");
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __40__TLKImageView_tlk_updateForAppearance___block_invoke;
    v34[3] = &unk_1E5C06DC8;
    v39 = v24;
    v35 = v5;
    v36 = self;
    v38 = v15;
    v40 = v16;
    v37 = &v41;
    objc_msgSend(v35, "loadImageWithScale:isDarkStyle:completionHandler:", v16, v34, v15);

  }
  *((_BYTE *)v42 + 24) = 1;
  if (objc_msgSend(v5, "isTemplate")
    && (-[TLKImageView overrideColor](self, "overrideColor"),
        v25 = (void *)objc_claimAutoreleasedReturnValue(),
        v25,
        !v25))
  {
    -[TLKImageView imageView](self, "imageView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "enableAppearanceForView:", v26);
  }
  else
  {
    -[TLKImageView imageView](self, "imageView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "disableAppearanceForView:", v26);
  }

  if (!v5)
  {
    -[TLKImageView placeholderView](self, "placeholderView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setHidden:", 1);

  }
  -[TLKImageView overrideColor](self, "overrideColor");
  v28 = objc_claimAutoreleasedReturnValue();
  v29 = (void *)v28;
  if (v28)
  {
    v30 = 0;
    v31 = 0;
    v32 = (void *)v28;
  }
  else
  {
    v30 = -[TLKImageView useButtonColoring](self, "useButtonColoring");
    if (v30)
      objc_msgSend(v4, "buttonColorForProminence:", -[TLKImageView prominence](self, "prominence"));
    else
      objc_msgSend(v4, "colorForProminence:", -[TLKImageView prominence](self, "prominence"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = !v30;
  }
  -[TLKImageView imageView](self, "imageView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setTintColor:", v32);

  if (v31)
  if (v30)

  -[TLKImageView updateShadow](self, "updateShadow");
  _Block_object_dispose(&v41, 8);

}

void __40__TLKImageView_tlk_updateForAppearance___block_invoke(uint64_t a1, void *a2, char a3)
{
  id v5;
  void *v6;
  id v7;
  char v8;
  char v9;
  char v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  int8x16_t v16;
  _QWORD v17[4];
  id v18;
  uint64_t v19;
  _QWORD v20[4];
  int8x16_t v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  char v26;
  char v27;
  char v28;
  char v29;
  _QWORD v30[5];
  id v31;

  v5 = a2;
  v6 = v5;
  if (v5)
  {
    v30[0] = 0;
    v30[1] = v30;
    v30[2] = 0x3032000000;
    v30[3] = __Block_byref_object_copy_;
    v30[4] = __Block_byref_object_dispose_;
    v7 = v5;
    v31 = v7;
    v8 = objc_msgSend(*(id *)(a1 + 32), "isTemplate");
    v9 = v8;
    if (*(_BYTE *)(a1 + 64))
      v10 = 1;
    else
      v10 = v8;
    if ((v10 & 1) != 0)
      v11 = 0;
    else
      v11 = +[TLKImage imageIsSymbol:](TLKImage, "imageIsSymbol:", v7) ^ 1;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __40__TLKImageView_tlk_updateForAppearance___block_invoke_16;
    v20[3] = &unk_1E5C06DA0;
    v25 = v9;
    v22 = v30;
    v26 = v11;
    v16 = *(int8x16_t *)(a1 + 32);
    v15 = (id)v16.i64[0];
    v21 = vextq_s8(v16, v16, 8uLL);
    v27 = a3;
    v24 = *(_QWORD *)(a1 + 56);
    v28 = *(_BYTE *)(a1 + 65);
    v29 = *(_BYTE *)(a1 + 64);
    v23 = *(_QWORD *)(a1 + 48);
    +[TLKUtilities executeBlock:async:](TLKUtilities, "executeBlock:async:", v20, v11);

    _Block_object_dispose(v30, 8);
    v14 = v31;
  }
  else
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __40__TLKImageView_tlk_updateForAppearance___block_invoke_3;
    v17[3] = &unk_1E5C06D50;
    v12 = *(id *)(a1 + 32);
    v13 = *(_QWORD *)(a1 + 40);
    v18 = v12;
    v19 = v13;
    +[TLKUtilities dispatchMainIfNecessary:](TLKUtilities, "dispatchMainIfNecessary:", v17);
    v14 = v18;
  }

}

void __40__TLKImageView_tlk_updateForAppearance___block_invoke_16(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  char v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  char v13;
  char v14;
  char v15;

  if (*(_BYTE *)(a1 + 72))
  {
    +[TLKImage templateImageForImage:](TLKImage, "templateImageForImage:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
  if (*(_BYTE *)(a1 + 73))
    v5 = objc_msgSend((id)objc_opt_class(), "imageIsProbablyOpaque:tlkImage:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(a1 + 40));
  else
    v5 = 0;
  if (*(_BYTE *)(a1 + 74))
    objc_msgSend(*(id *)(a1 + 40), "cacheImage:forScale:isDarkStyle:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(unsigned __int8 *)(a1 + 75), *(double *)(a1 + 64));
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __40__TLKImageView_tlk_updateForAppearance___block_invoke_2;
  v8[3] = &unk_1E5C06D78;
  v6 = *(id *)(a1 + 40);
  v13 = v5;
  v14 = *(_BYTE *)(a1 + 76);
  v7 = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v10 = v7;
  v12 = *(_QWORD *)(a1 + 64);
  v15 = *(_BYTE *)(a1 + 75);
  v11 = *(_OWORD *)(a1 + 48);
  +[TLKUtilities dispatchMainIfNecessary:](TLKUtilities, "dispatchMainIfNecessary:", v8);

}

void __40__TLKImageView_tlk_updateForAppearance___block_invoke_2(uint64_t a1)
{
  _BOOL8 v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  int v7;
  void *v8;
  int v9;
  void *v10;

  if (*(_BYTE *)(a1 + 72))
    v2 = 1;
  else
    v2 = *(_BYTE *)(a1 + 73) != 0;
  objc_msgSend(*(id *)(a1 + 32), "setSupportsFastPathShadow:", v2);
  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "tlkImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 == v4
    && (v5 = *(double *)(a1 + 64), v10 = v4, objc_msgSend(*(id *)(a1 + 40), "effectiveScreenScale"), v4 = v10, v5 == v6))
  {
    v7 = *(unsigned __int8 *)(a1 + 74);
    +[TLKAppearance bestAppearanceForView:](TLKAppearance, "bestAppearanceForView:", *(_QWORD *)(a1 + 40));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isDark");

    if (v7 == v9)
      objc_msgSend(*(id *)(a1 + 40), "updateWithUIImage:animateFadeIn:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
  }
  else
  {

  }
}

void __40__TLKImageView_tlk_updateForAppearance___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "tlkImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 == v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "didFailToLoadImage");

  }
}

- (void)setOverrideColor:(id)a3
{
  id v5;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqual:", self->_overrideColor) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_overrideColor, a3);
    -[UIView tlk_updateWithCurrentAppearance](self, "tlk_updateWithCurrentAppearance");
  }

}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[TLKImageView sizeThatFits:](self, "sizeThatFits:", *MEMORY[0x1E0CFAA80], *(double *)(MEMORY[0x1E0CFAA80] + 8));
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setSymbolFont:(id)a3
{
  UIFont *v5;
  UIFont *v6;

  v5 = (UIFont *)a3;
  if (self->_symbolFont != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_symbolFont, a3);
    -[TLKImageView updateSymbolConfiguration](self, "updateSymbolConfiguration");
    v5 = v6;
  }

}

- (void)setSymbolScale:(int64_t)a3
{
  if (self->_symbolScale != a3)
  {
    self->_symbolScale = a3;
    -[TLKImageView updateSymbolConfiguration](self, "updateSymbolConfiguration");
  }
}

- (void)setSymbolWeight:(int64_t)a3
{
  if (self->_symbolWeight != a3)
  {
    self->_symbolWeight = a3;
    -[TLKImageView updateSymbolConfiguration](self, "updateSymbolConfiguration");
  }
}

- (void)updateSymbolConfiguration
{
  void *v3;
  void *v4;
  double v5;
  void *v6;
  id v7;

  v3 = (void *)MEMORY[0x1E0DC3888];
  -[TLKImageView symbolFont](self, "symbolFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pointSize");
  objc_msgSend(v3, "configurationWithPointSize:weight:scale:", -[TLKImageView symbolWeight](self, "symbolWeight"), -[TLKImageView symbolScale](self, "symbolScale"), v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[TLKImageView imageView](self, "imageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPreferredSymbolConfiguration:", v7);

  -[TLKImageView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  CGSize result;

  -[TLKImageView naturalSizeForSize:](self, "naturalSizeForSize:");
  -[TLKImageView constrainedSizeForImageSize:fittingSize:](self, "constrainedSizeForImageSize:fittingSize:");
  result.height = v5;
  result.width = v4;
  return result;
}

- (CGSize)naturalSizeForSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  BOOL v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[TLKImageView tlkImage](self, "tlkImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "size");
  v8 = v7;
  v10 = v9;

  v11 = v8 == *MEMORY[0x1E0C9D820] && v10 == *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (v11
    && (-[TLKImageView imageView](self, "imageView"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v12, "image"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v14 = +[TLKImage imageIsSymbol:](TLKImage, "imageIsSymbol:", v13),
        v13,
        v12,
        v14))
  {
    -[TLKImageView imageView](self, "imageView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "sizeThatFits:", width, height);
    v17 = v16;
    v19 = v18;

    v20 = v17;
    v21 = v19;
  }
  else
  {
    v20 = v8;
    v21 = v10;
  }
  result.height = v21;
  result.width = v20;
  return result;
}

- (void)updateShadow
{
  void *v3;
  UIImageView *v4;
  void *v5;
  char v6;
  int v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  +[TLKAppearance bestAppearanceForView:](TLKAppearance, "bestAppearanceForView:", self);
  v18 = (id)objc_claimAutoreleasedReturnValue();
  -[TLKImageView shadowContainer](self, "shadowContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = self->_imageView;
  if (-[TLKImageView shadowDisabled](self, "shadowDisabled")
    || (-[TLKImageView tlkImage](self, "tlkImage"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "isTemplate"),
        v5,
        (v6 & 1) != 0))
  {
    +[TLKView enableShadow:forView:](TLKView, "enableShadow:forView:", 0, v3);
    v7 = 0;
    v8 = 0;
  }
  else
  {
    if (objc_msgSend(v18, "style") == 1)
      +[TLKView enableLightKeylineStroke:forView:](TLKView, "enableLightKeylineStroke:forView:", 1, v3);
    else
      +[TLKView enableShadow:forView:](TLKView, "enableShadow:forView:", 1, v3);
    -[TLKImageView tlkImage](self, "tlkImage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "supportsFastPathShadow") & 1) != 0)
    {
      v8 = 1;
    }
    else
    {
      -[TLKImageView imageView](self, "imageView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "backgroundColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v11 != 0;

    }
    v7 = 1;
  }
  -[TLKImageView effectiveScreenScale](self, "effectiveScreenScale");
  v13 = v12;
  objc_msgSend(v3, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v7)
  {
    objc_msgSend(v14, "setShadowPathIsBounds:", v8);
    if (v8)
    {
      -[UIImageView layer](v4, "layer");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "cornerRadius");
      objc_msgSend(v15, "setCornerRadius:");
      objc_msgSend(v16, "cornerCurve");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setCornerCurve:", v17);

      objc_msgSend(v15, "setMaskedCorners:", objc_msgSend(v16, "maskedCorners"));
      objc_msgSend(v15, "setContentsScale:", v13);

    }
  }
  objc_msgSend(v15, "setShouldRasterize:", v7 & (v8 ^ 1));
  objc_msgSend(v15, "setRasterizationScale:", v13);

}

- (CGRect)aspectRatioPreservedFrameForSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  BOOL v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  char v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  CGRect v33;
  CGRect v34;
  CGRect result;

  height = a3.height;
  width = a3.width;
  -[TLKImageView bounds](self, "bounds");
  v6 = CGRectGetWidth(v33);
  -[TLKImageView bounds](self, "bounds");
  v8 = CGRectGetHeight(v34);
  if (height == INFINITY)
    v9 = v8;
  else
    v9 = height;
  if (width == INFINITY)
    v10 = v6;
  else
    v10 = width;
  if (height == 0.0)
    goto LABEL_31;
  v11 = v10 < v6 && v9 < v8;
  v12 = width / height;
  if (v11)
  {
    -[TLKImageView tlkImage](self, "tlkImage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "size");
    if (v16 == *MEMORY[0x1E0C9D820] && v15 == *(double *)(MEMORY[0x1E0C9D820] + 8))
    {
      v18 = TLKSnippetModernizationEnabled();

      v13 = v6 / v12;
      if ((v18 & 1) != 0)
        goto LABEL_20;
    }
    else
    {

      v13 = v6 / v12;
    }
    v10 = v6;
    v9 = v13;
    goto LABEL_20;
  }
  v13 = v6 / v12;
LABEL_20:
  if (v10 <= v6)
    v7 = v10;
  else
    v7 = v6;
  if (v10 <= v6)
    v13 = v9;
  if (v13 <= v8)
    v10 = v7;
  else
    v10 = v12 * v8;
  if (v13 <= v8)
    v9 = v13;
  else
    v9 = v8;
LABEL_31:
  +[TLKLayoutUtilities ceilingValue:inView:](TLKLayoutUtilities, "ceilingValue:inView:", self, v10, v7);
  v20 = v19;
  +[TLKLayoutUtilities ceilingValue:inView:](TLKLayoutUtilities, "ceilingValue:inView:", self, v9);
  v22 = v21;
  v23 = v6 - v20;
  +[TLKLayoutUtilities deviceScaledRoundedValue:forView:](TLKLayoutUtilities, "deviceScaledRoundedValue:forView:", self, (v6 - v20) * 0.5);
  v25 = v24;
  v26 = v8 - v22;
  +[TLKLayoutUtilities deviceScaledRoundedValue:forView:](TLKLayoutUtilities, "deviceScaledRoundedValue:forView:", self, v26 * 0.5);
  v28 = v27;
  if (-[TLKImageView alignment](self, "alignment") == 1)
  {
    if (+[TLKLayoutUtilities isLTR](TLKLayoutUtilities, "isLTR"))
      v25 = v23;
    else
      v25 = 0.0;
  }
  else if (-[TLKImageView alignment](self, "alignment") == 4)
  {
    v28 = v26;
  }
  v29 = v25;
  v30 = v28;
  v31 = v20;
  v32 = v22;
  result.size.height = v32;
  result.size.width = v31;
  result.origin.y = v30;
  result.origin.x = v29;
  return result;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  _BOOL4 v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v24;
  double v25;
  double v26;
  _BOOL4 v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double Height;
  void *v47;
  void *v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  double v62;
  _BOOL4 v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double MinX;
  double v69;
  double v70;
  CGFloat v71;
  void *v72;
  objc_super v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;

  v73.receiver = self;
  v73.super_class = (Class)TLKImageView;
  -[TLKView layoutSubviews](&v73, sel_layoutSubviews);
  -[TLKImageView tlkImage](self, "tlkImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "size");
  v5 = v4;
  v7 = v6;

  v8 = *MEMORY[0x1E0C9D820];
  v9 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  v10 = v7 == v9 && v5 == *MEMORY[0x1E0C9D820];
  if (v10)
  {
    -[TLKImageView bounds](self, "bounds");
    v5 = v11;
    v7 = v12;
  }
  -[TLKImageView imageView](self, "imageView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "image");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "size");
  v16 = v15;
  v18 = v17;
  if (v10 && +[TLKImage imageIsSymbol:](TLKImage, "imageIsSymbol:", v14))
  {
    -[TLKImageView bounds](self, "bounds");
    -[TLKImageView naturalSizeForSize:](self, "naturalSizeForSize:", v19, v20);
    v16 = v21;
    v18 = v22;
  }
  else if (v16 == v8 && v18 == v9)
  {
    -[TLKImageView tlkImage](self, "tlkImage");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "size");
    v16 = v25;
    v18 = v26;

  }
  v27 = -[TLKImageView alignmentIsAspectFill](self, "alignmentIsAspectFill");
  if (v27)
    -[TLKImageView bounds](self, "bounds");
  else
    -[TLKImageView aspectRatioPreservedFrameForSize:](self, "aspectRatioPreservedFrameForSize:", v5, v7);
  v32 = v28;
  v33 = v29;
  v34 = v30;
  v35 = v31;
  -[TLKImageView placeholderView](self, "placeholderView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setFrame:", v32, v33, v34, v35);

  if (v27)
    -[TLKImageView bounds](self, "bounds");
  else
    -[TLKImageView aspectRatioPreservedFrameForSize:](self, "aspectRatioPreservedFrameForSize:", v16, v18);
  v41 = v37;
  v42 = v38;
  v43 = v39;
  v44 = v40;
  if (-[TLKImageView alignment](self, "alignment") == 3)
  {
    if (v16 == 0.0)
    {
      v45 = 0.0;
    }
    else
    {
      v74.origin.x = v41;
      v74.origin.y = v42;
      v74.size.width = v43;
      v74.size.height = v44;
      v45 = v18 / v16 * CGRectGetWidth(v74);
    }
    v75.origin.x = v41;
    v75.origin.y = v42;
    v75.size.width = v43;
    v75.size.height = v44;
    Height = CGRectGetHeight(v75);
    if (v45 >= Height)
      v44 = v45;
    else
      v44 = Height;
  }
  -[TLKImageView shadowContainer](self, "shadowContainer");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setFrame:", v41, v42, v43, v44);

  -[TLKImageView shadowContainer](self, "shadowContainer");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "bounds");
  v50 = v49;
  v52 = v51;
  v54 = v53;
  v56 = v55;
  -[TLKImageView imageView](self, "imageView");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "setFrame:", v50, v52, v54, v56);

  -[TLKImageView tlkImage](self, "tlkImage");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = objc_msgSend(v58, "cornerRoundingStyle");

  if (!-[TLKImageView disableCornerRounding](self, "disableCornerRounding"))
  {
    -[TLKImageView placeholderView](self, "placeholderView");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[TLKImageView applyCornerRoundingStyle:toView:](self, "applyCornerRoundingStyle:toView:", v59, v60);

    -[TLKImageView imageView](self, "imageView");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[TLKImageView applyCornerRoundingStyle:toView:](self, "applyCornerRoundingStyle:toView:", v59, v61);

  }
  -[TLKImageView updateShadow](self, "updateShadow");
  if (+[TLKUtilities isMacOS](TLKUtilities, "isMacOS"))
    v62 = 16.0;
  else
    v62 = 20.0;
  v63 = +[TLKLayoutUtilities isLTR](TLKLayoutUtilities, "isLTR");
  v64 = v41;
  v65 = v42;
  v66 = v43;
  v67 = v44;
  if (v63)
  {
    MinX = CGRectGetMaxX(*(CGRect *)&v64) - v62;
    v69 = 2.0;
  }
  else
  {
    MinX = CGRectGetMinX(*(CGRect *)&v64);
    v69 = -2.0;
  }
  v70 = MinX + v69;
  v76.origin.x = v41;
  v76.origin.y = v42;
  v76.size.width = v43;
  v76.size.height = v44;
  v71 = CGRectGetMaxY(v76) - v62 + 2.0;
  -[TLKImageView badgeImageView](self, "badgeImageView");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "setFrame:", v70, v71, v62, v62);

}

- (void)applyCornerRoundingStyle:(unint64_t)a3 toView:(id)a4
{
  void *v6;
  BOOL v7;
  double v8;
  double v9;
  double v10;
  _QWORD *v11;
  double v12;
  id v13;

  v13 = a4;
  objc_msgSend(v13, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[TLKImageView disableCornerRounding](self, "disableCornerRounding");
  v8 = 0.0;
  if (!v7)
  {
    objc_msgSend(v13, "bounds", 0.0);
    -[TLKImageView cornerRadiusForSize:roundingStyle:](self, "cornerRadiusForSize:roundingStyle:", a3, v9, v10);
  }
  objc_msgSend(v6, "setCornerRadius:", v8);
  v11 = (_QWORD *)MEMORY[0x1E0CD2A60];
  if (a3 != 3)
    v11 = (_QWORD *)MEMORY[0x1E0CD2A68];
  objc_msgSend(v6, "setCornerCurve:", *v11);
  objc_msgSend(v6, "setMaskedCorners:", objc_msgSend((id)objc_opt_class(), "defaultCornerMask"));
  objc_msgSend(v6, "cornerRadius");
  objc_msgSend(v6, "setMasksToBounds:", v12 > 0.0);

}

- (double)cornerRadiusForSize:(CGSize)a3 roundingStyle:(unint64_t)a4
{
  double height;
  double width;
  double v8;
  double v9;
  double v10;
  BOOL v11;
  double v12;
  double v13;
  _BOOL4 v14;
  double v15;
  double v16;

  height = a3.height;
  width = a3.width;
  if (a4 == 3)
  {
    v8 = 0.5;
  }
  else if (a4 == 2)
  {
    +[TLKUtilities appIconCornerRadiusRatio](TLKUtilities, "appIconCornerRadiusRatio");
  }
  else
  {
    v8 = 0.0;
    if (a4 == 1)
      +[TLKUtilities standardRoundedCornerRadiusRatio](TLKUtilities, "standardRoundedCornerRadiusRatio", 0.0);
  }
  if (width >= height)
    v9 = height;
  else
    v9 = width;
  v10 = v9 * v8;
  v11 = +[TLKUtilities isMacOS](TLKUtilities, "isMacOS");
  v12 = fmin(v10, 10.0);
  if (a4 == 1 && v11)
    v13 = v12;
  else
    v13 = v10;
  if (a4 == 1 || (v14 = +[TLKUtilities isMacOS](TLKUtilities, "isMacOS"), a4 == 2) && v14)
  {
    +[TLKLayoutUtilities deviceScaledRoundedValue:forView:](TLKLayoutUtilities, "deviceScaledRoundedValue:forView:", self, 1.5);
    v16 = fmin(v13, 15.0);
    if (v15 >= v16)
      return v15;
    else
      return v16;
  }
  return v10;
}

+ (unint64_t)defaultCornerMask
{
  return 15;
}

+ (BOOL)imageIsProbablyOpaque:(id)a3 tlkImage:(id)a4
{
  id v6;
  CGImage *v7;
  CGImageAlphaInfo AlphaInfo;
  int v9;

  v6 = a4;
  v7 = (CGImage *)objc_msgSend(objc_retainAutorelease(a3), "CGImage");
  AlphaInfo = CGImageGetAlphaInfo(v7);
  LOBYTE(v9) = 1;
  if (AlphaInfo && AlphaInfo != kCGImageAlphaNoneSkipLast)
  {
    if (AlphaInfo == kCGImageAlphaOnly)
      LOBYTE(v9) = 0;
    else
      v9 = objc_msgSend(a1, "checkTransparencyForImageAtCorners:shouldCropToCircle:", v7, objc_msgSend(v6, "cornerRoundingStyle") == 3) ^ 1;
  }

  return v9;
}

+ (BOOL)checkTransparencyForImageAtCorners:(CGImage *)a3 shouldCropToCircle:(BOOL)a4
{
  _BOOL4 v4;
  double Width;
  size_t Height;
  double v9;
  double v10;
  double v11;
  double v12;

  v4 = a4;
  Width = (double)CGImageGetWidth(a3);
  Height = CGImageGetHeight(a3);
  v9 = (double)Height * 0.05;
  v10 = (double)Height + -1.0 - v9;
  if (!v4)
  {
    if ((objc_msgSend(a1, "hasTransparencyAtPoint:forCGImage:", a3, Width * 0.05, v9) & 1) == 0
      && (objc_msgSend(a1, "hasTransparencyAtPoint:forCGImage:", a3, Width * 0.05, v10) & 1) == 0)
    {
      v12 = Width + -1.0 - Width * 0.05;
      if ((objc_msgSend(a1, "hasTransparencyAtPoint:forCGImage:", a3, v12, v9) & 1) == 0)
        return objc_msgSend(a1, "hasTransparencyAtPoint:forCGImage:", a3, v12, v10);
    }
    return 1;
  }
  v11 = (double)Height * 0.5;
  if ((objc_msgSend(a1, "hasTransparencyAtPoint:forCGImage:", a3, Width * 0.05, v11) & 1) != 0)
    return 1;
  v12 = Width * 0.5;
  if ((objc_msgSend(a1, "hasTransparencyAtPoint:forCGImage:", a3, Width * 0.5, v9) & 1) != 0
    || (objc_msgSend(a1, "hasTransparencyAtPoint:forCGImage:", a3, Width + -1.0 - Width * 0.05, v11) & 1) != 0)
  {
    return 1;
  }
  return objc_msgSend(a1, "hasTransparencyAtPoint:forCGImage:", a3, v12, v10);
}

+ (BOOL)hasTransparencyAtPoint:(CGPoint)a3 forCGImage:(CGImage *)a4
{
  float x;
  float y;
  CGImage *v6;
  CGContext *v7;
  unint64_t v8;
  char data;
  CGRect v11;
  CGRect v12;

  x = a3.x;
  v11.origin.x = floorf(x);
  y = a3.y;
  v11.origin.y = floorf(y);
  v11.size.width = 1.0;
  v11.size.height = 1.0;
  v6 = CGImageCreateWithImageInRect(a4, v11);
  data = 0;
  v7 = CGBitmapContextCreate(&data, 1uLL, 1uLL, 8uLL, 1uLL, 0, 7u);
  v12.origin.x = 0.0;
  v12.origin.y = 0.0;
  v12.size.width = 1.0;
  v12.size.height = 1.0;
  CGContextDrawImage(v7, v12, v6);
  CGContextRelease(v7);
  CGImageRelease(v6);
  LOBYTE(v8) = data;
  return (double)v8 / 255.0 < 0.25;
}

- (double)sizeScale
{
  void *v3;
  double v4;
  double v5;
  double v6;

  -[TLKImageView imageView](self, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "intrinsicContentSize");
  v5 = v4;

  if (v5 == 0.0)
    return 1.0;
  -[TLKImageView intrinsicContentSize](self, "intrinsicContentSize");
  return v6 / v5;
}

- (UIEdgeInsets)effectiveAlignmentRectInsets
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  objc_super v20;
  objc_super v21;
  UIEdgeInsets result;

  if (-[TLKImageView ignoreImageAlignmentRectInsets](self, "ignoreImageAlignmentRectInsets"))
  {
    v21.receiver = self;
    v21.super_class = (Class)TLKImageView;
    -[TLKImageView effectiveAlignmentRectInsets](&v21, sel_effectiveAlignmentRectInsets);
  }
  else
  {
    -[TLKImageView imageView](self, "imageView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "alignmentRectInsets");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;

    v20.receiver = self;
    v20.super_class = (Class)TLKImageView;
    -[TLKImageView effectiveAlignmentRectInsets](&v20, sel_effectiveAlignmentRectInsets);
    v3 = v9 + v16;
    v4 = v11 + v17;
    v5 = v13 + v18;
    v6 = v15 + v19;
  }
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (double)effectiveBaselineOffsetFromBottom
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;

  -[TLKImageView sizeScale](self, "sizeScale");
  v4 = v3;
  -[TLKImageView imageView](self, "imageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "effectiveBaselineOffsetFromBottom");
  v7 = v6;
  -[TLKImageView imageView](self, "imageView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "effectiveAlignmentRectInsets");
  v10 = v4 * (v7 - v9);

  return v10;
}

- (double)effectiveFirstBaselineOffsetFromTop
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;

  -[TLKImageView sizeScale](self, "sizeScale");
  v4 = v3;
  -[TLKImageView imageView](self, "imageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "effectiveFirstBaselineOffsetFromTop");
  v7 = v6;
  -[TLKImageView imageView](self, "imageView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "effectiveAlignmentRectInsets");
  v10 = v4 * (v7 - v9);

  return v10;
}

- (TLKImage)tlkImage
{
  return self->_tlkImage;
}

- (unint64_t)prominence
{
  return self->_prominence;
}

- (BOOL)useButtonColoring
{
  return self->_useButtonColoring;
}

- (UIColor)overrideColor
{
  return self->_overrideColor;
}

- (unint64_t)placeholderVisibility
{
  return self->_placeholderVisibility;
}

- (void)setPlaceholderVisibility:(unint64_t)a3
{
  self->_placeholderVisibility = a3;
}

- (UIFont)symbolFont
{
  return self->_symbolFont;
}

- (int64_t)symbolScale
{
  return self->_symbolScale;
}

- (int64_t)symbolWeight
{
  return self->_symbolWeight;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (TLKProminenceView)placeholderView
{
  return self->_placeholderView;
}

- (void)setPlaceholderView:(id)a3
{
  objc_storeStrong((id *)&self->_placeholderView, a3);
}

- (TLKImageViewDelegate)delegate
{
  return (TLKImageViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)disableCornerRounding
{
  return self->_disableCornerRounding;
}

- (unint64_t)alignment
{
  return self->_alignment;
}

- (BOOL)shadowDisabled
{
  return self->_shadowDisabled;
}

- (void)setShadowDisabled:(BOOL)a3
{
  self->_shadowDisabled = a3;
}

- (BOOL)ignoreImageAlignmentRectInsets
{
  return self->_ignoreImageAlignmentRectInsets;
}

- (void)setIgnoreImageAlignmentRectInsets:(BOOL)a3
{
  self->_ignoreImageAlignmentRectInsets = a3;
}

- (UIView)shadowContainer
{
  return self->_shadowContainer;
}

- (void)setShadowContainer:(id)a3
{
  objc_storeStrong((id *)&self->_shadowContainer, a3);
}

- (TLKImage)lastTlkImage
{
  return self->_lastTlkImage;
}

- (void)setLastTlkImage:(id)a3
{
  objc_storeStrong((id *)&self->_lastTlkImage, a3);
}

- (TLKImageView)badgeImageView
{
  return self->_badgeImageView;
}

- (void)setBadgeImageView:(id)a3
{
  objc_storeStrong((id *)&self->_badgeImageView, a3);
}

- (double)lastBaselineOffset
{
  return self->_lastBaselineOffset;
}

- (void)setLastBaselineOffset:(double)a3
{
  self->_lastBaselineOffset = a3;
}

- (BOOL)animateNextImageTransition
{
  return self->_animateNextImageTransition;
}

- (void)setAnimateNextImageTransition:(BOOL)a3
{
  self->_animateNextImageTransition = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badgeImageView, 0);
  objc_storeStrong((id *)&self->_lastTlkImage, 0);
  objc_storeStrong((id *)&self->_shadowContainer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_placeholderView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_symbolFont, 0);
  objc_storeStrong((id *)&self->_overrideColor, 0);
  objc_storeStrong((id *)&self->_tlkImage, 0);
}

@end
