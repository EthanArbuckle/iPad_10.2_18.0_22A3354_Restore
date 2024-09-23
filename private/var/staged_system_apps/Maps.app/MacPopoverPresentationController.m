@implementation MacPopoverPresentationController

- (MacPopoverPresentationController)initWithContaineeViewController:(id)a3
{
  id v4;
  MacPopoverPresentationController *v5;
  MacPopoverPresentationController *v6;
  id v7;
  CGSize size;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MacPopoverPresentationController;
  v5 = -[MacPopoverPresentationController init](&v10, "init");
  v6 = v5;
  if (v5)
  {
    v7 = objc_storeWeak((id *)&v5->_containeeViewController, v4);
    objc_msgSend(v4, "setModalPresentationStyle:", 7);

    v6->_coordinate = kCLLocationCoordinate2DInvalid;
    size = CGRectZero.size;
    v6->_anchorRect.origin = CGRectZero.origin;
    v6->_anchorRect.size = size;
  }

  return v6;
}

- (void)setPreferredContentSize:(CGSize)a3
{
  double height;
  double width;
  ContaineeViewController **p_containeeViewController;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;

  height = a3.height;
  width = a3.width;
  if (a3.width != self->_preferredContentSize.width || a3.height != self->_preferredContentSize.height)
  {
    self->_preferredContentSize = a3;
    p_containeeViewController = &self->_containeeViewController;
    WeakRetained = objc_loadWeakRetained((id *)&self->_containeeViewController);
    objc_msgSend(WeakRetained, "setPreferredContentSize:", width, height);

    v10 = objc_loadWeakRetained((id *)p_containeeViewController);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "popoverPresentationController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "presentedViewController"));
    objc_msgSend(v9, "setPreferredContentSize:", width, height);

  }
}

- (NSArray)passthroughViews
{
  id WeakRetained;
  void *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_containeeViewController);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "popoverPresentationController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "passthroughViews"));

  return (NSArray *)v4;
}

- (void)setPassthroughViews:(id)a3
{
  ContaineeViewController **p_containeeViewController;
  id v4;
  void *v5;
  id WeakRetained;

  p_containeeViewController = &self->_containeeViewController;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_containeeViewController);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "popoverPresentationController"));
  objc_msgSend(v5, "setPassthroughViews:", v4);

}

- (void)presentFromContainerViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id WeakRetained;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id obj;

  v6 = a4;
  obj = a3;
  v8 = a5;
  if (!*(_WORD *)&self->_isPresented)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_containeeViewController);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "presentingViewController"));

    if (!v10
      && CLLocationCoordinate2DIsValid(self->_coordinate)
      && -[MacPopoverPresentationController _isCoordinateVisibleInContainerViewController:](self, "_isCoordinateVisibleInContainerViewController:", obj))
    {
      self->_isPresented = 1;
      objc_storeWeak((id *)&self->_containerViewController, obj);
      v11 = objc_loadWeakRetained((id *)&self->_containeeViewController);
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "popoverPresentationController"));
      objc_msgSend(v12, "setDelegate:", self);

      -[MacPopoverPresentationController configurePopoverPosition](self, "configurePopoverPosition");
      -[MacPopoverPresentationController configurePopoverSize](self, "configurePopoverSize");
      v13 = objc_loadWeakRetained((id *)&self->_containerViewController);
      v14 = objc_loadWeakRetained((id *)&self->_containeeViewController);
      objc_msgSend(v13, "_maps_topMostPresentViewController:animated:completion:", v14, v6, v8);

      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v15, "postNotificationName:object:", CFSTR("MacPopoverPresentationControllerDidPresentPopover"), self);

    }
  }

}

- (void)dismissAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  id WeakRetained;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v4 = a3;
  v6 = a4;
  if (self->_isPresented)
  {
    objc_initWeak(&location, self);
    -[MacPopoverPresentationController _willDismiss](self, "_willDismiss");
    WeakRetained = objc_loadWeakRetained((id *)&self->_containeeViewController);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "presentingViewController"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10052B664;
    v9[3] = &unk_1011B0520;
    objc_copyWeak(&v11, &location);
    v10 = v6;
    objc_msgSend(v8, "dismissViewControllerAnimated:completion:", v4, v9);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }

}

- (void)_willDismiss
{
  MacPopoverPresentationControllerDelegate **p_delegate;
  id WeakRetained;
  char v5;
  id v6;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector(WeakRetained, "macPopoverPresentationControllerWillDismiss:");

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v6, "macPopoverPresentationControllerWillDismiss:", self);

  }
  *(_WORD *)&self->_isPresented = 256;
}

