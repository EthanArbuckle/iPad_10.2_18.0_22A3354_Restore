@implementation TVRUINowPlayingViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TVRUINowPlayingViewController;
  -[TVRUINowPlayingViewController viewDidLoad](&v7, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("TVRemoteUIInfoTabTitle"), &stru_24DE30718, CFSTR("Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUINowPlayingViewController setCurrentViewControllerIdentifier:](self, "setCurrentViewControllerIdentifier:", v4);

  -[TVRUINowPlayingViewController configureTimedMetadata](self, "configureTimedMetadata");
  -[TVRUINowPlayingViewController configureHierarchy](self, "configureHierarchy");
  -[TVRUINowPlayingViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNeedsLayout");

  -[TVRUINowPlayingViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layoutIfNeeded");

  -[TVRUINowPlayingViewController _updateSelectorControlHeight](self, "_updateSelectorControlHeight");
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TVRUINowPlayingViewController;
  -[TVRUINowPlayingViewController viewWillAppear:](&v10, sel_viewWillAppear_, a3);
  -[TVRUINowPlayingViewController lastExplicitUserSelectedViewControllerIdentifier](self, "lastExplicitUserSelectedViewControllerIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[TVRUINowPlayingViewController lastExplicitUserSelectedViewControllerIdentifier](self, "lastExplicitUserSelectedViewControllerIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[TVRUINowPlayingViewController _viewControllerIdentifierIsAvailable:](self, "_viewControllerIdentifierIsAvailable:", v5);

  if (!v4 || !v6)
  {
    -[TVRUINowPlayingViewController nowPlayingInfo](self, "nowPlayingInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUINowPlayingViewController _availableTabToDisplayForNowPlayingInfo:](self, "_availableTabToDisplayForNowPlayingInfo:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUINowPlayingViewController setCurrentViewControllerIdentifier:](self, "setCurrentViewControllerIdentifier:", v8);

    -[TVRUINowPlayingViewController currentViewControllerIdentifier](self, "currentViewControllerIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUINowPlayingViewController _updateViewControllerVisibilityForSelectedIdentifier:](self, "_updateViewControllerVisibilityForSelectedIdentifier:", v9);

  }
}

+ (double)minimizedPlayerHeight
{
  double result;

  +[TVRUINowPlayingMiniPlayerViewController minimizedPlayerHeight](TVRUINowPlayingMiniPlayerViewController, "minimizedPlayerHeight");
  return result;
}

- (void)setNowPlayingInfo:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  uint8_t v19[16];
  uint8_t buf[16];

  v5 = a3;
  objc_storeStrong((id *)&self->_nowPlayingInfo, a3);
  objc_msgSend(v5, "metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "tvrui_mediaIsStopped") ^ 1;
  v8 = objc_msgSend(v5, "tvrui_mediaIsIsPlaying");
  -[TVRUINowPlayingViewController mediaControlsViewController](self, "mediaControlsViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setIsPlaying:", v8);

  -[TVRUINowPlayingViewController nowPlayingMiniPlayerViewController](self, "nowPlayingMiniPlayerViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setNowPlayingInfo:", v5);

  -[TVRUINowPlayingViewController mediaControlsViewController](self, "mediaControlsViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setIsPlaying:", v8);

  -[TVRUINowPlayingViewController mediaControlsViewController](self, "mediaControlsViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setIsMediaActive:", v7);

  -[TVRUINowPlayingViewController nowPlayingInfoViewController](self, "nowPlayingInfoViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setNowPlayingInfo:", v5);

  -[TVRUINowPlayingViewController castViewController](self, "castViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setMetadata:", v6);

  _TVRUINowPlayingLog();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v16)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21B042000, v15, OS_LOG_TYPE_DEFAULT, "NowPlayingInfo update: metadata is not nil, try updating playback info", buf, 2u);
    }

    -[TVRUINowPlayingViewController timedMetadataViewController](self, "timedMetadataViewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUINowPlayingViewController makeTimedMetadataPlaybackInfo](self, "makeTimedMetadataPlaybackInfo");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "updatePlaybackInfo:", v18);

    -[TVRUINowPlayingViewController configureSegControlOrDividerViewVisibility](self, "configureSegControlOrDividerViewVisibility");
    -[TVRUINowPlayingViewController _reconfigureTabsIfNeeded](self, "_reconfigureTabsIfNeeded");
  }
  else
  {
    if (v16)
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_21B042000, v15, OS_LOG_TYPE_DEFAULT, "NowPlayingInfo update: metadata is nil, retain the last known content", v19, 2u);
    }

    -[TVRUINowPlayingViewController configureSegControlOrDividerViewVisibility](self, "configureSegControlOrDividerViewVisibility");
  }

}

- (id)commandHandler
{
  void *v2;
  void *v3;

  -[TVRUINowPlayingViewController mediaControlsViewController](self, "mediaControlsViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "commandHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setCommandHandler:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;

  v4 = a3;
  if ((-[TVRUINowPlayingViewController isViewLoaded](self, "isViewLoaded") & 1) == 0)
    v5 = (id)-[TVRUINowPlayingViewController view](self, "view");
  -[TVRUINowPlayingViewController mediaControlsViewController](self, "mediaControlsViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCommandHandler:", v4);

  -[TVRUINowPlayingViewController nowPlayingInfoViewController](self, "nowPlayingInfoViewController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCommandHandler:", v4);

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  uint64_t v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  unint64_t Width;
  unint64_t v15;
  _QWORD block[5];
  objc_super v17;
  CGRect v18;

  v17.receiver = self;
  v17.super_class = (Class)TVRUINowPlayingViewController;
  -[TVRUINowPlayingViewController viewWillLayoutSubviews](&v17, sel_viewWillLayoutSubviews);
  -[TVRUINowPlayingViewController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 == 1)
  {
    -[TVRUINowPlayingViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;

    v18.origin.x = v7;
    v18.origin.y = v9;
    v18.size.width = v11;
    v18.size.height = v13;
    Width = (unint64_t)CGRectGetWidth(v18);
    if (-[TVRUINowPlayingViewController lastLayoutWidth](self, "lastLayoutWidth"))
    {
      v15 = -[TVRUINowPlayingViewController lastLayoutWidth](self, "lastLayoutWidth");
      -[TVRUINowPlayingViewController setLastLayoutWidth:](self, "setLastLayoutWidth:", Width);
      if (v15 != Width)
      {
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __55__TVRUINowPlayingViewController_viewWillLayoutSubviews__block_invoke;
        block[3] = &unk_24DE2C198;
        block[4] = self;
        dispatch_async(MEMORY[0x24BDAC9B8], block);
      }
    }
    else
    {
      -[TVRUINowPlayingViewController setLastLayoutWidth:](self, "setLastLayoutWidth:", Width);
    }
  }
}

void __55__TVRUINowPlayingViewController_viewWillLayoutSubviews__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "allPossibleChildViewControllerIdentifiers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 32), "viewControllerForIdentifier:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v6));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7;
        if (v7)
        {
          objc_msgSend(v7, "view");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setNeedsLayout");
          objc_msgSend(v9, "layoutIfNeeded");
          objc_msgSend(v9, "setNeedsUpdateConstraints");
          objc_msgSend(v9, "updateConstraintsIfNeeded");

        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

}

