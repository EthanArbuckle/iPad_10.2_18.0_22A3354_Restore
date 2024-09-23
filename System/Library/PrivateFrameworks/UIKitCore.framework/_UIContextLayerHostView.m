@implementation _UIContextLayerHostView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)setAsynchronousRenderingOptions:(id)a3
{
  UISceneAsynchronousRenderingOptions *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  UISceneAsynchronousRenderingOptions *v10;

  v4 = (UISceneAsynchronousRenderingOptions *)a3;
  if (!v4)
    v4 = objc_alloc_init(UISceneAsynchronousRenderingOptions);
  v10 = v4;
  -[_UIContextLayerHostView layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISceneAsynchronousRenderingOptions renderTimes](v10, "renderTimes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAsynchronousRenderTimes:", v6);

  -[_UIContextLayerHostView layer](self, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISceneAsynchronousRenderingOptions renderPeriod](v10, "renderPeriod");
  objc_msgSend(v7, "setAsynchronousRenderPeriod:");

  -[_UIContextLayerHostView layer](self, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISceneAsynchronousRenderingOptions renderMaxAPL](v10, "renderMaxAPL");
  objc_msgSend(v8, "setAsynchronousRenderMaxAPL:");

  -[_UIContextLayerHostView layer](self, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAsynchronousOpaque:", -[UISceneAsynchronousRenderingOptions opaque](v10, "opaque"));

}

- (id)layer
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIContextLayerHostView;
  -[UIView layer](&v3, sel_layer);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setRenderingMode:(unint64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  _UIContextLayerHostView *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (-[_UIContextLayerHostView renderingMode](self, "renderingMode") != a3)
  {
    UIScenePresentationLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      -[_UIContextLayerHostView layer](self, "layer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "contextId");
      NSStringFromUISceneRenderingMode(a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 134218498;
      v11 = self;
      v12 = 1024;
      v13 = v8;
      v14 = 2114;
      v15 = v9;
      _os_log_debug_impl(&dword_185066000, v5, OS_LOG_TYPE_DEBUG, "%p - rendering context %d %{public}@", (uint8_t *)&v10, 0x1Cu);

    }
    -[_UIContextLayerHostView layer](self, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setRendersAsynchronously:", a3 == 1);

  }
}

- (unint64_t)renderingMode
{
  void *v2;
  unint64_t v3;

  -[_UIContextLayerHostView layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "rendersAsynchronously");

  return v3;
}

- (void)setStopsHitTestTransformAccumulation:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)_UIContextLayerHostView;
  -[_UISceneLayerHostView setStopsHitTestTransformAccumulation:](&v6, sel_setStopsHitTestTransformAccumulation_);
  -[_UIContextLayerHostView layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setStopsHitTestTransformAccumulation:", v3);

}

- (void)setResizesHostedContext:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)_UIContextLayerHostView;
  -[_UISceneLayerHostView setResizesHostedContext:](&v6, sel_setResizesHostedContext_);
  -[_UIContextLayerHostView layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setResizesHostedContext:", v3);

}

- (void)setInheritsSecurity:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)_UIContextLayerHostView;
  -[_UISceneLayerHostView setInheritsSecurity:](&v6, sel_setInheritsSecurity_);
  -[_UIContextLayerHostView layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInheritsSecurity:", v3);

}

- (void)willMoveToWindow:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  +[_UISceneHostingGraph sharedInstance](_UISceneHostingGraph, "sharedInstance");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[_UISceneLayerHostView sceneLayer](self, "sceneLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_noteContextID:hostedByWindow:", objc_msgSend(v5, "contextID"), v4);

}

- (_UIContextLayerHostView)initWithSceneLayer:(id)a3
{
  id v4;
  _UIContextLayerHostView *v5;
  _UIContextLayerHostView *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_UIContextLayerHostView;
  v5 = -[_UISceneLayerHostView initWithSceneLayer:](&v10, sel_initWithSceneLayer_, v4);
  v6 = v5;
  if (v5)
  {
    -[_UIContextLayerHostView layer](v5, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setContextId:", objc_msgSend(v4, "contextID"));

    -[_UIContextLayerHostView layer](v6, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setInheritsTiming:", 0);

  }
  return v6;
}

- (UISceneAsynchronousRenderingOptions)asynchronousRenderingOptions
{
  UIMutableSceneAsynchronousRenderingOptions *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc_init(UIMutableSceneAsynchronousRenderingOptions);
  -[_UIContextLayerHostView layer](self, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "asynchronousRenderTimes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIMutableSceneAsynchronousRenderingOptions setRenderTimes:](v3, "setRenderTimes:", v5);

  -[_UIContextLayerHostView layer](self, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "asynchronousRenderPeriod");
  -[UIMutableSceneAsynchronousRenderingOptions setRenderPeriod:](v3, "setRenderPeriod:");

  -[_UIContextLayerHostView layer](self, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "asynchronousRenderMaxAPL");
  -[UIMutableSceneAsynchronousRenderingOptions setRenderMaxAPL:](v3, "setRenderMaxAPL:");

  -[_UIContextLayerHostView layer](self, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIMutableSceneAsynchronousRenderingOptions setOpaque:](v3, "setOpaque:", objc_msgSend(v8, "asynchronousOpaque"));

  return (UISceneAsynchronousRenderingOptions *)v3;
}

- (void)setStopsSecureSuperlayersValidation:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)_UIContextLayerHostView;
  -[_UISceneLayerHostView setStopsSecureSuperlayersValidation:](&v6, sel_setStopsSecureSuperlayersValidation_);
  -[_UIContextLayerHostView layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setStopsSecureSuperlayersValidation:", v3);

}

- (void)_prepareForWindowDealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIContextLayerHostView;
  -[UIView _prepareForWindowDealloc](&v5, sel__prepareForWindowDealloc);
  +[_UISceneHostingGraph sharedInstance](_UISceneHostingGraph, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UISceneLayerHostView sceneLayer](self, "sceneLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_noteContextID:hostedByWindow:", objc_msgSend(v4, "contextID"), 0);

}

@end
