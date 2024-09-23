@implementation _TUISymbolImageLayerConfig

- (_TUISymbolImageLayerConfig)initWithContentsScale:(double)a3 image:(id)a4 color:(id)a5 hflip:(BOOL)a6 blendMode:(id)a7
{
  id v13;
  id v14;
  id v15;
  _TUISymbolImageLayerConfig *v16;
  _TUISymbolImageLayerConfig *v17;
  NSString *v18;
  NSString *blendMode;
  objc_super v21;

  v13 = a4;
  v14 = a5;
  v15 = a7;
  v21.receiver = self;
  v21.super_class = (Class)_TUISymbolImageLayerConfig;
  v16 = -[_TUISymbolImageLayerConfig init](&v21, "init");
  v17 = v16;
  if (v16)
  {
    v16->_contentsScale = a3;
    objc_storeStrong((id *)&v16->_image, a4);
    objc_storeStrong((id *)&v17->_color, a5);
    v17->_hflip = a6;
    v18 = (NSString *)objc_msgSend(v15, "copy");
    blendMode = v17->_blendMode;
    v17->_blendMode = v18;

  }
  return v17;
}

- (BOOL)isEqualToConfig:(id)a3
{
  _TUISymbolImageLayerConfig *v4;
  _TUISymbolImageLayerConfig *v5;
  uint64_t v6;
  _QWORD *v7;
  unsigned __int8 v8;
  uint64_t v10;
  id v11;
  uint64_t v12;
  TUISymbolImage *image;
  UIColor *color;
  NSString *blendMode;

  v4 = (_TUISymbolImageLayerConfig *)a3;
  v5 = v4;
  if (self == v4)
  {
    v8 = 1;
    goto LABEL_7;
  }
  v6 = objc_opt_class(v4);
  if (v6 == objc_opt_class(self))
  {
    v10 = objc_opt_class(_TUISymbolImageLayerConfig);
    v11 = TUIDynamicCast(v10, v5);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    v7 = (_QWORD *)v12;
    if (v12)
    {
      if (self->_contentsScale == *(double *)(v12 + 8) && self->_hflip == *(unsigned __int8 *)(v12 + 32))
      {
        image = self->_image;
        if (image == (TUISymbolImage *)v7[2] || -[TUISymbolImage isEqual:](image, "isEqual:"))
        {
          color = self->_color;
          if (color == (UIColor *)v7[3] || -[UIColor isEqual:](color, "isEqual:"))
          {
            blendMode = self->_blendMode;
            if (blendMode == (NSString *)v7[5])
              v8 = 1;
            else
              v8 = -[NSString isEqual:](blendMode, "isEqual:");
            goto LABEL_5;
          }
        }
      }
    }
  }
  else
  {
    v7 = 0;
  }
  v8 = 0;
LABEL_5:

LABEL_7:
  return v8;
}

- (void)configureLayer:(id)a3
{
  double contentsScale;
  id v5;
  id v6;

  contentsScale = self->_contentsScale;
  v5 = a3;
  objc_msgSend(v5, "setContentsScale:", contentsScale);
  objc_msgSend(v5, "setFlipsHorizontalAxis:", self->_hflip);
  objc_msgSend(v5, "updateContentAndBoundsWithImage:color:", self->_image, self->_color);
  v6 = (id)objc_claimAutoreleasedReturnValue(-[_TUISymbolImageLayerConfig compositingFilter](self, "compositingFilter"));
  objc_msgSend(v5, "setContentCompositingFilter:", v6);

}

- (void)dynamicUserInterfaceTraitDidChangeForLayer:(id)a3
{
  objc_msgSend(a3, "updateContentAndBoundsWithImage:color:", self->_image, self->_color);
}

- (void)configureBounds:(id)a3
{
  objc_msgSend(a3, "updateContentAndBoundsWithImage:color:", self->_image, self->_color);
}

- (BOOL)reuseLayerForBoundsChange
{
  return 1;
}

- (Class)layerClass
{
  return (Class)objc_opt_class(_TUISymbolImageLayer, a2);
}

- (id)compositingFilter
{
  void *v2;

  if (self->_blendMode)
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](CAFilter, "filterWithType:"));
  else
    v2 = 0;
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blendMode, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