- (void)configureHierarchy
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  double v16;
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
  id v28;
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
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  id v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  TVRUIMiniPlayerMediaControlsViewController *v97;
  TVRUICastViewController *v98;
  TVRUINowPlayingInfoViewController *v99;
  TVRUINowPlayingMiniPlayerViewController *v100;
  void *v101;
  void *v102;
  TVRUIUpNextViewController *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  TVRUITabSelectorControl *v108;
  void *v109;
  TVRUINowPlayingViewController *val;
  _QWORD v111[4];
  id v112;
  id location;
  _QWORD v114[5];
  uint64_t v115;
  _QWORD v116[27];

  v116[25] = *MEMORY[0x24BDAC8D0];
  v100 = objc_alloc_init(TVRUINowPlayingMiniPlayerViewController);
  val = self;
  -[TVRUINowPlayingViewController sharingProvider](self, "sharingProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUINowPlayingMiniPlayerViewController setSharingProvider:](v100, "setSharingProvider:", v3);

  -[TVRUINowPlayingMiniPlayerViewController view](v100, "view");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v114[0] = MEMORY[0x24BDAC760];
  v114[1] = 3221225472;
  v114[2] = __51__TVRUINowPlayingViewController_configureHierarchy__block_invoke;
  v114[3] = &unk_24DE2C198;
  v114[4] = val;
  -[TVRUINowPlayingMiniPlayerViewController setUpdateTabsHandler:](v100, "setUpdateTabsHandler:", v114);
  v97 = objc_alloc_init(TVRUIMiniPlayerMediaControlsViewController);
  -[TVRUIMiniPlayerMediaControlsViewController view](v97, "view");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v99 = objc_alloc_init(TVRUINowPlayingInfoViewController);
  -[TVRUINowPlayingViewController sharingProvider](val, "sharingProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUINowPlayingInfoViewController setSharingProvider:](v99, "setSharingProvider:", v4);

  -[TVRUINowPlayingInfoViewController view](v99, "view");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "setHidden:", 1);
  v103 = objc_alloc_init(TVRUIUpNextViewController);
  -[TVRUINowPlayingViewController upNextProvider](val, "upNextProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIUpNextViewController setUpNextProvider:](v103, "setUpNextProvider:", v5);

  -[TVRUINowPlayingViewController sharingProvider](val, "sharingProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIUpNextViewController setSharingProvider:](v103, "setSharingProvider:", v6);

  -[TVRUIUpNextViewController view](v103, "view");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "setHidden:", 1);
  v98 = objc_alloc_init(TVRUICastViewController);
  -[TVRUINowPlayingViewController sharingProvider](val, "sharingProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUICastViewController setSharingProvider:](v98, "setSharingProvider:", v7);

  -[TVRUICastViewController view](v98, "view");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "setHidden:", 1);
  -[TVRUINowPlayingViewController view](val, "view");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.1, 1.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "setBackgroundColor:", v8);

  -[TVRUINowPlayingViewController bs_addChildViewController:](val, "bs_addChildViewController:", v100);
  -[TVRUINowPlayingViewController bs_addChildViewController:](val, "bs_addChildViewController:", v97);
  -[TVRUINowPlayingViewController bs_addChildViewController:](val, "bs_addChildViewController:", v99);
  -[TVRUINowPlayingViewController bs_addChildViewController:](val, "bs_addChildViewController:", v103);
  -[TVRUINowPlayingViewController bs_addChildViewController:](val, "bs_addChildViewController:", v98);
  -[TVRUINowPlayingViewController childViewControllerIdentifiers](val, "childViewControllerIdentifiers");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v108 = -[TVRUITabSelectorControl initWithItems:]([TVRUITabSelectorControl alloc], "initWithItems:", v95);
  -[TVRUITabSelectorControl setDelegate:](v108, "setDelegate:", val);
  -[TVRUITabSelectorControl setTranslatesAutoresizingMaskIntoConstraints:](v108, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v109, "addSubview:", v108);
  +[TVRUITabSelectorControl defaultHeight](TVRUITabSelectorControl, "defaultHeight");
  v10 = v9;
  -[TVRUITabSelectorControl heightAnchor](v108, "heightAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToConstant:", v10);
  v96 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_alloc(MEMORY[0x24BEBDB00]);
  v107 = (void *)objc_msgSend(v12, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  objc_msgSend(v107, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.4, 0.9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "setBackgroundColor:", v13);

  objc_msgSend(v109, "addSubview:", v107);
  v83 = objc_alloc_init(MEMORY[0x24BEBDC38]);
  objc_msgSend(v83, "sizeThatFits:", *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
  v15 = v14;
  objc_msgSend(v102, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v101, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v106, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v105, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v104, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v16) = 1144750080;
  objc_msgSend(v101, "setContentHuggingPriority:forAxis:", 1, v16);
  v31 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(v102, "topAnchor");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "topAnchor");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "constraintEqualToAnchor:constant:", v93, v15 + *MEMORY[0x24BEBEB80] * 2.0 + 18.0);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v116[0] = v92;
  objc_msgSend(v102, "leadingAnchor");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "leadingAnchor");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "constraintEqualToAnchor:", v90);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v116[1] = v89;
  objc_msgSend(v102, "trailingAnchor");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "trailingAnchor");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "constraintEqualToAnchor:", v87);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v116[2] = v86;
  objc_msgSend(v101, "topAnchor");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "bottomAnchor");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "constraintEqualToAnchor:constant:", v84, 37.0);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v116[3] = v82;
  objc_msgSend(v101, "centerXAnchor");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "centerXAnchor");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "constraintEqualToAnchor:", v80);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v116[4] = v79;
  -[TVRUITabSelectorControl topAnchor](v108, "topAnchor");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "bottomAnchor");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "constraintEqualToAnchor:constant:", v77, 46.0);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v116[5] = v76;
  -[TVRUITabSelectorControl leadingAnchor](v108, "leadingAnchor");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "leadingAnchor");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "constraintEqualToAnchor:", v74);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v116[6] = v73;
  -[TVRUITabSelectorControl trailingAnchor](v108, "trailingAnchor");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "trailingAnchor");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "constraintEqualToAnchor:", v71);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v116[7] = v70;
  v116[8] = v96;
  objc_msgSend(v107, "heightAnchor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "constraintEqualToConstant:", 1.0);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v116[9] = v68;
  objc_msgSend(v107, "widthAnchor");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "widthAnchor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "constraintEqualToAnchor:constant:", v66, -80.0);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v116[10] = v65;
  objc_msgSend(v107, "centerXAnchor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUITabSelectorControl centerXAnchor](v108, "centerXAnchor");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "constraintEqualToAnchor:", v63);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v116[11] = v62;
  objc_msgSend(v107, "centerYAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUITabSelectorControl centerYAnchor](v108, "centerYAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "constraintEqualToAnchor:", v60);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v116[12] = v59;
  objc_msgSend(v106, "topAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUITabSelectorControl bottomAnchor](v108, "bottomAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "constraintEqualToAnchor:constant:", v57, 16.0);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v116[13] = v56;
  objc_msgSend(v106, "leadingAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "leadingAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "constraintEqualToAnchor:", v54);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v116[14] = v53;
  objc_msgSend(v106, "trailingAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "trailingAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "constraintEqualToAnchor:", v51);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v116[15] = v50;
  objc_msgSend(v106, "bottomAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "bottomAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "constraintEqualToAnchor:", v48);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v116[16] = v47;
  objc_msgSend(v105, "topAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUITabSelectorControl bottomAnchor](v108, "bottomAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "constraintEqualToAnchor:constant:", v45, 16.0);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v116[17] = v44;
  objc_msgSend(v105, "leadingAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "leadingAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "constraintEqualToAnchor:", v42);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v116[18] = v41;
  objc_msgSend(v105, "trailingAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "trailingAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "constraintEqualToAnchor:", v39);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v116[19] = v38;
  objc_msgSend(v105, "bottomAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "bottomAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintEqualToAnchor:", v36);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v116[20] = v35;
  objc_msgSend(v104, "topAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUITabSelectorControl bottomAnchor](v108, "bottomAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:constant:", v33, 16.0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v116[21] = v32;
  objc_msgSend(v104, "leadingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "leadingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:constant:", v18, 20.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v116[22] = v19;
  objc_msgSend(v104, "trailingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "trailingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:constant:", v21, -20.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v116[23] = v22;
  objc_msgSend(v104, "bottomAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "bottomAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v116[24] = v25;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v116, 25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "activateConstraints:", v26);

  -[TVRUINowPlayingViewController setNowPlayingMiniPlayerViewController:](val, "setNowPlayingMiniPlayerViewController:", v100);
  -[TVRUINowPlayingViewController setMediaControlsViewController:](val, "setMediaControlsViewController:", v97);
  -[TVRUINowPlayingViewController setNowPlayingInfoViewController:](val, "setNowPlayingInfoViewController:", v99);
  -[TVRUINowPlayingViewController setUpNextViewController:](val, "setUpNextViewController:", v103);
  -[TVRUINowPlayingViewController setCastViewController:](val, "setCastViewController:", v98);
  -[TVRUINowPlayingViewController setTabSelectorControl:](val, "setTabSelectorControl:", v108);
  -[TVRUINowPlayingViewController setTabSelectorControlHeightConstraint:](val, "setTabSelectorControlHeightConstraint:", v96);
  -[TVRUINowPlayingViewController setDividerView:](val, "setDividerView:", v107);
  -[TVRUINowPlayingViewController configureSegControlOrDividerViewVisibility](val, "configureSegControlOrDividerViewVisibility");
  objc_initWeak(&location, val);
  v115 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v115, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v111[0] = MEMORY[0x24BDAC760];
  v111[1] = 3221225472;
  v111[2] = __51__TVRUINowPlayingViewController_configureHierarchy__block_invoke_2;
  v111[3] = &unk_24DE2C468;
  objc_copyWeak(&v112, &location);
  v28 = (id)-[TVRUINowPlayingViewController registerForTraitChanges:withHandler:](val, "registerForTraitChanges:withHandler:", v27, v111);

  -[TVRUINowPlayingViewController setOverrideUserInterfaceStyle:](val, "setOverrideUserInterfaceStyle:", 2);
  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7E0]), "initWithTarget:action:", val, sel_panRecognizerDidFire_);
  objc_msgSend(v29, "setDelegate:", val);
  -[TVRUINowPlayingViewController view](val, "view");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addGestureRecognizer:", v29);

  objc_destroyWeak(&v112);
  objc_destroyWeak(&location);

}

uint64_t __51__TVRUINowPlayingViewController_configureHierarchy__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reconfigureTabsIfNeeded");
}

void __51__TVRUINowPlayingViewController_configureHierarchy__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "view");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setNeedsLayout");

    objc_msgSend(v4, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "layoutIfNeeded");

    objc_msgSend(v4, "_updateSelectorControlHeight");
    WeakRetained = v4;
  }

}