- (void)_didDismiss
{
  id WeakRetained;
  char v4;
  id v5;

  self->_isDismissing = 0;
  objc_storeWeak((id *)&self->_containerViewController, 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = objc_opt_respondsToSelector(WeakRetained, "macPopoverPresentationControllerDidDismiss:");

  if ((v4 & 1) != 0)
  {
    v5 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v5, "macPopoverPresentationControllerDidDismiss:", self);

  }
}

- (BOOL)_isCoordinateVisibleInContainerViewController:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  MKMapPoint v15;
  MKMapRect v16;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "chromeViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mapView"));
  objc_msgSend(v5, "visibleMapRect");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = MKMapPointForCoordinate(self->_coordinate);
  v16.origin.x = v7;
  v16.origin.y = v9;
  v16.size.width = v11;
  v16.size.height = v13;
  LOBYTE(self) = MKMapRectContainsPoint(v16, v15);

  return (char)self;
}

- (void)configurePopoverPosition
{
  CGFloat y;
  CGFloat width;
  CGFloat height;
  _BOOL4 v6;
  _BOOL4 v7;
  id WeakRetained;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double x;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;
  void *v20;
  void *v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double top;
  double MinX;
  double v37;
  CGFloat v38;
  CGFloat v39;
  double v40;
  double MidX;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  uint64_t v48;
  CGFloat v49;
  CGFloat v50;
  CGFloat v51;
  CGFloat right;
  CGFloat left;
  CGFloat v54;
  CGFloat v55;
  CGFloat v56;
  CGFloat v57;
  double v58;
  double v59;
  double v60;
  double bottom;
  double v62;
  id v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;

  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v74.origin.x = CGRectZero.origin.x;
  v74.origin.y = y;
  v74.size.width = width;
  v74.size.height = height;
  v6 = CGRectEqualToRect(self->_anchorRect, v74);
  v7 = CLLocationCoordinate2DIsValid(self->_coordinate);
  if (!v6 || v7)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
    v63 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "chromeViewController"));

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "view"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "mapView"));
    v12 = v11;
    v56 = width;
    v57 = y;
    if (v6)
    {
      objc_msgSend(v11, "convertCoordinate:toPointToView:", v11, self->_coordinate.latitude, self->_coordinate.longitude);
      x = v13 + -30.0;
      v16 = v15 + -60.0 + -6.0 + -6.0 + -2.0;
      v17 = 60.0;
      v18 = 60.0;
    }
    else
    {
      x = self->_anchorRect.origin.x;
      v16 = self->_anchorRect.origin.y;
      v18 = self->_anchorRect.size.width;
      v17 = self->_anchorRect.size.height;
    }
    v19 = objc_loadWeakRetained((id *)&self->_containeeViewController);
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "popoverPresentationController"));

    objc_msgSend(v20, "setSourceView:", v10);
    v60 = v16;
    v58 = v18;
    v59 = v17;
    objc_msgSend(v20, "setSourceRect:", x, v16, v18, v17);
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "viewportLayoutGuide"));
    objc_msgSend(v21, "layoutFrame");
    v23 = v22;
    v25 = v24;
    v27 = v26;
    v29 = v28;
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "owningView"));
    objc_msgSend(v30, "bounds");
    v50 = v32;
    v51 = v31;
    v54 = v34;
    v55 = v33;
    left = UIEdgeInsetsZero.left;
    bottom = UIEdgeInsetsZero.bottom;
    right = UIEdgeInsetsZero.right;
    v64.origin.x = v23;
    v64.origin.y = v25;
    v64.size.width = v27;
    v64.size.height = v29;
    v75.origin.x = CGRectZero.origin.x;
    v75.origin.y = v57;
    v75.size.width = v56;
    v75.size.height = height;
    if (CGRectEqualToRect(v64, v75))
    {
      MinX = left;
      top = UIEdgeInsetsZero.top;
      v37 = right;
    }
    else
    {
      v49 = v29;
      v38 = v23;
      v65.origin.y = v50;
      v65.origin.x = v51;
      v65.size.height = v54;
      v65.size.width = v55;
      v76.origin.x = CGRectZero.origin.x;
      v76.origin.y = v57;
      v76.size.width = v56;
      v76.size.height = height;
      MinX = left;
      top = UIEdgeInsetsZero.top;
      v37 = right;
      if (!CGRectEqualToRect(v65, v76))
      {
        v39 = v38;
        v66.origin.x = v38;
        v66.origin.y = v25;
        v66.size.width = v27;
        v66.size.height = v49;
        top = CGRectGetMinY(v66);
        v67.origin.x = v38;
        v67.origin.y = v25;
        v67.size.width = v27;
        v67.size.height = v49;
        MinX = CGRectGetMinX(v67);
        v68.origin.x = v51;
        v68.origin.y = v50;
        v68.size.height = v54;
        v68.size.width = v55;
        v62 = CGRectGetHeight(v68);
        v69.origin.x = v38;
        v69.origin.y = v25;
        v69.size.width = v27;
        v69.size.height = v49;
        bottom = v62 - CGRectGetMaxY(v69);
        v70.origin.x = v51;
        v70.origin.y = v50;
        v70.size.height = v54;
        v70.size.width = v55;
        v40 = CGRectGetWidth(v70);
        v71.origin.x = v39;
        v71.origin.y = v25;
        v71.size.width = v27;
        v71.size.height = v49;
        v37 = v40 - CGRectGetMaxX(v71);
      }
    }

    objc_msgSend(v10, "convertRect:toView:", v12, x, v60, v58, v59);
    MidX = CGRectGetMidX(v72);
    objc_msgSend(v12, "bounds");
    v73.origin.x = MinX + v42;
    v73.origin.y = top + v43;
    v73.size.width = v44 - (v37 + MinX);
    v73.size.height = v45 - (bottom + top);
    v46 = CGRectGetMidX(v73);
    v47 = UIFloorToViewScale(v10, MidX);
    if (v47 > UIFloorToViewScale(v10, v46))
      v48 = 8;
    else
      v48 = 4;
    objc_msgSend(v20, "setPermittedArrowDirections:", v48, *(_QWORD *)&v49);

  }
}

