@implementation RUIElementViewController

- (RUIElementViewController)initWithElement:(id)a3
{
  id v5;
  RUIElementViewController *v6;
  RUIElementViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RUIElementViewController;
  v6 = -[RUIElementViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_element, a3);

  return v7;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RUIElementViewController;
  -[RUIElementViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[RUIElementViewController _setUpViews](self, "_setUpViews");
}

- (void)_setUpViews
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
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
  _QWORD v26[5];

  v26[4] = *MEMORY[0x24BDAC8D0];
  -[RUIElementViewController element](self, "element");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[RUIElementViewController element](self, "element");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[RUIElementViewController view](self, "view");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addSubview:", v6);

      objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      v18 = (void *)MEMORY[0x24BDD1628];
      objc_msgSend(v6, "topAnchor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[RUIElementViewController view](self, "view");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "topAnchor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "constraintEqualToAnchor:", v23);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = v22;
      objc_msgSend(v6, "bottomAnchor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[RUIElementViewController view](self, "view");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "bottomAnchor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "constraintEqualToAnchor:", v19);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v26[1] = v17;
      objc_msgSend(v6, "leadingAnchor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[RUIElementViewController view](self, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "leadingAnchor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "constraintEqualToAnchor:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v26[2] = v11;
      objc_msgSend(v6, "trailingAnchor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[RUIElementViewController view](self, "view");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "trailingAnchor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "constraintEqualToAnchor:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v26[3] = v15;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 4);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "activateConstraints:", v16);

    }
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  char v6;
  void *v7;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)RUIElementViewController;
  -[RUIElementViewController viewWillAppear:](&v8, sel_viewWillAppear_);
  -[RUIElementViewController element](self, "element");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[RUIElementViewController element](self, "element");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "viewWillAppear:", v3);

  }
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  char v6;
  void *v7;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)RUIElementViewController;
  -[RUIElementViewController viewDidAppear:](&v8, sel_viewDidAppear_);
  -[RUIElementViewController element](self, "element");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[RUIElementViewController element](self, "element");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "viewDidAppear:", v3);

  }
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  char v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RUIElementViewController;
  -[RUIElementViewController viewDidLayoutSubviews](&v6, sel_viewDidLayoutSubviews);
  -[RUIElementViewController element](self, "element");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[RUIElementViewController element](self, "element");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "viewDidLayout");

  }
}

- (RUITopLevelPageElement)element
{
  return self->_element;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_element, 0);
}

@end