- (void)configureSegControlOrDividerViewVisibility
{
  void *v3;
  unint64_t v4;
  void *v5;
  id v6;

  -[TVRUINowPlayingViewController childViewControllerIdentifiers](self, "childViewControllerIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  -[TVRUINowPlayingViewController tabSelectorControl](self, "tabSelectorControl");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", v4 < 2);

  -[TVRUINowPlayingViewController dividerView](self, "dividerView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidden:", v4 > 1);

}

- (void)panRecognizerDidFire:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double Width;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _BOOL4 v20;
  _BOOL4 v21;
  _BOOL4 v22;
  _BOOL4 v23;
  char v24;
  void *v25;
  void *v26;
  char v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  char v34;
  void *v35;
  void *v36;
  uint64_t v37;
  double v38;
  NSObject *v39;
  void *v40;
  void *v41;
  TVRUINowPlayingViewController *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  double v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  id v52;
  void *v53;
  void *v54;
  double v55;
  double v56;
  void *v57;
  unint64_t v58;
  void *v59;
  NSObject *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  void *v65;
  id v66;
  void *v67;
  void *v68;
  NSObject *v69;
  double v70;
  NSObject *v71;
  void *v72;
  void *v73;
  void *v74;
  _QWORD v75[6];
  _QWORD v76[4];
  id v77;
  CGAffineTransform v78;
  CGAffineTransform buf;
  uint64_t v80;
  CGRect v81;

  v80 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(v4, "state");
  -[TVRUINowPlayingViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "translationInView:", v6);
  v8 = v7;

  -[TVRUINowPlayingViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  Width = CGRectGetWidth(v81);

  v11 = fabs(v8) / Width;
  if (Width > 0.0)
    v12 = v11;
  else
    v12 = 0.0;
  -[TVRUINowPlayingViewController tabSelectorControl](self, "tabSelectorControl");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "selectedIndex");

  -[TVRUINowPlayingViewController tabSelectorControl](self, "tabSelectorControl");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "items");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");

  if (v8 > 0.0 && v14)
  {
    v18 = v14 - 1;
  }
  else
  {
    if (v14 + 1 < v17)
      v19 = v14 + 1;
    else
      v19 = 0x7FFFFFFFFFFFFFFFLL;
    if (v8 <= 0.0)
      v18 = v19;
    else
      v18 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (v14)
    v20 = 0;
  else
    v20 = v17 > 1;
  v21 = v14 + 1 == v17 && v17 > 1;
  v22 = v18 == 0x7FFFFFFFFFFFFFFFLL && v20;
  v23 = v18 == 0x7FFFFFFFFFFFFFFFLL && v21;
  v24 = v18 == 0x7FFFFFFFFFFFFFFFLL || v22 || v23;
  if (v5 != 2)
  {
    if (v5 == 1)
    {
      -[TVRUINowPlayingViewController setInteractiveSwipeGestureIsApplyingRubberbandingTransform:](self, "setInteractiveSwipeGestureIsApplyingRubberbandingTransform:", 0);
      goto LABEL_74;
    }
    if ((unint64_t)(v5 - 3) > 2)
      goto LABEL_74;
    -[TVRUINowPlayingViewController currentTabSelectionAnimator](self, "currentTabSelectionAnimator");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    -[TVRUINowPlayingViewController currentTabSelectionAnimator](self, "currentTabSelectionAnimator");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "isRunning");

    if (!v31)
    {
      if (-[TVRUINowPlayingViewController interactiveSwipeGestureIsApplyingRubberbandingTransform](self, "interactiveSwipeGestureIsApplyingRubberbandingTransform"))
      {
        v47 = objc_alloc(MEMORY[0x24BEBDB20]);
        v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD518]), "initWithAnimationCurve:", 2);
        v49 = (void *)objc_msgSend(v47, "initWithDuration:timingParameters:", v48, 0.3);

        -[TVRUINowPlayingViewController viewControllerForIndex:](self, "viewControllerForIndex:", v14);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = MEMORY[0x24BDAC760];
        v76[0] = MEMORY[0x24BDAC760];
        v76[1] = 3221225472;
        v76[2] = __54__TVRUINowPlayingViewController_panRecognizerDidFire___block_invoke;
        v76[3] = &unk_24DE2C198;
        v77 = v50;
        v52 = v50;
        objc_msgSend(v49, "addAnimations:", v76);
        v75[0] = v51;
        v75[1] = 3221225472;
        v75[2] = __54__TVRUINowPlayingViewController_panRecognizerDidFire___block_invoke_2;
        v75[3] = &unk_24DE2D118;
        v75[4] = self;
        v75[5] = v14;
        objc_msgSend(v49, "addCompletion:", v75);
        +[_TVRUIAnimationState animationStateWithIndex:previousIndex:toViewController:fromViewController:isInteractive:](_TVRUIAnimationState, "animationStateWithIndex:previousIndex:toViewController:fromViewController:isInteractive:", v14, 0x7FFFFFFFFFFFFFFFLL, v52, 0, 0);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        -[TVRUINowPlayingViewController setCurrentAnimationState:](self, "setCurrentAnimationState:", v53);

        -[TVRUINowPlayingViewController setCurrentTabSelectionAnimator:](self, "setCurrentTabSelectionAnimator:", v49);
        objc_msgSend(v49, "startAnimation");

      }
      goto LABEL_74;
    }
    if (v33)
    {
      if (v5 == 3)
        v34 = v24;
      else
        v34 = 1;
      if ((v34 & 1) == 0)
      {
        -[TVRUINowPlayingViewController currentAnimationState](self, "currentAnimationState");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v35, "index") == v18)
        {
          -[TVRUINowPlayingViewController currentAnimationState](self, "currentAnimationState");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = objc_msgSend(v36, "previousIndex");

          if (v37 == v14)
            goto LABEL_74;
        }
        else
        {

        }
        _TVRUINowPlayingLog();
        v71 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v14);
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v18);
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(buf.a) = 138412546;
          *(_QWORD *)((char *)&buf.a + 4) = v72;
          WORD2(buf.b) = 2112;
          *(_QWORD *)((char *)&buf.b + 6) = v73;
          _os_log_impl(&dword_21B042000, v71, OS_LOG_TYPE_INFO, "ANIM: pan gesture ended with animation in flight: performing interruption from: %@ -> %@", (uint8_t *)&buf, 0x16u);

        }
        -[TVRUINowPlayingViewController tabSelectorControl](self, "tabSelectorControl");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "setSelectedIndex:", v18);

        v46 = 0.0;
        v42 = self;
        v43 = v14;
        v44 = v18;
        v45 = 0;
        goto LABEL_73;
      }
      goto LABEL_74;
    }
    -[TVRUINowPlayingViewController view](self, "view");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "velocityInView:", v54);
    v56 = v55;

    if (v56 != 0.0)
    {
      -[TVRUINowPlayingViewController currentAnimationState](self, "currentAnimationState");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = objc_msgSend(v57, "index");
      -[TVRUINowPlayingViewController currentAnimationState](self, "currentAnimationState");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v58) = v58 < objc_msgSend(v59, "previousIndex");

      if (v56 > 0.0 != (_DWORD)v58)
      {
        _TVRUINowPlayingLog();
        v60 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
        {
          LOWORD(buf.a) = 0;
          _os_log_impl(&dword_21B042000, v60, OS_LOG_TYPE_INFO, "ANIM: pan gesture ended with interactive animator, but user changed directions midway through so reverting in-progress interactive tab selection.", (uint8_t *)&buf, 2u);
        }

        -[TVRUINowPlayingViewController currentAnimationState](self, "currentAnimationState");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = objc_msgSend(v61, "previousIndex");

        -[TVRUINowPlayingViewController currentAnimationState](self, "currentAnimationState");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = objc_msgSend(v63, "index");

        -[TVRUINowPlayingViewController tabSelectorControl](self, "tabSelectorControl");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "setSelectedIndex:", v62);

        v66 = objc_alloc(MEMORY[0x24BEBDB20]);
        v67 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD518]), "initWithAnimationCurve:", 2);
        v68 = (void *)objc_msgSend(v66, "initWithDuration:timingParameters:", v67, 0.3);

        -[TVRUINowPlayingViewController _performTabAnimationFromIndex:toIndex:isInteractive:interactivePercentage:animator:](self, "_performTabAnimationFromIndex:toIndex:isInteractive:interactivePercentage:animator:", v64, v62, 0, v68, 0.0);
        goto LABEL_74;
      }
    }
    _TVRUINowPlayingLog();
    v69 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf.a) = 0;
      _os_log_impl(&dword_21B042000, v69, OS_LOG_TYPE_INFO, "ANIM: pan gesture ended with interactive animator: start animation...", (uint8_t *)&buf, 2u);
    }

    -[TVRUINowPlayingViewController currentTabSelectionAnimator](self, "currentTabSelectionAnimator");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "startAnimation");
