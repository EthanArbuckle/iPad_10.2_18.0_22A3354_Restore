@implementation PXMemoriesBlacklistAccessoryViewController

- (PXMemoriesBlacklistAccessoryViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v7;
  id v8;
  void *v9;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMemoriesBlacklistAccessoryViewController.m"), 31, CFSTR("%s is not available as initializer"), "-[PXMemoriesBlacklistAccessoryViewController initWithNibName:bundle:]");

  abort();
}

- (PXMemoriesBlacklistAccessoryViewController)initWithCoder:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMemoriesBlacklistAccessoryViewController.m"), 35, CFSTR("%s is not available as initializer"), "-[PXMemoriesBlacklistAccessoryViewController initWithCoder:]");

  abort();
}

- (PXMemoriesBlacklistAccessoryViewController)initWithAccessoryView:(id)a3 viewSpec:(id)a4
{
  id v7;
  id v8;
  PXMemoriesBlacklistAccessoryViewController *v9;
  PXMemoriesBlacklistAccessoryViewController *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXMemoriesBlacklistAccessoryViewController;
  v9 = -[PXMemoriesBlacklistAccessoryViewController initWithNibName:bundle:](&v12, sel_initWithNibName_bundle_, 0, 0);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_accessoryView, a3);
    objc_storeStrong((id *)&v10->_viewSpec, a4);
  }

  return v10;
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXMemoriesBlacklistAccessoryViewController;
  -[PXMemoriesBlacklistAccessoryViewController viewDidLoad](&v4, sel_viewDidLoad);
  -[PXMemoriesBlacklistAccessoryViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_accessoryView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v3, "addSubview:", self->_accessoryView);
  objc_msgSend(v3, "setNeedsUpdateConstraints");

}

- (void)didReceiveMemoryWarning
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PXMemoriesBlacklistAccessoryViewController;
  -[PXMemoriesBlacklistAccessoryViewController didReceiveMemoryWarning](&v2, sel_didReceiveMemoryWarning);
}

- (CGSize)preferredContentSize
{
  double v2;
  double v3;
  double v4;
  CGSize result;

  -[PXMemoriesBlacklistAccessoryViewSpec accessoryViewFrame](self->_viewSpec, "accessoryViewFrame");
  v3 = v2 + 16.0;
  v4 = 0.0;
  result.height = v3;
  result.width = v4;
  return result;
}

- (void)_setConstraints:(id)a3
{
  NSArray *v4;
  char v5;
  NSArray *v6;
  NSArray *constraints;
  NSArray *v8;

  v8 = (NSArray *)a3;
  v4 = self->_constraints;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSArray isEqual:](v8, "isEqual:", v4);

    if ((v5 & 1) == 0)
    {
      if (self->_constraints)
        objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:");
      v6 = (NSArray *)-[NSArray copy](v8, "copy");
      constraints = self->_constraints;
      self->_constraints = v6;

      if (self->_constraints)
        objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:");
    }
  }

}

- (void)updateViewConstraints
{
  void *v3;
  UIView *accessoryView;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  -[PXMemoriesBlacklistAccessoryViewController constraints](self, "constraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", v3);
  accessoryView = self->_accessoryView;
  v11 = CFSTR("accessoryView");
  v12[0] = accessoryView;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-leftMargin-[accessoryView(>=width)]-rightMargin-|"), 0, &unk_1E53F0098, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v7);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-topMargin-[accessoryView]|"), 0, &unk_1E53F0098, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v8);

  if (-[PXMemoriesBlacklistAccessoryViewSpec type](self->_viewSpec, "type") != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_accessoryView, 7, 0, self->_accessoryView, 8, 1.0, 0.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v9);

  }
  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v6);
  -[PXMemoriesBlacklistAccessoryViewController _setConstraints:](self, "_setConstraints:", v6);
  v10.receiver = self;
  v10.super_class = (Class)PXMemoriesBlacklistAccessoryViewController;
  -[PXMemoriesBlacklistAccessoryViewController updateViewConstraints](&v10, sel_updateViewConstraints);

}

- (UIView)accessoryView
{
  return self->_accessoryView;
}

- (void)setAccessoryView:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryView, a3);
}

- (PXMemoriesBlacklistAccessoryViewSpec)viewSpec
{
  return self->_viewSpec;
}

- (void)setViewSpec:(id)a3
{
  objc_storeStrong((id *)&self->_viewSpec, a3);
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_viewSpec, 0);
  objc_storeStrong((id *)&self->_accessoryView, 0);
}

@end
