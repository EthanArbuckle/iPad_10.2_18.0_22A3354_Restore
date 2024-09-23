@implementation PXDisplayAssetImageContentView

- (int64_t)playbackStyle
{
  return 1;
}

- (id)contentView
{
  UIImageView *imageView;
  UIImageView *v4;
  UIImageView *v5;

  imageView = self->_imageView;
  if (!imageView)
  {
    v4 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    v5 = self->_imageView;
    self->_imageView = v4;

    -[PXDisplayAssetImageContentView _updateImageViewContentMode](self, "_updateImageViewContentMode");
    -[UIImageView setClipsToBounds:](self->_imageView, "setClipsToBounds:", 1);
    -[PXDisplayAssetImageContentView _updateImageViewPreferredImageDynamicRange](self, "_updateImageViewPreferredImageDynamicRange");
    imageView = self->_imageView;
  }
  return imageView;
}

- (void)contentModeDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXDisplayAssetImageContentView;
  -[PXDisplayAssetContentView contentModeDidChange](&v3, sel_contentModeDidChange);
  -[PXDisplayAssetImageContentView _updateImageViewContentMode](self, "_updateImageViewContentMode");
}

- (void)_updateImageViewContentMode
{
  -[UIImageView setContentMode:](self->_imageView, "setContentMode:", -[PXDisplayAssetImageContentView contentMode](self, "contentMode"));
}

- (void)imageDidChange
{
  uint64_t v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  UIImageView *imageView;
  void *v10;
  _QWORD v11[5];
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PXDisplayAssetImageContentView;
  -[PXDisplayAssetContentView imageDidChange](&v12, sel_imageDidChange);
  -[UIImageView image](self->_imageView, "image");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[PXDisplayAssetContentView imageRequester](self, "imageRequester");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "hasFullQuality") & 1) != 0)
    {
      -[PXDisplayAssetContentView placeholderTransitionDuration](self, "placeholderTransitionDuration");
      v7 = v6;

      if (v7 > 0.0)
      {
        v8 = (void *)MEMORY[0x1E0DC3F10];
        imageView = self->_imageView;
        -[PXDisplayAssetContentView placeholderTransitionDuration](self, "placeholderTransitionDuration");
        v11[0] = MEMORY[0x1E0C809B0];
        v11[1] = 3221225472;
        v11[2] = __48__PXDisplayAssetImageContentView_imageDidChange__block_invoke;
        v11[3] = &unk_1E5149198;
        v11[4] = self;
        objc_msgSend(v8, "transitionWithView:duration:options:animations:completion:", imageView, 5242880, v11, 0);
        return;
      }
    }
    else
    {

    }
  }
  -[PXDisplayAssetContentView image](self, "image");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setImage:](self->_imageView, "setImage:", v10);

}

- (void)effectivePreferredImageDynamicRangeDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXDisplayAssetImageContentView;
  -[PXDisplayAssetContentView effectivePreferredImageDynamicRangeDidChange](&v3, sel_effectivePreferredImageDynamicRangeDidChange);
  -[PXDisplayAssetImageContentView _updateImageViewPreferredImageDynamicRange](self, "_updateImageViewPreferredImageDynamicRange");
}

- (void)_updateImageViewPreferredImageDynamicRange
{
  -[PXDisplayAssetContentView effectivePreferredImageDynamicRange](self, "effectivePreferredImageDynamicRange");
  -[UIImageView setPreferredImageDynamicRange:](self->_imageView, "setPreferredImageDynamicRange:", PXPlatformImageDynamicRangeFromPXImageDynamicRange());
}

- (void)imageProgressDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXDisplayAssetImageContentView;
  -[PXDisplayAssetContentView imageProgressDidChange](&v3, sel_imageProgressDidChange);
  -[PXDisplayAssetContentView invalidateLoadingProgress](self, "invalidateLoadingProgress");
}

- (void)placeholderImageFiltersDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXDisplayAssetImageContentView;
  -[PXDisplayAssetContentView placeholderImageFiltersDidChange](&v3, sel_placeholderImageFiltersDidChange);
  -[PXDisplayAssetImageContentView _updateImageViewFilters](self, "_updateImageViewFilters");
}

- (void)contentsRectDidChange
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PXDisplayAssetImageContentView;
  -[PXDisplayAssetContentView contentsRectDidChange](&v12, sel_contentsRectDidChange);
  -[PXDisplayAssetContentView contentsRect](self, "contentsRect");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIImageView layer](self->_imageView, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setContentsRect:", v4, v6, v8, v10);

}

- (BOOL)isDisplayingFullQualityContent
{
  void *v2;
  char v3;

  -[PXDisplayAssetContentView imageRequester](self, "imageRequester");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasFullQuality");

  return v3;
}

- (void)isDisplayingFullQualityContentDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXDisplayAssetImageContentView;
  -[PXDisplayAssetContentView isDisplayingFullQualityContentDidChange](&v3, sel_isDisplayingFullQualityContentDidChange);
  -[PXDisplayAssetImageContentView _updateImageViewFilters](self, "_updateImageViewFilters");
}

- (void)_updateImageViewFilters
{
  void *v2;
  BOOL v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = -[PXDisplayAssetImageContentView isDisplayingFullQualityContent](self, "isDisplayingFullQualityContent");
  if (v4
    || (-[PXDisplayAssetContentView placeholderImageFilters](self, "placeholderImageFilters"),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        !objc_msgSend(v2, "count")))
  {
    +[PXForYouSettings sharedInstance](PXForYouSettings, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "alwaysShowSuggestionRenderingOverlay");

    if (!v4)
    if ((v6 & 1) == 0)
    {
      -[UIImageView layer](self->_imageView, "layer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setFilters:", 0);

      -[UIImageView layer](self->_imageView, "layer");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setShouldRasterize:", 0);
      goto LABEL_9;
    }
  }
  else
  {

  }
  -[PXDisplayAssetContentView placeholderImageFilters](self, "placeholderImageFilters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView layer](self->_imageView, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFilters:", v7);

  -[UIImageView layer](self->_imageView, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setShouldRasterize:", 1);

  -[UIImageView layer](self->_imageView, "layer");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setRasterizationScale:", 0.5);
LABEL_9:

}

- (void)imageRequesterDidChange:(unint64_t)a3
{
  char v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)PXDisplayAssetImageContentView;
  -[PXDisplayAssetContentView imageRequesterDidChange:](&v5, sel_imageRequesterDidChange_);
  if ((v3 & 8) != 0)
    -[PXDisplayAssetImageContentView isDisplayingFullQualityContentDidChange](self, "isDisplayingFullQualityContentDidChange");
}

- (int64_t)currentPreferredImageDynamicRangeValue
{
  return -[UIImageView preferredImageDynamicRange](self->_imageView, "preferredImageDynamicRange");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
}

uint64_t __48__PXDisplayAssetImageContentView_imageDidChange__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "image");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 688), "setImage:", v2);

  return objc_msgSend(*(id *)(a1 + 32), "_updateImageViewFilters");
}

@end