LABEL_64:

    goto LABEL_74;
  }
  -[TVRUINowPlayingViewController currentTabSelectionAnimator](self, "currentTabSelectionAnimator");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    -[TVRUINowPlayingViewController currentTabSelectionAnimator](self, "currentTabSelectionAnimator");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "isRunning");

    if ((v27 & 1) != 0)
      goto LABEL_74;
    _TVRUINowPlayingLog();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v12);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf.a) = 138412290;
      *(_QWORD *)((char *)&buf.a + 4) = v29;
      _os_log_impl(&dword_21B042000, v28, OS_LOG_TYPE_INFO, "ANIM: updating interactive animator with fractionComplete: %@", (uint8_t *)&buf, 0xCu);

    }
    -[TVRUINowPlayingViewController currentTabSelectionAnimator](self, "currentTabSelectionAnimator");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setFractionComplete:", v12);
    goto LABEL_64;
  }
  if ((v24 & 1) == 0)
  {
    _TVRUINowPlayingLog();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v14);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v18);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf.a) = 138412546;
      *(_QWORD *)((char *)&buf.a + 4) = v40;
      WORD2(buf.b) = 2112;
      *(_QWORD *)((char *)&buf.b + 6) = v41;
      _os_log_impl(&dword_21B042000, v39, OS_LOG_TYPE_INFO, "ANIM: pan fired and no animator present -- calling performTabAnimationFrom: %@ to: %@", (uint8_t *)&buf, 0x16u);

    }
    v42 = self;
    v43 = v14;
    v44 = v18;
    v45 = 1;
    v46 = v12;
LABEL_73:
    -[TVRUINowPlayingViewController _performTabAnimationFromIndex:toIndex:isInteractive:interactivePercentage:](v42, "_performTabAnimationFromIndex:toIndex:isInteractive:interactivePercentage:", v43, v44, v45, v46);
    goto LABEL_74;
  }
  if (v22 || v23)
  {
    if (v22)
    {
      v38 = 0.0;
      if (v8 > 0.0)
        v38 = v8;
    }
    else
    {
      v38 = 0.0;
      if (v23 && v8 < 0.0)
        v38 = v8;
    }
    v70 = v38 * 0.5;
    if (v38 * 0.5 != 0.0)
    {
      -[TVRUINowPlayingViewController setInteractiveSwipeGestureIsApplyingRubberbandingTransform:](self, "setInteractiveSwipeGestureIsApplyingRubberbandingTransform:", 1);
      memset(&buf, 0, sizeof(buf));
      CGAffineTransformMakeTranslation(&buf, v70, 0.0);
      v78 = buf;
      -[TVRUINowPlayingViewController _applyTransform:toChildViewControllerAtIndex:](self, "_applyTransform:toChildViewControllerAtIndex:", &v78, v14);
    }
  }
LABEL_74:

}

void __54__TVRUINowPlayingViewController_panRecognizerDidFire___block_invoke(uint64_t a1)
{
  void *v1;
  __int128 v2;
  _OWORD v3[3];

  objc_msgSend(*(id *)(a1 + 32), "view");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v3[0] = *MEMORY[0x24BDBD8B8];
  v3[1] = v2;
  v3[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  objc_msgSend(v1, "setTransform:", v3);

}

uint64_t __54__TVRUINowPlayingViewController_panRecognizerDidFire___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_tabAnimationDidCompleteWithFinalPosition:viewControllerIndex:", a2, *(_QWORD *)(a1 + 40));
}

- (void)_tabAnimationDidCompleteWithFinalPosition:(int64_t)a3 viewControllerIndex:(unint64_t)a4
{
  void *v6;
  void *v7;

  if (!a3)
  {
    -[TVRUINowPlayingViewController setCurrentAnimationState:](self, "setCurrentAnimationState:");
    -[TVRUINowPlayingViewController setCurrentTabSelectionAnimator:](self, "setCurrentTabSelectionAnimator:", 0);
    -[TVRUINowPlayingViewController viewControllerIdentifierForIndex:](self, "viewControllerIdentifierForIndex:", a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = v6;
      -[TVRUINowPlayingViewController _callChildViewControllerDisappearingForAllExceptIdentifier:](self, "_callChildViewControllerDisappearingForAllExceptIdentifier:", v6);
      v6 = v7;
    }

  }
}

- (void)_applyTransform:(CGAffineTransform *)a3 toChildViewControllerAtIndex:(unint64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  __int128 v8;

  -[TVRUINowPlayingViewController viewControllerForIndex:](self, "viewControllerForIndex:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "view", *(_QWORD *)&a3->a, *(_QWORD *)&a3->b, *(_QWORD *)&a3->c, *(_QWORD *)&a3->d, *(_QWORD *)&a3->tx, *(_QWORD *)&a3->ty);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTransform:", &v8);

  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_updateSelectorControlHeight
{
  void *v3;
  double v4;
  double v5;
  id v6;

  -[TVRUINowPlayingViewController tabSelectorControl](self, "tabSelectorControl");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutHeight");
  v5 = v4;

  if (v5 > 0.0)
  {
    -[TVRUINowPlayingViewController tabSelectorControlHeightConstraint](self, "tabSelectorControlHeightConstraint");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setConstant:", v5);

  }
}

- (BOOL)_canDisplayInsightsTabForNowPlayingInfo:(id)a3
{
  void *v3;
  void *v4;
  BOOL v5;

  -[TVRUINowPlayingViewController nowPlayingInfo](self, "nowPlayingInfo", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rawTimedMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length") != 0;

  return v5;
}

- (BOOL)_canDisplayUpNextTabForNowPlayingInfo:(id)a3
{
  return objc_msgSend(a3, "tvrui_hasCanonicalID");
}

- (BOOL)_canDisplayCastTabForNowPlayingInfo:(id)a3
{
  char v3;

  v3 = objc_msgSend(MEMORY[0x24BEB4088], "isInternalInstall", a3);
  return v3 & +[TVRUIFeatures showExperimentalCastTab](TVRUIFeatures, "showExperimentalCastTab");
}

- (BOOL)_canDisplayInfoForNowPlayingInfo:(id)a3
{
  return objc_msgSend(a3, "tvrui_hasUnknownCanonicalID") ^ 1;
}

- (id)_availableTabToDisplayForNowPlayingInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;

  v4 = a3;
  if (-[TVRUINowPlayingViewController _canDisplayInsightsTabForNowPlayingInfo:](self, "_canDisplayInsightsTabForNowPlayingInfo:", v4))
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = CFSTR("TVRemoteUIInSightTabTitle");
  }
  else if (-[TVRUINowPlayingViewController _canDisplayInfoForNowPlayingInfo:](self, "_canDisplayInfoForNowPlayingInfo:", v4))
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = CFSTR("TVRemoteUIInfoTabTitle");
  }
  else
  {
    if (!-[TVRUINowPlayingViewController _canDisplayUpNextTabForNowPlayingInfo:](self, "_canDisplayUpNextTabForNowPlayingInfo:", v4))
    {
      v8 = 0;
      goto LABEL_8;
    }
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = CFSTR("TVRemoteUIUpNextTab");
  }
  objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_24DE30718, CFSTR("Localizable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  return v8;
}

