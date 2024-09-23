@implementation VUIImageBackgroundColorDecorator

- (VUIImageBackgroundColorDecorator)initWithBackgroundColor:(id)a3 andSize:(CGSize)a4
{
  CGFloat height;
  CGFloat width;
  id v8;
  VUIImageBackgroundColorDecorator *v9;
  VUIImageBackgroundColorDecorator *v10;
  objc_super v12;

  height = a4.height;
  width = a4.width;
  v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)VUIImageBackgroundColorDecorator;
  v9 = -[VUIImageBackgroundColorDecorator init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_backgroundColor, a3);
    v10->_size.width = width;
    v10->_size.height = height;
  }

  return v10;
}

- (CGSize)loaderScaleToSize
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)loaderCropToFit
{
  return 0;
}

- (CGSize)expectedSize
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (id)decoratorIdentifier
{
  id v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v6 = 0;
  v7 = 0;
  v5 = 0;
  v4 = 0;
  -[UIColor getRed:green:blue:alpha:](self->_backgroundColor, "getRed:green:blue:alpha:", &v7, &v6, &v5, &v4);
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  return (id)objc_msgSend(v2, "initWithFormat:", CFSTR("_bc(%.1f,%.1f,%.1f,%.1f)"), v7, v6, v5, v4);
}

- (id)decorate:(id)a3 scaledWithSize:(CGSize)a4 croppedToFit:(BOOL)a5
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *);
  void *v20;
  VUIImageBackgroundColorDecorator *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  double v26;

  v6 = a3;
  +[VUIGraphicsImageRenderer preferredFormat](VUIGraphicsImageRenderer, "preferredFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uiImage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "size");
  v10 = v9;
  v12 = v11;

  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __73__VUIImageBackgroundColorDecorator_decorate_scaledWithSize_croppedToFit___block_invoke;
  v20 = &unk_1E9F2C6D0;
  v23 = 0;
  v24 = 0;
  v25 = v10;
  v26 = v12;
  v21 = self;
  v22 = v6;
  v13 = v6;
  +[VUIGraphicsImageRenderer imageWithSize:format:actions:](VUIGraphicsImageRenderer, "imageWithSize:format:actions:", v7, &v17, v10, v12);
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  +[VUIImage imageWithCGImageRef:preserveAlpha:](VUIImage, "imageWithCGImageRef:preserveAlpha:", objc_msgSend(v14, "CGImage", v17, v18, v19, v20, v21), 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

void __73__VUIImageBackgroundColorDecorator_decorate_scaledWithSize_croppedToFit___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  CGContext *v4;
  id v5;

  v3 = a2;
  CGContextSetFillColorWithColor((CGContextRef)objc_msgSend(v3, "CGContext"), (CGColorRef)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "CGColor"));
  v4 = (CGContext *)objc_msgSend(v3, "CGContext");

  CGContextFillRect(v4, *(CGRect *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 40), "uiImage");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "drawInRect:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "decoratorIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIImageBackgroundColorDecorator decoratorIdentifier](self, "decoratorIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToString:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end
