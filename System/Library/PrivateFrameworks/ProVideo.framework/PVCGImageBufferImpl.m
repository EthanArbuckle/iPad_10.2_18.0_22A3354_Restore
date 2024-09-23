@implementation PVCGImageBufferImpl

- (PVCGImageBufferImpl)initWithCGImage:(CGImage *)a3
{
  PVCGImageBufferImpl *v4;
  PVCGImageBufferImpl *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PVCGImageBufferImpl;
  v4 = -[PVCGImageBufferImpl init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_image = a3;
    CGImageRetain(a3);
  }
  return v5;
}

- (PVCGImageBufferImpl)initWithCGImage:(CGImage *)a3 withGainMap:(CGImage *)a4
{
  PVCGImageBufferImpl *v5;
  PVCGImageBufferImpl *v6;

  v5 = -[PVCGImageBufferImpl initWithCGImage:](self, "initWithCGImage:", a3);
  v6 = v5;
  if (v5)
  {
    v5->_gainMap = a4;
    CGImageRetain(a4);
  }
  return v6;
}

- (PVCGImageBufferImpl)initWithCGImage:(CGImage *)a3 withSourceColorSpace:(id)a4
{
  id v7;
  PVCGImageBufferImpl *v8;
  PVCGImageBufferImpl *v9;

  v7 = a4;
  v8 = -[PVCGImageBufferImpl initWithCGImage:](self, "initWithCGImage:", a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_sourceColorSpace, a4);

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  CGImageRelease(self->_image);
  self->_image = 0;
  CGImageRelease(self->_gainMap);
  self->_gainMap = 0;
  v3.receiver = self;
  v3.super_class = (Class)PVCGImageBufferImpl;
  -[PVCGImageBufferImpl dealloc](&v3, sel_dealloc);
}

- (CGImage)cgImage
{
  return self->_image;
}

- (BOOL)canCreateCVPixelBuffer
{
  CGFloat Width;
  CGSize v5;

  Width = (double)CGImageGetWidth(self->_image);
  v5.height = (double)CGImageGetHeight(self->_image);
  v5.width = Width;
  return PVCanCreateCVPixelBuffer(v5);
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
  return self->_gainMap || self->_sourceColorSpace != 0;
}

