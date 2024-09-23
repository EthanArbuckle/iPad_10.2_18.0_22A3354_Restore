@implementation _UIStackedImageSingleNamedStack

- (NSString)name
{
  return (NSString *)CFSTR("single image stack");
}

- (NSArray)layers
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  -[_UIStackedImageSingleNamedStack layerImage](self, "layerImage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (CGSize)size
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  -[_UIStackedImageSingleNamedStack layerImage](self, "layerImage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageObj");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "size");
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (double)scale
{
  return 1.0;
}

- (CGImage)flattenedImage
{
  void *v2;
  id v3;
  CGImage *v4;

  -[_UIStackedImageSingleNamedStack layerImage](self, "layerImage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageObj");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = (CGImage *)objc_msgSend(v3, "CGImage");

  return v4;
}

- (_UIStackedImageSingleNamedLayerImage)layerImage
{
  return self->_layerImage;
}

- (void)setLayerImage:(id)a3
{
  objc_storeStrong((id *)&self->_layerImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layerImage, 0);
}

@end