- (void)configureTimedMetadata
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  _TVRUINowPlayingLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v9[0]) = 0;
    _os_log_impl(&dword_21B042000, v3, OS_LOG_TYPE_DEFAULT, "Configure timed metadata", (uint8_t *)v9, 2u);
  }

  -[TVRUINowPlayingViewController makeTimedMetadataPlaybackInfo](self, "makeTimedMetadataPlaybackInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v11 = &v10;
  v12 = 0x2050000000;
  v5 = (void *)getVUITimeMetadataFactoryClass_softClass;
  v13 = getVUITimeMetadataFactoryClass_softClass;
  if (!getVUITimeMetadataFactoryClass_softClass)
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __getVUITimeMetadataFactoryClass_block_invoke;
    v9[3] = &unk_24DE2D1B8;
    v9[4] = &v10;
    __getVUITimeMetadataFactoryClass_block_invoke((uint64_t)v9);
    v5 = (void *)v11[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v10, 8);
  objc_msgSend(v6, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "makeViewController:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[TVRUINowPlayingViewController setTimedMetadataViewController:](self, "setTimedMetadataViewController:", v8);
}

- (id)makeTimedMetadataPlaybackInfo
{
  void *v3;
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
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
  uint64_t v29;
  NSObject *v30;
  void *v31;
  _QWORD v33[6];
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;

  v34 = 0;
  v35 = &v34;
  v36 = 0x2050000000;
  v3 = (void *)getVUITimedMetadataPlaybackInfoClass_softClass;
  v37 = getVUITimedMetadataPlaybackInfoClass_softClass;
  if (!getVUITimedMetadataPlaybackInfoClass_softClass)
  {
    v33[0] = MEMORY[0x24BDAC760];
    v33[1] = 3221225472;
    v33[2] = __getVUITimedMetadataPlaybackInfoClass_block_invoke;
    v33[3] = &unk_24DE2D1B8;
    v33[4] = &v34;
    __getVUITimedMetadataPlaybackInfoClass_block_invoke((uint64_t)v33);
    v3 = (void *)v35[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v34, 8);
  v5 = objc_alloc_init(v4);
  -[TVRUINowPlayingViewController nowPlayingInfo](self, "nowPlayingInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "metadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "programID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setProgramId:", v8);

  -[TVRUINowPlayingViewController nowPlayingInfo](self, "nowPlayingInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "metadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "audioLanguage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAudioLanguage:", v11);

  -[TVRUINowPlayingViewController nowPlayingInfo](self, "nowPlayingInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "playbackRate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "doubleValue");
  objc_msgSend(v5, "setPlaybackRate:");

  -[TVRUINowPlayingViewController nowPlayingInfo](self, "nowPlayingInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "metadata");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "timeOffset");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "doubleValue");
  objc_msgSend(v5, "setCurrentTime:");

  -[TVRUINowPlayingViewController nowPlayingInfo](self, "nowPlayingInfo");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "metadata");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "iTunesStoreIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAdamId:", v19);

  -[TVRUINowPlayingViewController nowPlayingInfo](self, "nowPlayingInfo");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "metadata");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "mainContentStartTime");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "doubleValue");
  objc_msgSend(v5, "setFeatureStartTime:");

  -[TVRUINowPlayingViewController nowPlayingInfo](self, "nowPlayingInfo");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "rawTimedMetadata");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRawTimedMetadata:", v24);

  -[TVRUINowPlayingViewController nowPlayingInfo](self, "nowPlayingInfo");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "metadata");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "timestamp");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    v28 = (void *)MEMORY[0x24BDBCE60];
    objc_msgSend(v27, "doubleValue");
    objc_msgSend(v28, "dateWithTimeIntervalSinceReferenceDate:");
    v29 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _TVRUINowPlayingLog();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v33[0]) = 0;
      _os_log_impl(&dword_21B042000, v30, OS_LOG_TYPE_DEFAULT, "timestamp is nil, use current date", (uint8_t *)v33, 2u);
    }

    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v29 = objc_claimAutoreleasedReturnValue();
  }
  v31 = (void *)v29;
  objc_msgSend(v5, "setTimeStamp:", v29);

  return v5;
}

- (void)_updateViewControllerVisibilityForSelectedIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  unint64_t v26;
  unint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[TVRUINowPlayingViewController configureSegControlOrDividerViewVisibility](self, "configureSegControlOrDividerViewVisibility");
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("TVRemoteUIInSightTabTitle"), &stru_24DE30718, CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqualToString:", v6);

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("TVRemoteUIUpNextTab"), &stru_24DE30718, CFSTR("Localizable"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v4, "isEqualToString:", v9);

  if (v7)
    -[TVRUINowPlayingViewController configureTimedMetadataView](self, "configureTimedMetadataView");
  -[TVRUINowPlayingViewController timedMetadataViewController](self, "timedMetadataViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setHidden:", v7 ^ 1u);

  -[TVRUINowPlayingViewController _callChildViewControllerAppearanceForAppearingIdentifier:](self, "_callChildViewControllerAppearanceForAppearingIdentifier:", v4);
  -[TVRUINowPlayingViewController upNextViewController](self, "upNextViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setIsVisibleInParentUI:", v10);

  if ((_DWORD)v10)
  {
    -[TVRUINowPlayingViewController upNextProvider](self, "upNextProvider");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setNeedsRefresh");

    -[TVRUINowPlayingViewController upNextProvider](self, "upNextProvider");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "refreshIfNeeded");

  }
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  -[TVRUINowPlayingViewController allPossibleChildViewControllerIdentifiers](self, "allPossibleChildViewControllerIdentifiers", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v32 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        v22 = objc_msgSend(v21, "isEqualToString:", v4);
        -[TVRUINowPlayingViewController viewControllerForIdentifier:](self, "viewControllerForIdentifier:", v21);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v23;
        if (v23)
        {
          objc_msgSend(v23, "view");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setHidden:", v22 ^ 1u);

        }
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v18);
  }

  if (objc_msgSend(v4, "length"))
  {
    v26 = -[TVRUINowPlayingViewController indexForViewControllerIdentifier:](self, "indexForViewControllerIdentifier:", v4);
    if (v26 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v27 = v26;
      -[TVRUINowPlayingViewController tabSelectorControl](self, "tabSelectorControl");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "selectedIndex");

      if (v27 != v29)
      {
        -[TVRUINowPlayingViewController tabSelectorControl](self, "tabSelectorControl");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "setSelectedIndex:", v27);

      }
    }
  }

}

- (void)_callChildViewControllerAppearanceForAppearingIdentifier:(id)a3
{
  -[TVRUINowPlayingViewController _callChildViewControllerAppearanceForIdentifier:appearing:](self, "_callChildViewControllerAppearanceForIdentifier:appearing:", a3, 1);
}

- (void)_callChildViewControllerDisappearingForAllExceptIdentifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[TVRUINowPlayingViewController allPossibleChildViewControllerIdentifiers](self, "allPossibleChildViewControllerIdentifiers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        if ((objc_msgSend(v4, "isEqualToString:", v10) & 1) == 0)
          -[TVRUINowPlayingViewController _callChildViewControllerAppearanceForIdentifier:appearing:](self, "_callChildViewControllerAppearanceForIdentifier:appearing:", v10, 0);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)_callChildViewControllerAppearanceForIdentifier:(id)a3 appearing:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  void *v11;
  const char *v12;
  int v13;
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v4 = a4;
  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[TVRUINowPlayingViewController viewControllerForIdentifier:](self, "viewControllerForIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = objc_msgSend(v7, "_appearState");
    if ((v9 - 1) > 1)
    {
      if (v9 != 3 && v9 || !v4)
      {
LABEL_10:
        _TVRUINowPlayingLog();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = 138412546;
          v14 = v6;
          v15 = 2112;
          v16 = v11;
          v12 = "ANIM: Not calling childViewController appearance transitions for %@, isAppearing=%@ as VC is already in "
                "this visibility state";
          goto LABEL_12;
        }
        goto LABEL_13;
      }
    }
    else if (v4)
    {
      goto LABEL_10;
    }
    objc_msgSend(v8, "beginAppearanceTransition:animated:", v4, 0);
    objc_msgSend(v8, "endAppearanceTransition");
    _TVRUINowPlayingLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412546;
      v14 = v6;
      v15 = 2112;
      v16 = v11;
      v12 = "ANIM: Calling childViewController appearance transitions for %@, isAppearing=%@";
LABEL_12:
      _os_log_impl(&dword_21B042000, v10, OS_LOG_TYPE_INFO, v12, (uint8_t *)&v13, 0x16u);

    }
LABEL_13:

  }
}

