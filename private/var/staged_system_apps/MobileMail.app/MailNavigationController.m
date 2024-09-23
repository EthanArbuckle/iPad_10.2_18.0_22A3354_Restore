@implementation MailNavigationController

- (void)_commonInit
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MailNavigationController view](self, "view"));
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailNavigationController view](self, "view"));
  objc_msgSend(v5, "setOpaque:", 0);

  -[MailNavigationController _setClipUnderlapWhileTransitioning:](self, "_setClipUnderlapWhileTransitioning:", 1);
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  unsigned int v5;
  UITapGestureRecognizer *v6;
  UITapGestureRecognizer *navbarDoubleTapRecognizer;
  UITapGestureRecognizer *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MailNavigationController;
  -[MailNavigationController viewDidAppear:](&v10, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults em_userDefaults](NSUserDefaults, "em_userDefaults"));
  v5 = objc_msgSend(v4, "BOOLForKey:", CFSTR("EnableDoubleTapToShowSpec"));

  if (v5)
  {
    if (!self->_navbarDoubleTapRecognizer)
    {
      v6 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "doubleTappedNavbar:");
      navbarDoubleTapRecognizer = self->_navbarDoubleTapRecognizer;
      self->_navbarDoubleTapRecognizer = v6;

      -[UITapGestureRecognizer setNumberOfTapsRequired:](self->_navbarDoubleTapRecognizer, "setNumberOfTapsRequired:", 2);
    }
    v8 = (UITapGestureRecognizer *)objc_claimAutoreleasedReturnValue(-[MailNavigationController navigationBar](self, "navigationBar"));
    -[UITapGestureRecognizer addGestureRecognizer:](v8, "addGestureRecognizer:", self->_navbarDoubleTapRecognizer);
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MailNavigationController navigationBar](self, "navigationBar"));
    objc_msgSend(v9, "removeGestureRecognizer:", self->_navbarDoubleTapRecognizer);

    v8 = self->_navbarDoubleTapRecognizer;
    self->_navbarDoubleTapRecognizer = 0;
  }

}

- (BOOL)_viewControllerUnderlapsStatusBar
{
  return 1;
}

- (MailNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  MailNavigationController *v4;
  MailNavigationController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MailNavigationController;
  v4 = -[MailNavigationController initWithNavigationBarClass:toolbarClass:](&v7, "initWithNavigationBarClass:toolbarClass:", a3, a4);
  v5 = v4;
  if (v4)
    -[MailNavigationController _commonInit](v4, "_commonInit");
  return v5;
}

- (MailNavigationController)initWithRootViewController:(id)a3
{
  id v4;
  MailNavigationController *v5;
  MailNavigationController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MailNavigationController;
  v5 = -[MailNavigationController initWithRootViewController:](&v8, "initWithRootViewController:", v4);
  v6 = v5;
  if (v5)
    -[MailNavigationController _commonInit](v5, "_commonInit");

  return v6;
}

- (BOOL)shouldAutorotate
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MailNavigationController topViewController](self, "topViewController"));
  v3 = objc_msgSend(v2, "shouldAutorotate");

  return v3;
}

- (BOOL)_willPerformCustomNavigationTransitionForPop
{
  unsigned __int8 v3;
  void *v4;
  uint64_t v5;
  char isKindOfClass;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MailNavigationController;
  v3 = -[MailNavigationController _willPerformCustomNavigationTransitionForPop](&v9, "_willPerformCustomNavigationTransitionForPop");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MailNavigationController topViewController](self, "topViewController"));
  v5 = objc_opt_class(MailDetailNavigationController);
  isKindOfClass = objc_opt_isKindOfClass(v4, v5);

  if ((isKindOfClass & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MailNavigationController topViewController](self, "topViewController"));
    v3 = objc_msgSend(v7, "_willPerformCustomNavigationTransitionForPop");

  }
  return v3;
}

- (BOOL)_willPerformCustomNavigationTransitionForPush
{
  unsigned __int8 v3;
  void *v4;
  uint64_t v5;
  char isKindOfClass;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MailNavigationController;
  v3 = -[MailNavigationController _willPerformCustomNavigationTransitionForPush](&v9, "_willPerformCustomNavigationTransitionForPush");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MailNavigationController topViewController](self, "topViewController"));
  v5 = objc_opt_class(MailDetailNavigationController);
  isKindOfClass = objc_opt_isKindOfClass(v4, v5);

  if ((isKindOfClass & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MailNavigationController topViewController](self, "topViewController"));
    v3 = objc_msgSend(v7, "_willPerformCustomNavigationTransitionForPush");

  }
  return v3;
}

- (BOOL)_shouldCrossFadeNavigationBar
{
  unsigned __int8 v3;
  void *v4;
  uint64_t v5;
  char isKindOfClass;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MailNavigationController;
  v3 = -[MailNavigationController _shouldCrossFadeNavigationBar](&v9, "_shouldCrossFadeNavigationBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MailNavigationController topViewController](self, "topViewController"));
  v5 = objc_opt_class(MailDetailNavigationController);
  isKindOfClass = objc_opt_isKindOfClass(v4, v5);

  if ((isKindOfClass & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MailNavigationController topViewController](self, "topViewController"));
    v3 = objc_msgSend(v7, "_shouldCrossFadeNavigationBar");

  }
  return v3;
}

- (void)doubleTappedNavbar:(id)a3
{
  id v4;

  v4 = objc_alloc_init((Class)UIImagePickerController);
  objc_msgSend(v4, "setSourceType:", 0);
  objc_msgSend(v4, "setDelegate:", self);
  objc_msgSend(v4, "setAllowsEditing:", 0);
  -[MailNavigationController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v4, 1, 0);

}

- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4
{
  id v5;
  _QWORD v6[4];
  id v7;
  MailNavigationController *v8;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000F13D0;
  v6[3] = &unk_10051A910;
  v7 = a4;
  v8 = self;
  v5 = v7;
  -[MailNavigationController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navbarDoubleTapRecognizer, 0);
}

@end
