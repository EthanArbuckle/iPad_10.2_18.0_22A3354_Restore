@implementation SBApplicationSceneView

- (SBApplicationSceneView)initWithSceneHandle:(id)a3 referenceSize:(CGSize)a4 contentOrientation:(int64_t)a5 containerOrientation:(int64_t)a6 hostRequester:(id)a7
{
  double height;
  double width;
  id v13;
  SBApplicationSceneView *v14;
  void *v15;
  objc_super v17;

  height = a4.height;
  width = a4.width;
  v13 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SBApplicationSceneView;
  v14 = -[SBSceneView initWithSceneHandle:referenceSize:contentOrientation:containerOrientation:hostRequester:](&v17, sel_initWithSceneHandle_referenceSize_contentOrientation_containerOrientation_hostRequester_, v13, a5, a6, a7, width, height);
  if (v14)
  {
    v15 = (void *)objc_msgSend(v13, "newScenePlaceholderContentContextWithActivationSettings:", 0);
    -[SBSceneView setPlaceholderContentContext:](v14, "setPlaceholderContentContext:", v15);

  }
  return v14;
}

- (id)deviceApplicationSceneView
{
  return 0;
}

- (SBApplication)application
{
  void *v2;
  void *v3;

  -[SBSceneView sceneHandle](self, "sceneHandle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "application");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBApplication *)v3;
}

@end
