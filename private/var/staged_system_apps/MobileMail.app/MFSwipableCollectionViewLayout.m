@implementation MFSwipableCollectionViewLayout

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001AB280;
  block[3] = &unk_10051A7D0;
  block[4] = a1;
  if (qword_1005AA420 != -1)
    dispatch_once(&qword_1005AA420, block);
  return (OS_os_log *)(id)qword_1005AA418;
}

- (void)setSwipeDelegate:(id)a3
{
  id WeakRetained;
  void *v5;
  UISwipeActionController *v6;
  UISwipeActionController *swipeController;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_swipeDelegate);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_swipeDelegate, obj);
    v6 = (UISwipeActionController *)objc_msgSend(objc_alloc((Class)UISwipeActionController), "initWithSwipeActionHost:style:", self, 1);
    swipeController = self->_swipeController;
    self->_swipeController = v6;

    v5 = obj;
  }

}

- (void)invalidateLayoutWithContext:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  unsigned int v7;
  unsigned int v8;
  objc_super v9;
  uint8_t buf[4];
  id v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MFSwipableCollectionViewLayout;
  -[MFSwipableCollectionViewLayout invalidateLayoutWithContext:](&v9, "invalidateLayoutWithContext:", v4);
  if (objc_msgSend(v4, "invalidateEverything"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFSwipableCollectionViewLayout swipeController](self, "swipeController"));
    objc_msgSend(v5, "resetSwipedItemAnimated:completion:", 0, 0);

  }
  v6 = objc_claimAutoreleasedReturnValue(+[MFSwipableCollectionViewLayout log](MFSwipableCollectionViewLayout, "log"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_msgSend(v4, "invalidateEverything");
    v8 = objc_msgSend(v4, "invalidateDataSourceCounts");
    *(_DWORD *)buf = 134218496;
    v11 = v4;
    v12 = 2048;
    v13 = v7;
    v14 = 2048;
    v15 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "invalidateLayoutWithContext:%p invalidateEverything: %ld invalidateDataSourceCounts: %ld", buf, 0x20u);
  }

}

- (id)traitCollection
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MFSwipableCollectionViewLayout collectionView](self, "collectionView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "traitCollection"));

  return v3;
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFSwipableCollectionViewLayout collectionView](self, "collectionView"));
  objc_msgSend(v4, "traitCollectionDidChange:", v5);

}

- (void)prepareForTransitionFromLayout:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)MFSwipableCollectionViewLayout;
  -[MFSwipableCollectionViewLayout prepareForTransitionFromLayout:](&v6, "prepareForTransitionFromLayout:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFSwipableCollectionViewLayout swipeController](self, "swipeController"));
  objc_msgSend(v5, "setSwipeEnabled:", 1);

}

- (void)prepareForTransitionToLayout:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)MFSwipableCollectionViewLayout;
  -[MFSwipableCollectionViewLayout prepareForTransitionToLayout:](&v6, "prepareForTransitionToLayout:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFSwipableCollectionViewLayout swipeController](self, "swipeController"));
  objc_msgSend(v5, "setSwipeEnabled:", 0);

}

- (NSIndexPath)swipedIndexPath
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MFSwipableCollectionViewLayout swipeController](self, "swipeController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "swipedIndexPath"));

  return (NSIndexPath *)v3;
}

- (UIEdgeInsets)swipeActionController:(id)a3 extraInsetsForItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  UIEdgeInsets result;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFSwipableCollectionViewLayout collectionView](self, "collectionView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cellForItemAtIndexPath:", v5));

  objc_msgSend(v7, "safeAreaInsets");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v16 = v9;
  v17 = v11;
  v18 = v13;
  v19 = v15;
  result.right = v19;
  result.bottom = v18;
  result.left = v17;
  result.top = v16;
  return result;
}

- (id)gestureRecognizerViewForSwipeActionController:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue(-[MFSwipableCollectionViewLayout collectionView](self, "collectionView", a3));
}

- (id)itemContainerViewForSwipeActionController:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue(-[MFSwipableCollectionViewLayout collectionView](self, "collectionView", a3));
}

