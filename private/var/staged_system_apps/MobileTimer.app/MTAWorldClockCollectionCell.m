@implementation MTAWorldClockCollectionCell

- (MTAWorldClockCollectionCell)initWithFrame:(CGRect)a3
{
  MTAWorldClockCollectionCell *v3;
  MTAWorldClockCollectionCell *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  MTAWorldClockView *v9;
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
  MTAWorldClockCollectionCell *v23;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)MTAWorldClockCollectionCell;
  v3 = -[MTAWorldClockCollectionCell initWithFrame:](&v25, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockCollectionCell contentView](v3, "contentView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_foregroundColor](UIColor, "mtui_foregroundColor"));
    objc_msgSend(v5, "setBackgroundColor:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockCollectionCell contentView](v4, "contentView"));
    objc_msgSend(v7, "setAutoresizingMask:", 18);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockCollectionCell contentView](v4, "contentView"));
    objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 1);

    v9 = -[MTAWorldClockView initWithFrame:]([MTAWorldClockView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    -[MTAWorldClockCollectionCell setWorldClockView:](v4, "setWorldClockView:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockCollectionCell contentView](v4, "contentView"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockCollectionCell worldClockView](v4, "worldClockView"));
    objc_msgSend(v10, "addSubview:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 0));
    -[MTAWorldClockCollectionCell setDeleteButton:](v4, "setDeleteButton:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockCollectionCell deleteButton](v4, "deleteButton"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage mtui_deleteButtonImage](UIImage, "mtui_deleteButtonImage"));
    objc_msgSend(v13, "setImage:forState:", v14, 0);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockCollectionCell deleteButton](v4, "deleteButton"));
    objc_msgSend(v15, "addTarget:action:forControlEvents:", v4, "deleteTapped:", 64);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockCollectionCell deleteButton](v4, "deleteButton"));
    objc_msgSend(v16, "setAccessibilityIdentifier:", CFSTR("Remove clock"));

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIShape circleShape](UIShape, "circleShape"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockCollectionCell deleteButton](v4, "deleteButton"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "hoverStyle"));
    objc_msgSend(v19, "setShape:", v17);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockCollectionCell contentView](v4, "contentView"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockCollectionCell deleteButton](v4, "deleteButton"));
    objc_msgSend(v20, "addSubview:", v21);

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockCollectionCell deleteButton](v4, "deleteButton"));
    objc_msgSend(v22, "setAlpha:", 0.0);

    v23 = v4;
  }

  return v4;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  CGFloat v10;
  double Height;
  void *v12;
  objc_super v13;
  CGRect v14;
  CGRect v15;

  v13.receiver = self;
  v13.super_class = (Class)MTAWorldClockCollectionCell;
  -[MTAWorldClockCollectionCell layoutSubviews](&v13, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockCollectionCell deleteButton](self, "deleteButton"));
  objc_msgSend(v3, "sizeToFit");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockCollectionCell deleteButton](self, "deleteButton"));
  objc_msgSend(v4, "frame");
  v6 = v5;
  v8 = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockCollectionCell deleteButton](self, "deleteButton"));
  objc_msgSend(v9, "setFrame:", 24.0, 24.0, v6, v8);

  -[MTAWorldClockCollectionCell bounds](self, "bounds");
  v10 = CGRectGetWidth(v14) + -32.0;
  -[MTAWorldClockCollectionCell bounds](self, "bounds");
  Height = CGRectGetHeight(v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockCollectionCell worldClockView](self, "worldClockView"));
  objc_msgSend(v12, "setFrame:", 16.0, 0.0, v10, Height);

}

- (void)setCity:(id)a3
{
  WorldClockCity *v5;
  WorldClockCity *city;
  unsigned __int8 v7;
  WorldClockCity *v8;
  void *v9;
  WorldClockCity *v10;

  v5 = (WorldClockCity *)a3;
  city = self->_city;
  if (city != v5)
  {
    v10 = v5;
    v7 = -[WorldClockCity isEqual:](city, "isEqual:", v5);
    v5 = v10;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_city, a3);
      v8 = self->_city;
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockCollectionCell worldClockView](self, "worldClockView"));
      objc_msgSend(v9, "setCity:", v8);

      v5 = v10;
    }
  }

}

- (void)start
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[MTAWorldClockCollectionCell worldClockView](self, "worldClockView"));
  objc_msgSend(v2, "start");

}

- (void)stop
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[MTAWorldClockCollectionCell worldClockView](self, "worldClockView"));
  objc_msgSend(v2, "stop");

}

- (void)setEditing:(BOOL)a3
{
  double v4;
  void *v5;
  _BOOL8 editing;
  id v7;

  self->_editing = a3;
  if (a3)
    v4 = 1.0;
  else
    v4 = 0.0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockCollectionCell deleteButton](self, "deleteButton"));
  objc_msgSend(v5, "setAlpha:", v4);

  editing = self->_editing;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[MTAWorldClockCollectionCell deleteButton](self, "deleteButton"));
  objc_msgSend(v7, "setUserInteractionEnabled:", editing);

}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;

  v4 = a3;
  if (a4)
  {
    +[UIView beginAnimations:](UIView, "beginAnimations:", CFSTR("WorldClockCollectionCellEditing"));
    -[MTAWorldClockCollectionCell setEditing:](self, "setEditing:", v4);
    +[UIView endAnimations](UIView, "endAnimations");
  }
  else
  {
    -[MTAWorldClockCollectionCell setEditing:](self, "setEditing:", a3);
  }
}

- (void)deleteTapped:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[MTAWorldClockCollectionCell delegate](self, "delegate", a3));
  objc_msgSend(v4, "deleteCell:", self);

}

+ (double)preferredHeight
{
  double result;

  +[MTAWorldClockView preferredHeight](MTAWorldClockView, "preferredHeight");
  return result;
}

- (MTAWorldClockCollectionCellDelegate)delegate
{
  return (MTAWorldClockCollectionCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIButton)deleteButton
{
  return self->_deleteButton;
}

- (void)setDeleteButton:(id)a3
{
  objc_storeStrong((id *)&self->_deleteButton, a3);
}

- (BOOL)isEditing
{
  return self->_editing;
}

- (WorldClockCity)city
{
  return self->_city;
}

- (MTAWorldClockView)worldClockView
{
  return self->_worldClockView;
}

- (void)setWorldClockView:(id)a3
{
  objc_storeStrong((id *)&self->_worldClockView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_worldClockView, 0);
  objc_storeStrong((id *)&self->_city, 0);
  objc_storeStrong((id *)&self->_deleteButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
