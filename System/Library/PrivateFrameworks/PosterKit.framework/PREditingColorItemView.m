@implementation PREditingColorItemView

- (PREditingColorItemView)initWithColorItem:(id)a3
{
  id v5;
  PREditingColorItemView *v6;
  PREditingColorItemView *v7;
  UIView *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  UIView *itemView;
  UIView *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  objc_super v35;
  _QWORD v36[5];

  v36[4] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v35.receiver = self;
  v35.super_class = (Class)PREditingColorItemView;
  v6 = -[PRSelectableEditingItemView initWithFrame:](&v35, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_colorItem, a3);
    objc_msgSend(v5, "itemView");
    v8 = (UIView *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      v8 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
      objc_msgSend(v5, "displayColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "color");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](v8, "setBackgroundColor:", v10);

    }
    -[UIView layer](v8, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setCornerRadius:", 17.0);

    -[UIView layer](v8, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.1);
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v12, "setBorderColor:", objc_msgSend(v13, "CGColor"));

    -[UIView layer](v8, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setBorderWidth:", 2.0);

    -[UIView setUserInteractionEnabled:](v8, "setUserInteractionEnabled:", 0);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v15) = 1112014848;
    -[UIView setContentCompressionResistancePriority:forAxis:](v8, "setContentCompressionResistancePriority:forAxis:", 0, v15);
    LODWORD(v16) = 1112014848;
    -[UIView setContentCompressionResistancePriority:forAxis:](v8, "setContentCompressionResistancePriority:forAxis:", 1, v16);
    -[PRSelectableEditingItemView selectionView](v7, "selectionView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PREditingColorItemView insertSubview:aboveSubview:](v7, "insertSubview:aboveSubview:", v8, v17);

    itemView = v7->_itemView;
    v7->_itemView = v8;
    v19 = v8;

    v28 = (void *)MEMORY[0x1E0CB3718];
    -[UIView topAnchor](v19, "topAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[PREditingColorItemView topAnchor](v7, "topAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToAnchor:constant:", v33, 5.0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v32;
    -[UIView leadingAnchor](v19, "leadingAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[PREditingColorItemView leadingAnchor](v7, "leadingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:constant:", v30, 5.0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v36[1] = v29;
    -[UIView trailingAnchor](v19, "trailingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PREditingColorItemView trailingAnchor](v7, "trailingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:constant:", v21, -5.0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v36[2] = v22;
    -[UIView bottomAnchor](v19, "bottomAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PREditingColorItemView bottomAnchor](v7, "bottomAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:constant:", v24, -5.0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v36[3] = v25;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 4);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "activateConstraints:", v26);

  }
  return v7;
}

- (void)updateForChangedColor
{
  void *v3;
  UIView *itemView;
  void *v5;
  id v6;

  -[PREditingColorItem itemView](self->_colorItem, "itemView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    itemView = self->_itemView;
    -[PREditingColorItem displayColor](self->_colorItem, "displayColor");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "color");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](itemView, "setBackgroundColor:", v5);

  }
}

- (NSString)localizedName
{
  return -[PREditingColorItem localizedName](self->_colorItem, "localizedName");
}

- (PREditingColorItem)colorItem
{
  return self->_colorItem;
}

- (void)setColorItem:(id)a3
{
  objc_storeStrong((id *)&self->_colorItem, a3);
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
  objc_storeStrong((id *)&self->_colorItem, 0);
}

@end
