@implementation PRUISAmbientPosterSceneLayerHostView

- (PRUISAmbientPosterSceneLayerHostView)initWithIdentifier:(id)a3
{
  id v4;
  PRUISAmbientPosterSceneLayerHostView *v5;
  uint64_t v6;
  NSString *identifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PRUISAmbientPosterSceneLayerHostView;
  v5 = -[PRUISAmbientPosterSceneLayerHostView initWithFrame:](&v9, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

  }
  return v5;
}

- (BOOL)isActive
{
  return -[UIScenePresenter isActive](self->_presenter, "isActive");
}

- (void)setActive:(BOOL)a3
{
  _BOOL4 v3;
  UIScenePresenter *presenter;

  v3 = a3;
  if (-[PRUISAmbientPosterSceneLayerHostView isActive](self, "isActive") != a3)
  {
    presenter = self->_presenter;
    if (v3)
      -[UIScenePresenter activate](presenter, "activate");
    else
      -[UIScenePresenter deactivate](presenter, "deactivate");
  }
}

- (BOOL)setContextID:(unsigned int)a3 scene:(id)a4
{
  FBScene *v7;
  FBScene *v8;
  FBScene **p_scene;
  UIView *sceneLayerView;
  UIScenePresenter *presenter;
  void *v12;
  void *v13;
  void *v14;
  UIScenePresenter *v15;
  UIScenePresenter *v16;
  UIView *v17;
  UIView *v18;
  UIView *v19;
  BOOL v20;

  v7 = (FBScene *)a4;
  v8 = v7;
  if (self->_sceneLayerContextID == a3 && self->_scene == v7)
  {
    v20 = 0;
  }
  else
  {
    self->_sceneLayerContextID = a3;
    p_scene = &self->_scene;
    objc_storeStrong((id *)&self->_scene, a4);
    -[UIView removeFromSuperview](self->_sceneLayerView, "removeFromSuperview");
    sceneLayerView = self->_sceneLayerView;
    self->_sceneLayerView = 0;

    -[UIScenePresenter invalidate](self->_presenter, "invalidate");
    presenter = self->_presenter;
    self->_presenter = 0;

    if (self->_sceneLayerContextID && *p_scene)
    {
      objc_msgSend(MEMORY[0x24BDF6D28], "targetForContextID:");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[FBScene uiPresentationManager](*p_scene, "uiPresentationManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRUISAmbientPosterSceneLayerHostView identifier](self, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "createPresenterForLayerTarget:identifier:priority:", v12, v14, 100);
      v15 = (UIScenePresenter *)objc_claimAutoreleasedReturnValue();
      v16 = self->_presenter;
      self->_presenter = v15;

      -[UIScenePresenter modifyPresentationContext:](self->_presenter, "modifyPresentationContext:", &__block_literal_global_4);
      -[UIScenePresenter presentationView](self->_presenter, "presentationView");
      v17 = (UIView *)objc_claimAutoreleasedReturnValue();
      v18 = self->_sceneLayerView;
      self->_sceneLayerView = v17;

      v19 = self->_sceneLayerView;
      -[PRUISAmbientPosterSceneLayerHostView bounds](self, "bounds");
      -[UIView setFrame:](v19, "setFrame:");
      -[UIView setAutoresizingMask:](self->_sceneLayerView, "setAutoresizingMask:", 18);
      -[PRUISAmbientPosterSceneLayerHostView addSubview:](self, "addSubview:", self->_sceneLayerView);

    }
    v20 = 1;
  }

  return v20;
}

void __59__PRUISAmbientPosterSceneLayerHostView_setContextID_scene___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setAppearanceStyle:", 2);
  objc_msgSend(v2, "setClippingDisabled:", 0);

}

- (void)invalidate
{
  -[PRUISAmbientPosterSceneLayerHostView setContextID:scene:](self, "setContextID:scene:", 0, 0);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (unsigned)contextID
{
  return self->_sceneLayerContextID;
}

- (FBScene)scene
{
  return self->_scene;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_scene, 0);
  objc_storeStrong((id *)&self->_sceneLayerView, 0);
  objc_storeStrong((id *)&self->_presenter, 0);
}

@end
