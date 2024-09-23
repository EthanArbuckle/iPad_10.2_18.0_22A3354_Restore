@implementation WFPurgeableImage

- (WFPurgeableImage)initWithCGImage:(CGImage *)a3
{
  WFPurgeableImage *v5;
  double Width;
  double Height;
  CGColorSpace *ColorSpace;
  CGBitmapInfo BitmapInfo;
  size_t BytesPerRow;
  size_t BitsPerComponent;
  BOOL v12;
  size_t v13;
  WFPurgeableImage *v14;
  CGColorSpaceRef v15;
  void *v18;
  _QWORD v19[7];
  objc_super v20;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFImageCache.m"), 41, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("image"));

  }
  v20.receiver = self;
  v20.super_class = (Class)WFPurgeableImage;
  v5 = -[WFPurgeableImage init](&v20, sel_init);
  if (!v5
    || ((Width = (double)CGImageGetWidth(a3),
         Height = (double)CGImageGetHeight(a3),
         ColorSpace = CGImageGetColorSpace(a3),
         BitmapInfo = CGImageGetBitmapInfo(a3),
         BytesPerRow = CGImageGetBytesPerRow(a3),
         BitsPerComponent = CGImageGetBitsPerComponent(a3),
         *MEMORY[0x1E0C9D820] == Width)
      ? (v12 = *(double *)(MEMORY[0x1E0C9D820] + 8) == Height)
      : (v12 = 0),
        v12))
  {
    v14 = 0;
  }
  else
  {
    v13 = BitsPerComponent;
    v14 = 0;
    if ((ColorSpace || (BitmapInfo & 0x1F) == 7) && BitsPerComponent && BytesPerRow)
    {
      v5->_size.width = Width;
      v5->_size.height = Height;
      v15 = CGColorSpaceRetain(ColorSpace);
      v5->_bitmapInfo = BitmapInfo;
      v5->_colorSpace = v15;
      v5->_bitsPerComponent = v13;
      v5->_bytesPerRow = BytesPerRow;
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __36__WFPurgeableImage_initWithCGImage___block_invoke;
      v19[3] = &__block_descriptor_56_e20_v16__0__CGContext__8l;
      *(double *)&v19[4] = Width;
      *(double *)&v19[5] = Height;
      v19[6] = a3;
      -[WFPurgeableImage accessImageContext:](v5, "accessImageContext:", v19);
      v14 = v5;
    }
  }

  return v14;
}

- (void)dealloc
{
  objc_super v3;

  CGColorSpaceRelease(self->_colorSpace);
  v3.receiver = self;
  v3.super_class = (Class)WFPurgeableImage;
  -[WFPurgeableImage dealloc](&v3, sel_dealloc);
}

- (CGImage)copyImage
{
  const void *v2;
  CGImage *v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __29__WFPurgeableImage_copyImage__block_invoke;
  v5[3] = &unk_1E5FC7CE0;
  v5[4] = &v6;
  -[WFPurgeableImage accessImageContext:](self, "accessImageContext:", v5);
  v2 = (const void *)v7[3];
  if (v2)
    v3 = (CGImage *)CFAutorelease(v2);
  else
    v3 = 0;
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)accessImageContext:(id)a3
{
  NSPurgeableData *bytes;
  id v5;
  unint64_t v6;
  NSPurgeableData *v7;
  NSPurgeableData *v8;
  NSPurgeableData *v9;
  CGContext *v10;
  void (**v11)(id, CGContext *);

  v11 = (void (**)(id, CGContext *))a3;
  if (self)
  {
    bytes = self->_bytes;
    if (bytes)
      goto LABEL_5;
    v5 = objc_alloc(MEMORY[0x1E0CB38D0]);
    v6 = (unint64_t)(self->_size.height * (double)self->_bytesPerRow);
  }
  else
  {
    v5 = objc_alloc(MEMORY[0x1E0CB38D0]);
    v6 = 0;
  }
  v7 = (NSPurgeableData *)objc_msgSend(v5, "initWithLength:", v6);
  v8 = self->_bytes;
  self->_bytes = v7;

  bytes = self->_bytes;
LABEL_5:
  if ((-[NSPurgeableData beginContentAccess](bytes, "beginContentAccess") & 1) != 0)
  {
    v9 = objc_retainAutorelease(self->_bytes);
    v10 = CGBitmapContextCreate((void *)-[NSPurgeableData mutableBytes](v9, "mutableBytes"), (unint64_t)self->_size.width, (unint64_t)self->_size.height, self->_bitsPerComponent, self->_bytesPerRow, self->_colorSpace, self->_bitmapInfo);

    CGContextTranslateCTM(v10, 0.0, -self->_size.height);
    v11[2](v11, v10);
    CGContextRelease(v10);
    -[NSPurgeableData endContentAccess](self->_bytes, "endContentAccess");
  }
  else
  {
    v11[2](v11, 0);
  }

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  CGFloat height;
  CGFloat width;
  NSPurgeableData *bytes;
  NSPurgeableData *v9;
  uint64_t v10;
  NSPurgeableData *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
  {
    width = self->_size.width;
    height = self->_size.height;
    bytes = self->_bytes;
  }
  else
  {
    bytes = 0;
    height = 0.0;
    width = 0.0;
  }
  v9 = bytes;
  v10 = -[NSPurgeableData length](v9, "length");
  if (self)
    v11 = self->_bytes;
  else
    v11 = 0;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p, size: %f x %f, bytes: %lu, discarded: %d>"), v5, self, *(_QWORD *)&width, *(_QWORD *)&height, v10, -[NSPurgeableData isContentDiscarded](v11, "isContentDiscarded"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bytes, 0);
}

CGImageRef __29__WFPurgeableImage_copyImage__block_invoke(CGImageRef result, CGContextRef context)
{
  uint64_t v2;

  if (context)
  {
    v2 = (uint64_t)result;
    result = CGBitmapContextCreateImage(context);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v2 + 32) + 8) + 24) = result;
  }
  return result;
}

void __36__WFPurgeableImage_initWithCGImage___block_invoke(uint64_t a1, CGContextRef c)
{
  CGRect v2;

  v2.size.width = *(CGFloat *)(a1 + 32);
  v2.size.height = *(CGFloat *)(a1 + 40);
  v2.origin.x = 0.0;
  v2.origin.y = 0.0;
  CGContextDrawImage(c, v2, *(CGImageRef *)(a1 + 48));
}

@end
