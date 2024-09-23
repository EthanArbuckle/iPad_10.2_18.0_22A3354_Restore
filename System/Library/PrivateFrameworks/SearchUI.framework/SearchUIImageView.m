@implementation SearchUIImageView

+ (SearchUIImageView)imageViewWithImage:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "updateWithImage:", v3);

  return (SearchUIImageView *)v4;
}

- (SearchUIImageView)init
{
  SearchUIImageView *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SearchUIImageView;
  v2 = -[TLKImageView init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_appIconDidChange_, CFSTR("SearchUIAppIconImageDidChangeNotification"), 0);

    -[TLKImageView setDelegate:](v2, "setDelegate:", v2);
  }
  return v2;
}

- (void)appIconDidChange:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  id v8;

  objc_msgSend(a3, "object");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[SearchUIImageView currentImage](self, "currentImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_4;
  -[SearchUIImageView currentImage](self, "currentImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shouldInvalidateAppIconForChangedBundleIdentifier:", v8);

  if (v6)
  {
    -[TLKImageView imageView](self, "imageView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setImage:", 0);

    -[SearchUIImageView currentImage](self, "currentImage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUIImageView updateWithImage:](self, "updateWithImage:", v4);
LABEL_4:

  }
}

- (void)updateWithImage:(id)a3
{
  -[SearchUIImageView updateWithImage:animateTransition:](self, "updateWithImage:animateTransition:", a3, 0);
}

- (void)updateWithImage:(id)a3 animateTransition:(BOOL)a4
{
  -[SearchUIImageView updateWithImage:fallbackImage:needsOverlayButton:animateTransition:](self, "updateWithImage:fallbackImage:needsOverlayButton:animateTransition:", a3, 0, 0, a4);
}

- (void)updateWithImage:(id)a3 fallbackImage:(id)a4 needsOverlayButton:(BOOL)a5
{
  -[SearchUIImageView updateWithImage:fallbackImage:needsOverlayButton:animateTransition:](self, "updateWithImage:fallbackImage:needsOverlayButton:animateTransition:", a3, a4, a5, 0);
}

- (void)updateWithImage:(id)a3 fallbackImage:(id)a4 needsOverlayButton:(BOOL)a5 animateTransition:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  SearchUIButton *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;

  v6 = a6;
  v7 = a5;
  v26 = a3;
  v10 = a4;
  -[TLKImageView imageView](self, "imageView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "image");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[SearchUIImageView currentImage](self, "currentImage");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13
    && (v14 = (void *)v13,
        -[SearchUIImageView currentImage](self, "currentImage"),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        v16 = objc_msgSend(v15, "isEqual:", v26),
        v15,
        v14,
        v16)
    && v12)
  {
    -[TLKImageView delegate](self, "delegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "didUpdateWithImage:", v12);
  }
  else
  {
    -[SearchUIImageView setCurrentImage:](self, "setCurrentImage:", v26);
    -[SearchUIImageView setFallbackImage:](self, "setFallbackImage:", v10);
    if (v7)
    {
      -[SearchUIImageView overlayPlayButton](self, "overlayPlayButton");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v18)
      {
        v19 = -[SearchUIButton initWithType:]([SearchUIButton alloc], "initWithType:", 0);
        -[SearchUIImageView setOverlayPlayButton:](self, "setOverlayPlayButton:", v19);

        -[SearchUIImageView overlayPlayButton](self, "overlayPlayButton");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setUserInteractionEnabled:", 0);

        -[SearchUIImageView overlayPlayButton](self, "overlayPlayButton");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[SearchUIImageView addSubview:](self, "addSubview:", v21);

      }
    }
    if (updateWithImage_fallbackImage_needsOverlayButton_animateTransition__onceToken != -1)
      dispatch_once(&updateWithImage_fallbackImage_needsOverlayButton_animateTransition__onceToken, &__block_literal_global_42);
    -[SearchUIImageView overlayPlayButton](self, "overlayPlayButton");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setHidden:", !v7);

    v23 = updateWithImage_fallbackImage_needsOverlayButton_animateTransition__dummyImage;
    -[SearchUIImageView overlayPlayButton](self, "overlayPlayButton");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setOverlayImage:", v23);

    +[SearchUITLKImageConverter imageForSFImage:](SearchUITLKImageConverter, "imageForSFImage:", v26);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[TLKImageView animateTransitionToImage:](self, "animateTransitionToImage:", v17);
    }
    else
    {
      +[SearchUITLKImageConverter imageForSFImage:](SearchUITLKImageConverter, "imageForSFImage:", v26);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[TLKImageView setTlkImage:](self, "setTlkImage:", v25);

    }
  }

}

