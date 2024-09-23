@implementation _SBDefaultSceneEntityFrameProvider

- (_SBDefaultSceneEntityFrameProvider)initWithWindowScene:(id)a3
{
  id v4;
  _SBDefaultSceneEntityFrameProvider *v5;
  _SBDefaultSceneEntityFrameProvider *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_SBDefaultSceneEntityFrameProvider;
  v5 = -[_SBDefaultSceneEntityFrameProvider init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_windowScene, v4);

  return v6;
}

- (CGRect)sceneEntityFrameForWorkspaceEntity:(id)a3 inLayoutState:(id)a4
{
  id WeakRetained;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect result;

  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  objc_msgSend(WeakRetained, "_fbsDisplayConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (SBWindowScene)windowScene
{
  return (SBWindowScene *)objc_loadWeakRetained((id *)&self->_windowScene);
}

- (void)setWindowScene:(id)a3
{
  objc_storeWeak((id *)&self->_windowScene, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_windowScene);
}

@end
