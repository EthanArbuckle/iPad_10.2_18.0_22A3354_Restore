@implementation SPUISearchBarController

+ (id)todayViewSearchBar
{
  return -[SPUISpotlightRemoteViewController initWithSceneIdentifier:]([SPUISearchBarController alloc], "initWithSceneIdentifier:", CFSTR("searchBar-todayView"));
}

+ (id)notificationCenterSearchBar
{
  return -[SPUISpotlightRemoteViewController initWithSceneIdentifier:]([SPUISearchBarController alloc], "initWithSceneIdentifier:", CFSTR("searchBar-notificationCenter"));
}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (void *)objc_opt_new();
  -[SPUISearchBarController setView:](self, "setView:", v3);

  -[SPUISearchBarController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHeight:", 60.0);

  -[SPUISearchBarController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "heightAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPUISearchBarController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "height");
  objc_msgSend(v6, "constraintEqualToConstant:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPUISearchBarController setHeightAnchor:](self, "setHeightAnchor:", v8);

  -[SPUISearchBarController heightAnchor](self, "heightAnchor");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setActive:", 1);

}

- (CGSize)initialFittingSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[SPUISearchBarController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "intrinsicContentSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (id)sceneSpecification
{
  return (id)objc_opt_new();
}

- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  id v8;
  void *v9;
  void *v10;
  char isKindOfClass;
  void *v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  id v20;

  v20 = a3;
  v8 = a6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v8, "searchBarDidFocus"))
  {
    -[SPUISearchBarController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "searchBarDidFocus");

  }
  objc_msgSend(v20, "clientSettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v20, "clientSettings");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "headerHeight");
    if (v13 > 0.0)
    {
      objc_msgSend(v12, "headerHeight");
      v15 = v14;
      -[SPUISearchBarController view](self, "view");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setHeight:", v15);

      objc_msgSend(v12, "headerHeight");
      v18 = v17;
      -[SPUISearchBarController heightAnchor](self, "heightAnchor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setConstant:", v18);

    }
  }

}

- (void)didInvalidateSceneWhenForeground
{
  id v3;

  -[SPUISpotlightRemoteViewController viewWillAppear:](self, "viewWillAppear:", 0);
  -[SPUISearchBarController view](self, "view");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsLayout");

}

- (id)backgroundBlurView
{
  return 0;
}

- (void)updateSceneSettingsWithBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __56__SPUISearchBarController_updateSceneSettingsWithBlock___block_invoke;
  v6[3] = &unk_24DA1D080;
  objc_copyWeak(&v8, &location);
  v5 = v4;
  v7 = v5;
  -[SPUISpotlightRemoteViewController addOrExecuteEventAsNeeded:](self, "addOrExecuteEventAsNeeded:", v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

void __56__SPUISearchBarController_updateSceneSettingsWithBlock___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  _QWORD v4[4];
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "scene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __56__SPUISearchBarController_updateSceneSettingsWithBlock___block_invoke_2;
  v4[3] = &unk_24DA1D058;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(v2, "updateSettingsWithBlock:", v4);

}

void __56__SPUISearchBarController_updateSceneSettingsWithBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (BOOL)setSceneFrameOnRotation
{
  return 1;
}

- (SPUISearchBarDelegate)delegate
{
  return (SPUISearchBarDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)roundedCornerVisible
{
  return self->_roundedCornerVisible;
}

- (NSLayoutConstraint)heightAnchor
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 1064, 1);
}

- (void)setHeightAnchor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1064);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heightAnchor, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
