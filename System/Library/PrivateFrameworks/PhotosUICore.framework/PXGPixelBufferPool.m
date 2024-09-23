@implementation PXGPixelBufferPool

- (PXGPixelBufferPool)initWithPixelBufferPool:(__CVPixelBufferPool *)a3
{
  PXGPixelBufferPool *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v12;
  CGColorSpace *v13;
  void *v15;
  void *v16;
  void *v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)PXGPixelBufferPool;
  v5 = -[PXGPixelBufferPool init](&v18, sel_init);
  if (v5)
  {
    if (!a3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, v5, CFSTR("PXGPixelBufferPool.m"), 40, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("pixelBufferPool != NULL"));

    }
    v5->_pixelBufferPool = CVPixelBufferPoolRetain(a3);
    CVPixelBufferPoolGetPixelBufferAttributes(a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CA90E0]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "integerValue");

    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CA8FD8]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "integerValue");

    if (v8 < 1 || v10 <= 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, v5, CFSTR("PXGPixelBufferPool.m"), 46, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("width > 0 && height > 0"));

    }
    v5->_pixelSize.width = (double)v8;
    v5->_pixelSize.height = (double)v10;
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CA9040]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_pixelFormatType = objc_msgSend(v12, "unsignedIntValue");

    if (!v5->_pixelFormatType)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, v5, CFSTR("PXGPixelBufferPool.m"), 50, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_pixelFormatType != 0"));

    }
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CA8CD8]);
    v13 = (CGColorSpace *)objc_claimAutoreleasedReturnValue();
    v5->_colorSpace = CGColorSpaceRetain(v13);

  }
  return v5;
}

- (PXGPixelBufferPool)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGPixelBufferPool.m"), 58, CFSTR("%s is not available as initializer"), "-[PXGPixelBufferPool init]");

  abort();
}

- (void)dealloc
{
  objc_super v3;

  CVPixelBufferPoolRelease(self->_pixelBufferPool);
  CGColorSpaceRelease(self->_colorSpace);
  v3.receiver = self;
  v3.super_class = (Class)PXGPixelBufferPool;
  -[PXGPixelBufferPool dealloc](&v3, sel_dealloc);
}

- (__CVPixelBufferPool)pixelBufferPool
{
  CVPixelBufferPoolRef v2;

  v2 = CVPixelBufferPoolRetain(self->_pixelBufferPool);
  CFAutorelease(v2);
  return v2;
}

- (CGSize)pixelSize
{
  double width;
  double height;
  CGSize result;

  width = self->_pixelSize.width;
  height = self->_pixelSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (unsigned)pixelFormatType
{
  return self->_pixelFormatType;
}

- (CGColorSpace)colorSpace
{
  return self->_colorSpace;
}

+ (id)pixelBufferPoolWithSize:(CGSize)a3 format:(unsigned int)a4
{
  uint64_t v4;
  double height;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFDictionary *v10;
  PXGPixelBufferPool *v11;
  PXGPixelBufferPool *v12;
  CVPixelBufferPoolRef pixelBufferPool;
  _QWORD v15[6];
  _QWORD v16[7];

  v4 = *(_QWORD *)&a4;
  height = a3.height;
  v16[6] = *MEMORY[0x1E0C80C00];
  v6 = *MEMORY[0x1E0CA8FF0];
  v15[0] = *MEMORY[0x1E0CA9010];
  v15[1] = v6;
  v16[0] = MEMORY[0x1E0C9AAB0];
  v16[1] = MEMORY[0x1E0C9AA70];
  v15[2] = *MEMORY[0x1E0CA90E0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3.width);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v7;
  v15[3] = *MEMORY[0x1E0CA8FD8];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", height);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v8;
  v15[4] = *MEMORY[0x1E0CA9040];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[5] = *MEMORY[0x1E0CA9050];
  v16[4] = v9;
  v16[5] = &unk_1E53EAF20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 6);
  v10 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  pixelBufferPool = 0;
  v11 = 0;
  if (!CVPixelBufferPoolCreate(0, 0, v10, &pixelBufferPool))
  {
    v12 = [PXGPixelBufferPool alloc];
    v11 = -[PXGPixelBufferPool initWithPixelBufferPool:](v12, "initWithPixelBufferPool:", pixelBufferPool);
    CVPixelBufferPoolRelease(pixelBufferPool);
  }

  return v11;
}

@end
