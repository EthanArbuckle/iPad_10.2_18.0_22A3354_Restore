@implementation UIGraphicsImageRenderer

- (UIGraphicsImageRenderer)initWithSize:(CGSize)size
{
  double height;
  double width;
  void *v6;
  UIGraphicsImageRenderer *v7;

  height = size.height;
  width = size.width;
  +[UIGraphicsImageRendererFormat preferredFormat](UIGraphicsImageRendererFormat, "preferredFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[UIGraphicsImageRenderer initWithSize:format:](self, "initWithSize:format:", v6, width, height);

  return v7;
}

- (UIGraphicsImageRenderer)initWithSize:(CGSize)size format:(UIGraphicsImageRendererFormat *)format
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIGraphicsImageRenderer;
  return -[UIGraphicsRenderer initWithBounds:format:](&v5, sel_initWithBounds_format_, format, 0.0, 0.0, size.width, size.height);
}

- (UIImage)imageWithActions:(UIGraphicsImageDrawingActions)actions
{
  UIGraphicsImageDrawingActions v4;
  void *v5;
  UIImage *v6;
  UIImage *v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v4 = actions;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__106;
  v14 = __Block_byref_object_dispose__106;
  v15 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __44__UIGraphicsImageRenderer_imageWithActions___block_invoke;
  v9[3] = &unk_1E16CADB0;
  v9[4] = &v10;
  -[UIGraphicsRenderer runDrawingActions:completionActions:error:](self, "runDrawingActions:completionActions:error:", v4, v9, 0);
  v5 = (void *)v11[5];
  if (v5)
    v6 = v5;
  else
    v6 = objc_alloc_init(UIImage);
  v7 = v6;
  _Block_object_dispose(&v10, 8);

  return v7;
}

- (BOOL)allowsImageOutput
{
  return 1;
}

+ (Class)rendererContextClass
{
  return (Class)objc_opt_class();
}

+ (CGContext)contextWithFormat:(id)a3
{
  id v3;
  double v4;
  double v5;
  double v6;
  size_t v7;
  double v8;
  size_t v9;
  uint64_t v10;
  size_t v11;
  uint32_t v12;
  char v13;
  CGColorSpace *v14;
  CGColorSpace *v15;
  CGColorSpaceModel Model;
  int v17;
  int v18;
  int v19;
  size_t AlignedBytesPerRow;
  BOOL v21;
  CGContext *v22;
  char v23;
  void *v24;
  void *v25;
  _QWORD v27[4];
  char v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "_contextScale");
  v5 = v4;
  objc_msgSend(v3, "bounds");
  v7 = vcvtpd_u64_f64(v5 * v6);
  v9 = vcvtpd_u64_f64(v5 * v8);
  v10 = objc_msgSend(v3, "preferredRange");
  v11 = 0;
  v12 = 0;
  v13 = 1;
  if (v10 > 99)
  {
    if (v10 > 32765)
    {
      if (v10 == 32766)
      {
        objc_msgSend(v3, "opaque");
        if (qword_1ECD7A650 != -1)
          dispatch_once(&qword_1ECD7A650, &__block_literal_global_113);
        v14 = (CGColorSpace *)qword_1ECD7A648;
        v12 = objc_msgSend(v3, "opaque") ^ 1;
LABEL_47:
        v11 = 8;
      }
      else
      {
        if (v10 == 0x7FFF)
          v11 = 8;
        else
          v11 = 0;
        if (v10 == 0x7FFF)
          v12 = 7;
        else
          v12 = 0;
        v14 = 0;
        v13 = 1;
      }
    }
    else
    {
      if (v10 == 100)
      {
        if (qword_1ECD7A620 != -1)
          dispatch_once(&qword_1ECD7A620, &__block_literal_global_110_1);
        v14 = (CGColorSpace *)qword_1ECD7A618;
      }
      else
      {
        v14 = 0;
        if (v10 != 101)
          goto LABEL_48;
        if (qword_1ECD7A630 != -1)
          dispatch_once(&qword_1ECD7A630, &__block_literal_global_111_0);
        v14 = (CGColorSpace *)qword_1ECD7A628;
      }
LABEL_40:
      if (objc_msgSend(v3, "opaque"))
        v12 = 4357;
      else
        v12 = 4353;
      v11 = 16;
    }
  }
  else
  {
    v14 = 0;
    switch(v10)
    {
      case -1:
        v15 = (CGColorSpace *)objc_msgSend(v3, "_overrideColorSpace");
        if (!v15)
          goto LABEL_28;
        Model = CGColorSpaceGetModel(v15);
        v14 = (CGColorSpace *)objc_msgSend(v3, "_overrideColorSpace");
        CGColorSpaceGetNumberOfComponents(v14);
        if (Model == kCGColorSpaceModelRGB)
        {
          v11 = objc_msgSend(v3, "_overrideBitsPerComponent");
          v17 = objc_msgSend(v3, "opaque");
          if (v17)
            v18 = 8198;
          else
            v18 = 8194;
          if (v17)
            v19 = 4101;
          else
            v19 = 4097;
          if (v11 == 8)
            v12 = v18;
          else
            v12 = v19;
        }
        else
        {
          objc_msgSend(v3, "opaque");
          v11 = objc_msgSend(v3, "_overrideBitsPerComponent");
          v12 = objc_msgSend(v3, "opaque") ^ 1;
        }
        break;
      case 0:
LABEL_28:
        v11 = 0;
        v12 = 0;
        v14 = 0;
        v13 = 0;
        break;
      case 1:
        if (qword_1ECD7A610 != -1)
          dispatch_once(&qword_1ECD7A610, &__block_literal_global_277);
        v14 = (CGColorSpace *)_MergedGlobals_3_14;
        goto LABEL_40;
      case 2:
        if (qword_1ECD7A640 != -1)
          dispatch_once(&qword_1ECD7A640, &__block_literal_global_112);
        v14 = (CGColorSpace *)qword_1ECD7A638;
        if (objc_msgSend(v3, "opaque"))
          v12 = 8198;
        else
          v12 = 8194;
        goto LABEL_47;
      default:
        break;
    }
  }
