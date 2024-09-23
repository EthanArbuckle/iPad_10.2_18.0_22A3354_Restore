@implementation PVHGBitmapImageBufferImpl

- (PVHGBitmapImageBufferImpl)initWithHGBitmap:(HGRef<HGBitmap>)a3
{
  PVHGBitmapImageBufferImpl *v4;
  PVHGBitmapImageBufferImpl *v5;
  HGBitmap *m_Obj;
  HGBitmap *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PVHGBitmapImageBufferImpl;
  v4 = -[PVHGBitmapImageBufferImpl init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    m_Obj = v4->_bitmap.m_Obj;
    v7 = *(HGBitmap **)a3.m_Obj;
    if (m_Obj != *(HGBitmap **)a3.m_Obj)
    {
      if (m_Obj)
      {
        (*(void (**)(HGBitmap *))(*(_QWORD *)m_Obj + 24))(v5->_bitmap.m_Obj);
        v7 = *(HGBitmap **)a3.m_Obj;
      }
      v5->_bitmap.m_Obj = v7;
      if (v7)
        (*(void (**)(HGBitmap *))(*(_QWORD *)v7 + 16))(v7);
    }
  }
  return v5;
}

- (void)dealloc
{
  CGImage *generatedCGImage;
  objc_super v4;

  generatedCGImage = self->_generatedCGImage;
  if (generatedCGImage)
    CGImageRelease(generatedCGImage);
  self->_generatedCGImage = 0;
  v4.receiver = self;
  v4.super_class = (Class)PVHGBitmapImageBufferImpl;
  -[PVHGBitmapImageBufferImpl dealloc](&v4, sel_dealloc);
}

- (CGImage)cgImage
{
  CGImage *generatedCGImage;
  PVColorSpace *v4;
  const void *Storage;
  id *v6;
  PVColorSpace *v7;
  HGBitmap *m_Obj;
  HGBitmap *v9;
  CGDataProvider *v10;
  uint64_t v12;
  uint64_t v13;
  CGColorSpaceRef space;

  generatedCGImage = self->_generatedCGImage;
  if (!generatedCGImage)
  {
    +[PVColorSpace sRGBColorSpace](PVColorSpace, "sRGBColorSpace");
    v4 = (PVColorSpace *)objc_claimAutoreleasedReturnValue();
    Storage = (const void *)HGBitmap::GetStorage(self->_bitmap.m_Obj);
    if (Storage)
    {
      if (v6)
      {
        if (v6[3])
        {
          v7 = (PVColorSpace *)v6[3];

          v4 = v7;
        }
      }
    }
    v12 = 0;
    v13 = 0;
    space = 0;
    PVImagePropertiesForColorSpace(v4, 0, (uint64_t)&v12);
    m_Obj = self->_bitmap.m_Obj;
    if (m_Obj)
    {
      (*(void (**)(HGBitmap *))(*(_QWORD *)m_Obj + 16))(m_Obj);
      v9 = self->_bitmap.m_Obj;
    }
    else
    {
      v9 = 0;
    }
    v10 = CGDataProviderCreateWithData(v9, *((const void **)v9 + 10), *((_QWORD *)v9 + 8) * (*((_DWORD *)v9 + 8) - *((_DWORD *)v9 + 6)), (CGDataProviderReleaseDataCallback)freeUnderlyingHGBitmap);
    generatedCGImage = CGImageCreate((*((_DWORD *)v9 + 7) - *((_DWORD *)v9 + 5)), (*((_DWORD *)v9 + 8) - *((_DWORD *)v9 + 6)), SHIDWORD(v12), 4 * SHIDWORD(v12), *((_QWORD *)v9 + 8), space, v13, v10, 0, 1, kCGRenderingIntentDefault);
    CGDataProviderRelease(v10);
    self->_generatedCGImage = generatedCGImage;

  }
  return generatedCGImage;
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
  HGBitmap **v3;
  HGBitmap *m_Obj;

  m_Obj = self->_bitmap.m_Obj;
  *v3 = m_Obj;
  if (m_Obj)
    return (HGRef<HGBitmap>)(*(uint64_t (**)(HGBitmap *))(*(_QWORD *)m_Obj + 16))(m_Obj);
  return (HGRef<HGBitmap>)m_Obj;
}

- (CGSize)size
{
  double v2;
  double v3;
  CGSize result;

  v2 = (double)(*((_DWORD *)self->_bitmap.m_Obj + 7) - *((_DWORD *)self->_bitmap.m_Obj + 5));
  v3 = v2;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void).cxx_destruct
{
  HGBitmap *m_Obj;

  m_Obj = self->_bitmap.m_Obj;
  if (m_Obj)
    (*(void (**)(HGBitmap *, SEL))(*(_QWORD *)m_Obj + 24))(m_Obj, a2);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
