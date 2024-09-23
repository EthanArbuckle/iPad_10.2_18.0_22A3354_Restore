@implementation ICDrawingRegressionTestDataCollectionViewCell

- (void)layoutSubviews
{
  UIImageView *v3;
  UIImageView *selectedImageView;
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
  objc_super v20;

  if (!self->_selectedImageView)
  {
    v3 = (UIImageView *)objc_alloc_init((Class)UIImageView);
    selectedImageView = self->_selectedImageView;
    self->_selectedImageView = v3;

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("checkmark.circle")));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "imageWithRenderingMode:", 2));

    -[UIImageView setImage:](self->_selectedImageView, "setImage:", v6);
    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_selectedImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[ICDrawingRegressionTestDataCollectionViewCell addSubview:](self, "addSubview:", self->_selectedImageView);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 4));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView trailingAnchor](self->_selectedImageView, "trailingAnchor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICDrawingRegressionTestDataCollectionViewCell contentView](self, "contentView"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "trailingAnchor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v10));
    objc_msgSend(v7, "addObject:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView bottomAnchor](self->_selectedImageView, "bottomAnchor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICDrawingRegressionTestDataCollectionViewCell contentView](self, "contentView"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "bottomAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:", v14));
    objc_msgSend(v7, "addObject:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView widthAnchor](self->_selectedImageView, "widthAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToConstant:", 38.0));
    objc_msgSend(v7, "addObject:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView heightAnchor](self->_selectedImageView, "heightAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToConstant:", 38.0));
    objc_msgSend(v7, "addObject:", v19);

    -[UIImageView setHidden:](self->_selectedImageView, "setHidden:", -[ICDrawingRegressionTestDataCollectionViewCell isSelected](self, "isSelected") ^ 1);
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v7);

  }
  v20.receiver = self;
  v20.super_class = (Class)ICDrawingRegressionTestDataCollectionViewCell;
  -[ICDrawingRegressionTestDataCollectionViewCell layoutSubviews](&v20, "layoutSubviews");
}

- (void)setSelected:(BOOL)a3
{
  _BOOL4 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)ICDrawingRegressionTestDataCollectionViewCell;
  -[ICDrawingRegressionTestDataCollectionViewCell setSelected:](&v5, "setSelected:");
  -[UIImageView setHidden:](self->_selectedImageView, "setHidden:", !v3);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedImageView, 0);
}

@end
