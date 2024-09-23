@implementation PFXGalleryItem2

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFXGalleryItem2;
  -[PFXGalleryItem2 dealloc](&v3, "dealloc");
}

- (TSPData)fullres
{
  return self->_fullres;
}

- (void)setFullres:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (CGRect)fullresCropRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_fullresCropRect.origin.x;
  y = self->_fullresCropRect.origin.y;
  width = self->_fullresCropRect.size.width;
  height = self->_fullresCropRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setFullresCropRect:(CGRect)a3
{
  self->_fullresCropRect = a3;
}

- (TSPData)thumbnail
{
  return self->_thumbnail;
}

- (void)setThumbnail:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (THWPStorage)caption
{
  return self->_caption;
}

- (void)setCaption:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (NSDictionary)accessibilityDescriptions
{
  return self->_accessibilityDescriptions;
}

- (void)setAccessibilityDescriptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

@end
