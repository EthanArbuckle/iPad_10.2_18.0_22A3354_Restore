@implementation _UIStackedImageSingleNamedLayerImage

- (NSString)name
{
  return (NSString *)CFSTR("single image");
}

- (CGRect)frame
{
  double v2;
  double v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGRect result;

  v2 = *MEMORY[0x1E0C9D538];
  v3 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  -[_UIStackedImageSingleNamedLayerImage imageObj](self, "imageObj");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "size");
  v6 = v5;
  v8 = v7;

  v9 = v2;
  v10 = v3;
  v11 = v6;
  v12 = v8;
  result.size.height = v12;
  result.size.width = v11;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

- (double)opacity
{
  return 1.0;
}

- (int)blendMode
{
  return 0;
}

- (UIImage)imageObj
{
  return self->_imageObj;
}

- (void)setImageObj:(id)a3
{
  objc_storeStrong((id *)&self->_imageObj, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageObj, 0);
}

@end
