@implementation _UIImageViewSimpleStorage

- (UIImageSymbolConfiguration)overridingSymbolConfiguration
{
  return 0;
}

- (UIImage)resolvedImage
{
  return -[_UIImageViewImageProperties resolvedImage](self->_imageProperties, "resolvedImage");
}

- (UIImage)image
{
  return -[_UIImageViewImageProperties image](self->_imageProperties, "image");
}

- (int64_t)defaultRenderingMode
{
  return 0;
}

- (BOOL)isHighlighted
{
  return 0;
}

- (NSMapTable)layouts
{
  return self->layouts;
}

- (UIImage)highlightedImage
{
  return 0;
}

- (UIImage)resolvedHighlightedImage
{
  return 0;
}

- (NSArray)animationImages
{
  return 0;
}

- (NSArray)highlightedAnimationImages
{
  return 0;
}

- (UIImage)imageBeingSetByLoader
{
  return 0;
}

- (BOOL)adjustsImageSizeForAccessibilityContentSizeCategory
{
  return 0;
}

- (UIView)placeholderView
{
  return 0;
}

- (void)setLayouts:(id)a3
{
  objc_storeStrong((id *)&self->layouts, a3);
}

- (unsigned)drawMode
{
  return 0;
}

- (UILayoutGuide)imageContentGuide
{
  return 0;
}

- (BOOL)masksTemplateImages
{
  return 0;
}

- (_UIImageLoader)imageLoader
{
  return 0;
}

- (UIImageSymbolConfiguration)preferredSymbolConfiguration
{
  return 0;
}

- (void)setImage:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  -[_UIImageViewSimpleStorage image](self, "image");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 != v6)
  {
    -[_UIImageViewSimpleStorage imageProperties](self, "imageProperties");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setImage:", v6);

  }
}

- (void)setResolvedImage:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  -[_UIImageViewSimpleStorage resolvedImage](self, "resolvedImage");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 != v6)
  {
    -[_UIImageViewSimpleStorage imageProperties](self, "imageProperties");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setResolvedImage:", v6);

  }
}

- (id)imageProperties
{
  _UIImageViewImageProperties *imageProperties;
  _UIImageViewImageProperties *v4;
  _UIImageViewImageProperties *v5;

  imageProperties = self->_imageProperties;
  if (!imageProperties)
  {
    v4 = (_UIImageViewImageProperties *)objc_opt_new();
    v5 = self->_imageProperties;
    self->_imageProperties = v4;

    imageProperties = self->_imageProperties;
  }
  return imageProperties;
}

- (_UIImageCIImageRenderer)CIRenderer
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->layouts, 0);
  objc_storeStrong((id *)&self->_imageProperties, 0);
}

- (int64_t)animationRepeatCount
{
  return 0;
}

- (double)animationDuration
{
  return 0.0;
}

- (_UIImageSymbolVariant)preferredSymbolVariant
{
  return 0;
}

- (_UIImageViewLoadingDelegate)loadingDelegate
{
  return 0;
}

- (BOOL)isStartingLoad
{
  return 0;
}

- (BOOL)isEnqueueingLoad
{
  return 0;
}

- (BOOL)isStoppingLoad
{
  return 0;
}

@end
