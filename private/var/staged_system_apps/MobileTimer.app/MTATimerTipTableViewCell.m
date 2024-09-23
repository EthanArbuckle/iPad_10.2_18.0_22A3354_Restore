@implementation MTATimerTipTableViewCell

- (MTATimerTipTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  MTATimerTipTableViewCell *v4;
  MTATimerTipTableViewCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTATimerTipTableViewCell;
  v4 = -[MTATimerTipTableViewCell initWithStyle:reuseIdentifier:](&v7, "initWithStyle:reuseIdentifier:", a3, a4);
  v5 = v4;
  if (v4)
    -[MTATimerTipTableViewCell setSeparatorInset:](v4, "setSeparatorInset:", 0.0, 0.0, 0.0, 0.0);
  return v5;
}

- (void)prepareForReuse
{
  UIView *siriTipView;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MTATimerTipTableViewCell;
  -[MTATimerTipTableViewCell prepareForReuse](&v4, "prepareForReuse");
  -[UIView removeFromSuperview](self->_siriTipView, "removeFromSuperview");
  siriTipView = self->_siriTipView;
  self->_siriTipView = 0;

}

- (void)setSiriTipView:(id)a3
{
  UIView *v5;
  id *p_siriTipView;
  UIView *siriTipView;
  id v8;
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
  _QWORD v23[4];

  v5 = (UIView *)a3;
  p_siriTipView = (id *)&self->_siriTipView;
  siriTipView = self->_siriTipView;
  if (siriTipView != v5)
  {
    -[UIView removeFromSuperview](siriTipView, "removeFromSuperview");
    v8 = *p_siriTipView;
    *p_siriTipView = 0;

    if (v5)
    {
      objc_storeStrong((id *)&self->_siriTipView, a3);
      objc_msgSend(*p_siriTipView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerTipTableViewCell contentView](self, "contentView"));
      objc_msgSend(v9, "addSubview:", *p_siriTipView);
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_siriTipView, "leadingAnchor"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "leadingAnchor"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:constant:", v21, 16.0));
      v23[0] = v20;
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_siriTipView, "trailingAnchor"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "trailingAnchor"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:constant:", v18, -16.0));
      v23[1] = v10;
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_siriTipView, "topAnchor"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "topAnchor"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:constant:", v12, 0.0));
      v23[2] = v13;
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_siriTipView, "bottomAnchor"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bottomAnchor"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:constant:", v15, 0.0));
      v23[3] = v16;
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v23, 4));
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v17);

    }
  }

}

+ (CGSize)sizeThatFits:(CGSize)a3 siriTipView:(id)a4
{
  double v4;
  double v5;
  double v6;
  CGSize result;

  LODWORD(v4) = 1112014848;
  objc_msgSend(a4, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", a3.width + -32.0, a3.height, -32.0000082, v4);
  result.height = v6;
  result.width = v5;
  return result;
}

- (UIView)siriTipView
{
  return self->_siriTipView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriTipView, 0);
}

@end