- (HGRef<HGCVPixelBuffer>)cvPixelBufferWithColorSpace:(id)a3
{
  HGCVPixelBuffer **v3;
  HGCVPixelBuffer **v5;
  id v6;
  HGCVPixelBuffer *m_Obj;
  CGImage *image;
  PVColorSpace *v9;
  PVColorSpace *v10;
  int v11;
  CGImage *v12;
  PVColorSpace *sourceColorSpace;
  HGNode ***v14;
  HGCVPixelBuffer *v15;
  CGImage *gainMap;
  CGImage *v17;
  HGNode ***v18;
  HGCVPixelBuffer *v19;
  CGImage *v20;
  HGNode ***v21;
  HGCVPixelBuffer *v22;
  HGCVPixelBuffer *v23;
  HGRef<HGCVPixelBuffer> v24;
  const char *v25;
  __int128 v26;
  uint64_t v27;
  const char *v28;
  __int128 v29;
  uint64_t v30;
  const char *v31;
  HGNode ***v32;
  __int128 v33;
  uint64_t v34;

  v5 = v3;
  v6 = a3;
  m_Obj = self->_generatedPixelBuffer.m_Obj;
  if (m_Obj)
  {
    *v5 = m_Obj;
    (*(void (**)(HGCVPixelBuffer *))(*(_QWORD *)m_Obj + 16))(m_Obj);
    goto LABEL_44;
  }
  image = self->_image;
  if (!image)
  {
    *v5 = 0;
    goto LABEL_44;
  }
  if (v6)
  {
    v9 = (PVColorSpace *)v6;
LABEL_6:
    v10 = v9;
    goto LABEL_9;
  }
  +[PVColorSpace pvColorSpaceFromCGColorSpace:](PVColorSpace, "pvColorSpaceFromCGColorSpace:", CGImageGetColorSpace(image));
  v10 = (PVColorSpace *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    +[PVColorSpace sRGBColorSpace](PVColorSpace, "sRGBColorSpace");
    v9 = (PVColorSpace *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
LABEL_9:
  v33 = 0uLL;
  v34 = 0;
  PVImagePropertiesForColorSpace(v10, 0, (uint64_t)&v33);
  v11 = 0;
  if (v6 && self->_sourceColorSpace)
    v11 = objc_msgSend(v6, "isProResLogColorSpace") ^ 1;
  if (objc_msgSend(v6, "isProResLogColorSpace"))
    NSLog(CFSTR("Pro Res Log, as an output color space, is not currently supported"));
  if (v11)
  {
    v12 = self->_image;
    sourceColorSpace = self->_sourceColorSpace;
    v31 = 0;
    PVCreateCVPixelBufferFromCGImageRefWithColorSpaces(v12, sourceColorSpace, v10, &v31, (HGColorConform ***)&v32);
    v14 = (HGNode ***)self->_generatedPixelBuffer.m_Obj;
    v15 = (HGCVPixelBuffer *)v32;
    if (v14 == v32)
    {
      if (v14)
        ((void (*)(HGNode ***))(*v14)[3])(v14);
    }
    else
    {
      if (v14)
      {
        ((void (*)(HGNode ***))(*v14)[3])(v14);
        v15 = (HGCVPixelBuffer *)v32;
      }
      self->_generatedPixelBuffer.m_Obj = v15;
      v32 = 0;
    }
    if (v31)
      (*(void (**)(const char *))(*(_QWORD *)v31 + 24))(v31);
  }
  else
  {
    gainMap = self->_gainMap;
    if (gainMap)
    {
      v17 = self->_image;
      v29 = v33;
      v30 = v34;
      v28 = 0;
      PVCreateCVPixelBufferFromCGImageRefAndGainMap(v17, gainMap, (uint64_t)&v29, &v28, &v32);
      v18 = (HGNode ***)self->_generatedPixelBuffer.m_Obj;
      v19 = (HGCVPixelBuffer *)v32;
      if (v18 == v32)
      {
        if (v18)
          ((void (*)(HGNode ***))(*v18)[3])(v18);
      }
      else
      {
        if (v18)
        {
          ((void (*)(HGNode ***))(*v18)[3])(v18);
          v19 = (HGCVPixelBuffer *)v32;
        }
        self->_generatedPixelBuffer.m_Obj = v19;
        v32 = 0;
      }
      if (v28)
        (*(void (**)(const char *))(*(_QWORD *)v28 + 24))(v28);
    }
    else
    {
      v20 = self->_image;
      v26 = v33;
      v27 = v34;
      v25 = 0;
      PVCreateCVPixelBufferFromCGImageRef(v20, (uint64_t)&v26, &v25, (HGObject **)&v32);
      v21 = (HGNode ***)self->_generatedPixelBuffer.m_Obj;
      v22 = (HGCVPixelBuffer *)v32;
      if (v21 == v32)
      {
        if (v21)
          ((void (*)(HGNode ***))(*v21)[3])(v21);
      }
      else
      {
        if (v21)
        {
          ((void (*)(HGNode ***))(*v21)[3])(v21);
          v22 = (HGCVPixelBuffer *)v32;
        }
        self->_generatedPixelBuffer.m_Obj = v22;
        v32 = 0;
      }
      if (v25)
        (*(void (**)(const char *))(*(_QWORD *)v25 + 24))(v25);
    }
  }
  v23 = self->_generatedPixelBuffer.m_Obj;
  *v5 = v23;
  if (v23)
    (*(void (**)(HGCVPixelBuffer *))(*(_QWORD *)v23 + 16))(v23);

LABEL_44:
  return v24;
}

- (HGRef<HGBitmap>)hgBitmapWithColorSpace:(id)a3
{
  HGBitmap **v3;
  HGBitmap **v5;
  id v6;
  HGBitmap *m_Obj;
  CGImage *image;
  PVColorSpace *v9;
  PVColorSpace *v10;
  HGBitmap *v11;
  HGBitmap *v12;
  HGRef<HGBitmap> v13;
  HGBitmap *v14;

  v5 = v3;
  v6 = a3;
  m_Obj = self->_generatedBitmap.m_Obj;
  if (!m_Obj)
  {
    image = self->_image;
    if (!image)
    {
      *v5 = 0;
      goto LABEL_19;
    }
    if (v6)
    {
      v9 = (PVColorSpace *)v6;
    }
    else
    {
      +[PVColorSpace pvColorSpaceFromCGColorSpace:](PVColorSpace, "pvColorSpaceFromCGColorSpace:", CGImageGetColorSpace(image));
      v10 = (PVColorSpace *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
LABEL_9:
        PVCreateHGBitmapFromCGImageRefWithStorage(self->_image, v10, &v14);
        v11 = self->_generatedBitmap.m_Obj;
        v12 = v14;
        if (v11 == v14)
        {
          if (!v11)
          {
            *v5 = 0;
LABEL_18:

            goto LABEL_19;
          }
          (*(void (**)(HGBitmap *))(*(_QWORD *)v11 + 24))(self->_generatedBitmap.m_Obj);
          v12 = self->_generatedBitmap.m_Obj;
        }
        else
        {
          if (v11)
          {
            (*(void (**)(HGBitmap *))(*(_QWORD *)v11 + 24))(self->_generatedBitmap.m_Obj);
            v12 = v14;
          }
          self->_generatedBitmap.m_Obj = v12;
        }
        *v5 = v12;
        if (v12)
          (*(void (**)(HGBitmap *))(*(_QWORD *)v12 + 16))(v12);
        goto LABEL_18;
      }
      +[PVColorSpace sRGBColorSpace](PVColorSpace, "sRGBColorSpace");
      v9 = (PVColorSpace *)objc_claimAutoreleasedReturnValue();
    }
    v10 = v9;
    goto LABEL_9;
  }
  *v5 = m_Obj;
  (*(void (**)(HGBitmap *))(*(_QWORD *)m_Obj + 16))(m_Obj);
LABEL_19:

  return v13;
}

- (CGSize)size
{
  double Width;
  double Height;
  double v5;
  CGSize result;

  Width = (double)CGImageGetWidth(self->_image);
  Height = (double)CGImageGetHeight(self->_image);
  v5 = Width;
  result.height = Height;
  result.width = v5;
  return result;
}

- (PVColorSpace)sourceColorSpace
{
  return self->_sourceColorSpace;
}

- (void).cxx_destruct
{
  HGBitmap *m_Obj;
  HGCVPixelBuffer *v4;

  objc_storeStrong((id *)&self->_sourceColorSpace, 0);
  m_Obj = self->_generatedBitmap.m_Obj;
  if (m_Obj)
    (*(void (**)(HGBitmap *))(*(_QWORD *)m_Obj + 24))(m_Obj);
  v4 = self->_generatedPixelBuffer.m_Obj;
  if (v4)
    (*(void (**)(HGCVPixelBuffer *))(*(_QWORD *)v4 + 24))(v4);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 4) = 0;
  return self;
}

@end
