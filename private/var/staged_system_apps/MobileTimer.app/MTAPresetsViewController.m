@implementation MTAPresetsViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (MTAPresetsViewController)initWithDelegate:(id)a3
{
  id v4;
  MTAPresetsViewController *v5;
  MTAPresetsViewController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MTAPresetsViewController;
  v5 = -[MTAPresetsViewController init](&v8, "init");
  v6 = v5;
  if (v5)
  {
    -[MTAPresetsViewController setupCollectionControllerWithDelegate:](v5, "setupCollectionControllerWithDelegate:", v4);
    -[MTAPresetsViewController setupLayoutConstraints](v6, "setupLayoutConstraints");
  }

  return v6;
}

- (void)viewDidLoad
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)MTAPresetsViewController;
  -[MTAPresetsViewController viewDidLoad](&v2, "viewDidLoad");
}

- (void)setupCollectionControllerWithDelegate:(id)a3
{
  id v4;
  MTAPresetsCollectionViewController *v5;
  void *v6;
  MTAPresetsCollectionViewController *v7;
  MTAPresetsCollectionViewController *collectionController;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a3;
  v5 = [MTAPresetsCollectionViewController alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MTATimerPresetItem mockItems](MTATimerPresetItem, "mockItems"));
  v7 = -[MTAPresetsCollectionViewController initWithItems:presetsDelegate:](v5, "initWithItems:presetsDelegate:", v6, v4);

  collectionController = self->_collectionController;
  self->_collectionController = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTAPresetsCollectionViewController collectionView](self->_collectionController, "collectionView"));
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTAPresetsCollectionViewController collectionView](self->_collectionController, "collectionView"));
  objc_msgSend(v10, "setContentInset:", 0.0, 16.0, 0.0, 16.0);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTAPresetsCollectionViewController collectionView](self->_collectionController, "collectionView"));
  objc_msgSend(v11, "setHoverStyle:", 0);

  v13 = (id)objc_claimAutoreleasedReturnValue(-[MTAPresetsViewController view](self, "view"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTAPresetsCollectionViewController collectionView](self->_collectionController, "collectionView"));
  objc_msgSend(v13, "addSubview:", v12);

}

- (void)setupLayoutConstraints
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSMutableArray *v33;

  v33 = objc_opt_new(NSMutableArray);
  v3 = objc_opt_self(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "collectionController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "collectionView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "topAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTAPresetsViewController view](self, "view"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "topAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintEqualToAnchor:", v9));
  -[NSMutableArray addObject:](v33, "addObject:", v10);

  v11 = objc_opt_self(self);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "collectionController"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "collectionView"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "leadingAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTAPresetsViewController view](self, "view"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "leadingAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:", v17));
  -[NSMutableArray addObject:](v33, "addObject:", v18);

  v19 = objc_opt_self(self);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "collectionController"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "collectionView"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "trailingAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[MTAPresetsViewController view](self, "view"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "trailingAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:", v25));
  -[NSMutableArray addObject:](v33, "addObject:", v26);

  v27 = objc_opt_self(self);
  v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "collectionController"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "collectionView"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "heightAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToConstant:", 90.0));
  -[NSMutableArray addObject:](v33, "addObject:", v32);

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v33);
}

- (void)setDelegate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[MTAPresetsViewController collectionController](self, "collectionController"));
  objc_msgSend(v5, "setPresetsDelegate:", v4);

}

- (MTAPresetsCollectionViewController)collectionController
{
  return self->_collectionController;
}

- (void)setCollectionController:(id)a3
{
  objc_storeStrong((id *)&self->_collectionController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionController, 0);
}

@end
