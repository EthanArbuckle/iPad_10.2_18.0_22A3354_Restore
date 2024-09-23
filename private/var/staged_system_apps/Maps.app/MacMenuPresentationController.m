@implementation MacMenuPresentationController

- (MacMenuPresentationController)initWithContaineeViewController:(id)a3
{
  id v4;
  MacMenuPresentationController *v5;
  GEOObserverHashTable *v6;
  GEOObserverHashTable *observers;
  UIPanGestureRecognizer *v8;
  UIPanGestureRecognizer *dismissPanGesture;
  UITapGestureRecognizer *v10;
  UITapGestureRecognizer *dismissTapGesture;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MacMenuPresentationController;
  v5 = -[MacMenuPresentationController init](&v13, "init");
  if (v5)
  {
    v6 = (GEOObserverHashTable *)objc_msgSend(objc_alloc((Class)GEOObserverHashTable), "initWithProtocol:queue:", &OBJC_PROTOCOL___MacMenuPresentationControllerObserver, 0);
    observers = v5->_observers;
    v5->_observers = v6;

    objc_storeWeak((id *)&v5->_containeeViewController, v4);
    v8 = (UIPanGestureRecognizer *)objc_msgSend(objc_alloc((Class)UIPanGestureRecognizer), "initWithTarget:action:", v5, "_dismissGestureFired:");
    dismissPanGesture = v5->_dismissPanGesture;
    v5->_dismissPanGesture = v8;

    -[UIPanGestureRecognizer setDelegate:](v5->_dismissPanGesture, "setDelegate:", v5);
    v10 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", v5, "_dismissGestureFired:");
    dismissTapGesture = v5->_dismissTapGesture;
    v5->_dismissTapGesture = v10;

    -[UITapGestureRecognizer setDelegate:](v5->_dismissTapGesture, "setDelegate:", v5);
  }

  return v5;
}

- (void)setPassThroughViews:(id)a3
{
  id v4;
  NSHashTable *v5;
  NSHashTable *passThroughViews;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v4 = a3;
  v5 = (NSHashTable *)objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](NSHashTable, "weakObjectsHashTable"));
  passThroughViews = self->_passThroughViews;
  self->_passThroughViews = v5;

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        -[NSHashTable addObject:](self->_passThroughViews, "addObject:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v11), (_QWORD)v12);
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (NSArray)passThroughViews
{
  return -[NSHashTable allObjects](self->_passThroughViews, "allObjects");
}

- (void)presentFromViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  UILayoutGuide *generatedWidthLayoutGuide;
  void *v34;
  UILayoutGuide *v35;
  void *v36;
  void *v37;
  UILayoutGuide *v38;
  UILayoutGuide *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  UILayoutGuide *v62;
  _QWORD v63[4];
  id v64;
  _QWORD v65[4];
  id v66;
  _QWORD v67[4];

  v6 = a4;
  v8 = a3;
  v9 = a5;
  if (!*(_WORD *)&self->_isPresented)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_containeeViewController);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "view"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "superview"));

    if (!v12)
    {
      v60 = (void *)objc_claimAutoreleasedReturnValue(-[MacMenuPresentationController anchorLayoutGuide](self, "anchorLayoutGuide"));
      v61 = objc_claimAutoreleasedReturnValue(-[MacMenuPresentationController widthLayoutGuide](self, "widthLayoutGuide"));
      self->_isPresented = 1;
      v13 = objc_loadWeakRetained((id *)&self->_containerViewController);
      v14 = objc_loadWeakRetained((id *)&self->_containeeViewController);
      objc_msgSend(v13, "addChildViewController:", v14);

      v15 = objc_loadWeakRetained((id *)&self->_containeeViewController);
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "view"));

      objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(v16, "setAlpha:", 0.0);
      v17 = objc_loadWeakRetained((id *)&self->_containerViewController);
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "view"));

      v59 = v18;
      v19 = v16;
      objc_msgSend(v18, "addSubview:", v16);
      v20 = objc_loadWeakRetained((id *)&self->_containeeViewController);
      v21 = objc_loadWeakRetained((id *)&self->_containerViewController);
      objc_msgSend(v20, "didMoveToParentViewController:", v21);

      v22 = (void *)objc_claimAutoreleasedReturnValue(-[UIPanGestureRecognizer view](self->_dismissPanGesture, "view"));
      v23 = objc_loadWeakRetained((id *)&self->_containerViewController);
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "view"));

      if (v22 != v24)
      {
        v25 = objc_loadWeakRetained((id *)&self->_containerViewController);
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "view"));
        objc_msgSend(v26, "addGestureRecognizer:", self->_dismissPanGesture);

      }
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[UITapGestureRecognizer view](self->_dismissTapGesture, "view"));
      v28 = objc_loadWeakRetained((id *)&self->_containerViewController);
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "view"));

      if (v27 != v29)
      {
        v30 = objc_loadWeakRetained((id *)&self->_containerViewController);
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "view"));
        objc_msgSend(v31, "addGestureRecognizer:", self->_dismissTapGesture);

      }
      v32 = objc_alloc_init((Class)NSMutableArray);
      generatedWidthLayoutGuide = self->_generatedWidthLayoutGuide;
      v34 = v19;
      v35 = (UILayoutGuide *)v61;
      if (v61)
      {
        v36 = v59;
        if (generatedWidthLayoutGuide)
        {
          v37 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide owningView](generatedWidthLayoutGuide, "owningView"));

          if (v37 == v59)
            objc_msgSend(v59, "removeLayoutGuide:", self->_generatedWidthLayoutGuide);
        }
      }
      else
      {
        v36 = v59;
        if (!generatedWidthLayoutGuide)
        {
          v38 = (UILayoutGuide *)objc_alloc_init((Class)UILayoutGuide);
          v39 = self->_generatedWidthLayoutGuide;
          self->_generatedWidthLayoutGuide = v38;

          generatedWidthLayoutGuide = self->_generatedWidthLayoutGuide;
        }
        v40 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide owningView](generatedWidthLayoutGuide, "owningView"));

        if (v40 != v59)
        {
          objc_msgSend(v59, "addLayoutGuide:", self->_generatedWidthLayoutGuide);
          v41 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide widthAnchor](self->_generatedWidthLayoutGuide, "widthAnchor"));
          v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToConstant:", 282.0));
          objc_msgSend(v32, "addObject:", v42);

        }
        v35 = self->_generatedWidthLayoutGuide;
      }
      v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "widthAnchor"));
      v62 = v35;
      v56 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide widthAnchor](v35, "widthAnchor"));
      v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "constraintEqualToAnchor:", v56));
      v67[0] = v55;
      v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "centerXAnchor"));
      v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "centerXAnchor"));
      v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "constraintEqualToAnchor:", v53));
      v67[1] = v52;
      v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "topAnchor"));
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "bottomAnchor"));
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "constraintEqualToAnchor:", v43));
      v67[2] = v44;
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "heightAnchor"));
      v58 = v34;
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "heightAnchor"));
      v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "constraintLessThanOrEqualToAnchor:constant:", v46, -150.0));
      v67[3] = v47;
      v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v67, 4));
      objc_msgSend(v32, "addObjectsFromArray:", v48);

      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v32);
      v65[0] = _NSConcreteStackBlock;
      v65[1] = 3221225472;
      v65[2] = sub_100373238;
      v65[3] = &unk_1011AC860;
      v66 = v59;
      v49 = v59;
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v65);
      if (v6)
      {
        v63[0] = _NSConcreteStackBlock;
        v63[1] = 3221225472;
        v63[2] = sub_100373240;
        v63[3] = &unk_1011AC860;
        v64 = v58;
        +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v63, 0, 0.1);

        v50 = v58;
      }
      else
      {
        v50 = v58;
        objc_msgSend(v58, "setAlpha:", 1.0);
      }

    }
  }

}

