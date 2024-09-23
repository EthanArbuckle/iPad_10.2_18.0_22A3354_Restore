@implementation MapsFormSheetPresentationController

- (MapsFormSheetPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4
{
  id v6;
  id v7;
  MapsFormSheetPresentationController *v8;
  MapsFormSheetPresentationController *v9;
  void *v10;
  void *v11;
  void **v13;
  uint64_t v14;
  double (*v15)(uint64_t);
  void *v16;
  id v17;
  id location;
  objc_super v19;
  void *v20;

  v6 = a3;
  v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)MapsFormSheetPresentationController;
  v8 = -[MapsFormSheetPresentationController initWithPresentedViewController:presentingViewController:](&v19, "initWithPresentedViewController:presentingViewController:", v6, v7);
  v9 = v8;
  if (v8)
  {
    -[MapsFormSheetPresentationController setDelegate:](v8, "setDelegate:", v8);
    objc_initWeak(&location, v9);
    v13 = _NSConcreteStackBlock;
    v14 = 3221225472;
    v15 = sub_1008DF6A0;
    v16 = &unk_1011DB060;
    objc_copyWeak(&v17, &location);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[_UISheetDetent _detentWithContainerViewBlock:](_UISheetDetent, "_detentWithContainerViewBlock:", &v13));
    v20 = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v20, 1, v13, v14, v15, v16));
    -[MapsFormSheetPresentationController _setDetents:](v9, "_setDetents:", v11);

    -[MapsFormSheetPresentationController _setShouldDismissWhenTappedOutside:](v9, "_setShouldDismissWhenTappedOutside:", 0);
    -[MapsFormSheetPresentationController _setWidthFollowsPreferredContentSizeWhenBottomAttached:](v9, "_setWidthFollowsPreferredContentSizeWhenBottomAttached:", 1);
    -[MapsFormSheetPresentationController _setWantsBottomAttachedInCompactHeight:](v9, "_setWantsBottomAttachedInCompactHeight:", 1);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

  return v9;
}

- (int64_t)adaptivePresentationStyleForTraitCollection:(id)a3
{
  if (objc_msgSend(a3, "userInterfaceIdiom"))
    return 2;
  else
    return 4;
}

@end
