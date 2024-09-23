@implementation CarAlertButtonViewController

- (CarAlertButtonViewController)initWithTitle:(id)a3 image:(id)a4
{
  id v6;
  id v7;
  CarAlertButtonViewController *v8;
  CarAlertButtonView *v9;
  CarAlertButtonView *contentView;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CarAlertButtonViewController;
  v8 = -[CarAlertButtonViewController initWithNibName:bundle:](&v12, "initWithNibName:bundle:", 0, 0);
  if (v8)
  {
    v9 = -[CarAlertButtonView initWithTitle:image:]([CarAlertButtonView alloc], "initWithTitle:image:", v6, v7);
    contentView = v8->_contentView;
    v8->_contentView = v9;

  }
  return v8;
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

- (void)loadView
{
  id v3;
  id v4;

  v4 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "_handleTouch:");
  objc_msgSend(v4, "setAllowedPressTypes:", &off_101273EC0);
  -[CarAlertButtonView addGestureRecognizer:](self->_contentView, "addGestureRecognizer:", v4);
  v3 = objc_msgSend(objc_alloc((Class)UILongPressGestureRecognizer), "initWithTarget:action:", self, "_handleTouch:");
  objc_msgSend(v3, "setAllowedTouchTypes:", &off_101273ED8);
  objc_msgSend(v3, "setMinimumPressDuration:", 0.0);
  objc_msgSend(v3, "setCancelsTouchesInView:", 0);
  -[CarAlertButtonView addGestureRecognizer:](self->_contentView, "addGestureRecognizer:", v3);
  -[CarAlertButtonViewController setView:](self, "setView:", self->_contentView);

}

- (void)_handleTouch:(id)a3
{
  if (objc_msgSend(a3, "state") == (id)3)
    -[CarAlertButtonViewController _dismissAlertController](self, "_dismissAlertController");
}

- (void)_dismissAlertController
{
  -[CarAlertButtonView setHighlighted:](self->_contentView, "setHighlighted:", 0);
  -[CarAlertButtonViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  objc_super v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[1] = 3221225472;
  v8[2] = sub_1008EE79C;
  v8[3] = &unk_1011ADA00;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[CarAlertButtonViewController completionHandler](self, "completionHandler", a3, a4));
  v7.receiver = self;
  v7.super_class = (Class)CarAlertButtonViewController;
  v8[0] = _NSConcreteStackBlock;
  v6 = v9;
  -[CarAlertButtonViewController dismissViewControllerAnimated:completion:](&v7, "dismissViewControllerAnimated:completion:", v4, v8);

}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
