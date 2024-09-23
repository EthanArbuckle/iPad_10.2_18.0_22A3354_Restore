@implementation STUIStatusBarBadgeView

- (STUIStatusBarBadgeView)initWithFrame:(CGRect)a3
{
  STUIStatusBarBadgeView *v3;
  STUIStatusBarBadgeView *v4;
  UILabel *v5;
  UILabel *label;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSArray *constraintsWithConstant;
  NSArray *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  void *v27;
  void *v28;
  objc_super v29;
  _QWORD v30[3];
  _QWORD v31[3];

  v31[2] = *MEMORY[0x1E0C80C00];
  v29.receiver = self;
  v29.super_class = (Class)STUIStatusBarBadgeView;
  v3 = -[STUIStatusBarBadgeView initWithFrame:](&v29, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[STUIStatusBarBadgeView layer](v3, "layer");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setBorderWidth:", 1.0);
    v5 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    label = v4->_label;
    v4->_label = v5;

    -[UILabel setTextAlignment:](v4->_label, "setTextAlignment:", 1);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_label, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[STUIStatusBarBadgeView addSubview:](v4, "addSubview:", v4->_label);
    -[UILabel leadingAnchor](v4->_label, "leadingAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[STUIStatusBarBadgeView leadingAnchor](v4, "leadingAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraintEqualToAnchor:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v9;
    -[STUIStatusBarBadgeView bottomAnchor](v4, "bottomAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel lastBaselineAnchor](v4->_label, "lastBaselineAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v31[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
    v13 = objc_claimAutoreleasedReturnValue();
    constraintsWithConstant = v4->_constraintsWithConstant;
    v4->_constraintsWithConstant = (NSArray *)v13;

    v15 = v4->_constraintsWithConstant;
    -[UILabel centerXAnchor](v4->_label, "centerXAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[STUIStatusBarBadgeView centerXAnchor](v4, "centerXAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:", v26);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v16;
    -[STUIStatusBarBadgeView widthAnchor](v4, "widthAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[STUIStatusBarBadgeView heightAnchor](v4, "heightAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintGreaterThanOrEqualToAnchor:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v30[1] = v19;
    -[UILabel centerYAnchor](v4->_label, "centerYAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[STUIStatusBarBadgeView centerYAnchor](v4, "centerYAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v30[2] = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 3);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray arrayByAddingObjectsFromArray:](v15, "arrayByAddingObjectsFromArray:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v24);
  }
  return v4;
}

- (void)setText:(id)a3
{
  -[UILabel setText:](self->_label, "setText:", a3);
}

- (NSString)text
{
  return -[UILabel text](self->_label, "text");
}

- (void)applyStyleAttributes:(id)a3
{
  id v4;
  unint64_t v5;
  double v6;
  double v7;
  void *v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "iconSize") - 5;
  v6 = 0.0;
  v7 = 0.0;
  if (v5 <= 8)
  {
    v6 = dbl_1CFEC03D0[v5];
    v7 = dbl_1CFEC0418[v5];
  }
  objc_msgSend(MEMORY[0x1E0DC1350], "monospacedSystemFontOfSize:weight:", v7, *MEMORY[0x1E0DC1428]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_label, "setFont:", v8);

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v9 = self->_constraintsWithConstant;
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v23;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v23 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v13++), "setConstant:", v6, (_QWORD)v22);
      }
      while (v11 != v13);
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v11);
  }

  v14 = objc_msgSend(v4, "isRounded");
  -[STUIStatusBarBadgeView layer](self, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  v17 = 2.5;
  if (v14)
    v17 = 4.0;
  objc_msgSend(v15, "setCornerRadius:", v17, (_QWORD)v22);

  objc_msgSend(v4, "textColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_label, "setTextColor:", v18);
  v19 = objc_retainAutorelease(v18);
  v20 = objc_msgSend(v19, "CGColor");
  -[STUIStatusBarBadgeView layer](self, "layer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setBorderColor:", v20);

}

- (id)viewForLastBaselineLayout
{
  return self->_label;
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (NSArray)constraintsWithConstant
{
  return self->_constraintsWithConstant;
}

- (void)setConstraintsWithConstant:(id)a3
{
  objc_storeStrong((id *)&self->_constraintsWithConstant, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraintsWithConstant, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
