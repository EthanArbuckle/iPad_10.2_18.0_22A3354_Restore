@implementation SUArtworkCellContext

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUArtworkCellContext;
  -[SUArtworkCellContext dealloc](&v3, sel_dealloc);
}

- (SUImageCache)imageCache
{
  return self->_imageCache;
}

- (void)setImageCache:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (ISURLOperationPool)imagePool
{
  return self->_imagePool;
}

- (void)setImagePool:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (SUImageDataProvider)imageProvider
{
  return self->_imageProvider;
}

- (void)setImageProvider:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (UIImage)placeholderImage
{
  return self->_placeholderImage;
}

- (void)setPlaceholderImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

@end