- (void)configureTimedMetadataView
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
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
  uint8_t buf[8];
  _QWORD v29[5];

  v29[4] = *MEMORY[0x24BDAC8D0];
  _TVRUINowPlayingLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21B042000, v3, OS_LOG_TYPE_DEFAULT, "Configure timed metadata view", buf, 2u);
  }

  -[TVRUINowPlayingViewController timedMetadataViewController](self, "timedMetadataViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "superview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUINowPlayingViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 != v7)
  {
    _TVRUINowPlayingLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21B042000, v8, OS_LOG_TYPE_DEFAULT, "Add timed metadata view to view hierarchy", buf, 2u);
    }

    -[TVRUINowPlayingViewController timedMetadataViewController](self, "timedMetadataViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUINowPlayingViewController tabSelectorControl](self, "tabSelectorControl");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUINowPlayingViewController view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setClipsToBounds:", 1);
    objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v10, "setHidden:", 1);
    v27 = v9;
    -[TVRUINowPlayingViewController setTimedMetadataViewController:](self, "setTimedMetadataViewController:", v9);
    -[TVRUINowPlayingViewController bs_addChildViewController:](self, "bs_addChildViewController:", v9);
    v20 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend(v10, "topAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "bottomAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:constant:", v24, 20.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v23;
    objc_msgSend(v10, "leadingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "leadingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:constant:", v21, 0.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v29[1] = v12;
    objc_msgSend(v10, "trailingAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "trailingAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:constant:", v14, 0.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v29[2] = v15;
    objc_msgSend(v10, "bottomAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bottomAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v29[3] = v18;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "activateConstraints:", v19);

  }
}

- (NSArray)childViewControllerIdentifiers
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  uint64_t v22;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  -[TVRUINowPlayingViewController nowPlayingInfo](self, "nowPlayingInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[TVRUINowPlayingViewController _canDisplayInfoForNowPlayingInfo:](self, "_canDisplayInfoForNowPlayingInfo:", v3);

  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("TVRemoteUIInfoTabTitle"), &stru_24DE30718, CFSTR("Localizable"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = (void *)MEMORY[0x24BDBD1A8];
  }
  -[TVRUINowPlayingViewController nowPlayingInfo](self, "nowPlayingInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[TVRUINowPlayingViewController _canDisplayInsightsTabForNowPlayingInfo:](self, "_canDisplayInsightsTabForNowPlayingInfo:", v8);

  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("TVRemoteUIInSightTabTitle"), &stru_24DE30718, CFSTR("Localizable"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "arrayByAddingObject:", v11);
    v12 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v12;
  }
  -[TVRUINowPlayingViewController nowPlayingInfo](self, "nowPlayingInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[TVRUINowPlayingViewController _canDisplayCastTabForNowPlayingInfo:](self, "_canDisplayCastTabForNowPlayingInfo:", v13);

  if (v14)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("TVRemoteUICastTab"), &stru_24DE30718, CFSTR("Localizable"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "arrayByAddingObject:", v16);
    v17 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v17;
  }
  -[TVRUINowPlayingViewController nowPlayingInfo](self, "nowPlayingInfo");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[TVRUINowPlayingViewController _canDisplayUpNextTabForNowPlayingInfo:](self, "_canDisplayUpNextTabForNowPlayingInfo:", v18);

  if (v19)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("TVRemoteUIUpNextTab"), &stru_24DE30718, CFSTR("Localizable"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "arrayByAddingObject:", v21);
    v22 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v22;
  }
  return (NSArray *)v7;
}

- (BOOL)_viewControllerIdentifierIsAvailable:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;

  if (!a3)
    return 0;
  v4 = a3;
  -[TVRUINowPlayingViewController childViewControllerIdentifiers](self, "childViewControllerIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  return v6 != 0x7FFFFFFFFFFFFFFFLL;
}

- (NSArray)allPossibleChildViewControllerIdentifiers
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[5];

  v12[4] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("TVRemoteUIInfoTabTitle"), &stru_24DE30718, CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v3;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("TVRemoteUIInSightTabTitle"), &stru_24DE30718, CFSTR("Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v5;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("TVRemoteUIUpNextTab"), &stru_24DE30718, CFSTR("Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v7;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("TVRemoteUICastTab"), &stru_24DE30718, CFSTR("Localizable"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v10;
}

- (NSDictionary)childViewControllerDict
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[TVRUINowPlayingViewController nowPlayingInfoViewController](self, "nowPlayingInfoViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("TVRemoteUIInfoTabTitle"), &stru_24DE30718, CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, v6);

  -[TVRUINowPlayingViewController timedMetadataViewController](self, "timedMetadataViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[TVRUINowPlayingViewController timedMetadataViewController](self, "timedMetadataViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("TVRemoteUIInSightTabTitle"), &stru_24DE30718, CFSTR("Localizable"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, v10);

  }
  -[TVRUINowPlayingViewController upNextViewController](self, "upNextViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("TVRemoteUIUpNextTab"), &stru_24DE30718, CFSTR("Localizable"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, v13);

  -[TVRUINowPlayingViewController castViewController](self, "castViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("TVRemoteUICastTab"), &stru_24DE30718, CFSTR("Localizable"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, v16);

  return (NSDictionary *)v3;
}

- (unint64_t)indexForViewControllerIdentifier:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;

  v4 = a3;
  -[TVRUINowPlayingViewController childViewControllerIdentifiers](self, "childViewControllerIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObjectIdenticalTo:", v4);

  return v6;
}

- (id)viewControllerIdentifierForIndex:(unint64_t)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;

  -[TVRUINowPlayingViewController childViewControllerIdentifiers](self, "childViewControllerIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 <= a3)
  {
    v8 = 0;
  }
  else
  {
    -[TVRUINowPlayingViewController childViewControllerIdentifiers](self, "childViewControllerIdentifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)viewControllerForIndex:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[TVRUINowPlayingViewController viewControllerIdentifierForIndex:](self, "viewControllerIdentifierForIndex:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[TVRUINowPlayingViewController childViewControllerDict](self, "childViewControllerDict");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)viewControllerForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[TVRUINowPlayingViewController childViewControllerDict](self, "childViewControllerDict");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_reconfigureTabsIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  -[TVRUINowPlayingViewController tabSelectorControl](self, "tabSelectorControl");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUINowPlayingViewController childViewControllerIdentifiers](self, "childViewControllerIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateItems:animated:", v4, 1);

  -[TVRUINowPlayingViewController currentViewControllerIdentifier](self, "currentViewControllerIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[TVRUINowPlayingViewController indexForViewControllerIdentifier:](self, "indexForViewControllerIdentifier:", v5);

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[TVRUINowPlayingViewController nowPlayingInfo](self, "nowPlayingInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUINowPlayingViewController _availableTabToDisplayForNowPlayingInfo:](self, "_availableTabToDisplayForNowPlayingInfo:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUINowPlayingViewController setCurrentViewControllerIdentifier:](self, "setCurrentViewControllerIdentifier:", v8);

  }
  -[TVRUINowPlayingViewController currentViewControllerIdentifier](self, "currentViewControllerIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUINowPlayingViewController _updateViewControllerVisibilityForSelectedIdentifier:](self, "_updateViewControllerVisibilityForSelectedIdentifier:", v9);

  -[TVRUINowPlayingViewController _updateSelectorControlHeight](self, "_updateSelectorControlHeight");
}

- (void)_performTabAnimationFromIndex:(unint64_t)a3 toIndex:(unint64_t)a4 isInteractive:(BOOL)a5 interactivePercentage:(double)a6
{
  _BOOL8 v7;
  id v11;

  v7 = a5;
  +[TVRUICubicSpringAnimator standardSpringAnimator](TVRUICubicSpringAnimator, "standardSpringAnimator");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[TVRUINowPlayingViewController _performTabAnimationFromIndex:toIndex:isInteractive:interactivePercentage:animator:](self, "_performTabAnimationFromIndex:toIndex:isInteractive:interactivePercentage:animator:", a3, a4, v7, v11, a6);

}

- (void)_performTabAnimationFromIndex:(unint64_t)a3 toIndex:(unint64_t)a4 isInteractive:(BOOL)a5 interactivePercentage:(double)a6 animator:(id)a7
{
  _BOOL4 v8;
  void *v12;
  uint64_t v13;
  void *v14;
  BOOL v15;
  int v17;
  void *v18;
  void *v19;
  id v20;
  void (**v21)(_QWORD);
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  double Width;
  char v33;
  NSObject *v34;
  void *v35;
  void *v36;
  double v37;
  _OWORD *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  __int128 v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t i;
  void *v48;
  void *v49;
  void *v50;
  NSObject *v51;
  uint64_t v52;
  id v53;
  BOOL v54;
  void (**v55)(_QWORD);
  id v56;
  void *v57;
  void *v58;
  void *v59;
  NSObject *v60;
  _BOOL4 v61;
  id v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _QWORD v66[4];
  id v67;
  void (**v68)(_QWORD);
  _QWORD v69[4];
  id v70;
  id v71;
  double v72;
  BOOL v73;
  _OWORD v74[3];
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _OWORD v79[3];
  CGAffineTransform v80;
  CGAffineTransform v81;
  _QWORD aBlock[5];
  id v83;
  uint8_t v84[128];
  uint8_t buf[4];
  void *v86;
  uint64_t v87;
  CGRect v88;

  v8 = a5;
  v87 = *MEMORY[0x24BDAC8D0];
  v62 = a7;
  -[TVRUINowPlayingViewController viewControllerForIndex:](self, "viewControllerForIndex:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUINowPlayingViewController viewControllerForIndex:](self, "viewControllerForIndex:", a3);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v12)
    v15 = v13 == 0;
  else
    v15 = 1;
  v17 = !v15 && a4 != a3;
  -[TVRUINowPlayingViewController viewControllerIdentifierForIndex:](self, "viewControllerIdentifierForIndex:", a4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUINowPlayingViewController setCurrentViewControllerIdentifier:](self, "setCurrentViewControllerIdentifier:", v18);
  -[TVRUINowPlayingViewController currentViewControllerIdentifier](self, "currentViewControllerIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUINowPlayingViewController setLastExplicitUserSelectedViewControllerIdentifier:](self, "setLastExplicitUserSelectedViewControllerIdentifier:", v19);

  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __116__TVRUINowPlayingViewController__performTabAnimationFromIndex_toIndex_isInteractive_interactivePercentage_animator___block_invoke;
  aBlock[3] = &unk_24DE2C830;
  aBlock[4] = self;
  v20 = v18;
  v83 = v20;
  v21 = (void (**)(_QWORD))_Block_copy(aBlock);
  v61 = v8;
  if (v8)
  {
    -[TVRUINowPlayingViewController tabSelectorControl](self, "tabSelectorControl");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setSelectedIndex:", a4);

  }
  if (v17)
  {
    v55 = v21;
    -[TVRUINowPlayingViewController currentAnimationState](self, "currentAnimationState");
    v23 = objc_claimAutoreleasedReturnValue();
    +[_TVRUIAnimationState animationStateWithIndex:previousIndex:toViewController:fromViewController:isInteractive:](_TVRUIAnimationState, "animationStateWithIndex:previousIndex:toViewController:fromViewController:isInteractive:", a4, a3, v12, v14, v61);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = v20;
    -[TVRUINowPlayingViewController _callChildViewControllerAppearanceForAppearingIdentifier:](self, "_callChildViewControllerAppearanceForAppearingIdentifier:", v20);
    -[TVRUINowPlayingViewController currentTabSelectionAnimator](self, "currentTabSelectionAnimator");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v24, "isRunning") & 1) != 0)
    {
      -[TVRUINowPlayingViewController currentTabSelectionAnimator](self, "currentTabSelectionAnimator");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "isInterruptible");

      if (v26)
      {
        -[TVRUINowPlayingViewController currentTabSelectionAnimator](self, "currentTabSelectionAnimator");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "stopAnimation:", 0);

        -[TVRUINowPlayingViewController currentTabSelectionAnimator](self, "currentTabSelectionAnimator");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "finishAnimationAtPosition:", 2);

        -[TVRUINowPlayingViewController setCurrentTabSelectionAnimator:](self, "setCurrentTabSelectionAnimator:", 0);
      }
    }
    else
    {

    }
    -[TVRUINowPlayingViewController view](self, "view");
    v31 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v31, "bounds");
    Width = CGRectGetWidth(v88);

    v54 = a4 < a3;
    LOBYTE(v31) = -[NSObject isParticpantViewController:](v23, "isParticpantViewController:", v12);
    v58 = v14;
    v33 = -[NSObject isParticpantViewController:](v23, "isParticpantViewController:", v14);
    v60 = v23;
    if ((v31 & 1) != 0)
    {
      _TVRUINowPlayingLog();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v86 = v35;
        _os_log_impl(&dword_21B042000, v34, OS_LOG_TYPE_INFO, "ANIM: viewController @ index=%@ is currently animating, not setting transform.", buf, 0xCu);

      }
    }
    else
    {
      objc_msgSend(v12, "view");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setHidden:", 0);

      v37 = -Width;
      if (a4 >= a3)
        v37 = Width;
      CGAffineTransformMakeTranslation(&v81, v37, 0.0);
      objc_msgSend(v12, "view");
      v34 = objc_claimAutoreleasedReturnValue();
      v80 = v81;
      -[NSObject setTransform:](v34, "setTransform:", &v80);
    }

    v38 = (_OWORD *)MEMORY[0x24BDBD8B8];
    v57 = v12;
    if ((v33 & 1) != 0)
    {
      _TVRUINowPlayingLog();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v86 = v40;
        _os_log_impl(&dword_21B042000, v39, OS_LOG_TYPE_INFO, "ANIM: previous VC @ index=%@ is currently animating, not resetting hidden state = NO", buf, 0xCu);

      }
    }
    else
    {
      objc_msgSend(v58, "view");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setHidden:", 0);

      objc_msgSend(v58, "view");
      v39 = objc_claimAutoreleasedReturnValue();
      v42 = v38[1];
      v79[0] = *v38;
      v79[1] = v42;
      v79[2] = v38[2];
      -[NSObject setTransform:](v39, "setTransform:", v79);
    }

    -[NSObject viewControllersNoLongerAnimatingForDestinationAnimationState:](v23, "viewControllersNoLongerAnimatingForDestinationAnimationState:", v59);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = 0u;
    v76 = 0u;
    v77 = 0u;
    v78 = 0u;
    v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v75, v84, 16);
    if (v44)
    {
      v45 = v44;
      v46 = *(_QWORD *)v76;
      v64 = v38[1];
      v65 = *v38;
      v63 = v38[2];
      do
      {
        for (i = 0; i != v45; ++i)
        {
          if (*(_QWORD *)v76 != v46)
            objc_enumerationMutation(v43);
          v48 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * i);
          objc_msgSend(v48, "view");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "setHidden:", 1);

          objc_msgSend(v48, "view");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v74[0] = v65;
          v74[1] = v64;
          v74[2] = v63;
          objc_msgSend(v50, "setTransform:", v74);

          _TVRUINowPlayingLog();
          v51 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v86 = v48;
            _os_log_impl(&dword_21B042000, v51, OS_LOG_TYPE_INFO, "ANIM: resetting VC (which is no longering in animation) %@", buf, 0xCu);
          }

        }
        v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v75, v84, 16);
      }
      while (v45);
    }
    v52 = MEMORY[0x24BDAC760];
    v69[0] = MEMORY[0x24BDAC760];
    v69[1] = 3221225472;
    v69[2] = __116__TVRUINowPlayingViewController__performTabAnimationFromIndex_toIndex_isInteractive_interactivePercentage_animator___block_invoke_42;
    v69[3] = &unk_24DE2D140;
    v12 = v57;
    v70 = v57;
    v14 = v58;
    v53 = v58;
    v71 = v53;
    v73 = v54;
    v72 = Width;
    v30 = v62;
    objc_msgSend(v62, "addAnimations:", v69);
    v66[0] = v52;
    v66[1] = 3221225472;
    v66[2] = __116__TVRUINowPlayingViewController__performTabAnimationFromIndex_toIndex_isInteractive_interactivePercentage_animator___block_invoke_43;
    v66[3] = &unk_24DE2D168;
    v67 = v53;
    v21 = v55;
    v68 = v55;
    objc_msgSend(v62, "addCompletion:", v66);
    if (v61)
    {
      objc_msgSend(v62, "setScrubsLinearly:", 1);
      objc_msgSend(v62, "setFractionComplete:", a6);
      objc_msgSend(v62, "pauseAnimation");
    }
    else
    {
      objc_msgSend(v62, "startAnimation");
    }
    v20 = v56;
    -[TVRUINowPlayingViewController setCurrentAnimationState:](self, "setCurrentAnimationState:", v59);
    -[TVRUINowPlayingViewController setCurrentTabSelectionAnimator:](self, "setCurrentTabSelectionAnimator:", v62);

    v29 = v60;
  }
  else
  {
    v21[2](v21);
    _TVRUINowPlayingLog();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21B042000, v29, OS_LOG_TYPE_INFO, "ANIM: not possible to animate, commiting immediately to final state.", buf, 2u);
    }
    v30 = v62;
  }

}