- (void)dismissAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL4 v4;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id location;

  v4 = a3;
  v6 = a4;
  if (self->_isPresented)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "view"));
    v9 = objc_loadWeakRetained((id *)&self->_containeeViewController);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "view"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "superview"));

    if (v8 == v11)
    {
      v12 = objc_loadWeakRetained((id *)&self->_containeeViewController);
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "view"));

      v14 = objc_loadWeakRetained((id *)&self->_containeeViewController);
      v15 = objc_loadWeakRetained((id *)&self->_containerViewController);
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "view"));
      objc_msgSend(v16, "removeGestureRecognizer:", self->_dismissTapGesture);

      v17 = objc_loadWeakRetained((id *)&self->_containerViewController);
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "view"));
      objc_msgSend(v18, "removeGestureRecognizer:", self->_dismissPanGesture);

      -[MacMenuPresentationController _willDismiss](self, "_willDismiss");
      objc_msgSend(v14, "willMoveToParentViewController:", 0);
      if (v4)
      {
        objc_initWeak(&location, self);
        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472;
        v24[2] = sub_1003734B0;
        v24[3] = &unk_1011AC860;
        v25 = v13;
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472;
        v19[2] = sub_1003734BC;
        v19[3] = &unk_1011B2FF8;
        v20 = v25;
        v21 = v14;
        objc_copyWeak(&v23, &location);
        v22 = v6;
        +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v24, v19, 0.1);

        objc_destroyWeak(&v23);
        objc_destroyWeak(&location);
      }
      else
      {
        objc_msgSend(v13, "removeFromSuperview");
        objc_msgSend(v14, "removeFromParentViewController");
      }

    }
  }

}

- (void)_willDismiss
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MacMenuPresentationController observers](self, "observers"));
  objc_msgSend(v3, "macMenuPresentationControllerWillDismiss:", self);

  *(_WORD *)&self->_isPresented = 256;
}

- (void)_didDismiss
{
  id v3;

  self->_isDismissing = 0;
  v3 = (id)objc_claimAutoreleasedReturnValue(-[MacMenuPresentationController observers](self, "observers"));
  objc_msgSend(v3, "macMenuPresentationControllerDidDismiss:", self);

}

