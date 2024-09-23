@implementation THWSceneView

- (THWSceneView)initWithFrame:(CGRect)a3 options:(id)a4
{
  THWSceneView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)THWSceneView;
  v4 = -[THWSceneView initWithFrame:options:](&v6, "initWithFrame:options:", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v4)
  {
    -[THWSceneView setBackgroundColor:](v4, "setBackgroundColor:", objc_msgSend(+[TSUColor clearColor](TSUColor, "clearColor"), "platformColor"));
    v4->mFnObserving = 0;
    ++dword_543168;
  }
  return v4;
}

- (void)setEventHandlerStickyAxis:(unint64_t)a3
{
  objc_msgSend(-[THWSceneView eventHandler](self, "eventHandler"), "setStickyAxis:", a3);
}

- (void)removeCameraAnimation
{
  id v3;

  v3 = -[THWSceneView p_cameraGroup](self, "p_cameraGroup");
  if (self->mFnObserving)
  {
    objc_msgSend(-[THWSceneView renderer](self, "renderer"), "removeObserver:forKeyPath:", self, CFSTR("pointOfView"));
    self->mFnObserving = 0;
  }
  if (objc_msgSend(v3, "hasContinuousRotationAnimation"))
    objc_msgSend(v3, "removeContinuousRotationAnimations");
}

- (void)dealloc
{
  objc_super v3;

  -[THWSceneView removeCameraAnimation](self, "removeCameraAnimation");
  if (dword_543168 < 1)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWSceneView dealloc]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Scene/THWSceneView.m"), 104, CFSTR("gSceneViewCount went negative. Look out for zombies."));
  else
    --dword_543168;
  v3.receiver = self;
  v3.super_class = (Class)THWSceneView;
  -[THWSceneView dealloc](&v3, "dealloc");
}

- (void)scnWarmUpScene:(id)a3 abortHandler:(id)a4
{
  objc_msgSend(-[THWSceneView renderer](self, "renderer"), "prepareObject:shouldAbortBlock:", a3, a4);
}

- (void)setScene:(id)a3
{
  id v4;
  double v5;
  double v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)THWSceneView;
  -[THWSceneView setScene:](&v7, "setScene:", a3);
  v4 = objc_msgSend(-[THWSceneView pointOfView](self, "pointOfView"), "camera");
  objc_msgSend(v4, "xFov");
  if (v5 != 0.0)
  {
    objc_msgSend(v4, "yFov");
    if (v6 != 0.0)
      objc_msgSend(v4, "setXFov:", 0.0);
  }
}

- (id)p_cameraGroup
{
  return objc_msgSend(objc_msgSend(-[THWSceneView scene](self, "scene"), "rootNode"), "childNodeWithName:recursively:", CFSTR("THRotationGroupName"), 0);
}

