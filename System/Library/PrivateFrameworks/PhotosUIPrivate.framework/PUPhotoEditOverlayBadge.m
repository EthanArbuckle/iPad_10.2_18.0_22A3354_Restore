@implementation PUPhotoEditOverlayBadge

- (PUPhotoEditOverlayBadge)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  PUPhotoEditOverlayBadge *v7;
  PUPhotoEditOverlayBadge *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  UILabel *label;
  UILabel *v14;
  void *v15;
  UILabel *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  objc_super v25;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v25.receiver = self;
  v25.super_class = (Class)PUPhotoEditOverlayBadge;
  v7 = -[PUPhotoEditOverlayBadge initWithFrame:](&v25, sel_initWithFrame_);
  v8 = v7;
  if (v7)
  {
    -[PUPhotoEditOverlayBadge setTranslatesAutoresizingMaskIntoConstraints:](v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PUPhotoEditOverlayBadge layer](v8, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCornerRadius:", 3.0);

    +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "photoEditingOverlayBadgeBackgroundColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditOverlayBadge setBackgroundColor:](v8, "setBackgroundColor:", v11);

    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", x, y, width, height);
    label = v8->_label;
    v8->_label = (UILabel *)v12;

    v14 = v8->_label;
    objc_msgSend(v10, "photoEditingOverlayBadgeColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v14, "setTextColor:", v15);

    v16 = v8->_label;
    objc_msgSend(v10, "photoEditingOverlayBadgeFont");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v16, "setFont:", v17);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v8->_label, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setText:](v8->_label, "setText:", v8->_text);
    -[PUPhotoEditOverlayBadge addSubview:](v8, "addSubview:", v8->_label);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_OWORD *)&v8->_insets.top = xmmword_1AB0EF380;
    *(_OWORD *)&v8->_insets.bottom = xmmword_1AB0EF380;
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v8->_label, 1, 0, v8, 1, 1.0, 8.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v19);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v8->_label, 3, 0, v8, 3, 1.0, v8->_insets.top);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v20);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v8, 2, 0, v8->_label, 2, 1.0, v8->_insets.right);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v21);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v8, 4, 0, v8->_label, 4, 1.0, v8->_insets.bottom);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v22);

    LODWORD(v23) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v8->_label, "setContentCompressionResistancePriority:forAxis:", 1, v23);
    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v18);

  }
  return v8;
}

- (void)setText:(id)a3
{
  NSString *v4;
  NSString *v5;
  BOOL v6;
  NSString *v7;
  NSString *text;
  NSString *v9;

  v4 = (NSString *)a3;
  v5 = v4;
  if (self->_text != v4)
  {
    v9 = v4;
    v6 = -[NSString isEqualToString:](v4, "isEqualToString:");
    v5 = v9;
    if (!v6)
    {
      v7 = (NSString *)-[NSString copy](v9, "copy");
      text = self->_text;
      self->_text = v7;

      -[PUPhotoEditOverlayBadge _updateLabel](self, "_updateLabel");
      v5 = v9;
    }
  }

}

- (void)_updateLabel
{
  UILabel *label;
  id v3;

  label = self->_label;
  -[PUPhotoEditOverlayBadge text](self, "text");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](label, "setText:", v3);

}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  -[UILabel intrinsicContentSize](self->_label, "intrinsicContentSize");
  v4 = v3 + self->_insets.top + self->_insets.bottom;
  v6 = v5 + self->_insets.left + self->_insets.right;
  result.height = v4;
  result.width = v6;
  return result;
}

- (NSString)text
{
  return self->_text;
}

- (UILabel)label
{
  return self->_label;
}

- (UIEdgeInsets)insets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_insets.top;
  left = self->_insets.left;
  bottom = self->_insets.bottom;
  right = self->_insets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
