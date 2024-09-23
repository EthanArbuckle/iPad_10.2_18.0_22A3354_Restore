@implementation RCPlaybackSettingsViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  RCPlaybackSettingsCollectionViewController *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  objc_super v58;

  v58.receiver = self;
  v58.super_class = (Class)RCPlaybackSettingsViewController;
  -[RCPlaybackSettingsViewController viewDidLoad](&v58, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("PLAYBACK_SETTINGS_VIEW_TITLE"), &stru_1001B2BC0, 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackSettingsViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v5, "setTitle:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("RESET_PLAYBACK_SETTINGS"), &stru_1001B2BC0, 0));

  v7 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithTitle:style:target:action:", v57, 0, self, "_handleReset");
  -[RCPlaybackSettingsViewController setResetChangesBarButtonItem:](self, "setResetChangesBarButtonItem:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("AX_RESET_PLAYBACK_SETTINGS_BUTTON"), &stru_1001B2BC0, 0));
  objc_msgSend(v7, "setAccessibilityLabel:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackSettingsViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v10, "setLeftBarButtonItem:", v7);

  v11 = objc_alloc_init(RCPlaybackSettingsCollectionViewController);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackSettingsViewController delegate](self, "delegate"));
  -[RCPlaybackSettingsCollectionViewController setDelegate:](v11, "setDelegate:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackSettingsViewController playbackSettings](self, "playbackSettings"));
  -[RCPlaybackSettingsCollectionViewController setPlaybackSettings:](v11, "setPlaybackSettings:", v13);

  -[RCPlaybackSettingsViewController setPlaybackSettingsCollectionViewController:](self, "setPlaybackSettingsCollectionViewController:", v11);
  -[RCPlaybackSettingsViewController addChildViewController:](self, "addChildViewController:", v11);
  -[RCPlaybackSettingsCollectionViewController didMoveToParentViewController:](v11, "didMoveToParentViewController:", self);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", 9));
  v15 = objc_msgSend(objc_alloc((Class)UIVisualEffectView), "initWithEffect:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackSettingsViewController view](self, "view"));
  objc_msgSend(v16, "addSubview:", v15);

  objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "trailingAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackSettingsViewController view](self, "view"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "trailingAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:", v19));
  objc_msgSend(v20, "setActive:", 1);

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "leadingAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackSettingsViewController view](self, "view"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "leadingAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v23));
  objc_msgSend(v24, "setActive:", 1);

  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "topAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackSettingsViewController view](self, "view"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "topAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:", v27));
  objc_msgSend(v28, "setActive:", 1);

  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "bottomAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackSettingsViewController view](self, "view"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "bottomAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:", v31));
  objc_msgSend(v32, "setActive:", 1);

  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "contentView"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackSettingsCollectionViewController view](v11, "view"));
  objc_msgSend(v33, "addSubview:", v34);

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackSettingsCollectionViewController view](v11, "view"));
  objc_msgSend(v35, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v36 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackSettingsCollectionViewController view](v11, "view"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "trailingAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "contentView"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "trailingAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToAnchor:", v39));
  objc_msgSend(v40, "setActive:", 1);

  v41 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackSettingsCollectionViewController view](v11, "view"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "leadingAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "contentView"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "leadingAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintEqualToAnchor:", v44));
  objc_msgSend(v45, "setActive:", 1);

  v46 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackSettingsCollectionViewController view](v11, "view"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "topAnchor"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "contentView"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "topAnchor"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "constraintEqualToAnchor:", v49));
  objc_msgSend(v50, "setActive:", 1);

  v51 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackSettingsCollectionViewController view](v11, "view"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "bottomAnchor"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "contentView"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "bottomAnchor"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "constraintEqualToAnchor:", v54));
  objc_msgSend(v55, "setActive:", 1);

  v56 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackSettingsCollectionViewController collectionView](v11, "collectionView"));
  -[RCPlaybackSettingsViewController setContentScrollView:forEdge:](self, "setContentScrollView:forEdge:", v56, 15);

  -[RCPlaybackSettingsViewController _updateResetButtonState](self, "_updateResetButtonState");
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v12;
  char v13;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)RCPlaybackSettingsViewController;
  -[RCPlaybackSettingsViewController viewDidLayoutSubviews](&v15, "viewDidLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackSettingsViewController playbackSettingsCollectionViewController](self, "playbackSettingsCollectionViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "collectionView"));
  objc_msgSend(v4, "contentSize");
  v6 = v5;
  v8 = v7;

  -[RCPlaybackSettingsViewController currentContentSize](self, "currentContentSize");
  if (v10 != v6 || v9 != v8)
  {
    -[RCPlaybackSettingsViewController setCurrentContentSize:](self, "setCurrentContentSize:", v6, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackSettingsViewController delegate](self, "delegate"));
    v13 = objc_opt_respondsToSelector(v12, "playbackSettingsViewController:contentSizeChanged:");

    if ((v13 & 1) != 0)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackSettingsViewController delegate](self, "delegate"));
      objc_msgSend(v14, "playbackSettingsViewController:contentSizeChanged:", self, v6, v8);

    }
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)RCPlaybackSettingsViewController;
  -[RCPlaybackSettingsViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  -[RCPlaybackSettingsViewController registerAppEntityInteraction](self, "registerAppEntityInteraction");
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)RCPlaybackSettingsViewController;
  -[RCPlaybackSettingsViewController viewWillDisappear:](&v4, "viewWillDisappear:", a3);
  -[RCPlaybackSettingsViewController removeAppEntityInteraction](self, "removeAppEntityInteraction");
}