- (id)swipeActionController:(id)a3 leadingSwipeConfigurationForItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFSwipableCollectionViewLayout swipeDelegate](self, "swipeDelegate"));
  if ((objc_opt_respondsToSelector(v6, "swipableCollectionViewLayout:leadingSwipeActionsConfigurationForItemAtIndexPath:") & 1) != 0)v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "swipableCollectionViewLayout:leadingSwipeActionsConfigurationForItemAtIndexPath:", self, v5));
  else
    v7 = 0;

  return v7;
}

- (id)swipeActionController:(id)a3 trailingSwipeConfigurationForItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFSwipableCollectionViewLayout swipeDelegate](self, "swipeDelegate"));
  if ((objc_opt_respondsToSelector(v6, "swipableCollectionViewLayout:trailingSwipeActionsConfigurationForItemAtIndexPath:") & 1) != 0)v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "swipableCollectionViewLayout:trailingSwipeActionsConfigurationForItemAtIndexPath:", self, v5));
  else
    v7 = 0;

  return v7;
}

- (id)swipeActionController:(id)a3 indexPathForTouchLocation:(CGPoint)a4
{
  double y;
  double x;
  void *v6;
  void *v7;

  y = a4.y;
  x = a4.x;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFSwipableCollectionViewLayout collectionView](self, "collectionView", a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "indexPathForItemAtPoint:", x, y));

  return v7;
}

- (id)swipeActionController:(id)a3 viewForItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFSwipableCollectionViewLayout collectionView](self, "collectionView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cellForItemAtIndexPath:", v5));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "contentWrapperView"));

  return v8;
}

- (void)setSwipedIndexPath:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a4;
  v13 = a3;
  v8 = a5;
  if (v13)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MFSwipableCollectionViewLayout swipeController](self, "swipeController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MFSwipableCollectionViewLayout swipeActionController:trailingSwipeConfigurationForItemAtIndexPath:](self, "swipeActionController:trailingSwipeConfigurationForItemAtIndexPath:", v9, v13));

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MFSwipableCollectionViewLayout swipeController](self, "swipeController"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MFSwipableCollectionViewLayout collectionView](self, "collectionView"));
    objc_msgSend(v11, "swipeItemAtIndexPath:configuration:direction:animated:completion:", v13, v10, sub_1001BB894(0, v12), v6, v8);

  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MFSwipableCollectionViewLayout swipeController](self, "swipeController"));
    objc_msgSend(v10, "resetSwipedItemAnimated:completion:", v6, v8);
  }

}

- (void)swipeActionController:(id)a3 animateView:(id)a4 actionsView:(id)a5 forDestructiveAction:(id)a6 atIndexPath:(id)a7 withSwipeInfo:(id *)a8 completion:(id)a9
{
  id v12;
  id v13;
  id v14;
  void *v15;
  double v16;
  double v17;
  double var4;
  id v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  double v27;

  v12 = a4;
  v13 = a5;
  v14 = a9;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MFSwipableCollectionViewLayout collectionView](self, "collectionView"));
  objc_msgSend(v15, "frame");
  v17 = v16 * 1.5 * _UIDirectionalMultiplierForSwipeDirection(a8->var0);

  var4 = a8->var4;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1001ABD24;
  v24[3] = &unk_10051CF70;
  v19 = v12;
  v25 = v19;
  v27 = v17;
  v20 = v13;
  v26 = v20;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1001ABDD4;
  v22[3] = &unk_10051D7E0;
  v22[4] = self;
  v21 = v14;
  v23 = v21;
  +[UIView animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:](UIView, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v24, v22, 0.400000006, 0.0, 1.0, var4);

}

- (void)swipeActionController:(id)a3 willBeginSwipeForItemAtIndexPath:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFSwipableCollectionViewLayout swipeDelegate](self, "swipeDelegate"));
  if ((objc_opt_respondsToSelector(v5, "swipableCollectionViewLayout:willBeginSwipeAtIndexPath:") & 1) != 0)
    objc_msgSend(v5, "swipableCollectionViewLayout:willBeginSwipeAtIndexPath:", self, v6);

}

