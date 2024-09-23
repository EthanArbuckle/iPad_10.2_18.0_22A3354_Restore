@implementation VKCImageSubjectContextInstance

- (void)dealloc
{
  objc_super v3;

  CGImageRelease(self->_orientedMaskImage);
  CGImageRelease(self->_maskImage);
  v3.receiver = self;
  v3.super_class = (Class)VKCImageSubjectContextInstance;
  -[VKCImageSubjectContextInstance dealloc](&v3, sel_dealloc);
}

- (VKCImageSubjectContextInstance)init
{
  VKCImageSubjectContextInstance *result;
  CGPoint v3;
  CGSize v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VKCImageSubjectContextInstance;
  result = -[VKCImageSubjectContextInstance init](&v5, sel_init);
  if (result)
  {
    v3 = (CGPoint)*MEMORY[0x1E0C9D628];
    v4 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
    result->_cachedNormalizedPathContentsRect.origin = (CGPoint)*MEMORY[0x1E0C9D628];
    result->_cachedNormalizedPathContentsRect.size = v4;
    result->_cachedTopLevelNormalizedPathContentsRect.origin = v3;
    result->_cachedTopLevelNormalizedPathContentsRect.size = v4;
  }
  return result;
}

- (void)setOrientedMaskImage:(CGImage *)a3
{
  CGImage *orientedMaskImage;

  orientedMaskImage = self->_orientedMaskImage;
  if (orientedMaskImage != a3)
  {
    CGImageRelease(orientedMaskImage);
    self->_orientedMaskImage = a3;
    CGImageRetain(a3);
  }
}

- (void)setMaskImage:(CGImage *)a3
{
  CGImage *maskImage;

  maskImage = self->_maskImage;
  if (maskImage != a3)
  {
    CGImageRelease(maskImage);
    self->_maskImage = a3;
    CGImageRetain(a3);
  }
}

