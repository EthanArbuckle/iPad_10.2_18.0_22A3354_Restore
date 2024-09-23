@implementation MTATimerPresetsCell

- (MTATimerPresetsCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  MTATimerPresetsCell *v4;
  MTATimerPresetsCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTATimerPresetsCell;
  v4 = -[MTATimerPresetsCell initWithStyle:reuseIdentifier:](&v7, "initWithStyle:reuseIdentifier:", a3, a4);
  v5 = v4;
  if (v4)
  {
    -[MTATimerPresetsCell localSetup](v4, "localSetup");
    -[MTATimerPresetsCell setupLayoutConstraints](v5, "setupLayoutConstraints");
  }
  return v5;
}

- (void)localSetup
{
  MTAPresetsViewController *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = -[MTAPresetsViewController initWithDelegate:]([MTAPresetsViewController alloc], "initWithDelegate:", 0);
  -[MTATimerPresetsCell setPresetsController:](self, "setPresetsController:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerPresetsCell presetsController](self, "presetsController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v8 = (id)objc_claimAutoreleasedReturnValue(-[MTATimerPresetsCell contentView](self, "contentView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerPresetsCell presetsController](self, "presetsController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
  objc_msgSend(v8, "addSubview:", v7);

}

- (void)setupLayoutConstraints
{
  void *v3;
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSMutableArray *v25;

  v25 = objc_opt_new(NSMutableArray);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerPresetsCell presetsController](self, "presetsController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "view"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "leadingAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerPresetsCell contentView](self, "contentView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "safeAreaLayoutGuide"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "leadingAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToAnchor:", v8));
  -[NSMutableArray addObject:](v25, "addObject:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "trailingAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerPresetsCell contentView](self, "contentView"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "safeAreaLayoutGuide"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "trailingAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v13));
  -[NSMutableArray addObject:](v25, "addObject:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerPresetsCell contentView](self, "contentView"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "safeAreaLayoutGuide"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "topAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:", v18));
  -[NSMutableArray addObject:](v25, "addObject:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bottomAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerPresetsCell contentView](self, "contentView"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "safeAreaLayoutGuide"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "bottomAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:", v23));
  -[NSMutableArray addObject:](v25, "addObject:", v24);

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v25);
}

- (void)setDelegate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[MTATimerPresetsCell presetsController](self, "presetsController"));
  objc_msgSend(v5, "setDelegate:", v4);

}

- (MTAPresetsViewController)presetsController
{
  return self->_presetsController;
}

- (void)setPresetsController:(id)a3
{
  objc_storeStrong((id *)&self->_presetsController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presetsController, 0);
}

@end