LABEL_48:
  AlignedBytesPerRow = CGBitmapGetAlignedBytesPerRow();

  if (v7)
    v21 = v9 == 0;
  else
    v21 = 1;
  if (v21)
  {
    v22 = 0;
  }
  else if ((v13 & 1) != 0)
  {
    v22 = CGBitmapContextCreate(0, v7, v9, v11, AlignedBytesPerRow, v14, v12);
  }
  else
  {
    v23 = objc_msgSend(v3, "opaque");
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __45__UIGraphicsImageRenderer_contextWithFormat___block_invoke;
    v27[3] = &__block_descriptor_33_e91_B32__0_CGBitmapContextContentInfo_IiIBB_8__CGBitmapContextInfo_IQQQQiII__CGColorSpace_BI_24l;
    v28 = v23;
    v24 = _Block_copy(v27);
    v29 = *MEMORY[0x1E0C9D8D8];
    v30[0] = &unk_1E1A97E60;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (CGContext *)CGBitmapContextCreateWithCallbacks();

  }
  return v22;
}

+ (void)prepareCGContext:(CGContext *)a3 withRendererContext:(id)a4
{
  id v5;
  void *v6;
  int Type;
  double v8;
  double v9;
  double v10;
  size_t Width;
  double v12;
  size_t Height;
  CGFloat v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGAffineTransform v21;
  CGRect v22;

  v5 = a4;
  objc_msgSend(v5, "format");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  Type = CGContextGetType();
  objc_msgSend(v6, "_contextScale");
  v9 = v8;
  if (Type == 9)
  {
    objc_msgSend(v6, "bounds");
    Width = vcvtpd_u64_f64(v9 * v10);
    Height = vcvtpd_u64_f64(v9 * v12);
  }
  else
  {
    Width = CGBitmapContextGetWidth(a3);
    Height = CGBitmapContextGetHeight(a3);
  }
  v22.size.width = (double)Width;
  v14 = (double)Height;
  v22.origin.x = 0.0;
  v22.origin.y = 0.0;
  v22.size.height = (double)Height;
  CGContextClearRect(a3, v22);
  CGContextTranslateCTM(a3, 0.0, v14);
  CGContextScaleCTM(a3, v9, -v9);
  objc_msgSend(v5, "format");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "bounds");
  v17 = v16;
  v19 = v18;

  if (v17 != *MEMORY[0x1E0C9D538] || v19 != *(double *)(MEMORY[0x1E0C9D538] + 8))
    CGContextTranslateCTM(a3, -v17, -v19);
  CGContextGetCTM(&v21, a3);
  CGContextSetBaseCTM();

}

