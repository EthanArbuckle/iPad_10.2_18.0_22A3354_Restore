@implementation SBSystemApertureSceneElementScenePresenterView

- (void)setScene:(id)a3
{
  FBScene **p_scene;
  UIView *sceneContentView;
  UIScenePresenter *scenePresenter;
  UIScenePresenter *v8;
  void *v9;
  UIScenePresenter *v10;
  UIScenePresenter *v11;
  UIView *v12;
  UIView *v13;
  FBScene *v14;

  p_scene = &self->_scene;
  v14 = (FBScene *)a3;
  if (*p_scene != v14)
  {
    objc_storeStrong((id *)&self->_scene, a3);
    -[UIScenePresenter invalidate](self->_scenePresenter, "invalidate");
    -[UIView removeFromSuperview](self->_sceneContentView, "removeFromSuperview");
    sceneContentView = self->_sceneContentView;
    self->_sceneContentView = 0;

    scenePresenter = self->_scenePresenter;
    self->_scenePresenter = 0;

    if (*p_scene)
    {
      v8 = self->_scenePresenter;
      if (!v8)
      {
        -[FBScene uiPresentationManager](*p_scene, "uiPresentationManager");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "createPresenterWithIdentifier:", CFSTR("default"));
        v10 = (UIScenePresenter *)objc_claimAutoreleasedReturnValue();
        v11 = self->_scenePresenter;
        self->_scenePresenter = v10;

        v8 = self->_scenePresenter;
      }
      -[UIScenePresenter modifyPresentationContext:](v8, "modifyPresentationContext:", &__block_literal_global_0);
      -[UIScenePresenter activate](self->_scenePresenter, "activate");
      -[UIScenePresenter presentationView](self->_scenePresenter, "presentationView");
      v12 = (UIView *)objc_claimAutoreleasedReturnValue();
      v13 = self->_sceneContentView;
      self->_sceneContentView = v12;

      -[SBSystemApertureSceneElementScenePresenterView insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_sceneContentView, 0);
    }
  }

}

void __59__SBSystemApertureSceneElementScenePresenterView_setScene___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setPresentedLayerTypes:", 26);
  objc_msgSend(v2, "setAppearanceStyle:", 2);

}

- (void)layoutSubviews
{
  UIView *sceneContentView;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBSystemApertureSceneElementScenePresenterView;
  -[SBSystemApertureSceneElementScenePresenterView layoutSubviews](&v4, sel_layoutSubviews);
  sceneContentView = self->_sceneContentView;
  -[SBSystemApertureSceneElementScenePresenterView bounds](self, "bounds");
  -[UIView setFrame:](sceneContentView, "setFrame:");
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  int v6;
  FBScene *scene;
  _QWORD v8[5];
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBSystemApertureSceneElementScenePresenterView;
  v4 = a3;
  -[SBSystemApertureSceneElementScenePresenterView traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  -[SBSystemApertureSceneElementScenePresenterView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasDifferentColorAppearanceComparedToTraitCollection:", v4);

  if (v6)
  {
    scene = self->_scene;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __75__SBSystemApertureSceneElementScenePresenterView_traitCollectionDidChange___block_invoke;
    v8[3] = &unk_24D4CFEC0;
    v8[4] = self;
    -[FBScene updateSettingsWithBlock:](scene, "updateSettingsWithBlock:", v8);
  }
}

void __75__SBSystemApertureSceneElementScenePresenterView_traitCollectionDidChange___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;

  v3 = a2;
  v4 = objc_opt_class();
  v9 = v3;
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v9;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  objc_msgSend(*(id *)(a1 + 32), "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userInterfaceStyle");

  objc_msgSend(v6, "setUserInterfaceStyle:", v8);
}

- (FBScene)scene
{
  return self->_scene;
}

- (UIScenePresenter)scenePresenter
{
  return self->_scenePresenter;
}

- (UIView)sceneContentView
{
  return self->_sceneContentView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneContentView, 0);
  objc_storeStrong((id *)&self->_scenePresenter, 0);
  objc_storeStrong((id *)&self->_scene, 0);
}

@end
