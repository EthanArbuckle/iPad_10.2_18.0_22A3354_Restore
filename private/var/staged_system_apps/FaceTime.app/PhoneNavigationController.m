@implementation PhoneNavigationController

+ (int)tabViewType
{
  return 0;
}

+ ($1FF454C5B48E436092D281DABF654916)badge
{
  _BOOL8 v2;
  unint64_t v3;
  $1FF454C5B48E436092D281DABF654916 result;

  v2 = 1;
  v3 = 0;
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

+ (id)tabBarIconName
{
  return 0;
}

+ (id)tabBarIconImage
{
  return 0;
}

+ (id)defaultPNGName
{
  return CFSTR("Default");
}

- (PhoneNavigationController)initWithRootViewController:(id)a3
{
  PhoneNavigationController *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PhoneNavigationController;
  v3 = -[PhoneNavigationController initWithRootViewController:](&v9, "initWithRootViewController:", a3);
  if (v3)
  {
    if (objc_msgSend(UIApp, "userInterfaceStyle") == 1)
    {
      v4 = objc_alloc_init((Class)UIImage);
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneNavigationController navigationBar](v3, "navigationBar"));
      objc_msgSend(v5, "setBackgroundImage:forBarPosition:barMetrics:", v4, 0, 0);

      v6 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneNavigationController navigationBar](v3, "navigationBar"));
      objc_msgSend(v6, "setBarStyle:", 1);

      v7 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneNavigationController navigationBar](v3, "navigationBar"));
      objc_msgSend(v7, "setTranslucent:", 1);

      -[PhoneNavigationController _setClipUnderlapWhileTransitioning:](v3, "_setClipUnderlapWhileTransitioning:", 1);
    }
    -[PhoneNavigationController setDefinesPresentationContext:](v3, "setDefinesPresentationContext:", 0);
  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PhoneNavigationController;
  -[PhoneNavigationController dealloc](&v4, "dealloc");
}

- (void)_updateRootViewController
{
  PhoneTabViewController *v3;
  PhoneTabViewController *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[PhoneNavigationController viewControllers](self, "viewControllers"));
  if (!objc_msgSend(v5, "count"))
    goto LABEL_5;
  v3 = (PhoneTabViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndex:", 0));
  v4 = v3;
  if (v3
    && (-[PhoneTabViewController conformsToProtocol:](v3, "conformsToProtocol:", &OBJC_PROTOCOL___PhoneTabViewController) & 1) == 0)
  {

LABEL_5:
    v4 = 0;
  }
  if (v4 != self->_rootController)
    objc_storeStrong((id *)&self->_rootController, v4);

}

- (id)rootViewController
{
  return self->_rootController;
}

- (void)setViewControllers:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PhoneNavigationController;
  -[PhoneNavigationController setViewControllers:](&v4, "setViewControllers:", a3);
  -[PhoneNavigationController _updateRootViewController](self, "_updateRootViewController");
}

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;
  objc_super v9;

  v4 = a4;
  v6 = a3;
  if (objc_msgSend(UIApp, "userInterfaceStyle") == 1)
    objc_msgSend(v6, "setEdgesForExtendedLayout:", 0);
  v9.receiver = self;
  v9.super_class = (Class)PhoneNavigationController;
  -[PhoneNavigationController pushViewController:animated:](&v9, "pushViewController:animated:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneNavigationController viewControllers](self, "viewControllers"));
  v8 = objc_msgSend(v7, "count");

  if (v8 == (id)1)
    -[PhoneNavigationController _updateRootViewController](self, "_updateRootViewController");

}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  objc_super v10;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  if (objc_msgSend(UIApp, "userInterfaceStyle") == 1)
    objc_msgSend(v8, "setEdgesForExtendedLayout:", 0);
  v10.receiver = self;
  v10.super_class = (Class)PhoneNavigationController;
  -[PhoneNavigationController presentViewController:animated:completion:](&v10, "presentViewController:animated:completion:", v8, v6, v9);

}

- (BOOL)shouldSnapshot
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneNavigationController rootViewController](self, "rootViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneNavigationController visibleViewController](self, "visibleViewController"));
  if (v4 == v3)
    v5 = objc_msgSend(v3, "shouldSnapshot");
  else
    v5 = 0;

  return v5;
}

- (void)prepareForSnapshot
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[PhoneNavigationController rootViewController](self, "rootViewController"));
  objc_msgSend(v2, "prepareForSnapshot");

}

- (void)handleURL:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneNavigationController rootViewController](self, "rootViewController"));
  if ((objc_opt_respondsToSelector(v4, "handleURL:") & 1) != 0)
    objc_msgSend(v4, "handleURL:", v5);

}

- (MPVoicemailController)voicemailController
{
  return self->_voicemailController;
}

- (void)setVoicemailController:(id)a3
{
  objc_storeStrong((id *)&self->_voicemailController, a3);
}

- (VMPlayerController)playerController
{
  return self->_playerController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerController, 0);
  objc_storeStrong((id *)&self->_voicemailController, 0);
  objc_storeStrong((id *)&self->_rootController, 0);
}

@end
