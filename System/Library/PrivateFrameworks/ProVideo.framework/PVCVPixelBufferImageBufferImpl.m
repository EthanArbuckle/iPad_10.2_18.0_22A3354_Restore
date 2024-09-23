@implementation PVCVPixelBufferImageBufferImpl

- (PVCVPixelBufferImageBufferImpl)initWithCVPixelBuffer:(__CVBuffer *)a3
{
  PVCVPixelBufferImageBufferImpl *v4;
  HGObject *m_Obj;
  HGObject *v6;
  HGObject *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PVCVPixelBufferImageBufferImpl;
  v4 = -[PVCVPixelBufferImageBufferImpl init](&v9, sel_init);
  if (v4)
  {
    HGCVPixelBuffer::create((HGCVPixelBuffer *)a3, &v8);
    m_Obj = (HGObject *)v4->_pixelBuffer.m_Obj;
    v6 = v8;
    if (m_Obj == v8)
    {
      if (m_Obj)
        (*(void (**)(HGObject *))(*(_QWORD *)m_Obj + 24))(m_Obj);
    }
    else
    {
      if (m_Obj)
      {
        (*(void (**)(HGObject *))(*(_QWORD *)m_Obj + 24))(m_Obj);
        v6 = v8;
      }
      v4->_pixelBuffer.m_Obj = (HGCVPixelBuffer *)v6;
    }
  }
  return v4;
}

- (PVCVPixelBufferImageBufferImpl)initWithHGCVPixelBuffer:(HGRef<HGCVPixelBuffer>)a3
{
  PVCVPixelBufferImageBufferImpl *v4;
  PVCVPixelBufferImageBufferImpl *v5;
  HGCVPixelBuffer *m_Obj;
  HGCVPixelBuffer *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PVCVPixelBufferImageBufferImpl;
  v4 = -[PVCVPixelBufferImageBufferImpl init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    m_Obj = v4->_pixelBuffer.m_Obj;
    v7 = *(HGCVPixelBuffer **)a3.m_Obj;
    if (m_Obj != *(HGCVPixelBuffer **)a3.m_Obj)
    {
      if (m_Obj)
      {
        (*(void (**)(HGCVPixelBuffer *))(*(_QWORD *)m_Obj + 24))(v5->_pixelBuffer.m_Obj);
        v7 = *(HGCVPixelBuffer **)a3.m_Obj;
      }
      v5->_pixelBuffer.m_Obj = v7;
      if (v7)
        (*(void (**)(HGCVPixelBuffer *))(*(_QWORD *)v7 + 16))(v7);
    }
  }
  return v5;
}

- (PVCVPixelBufferImageBufferImpl)initWithCVPixelBuffer:(__CVBuffer *)a3 withSourceColorSpace:(id)a4
{
  id v7;
  PVCVPixelBufferImageBufferImpl *v8;
  HGObject *m_Obj;
  HGObject *v10;
  HGObject *v12;
  objc_super v13;

  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PVCVPixelBufferImageBufferImpl;
  v8 = -[PVCVPixelBufferImageBufferImpl init](&v13, sel_init);
  if (v8)
  {
    HGCVPixelBuffer::create((HGCVPixelBuffer *)a3, &v12);
    m_Obj = (HGObject *)v8->_pixelBuffer.m_Obj;
    v10 = v12;
    if (m_Obj == v12)
    {
      if (m_Obj)
        (*(void (**)(HGObject *))(*(_QWORD *)m_Obj + 24))(m_Obj);
    }
    else
    {
      if (m_Obj)
      {
        (*(void (**)(HGObject *))(*(_QWORD *)m_Obj + 24))(m_Obj);
        v10 = v12;
      }
      v8->_pixelBuffer.m_Obj = (HGCVPixelBuffer *)v10;
    }
    objc_storeStrong((id *)&v8->_sourceColorSpace, a4);
  }

  return v8;
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
  v4.super_class = (Class)PVCVPixelBufferImageBufferImpl;
  -[PVCVPixelBufferImageBufferImpl dealloc](&v4, sel_dealloc);
}