uint64_t __116__TVRUINowPlayingViewController__performTabAnimationFromIndex_toIndex_isInteractive_interactivePercentage_animator___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setCurrentAnimationState:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setCurrentTabSelectionAnimator:", 0);
  objc_msgSend(*(id *)(a1 + 32), "_updateViewControllerVisibilityForSelectedIdentifier:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_callChildViewControllerDisappearingForAllExceptIdentifier:", *(_QWORD *)(a1 + 40));
}

void __116__TVRUINowPlayingViewController__performTabAnimationFromIndex_toIndex_isInteractive_interactivePercentage_animator___block_invoke_42(uint64_t a1)
{
  void *v2;
  __int128 v3;
  double v4;
  void *v5;
  NSObject *v6;
  uint8_t v7[16];
  CGAffineTransform v8;
  CGAffineTransform v9;
  _OWORD v10[3];

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v10[0] = *MEMORY[0x24BDBD8B8];
  v10[1] = v3;
  v10[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  objc_msgSend(v2, "setTransform:", v10);

  v4 = *(double *)(a1 + 48);
  if (!*(_BYTE *)(a1 + 56))
    v4 = -v4;
  CGAffineTransformMakeTranslation(&v9, v4, 0.0);
  objc_msgSend(*(id *)(a1 + 40), "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v9;
  objc_msgSend(v5, "setTransform:", &v8);

  _TVRUINowPlayingLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_21B042000, v6, OS_LOG_TYPE_INFO, "ANIM: animations firing...", v7, 2u);
  }

}

