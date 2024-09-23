@implementation PRXSelectionIndicatorView

- (PRXSelectionIndicatorView)initWithFrame:(CGRect)a3
{
  PRXSelectionIndicatorView *v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  UIImageView *selectedImageView;
  id v9;
  void *v10;
  uint64_t v11;
  UIImageView *deselectedImageView;
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
  double v23;
  double v24;
  double v25;
  double v26;
  PRXSelectionIndicatorView *v27;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  objc_super v35;
  _QWORD v36[5];

  v36[4] = *MEMORY[0x24BDAC8D0];
  v35.receiver = self;
  v35.super_class = (Class)PRXSelectionIndicatorView;
  v3 = -[PRXSelectionIndicatorView initWithFrame:](&v35, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDF6AE0], "configurationWithScale:", 3);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = objc_alloc(MEMORY[0x24BDF6AE8]);
    objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("checkmark.circle.fill"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "initWithImage:", v6);
    selectedImageView = v3->_selectedImageView;
    v3->_selectedImageView = (UIImageView *)v7;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v3->_selectedImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setHidden:](v3->_selectedImageView, "setHidden:", 1);
    v34 = (void *)v4;
    -[UIImageView setPreferredSymbolConfiguration:](v3->_selectedImageView, "setPreferredSymbolConfiguration:", v4);
    -[PRXSelectionIndicatorView addSubview:](v3, "addSubview:", v3->_selectedImageView);
    v9 = objc_alloc(MEMORY[0x24BDF6AE8]);
    objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("circle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "initWithImage:", v10);
    deselectedImageView = v3->_deselectedImageView;
    v3->_deselectedImageView = (UIImageView *)v11;

    objc_msgSend(MEMORY[0x24BDF6950], "systemFillColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v3->_deselectedImageView, "setTintColor:", v13);

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v3->_deselectedImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setPreferredSymbolConfiguration:](v3->_deselectedImageView, "setPreferredSymbolConfiguration:", v4);
    -[PRXSelectionIndicatorView addSubview:](v3, "addSubview:", v3->_deselectedImageView);
    v29 = (void *)MEMORY[0x24BDD1628];
    -[UIImageView centerXAnchor](v3->_selectedImageView, "centerXAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRXSelectionIndicatorView centerXAnchor](v3, "centerXAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToAnchor:", v32);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v31;
    -[UIImageView centerXAnchor](v3->_deselectedImageView, "centerXAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRXSelectionIndicatorView centerXAnchor](v3, "centerXAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v36[1] = v15;
    -[UIImageView centerYAnchor](v3->_selectedImageView, "centerYAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRXSelectionIndicatorView centerYAnchor](v3, "centerYAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v36[2] = v18;
    -[UIImageView centerYAnchor](v3->_deselectedImageView, "centerYAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRXSelectionIndicatorView centerYAnchor](v3, "centerYAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v36[3] = v21;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v36, 4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "activateConstraints:", v22);

    LODWORD(v23) = 1148846080;
    -[PRXSelectionIndicatorView setContentCompressionResistancePriority:forAxis:](v3, "setContentCompressionResistancePriority:forAxis:", 0, v23);
    LODWORD(v24) = 1148846080;
    -[PRXSelectionIndicatorView setContentCompressionResistancePriority:forAxis:](v3, "setContentCompressionResistancePriority:forAxis:", 1, v24);
    LODWORD(v25) = 1148846080;
    -[PRXSelectionIndicatorView setContentHuggingPriority:forAxis:](v3, "setContentHuggingPriority:forAxis:", 0, v25);
    LODWORD(v26) = 1148846080;
    -[PRXSelectionIndicatorView setContentHuggingPriority:forAxis:](v3, "setContentHuggingPriority:forAxis:", 1, v26);
    v27 = v3;

  }
  return v3;
}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;

  if (self->_selected != a3)
  {
    v3 = a3;
    self->_selected = a3;
    -[UIImageView setHidden:](self->_selectedImageView, "setHidden:", !a3);
    -[UIImageView setHidden:](self->_deselectedImageView, "setHidden:", v3);
  }
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[UIImageView intrinsicContentSize](self->_selectedImageView, "intrinsicContentSize");
  v4 = v3;
  v6 = v5;
  -[UIImageView intrinsicContentSize](self->_deselectedImageView, "intrinsicContentSize");
  if (v4 >= v7)
    v7 = v4;
  if (v6 >= v8)
    v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deselectedImageView, 0);
  objc_storeStrong((id *)&self->_selectedImageView, 0);
}

@end
