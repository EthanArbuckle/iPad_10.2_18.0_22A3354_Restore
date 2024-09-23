@implementation EventDetailNavigationController

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)EventDetailNavigationController;
  -[EventDetailNavigationController viewWillDisappear:](&v6, "viewWillDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[EventDetailNavigationController doneBlock](self, "doneBlock"));

  if (v4)
  {
    v5 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[EventDetailNavigationController doneBlock](self, "doneBlock"));
    ((void (**)(_QWORD, EventDetailNavigationController *, _QWORD))v5)[2](v5, self, 0);

  }
}

- (CGSize)preferredContentSize
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  double v7;
  CGFloat width;
  double v9;
  CGFloat height;
  double v11;
  double v12;
  CGSize result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[EventDetailNavigationController viewControllers](self, "viewControllers"));
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[EventDetailNavigationController viewControllers](self, "viewControllers"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", 0));

    objc_msgSend(v6, "preferredContentSize");
    width = v7;
    height = v9;

  }
  else
  {
    width = CGSizeZero.width;
    height = CGSizeZero.height;
  }
  v11 = width;
  v12 = height;
  result.height = v12;
  result.width = v11;
  return result;
}

- (EKEvent)event
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[EventDetailNavigationController viewControllers](self, "viewControllers"));
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[EventDetailNavigationController viewControllers](self, "viewControllers"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", 0));

    v7 = 0;
    if ((objc_opt_respondsToSelector(v6, "event") & 1) != 0)
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "performSelector:", "event"));

  }
  else
  {
    v7 = 0;
  }
  return (EKEvent *)v7;
}

- (id)doneBlock
{
  return self->_doneBlock;
}

- (void)setDoneBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_doneBlock, 0);
}

@end