void __116__TVRUINowPlayingViewController__performTabAnimationFromIndex_toIndex_isInteractive_interactivePercentage_animator___block_invoke_43(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  __int128 v8;
  _OWORD v9[3];
  uint8_t buf[16];

  _TVRUINowPlayingLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (a2)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21B042000, v4, OS_LOG_TYPE_INFO, "ANIM: animation completion firing, but doing nothing as the finalPosition != .end", buf, 2u);
    }

  }
  else
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21B042000, v4, OS_LOG_TYPE_INFO, "ANIM: animation completion firing.", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHidden:", 1);

    objc_msgSend(*(id *)(a1 + 32), "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    v9[0] = *MEMORY[0x24BDBD8B8];
    v9[1] = v8;
    v9[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
    objc_msgSend(v7, "setTransform:", v9);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

- (void)tabSelectorControl:(id)a3 didSelectIndex:(unint64_t)a4 previousIndex:(unint64_t)a5
{
  -[TVRUINowPlayingViewController _performTabAnimationFromIndex:toIndex:isInteractive:interactivePercentage:](self, "_performTabAnimationFromIndex:toIndex:isInteractive:interactivePercentage:", a5, a4, 0, 0.0);
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  void *v5;
  char v6;
  BOOL v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  CGRect v21;

  v4 = a3;
  -[TVRUINowPlayingViewController nowPlayingInfoViewController](self, "nowPlayingInfoViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInteractionInProgress");

  if ((v6 & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    -[TVRUINowPlayingViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "locationInView:", v8);
    v10 = v9;

    -[TVRUINowPlayingViewController tabSelectorControl](self, "tabSelectorControl");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "frame");
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;

    v21.origin.x = v13;
    v21.origin.y = v15;
    v21.size.width = v17;
    v21.size.height = v19;
    v7 = v10 > CGRectGetMaxY(v21);
  }

  return v7;
}

- (TVRUIUpNextProviding)upNextProvider
{
  return (TVRUIUpNextProviding *)objc_loadWeakRetained((id *)&self->_upNextProvider);
}

- (void)setUpNextProvider:(id)a3
{
  objc_storeWeak((id *)&self->_upNextProvider, a3);
}

- (TVRUISharingProviding)sharingProvider
{
  return (TVRUISharingProviding *)objc_loadWeakRetained((id *)&self->_sharingProvider);
}

- (void)setSharingProvider:(id)a3
{
  objc_storeWeak((id *)&self->_sharingProvider, a3);
}

- (TVRCNowPlayingInfo)nowPlayingInfo
{
  return self->_nowPlayingInfo;
}

- (TVRUIDevice)activeDevice
{
  return self->_activeDevice;
}

- (void)setActiveDevice:(id)a3
{
  objc_storeStrong((id *)&self->_activeDevice, a3);
}

- (TVRUITabSelectorControl)tabSelectorControl
{
  return self->_tabSelectorControl;
}

- (void)setTabSelectorControl:(id)a3
{
  objc_storeStrong((id *)&self->_tabSelectorControl, a3);
}

- (NSLayoutConstraint)tabSelectorControlHeightConstraint
{
  return self->_tabSelectorControlHeightConstraint;
}

- (void)setTabSelectorControlHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_tabSelectorControlHeightConstraint, a3);
}

- (UIView)dividerView
{
  return self->_dividerView;
}

- (void)setDividerView:(id)a3
{
  objc_storeStrong((id *)&self->_dividerView, a3);
}

- (TVRUINowPlayingMiniPlayerViewController)nowPlayingMiniPlayerViewController
{
  return self->_nowPlayingMiniPlayerViewController;
}

- (void)setNowPlayingMiniPlayerViewController:(id)a3
{
  objc_storeStrong((id *)&self->_nowPlayingMiniPlayerViewController, a3);
}

- (TVRUIMiniPlayerMediaControlsViewController)mediaControlsViewController
{
  return self->_mediaControlsViewController;
}

- (void)setMediaControlsViewController:(id)a3
{
  objc_storeStrong((id *)&self->_mediaControlsViewController, a3);
}

- (TVRUINowPlayingInfoViewController)nowPlayingInfoViewController
{
  return self->_nowPlayingInfoViewController;
}

- (void)setNowPlayingInfoViewController:(id)a3
{
  objc_storeStrong((id *)&self->_nowPlayingInfoViewController, a3);
}

- (TVRUIUpNextViewController)upNextViewController
{
  return self->_upNextViewController;
}

- (void)setUpNextViewController:(id)a3
{
  objc_storeStrong((id *)&self->_upNextViewController, a3);
}

- (TVRUICastViewController)castViewController
{
  return self->_castViewController;
}

- (void)setCastViewController:(id)a3
{
  objc_storeStrong((id *)&self->_castViewController, a3);
}

- (NSString)currentViewControllerIdentifier
{
  return self->_currentViewControllerIdentifier;
}

- (void)setCurrentViewControllerIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_currentViewControllerIdentifier, a3);
}

- (NSString)lastExplicitUserSelectedViewControllerIdentifier
{
  return self->_lastExplicitUserSelectedViewControllerIdentifier;
}

- (void)setLastExplicitUserSelectedViewControllerIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_lastExplicitUserSelectedViewControllerIdentifier, a3);
}

- (UIViewPropertyAnimator)currentTabSelectionAnimator
{
  return self->_currentTabSelectionAnimator;
}

- (void)setCurrentTabSelectionAnimator:(id)a3
{
  objc_storeStrong((id *)&self->_currentTabSelectionAnimator, a3);
}

- (_TVRUIAnimationState)currentAnimationState
{
  return self->_currentAnimationState;
}

- (void)setCurrentAnimationState:(id)a3
{
  objc_storeStrong((id *)&self->_currentAnimationState, a3);
}

- (BOOL)interactiveSwipeGestureIsApplyingRubberbandingTransform
{
  return self->_interactiveSwipeGestureIsApplyingRubberbandingTransform;
}

- (void)setInteractiveSwipeGestureIsApplyingRubberbandingTransform:(BOOL)a3
{
  self->_interactiveSwipeGestureIsApplyingRubberbandingTransform = a3;
}

- (unint64_t)lastLayoutWidth
{
  return self->_lastLayoutWidth;
}

- (void)setLastLayoutWidth:(unint64_t)a3
{
  self->_lastLayoutWidth = a3;
}

- (VUITimeMetadataViewController)timedMetadataViewController
{
  return self->_timedMetadataViewController;
}

- (void)setTimedMetadataViewController:(id)a3
{
  objc_storeStrong((id *)&self->_timedMetadataViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timedMetadataViewController, 0);
  objc_storeStrong((id *)&self->_currentAnimationState, 0);
  objc_storeStrong((id *)&self->_currentTabSelectionAnimator, 0);
  objc_storeStrong((id *)&self->_lastExplicitUserSelectedViewControllerIdentifier, 0);
  objc_storeStrong((id *)&self->_currentViewControllerIdentifier, 0);
  objc_storeStrong((id *)&self->_castViewController, 0);
  objc_storeStrong((id *)&self->_upNextViewController, 0);
  objc_storeStrong((id *)&self->_nowPlayingInfoViewController, 0);
  objc_storeStrong((id *)&self->_mediaControlsViewController, 0);
  objc_storeStrong((id *)&self->_nowPlayingMiniPlayerViewController, 0);
  objc_storeStrong((id *)&self->_dividerView, 0);
  objc_storeStrong((id *)&self->_tabSelectorControlHeightConstraint, 0);
  objc_storeStrong((id *)&self->_tabSelectorControl, 0);
  objc_storeStrong((id *)&self->_activeDevice, 0);
  objc_storeStrong((id *)&self->_nowPlayingInfo, 0);
  objc_destroyWeak((id *)&self->_sharingProvider);
  objc_destroyWeak((id *)&self->_upNextProvider);
}

@end
