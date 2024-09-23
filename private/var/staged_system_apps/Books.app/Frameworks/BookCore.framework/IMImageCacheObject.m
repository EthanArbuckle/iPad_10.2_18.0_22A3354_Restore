@implementation IMImageCacheObject

- (IMImageCacheObject)initWithImageRefs:(id)a3 imageSize:(CGSize)a4
{
  CGFloat height;
  CGFloat width;
  id v7;
  IMImageCacheObject *v8;
  NSArray *v9;
  NSArray *imageRefs;
  objc_super v12;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)IMImageCacheObject;
  v8 = -[IMImageCacheObject init](&v12, "init");
  if (v8)
  {
    v9 = (NSArray *)objc_msgSend(v7, "copy");
    imageRefs = v8->_imageRefs;
    v8->_imageRefs = v9;

    v8->_imageSize.width = width;
    v8->_imageSize.height = height;
  }

  return v8;
}

- (BOOL)beginContentAccess
{
  return 1;
}

- (BOOL)isContentDiscarded
{
  return -[IMImageCacheObject persistedToDisk](self, "persistedToDisk");
}

- (NSArray)imageRefs
{
  return self->_imageRefs;
}

- (void)setImageRefs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (CGSize)imageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_imageSize.width;
  height = self->_imageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setImageSize:(CGSize)a3
{
  self->_imageSize = a3;
}

- (BOOL)persistedToDisk
{
  return self->_persistedToDisk;
}

- (void)setPersistedToDisk:(BOOL)a3
{
  self->_persistedToDisk = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageRefs, 0);
}

@end
