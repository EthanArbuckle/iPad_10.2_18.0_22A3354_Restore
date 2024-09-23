@implementation SBWindowSelfHostWrapper

+ (id)wrapperForUseInWindow:(id)a3 hostRequester:(id)a4 sceneIdentifier:(id)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a5;
  v9 = a4;
  objc_msgSend(a1, "wrapperForWindow:orientation:hostRequester:sceneIdentifier:", 0, objc_msgSend(a3, "interfaceOrientation"), v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)wrapperForWindow:(id)a3 orientation:(int64_t)a4 hostRequester:(id)a5 sceneIdentifier:(id)a6
{
  UIWindow *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v24;
  CGFloat MinY;
  SBWindowSelfHostWrapper *v26;
  UIScenePresenter *presenter;
  id v28;
  UIWindow *window;
  UIWindow *v30;
  UIScenePresentation *hostView;
  CGAffineTransform v33;
  CGAffineTransform t2;
  CGAffineTransform v35;
  CGAffineTransform v36;
  CGRect v37;
  CGRect v38;

  v9 = (UIWindow *)a3;
  v10 = (void *)MEMORY[0x1E0D22968];
  v11 = a6;
  v12 = a5;
  objc_msgSend(v10, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sceneWithIdentifier:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA930], "targetForUIWindow:", v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "uiPresentationManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "createPresenterForLayerTarget:identifier:", v15, v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "activate");
  objc_msgSend(v17, "presentationView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4 != 1)
  {
    memset(&v36, 0, sizeof(v36));
    if (a4 == 3)
    {
      v19 = 1.57079633;
    }
    else if (a4 == 4)
    {
      v19 = -1.57079633;
    }
    else
    {
      v19 = 3.14159265;
      if (a4 != 2)
        v19 = 0.0;
    }
    CGAffineTransformMakeRotation(&v36, -v19);
    v35 = v36;
    objc_msgSend(v18, "setTransform:", &v35);
    objc_msgSend(v18, "frame");
    x = v37.origin.x;
    y = v37.origin.y;
    width = v37.size.width;
    height = v37.size.height;
    v24 = -CGRectGetMinX(v37);
    v38.origin.x = x;
    v38.origin.y = y;
    v38.size.width = width;
    v38.size.height = height;
    MinY = CGRectGetMinY(v38);
    CGAffineTransformMakeTranslation(&t2, v24, -MinY);
    v33 = v36;
    CGAffineTransformConcat(&v35, &v33, &t2);
    v36 = v35;
    objc_msgSend(v18, "setTransform:", &v35);
  }
  v26 = objc_alloc_init(SBWindowSelfHostWrapper);
  presenter = v26->_presenter;
  v26->_presenter = (UIScenePresenter *)v17;
  v28 = v17;

  window = v26->_window;
  v26->_window = v9;
  v30 = v9;

  hostView = v26->_hostView;
  v26->_hostView = (UIScenePresentation *)v18;

  return v26;
}

- (NSString)requester
{
  return (NSString *)-[UIScenePresenter identifier](self->_presenter, "identifier");
}

- (UIScenePresentationContext)presentationContext
{
  return (UIScenePresentationContext *)-[UIScenePresenter presentationContext](self->_presenter, "presentationContext");
}

- (void)modifyPresentationContext:(id)a3
{
  -[UIScenePresenter modifyPresentationContext:](self->_presenter, "modifyPresentationContext:", a3);
}

- (void)stopHosting
{
  -[UIScenePresenter invalidate](self->_presenter, "invalidate");
}

- (UIWindow)window
{
  return self->_window;
}

- (UIScenePresentation)hostView
{
  return self->_hostView;
}

- (UIScenePresenter)presenter
{
  return self->_presenter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostView, 0);
  objc_storeStrong((id *)&self->_presenter, 0);
  objc_storeStrong((id *)&self->_window, 0);
}

@end
