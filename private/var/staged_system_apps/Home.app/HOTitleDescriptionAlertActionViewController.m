@implementation HOTitleDescriptionAlertActionViewController

- (HOTitleDescriptionAlertActionViewController)initWithTitle:(id)a3 titleColor:(id)a4 description:(id)a5 descriptionColor:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  HOTitleDescriptionAlertActionViewController *v14;
  HOTitleDescriptionView *v15;
  HOTitleDescriptionView *titleDescriptionView;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v22.receiver = self;
  v22.super_class = (Class)HOTitleDescriptionAlertActionViewController;
  v14 = -[HOTitleDescriptionAlertActionViewController initWithNibName:bundle:](&v22, "initWithNibName:bundle:", 0, 0);
  if (v14)
  {
    v15 = -[HOTitleDescriptionView initWithFrame:]([HOTitleDescriptionView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    titleDescriptionView = v14->_titleDescriptionView;
    v14->_titleDescriptionView = v15;

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[HOTitleDescriptionView titleLabel](v14->_titleDescriptionView, "titleLabel"));
    objc_msgSend(v17, "setText:", v10);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[HOTitleDescriptionView titleLabel](v14->_titleDescriptionView, "titleLabel"));
    objc_msgSend(v18, "setTextColor:", v11);

    if (v12)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[HOTitleDescriptionView descriptionLabel](v14->_titleDescriptionView, "descriptionLabel"));
      objc_msgSend(v19, "setText:", v12);

      v20 = (void *)objc_claimAutoreleasedReturnValue(-[HOTitleDescriptionView descriptionLabel](v14->_titleDescriptionView, "descriptionLabel"));
      objc_msgSend(v20, "setTextColor:", v13);

    }
  }

  return v14;
}

- (HOTitleDescriptionAlertActionViewController)initWithCoder:(id)a3
{
  void *v5;
  NSString *v6;
  void *v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler", a3));
  v6 = NSStringFromSelector("initWithTitle:titleColor:description:descriptionColor:");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HOTitleDescriptionAlertActionViewController.m"), 90, CFSTR("%s is unavailable; use %@ instead"),
    "-[HOTitleDescriptionAlertActionViewController initWithCoder:]",
    v7);

  return 0;
}

- (HOTitleDescriptionAlertActionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  void *v6;
  NSString *v7;
  void *v8;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler", a3, a4));
  v7 = NSStringFromSelector("initWithTitle:titleColor:description:descriptionColor:");
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HOTitleDescriptionAlertActionViewController.m"), 94, CFSTR("%s is unavailable; use %@ instead"),
    "-[HOTitleDescriptionAlertActionViewController initWithNibName:bundle:]",
    v8);

  return 0;
}

- (void)loadView
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[HOTitleDescriptionAlertActionViewController titleDescriptionView](self, "titleDescriptionView"));
  -[HOTitleDescriptionAlertActionViewController setView:](self, "setView:", v3);

}

- (CGSize)preferredContentSize
{
  double width;
  double height;
  CGSize result;

  width = CGSizeZero.width;
  height = CGSizeZero.height;
  result.height = height;
  result.width = width;
  return result;
}

- (HOTitleDescriptionView)titleDescriptionView
{
  return self->_titleDescriptionView;
}

- (void)setTitleDescriptionView:(id)a3
{
  objc_storeStrong((id *)&self->_titleDescriptionView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleDescriptionView, 0);
}

@end
