@implementation _TUIDrawLayerConfig

- (_TUIDrawLayerConfig)initWithDraw:(id)a3 contentsScale:(double)a4 renderMode:(unint64_t)a5
{
  id v9;
  _TUIDrawLayerConfig *v10;
  _TUIDrawLayerConfig *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_TUIDrawLayerConfig;
  v10 = -[_TUIDrawLayerConfig init](&v13, "init");
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_draw, a3);
    v11->_contentsScale = a4;
    v11->_renderMode = a5;
  }

  return v11;
}

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  return +[_TUIAnimationState animationForLayer:forKey:](_TUIAnimationState, "animationForLayer:forKey:", a3, a4);
}

- (void)dynamicUserInterfaceTraitDidChangeForLayer:(id)a3
{
  objc_msgSend(a3, "setNeedsDisplay");
}

- (void)configureLayer:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  const CALayerContentsFormat *v16;
  id v17;
  id v18;

  v18 = a3;
  objc_msgSend(v18, "setContentsScale:", self->_contentsScale);
  objc_msgSend(v18, "setRasterizationScale:", self->_contentsScale);
  if (self->_renderMode == 1)
    objc_msgSend(v18, "setGeometryFlipped:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "compositingFilter"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelDraw compositingFilter](self->_draw, "compositingFilter"));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "type"));
  if (v4 == (void *)v6)
  {

  }
  else
  {
    v7 = (void *)v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "compositingFilter"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelDraw compositingFilter](self->_draw, "compositingFilter"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "type"));
    v11 = objc_msgSend(v8, "isEqual:", v10);

    if ((v11 & 1) != 0)
      goto LABEL_8;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelDraw compositingFilter](self->_draw, "compositingFilter"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "type"));
    objc_msgSend(v18, "setCompositingFilter:", v5);
  }

LABEL_8:
  if ((objc_opt_respondsToSelector(self->_draw, "enableContext") & 1) != 0)
    v12 = -[TUIRenderModelDraw enableContext](self->_draw, "enableContext");
  else
    v12 = 0;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v12));
  objc_msgSend(v18, "setValue:forKeyPath:", v13, CFSTR("separatedOptions.enableContext"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelDraw shadingColor](self->_draw, "shadingColor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "colorWithAlphaComponent:", 1.0));

  v16 = (const CALayerContentsFormat *)&kCAContentsFormatA8;
  if (!v15)
    v16 = &kCAContentsFormatRGBA8Uint;
  objc_msgSend(v18, "setContentsFormat:", *v16);
  v17 = objc_retainAutorelease(v15);
  objc_msgSend(v18, "setContentsMultiplyColor:", objc_msgSend(v17, "CGColor"));
  objc_msgSend(v18, "setNeedsDisplay");

}

- (void)configureDelegate:(id)a3
{
  objc_msgSend(a3, "setDelegate:", self);
}

- (BOOL)isEqualToConfig:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  _TUIDrawLayerConfig *v7;
  _TUIDrawLayerConfig *v8;
  unsigned __int8 v9;

  v4 = a3;
  v5 = objc_opt_class(v4);
  if (v5 == objc_opt_class(self))
    v6 = v4;
  else
    v6 = 0;
  v7 = v6;
  v8 = v7;
  if (v7 == self)
  {
    v9 = 1;
  }
  else if (v7)
  {
    v9 = -[TUIRenderModelDraw isEqualToDraw:](self->_draw, "isEqualToDraw:", v7->_draw);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (Class)layerClass
{
  return (Class)objc_opt_class(CALayer, a2);
}

- (Class)layerClassForSize:(CGSize)a3
{
  uint64_t v4;
  void *v5;

  if (a3.width <= 8192.0 && a3.height <= 8192.0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIDrawLayerConfig layerClass](self, "layerClass", 8192.0, a3.height));
  }
  else
  {
    v4 = objc_opt_class(CATiledLayer);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  }
  return (Class)v5;
}

- (void)drawLayer:(id)a3 inContext:(CGContext *)a4
{
  CGFloat v6;
  CGFloat v7;

  objc_msgSend(a3, "bounds");
  CGContextTranslateCTM(a4, v6, v7);
  -[TUIRenderModelDraw drawInContext:](self->_draw, "drawInContext:", a4);
}

- (BOOL)reuseLayerForBoundsChange
{
  return 0;
}

- (BOOL)clipContainerForCrossfade
{
  if ((objc_opt_respondsToSelector(self->_draw, "clipContainerForCrossfade") & 1) != 0)
    return -[TUIRenderModelDraw clipContainerForCrossfade](self->_draw, "clipContainerForCrossfade");
  else
    return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_draw, 0);
}

@end