- (id)normalizedSubjectPathWithContentsRect:(CGRect)a3 topLevelOnly:(BOOL)a4
{
  _BOOL4 v4;
  double height;
  double width;
  double y;
  double x;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  _BYTE v28[48];
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;

  v4 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (a4)
  {
    -[VKCImageSubjectContextInstance cachedTopLevelNormalizedPathContentsRect](self, "cachedTopLevelNormalizedPathContentsRect");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    -[VKCImageSubjectContextInstance cachedTopLevelNormalizedPath](self, "cachedTopLevelNormalizedPath");
  }
  else
  {
    -[VKCImageSubjectContextInstance cachedNormalizedPathContentsRect](self, "cachedNormalizedPathContentsRect");
    v11 = v18;
    v13 = v19;
    v15 = v20;
    v17 = v21;
    -[VKCImageSubjectContextInstance cachedNormalizedPath](self, "cachedNormalizedPath");
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v29.origin.x = x;
  v29.origin.y = y;
  v29.size.width = width;
  v29.size.height = height;
  if (CGRectIsNull(v29))
    goto LABEL_7;
  v30.origin.x = v11;
  v30.origin.y = v13;
  v30.size.width = v15;
  v30.size.height = v17;
  v32.origin.x = x;
  v32.origin.y = y;
  v32.size.width = width;
  v32.size.height = height;
  if (!CGRectEqualToRect(v30, v32) || (v23 = v22) == 0)
  {
LABEL_7:
    if (v4)
      -[VKCImageSubjectContextInstance baseTopLevelNormalizedSubjectPath](self, "baseTopLevelNormalizedSubjectPath");
    else
      -[VKCImageSubjectContextInstance baseNormalizedSubjectPath](self, "baseNormalizedSubjectPath");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (id)objc_msgSend(v24, "copy");
    v31.origin.x = x;
    v31.origin.y = y;
    v31.size.width = width;
    v31.size.height = height;
    v33.origin.x = 0.0;
    v33.origin.y = 0.0;
    v33.size.width = 1.0;
    v33.size.height = 1.0;
    if (!CGRectEqualToRect(v31, v33))
    {
      v25 = (void *)objc_msgSend(v23, "copy");

      objc_msgSend(v25, "vk_applyTransform:", v28, VKMTransformConvertingRectToRect((uint64_t)v28, 0.0, 1.0, 1.0, x, y, width, height));
      v23 = v25;
    }
    if (v4)
    {
      -[VKCImageSubjectContextInstance setCachedTopLevelNormalizedPathContentsRect:](self, "setCachedTopLevelNormalizedPathContentsRect:", x, y, width, height);
      -[VKCImageSubjectContextInstance setCachedTopLevelNormalizedPath:](self, "setCachedTopLevelNormalizedPath:", v23);
    }
    else
    {
      -[VKCImageSubjectContextInstance setCachedNormalizedPathContentsRect:](self, "setCachedNormalizedPathContentsRect:", x, y, width, height);
      -[VKCImageSubjectContextInstance setCachedNormalizedPath:](self, "setCachedNormalizedPath:", v23);
    }

  }
  v26 = (void *)objc_msgSend(v23, "copy");

  return v26;
}

- (CGImage)orientedMaskImage
{
  return self->_orientedMaskImage;
}

- (CGImage)maskImage
{
  return self->_maskImage;
}

- (UIBezierPath)baseNormalizedSubjectPath
{
  return self->_baseNormalizedSubjectPath;
}

- (void)setBaseNormalizedSubjectPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (UIBezierPath)baseTopLevelNormalizedSubjectPath
{
  return self->_baseTopLevelNormalizedSubjectPath;
}

- (void)setBaseTopLevelNormalizedSubjectPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (UIBezierPath)cachedNormalizedPath
{
  return self->_cachedNormalizedPath;
}

- (void)setCachedNormalizedPath:(id)a3
{
  objc_storeStrong((id *)&self->_cachedNormalizedPath, a3);
}

- (CGRect)cachedNormalizedPathContentsRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_cachedNormalizedPathContentsRect.origin.x;
  y = self->_cachedNormalizedPathContentsRect.origin.y;
  width = self->_cachedNormalizedPathContentsRect.size.width;
  height = self->_cachedNormalizedPathContentsRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setCachedNormalizedPathContentsRect:(CGRect)a3
{
  self->_cachedNormalizedPathContentsRect = a3;
}

- (UIBezierPath)cachedTopLevelNormalizedPath
{
  return self->_cachedTopLevelNormalizedPath;
}

- (void)setCachedTopLevelNormalizedPath:(id)a3
{
  objc_storeStrong((id *)&self->_cachedTopLevelNormalizedPath, a3);
}

- (CGRect)cachedTopLevelNormalizedPathContentsRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_cachedTopLevelNormalizedPathContentsRect.origin.x;
  y = self->_cachedTopLevelNormalizedPathContentsRect.origin.y;
  width = self->_cachedTopLevelNormalizedPathContentsRect.size.width;
  height = self->_cachedTopLevelNormalizedPathContentsRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setCachedTopLevelNormalizedPathContentsRect:(CGRect)a3
{
  self->_cachedTopLevelNormalizedPathContentsRect = a3;
}

- (CGSize)imageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_imageSize.width;
  height = self->_imageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setImageSize:(CGSize)a3
{
  self->_imageSize = a3;
}

- (unint64_t)madIndex
{
  return self->_madIndex;
}

- (void)setMadIndex:(unint64_t)a3
{
  self->_madIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedTopLevelNormalizedPath, 0);
  objc_storeStrong((id *)&self->_cachedNormalizedPath, 0);
  objc_storeStrong((id *)&self->_baseTopLevelNormalizedSubjectPath, 0);
  objc_storeStrong((id *)&self->_baseNormalizedSubjectPath, 0);
}

@end
