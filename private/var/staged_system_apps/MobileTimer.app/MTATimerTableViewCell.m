@implementation MTATimerTableViewCell

+ (double)estimatedCellHeightForTimerWithTitle:(id)a3
{
  double result;

  +[MTATimerCellView estimatedHeightForTimerWithTitle:](MTATimerCellView, "estimatedHeightForTimerWithTitle:", a3);
  if (result <= 110.0)
    return 110.0;
  return result;
}

- (MTATimerTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  MTATimerTableViewCell *v4;
  MTATimerTableViewCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTATimerTableViewCell;
  v4 = -[MTATimerTableViewCell initWithStyle:reuseIdentifier:](&v7, "initWithStyle:reuseIdentifier:", a3, a4);
  v5 = v4;
  if (v4)
  {
    -[MTATimerTableViewCell localSetup](v4, "localSetup");
    -[MTATimerTableViewCell setupLayoutConstraints](v5, "setupLayoutConstraints");
  }
  return v5;
}

- (void)localSetup
{
  MTATimerCellView *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = -[MTATimerCellView initWithDelegate:]([MTATimerCellView alloc], "initWithDelegate:", self);
  -[MTATimerTableViewCell setTimerCellView:](self, "setTimerCellView:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerTableViewCell timerCellView](self, "timerCellView"));
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[MTATimerTableViewCell setEditingAccessoryType:](self, "setEditingAccessoryType:", 1);
  v6 = (id)objc_claimAutoreleasedReturnValue(-[MTATimerTableViewCell contentView](self, "contentView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerTableViewCell timerCellView](self, "timerCellView"));
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
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerTableViewCell timerCellView](self, "timerCellView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "leadingAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerTableViewCell contentView](self, "contentView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "safeAreaLayoutGuide"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "leadingAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToAnchor:", v7));
  -[NSMutableArray addObject:](v27, "addObject:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerTableViewCell timerCellView](self, "timerCellView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "trailingAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerTableViewCell contentView](self, "contentView"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "safeAreaLayoutGuide"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "trailingAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v13));
  -[NSMutableArray addObject:](v27, "addObject:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerTableViewCell timerCellView](self, "timerCellView"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "topAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerTableViewCell contentView](self, "contentView"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "safeAreaLayoutGuide"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "topAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v19));
  -[NSMutableArray addObject:](v27, "addObject:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerTableViewCell timerCellView](self, "timerCellView"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "bottomAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerTableViewCell contentView](self, "contentView"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "safeAreaLayoutGuide"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "bottomAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v25));
  -[NSMutableArray addObject:](v27, "addObject:", v26);

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v27);
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  double v7;
  objc_super v8;
  _QWORD v9[5];
  BOOL v10;

  v4 = a4;
  v5 = a3;
  v7 = 0.0;
  if (a4)
    +[CATransaction animationDuration](CATransaction, "animationDuration", 0.0);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000456E4;
  v9[3] = &unk_1000997B8;
  v9[4] = self;
  v10 = v5;
  +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v9, v7);
  v8.receiver = self;
  v8.super_class = (Class)MTATimerTableViewCell;
  -[MTATimerTableViewCell setEditing:animated:](&v8, "setEditing:animated:", v5, v4);
}

- (void)tickWithTimer:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[MTATimerTableViewCell timerCellView](self, "timerCellView"));
  objc_msgSend(v5, "tickWithTimer:", v4);

}

- (void)setRemainingTime:(double)a3 duration:(double)a4 state:(unint64_t)a5 title:(id)a6 forceRefresh:(BOOL)a7
{
  _BOOL8 v7;
  id v12;
  id v13;

  v7 = a7;
  v12 = a6;
  v13 = (id)objc_claimAutoreleasedReturnValue(-[MTATimerTableViewCell timerCellView](self, "timerCellView"));
  objc_msgSend(v13, "setRemainingTime:duration:state:title:forceRefresh:", a5, v12, v7, a3, a4);

}

- (void)didSendPauseAction
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[MTATimerTableViewCell delegate](self, "delegate"));
  objc_msgSend(v3, "didSendPauseAction:", self);

}

- (void)didSendResumeAction
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[MTATimerTableViewCell delegate](self, "delegate"));
  objc_msgSend(v3, "didSendResumeAction:", self);

}

- (MTATimerTableViewCellDelegate)delegate
{
  return (MTATimerTableViewCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (MTATimerCellView)timerCellView
{
  return self->_timerCellView;
}

- (void)setTimerCellView:(id)a3
{
  objc_storeStrong((id *)&self->_timerCellView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timerCellView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