- (void)setPlaybackSettings:(id)a3
{
  id v5;

  v5 = a3;
  objc_storeStrong((id *)&self->_playbackSettings, a3);
  if (-[RCPlaybackSettingsViewController isViewLoaded](self, "isViewLoaded"))
    -[RCPlaybackSettingsViewController _updateCollectionViewWithPlaybackSettings:](self, "_updateCollectionViewWithPlaybackSettings:", v5);

}

- (void)setNeedsCloseButton:(BOOL)a3
{
  void *v4;
  id v5;

  self->_needsCloseButton = a3;
  if (a3)
  {
    v5 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 24, self, "_handleClose");
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackSettingsViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v4, "setRightBarButtonItem:", v5);

  }
  else
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[RCPlaybackSettingsViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v5, "setRightBarButtonItem:", 0);
  }

}

- (void)_updateCollectionViewWithPlaybackSettings:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackSettingsViewController playbackSettingsCollectionViewController](self, "playbackSettingsCollectionViewController"));
  objc_msgSend(v5, "setPlaybackSettings:", v4);

  -[RCPlaybackSettingsViewController _updateResetButtonState](self, "_updateResetButtonState");
}

- (void)_updateResetButtonState
{
  _BOOL8 v3;
  id v4;

  v3 = -[RCPlaybackSettings hasCustomizedPlaybackSettings](self->_playbackSettings, "hasCustomizedPlaybackSettings");
  v4 = (id)objc_claimAutoreleasedReturnValue(-[RCPlaybackSettingsViewController resetChangesBarButtonItem](self, "resetChangesBarButtonItem"));
  objc_msgSend(v4, "setEnabled:", v3);

}

- (void)_handleReset
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackSettingsViewController playbackSettings](self, "playbackSettings"));
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "uuid"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackSettingsViewController delegate](self, "delegate"));
  objc_msgSend(v4, "setEnhanced:forUUID:", 0, v7);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackSettingsViewController delegate](self, "delegate"));
  objc_msgSend(v5, "setRemoveSilence:forUUID:", 0, v7);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackSettingsViewController delegate](self, "delegate"));
  objc_msgSend(v6, "setPlaybackSpeed:forUUID:", v7, 1.0);

}

- (void)_handleClose
{
  void *v3;
  char v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackSettingsViewController delegate](self, "delegate"));
  v4 = objc_opt_respondsToSelector(v3, "hidePlaybackSettingsViewController");

  if ((v4 & 1) != 0)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[RCPlaybackSettingsViewController delegate](self, "delegate"));
    objc_msgSend(v5, "hidePlaybackSettingsViewController");

  }
}

- (RCPlaybackSettingsDelegate)delegate
{
  return (RCPlaybackSettingsDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (RCPlaybackSettings)playbackSettings
{
  return self->_playbackSettings;
}

- (BOOL)needsCloseButton
{
  return self->_needsCloseButton;
}

- (RCPlaybackSettingsCollectionViewController)playbackSettingsCollectionViewController
{
  return self->_playbackSettingsCollectionViewController;
}

- (void)setPlaybackSettingsCollectionViewController:(id)a3
{
  objc_storeStrong((id *)&self->_playbackSettingsCollectionViewController, a3);
}

- (UIBarButtonItem)resetChangesBarButtonItem
{
  return self->_resetChangesBarButtonItem;
}

- (void)setResetChangesBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_resetChangesBarButtonItem, a3);
}

- (CGSize)currentContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_currentContentSize.width;
  height = self->_currentContentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setCurrentContentSize:(CGSize)a3
{
  self->_currentContentSize = a3;
}

- (UIInteraction)entityInteraction
{
  return self->_entityInteraction;
}

- (void)setEntityInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_entityInteraction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityInteraction, 0);
  objc_storeStrong((id *)&self->_resetChangesBarButtonItem, 0);
  objc_storeStrong((id *)&self->_playbackSettingsCollectionViewController, 0);
  objc_storeStrong((id *)&self->_playbackSettings, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)registerAppEntityInteraction
{
  RCPlaybackSettingsViewController *v2;

  v2 = self;
  sub_1000AAE54();

}

- (void)removeAppEntityInteraction
{
  RCPlaybackSettingsViewController *v2;

  v2 = self;
  sub_1000AAF68();

}

@end
