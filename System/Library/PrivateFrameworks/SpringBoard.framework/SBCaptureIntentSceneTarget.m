@implementation SBCaptureIntentSceneTarget

- (SBCaptureIntentSceneTarget)initWithScene:(id)a3 andCaptureApplication:(id)a4
{
  id v7;
  id v8;
  SBCaptureIntentSceneTarget *v9;
  SBCaptureIntentSceneTarget *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBCaptureIntentSceneTarget;
  v9 = -[SBCaptureIntentSceneTarget init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_scene, a3);
    objc_storeStrong((id *)&v10->_captureApplication, a4);
  }

  return v10;
}

- (FBScene)scene
{
  return self->_scene;
}

- (LCSCaptureApplicationDescribing)captureApplication
{
  return self->_captureApplication;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_captureApplication, 0);
  objc_storeStrong((id *)&self->_scene, 0);
}

@end
