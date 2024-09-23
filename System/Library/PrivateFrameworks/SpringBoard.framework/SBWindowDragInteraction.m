@implementation SBWindowDragInteraction

- (SBWindowDragInteraction)initWithDelegate:(id)a3 gestureRecognizer:(id)a4
{
  id v6;
  SBWindowDragInteraction *v7;
  SBWindowDragInteraction *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)SBWindowDragInteraction;
  v7 = -[UIDragInteraction initWithDelegate:](&v10, sel_initWithDelegate_, a3);
  v8 = v7;
  if (v7)
    objc_storeWeak((id *)&v7->_gestureRecognizer, v6);

  return v8;
}

- (CGPoint)_locationInView:(id)a3
{
  UIGestureRecognizer **p_gestureRecognizer;
  id v4;
  id WeakRetained;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGPoint result;

  p_gestureRecognizer = &self->_gestureRecognizer;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_gestureRecognizer);
  objc_msgSend(WeakRetained, "locationInView:", v4);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

- (UIGestureRecognizer)gestureRecognizer
{
  return (UIGestureRecognizer *)objc_loadWeakRetained((id *)&self->_gestureRecognizer);
}

- (SBAppPlatterDragSourceViewProviding)sourceViewProvider
{
  return (SBAppPlatterDragSourceViewProviding *)objc_loadWeakRetained((id *)&self->_sourceViewProvider);
}

- (void)setSourceViewProvider:(id)a3
{
  objc_storeWeak((id *)&self->_sourceViewProvider, a3);
}

- (NSString)sceneIdentifier
{
  return self->_sceneIdentifier;
}

- (void)setSceneIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_sceneIdentifier, a3);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_sceneIdentifier, 0);
  objc_destroyWeak((id *)&self->_sourceViewProvider);
  objc_destroyWeak((id *)&self->_gestureRecognizer);
}

@end
