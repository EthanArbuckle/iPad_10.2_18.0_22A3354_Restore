@implementation PVMTLTextureImageBufferImpl

- (PVMTLTextureImageBufferImpl)initWithMTLTexture:(id)a3
{
  id v5;
  PVMTLTextureImageBufferImpl *v6;
  PVMTLTextureImageBufferImpl *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PVMTLTextureImageBufferImpl;
  v6 = -[PVMTLTextureImageBufferImpl init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_mtlTexture, a3);

  return v7;
}

- (CGImage)cgImage
{
  return 0;
}

- (BOOL)canCreateCVPixelBuffer
{
  return 0;
}

- (BOOL)canCreateHGBitmap
{
  return 1;
}

- (BOOL)cvPixelBufferRequiresCopy
{
  return 1;
}

- (BOOL)cvPixelBufferRequiresRender
{
  return 0;
}

- (HGRef<HGCVPixelBuffer>)cvPixelBufferWithColorSpace:(id)a3
{
  _QWORD *v3;

  *v3 = 0;
  return (HGRef<HGCVPixelBuffer>)self;
}

- (HGRef<HGBitmap>)hgBitmapWithColorSpace:(id)a3
{
  _QWORD *v3;
  _QWORD *v4;
  id v5;
  uint64_t v6;

  v4 = v3;
  v5 = HGMetalTexture::createFromTexture(self->_mtlTexture, &v6);
  *v4 = v6;
  return (HGRef<HGBitmap>)v5;
}

- (CGSize)size
{
  double v3;
  double v4;
  double v5;
  CGSize result;

  v3 = (double)(unint64_t)-[MTLTexture width](self->_mtlTexture, "width");
  v4 = (double)(unint64_t)-[MTLTexture height](self->_mtlTexture, "height");
  v5 = v3;
  result.height = v4;
  result.width = v5;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mtlTexture, 0);
}

@end
