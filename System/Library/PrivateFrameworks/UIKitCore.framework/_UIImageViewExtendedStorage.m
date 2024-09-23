@implementation _UIImageViewExtendedStorage

- (int64_t)defaultRenderingMode
{
  return -[_UIImageViewUncommonProperties defaultRenderingMode](self->_uncommonProperties, "defaultRenderingMode");
}

- (BOOL)isHighlighted
{
  return self->highlighted;
}

- (id)highlightedImage
{
  return -[_UIImageViewImageProperties image](self->_highlightedImageProperties, "image");
}

- (id)resolvedHighlightedImage
{
  return -[_UIImageViewImageProperties resolvedImage](self->_highlightedImageProperties, "resolvedImage");
}

- (id)animationImages
{
  return -[_UIImageViewAnimationProperties animationImages](self->_animationProperties, "animationImages");
}

- (id)highlightedAnimationImages
{
  return -[_UIImageViewAnimationProperties highlightedAnimationImages](self->_animationProperties, "highlightedAnimationImages");
}

- (id)imageBeingSetByLoader
{
  return -[_UIImageViewImageLoadingProperties imageBeingSetByLoader](self->_imageLoadingProperties, "imageBeingSetByLoader");
}

- (BOOL)adjustsImageSizeForAccessibilityContentSizeCategory
{
  return self->adjustsImageSizeForAccessibilityContentSizeCategory;
}

- (id)placeholderView
{
  return -[_UIImageViewImageLoadingProperties placeholderView](self->_imageLoadingProperties, "placeholderView");
}

- (unsigned)drawMode
{
  return -[_UIImageViewUncommonProperties drawMode](self->_uncommonProperties, "drawMode");
}

- (id)imageContentGuide
{
  return self->imageContentGuide;
}

- (BOOL)masksTemplateImages
{
  return self->masksTemplateImages;
}

- (id)preferredSymbolConfiguration
{
  return self->preferredSymbolConfiguration;
}

- (id)imageLoader
{
  return -[_UIImageViewImageLoadingProperties imageLoader](self->_imageLoadingProperties, "imageLoader");
}

- (id)CIRenderer
{
  return -[_UIImageViewUncommonProperties CIRenderer](self->_uncommonProperties, "CIRenderer");
}

- (void)setDrawMode:(unsigned int)a3
{
  uint64_t v3;
  id v5;

  v3 = *(_QWORD *)&a3;
  if (-[_UIImageViewExtendedStorage drawMode](self, "drawMode") != a3)
  {
    -[_UIImageViewExtendedStorage uncommonProperties](self, "uncommonProperties");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDrawMode:", v3);

  }
}

- (void)setAdjustsImageSizeForAccessibilityContentSizeCategory:(BOOL)a3
{
  self->adjustsImageSizeForAccessibilityContentSizeCategory = a3;
}

- (void)setPreferredSymbolConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->preferredSymbolConfiguration, a3);
}

+ (id)storageFromSimpleStorage:(id)a3
{
  id *v3;
  id *v4;

  v3 = (id *)a3;
  v4 = (id *)objc_opt_new();
  objc_storeStrong(v4 + 1, v3[1]);

  return v4;
}

- (void)setDefaultRenderingMode:(int64_t)a3
{
  id v5;

  if (-[_UIImageViewExtendedStorage defaultRenderingMode](self, "defaultRenderingMode") != a3)
  {
    -[_UIImageViewExtendedStorage uncommonProperties](self, "uncommonProperties");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDefaultRenderingMode:", a3);

  }
}

- (id)uncommonProperties
{
  _UIImageViewUncommonProperties *uncommonProperties;
  _UIImageViewUncommonProperties *v4;
  _UIImageViewUncommonProperties *v5;

  uncommonProperties = self->_uncommonProperties;
  if (!uncommonProperties)
  {
    v4 = (_UIImageViewUncommonProperties *)objc_opt_new();
    v5 = self->_uncommonProperties;
    self->_uncommonProperties = v4;

    uncommonProperties = self->_uncommonProperties;
  }
  return uncommonProperties;
}

- (id)overridingSymbolConfiguration
{
  return -[_UIImageViewUncommonProperties overridingSymbolConfiguration](self->_uncommonProperties, "overridingSymbolConfiguration");
}

