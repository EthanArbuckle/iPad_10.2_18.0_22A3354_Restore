@implementation NotificationViewController

- (void)didReceiveNotification:(id)a3
{
  id v4;
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
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[4];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NotificationViewController presentedContentViewController](self, "presentedContentViewController"));

  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor appTintColor](UIColor, "appTintColor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NotificationViewController view](self, "view"));
    objc_msgSend(v7, "setTintColor:", v6);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NotificationViewControllerFactory contentAvailableViewControllerForNotification:](NotificationViewControllerFactory, "contentAvailableViewControllerForNotification:", v4));
    objc_msgSend(v8, "loadViewIfNeeded");
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NotificationViewController extensionContext](self, "extensionContext"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "notificationActions"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "actionsWithDefaultActions:", v10));

    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[NotificationViewController extensionContext](self, "extensionContext"));
      objc_msgSend(v12, "setNotificationActions:", v11);

    }
    if (v8)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[NotificationViewController view](self, "view"));
      v29 = v11;
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "view"));
      objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[NotificationViewController addChildViewController:](self, "addChildViewController:", v8);
      objc_msgSend(v13, "addSubview:", v14);
      objc_msgSend(v8, "didMoveToParentViewController:", self);
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "topAnchor"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "topAnchor"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:", v27));
      v30[0] = v26;
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "leadingAnchor"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "leadingAnchor"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:", v24));
      v30[1] = v23;
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "bottomAnchor"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bottomAnchor"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v15));
      v30[2] = v16;
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "trailingAnchor"));
      v18 = v4;
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "trailingAnchor"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:", v19));
      v30[3] = v20;
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v30, 4));

      v4 = v18;
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v21);
      objc_storeStrong((id *)&self->_presentedContentViewController, v8);

      v11 = v29;
    }

  }
}

- (CGSize)calculatePreferredContentSize
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double height;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NotificationViewController presentedContentViewController](self, "presentedContentViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "view"));
  objc_msgSend(v4, "bounds");
  v6 = v5;

  height = UILayoutFittingCompressedSize.height;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NotificationViewController presentedContentViewController](self, "presentedContentViewController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "view"));
  objc_msgSend(v9, "systemLayoutSizeFittingSize:", v6, height);
  v11 = v10;
  v13 = v12;

  v14 = v11;
  v15 = v13;
  result.height = v15;
  result.width = v14;
  return result;
}

- (ConcreteContentAvailableViewController)presentedContentViewController
{
  return self->_presentedContentViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentedContentViewController, 0);
}

@end
