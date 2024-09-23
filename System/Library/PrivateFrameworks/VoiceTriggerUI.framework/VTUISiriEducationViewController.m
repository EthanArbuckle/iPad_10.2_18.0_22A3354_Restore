@implementation VTUISiriEducationViewController

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VTUISiriEducationViewController;
  -[VTUISiriEducationViewController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  -[VTUISiriEducationViewController headerView](self, "headerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", 0.0);

  -[VTUISiriEducationViewController contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", 0.0);

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VTUISiriEducationViewController;
  -[OBBaseWelcomeController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[VTUISiriEducationViewController _fadeInSubViews](self, "_fadeInSubViews");
}

- (VTUISiriEducationViewController)initWithTitle:(id)a3 detailText:(id)a4 style:(id)a5 delegate:(id)a6
{
  id v11;
  id v12;
  VTUISiriEducationViewController *v13;
  VTUISiriEducationViewController *v14;
  void *v15;
  objc_super v17;

  v11 = a5;
  v12 = a6;
  v17.receiver = self;
  v17.super_class = (Class)VTUISiriEducationViewController;
  v13 = -[VTUISiriEducationViewController initWithTitle:detailText:icon:contentLayout:](&v17, sel_initWithTitle_detailText_icon_contentLayout_, a3, a4, 0, 2);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_style, a5);
    objc_storeWeak((id *)&v14->_delegate, v12);
    -[VTUISiriEducationViewController traitCollection](v14, "traitCollection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[VTUISiriEducationViewController _setupImageContainerViewForTraitCollection:](v14, "_setupImageContainerViewForTraitCollection:", v15);

    -[VTUISiriEducationViewController _setupContinueButton](v14, "_setupContinueButton");
  }

  return v14;
}

- (void)_setupContinueButton
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x24BE6E3E8], "boldButton");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  +[VTUIStringsHelper sharedStringsHelper](VTUIStringsHelper, "sharedStringsHelper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uiLocalizedStringForKey:", CFSTR("BUTTON_CONTINUE_SETUP"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:forState:", v4, 0);

  objc_msgSend(v6, "addTarget:action:forControlEvents:", self, sel__continueButtonPressed, 64);
  -[VTUISiriEducationViewController buttonTray](self, "buttonTray");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addButton:", v6);

}

- (void)_setupImageContainerViewForTraitCollection:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  AVPlayer **p_player;
  id v12;
  __int128 v13;
  AVPlayerLooper *v14;
  AVPlayerLooper *playerLooper;
  AVPlayerViewController *playerViewController;
  AVPlayerViewController *v17;
  void *v18;
  void *v19;
  void *v20;
  AVPlayerViewController *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  float v28;
  float v29;
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
  AVPlayerViewController *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  _OWORD v53[3];
  _QWORD v54[6];

  v54[4] = *MEMORY[0x24BDAC8D0];
  -[VTUIStyle educationAssetNameForTraitCollection:](self->_style, "educationAssetNameForTraitCollection:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(v5, "pathForResource:ofType:", v4, CFSTR("mov"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fileURLWithPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB2618]), "initWithURL:", v8);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB2670]), "initWithPlayerItem:", v9);
  p_player = &self->_player;
  objc_storeStrong((id *)&self->_player, v10);
  v12 = objc_alloc(MEMORY[0x24BDB2650]);
  v13 = *(_OWORD *)(MEMORY[0x24BDC0D68] + 16);
  v53[0] = *MEMORY[0x24BDC0D68];
  v53[1] = v13;
  v53[2] = *(_OWORD *)(MEMORY[0x24BDC0D68] + 32);
  v14 = (AVPlayerLooper *)objc_msgSend(v12, "initWithPlayer:templateItem:timeRange:", v10, v9, v53);
  playerLooper = self->_playerLooper;
  self->_playerLooper = v14;

  playerViewController = self->_playerViewController;
  if (!playerViewController)
  {
    v50 = v8;
    v17 = (AVPlayerViewController *)objc_alloc_init(MEMORY[0x24BDB27C0]);
    -[AVPlayerViewController setShowsPlaybackControls:](v17, "setShowsPlaybackControls:", 0);
    -[AVPlayerViewController setAllowsPictureInPicturePlayback:](v17, "setAllowsPictureInPicturePlayback:", 0);
    -[AVPlayerViewController view](v17, "view");
    v49 = v9;
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[AVPlayerViewController view](v17, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
    v52 = v4;
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setBackgroundColor:", v20);

    v21 = self->_playerViewController;
    self->_playerViewController = v17;
    v45 = v17;

    -[VTUISiriEducationViewController contentView](self, "contentView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVPlayerViewController view](v45, "view");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addSubview:", v23);

    -[VTUIStyle educationAssetSize](self->_style, "educationAssetSize");
    v25 = v24;
    v27 = v26;
    -[VTUIStyle educationAssetTopPadding](self->_style, "educationAssetTopPadding");
    v29 = v28;
    v41 = (void *)MEMORY[0x24BDD1628];
    -[AVPlayerViewController view](self->_playerViewController, "view");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "topAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[VTUISiriEducationViewController contentView](self, "contentView");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "topAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "constraintEqualToAnchor:constant:", v44, v29);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v54[0] = v43;
    -[AVPlayerViewController view](self->_playerViewController, "view");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "centerXAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[VTUISiriEducationViewController contentView](self, "contentView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "centerXAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintEqualToAnchor:constant:", v38, 0.0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v54[1] = v37;
    -[AVPlayerViewController view](self->_playerViewController, "view");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "heightAnchor");
    v51 = v5;
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToConstant:", v27);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v54[2] = v32;
    -[AVPlayerViewController view](self->_playerViewController, "view");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "widthAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToConstant:", v25);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v54[3] = v35;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v54, 4);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "activateConstraints:", v36);

    v9 = v49;
    v8 = v50;

    p_player = &self->_player;
    v5 = v51;

    v4 = v52;
    playerViewController = self->_playerViewController;
  }
  -[AVPlayerViewController setPlayer:](playerViewController, "setPlayer:", *p_player);

}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VTUISiriEducationViewController;
  -[VTUISiriEducationViewController traitCollectionDidChange:](&v5, sel_traitCollectionDidChange_, a3);
  -[VTUISiriEducationViewController traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUISiriEducationViewController _setupImageContainerViewForTraitCollection:](self, "_setupImageContainerViewForTraitCollection:", v4);

}

