@implementation CRLLassoSegmentedViewController

- (CRLLassoSegmentedViewController)initWithLassoType:(unint64_t)a3
{
  CRLLassoSegmentedViewController *v4;
  CRLLassoSegmentedViewController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CRLLassoSegmentedViewController;
  v4 = -[CRLLassoSegmentedViewController initWithNibName:bundle:](&v7, "initWithNibName:bundle:", 0, 0);
  v5 = v4;
  if (v4)
  {
    -[CRLLassoSegmentedViewController p_commonInit](v4, "p_commonInit");
    -[UISegmentedControl setSelectedSegmentIndex:](v5->_segmentedControl, "setSelectedSegmentIndex:", a3);
  }
  return v5;
}

- (CRLLassoSegmentedViewController)initWithCoder:(id)a3
{
  CRLLassoSegmentedViewController *v3;
  CRLLassoSegmentedViewController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRLLassoSegmentedViewController;
  v3 = -[CRLLassoSegmentedViewController initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
  {
    -[CRLLassoSegmentedViewController p_commonInit](v3, "p_commonInit");
    -[UISegmentedControl setSelectedSegmentIndex:](v4->_segmentedControl, "setSelectedSegmentIndex:", 0);
  }
  return v4;
}

- (CRLLassoSegmentedViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  CRLLassoSegmentedViewController *v4;
  CRLLassoSegmentedViewController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CRLLassoSegmentedViewController;
  v4 = -[CRLLassoSegmentedViewController initWithNibName:bundle:](&v7, "initWithNibName:bundle:", a3, a4);
  v5 = v4;
  if (v4)
  {
    -[CRLLassoSegmentedViewController p_commonInit](v4, "p_commonInit");
    -[UISegmentedControl setSelectedSegmentIndex:](v5->_segmentedControl, "setSelectedSegmentIndex:", 0);
  }
  return v5;
}

- (void)p_commonInit
{
  UISegmentedControl *v3;
  UISegmentedControl *segmentedControl;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (UISegmentedControl *)objc_alloc_init((Class)UISegmentedControl);
  segmentedControl = self->_segmentedControl;
  self->_segmentedControl = v3;

  -[UISegmentedControl setTranslatesAutoresizingMaskIntoConstraints:](self->_segmentedControl, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("All Objects"), 0, 0));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Drawings Only"), 0, 0));

  -[UISegmentedControl insertSegmentWithTitle:atIndex:animated:](self->_segmentedControl, "insertSegmentWithTitle:atIndex:animated:", v8, 0, 1);
  -[UISegmentedControl insertSegmentWithTitle:atIndex:animated:](self->_segmentedControl, "insertSegmentWithTitle:atIndex:animated:", v7, 1, 1);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
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
  objc_super v20;
  _QWORD v21[3];

  v20.receiver = self;
  v20.super_class = (Class)CRLLassoSegmentedViewController;
  -[CRLLassoSegmentedViewController viewDidLoad](&v20, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLLassoSegmentedViewController view](self, "view"));
  objc_msgSend(v3, "addSubview:", self->_segmentedControl);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[UISegmentedControl topAnchor](self->_segmentedControl, "topAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLLassoSegmentedViewController view](self, "view"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "safeAreaLayoutGuide"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "topAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:constant:", v16, 10.0));
  v21[0] = v15;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[UISegmentedControl leadingAnchor](self->_segmentedControl, "leadingAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLLassoSegmentedViewController view](self, "view"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "safeAreaLayoutGuide"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "leadingAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:constant:", v4, 10.0));
  v21[1] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UISegmentedControl trailingAnchor](self->_segmentedControl, "trailingAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLLassoSegmentedViewController view](self, "view"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "safeAreaLayoutGuide"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "trailingAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToAnchor:constant:", v9, -10.0));
  v21[2] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v21, 3));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v11);

  -[UISegmentedControl addTarget:action:forControlEvents:](self->_segmentedControl, "addTarget:action:forControlEvents:", self, "segmentedControlDidChangeValue:", 4096);
}

- (unint64_t)lassoType
{
  return -[UISegmentedControl selectedSegmentIndex](self->_segmentedControl, "selectedSegmentIndex");
}

- (void)setLassoType:(unint64_t)a3
{
  if (-[UISegmentedControl numberOfSegments](self->_segmentedControl, "numberOfSegments") > a3)
    -[UISegmentedControl setSelectedSegmentIndex:](self->_segmentedControl, "setSelectedSegmentIndex:", a3);
}

- (CGSize)preferredContentSize
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGSize result;

  -[UISegmentedControl sizeThatFits:](self->_segmentedControl, "sizeThatFits:", CGSizeZero.width, CGSizeZero.height);
  if (v2 >= 300.0)
    v4 = v2 + 20.0;
  else
    v4 = 300.0;
  v5 = v3 + 20.0;
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)segmentedControlDidChangeValue:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "lassoSegmentedControlDidChangeType:", -[CRLLassoSegmentedViewController lassoType](self, "lassoType"));

}

- (CRLLassoSegmentedControlDelegate)delegate
{
  return (CRLLassoSegmentedControlDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UISegmentedControl)segmentedControl
{
  return self->_segmentedControl;
}

- (void)setSegmentedControl:(id)a3
{
  objc_storeStrong((id *)&self->_segmentedControl, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_segmentedControl, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
