@implementation _UIAlertControllerTextFieldViewCollectionCell

- (_UIAlertControllerTextFieldViewCollectionCell)initWithFrame:(CGRect)a3
{
  _UIAlertControllerTextFieldViewCollectionCell *v3;
  UITapGestureRecognizer *v4;
  UITapGestureRecognizer *selectButtonGesture;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UIAlertControllerTextFieldViewCollectionCell;
  v3 = -[UICollectionViewCell initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = -[UITapGestureRecognizer initWithTarget:action:]([UITapGestureRecognizer alloc], "initWithTarget:action:", v3, sel__selectButton_);
    selectButtonGesture = v3->_selectButtonGesture;
    v3->_selectButtonGesture = v4;

    -[UITapGestureRecognizer setAllowedPressTypes:](v3->_selectButtonGesture, "setAllowedPressTypes:", &unk_1E1A92A20);
    -[UIView addGestureRecognizer:](v3, "addGestureRecognizer:", v3->_selectButtonGesture);
    -[UICollectionReusableView setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UICollectionViewCell contentView](v3, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAutoresizingMask:", 18);

  }
  return v3;
}

- (void)setTextField:(id)a3 horizontalMargin:(double)a4
{
  _UIAlertControllerTextFieldView *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _UIAlertControllerTextFieldView *textField;
  id v12;

  v6 = (_UIAlertControllerTextFieldView *)a3;
  -[UICollectionViewCell contentView](self, "contentView");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addSubview:", v6);
  objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v12, 8, 0, v6, 8, 1.0, 0.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addConstraint:", v7);

  objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v6, 1, 0, v12, 1, 1.0, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addConstraint:", v8);

  objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v6, 2, 0, v12, 2, 1.0, -a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addConstraint:", v9);

  objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v6, 3, 0, v12, 3, 1.0, 0.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addConstraint:", v10);

  textField = self->_textField;
  self->_textField = v6;

}

- (_UIAlertControllerTextFieldView)textField
{
  return self->_textField;
}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  -[_UIAlertControllerTextFieldViewCollectionCell textField](self, "textField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  v4.receiver = self;
  v4.super_class = (Class)_UIAlertControllerTextFieldViewCollectionCell;
  -[UICollectionViewCell prepareForReuse](&v4, sel_prepareForReuse);
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;

  v4 = a3;
  objc_msgSend(v4, "frame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  LODWORD(v9) = 1148846080;
  LODWORD(v11) = 1132068864;
  -[UICollectionViewCell systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v10, v12, v9, v11);
  v14 = v13;
  v16 = v15;
  v17 = (void *)objc_msgSend(v4, "copy");

  objc_msgSend(v17, "setFrame:", v6, v8, v14, v16);
  return v17;
}

- (void)_selectButton:(id)a3
{
  void *v4;
  id v5;

  if (objc_msgSend(a3, "state") == 3)
  {
    -[_UIAlertControllerTextFieldViewCollectionCell textField](self, "textField");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "textField");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "becomeFirstResponder");

  }
}

- (id)preferredFocusedView
{
  return -[_UIAlertControllerTextFieldView textField](self->_textField, "textField");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectButtonGesture, 0);
  objc_storeStrong((id *)&self->_textField, 0);
}

@end