- (void)setOverridingSymbolConfiguration:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  -[_UIImageViewExtendedStorage overridingSymbolConfiguration](self, "overridingSymbolConfiguration");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 != v6)
  {
    -[_UIImageViewExtendedStorage uncommonProperties](self, "uncommonProperties");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setOverridingSymbolConfiguration:", v6);

  }
}

- (void)setAnimationImages:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  -[_UIImageViewExtendedStorage animationImages](self, "animationImages");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 != v6)
  {
    -[_UIImageViewExtendedStorage animationProperties](self, "animationProperties");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAnimationImages:", v6);

  }
}

- (void)setAnimationDuration:(double)a3
{
  double v5;
  id v6;

  -[_UIImageViewExtendedStorage animationDuration](self, "animationDuration");
  if (v5 != a3)
  {
    -[_UIImageViewExtendedStorage animationProperties](self, "animationProperties");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAnimationDuration:", a3);

  }
}

- (double)animationDuration
{
  double result;

  -[_UIImageViewAnimationProperties animationDuration](self->_animationProperties, "animationDuration");
  return result;
}

- (id)animationProperties
{
  _UIImageViewAnimationProperties *animationProperties;
  _UIImageViewAnimationProperties *v4;
  _UIImageViewAnimationProperties *v5;

  animationProperties = self->_animationProperties;
  if (!animationProperties)
  {
    v4 = (_UIImageViewAnimationProperties *)objc_opt_new();
    v5 = self->_animationProperties;
    self->_animationProperties = v4;

    animationProperties = self->_animationProperties;
  }
  return animationProperties;
}

- (int64_t)animationRepeatCount
{
  return -[_UIImageViewAnimationProperties animationRepeatCount](self->_animationProperties, "animationRepeatCount");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->imageContentGuide, 0);
  objc_storeStrong((id *)&self->preferredSymbolConfiguration, 0);
  objc_storeStrong((id *)&self->_uncommonProperties, 0);
  objc_storeStrong((id *)&self->_imageLoadingProperties, 0);
  objc_storeStrong((id *)&self->_animationProperties, 0);
  objc_storeStrong((id *)&self->_highlightedImageProperties, 0);
}

- (id)highlightedImageProperties
{
  _UIImageViewImageProperties *highlightedImageProperties;
  _UIImageViewImageProperties *v4;
  _UIImageViewImageProperties *v5;

  highlightedImageProperties = self->_highlightedImageProperties;
  if (!highlightedImageProperties)
  {
    v4 = (_UIImageViewImageProperties *)objc_opt_new();
    v5 = self->_highlightedImageProperties;
    self->_highlightedImageProperties = v4;

    highlightedImageProperties = self->_highlightedImageProperties;
  }
  return highlightedImageProperties;
}

- (id)imageLoadingProperties
{
  _UIImageViewImageLoadingProperties *imageLoadingProperties;
  _UIImageViewImageLoadingProperties *v4;
  _UIImageViewImageLoadingProperties *v5;

  imageLoadingProperties = self->_imageLoadingProperties;
  if (!imageLoadingProperties)
  {
    v4 = (_UIImageViewImageLoadingProperties *)objc_opt_new();
    v5 = self->_imageLoadingProperties;
    self->_imageLoadingProperties = v4;

    imageLoadingProperties = self->_imageLoadingProperties;
  }
  return imageLoadingProperties;
}

- (void)setHighlightedImage:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  -[_UIImageViewExtendedStorage highlightedImage](self, "highlightedImage");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 != v6)
  {
    -[_UIImageViewExtendedStorage highlightedImageProperties](self, "highlightedImageProperties");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setImage:", v6);

  }
}

- (void)setResolvedHighlightedImage:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  -[_UIImageViewExtendedStorage resolvedHighlightedImage](self, "resolvedHighlightedImage");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 != v6)
  {
    -[_UIImageViewExtendedStorage highlightedImageProperties](self, "highlightedImageProperties");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setResolvedImage:", v6);

  }
}

- (void)setHighlightedAnimationImages:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  -[_UIImageViewExtendedStorage highlightedAnimationImages](self, "highlightedAnimationImages");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 != v6)
  {
    -[_UIImageViewExtendedStorage animationProperties](self, "animationProperties");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHighlightedAnimationImages:", v6);

  }
}

