@implementation _UIAlertViewShimAccessoryViewController

- (_UIAlertViewShimAccessoryViewController)initWithAccessoryViewController:(id)a3
{
  id v5;
  _UIAlertViewShimAccessoryViewController *v6;
  _UIAlertViewShimAccessoryViewController *v7;
  id *p_accessoryViewController;
  void *v9;
  double v10;
  double v11;
  double v12;
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
  void *v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  objc_super v29;

  v5 = a3;
  v29.receiver = self;
  v29.super_class = (Class)_UIAlertViewShimAccessoryViewController;
  v6 = -[UIViewController initWithNibName:bundle:](&v29, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
  {
    p_accessoryViewController = (id *)&v6->_accessoryViewController;
    objc_storeStrong((id *)&v6->_accessoryViewController, a3);
    objc_msgSend(*p_accessoryViewController, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "frame");
    v11 = v10;

    v12 = 120.0;
    if (v11 <= 120.0)
      v12 = v11;
    v7->_preferredHeight = v12;
    objc_msgSend(*p_accessoryViewController, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[UIViewController view](v7, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[UIViewController addChildViewController:](v7, "addChildViewController:", *p_accessoryViewController);
    -[UIViewController view](v7, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*p_accessoryViewController, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addSubview:", v16);

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*p_accessoryViewController, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)MEMORY[0x1E0D156E0];
    _NSDictionaryOfVariableBindings(CFSTR("accessoryView"), v18, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[accessoryView]|"), 0, 0, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObjectsFromArray:", v21);

    v22 = (void *)MEMORY[0x1E0D156E0];
    _NSDictionaryOfVariableBindings(CFSTR("accessoryView"), v18, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[accessoryView]|"), 0, 0, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObjectsFromArray:", v24);

    objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v18, 7, 1, 0, 0, 1.0, 1000.0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v26) = 1148829696;
    objc_msgSend(v25, "setPriority:", v26);
    objc_msgSend(v17, "addObject:", v25);
    -[UIViewController view](v7, "view");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addConstraints:", v17);

  }
  return v7;
}

- (CGSize)preferredContentSize
{
  double preferredHeight;
  double v3;
  CGSize result;

  preferredHeight = self->_preferredHeight;
  v3 = 0.0;
  result.height = preferredHeight;
  result.width = v3;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryViewController, 0);
}

@end
