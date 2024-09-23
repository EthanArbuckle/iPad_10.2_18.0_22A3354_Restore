@implementation _UIInterfaceActionGroupHeaderScrollView

- (_UIInterfaceActionGroupHeaderScrollView)initWithContentView:(id)a3
{
  id v5;
  _UIInterfaceActionGroupHeaderScrollView *v6;
  _UIInterfaceActionGroupHeaderScrollView *v7;
  id *p_contentView;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_UIInterfaceActionGroupHeaderScrollView;
  v6 = -[UIScrollView initWithFrame:](&v10, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v7 = v6;
  if (v6)
  {
    p_contentView = (id *)&v6->_contentView;
    objc_storeStrong((id *)&v6->_contentView, a3);
    objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView addSubview:](v7, "addSubview:", *p_contentView);
    objc_msgSend(*p_contentView, "setClipsToBounds:", 0);
  }

  return v7;
}

- (double)_contentFitCanScrollThreshold
{
  return 0.5;
}

- (void)accessoryInsetsDidChange:(UIEdgeInsets)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIInterfaceActionGroupHeaderScrollView;
  -[UIScrollView accessoryInsetsDidChange:](&v4, sel_accessoryInsetsDidChange_, a3.top, a3.left, a3.bottom, a3.right);
  -[UIView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (void)updateConstraints
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  UIView *contentView;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  NSArray *v22;
  NSArray *constraints;
  objc_super v24;
  const __CFString *v25;
  UIView *v26;
  _QWORD v27[2];
  _QWORD v28[3];

  v28[2] = *MEMORY[0x1E0C80C00];
  v24.receiver = self;
  v24.super_class = (Class)_UIInterfaceActionGroupHeaderScrollView;
  -[UIView updateConstraints](&v24, sel_updateConstraints);
  if (self->_constraints)
    objc_msgSend(MEMORY[0x1E0D156E0], "deactivateConstraints:");
  -[UIScrollView accessoryInsets](self, "accessoryInsets");
  v4 = v3;
  v6 = v5;
  v27[0] = CFSTR("leftInset");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = CFSTR("rightInset");
  v28[0] = v7;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  contentView = self->_contentView;
  v25 = CFSTR("contentView");
  v26 = contentView;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D156E0], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-leftInset-[contentView]-rightInset-|"), 0x10000, v9, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObjectsFromArray:", v13);

  objc_msgSend(MEMORY[0x1E0D156E0], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[contentView]|"), 0, 0, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObjectsFromArray:", v14);

  -[UIView heightAnchor](self, "heightAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView heightAnchor](self->_contentView, "heightAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v18) = 1144733696;
  objc_msgSend(v17, "setPriority:", v18);
  objc_msgSend(v12, "addObject:", v17);
  -[UIView widthAnchor](self, "widthAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView widthAnchor](self->_contentView, "widthAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:constant:", v20, v4 + v6);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "addObject:", v21);
  objc_msgSend(v12, "sortedArrayUsingFunction:context:", compareConstraintsForInsertionPerformance, 0);
  v22 = (NSArray *)objc_claimAutoreleasedReturnValue();
  constraints = self->_constraints;
  self->_constraints = v22;

  objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", self->_constraints);
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
}

@end
