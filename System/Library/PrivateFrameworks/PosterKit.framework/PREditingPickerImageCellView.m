@implementation PREditingPickerImageCellView

- (PREditingPickerImageCellView)initWithFrame:(CGRect)a3
{
  PREditingPickerImageCellView *v3;
  UIImageView *v4;
  UIImageView *contentImageView;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  objc_super v26;
  _QWORD v27[6];

  v27[5] = *MEMORY[0x1E0C80C00];
  v26.receiver = self;
  v26.super_class = (Class)PREditingPickerImageCellView;
  v3 = -[PREditingPickerCellView initWithFrame:](&v26, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    contentImageView = v3->_contentImageView;
    v3->_contentImageView = v4;

    LODWORD(v6) = 1144750080;
    -[UIImageView setContentCompressionResistancePriority:forAxis:](v3->_contentImageView, "setContentCompressionResistancePriority:forAxis:", 0, v6);
    LODWORD(v7) = 1144750080;
    -[UIImageView setContentCompressionResistancePriority:forAxis:](v3->_contentImageView, "setContentCompressionResistancePriority:forAxis:", 1, v7);
    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v3->_contentImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PREditingPickerImageCellView addSubview:](v3, "addSubview:", v3->_contentImageView);
    v19 = (void *)MEMORY[0x1E0CB3718];
    -[UIImageView topAnchor](v3->_contentImageView, "topAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[PREditingPickerImageCellView topAnchor](v3, "topAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:constant:", v24, 9.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v23;
    -[UIImageView bottomAnchor](v3->_contentImageView, "bottomAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[PREditingPickerImageCellView bottomAnchor](v3, "bottomAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:constant:", v21, -9.0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v27[1] = v20;
    -[UIImageView centerXAnchor](v3->_contentImageView, "centerXAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PREditingPickerImageCellView centerXAnchor](v3, "centerXAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v27[2] = v9;
    -[UIImageView leadingAnchor](v3->_contentImageView, "leadingAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PREditingPickerImageCellView leadingAnchor](v3, "leadingAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:constant:", v11, 9.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v27[3] = v12;
    -[UIImageView trailingAnchor](v3->_contentImageView, "trailingAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PREditingPickerImageCellView trailingAnchor](v3, "trailingAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:constant:", v14, -9.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v27[4] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "activateConstraints:", v16);

  }
  return v3;
}

- (void)configureWithSystemImageNamed:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PREditingPickerImageCellView _configureWithSystemImage:](self, "_configureWithSystemImage:", v4);

}

- (void)configureWithSystemImageNamed:(id)a3 configuration:(id)a4
{
  id v5;

  objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:withConfiguration:", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PREditingPickerImageCellView _configureWithSystemImage:](self, "_configureWithSystemImage:", v5);

}

- (void)_configureWithSystemImage:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x1E0DC3658];
  v5 = a3;
  objc_msgSend(v4, "labelColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageWithTintColor:renderingMode:", v6, 1);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[UIImageView setImage:](self->_contentImageView, "setImage:", v7);
}

- (UIImageView)contentImageView
{
  return self->_contentImageView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentImageView, 0);
}

@end