- (id)p_duplicateCameraAndAddToGroupAtSceneCenter
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  float32x2_t v7;
  float v8;
  float v9;
  id v10;
  id v11;
  void *v12;
  SCNNode *v13;
  id v14;
  double v15;
  double v16;
  double v18;
  _OWORD v19[7];
  __int128 v20;
  float32x2_t v21;
  float v22;
  float32x2_t v23;
  float v24;

  v3 = -[THWSceneView pointOfView](self, "pointOfView");
  if (v3
    || (v11 = objc_msgSend(objc_msgSend(-[THWSceneView scene](self, "scene"), "rootNode"), "childNodesWithCamera")) != 0
    && (v12 = v11, objc_msgSend(v11, "count"))
    && (v3 = objc_msgSend(v12, "objectAtIndex:", 0)) != 0)
  {
    v24 = 0.0;
    v23 = 0;
    v22 = 0.0;
    v21 = 0;
    if (objc_msgSend(objc_msgSend(-[THWSceneView scene](self, "scene"), "rootNode"), "getBoundingBoxMin:max:", &v23, &v21))
    {
      v7 = vmul_f32(vadd_f32(v23, v21), (float32x2_t)0x3F0000003F000000);
      v8 = (float)(v24 + v22) * 0.5;
      v9 = v7.f32[1];
      v10 = objc_msgSend(v3, "copy", *(_QWORD *)&v7, v6);
    }
    else
    {
      LODWORD(v4) = 0;
      v9 = 0.0;
      v8 = 0.0;
      v10 = objc_msgSend(v3, "copy", v4, v5);
    }
    v14 = v10;
    v13 = +[SCNNode node](SCNNode, "node");
    -[SCNNode addChildNode:](v13, "addChildNode:", v14);
    -[SCNNode setName:](v13, "setName:", CFSTR("THRotationGroupName"));
    *(float *)&v15 = v9;
    *(float *)&v16 = v8;
    -[SCNNode setPosition:](v13, "setPosition:", v18, v15, v16);
    objc_msgSend(v3, "worldTransform");
    *(float *)&v20 = *(float *)&v20 - *(float *)&v18;
    *((float *)&v20 + 1) = *((float *)&v20 + 1) - v9;
    *((float *)&v20 + 2) = *((float *)&v20 + 2) - v8;
    v19[0] = v19[4];
    v19[1] = v19[5];
    v19[2] = v19[6];
    v19[3] = v20;
    objc_msgSend(v14, "setTransform:", v19);
  }
  else
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWSceneView p_duplicateCameraAndAddToGroupAtSceneCenter]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Scene/THWSceneView.m"), 177, CFSTR("SceneView has nil point of view"));
    return 0;
  }
  return v13;
}

- (void)rotateCameraContinuously
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;

  v3 = -[THWSceneView p_cameraGroup](self, "p_cameraGroup");
  if (!v3)
  {
    v3 = -[THWSceneView p_duplicateCameraAndAddToGroupAtSceneCenter](self, "p_duplicateCameraAndAddToGroupAtSceneCenter");
    objc_msgSend(objc_msgSend(-[THWSceneView scene](self, "scene"), "rootNode"), "addChildNode:", v3);
  }
  LODWORD(v4) = 0;
  LODWORD(v5) = 1.0;
  LODWORD(v6) = 0;
  LODWORD(v7) = 0;
  objc_msgSend(v3, "addContinuousRotationWithInitialRotation:", v4, v5, v6, v7);
  -[THWSceneView setPointOfView:](self, "setPointOfView:", objc_msgSend(objc_msgSend(v3, "childNodes"), "objectAtIndex:", 0));
  if (!self->mFnObserving)
  {
    objc_msgSend(-[THWSceneView renderer](self, "renderer"), "addObserver:forKeyPath:options:context:", self, CFSTR("pointOfView"), 0, 0);
    self->mFnObserving = 1;
  }
}

- (void)rotateCameraContinuouslyWithEaseIn
{
  id v3;

  v3 = -[THWSceneView p_cameraGroup](self, "p_cameraGroup");
  if (!v3)
  {
    v3 = -[THWSceneView p_duplicateCameraAndAddToGroupAtSceneCenter](self, "p_duplicateCameraAndAddToGroupAtSceneCenter");
    objc_msgSend(objc_msgSend(-[THWSceneView scene](self, "scene"), "rootNode"), "addChildNode:", v3);
  }
  objc_msgSend(v3, "addContinuousRotationWithEaseIn");
  -[THWSceneView setPointOfView:](self, "setPointOfView:", objc_msgSend(objc_msgSend(v3, "childNodes"), "objectAtIndex:", 0));
  if (!self->mFnObserving)
  {
    objc_msgSend(-[THWSceneView renderer](self, "renderer"), "addObserver:forKeyPath:options:context:", self, CFSTR("pointOfView"), 0, 0);
    self->mFnObserving = 1;
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  objc_super v11;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("pointOfView"))
    && -[THWSceneView renderer](self, "renderer") == a4)
  {
    -[THWSceneView removeCameraAnimation](self, "removeCameraAnimation");
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)THWSceneView;
    -[THWSceneView observeValueForKeyPath:ofObject:change:context:](&v11, "observeValueForKeyPath:ofObject:change:context:", a3, a4, a5, a6);
  }
}

@end