- (void)_continueButtonPressed
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "siriEducationViewControllerContinuePressed:", self);

}

- (void)_fadeInSubViews
{
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[5];
  _QWORD v7[5];
  _QWORD v8[5];

  -[VTUISiriEducationViewController headerView](self, "headerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 0.0);

  -[VTUISiriEducationViewController contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", 0.0);

  v5 = MEMORY[0x24BDAC760];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __50__VTUISiriEducationViewController__fadeInSubViews__block_invoke;
  v8[3] = &unk_24F33DA28;
  v8[4] = self;
  objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:delay:options:animations:completion:", 0, v8, 0, 0.400000006, 0.0);
  v6[4] = self;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __50__VTUISiriEducationViewController__fadeInSubViews__block_invoke_2;
  v7[3] = &unk_24F33DA28;
  v7[4] = self;
  v6[0] = v5;
  v6[1] = 3221225472;
  v6[2] = __50__VTUISiriEducationViewController__fadeInSubViews__block_invoke_3;
  v6[3] = &unk_24F33DA50;
  objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:delay:options:animations:completion:", 0, v7, v6, 0.400000006, 0.300000012);
}

void __50__VTUISiriEducationViewController__fadeInSubViews__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "headerView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

void __50__VTUISiriEducationViewController__fadeInSubViews__block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "contentView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

uint64_t __50__VTUISiriEducationViewController__fadeInSubViews__block_invoke_3(uint64_t a1, double a2)
{
  LODWORD(a2) = 1.0;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1208), "playImmediatelyAtRate:", a2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_playerLooper, 0);
  objc_storeStrong((id *)&self->_playerViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_style, 0);
}

@end