- (void)configurePopoverSize
{
  ContaineeViewController **p_containeeViewController;
  id WeakRetained;
  double v5;
  double v6;
  id v7;
  double v8;
  double v9;
  id v10;
  double v11;
  double v12;
  id v14;
  double v15;
  double v16;
  double v17;
  double v18;

  p_containeeViewController = &self->_containeeViewController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_containeeViewController);
  objc_msgSend(WeakRetained, "macContaineeWidth");
  v6 = v5;
  v7 = objc_loadWeakRetained((id *)p_containeeViewController);
  objc_msgSend(v7, "heightForLayout:", 2);
  v9 = v8;

  v10 = objc_loadWeakRetained((id *)p_containeeViewController);
  objc_msgSend(v10, "preferredContentSize");
  if (v12 == CGSizeZero.width && v11 == CGSizeZero.height)
  {

LABEL_9:
    -[MacPopoverPresentationController setPreferredContentSize:](self, "setPreferredContentSize:", v6, v9);
    return;
  }
  v14 = objc_loadWeakRetained((id *)&self->_containerViewController);
  objc_msgSend(v14, "preferredContentSize");
  v16 = v15;
  v18 = v17;

  if (v16 != v6 || v18 != v9)
    goto LABEL_9;
}

- (ContaineeViewController)containeeViewController
{
  return (ContaineeViewController *)objc_loadWeakRetained((id *)&self->_containeeViewController);
}

- (ContainerViewController)containerViewController
{
  return (ContainerViewController *)objc_loadWeakRetained((id *)&self->_containerViewController);
}

- (MacPopoverPresentationControllerDelegate)delegate
{
  return (MacPopoverPresentationControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CLLocationCoordinate2D)coordinate
{
  double latitude;
  double longitude;
  CLLocationCoordinate2D result;

  latitude = self->_coordinate.latitude;
  longitude = self->_coordinate.longitude;
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

- (void)setCoordinate:(CLLocationCoordinate2D)a3
{
  self->_coordinate = a3;
}

- (CGRect)anchorRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_anchorRect.origin.x;
  y = self->_anchorRect.origin.y;
  width = self->_anchorRect.size.width;
  height = self->_anchorRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setAnchorRect:(CGRect)a3
{
  self->_anchorRect = a3;
}

- (CGSize)preferredContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_preferredContentSize.width;
  height = self->_preferredContentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)isPresented
{
  return self->_isPresented;
}

- (BOOL)isDismissing
{
  return self->_isDismissing;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_containerViewController);
  objc_destroyWeak((id *)&self->_containeeViewController);
}

@end
