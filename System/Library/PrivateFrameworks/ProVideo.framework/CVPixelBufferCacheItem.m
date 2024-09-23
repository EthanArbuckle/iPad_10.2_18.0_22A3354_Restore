@implementation CVPixelBufferCacheItem

- (CVPixelBufferCacheItem)initWithCVPixelBuffers:(id)a3 DODs:(id)a4 fullSize:(CGSize)a5 colorSpace:(id)a6
{
  CGFloat height;
  CGFloat width;
  id v12;
  id v13;
  id v14;
  CVPixelBufferCacheItem *v15;
  CVPixelBufferCacheItem *v16;
  objc_super v18;

  height = a5.height;
  width = a5.width;
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)CVPixelBufferCacheItem;
  v15 = -[CVPixelBufferCacheItem init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_buffers, a3);
    objc_storeStrong((id *)&v16->_DODs, a4);
    v16->_fullSize.width = width;
    v16->_fullSize.height = height;
    objc_storeStrong((id *)&v16->_colorSpace, a6);
  }

  return v16;
}

- (NSArray)buffers
{
  return self->_buffers;
}

- (NSArray)DODs
{
  return self->_DODs;
}

- (CGSize)fullSize
{
  double width;
  double height;
  CGSize result;

  width = self->_fullSize.width;
  height = self->_fullSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (PVColorSpace)colorSpace
{
  return self->_colorSpace;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorSpace, 0);
  objc_storeStrong((id *)&self->_DODs, 0);
  objc_storeStrong((id *)&self->_buffers, 0);
}

@end
