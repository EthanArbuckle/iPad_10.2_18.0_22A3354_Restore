@implementation _UISceneLayerHostView

- (FBSceneLayer)sceneLayer
{
  return self->_sceneLayer;
}

- (UITransformer)transformer
{
  return self->_transformer;
}

- (void)setStopsHitTestTransformAccumulation:(BOOL)a3
{
  self->_stopsHitTestTransformAccumulation = a3;
}

- (void)setTransformer:(id)a3
{
  objc_storeStrong((id *)&self->_transformer, a3);
}

- (void)setResizesHostedContext:(BOOL)a3
{
  self->_resizesHostedContext = a3;
}

- (void)setInheritsSecurity:(BOOL)a3
{
  self->_inheritsSecurity = a3;
}

- (void)setCurrentPresentationContext:(id)a3
{
  objc_storeStrong((id *)&self->_currentPresentationContext, a3);
}

- (_UISceneLayerHostView)initWithSceneLayer:(id)a3
{
  id v6;
  _UISceneLayerHostView *v7;
  _UISceneLayerHostView *v8;
  void *v9;
  void *v11;
  objc_super v12;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISceneLayerHostView.m"), 36, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sceneLayer"));

  }
  v12.receiver = self;
  v12.super_class = (Class)_UISceneLayerHostView;
  v7 = -[UIView initWithFrame:](&v12, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_sceneLayer, a3);
    -[UIView setClipsToBounds:](v8, "setClipsToBounds:", 1);
    -[UIView layer](v8, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setEdgeAntialiasingMask:", 0);

  }
  return v8;
}

- (UIScenePresentationContext)currentPresentationContext
{
  return self->_currentPresentationContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentPresentationContext, 0);
  objc_storeStrong((id *)&self->_presentationContext, 0);
  objc_storeStrong((id *)&self->_transformer, 0);
  objc_storeStrong((id *)&self->_sceneLayer, 0);
}

- (_UISceneLayerHostView)initWithFrame:(CGRect)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISceneLayerHostView.m"), 31, CFSTR("initWithFrame is unavailable."));

  return 0;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  _UISceneLayerHostView *v5;
  _UISceneLayerHostView *v6;
  _UISceneLayerHostView *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_UISceneLayerHostView;
  -[UIView hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (_UISceneLayerHostView *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == self)
    v5 = 0;
  v7 = v5;

  return v7;
}

- (BOOL)inheritsSecurity
{
  return self->_inheritsSecurity;
}

- (BOOL)resizesHostedContext
{
  return self->_resizesHostedContext;
}

- (BOOL)stopsHitTestTransformAccumulation
{
  return self->_stopsHitTestTransformAccumulation;
}

- (BOOL)stopsSecureSuperlayersValidation
{
  return self->_stopsSecureSuperlayersValidation;
}

- (void)setStopsSecureSuperlayersValidation:(BOOL)a3
{
  self->_stopsSecureSuperlayersValidation = a3;
}

@end