- (void)_dismissGestureFired:(id)a3
{
  UIPanGestureRecognizer *v4;
  BOOL v5;
  UIPanGestureRecognizer *v6;

  v4 = (UIPanGestureRecognizer *)a3;
  if (self->_dismissPanGesture == v4)
  {
    v6 = v4;
    v5 = -[UIPanGestureRecognizer state](v4, "state") == (id)1;
    v4 = v6;
    if (v5)
    {
      -[MacMenuPresentationController dismissAnimated:completion:](self, "dismissAnimated:completion:", 1, 0);
      -[UIPanGestureRecognizer setEnabled:](v6, "setEnabled:", 0);
      -[UIPanGestureRecognizer setEnabled:](v6, "setEnabled:", 1);
LABEL_7:
      v4 = v6;
      goto LABEL_8;
    }
  }
  if ((UIPanGestureRecognizer *)self->_dismissTapGesture == v4)
  {
    v6 = v4;
    -[MacMenuPresentationController dismissAnimated:completion:](self, "dismissAnimated:completion:", 1, 0);
    goto LABEL_7;
  }
LABEL_8:

}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  void *v5;
  id WeakRetained;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  unsigned __int8 v11;
  NSHashTable *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  BOOL v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "view", a3));
  WeakRetained = objc_loadWeakRetained((id *)&self->_containeeViewController);
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "view"));
  if (v5 == (void *)v7)
  {

    goto LABEL_14;
  }
  v8 = (void *)v7;
  v9 = objc_loadWeakRetained((id *)&self->_containeeViewController);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "view"));
  v11 = objc_msgSend(v5, "isDescendantOfView:", v10);

  if ((v11 & 1) != 0)
  {
LABEL_14:
    v17 = 0;
    goto LABEL_18;
  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v12 = self->_passThroughViews;
  v13 = -[NSHashTable countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v12);
        if (v5 == *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i)
          || (objc_msgSend(v5, "isDescendantOfView:", (_QWORD)v19) & 1) != 0)
        {
          v17 = 0;
          goto LABEL_17;
        }
      }
      v14 = -[NSHashTable countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      v17 = 1;
      if (v14)
        continue;
      break;
    }
  }
  else
  {
    v17 = 1;
  }
LABEL_17:

LABEL_18:
  return v17;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6;
  UIPanGestureRecognizer *v7;
  UITapGestureRecognizer *dismissTapGesture;
  UIPanGestureRecognizer *dismissPanGesture;
  BOOL v10;
  BOOL v11;

  v6 = a3;
  v7 = (UIPanGestureRecognizer *)a4;
  dismissTapGesture = self->_dismissTapGesture;
  dismissPanGesture = self->_dismissPanGesture;
  if (dismissTapGesture != v6 || (v10 = dismissPanGesture == v7, dismissPanGesture = v7, v10))
  {
    v10 = dismissTapGesture != (UITapGestureRecognizer *)v7 && dismissPanGesture == v6;
    v11 = v10;
  }
  else
  {
    v11 = 1;
  }

  return v11;
}

- (void)addObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[MacMenuPresentationController observers](self, "observers"));
  objc_msgSend(v5, "registerObserver:", v4);

}

- (void)removeObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[MacMenuPresentationController observers](self, "observers"));
  objc_msgSend(v5, "unregisterObserver:", v4);

}

- (ContaineeViewController)containeeViewController
{
  return (ContaineeViewController *)objc_loadWeakRetained((id *)&self->_containeeViewController);
}

- (UIViewController)containerViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_containerViewController);
}

- (void)setContainerViewController:(id)a3
{
  objc_storeWeak((id *)&self->_containerViewController, a3);
}

- (UILayoutGuide)anchorLayoutGuide
{
  return self->_anchorLayoutGuide;
}

- (void)setAnchorLayoutGuide:(id)a3
{
  objc_storeStrong((id *)&self->_anchorLayoutGuide, a3);
}

- (UILayoutGuide)widthLayoutGuide
{
  return self->_widthLayoutGuide;
}

- (void)setWidthLayoutGuide:(id)a3
{
  objc_storeStrong((id *)&self->_widthLayoutGuide, a3);
}

- (BOOL)isPresented
{
  return self->_isPresented;
}

- (BOOL)isDismissing
{
  return self->_isDismissing;
}

- (GEOObserverHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_widthLayoutGuide, 0);
  objc_storeStrong((id *)&self->_anchorLayoutGuide, 0);
  objc_destroyWeak((id *)&self->_containerViewController);
  objc_destroyWeak((id *)&self->_containeeViewController);
  objc_storeStrong((id *)&self->_dismissPanGesture, 0);
  objc_storeStrong((id *)&self->_dismissTapGesture, 0);
  objc_storeStrong((id *)&self->_passThroughViews, 0);
  objc_storeStrong((id *)&self->_generatedWidthLayoutGuide, 0);
}

@end