- (void)swipeActionController:(id)a3 willEndSwipeForItemAtIndexPath:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFSwipableCollectionViewLayout swipeDelegate](self, "swipeDelegate"));
  if ((objc_opt_respondsToSelector(v5, "swipableCollectionViewLayout:willEndSwipeForItemAtIndexPath:") & 1) != 0)
    objc_msgSend(v5, "swipableCollectionViewLayout:willEndSwipeForItemAtIndexPath:", self, v6);

}

- (int64_t)layoutDirectionForSwipeActionController:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MFSwipableCollectionViewLayout collectionView](self, "collectionView", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "traitCollection"));
  v5 = objc_msgSend(v4, "layoutDirection");

  return (int64_t)v5;
}

- (void)prepareForCollectionViewUpdates:(id)a3
{
  id v4;
  NSMutableSet *v5;
  _QWORD v6[5];
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MFSwipableCollectionViewLayout;
  -[MFSwipableCollectionViewLayout prepareForCollectionViewUpdates:](&v7, "prepareForCollectionViewUpdates:", v4);
  v5 = objc_opt_new(NSMutableSet);
  -[MFSwipableCollectionViewLayout setInsertedIndexPaths:](self, "setInsertedIndexPaths:", v5);

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1001AC070;
  v6[3] = &unk_100522CC8;
  v6[4] = self;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v6);

}

- (void)finalizeCollectionViewUpdates
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MFSwipableCollectionViewLayout;
  -[MFSwipableCollectionViewLayout finalizeCollectionViewUpdates](&v3, "finalizeCollectionViewUpdates");
  -[MFSwipableCollectionViewLayout setInsertedIndexPaths:](self, "setInsertedIndexPaths:", 0);
}

- (id)initialLayoutAttributesForAppearingItemAtIndexPath:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  NSObject *v10;
  uint8_t v12[16];
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MFSwipableCollectionViewLayout;
  v5 = -[MFSwipableCollectionViewLayout initialLayoutAttributesForAppearingItemAtIndexPath:](&v13, "initialLayoutAttributesForAppearingItemAtIndexPath:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MFSwipableCollectionViewLayout swipeDelegate](self, "swipeDelegate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MFSwipableCollectionViewLayout insertedIndexPaths](self, "insertedIndexPaths"));
  v9 = objc_msgSend(v8, "containsObject:", v4);

  LODWORD(self) = objc_msgSend(v7, "swipableCollectionViewLayout:shouldAnimateAppearingItemAtIndexPath:", self, v4);
  if ((_os_feature_enabled_impl("Mail", "QuickReply") & v9 & self) == 1)
  {
    objc_msgSend(v6, "setAlpha:", 1.0);
    v10 = objc_claimAutoreleasedReturnValue(+[MFSwipableCollectionViewLayout log](MFSwipableCollectionViewLayout, "log"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[Quick Reply][Send Animation] Will use quick-reply send animation", v12, 2u);
    }

  }
  return v6;
}

- (NSIndexPath)expandingIndexPath
{
  return self->_expandingIndexPath;
}

- (void)setExpandingIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_expandingIndexPath, a3);
}

- (MFMessageDisplayMetrics)displayMetrics
{
  return self->_displayMetrics;
}

- (void)setDisplayMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_displayMetrics, a3);
}

- (MFSwipableCollectionViewLayoutDelegate)swipeDelegate
{
  return (MFSwipableCollectionViewLayoutDelegate *)objc_loadWeakRetained((id *)&self->_swipeDelegate);
}

- (UISwipeActionController)swipeController
{
  return self->_swipeController;
}

- (void)setSwipeController:(id)a3
{
  objc_storeStrong((id *)&self->_swipeController, a3);
}

- (NSMutableSet)insertedIndexPaths
{
  return self->_insertedIndexPaths;
}

- (void)setInsertedIndexPaths:(id)a3
{
  objc_storeStrong((id *)&self->_insertedIndexPaths, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_insertedIndexPaths, 0);
  objc_storeStrong((id *)&self->_swipeController, 0);
  objc_destroyWeak((id *)&self->_swipeDelegate);
  objc_storeStrong((id *)&self->_displayMetrics, 0);
  objc_storeStrong((id *)&self->_expandingIndexPath, 0);
}

@end
