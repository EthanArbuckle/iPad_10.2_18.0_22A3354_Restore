@implementation MTATimerControlsCell

- (MTATimerControlsCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  MTATimerControlsCell *v4;
  MTATimerControlsCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTATimerControlsCell;
  v4 = -[MTATimerControlsCell initWithStyle:reuseIdentifier:](&v7, "initWithStyle:reuseIdentifier:", a3, a4);
  v5 = v4;
  if (v4)
  {
    -[MTATimerControlsCell localSetup](v4, "localSetup");
    -[MTATimerControlsCell setupLayoutConstraints](v5, "setupLayoutConstraints");
  }
  return v5;
}

- (void)localSetup
{
  MTATimerControlsView *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = -[MTATimerControlsView initWithDelegate:style:timerControlState:]([MTATimerControlsView alloc], "initWithDelegate:style:timerControlState:", 0, -[MTATimerControlsCell timerViewStyle](self, "timerViewStyle"), 0);
  -[MTATimerControlsCell setControlsView:](self, "setControlsView:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerControlsCell controlsView](self, "controlsView"));
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v6 = (id)objc_claimAutoreleasedReturnValue(-[MTATimerControlsCell contentView](self, "contentView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerControlsCell controlsView](self, "controlsView"));
  objc_msgSend(v6, "addSubview:", v5);

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
  void *v25;
  void *v26;
  NSMutableArray *v27;

  v27 = objc_opt_new(NSMutableArray);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerControlsCell controlsView](self, "controlsView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "leadingAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerControlsCell contentView](self, "contentView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "safeAreaLayoutGuide"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "leadingAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToAnchor:", v7));
  -[NSMutableArray addObject:](v27, "addObject:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerControlsCell controlsView](self, "controlsView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "trailingAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerControlsCell contentView](self, "contentView"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "safeAreaLayoutGuide"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "trailingAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v13));
  -[NSMutableArray addObject:](v27, "addObject:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerControlsCell controlsView](self, "controlsView"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "topAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerControlsCell contentView](self, "contentView"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "safeAreaLayoutGuide"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "topAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v19));
  -[NSMutableArray addObject:](v27, "addObject:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerControlsCell controlsView](self, "controlsView"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "bottomAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerControlsCell contentView](self, "contentView"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "safeAreaLayoutGuide"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "bottomAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v25));
  -[NSMutableArray addObject:](v27, "addObject:", v26);

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v27);
}

- (BOOL)edited
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerControlsCell controlsView](self, "controlsView"));
  v3 = objc_msgSend(v2, "edited");

  return v3;
}

- (unint64_t)timerViewStyle
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerControlsCell traitCollection](self, "traitCollection"));
  v3 = objc_msgSend(v2, "horizontalSizeClass");

  if (v3 == (id)1)
    return 1;
  else
    return 3;
}

- (void)setDelegate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[MTATimerControlsCell controlsView](self, "controlsView"));
  objc_msgSend(v5, "setControlsViewDelegate:", v4);

}

- (void)setDuration:(double)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[MTATimerControlsCell controlsView](self, "controlsView"));
  objc_msgSend(v4, "setCountDownDuration:", a3);

}

- (double)getCurrentDuration
{
  double result;

  -[MTATimerControlsView countDownDuration](self->_controlsView, "countDownDuration");
  return result;
}

- (id)getCurrentLabel
{
  return -[MTATimerControlsView getCurrentLabel](self->_controlsView, "getCurrentLabel");
}

- (void)setTimerToneName:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[MTATimerControlsCell controlsView](self, "controlsView"));
  objc_msgSend(v5, "setTimerToneName:", v4);

}

- (MTATimerControlsView)controlsView
{
  return self->_controlsView;
}

- (void)setControlsView:(id)a3
{
  objc_storeStrong((id *)&self->_controlsView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controlsView, 0);
}

@end
