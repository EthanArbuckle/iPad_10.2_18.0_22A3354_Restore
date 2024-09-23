@implementation PREditingContentStyleItemView

- (PREditingContentStyleItemView)initWithContentStyleCoordinator:(id)a3
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  PREditingContentStyleItemView *v10;
  PREditingContentStyleItemView *v11;
  UIView *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  UIView *itemView;
  UIView *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  objc_super v51;
  _QWORD v52[10];

  v52[8] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v51.receiver = self;
  v51.super_class = (Class)PREditingContentStyleItemView;
  v6 = *MEMORY[0x1E0C9D648];
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v9 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v10 = -[PRSelectableEditingItemView initWithFrame:](&v51, sel_initWithFrame_, *MEMORY[0x1E0C9D648], v7, v8, v9);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_contentStyleCoordinator, a3);
    v12 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v6, v7, v8, v9);
    -[UIView setClipsToBounds:](v12, "setClipsToBounds:", 1);
    -[UIView layer](v12, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setCornerRadius:", 17.0);

    -[UIView layer](v12, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.1);
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v14, "setBorderColor:", objc_msgSend(v15, "CGColor"));

    -[UIView layer](v12, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setBorderWidth:", 2.0);

    -[UIView setUserInteractionEnabled:](v12, "setUserInteractionEnabled:", 0);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PRSelectableEditingItemView selectionView](v11, "selectionView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PREditingContentStyleItemView insertSubview:aboveSubview:](v11, "insertSubview:aboveSubview:", v12, v17);

    itemView = v11->_itemView;
    v11->_itemView = v12;
    v19 = v12;

    objc_msgSend(v5, "itemView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setUserInteractionEnabled:](v19, "setUserInteractionEnabled:", 0);
    objc_msgSend(v20, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v21) = 1112014848;
    objc_msgSend(v20, "setContentCompressionResistancePriority:forAxis:", 0, v21);
    LODWORD(v22) = 1112014848;
    objc_msgSend(v20, "setContentCompressionResistancePriority:forAxis:", 1, v22);
    -[UIView addSubview:](v19, "addSubview:", v20);
    v41 = (void *)MEMORY[0x1E0CB3718];
    -[UIView topAnchor](v19, "topAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[PREditingContentStyleItemView topAnchor](v11, "topAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "constraintEqualToAnchor:constant:", v49, 5.0);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v52[0] = v48;
    -[UIView leadingAnchor](v19, "leadingAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[PREditingContentStyleItemView leadingAnchor](v11, "leadingAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "constraintEqualToAnchor:constant:", v46, 5.0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v52[1] = v45;
    -[UIView trailingAnchor](v19, "trailingAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[PREditingContentStyleItemView trailingAnchor](v11, "trailingAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "constraintEqualToAnchor:constant:", v43, -5.0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v52[2] = v42;
    -[UIView bottomAnchor](v19, "bottomAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[PREditingContentStyleItemView bottomAnchor](v11, "bottomAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintEqualToAnchor:constant:", v39, -5.0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v52[3] = v38;
    objc_msgSend(v20, "topAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](v19, "topAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintEqualToAnchor:", v36);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v52[4] = v35;
    objc_msgSend(v20, "leadingAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](v19, "leadingAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToAnchor:", v33);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v52[5] = v32;
    objc_msgSend(v20, "trailingAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](v19, "trailingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v52[6] = v24;
    objc_msgSend(v20, "bottomAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](v19, "bottomAnchor");
    v26 = v5;
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v52[7] = v28;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 8);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "activateConstraints:", v29);

    v5 = v26;
  }

  return v11;
}

- (id)localizedName
{
  void *v2;
  void *v3;

  -[PREditingPosterContentStyleCoordinator style](self->_contentStyleCoordinator, "style");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (PREditingPosterContentStyleCoordinator)contentStyleCoordinator
{
  return self->_contentStyleCoordinator;
}

- (void)setContentStyleCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_contentStyleCoordinator, a3);
}

- (UIView)itemView
{
  return self->_itemView;
}

- (void)setItemView:(id)a3
{
  objc_storeStrong((id *)&self->_itemView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemView, 0);
  objc_storeStrong((id *)&self->_contentStyleCoordinator, 0);
}

@end