void __88__SearchUIImageView_updateWithImage_fallbackImage_needsOverlayButton_animateTransition___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)updateWithImage_fallbackImage_needsOverlayButton_animateTransition__dummyImage;
  updateWithImage_fallbackImage_needsOverlayButton_animateTransition__dummyImage = v0;

}

- (void)didUpdateWithImage:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[SearchUIImageView overlayPlayButton](self, "overlayPlayButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isHidden");

  if ((v5 & 1) == 0)
  {
    -[SearchUIImageView overlayPlayButton](self, "overlayPlayButton");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setOverlayImage:", v7);

  }
}

- (void)didFailToLoadImage
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  id v12;

  -[SearchUIImageView fallbackImage](self, "fallbackImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SearchUIImageView overlayPlayButton](self, "overlayPlayButton");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setHidden:", 1);

    -[SearchUIImageView currentImage](self, "currentImage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "size");
    v7 = v6;
    v9 = v8;
    -[SearchUIImageView fallbackImage](self, "fallbackImage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setSize:", v7, v9);

    -[SearchUIImageView fallbackImage](self, "fallbackImage");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    +[SearchUITLKImageConverter imageForSFImage:](SearchUITLKImageConverter, "imageForSFImage:", v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[TLKImageView setTlkImage:](self, "setTlkImage:", v11);

  }
}

- (void)layoutSubviews
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
  void *v20;
  void *v21;
  char isKindOfClass;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  objc_super v54;

  v54.receiver = self;
  v54.super_class = (Class)SearchUIImageView;
  -[TLKImageView layoutSubviews](&v54, sel_layoutSubviews);
  -[SearchUIImageView frame](self, "frame");
  v4 = v3;
  v6 = v5;
  -[SearchUIImageView overlayPlayButton](self, "overlayPlayButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "intrinsicContentSize");
  v9 = v8;
  v11 = v10;

  objc_msgSend(MEMORY[0x1E0DBD9B0], "deviceScaledRoundedRect:forView:", self, (v4 - v9) * 0.5, (v6 - v11) * 0.5, v9, v11);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  -[SearchUIImageView overlayPlayButton](self, "overlayPlayButton");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setFrame:", v13, v15, v17, v19);

  -[SearchUIImageView currentImage](self, "currentImage");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[SearchUIImageView currentImage](self, "currentImage");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "needsTinting");
    if (v24)
    {
      -[SearchUIImageView tintView](self, "tintView");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v25)
      {
        v26 = (void *)objc_opt_new();
        -[SearchUIImageView setTintView:](self, "setTintView:", v26);

        objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.4);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[SearchUIImageView tintView](self, "tintView");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setBackgroundColor:", v27);

        -[SearchUIImageView tintView](self, "tintView");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[TLKImageView imageView](self, "imageView");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[SearchUIImageView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", v29, v30);

      }
      -[TLKImageView imageView](self, "imageView");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "frame");
      v33 = v32;
      v35 = v34;
      v37 = v36;
      v39 = v38;
      -[SearchUIImageView tintView](self, "tintView");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setFrame:", v33, v35, v37, v39);

      -[TLKImageView imageView](self, "imageView");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "layer");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "cornerRadius");
      v44 = v43;
      -[SearchUIImageView tintView](self, "tintView");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "layer");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "setCornerRadius:", v44);

      -[TLKImageView imageView](self, "imageView");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "layer");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "cornerCurve");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[SearchUIImageView tintView](self, "tintView");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "layer");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "setCornerCurve:", v49);

    }
    v52 = v24 ^ 1u;

  }
  else
  {
    v52 = 1;
  }
  -[SearchUIImageView tintView](self, "tintView");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "setHidden:", v52);

}