- (void)pushContext:(id)a3
{
  id v3;
  _BYTE *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  CGContext *v8;
  int *ContextStack;
  CGContextRef v10;
  int v11;
  int *v12;

  v3 = a3;
  v4 = malloc_type_malloc(0x10uLL, 0x10000409B4BCFF8uLL);
  objc_msgSend(v3, "format");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scale");
  *(_QWORD *)v4 = v6;

  objc_msgSend(v3, "format");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v4[8] = objc_msgSend(v7, "opaque");

  v8 = (CGContext *)objc_msgSend(v3, "CGContext");
  ContextStack = (int *)GetContextStack(1);
  v10 = CGContextRetain(v8);
  v11 = *ContextStack;
  v12 = &ContextStack[6 * *ContextStack];
  *((_QWORD *)v12 + 1) = v10;
  v12[4] = 1;
  *((_QWORD *)v12 + 3) = v4;
  *ContextStack = v11 + 1;
}

void __44__UIGraphicsImageRenderer_imageWithActions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "currentImage");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)_prepareContextForReuse:(CGContext *)a3
{
  if (CGContextGetType() == 9)
    CGContextClear();
}

uint64_t __45__UIGraphicsImageRenderer_contextWithFormat___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  BOOL v4;
  int v5;
  uint64_t result;

  if (*(_BYTE *)(a1 + 32))
    v4 = (a3 & 0x10000000000) == 0;
  else
    v4 = 1;
  if (v4)
    return 1;
  v5 = *(_DWORD *)(a4 + 44) - 2;
  if (v5 > 2)
    return 1;
  result = 0;
  *(_DWORD *)(a4 + 44) = dword_18667DB64[v5];
  *(_BYTE *)(a4 + 64) = 0;
  return result;
}

- (UIGraphicsImageRenderer)initWithBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  UIGraphicsImageRenderer *v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  +[UIGraphicsImageRendererFormat preferredFormat](UIGraphicsImageRendererFormat, "preferredFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[UIGraphicsImageRenderer initWithBounds:format:](self, "initWithBounds:format:", v8, x, y, width, height);

  return v9;
}

- (UIGraphicsImageRenderer)initWithBounds:(CGRect)bounds format:(UIGraphicsImageRendererFormat *)format
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIGraphicsImageRenderer;
  return -[UIGraphicsRenderer initWithBounds:format:](&v5, sel_initWithBounds_format_, format, bounds.origin.x, bounds.origin.y, bounds.size.width, bounds.size.height);
}

- (UIGraphicsImageRenderer)init
{
  return -[UIGraphicsImageRenderer initWithSize:](self, "initWithSize:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
}

- (NSData)PNGDataWithActions:(UIGraphicsImageDrawingActions)actions
{
  UIGraphicsImageDrawingActions v4;
  UIImage *v5;
  id v6;
  void *v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v4 = actions;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__106;
  v14 = __Block_byref_object_dispose__106;
  v15 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __46__UIGraphicsImageRenderer_PNGDataWithActions___block_invoke;
  v9[3] = &unk_1E16CADB0;
  v9[4] = &v10;
  -[UIGraphicsRenderer runDrawingActions:completionActions:error:](self, "runDrawingActions:completionActions:error:", v4, v9, 0);
  v5 = (UIImage *)v11[5];
  if (v5)
  {
    UIImagePNGRepresentation(v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99D50]);
  }
  v7 = v6;
  _Block_object_dispose(&v10, 8);

  return (NSData *)v7;
}

void __46__UIGraphicsImageRenderer_PNGDataWithActions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "currentImage");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (NSData)JPEGDataWithCompressionQuality:(CGFloat)compressionQuality actions:(UIGraphicsImageDrawingActions)actions
{
  UIGraphicsImageDrawingActions v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v6 = actions;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__106;
  v16 = __Block_byref_object_dispose__106;
  v17 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __66__UIGraphicsImageRenderer_JPEGDataWithCompressionQuality_actions___block_invoke;
  v11[3] = &unk_1E16CADB0;
  v11[4] = &v12;
  -[UIGraphicsRenderer runDrawingActions:completionActions:error:](self, "runDrawingActions:completionActions:error:", v6, v11, 0);
  v7 = (void *)v13[5];
  if (v7)
  {
    _UIImageJPEGRepresentation(v7, 0, compressionQuality);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99D50]);
  }
  v9 = v8;
  _Block_object_dispose(&v12, 8);

  return (NSData *)v9;
}

void __66__UIGraphicsImageRenderer_JPEGDataWithCompressionQuality_actions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "currentImage");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

@end
