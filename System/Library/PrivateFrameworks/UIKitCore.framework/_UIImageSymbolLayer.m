@implementation _UIImageSymbolLayer

+ (id)_symbolLayerWithImage:(id)a3 color:(id)a4 offset:(CGPoint)a5 scaleFactor:(double)a6
{
  double y;
  double x;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  y = a5.y;
  x = a5.x;
  v10 = a3;
  v11 = a4;
  v12 = (void *)objc_opt_new();
  if (objc_msgSend(v10, "_isSymbolImage"))
  {
    objc_msgSend(v10, "imageAsset");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAsset:", v13);

    objc_msgSend(v10, "content");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setContent:", v14);

    objc_msgSend(v12, "setColor:", v11);
    objc_msgSend(v12, "setOffset:", x, y);
    objc_msgSend(v12, "setScaleFactor:", a6);
    v15 = v12;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (NSString)name
{
  void *v2;
  void *v3;

  -[_UIImageSymbolLayer asset](self, "asset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "assetName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)isSystemImage
{
  void *v2;
  void *v3;
  char v4;

  -[_UIImageSymbolLayer asset](self, "asset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_assetManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_managingCoreGlyphs");

  return v4;
}

+ (id)_symbolLayerWithSystemName:(id)a3 color:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_symbolLayerWithImage:color:offset:scaleFactor:", v7, v6, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), 1.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)_symbolLayerWithSystemName:(id)a3 color:(id)a4 offset:(CGPoint)a5 scaleFactor:(double)a6
{
  double y;
  double x;
  id v11;
  void *v12;
  void *v13;

  y = a5.y;
  x = a5.x;
  v11 = a4;
  +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_symbolLayerWithImage:color:offset:scaleFactor:", v12, v11, x, y, a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)_symbolLayerWithName:(id)a3 color:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  +[UIImage imageNamed:](UIImage, "imageNamed:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_symbolLayerWithImage:color:offset:scaleFactor:", v7, v6, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), 1.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)_symbolLayerWithName:(id)a3 color:(id)a4 offset:(CGPoint)a5 scaleFactor:(double)a6
{
  double y;
  double x;
  id v11;
  void *v12;
  void *v13;

  y = a5.y;
  x = a5.x;
  v11 = a4;
  +[UIImage imageNamed:](UIImage, "imageNamed:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_symbolLayerWithImage:color:offset:scaleFactor:", v12, v11, x, y, a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
  objc_storeStrong((id *)&self->_color, a3);
}

- (CGPoint)offset
{
  double x;
  double y;
  CGPoint result;

  x = self->_offset.x;
  y = self->_offset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setOffset:(CGPoint)a3
{
  self->_offset = a3;
}

- (double)scaleFactor
{
  return self->_scaleFactor;
}

- (void)setScaleFactor:(double)a3
{
  self->_scaleFactor = a3;
}

- (UIImageAsset)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
  objc_storeStrong((id *)&self->_asset, a3);
}

- (_UIImageCUIVectorGlyphContent)content
{
  return self->_content;
}

- (void)setContent:(id)a3
{
  objc_storeStrong((id *)&self->_content, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_color, 0);
}

@end
