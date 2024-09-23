@implementation _PSSpinnerViewController

- (void)loadView
{
  uint64_t v2;
  UIActivityIndicatorView *spinner;
  id v4;
  id v5;
  id v6;
  id v7;
  objc_super v8;
  SEL v9;
  _PSSpinnerViewController *v10;

  v10 = self;
  v9 = a2;
  v8.receiver = self;
  v8.super_class = (Class)_PSSpinnerViewController;
  -[_PSSpinnerViewController loadView](&v8, sel_loadView);
  v5 = (id)-[_PSSpinnerViewController view](v10, "view");
  v4 = (id)objc_msgSend(MEMORY[0x24BEBD4B8], "tableCellGroupedBackgroundColor");
  objc_msgSend(v5, "setBackgroundColor:");

  v2 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD398]), "initWithActivityIndicatorStyle:", 10);
  spinner = v10->_spinner;
  v10->_spinner = (UIActivityIndicatorView *)v2;

  -[UIActivityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:](v10->_spinner, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIActivityIndicatorView startAnimating](v10->_spinner, "startAnimating");
  v6 = (id)-[_PSSpinnerViewController view](v10, "view");
  objc_msgSend(v6, "addSubview:", v10->_spinner);

  v7 = (id)-[_PSSpinnerViewController view](v10, "view");
  objc_msgSend(v7, "setNeedsUpdateConstraints");

}

- (void)updateViewConstraints
{
  UIActivityIndicatorView *spinner;
  void *v3;
  id v4;
  id v5;
  id v6;
  UIActivityIndicatorView *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  objc_super v12;
  SEL v13;
  _PSSpinnerViewController *v14;

  v14 = self;
  v13 = a2;
  v12.receiver = self;
  v12.super_class = (Class)_PSSpinnerViewController;
  -[_PSSpinnerViewController updateViewConstraints](&v12, sel_updateViewConstraints);
  v6 = (id)-[_PSSpinnerViewController view](v14, "view");
  v3 = (void *)MEMORY[0x24BDD1628];
  spinner = v14->_spinner;
  v5 = (id)-[_PSSpinnerViewController view](v14, "view");
  v4 = (id)objc_msgSend(v3, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", spinner, 9);
  objc_msgSend(v6, "addConstraint:");

  v11 = (id)-[_PSSpinnerViewController view](v14, "view");
  v8 = (void *)MEMORY[0x24BDD1628];
  v7 = v14->_spinner;
  v10 = (id)-[_PSSpinnerViewController view](v14, "view");
  v9 = (id)objc_msgSend(v8, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v7, 10, 0, 1.0, 0.0);
  objc_msgSend(v11, "addConstraint:");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinner, 0);
}

@end