+ (id)thumbnailForRowModel:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  SearchUIMediaArtworkImage *v19;
  id v20;
  SearchUIQuickLookThumbnailImage *v21;
  SearchUIQuickLookThumbnailImage *v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  unsigned int v31;
  void *v32;

  v3 = a3;
  objc_msgSend(v3, "identifyingResult");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_msgSend(v5, "thumbnail"), (v6 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v7 = v6;
    v8 = v7;
  }
  else
  {
    objc_msgSend(v4, "thumbnail");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v8 = 0;
  }
  v9 = objc_msgSend(v3, "useCompactVersionOfUI");
  objc_msgSend(v4, "sectionBundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUIUtilities bundleIdentifierForApp:](SearchUIUtilities, "bundleIdentifierForApp:", 6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isEqualToString:", v11);

  v13 = objc_msgSend(v4, "type");
  if (!v7 && !objc_msgSend(v4, "isLocalApplicationResult")
    || ((v13 != 8) & ~v12) == 0 && ((v9 ^ 1) & 1) == 0)
  {
    objc_msgSend(v4, "applicationBundleIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[SearchUIUtilities bundleIdentifierForApp:](SearchUIUtilities, "bundleIdentifierForApp:", 11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "isEqualToString:", v15))
    {

    }
    else
    {
      v31 = v9;
      objc_msgSend(v4, "applicationBundleIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[SearchUIUtilities bundleIdentifierForApp:](SearchUIUtilities, "bundleIdentifierForApp:", 19);
      v32 = v8;
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqualToString:", v17);

      v8 = v32;
      if (!v18)
      {
        if (!v12)
          goto LABEL_14;
        objc_msgSend(v4, "punchout");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "urls");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "firstObject");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v26;
        if (v26)
        {
          v20 = v26;
        }
        else
        {
          objc_msgSend(v5, "punchoutOptions");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "firstObject");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "urls");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "firstObject");
          v20 = (id)objc_claimAutoreleasedReturnValue();

          v8 = v32;
        }

        v21 = -[SearchUIQuickLookThumbnailImage initWithResult:url:isCompact:]([SearchUIQuickLookThumbnailImage alloc], "initWithResult:url:isCompact:", v4, v20, v31);
        goto LABEL_13;
      }
    }
    v19 = [SearchUIMediaArtworkImage alloc];
    objc_msgSend(v4, "identifier");
    v20 = (id)objc_claimAutoreleasedReturnValue();
    v21 = -[SearchUIMediaArtworkImage initWithSpotlightIdentifier:](v19, "initWithSpotlightIdentifier:", v20);
LABEL_13:
    v22 = v21;

    v7 = v22;
  }
LABEL_14:

  return v7;
}

- (SFImage)currentImage
{
  return self->_currentImage;
}

- (void)setCurrentImage:(id)a3
{
  objc_storeStrong((id *)&self->_currentImage, a3);
}

- (SearchUIButton)overlayPlayButton
{
  return self->_overlayPlayButton;
}

- (void)setOverlayPlayButton:(id)a3
{
  objc_storeStrong((id *)&self->_overlayPlayButton, a3);
}

- (SFImage)fallbackImage
{
  return self->_fallbackImage;
}

- (void)setFallbackImage:(id)a3
{
  objc_storeStrong((id *)&self->_fallbackImage, a3);
}

- (UIView)tintView
{
  return self->_tintView;
}

- (void)setTintView:(id)a3
{
  objc_storeStrong((id *)&self->_tintView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintView, 0);
  objc_storeStrong((id *)&self->_fallbackImage, 0);
  objc_storeStrong((id *)&self->_overlayPlayButton, 0);
  objc_storeStrong((id *)&self->_currentImage, 0);
}

@end
