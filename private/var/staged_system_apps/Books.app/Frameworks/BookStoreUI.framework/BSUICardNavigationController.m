@implementation BSUICardNavigationController

- (void)setNavigationBarHidden:(BOOL)a3 animated:(BOOL)a4
{
  unsigned int v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  double v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  uint64_t v21;
  double v22;
  _QWORD v23[4];
  id v24;
  double v25;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)BSUICardNavigationController;
  -[BSUICardNavigationController setNavigationBarHidden:animated:](&v26, "setNavigationBarHidden:animated:", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BSUICardNavigationController cardStackViewController](self, "cardStackViewController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "topCardSetViewController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "currentCardViewController"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "topContentViewController"));
  v10 = objc_msgSend(v9, "_appearState");

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "statusBarBackgroundController"));
  objc_msgSend(v11, "opacity");
  v13 = v12;

  if ((v10 & 0xFFFFFFFD) == 1)
    v4 = objc_msgSend(v8, "prefersStatusBarBackgroundHidden") ^ 1;
  v14 = _os_feature_enabled_impl("Books", "unifiedProductPage");
  if (objc_msgSend(v8, "expanded"))
  {
    v15 = (double)(v4 & (v14 ^ 1));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "topContentViewController"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "transitionCoordinator"));

    if (v17)
    {
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_10A68;
      v23[3] = &unk_2E4560;
      v24 = v6;
      v25 = v15;
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_10AA8;
      v19[3] = &unk_2E4588;
      v20 = v24;
      v21 = v13;
      v22 = v15;
      objc_msgSend(v17, "animateAlongsideTransition:completion:", v23, v19);

      v18 = v24;
    }
    else
    {
      v18 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "statusBarBackgroundController"));
      objc_msgSend(v18, "setOpacity:", v15);
    }

  }
}

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  objc_super v7;

  v4 = a4;
  v6 = a3;
  -[BSUICardNavigationController _updateNavigationTypeForViewController:](self, "_updateNavigationTypeForViewController:", v6);
  v7.receiver = self;
  v7.super_class = (Class)BSUICardNavigationController;
  -[BSUINavigationController pushViewController:animated:](&v7, "pushViewController:animated:", v6, v4);

}

- (id)popViewControllerAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  objc_super v12;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BSUICardNavigationController viewControllers](self, "viewControllers"));
  if ((unint64_t)objc_msgSend(v5, "count") <= 1)
  {
    -[BSUICardNavigationController _updateNavigationTypeForViewController:](self, "_updateNavigationTypeForViewController:", 0);
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BSUICardNavigationController viewControllers](self, "viewControllers"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BSUICardNavigationController viewControllers](self, "viewControllers"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", (char *)objc_msgSend(v7, "count") - 2));
    -[BSUICardNavigationController _updateNavigationTypeForViewController:](self, "_updateNavigationTypeForViewController:", v8);

  }
  v12.receiver = self;
  v12.super_class = (Class)BSUICardNavigationController;
  v9 = -[BSUINavigationController popViewControllerAnimated:](&v12, "popViewControllerAnimated:", v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  -[BSUIFeedNavigationController updateTopFeedLiveResizeOptions](self, "updateTopFeedLiveResizeOptions");
  return v10;
}

- (id)popToViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  void *v8;
  objc_super v10;

  v4 = a4;
  v6 = a3;
  -[BSUICardNavigationController _updateNavigationTypeForViewController:](self, "_updateNavigationTypeForViewController:", v6);
  v10.receiver = self;
  v10.super_class = (Class)BSUICardNavigationController;
  v7 = -[BSUINavigationController popToViewController:animated:](&v10, "popToViewController:animated:", v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  -[BSUIFeedNavigationController updateTopFeedLiveResizeOptions](self, "updateTopFeedLiveResizeOptions");
  return v8;
}

- (id)popToRootViewControllerAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  objc_super v10;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BSUICardNavigationController viewControllers](self, "viewControllers"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));
  -[BSUICardNavigationController _updateNavigationTypeForViewController:](self, "_updateNavigationTypeForViewController:", v6);

  v10.receiver = self;
  v10.super_class = (Class)BSUICardNavigationController;
  v7 = -[BSUINavigationController popToRootViewControllerAnimated:](&v10, "popToRootViewControllerAnimated:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  -[BSUIFeedNavigationController updateTopFeedLiveResizeOptions](self, "updateTopFeedLiveResizeOptions");
  return v8;
}

- (void)setIsCurrentCard:(BOOL)a3
{
  if (*(&self->super._isCoveredByCardStack + 1) != a3)
  {
    *(&self->super._isCoveredByCardStack + 1) = a3;
    -[BSUIFeedNavigationController updateTopFeedLiveResizeOptions](self, "updateTopFeedLiveResizeOptions");
    -[BSUICardNavigationController notifyFeedDidBecomeCurrent](self, "notifyFeedDidBecomeCurrent");
  }
}

- (void)notifyFeedDidBecomeCurrent
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  if (-[BSUICardNavigationController isCurrentCard](self, "isCurrentCard"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedNavigationController currentFeedViewController](self, "currentFeedViewController"));
    objc_msgSend(v3, "didBecomeCurrentFeed");

    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BSUICardNavigationController topViewController](self, "topViewController"));
    v5 = BUProtocolCast(&OBJC_PROTOCOL___BCCardContentScrollViewDelegate, v4);
    v6 = (id)objc_claimAutoreleasedReturnValue(v5);

    objc_msgSend(v6, "didBecomeVisibleContentScrollView");
  }
}

- (int64_t)_topFeedLiveResizeOptions
{
  return -[BSUICardNavigationController isCurrentCard](self, "isCurrentCard") ^ 1;
}

- (void)_updateNavigationTypeForViewController:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BSUICardNavigationController cardStackViewController](self, "cardStackViewController"));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topCardSetViewController"));

  v6 = BUProtocolCast(&OBJC_PROTOCOL___BCCardCycleObserving, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  objc_msgSend(v7, "cardSetViewController:willUpdateWithNavigationType:", v8, objc_msgSend(v8, "lastNavigationType"));
}

- (BOOL)accessibilityPerformEscape
{
  void *v3;
  id v4;
  id v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BSUICardNavigationController viewControllers](self, "viewControllers"));
  v4 = objc_msgSend(v3, "count");

  if ((unint64_t)v4 < 2)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BSUICardNavigationController cardStackViewController](self, "cardStackViewController"));
    objc_msgSend(v6, "popCardsAnimated:", 1);

  }
  else
  {
    v5 = -[BSUICardNavigationController popViewControllerAnimated:](self, "popViewControllerAnimated:", 1);
  }
  return 1;
}

- (BOOL)isCurrentCard
{
  return *(&self->super._isCoveredByCardStack + 1);
}

@end