- (CGImage)cgImage
{
  CGImage *generatedCGImage;
  CFTypeRef v4;
  CFTypeRef v5;
  uint64_t v6;
  uint64_t v7;
  PVColorSpace *v8;
  HGCVPixelBuffer *m_Obj;
  __int128 v11;
  uint64_t v12;
  HGCVPixelBuffer *v13;
  __int128 v14;
  uint64_t v15;

  generatedCGImage = self->_generatedCGImage;
  if (generatedCGImage)
    return generatedCGImage;
  v4 = CVBufferCopyAttachment(*((CVBufferRef *)self->_pixelBuffer.m_Obj + 3), (CFStringRef)*MEMORY[0x1E0CA8D68], 0);
  v5 = CVBufferCopyAttachment(*((CVBufferRef *)self->_pixelBuffer.m_Obj + 3), (CFStringRef)*MEMORY[0x1E0CA8E98], 0);
  if (!v4)
    goto LABEL_11;
  if (CFEqual(v4, (CFTypeRef)*MEMORY[0x1E0CA8D98]))
  {
    +[PVColorSpace p3d65GammaColorSpace](PVColorSpace, "p3d65GammaColorSpace");
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  if (CFEqual(v4, (CFTypeRef)*MEMORY[0x1E0CA8D88]))
  {
LABEL_11:
    +[PVColorSpace sRGBColorSpace](PVColorSpace, "sRGBColorSpace");
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  if (!v5 || !CFEqual(v4, (CFTypeRef)*MEMORY[0x1E0CA8D80]))
  {
    v7 = objc_opt_class();
    NSLog(CFSTR("[%@ %p] Unknown color primary (%@) on pixel buffer. Defaulting to sRGB"), v7, self, v4);
    goto LABEL_11;
  }
  if (CFEqual(v5, (CFTypeRef)*MEMORY[0x1E0CA8EA8]))
  {
    +[PVColorSpace rec2100HLGColorSpace](PVColorSpace, "rec2100HLGColorSpace");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!CFEqual(v5, (CFTypeRef)*MEMORY[0x1E0CA8EB8]))
    {
      v8 = 0;
      goto LABEL_13;
    }
    +[PVColorSpace rec2020LinearColorSpace](PVColorSpace, "rec2020LinearColorSpace");
    v6 = objc_claimAutoreleasedReturnValue();
  }
LABEL_12:
  v8 = (PVColorSpace *)v6;
LABEL_13:
  v14 = 0uLL;
  v15 = 0;
  PVImagePropertiesForColorSpace(v8, 0, (uint64_t)&v14);
  m_Obj = self->_pixelBuffer.m_Obj;
  v13 = m_Obj;
  if (m_Obj)
    (*(void (**)(HGCVPixelBuffer *))(*(_QWORD *)m_Obj + 16))(m_Obj);
  v11 = v14;
  v12 = v15;
  self->_generatedCGImage = PVCreateCGImageRefFromCVPixelBuffer(&v13, (uint64_t)&v11);
  if (v13)
    (*(void (**)(HGCVPixelBuffer *))(*(_QWORD *)v13 + 24))(v13);
  if (v4)
    CFRelease(v4);
  if (v5)
    CFRelease(v5);
  generatedCGImage = self->_generatedCGImage;

  return generatedCGImage;
}

- (BOOL)canCreateCVPixelBuffer
{
  return 1;
}

- (BOOL)canCreateHGBitmap
{
  return 0;
}

- (BOOL)cvPixelBufferRequiresCopy
{
  return 0;
}

- (BOOL)cvPixelBufferRequiresRender
{
  return self->_sourceColorSpace != 0;
}

- (HGRef<HGCVPixelBuffer>)cvPixelBufferWithColorSpace:(id)a3
{
  HGCVPixelBuffer **v3;
  HGCVPixelBuffer **v5;
  id v6;
  void *v7;
  HGCVPixelBuffer *m_Obj;
  HGRef<HGCVPixelBuffer> v9;
  __CVBuffer *v10;
  PVColorSpace *sourceColorSpace;
  HGColorConform **v12;
  HGCVPixelBuffer *v13;
  const char *v14;
  HGColorConform **v15;

  v5 = v3;
  v6 = a3;
  v7 = v6;
  if (self->_pixelBuffer.m_Obj)
  {
    if (objc_msgSend(v6, "isProResLogColorSpace"))
      NSLog(CFSTR("Pro Res Log, as an output color space, is not currently supported"));
    if (v7 && self->_sourceColorSpace && (objc_msgSend(v7, "isProResLogColorSpace") & 1) == 0)
    {
      m_Obj = self->_generatedPixelBuffer.m_Obj;
      if (m_Obj)
      {
        *v5 = m_Obj;
LABEL_13:
        (*(void (**)(HGCVPixelBuffer *))(*(_QWORD *)m_Obj + 16))(m_Obj);
        goto LABEL_14;
      }
      v10 = (__CVBuffer *)*((_QWORD *)self->_pixelBuffer.m_Obj + 3);
      sourceColorSpace = self->_sourceColorSpace;
      v14 = 0;
      PVCreateCVPixelBufferFromCVPixelBufferWithColorSpaces(v10, sourceColorSpace, v7, &v14, &v15);
      v12 = (HGColorConform **)self->_generatedPixelBuffer.m_Obj;
      v13 = (HGCVPixelBuffer *)v15;
      if (v12 == v15)
      {
        if (v12)
          (*((void (**)(HGColorConform **))*v12 + 3))(v12);
      }
      else
      {
        if (v12)
        {
          (*((void (**)(HGColorConform **))*v12 + 3))(v12);
          v13 = (HGCVPixelBuffer *)v15;
        }
        self->_generatedPixelBuffer.m_Obj = v13;
        v15 = 0;
      }
      if (v14)
        (*(void (**)(const char *))(*(_QWORD *)v14 + 24))(v14);
      m_Obj = self->_generatedPixelBuffer.m_Obj;
    }
    else
    {
      m_Obj = self->_pixelBuffer.m_Obj;
    }
    *v5 = m_Obj;
    if (!m_Obj)
      goto LABEL_14;
    goto LABEL_13;
  }
  *v5 = 0;
LABEL_14:

  return v9;
}

- (HGRef<HGBitmap>)hgBitmapWithColorSpace:(id)a3
{
  _QWORD *v3;

  *v3 = 0;
  return (HGRef<HGBitmap>)self;
}

- (CGSize)size
{
  double v3;
  double v4;
  double v5;
  CGSize result;

  v3 = (double)HGCVPixelBuffer::w(self->_pixelBuffer.m_Obj, 0);
  v4 = (double)HGCVPixelBuffer::h(self->_pixelBuffer.m_Obj, 0);
  v5 = v3;
  result.height = v4;
  result.width = v5;
  return result;
}

- (PVColorSpace)sourceColorSpace
{
  return self->_sourceColorSpace;
}

- (void).cxx_destruct
{
  HGCVPixelBuffer *m_Obj;
  HGCVPixelBuffer *v4;

  objc_storeStrong((id *)&self->_sourceColorSpace, 0);
  m_Obj = self->_generatedPixelBuffer.m_Obj;
  if (m_Obj)
    (*(void (**)(HGCVPixelBuffer *))(*(_QWORD *)m_Obj + 24))(m_Obj);
  v4 = self->_pixelBuffer.m_Obj;
  if (v4)
    (*(void (**)(HGCVPixelBuffer *))(*(_QWORD *)v4 + 24))(v4);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end
