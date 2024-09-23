@implementation _UIImageCIImageContent

- (_UIImageCIImageContent)initWithCIImage:(id)a3 scale:(double)a4
{
  id v8;
  _UIImageCIImageContent *v9;
  _UIImageCIImageContent *v10;
  void *v12;
  objc_super v13;

  v8 = a3;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIImageContent.m"), 1204, CFSTR("Need a ciImage"));

  }
  v13.receiver = self;
  v13.super_class = (Class)_UIImageCIImageContent;
  v9 = -[_UIImageContent initWithScale:](&v13, sel_initWithScale_, a4);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_ciImage, a3);
    v10->_allowHDR = 0;
  }

  return v10;
}

- (_UIImageCIImageContent)initWithScale:(double)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIImageContent.m"), 1219, CFSTR("You need to use -initWithCIImage:scale:"));

  return 0;
}

- (BOOL)isHDR
{
  return self->_allowHDR;
}

- (id)makeSDRVersion
{
  _UIImageCIImageContent *v2;
  _UIImageCIImageContent *v3;
  CIImage *ciImage;
  uint64_t v5;

  v2 = self;
  if (v2->_allowHDR)
  {
    v3 = [_UIImageCIImageContent alloc];
    ciImage = v2->_ciImage;
    -[_UIImageContent scale](v2, "scale");
    v5 = -[_UIImageCIImageContent initWithCIImage:scale:](v3, "initWithCIImage:scale:", ciImage);

    *(_BYTE *)(v5 + 48) = 0;
    v2 = (_UIImageCIImageContent *)v5;
  }
  return v2;
}

- (id)imageRendererFormat
{
  void *v3;

  +[UIGraphicsImageRendererFormat preferredFormat](UIGraphicsImageRendererFormat, "preferredFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_UIImageCIImageContent isHDR](self, "isHDR"))
    objc_msgSend(v3, "setPreferredRange:", 100);
  -[_UIImageContent scale](self, "scale");
  objc_msgSend(v3, "setScale:");
  return v3;
}

- (id)typeName
{
  return CFSTR("CIImage");
}

- (id)CIImage
{
  return self->_ciImage;
}

- (BOOL)isCIImage
{
  return 1;
}

- (BOOL)canScaleImageToTargetResolution
{
  return 1;
}

- (BOOL)canRenderCIImage
{
  double v2;
  double v3;

  -[CIImage extent](self->_ciImage, "extent");
  return v3 > 0.0 && v2 > 0.0;
}

- (CGSize)sizeInPixels
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGSize result;

  -[CIImage extent](self->_ciImage, "extent");
  v3 = v2;
  v5 = v4;
  result.height = v5;
  result.width = v3;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  CIImage **v4;
  BOOL v5;
  objc_super v7;

  v4 = (CIImage **)a3;
  v7.receiver = self;
  v7.super_class = (Class)_UIImageCIImageContent;
  if (-[_UIImageContent isEqual:](&v7, sel_isEqual_, v4))
    v5 = self->_ciImage == v4[5];
  else
    v5 = 0;

  return v5;
}

- (unint64_t)hash
{
  return -[CIImage hash](self->_ciImage, "hash");
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CIImage:%@"), self->_ciImage);
}

- (void)_prepareForDrawingWithSize:(CGSize)a3 scale:(double)a4 inContext:(CGContext *)a5
{
  CGContextTranslateCTM(a5, 0.0, a3.height);
  CGContextScaleCTM(a5, 1.0, -1.0);
}

- (void)_drawWithSize:(CGSize)a3 scale:(double)a4 inContext:(CGContext *)a5 effect:(id)a6
{
  double height;
  double width;
  double x;
  double y;
  double v12;
  double v13;
  CIImage *ciImage;
  void *v15;
  CGFloat v16;
  CGFloat v17;
  void *v18;
  CGImage *v19;
  CGAffineTransform v20;
  CGAffineTransform v21;
  CGRect v22;
  CGRect v23;

  height = a3.height;
  width = a3.width;
  -[CIImage extent](self->_ciImage, "extent", a5, a6, a3.width, a3.height, a4);
  x = v22.origin.x;
  y = v22.origin.y;
  v12 = v22.size.width;
  v13 = v22.size.height;
  if (!CGRectIsInfinite(v22))
  {
    memset(&v21, 0, sizeof(v21));
    CGAffineTransformMakeScale(&v21, width / v12, height / v13);
    ciImage = self->_ciImage;
    v20 = v21;
    -[CIImage imageByApplyingTransform:](ciImage, "imageByApplyingTransform:", &v20);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *MEMORY[0x1E0C9D538];
    v17 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    if (qword_1ECD79550 != -1)
      dispatch_once(&qword_1ECD79550, &__block_literal_global_257_1);
    objc_msgSend(MEMORY[0x1E0C9DD90], "contextWithOptions:", qword_1ECD79548);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (CGImage *)objc_msgSend(v18, "createCGImage:fromRect:", v15, x, y, width, height);

    v23.origin.x = v16;
    v23.origin.y = v17;
    v23.size.width = width;
    v23.size.height = height;
    CGContextDrawImage(a5, v23, v19);
    CGImageRelease(v19);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ciImage, 0);
}

@end
