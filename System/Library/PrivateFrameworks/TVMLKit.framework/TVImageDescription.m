@implementation TVImageDescription

- (TVImageDescription)initWithProxy:(id)a3 andPlaceHolderImage:(id)a4
{
  id v7;
  id v8;
  TVImageDescription *v9;
  TVImageDescription *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TVImageDescription;
  v9 = -[TVImageDescription init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong(&v9->_imageProxy, a3);
    objc_storeStrong((id *)&v10->_placeholderImage, a4);
  }

  return v10;
}

- (id)imageProxy
{
  return self->_imageProxy;
}

- (void)setImageProxy:(id)a3
{
  objc_storeStrong(&self->_imageProxy, a3);
}

- (BOOL)configureForMetrics
{
  return self->_configureForMetrics;
}

- (void)setConfigureForMetrics:(BOOL)a3
{
  self->_configureForMetrics = a3;
}

- (UIImage)placeholderImage
{
  return self->_placeholderImage;
}

- (void)setPlaceholderImage:(id)a3
{
  objc_storeStrong((id *)&self->_placeholderImage, a3);
}

- (int64_t)semanticContentAttribute
{
  return self->_semanticContentAttribute;
}

- (void)setSemanticContentAttribute:(int64_t)a3
{
  self->_semanticContentAttribute = a3;
}

- (BOOL)needsRoomBannerImageDecorator
{
  return self->_needsRoomBannerImageDecorator;
}

- (void)setNeedsRoomBannerImageDecorator:(BOOL)a3
{
  self->_needsRoomBannerImageDecorator = a3;
}

- (BOOL)isInBackgroundOrBanner
{
  return self->_isInBackgroundOrBanner;
}

- (void)setIsInBackgroundOrBanner:(BOOL)a3
{
  self->_isInBackgroundOrBanner = a3;
}

- (BOOL)hasGradient
{
  return self->_hasGradient;
}

- (void)setHasGradient:(BOOL)a3
{
  self->_hasGradient = a3;
}

- (NSString)accessibilityText
{
  return self->_accessibilityText;
}

- (void)setAccessibilityText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)siriData
{
  return self->_siriData;
}

- (void)setSiriData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriData, 0);
  objc_storeStrong((id *)&self->_accessibilityText, 0);
  objc_storeStrong((id *)&self->_placeholderImage, 0);
  objc_storeStrong(&self->_imageProxy, 0);
}

@end