- (void)setAnimationRepeatCount:(int64_t)a3
{
  id v5;

  if (-[_UIImageViewExtendedStorage animationRepeatCount](self, "animationRepeatCount") != a3)
  {
    -[_UIImageViewExtendedStorage animationProperties](self, "animationProperties");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAnimationRepeatCount:", a3);

  }
}

- (id)preferredSymbolVariant
{
  return -[_UIImageViewUncommonProperties preferredSymbolVariant](self->_uncommonProperties, "preferredSymbolVariant");
}

- (void)setPreferredSymbolVariant:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  -[_UIImageViewExtendedStorage preferredSymbolVariant](self, "preferredSymbolVariant");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 != v6)
  {
    -[_UIImageViewExtendedStorage uncommonProperties](self, "uncommonProperties");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPreferredSymbolVariant:", v6);

  }
}

- (void)setCIRenderer:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  -[_UIImageViewExtendedStorage CIRenderer](self, "CIRenderer");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 != v6)
  {
    -[_UIImageViewExtendedStorage uncommonProperties](self, "uncommonProperties");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCIRenderer:", v6);

  }
}

- (void)setImageLoader:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  -[_UIImageViewExtendedStorage imageLoader](self, "imageLoader");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 != v6)
  {
    -[_UIImageViewExtendedStorage imageLoadingProperties](self, "imageLoadingProperties");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setImageLoader:", v6);

  }
}

- (id)loadingDelegate
{
  return -[_UIImageViewImageLoadingProperties loadingDelegate](self->_imageLoadingProperties, "loadingDelegate");
}

- (void)setLoadingDelegate:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  -[_UIImageViewExtendedStorage loadingDelegate](self, "loadingDelegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 != v6)
  {
    -[_UIImageViewExtendedStorage imageLoadingProperties](self, "imageLoadingProperties");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLoadingDelegate:", v6);

  }
}

- (void)setImageBeingSetByLoader:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  -[_UIImageViewExtendedStorage imageBeingSetByLoader](self, "imageBeingSetByLoader");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 != v6)
  {
    -[_UIImageViewExtendedStorage imageLoadingProperties](self, "imageLoadingProperties");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setImageBeingSetByLoader:", v6);

  }
}

- (void)setPlaceholderView:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  -[_UIImageViewExtendedStorage placeholderView](self, "placeholderView");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 != v6)
  {
    -[_UIImageViewExtendedStorage imageLoadingProperties](self, "imageLoadingProperties");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPlaceholderView:", v6);

  }
}

- (BOOL)isStartingLoad
{
  return -[_UIImageViewImageLoadingProperties isStartingLoad](self->_imageLoadingProperties, "isStartingLoad");
}

- (void)setStartingLoad:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  if (-[_UIImageViewExtendedStorage isStartingLoad](self, "isStartingLoad") != a3)
  {
    -[_UIImageViewExtendedStorage imageLoadingProperties](self, "imageLoadingProperties");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setStartingLoad:", v3);

  }
}

- (BOOL)isEnqueueingLoad
{
  return -[_UIImageViewImageLoadingProperties isEnqueueingLoad](self->_imageLoadingProperties, "isEnqueueingLoad");
}

- (void)setEnqueueingLoad:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  if (-[_UIImageViewExtendedStorage isEnqueueingLoad](self, "isEnqueueingLoad") != a3)
  {
    -[_UIImageViewExtendedStorage imageLoadingProperties](self, "imageLoadingProperties");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setEnqueueingLoad:", v3);

  }
}

- (BOOL)isStoppingLoad
{
  return -[_UIImageViewImageLoadingProperties isStoppingLoad](self->_imageLoadingProperties, "isStoppingLoad");
}

- (void)setStoppingLoad:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  if (-[_UIImageViewExtendedStorage isStoppingLoad](self, "isStoppingLoad") != a3)
  {
    -[_UIImageViewExtendedStorage imageLoadingProperties](self, "imageLoadingProperties");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setStoppingLoad:", v3);

  }
}

- (void)setImageContentGuide:(id)a3
{
  objc_storeStrong((id *)&self->imageContentGuide, a3);
}

- (void)setHighlighted:(BOOL)a3
{
  self->highlighted = a3;
}

- (void)setMasksTemplateImages:(BOOL)a3
{
  self->masksTemplateImages = a3;
}

@end
