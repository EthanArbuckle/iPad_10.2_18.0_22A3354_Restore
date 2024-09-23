@implementation PKPaymentSetupProductImageAssets

- (id)copyWithZone:(_NSZone *)a3
{
  PKPaymentSetupProductImageAssets *v4;

  v4 = -[PKPaymentSetupProductImageAssets init](+[PKPaymentSetupProductImageAssets allocWithZone:](PKPaymentSetupProductImageAssets, "allocWithZone:", a3), "init");
  v4->_digitalCardImage = CGImageRetain(self->_digitalCardImage);
  v4->_plasticCardImage = CGImageRetain(self->_plasticCardImage);
  v4->_thumbnailImage = CGImageRetain(self->_thumbnailImage);
  v4->_logoImage = CGImageRetain(self->_logoImage);
  return v4;
}

- (void)dealloc
{
  CGImage *digitalCardImage;
  CGImage *plasticCardImage;
  CGImage *thumbnailImage;
  CGImage *logoImage;
  objc_super v7;

  digitalCardImage = self->_digitalCardImage;
  if (digitalCardImage)
    CGImageRelease(digitalCardImage);
  plasticCardImage = self->_plasticCardImage;
  if (plasticCardImage)
    CGImageRelease(plasticCardImage);
  thumbnailImage = self->_thumbnailImage;
  if (thumbnailImage)
    CGImageRelease(thumbnailImage);
  logoImage = self->_logoImage;
  if (logoImage)
    CGImageRelease(logoImage);
  v7.receiver = self;
  v7.super_class = (Class)PKPaymentSetupProductImageAssets;
  -[PKPaymentSetupProductImageAssets dealloc](&v7, sel_dealloc);
}

- (void)setDigitalCardImage:(CGImage *)a3
{
  CGImage *digitalCardImage;

  digitalCardImage = self->_digitalCardImage;
  if (digitalCardImage)
  {
    CGImageRelease(digitalCardImage);
    self->_digitalCardImage = 0;
  }
  if (a3)
    self->_digitalCardImage = CGImageRetain(a3);
}

- (void)setPlasticCardImage:(CGImage *)a3
{
  CGImage *plasticCardImage;

  plasticCardImage = self->_plasticCardImage;
  if (plasticCardImage)
  {
    CGImageRelease(plasticCardImage);
    self->_plasticCardImage = 0;
  }
  if (a3)
    self->_plasticCardImage = CGImageRetain(a3);
}

- (void)setThumbnailImage:(CGImage *)a3
{
  CGImage *thumbnailImage;

  thumbnailImage = self->_thumbnailImage;
  if (thumbnailImage)
  {
    CGImageRelease(thumbnailImage);
    self->_thumbnailImage = 0;
  }
  if (a3)
    self->_thumbnailImage = CGImageRetain(a3);
}

- (void)setLogoImage:(CGImage *)a3
{
  CGImage *logoImage;

  logoImage = self->_logoImage;
  if (logoImage)
  {
    CGImageRelease(logoImage);
    self->_logoImage = 0;
  }
  if (a3)
    self->_logoImage = CGImageRetain(a3);
}

- (CGImage)digitalCardImage
{
  return self->_digitalCardImage;
}

- (CGImage)plasticCardImage
{
  return self->_plasticCardImage;
}

- (CGImage)thumbnailImage
{
  return self->_thumbnailImage;
}

- (CGImage)logoImage
{
  return self->_logoImage;
}

@end
