@implementation ContainerTransitionManager

- (ContainerTransitionManager)initWithContainer:(id)a3
{
  id v4;
  ContainerTransitionManager *v5;
  uint64_t v6;
  NSMapTable *layoutCardsInfo;
  uint64_t v8;
  NSMutableArray *waitingTransitions;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ContainerTransitionManager;
  v5 = -[ContainerTransitionManager init](&v11, "init");
  if (v5)
  {
    if ((-[ContainerViewController delaysFirstCardPresentation]_0() & 1) == 0)
    {
      v6 = objc_claimAutoreleasedReturnValue(+[NSMapTable strongToStrongObjectsMapTable](NSMapTable, "strongToStrongObjectsMapTable"));
      layoutCardsInfo = v5->_layoutCardsInfo;
      v5->_layoutCardsInfo = (NSMapTable *)v6;

    }
    v5->_containerReadyToInsert = 0;
    v8 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    waitingTransitions = v5->_waitingTransitions;
    v5->_waitingTransitions = (NSMutableArray *)v8;

    objc_storeWeak((id *)&v5->_containerViewController, v4);
  }

  return v5;
}

- (void)setContainerReadyToInsert:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  NSObject *v6;
  id WeakRetained;
  __CFString *v8;
  __CFString *v9;
  int v10;
  ContainerTransitionManager *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  __CFString *v15;

  v3 = a3;
  v5 = sub_10043165C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
    v8 = CFSTR("NO");
    if (v3)
      v8 = CFSTR("YES");
    v9 = v8;
    v10 = 138412802;
    v11 = self;
    v12 = 2112;
    v13 = WeakRetained;
    v14 = 2112;
    v15 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%@ for %@ setContainerReadyToInsert: %@", (uint8_t *)&v10, 0x20u);

  }
  self->_containerReadyToInsert = v3;
}

- (ContaineeProtocol)currentOrPendingViewController
{
  void *v3;
  void *v4;
  void *v5;
  id WeakRetained;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_waitingTransitions, "lastObject"));
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "viewController"));
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "currentViewController"));

  }
  return (ContaineeProtocol *)v5;
}

- (NSArray)visibleViewControllers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  _QWORD v11[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerTransitionManager _currentCardContaineeController](self, "_currentCardContaineeController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_layoutCardsInfo, "objectForKey:", v3));
  v5 = v4;
  if (v3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "modalPresenter"));

    if (v6)
    {
      v11[0] = v3;
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "modalPresenter"));
      v11[1] = v7;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v11, 2));

    }
    else
    {
      v10 = v3;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));
    }
  }
  else
  {
    v8 = 0;
  }

  return (NSArray *)v8;
}

- (BOOL)dequeueWaitingContainees
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id WeakRetained;
  void *v9;
  id v10;
  void *v11;
  id v13;
  id v14;

  if (!self->_containerReadyToInsert)
    return 0;
  if (-[NSMutableArray count](self->_waitingTransitions, "count"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_waitingTransitions, "objectAtIndexedSubscript:", 0));
    -[NSMutableArray removeObjectAtIndex:](self->_waitingTransitions, "removeObjectAtIndex:", 0);
    if (objc_msgSend(v3, "switchContext")
      && (v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "oldViewController"))) != 0
      && (v5 = (void *)v4,
          v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "oldViewController")),
          v7 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerTransitionManager _currentCardContaineeController](self, "_currentCardContaineeController")), v7, v6, v5, v6 == v7))
    {
      WeakRetained = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "viewController"));
      v13 = objc_msgSend(v3, "isAlreadyInStack");
      v14 = objc_msgSend(v3, "layout");
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "postProcess"));
      -[ContainerTransitionManager replaceCurrentWithViewController:isAlreadyInStack:layout:animated:postprocess:](self, "replaceCurrentWithViewController:isAlreadyInStack:layout:animated:postprocess:", WeakRetained, v13, v14, 1, v9);
    }
    else
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "viewController"));
      v10 = objc_msgSend(v3, "animated");
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "completion"));
      objc_msgSend(WeakRetained, "presentController:animated:completion:", v9, v10, v11);

    }
    return 0;
  }
  return 1;
}

- (BOOL)hasWaitingTransitionForViewController:(id)a3
{
  id v4;
  NSMutableArray *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  id v10;
  unsigned __int8 v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_waitingTransitions;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "viewController", (_QWORD)v13));
        if (v10 == v4)
        {
          v11 = objc_msgSend(v9, "isAlreadyInStack");

          if ((v11 & 1) == 0)
          {
            LOBYTE(v6) = 1;
            goto LABEL_13;
          }
        }
        else
        {

        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_13:

  return (char)v6;
}

- (void)setupTransitionForViewController:(id)a3
{
  id v4;
  uint64_t v5;
  ContainerViewController **p_containerViewController;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  BOOL v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  ContainerTransitionManager *v41;
  void *v42;
  void *v43;
  _QWORD v44[2];

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[ContainerTransitionManager _currentCardContaineeController](self, "_currentCardContaineeController"));
  p_containerViewController = &self->_containerViewController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "cardForViewController:", v5));

  v41 = self;
  v43 = (void *)v5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_layoutCardsInfo, "objectForKey:", v5));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "modalPresenter"));
  if (v10)
  {
    v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "modalPresenter"));
    v12 = v11 == v4;

  }
  else
  {
    v12 = 0;
  }
  v42 = v9;

  v13 = objc_loadWeakRetained((id *)p_containerViewController);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "containerView"));

  v15 = objc_loadWeakRetained((id *)p_containerViewController);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "cardForViewController:", v4));

  objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v16, "setUserInteractionEnabled:", 0);
  v17 = objc_loadWeakRetained((id *)p_containerViewController);
  objc_msgSend(v17, "addChildViewController:", v4);

  v18 = v8;
  v38 = v18;
  if (!v18)
  {
    v19 = objc_loadWeakRetained((id *)p_containerViewController);
    v18 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "containerView"));

  }
  v20 = objc_loadWeakRetained((id *)p_containerViewController);
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "view"));
  v37 = v18;
  objc_msgSend(v21, "insertSubview:aboveSubview:", v16, v18);

  if (!v12)
  {
    v22 = objc_loadWeakRetained((id *)p_containerViewController);
    objc_msgSend(v4, "willChangeContainerStyle:", objc_msgSend(v22, "containerStyle"));

  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "leadingAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "leadingAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:", v24));
  v44[0] = v25;
  v39 = v16;
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "trailingAnchor"));
  v40 = v14;
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "trailingAnchor"));
  v28 = v4;
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v27));
  v44[1] = v29;
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v44, 2));
  v31 = objc_msgSend(v30, "mutableCopy");

  -[ContainerTransitionManager _setupConstraintsForViewController:](v41, "_setupConstraintsForViewController:", v28);
  v32 = objc_loadWeakRetained((id *)p_containerViewController);
  objc_msgSend(v32, "setCurrentViewController:", v28);

  v33 = objc_loadWeakRetained((id *)p_containerViewController);
  v34 = objc_msgSend(v33, "containerStyle");

  if (v34 != (id)6)
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "topToTopContentConstraint"));
    LODWORD(v36) = 1148813312;
    objc_msgSend(v35, "setPriority:", v36);

  }
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v31);

}

- (void)_addTheModalPresenter
{
  void *v3;
  void *v4;
  void *v5;
  id WeakRetained;
  void *v7;
  id v8;
  id v9;
  void *v10;
  __int128 v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  ContainerTransitionManager *v24;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _OWORD v33[3];
  _QWORD v34[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerTransitionManager _currentCardContaineeController](self, "_currentCardContaineeController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_layoutCardsInfo, "objectForKey:", v3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "modalPresenter"));
  if (v5)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_layoutCardsInfo, "objectForKey:", v5));
    WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "containerView"));

    v8 = objc_loadWeakRetained((id *)&self->_containerViewController);
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "cardForViewController:", v3));

    v9 = objc_loadWeakRetained((id *)&self->_containerViewController);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "cardForViewController:", v5));

    objc_msgSend(v10, "setAlpha:", 1.0);
    v11 = *(_OWORD *)&CGAffineTransformIdentity.c;
    v33[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
    v33[1] = v11;
    v33[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
    objc_msgSend(v10, "setTransform:", v33);
    v12 = objc_loadWeakRetained((id *)&self->_containerViewController);
    objc_msgSend(v10, "setLayoutStyle:", objc_msgSend(v12, "containerStyle"));

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cardPresentationController"));
    objc_msgSend(v13, "updateHeightForLayout:", objc_msgSend(v31, "backgroundLayout"));

    v14 = objc_loadWeakRetained((id *)&self->_containerViewController);
    objc_msgSend(v14, "addChildViewController:", v5);

    v15 = objc_loadWeakRetained((id *)&self->_containerViewController);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "view"));
    objc_msgSend(v16, "insertSubview:belowSubview:", v10, v30);

    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "leadingAnchor"));
    v29 = v7;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "leadingAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:", v17));
    v34[0] = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "trailingAnchor"));
    v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "trailingAnchor"));
    v21 = v4;
    v22 = (void *)v20;
    v32 = v3;
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v20));
    v34[1] = v23;
    v24 = self;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v34, 2));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v25);

    v4 = v21;
    -[ContainerTransitionManager _setupConstraintsForViewController:](v24, "_setupConstraintsForViewController:", v5);
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "topToTopContentConstraint"));
    LODWORD(v27) = 1148813312;
    objc_msgSend(v26, "setPriority:", v27);

    v3 = v32;
  }

}

- (void)_setupConstraintsForViewController:(id)a3
{
  ContainerViewController **p_containerViewController;
  id v5;
  id WeakRetained;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[2];
  _QWORD v33[2];

  p_containerViewController = &self->_containerViewController;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_containerViewController);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "containerView"));

  v8 = objc_loadWeakRetained((id *)p_containerViewController);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "cardForViewController:", v5));

  v10 = objc_loadWeakRetained((id *)p_containerViewController);
  objc_msgSend(v9, "setLayoutStyle:", objc_msgSend(v10, "containerStyle"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_layoutCardsInfo, "objectForKey:", v5));
  if (v9)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "superview"));
    if (!v12 || !v7)
    {
LABEL_12:

      goto LABEL_13;
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "window"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "window"));

    if (v13 == v14 && v11)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "topToTopContentConstraint"));

      if (v15)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "topToTopContentConstraint"));
        v33[0] = v16;
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bottomToBottomContentConstraint"));
        v33[1] = v17;
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v33, 2));
        +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v18);

      }
      v19 = objc_loadWeakRetained((id *)p_containerViewController);
      v20 = objc_msgSend(v19, "containerStyle");

      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "topAnchor"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "topAnchor"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v22));
      objc_msgSend(v11, "setTopToTopContentConstraint:", v23);

      if (v20 == (id)6)
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bottomAnchor"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bottomAnchor"));
        v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintLessThanOrEqualToAnchor:", v25));
      }
      else
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "topToTopContentConstraint"));
        LODWORD(v28) = 1148829696;
        objc_msgSend(v27, "setPriority:", v28);

        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bottomAnchor"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bottomAnchor"));
        v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:", v25));
      }
      v29 = (void *)v26;
      objc_msgSend(v11, "setBottomToBottomContentConstraint:", v26);

      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "topToTopContentConstraint"));
      v32[0] = v12;
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bottomToBottomContentConstraint"));
      v32[1] = v30;
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v32, 2));
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v31);

      goto LABEL_12;
    }
  }
LABEL_13:

}

- (void)styleDidChange
{
  void *v3;
  void *v4;
  id v5;

  if ((-[ContainerViewController delaysFirstCardPresentation]_0() & 1) == 0)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[ContainerTransitionManager _currentCardContaineeController](self, "_currentCardContaineeController"));
    -[ContainerTransitionManager _setupConstraintsForViewController:](self, "_setupConstraintsForViewController:", v5);
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_layoutCardsInfo, "objectForKey:", v5));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "modalPresenter"));
    if (v4)
      -[ContainerTransitionManager _setupConstraintsForViewController:](self, "_setupConstraintsForViewController:", v4);

  }
}

- (id)_currentCardContaineeController
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "currentViewControllerWithPresentationStyle:", 0));

  return v3;
}

- (void)replaceCurrentWithViewController:(id)a3 isAlreadyInStack:(BOOL)a4 layout:(unint64_t)a5 animated:(BOOL)a6 postprocess:(id)a7
{
  _BOOL8 v8;
  _BOOL8 v10;
  id v12;
  WaitingTransition *v13;
  void *v14;
  id WeakRetained;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;

  v8 = a6;
  v10 = a4;
  v24 = a3;
  v12 = a7;
  if (!self->_containerReadyToInsert || self->_viewcontrollerTransitioning)
    goto LABEL_3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "viewIfLoaded"));
  if (v16)
  {
    v17 = (void *)v16;
    if (!-[ContainerViewController delaysFirstCardPresentation]_0())
    {

LABEL_11:
      self->_viewcontrollerTransitioning = 1;
      v13 = (WaitingTransition *)objc_claimAutoreleasedReturnValue(-[ContainerTransitionManager _currentCardContaineeController](self, "_currentCardContaineeController"));
      v20 = objc_loadWeakRetained((id *)&self->_containerViewController);
      objc_msgSend(v20, "willResignContainee:animated:", v13, v8);

      -[WaitingTransition willResignCurrent:](v13, "willResignCurrent:", v8);
      v21 = objc_loadWeakRetained((id *)&self->_containerViewController);
      objc_msgSend(v21, "willPresentContainee:animated:", v24, v8);

      objc_msgSend(v24, "willBecomeCurrent:", v8);
      -[ContainerTransitionManager presentViewController:layout:transition:animated:postprocess:completion:](self, "presentViewController:layout:transition:animated:postprocess:completion:", v24, a5, 4, v8, v12, 0);
      v22 = objc_loadWeakRetained((id *)&self->_containerViewController);
      objc_msgSend(v22, "transitionAlongsideContainee:animated:", v24, v8);

      goto LABEL_4;
    }
    v23 = objc_loadWeakRetained((id *)&self->_containerViewController);
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "topMostPresentedViewController"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "transitionCoordinator"));

    if (!v19)
      goto LABEL_11;
  }
  else
  {

  }
LABEL_3:
  v13 = objc_alloc_init(WaitingTransition);
  -[WaitingTransition setViewController:](v13, "setViewController:", v24);
  -[WaitingTransition setAnimated:](v13, "setAnimated:", v8);
  -[WaitingTransition setSwitchContext:](v13, "setSwitchContext:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerTransitionManager _currentCardContaineeController](self, "_currentCardContaineeController"));
  -[WaitingTransition setOldViewController:](v13, "setOldViewController:", v14);

  -[WaitingTransition setLayout:](v13, "setLayout:", a5);
  -[WaitingTransition setPostProcess:](v13, "setPostProcess:", v12);
  -[WaitingTransition setIsAlreadyInStack:](v13, "setIsAlreadyInStack:", v10);
  -[NSMutableArray addObject:](self->_waitingTransitions, "addObject:", v13);
LABEL_4:

}

- (void)presentViewController:(id)a3 isAlreadyInStack:(BOOL)a4 layout:(unint64_t)a5 animated:(BOOL)a6 preprocess:(id)a7 postprocess:(id)a8 completion:(id)a9
{
  _BOOL8 v11;
  _BOOL8 v13;
  void (**v15)(_QWORD);
  id v16;
  id v17;
  WaitingTransition *v18;
  id WeakRetained;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id *location;
  unint64_t v31;
  id v32;

  v11 = a6;
  v13 = a4;
  v32 = a3;
  v15 = (void (**)(_QWORD))a7;
  v16 = a8;
  v17 = a9;
  if (!self->_containerReadyToInsert || self->_viewcontrollerTransitioning)
    goto LABEL_3;
  v31 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "viewIfLoaded"));
  if (!v20)
  {

    goto LABEL_3;
  }
  v21 = (void *)v20;
  location = (id *)&self->_containerViewController;
  if (-[ContainerViewController delaysFirstCardPresentation]_0())
  {
    v29 = objc_loadWeakRetained((id *)&self->_containerViewController);
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "topMostPresentedViewController"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "transitionCoordinator"));

    if (!v23)
      goto LABEL_11;
LABEL_3:
    v18 = objc_alloc_init(WaitingTransition);
    -[WaitingTransition setViewController:](v18, "setViewController:", v32);
    -[WaitingTransition setAnimated:](v18, "setAnimated:", v11);
    -[WaitingTransition setCompletion:](v18, "setCompletion:", v17);
    -[WaitingTransition setIsAlreadyInStack:](v18, "setIsAlreadyInStack:", v13);
    -[NSMutableArray addObject:](self->_waitingTransitions, "addObject:", v18);
    goto LABEL_4;
  }

LABEL_11:
  if (v15)
    v15[2](v15);
  self->_viewcontrollerTransitioning = 1;
  objc_msgSend(v32, "loadViewIfNeeded");
  v18 = (WaitingTransition *)objc_claimAutoreleasedReturnValue(-[ContainerTransitionManager _currentCardContaineeController](self, "_currentCardContaineeController"));
  v24 = objc_loadWeakRetained(location);
  v25 = objc_msgSend(v24, "transitionFrom:to:", v18, v32);

  v26 = objc_loadWeakRetained(location);
  objc_msgSend(v26, "willResignContainee:animated:", v18, v11);

  -[WaitingTransition willResignCurrent:](v18, "willResignCurrent:", v11);
  v27 = objc_loadWeakRetained(location);
  objc_msgSend(v27, "willPresentContainee:animated:", v32, v11);

  objc_msgSend(v32, "willBecomeCurrent:", v11);
  -[ContainerTransitionManager presentViewController:layout:transition:animated:postprocess:completion:](self, "presentViewController:layout:transition:animated:postprocess:completion:", v32, v31, v25, v11, v16, v17);
  v28 = objc_loadWeakRetained(location);
  objc_msgSend(v28, "transitionAlongsideContainee:animated:", v32, v11);

LABEL_4:
}

- (void)presentViewController:(id)a3 layout:(unint64_t)a4 transition:(unint64_t)a5 animated:(BOOL)a6 postprocess:(id)a7 completion:(id)a8
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  NSObject *v25;
  id v26;
  id WeakRetained;
  void *v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  LayoutCardInfo *v35;
  id v36;
  void *v37;
  id v38;
  uint64_t v39;
  void *v40;
  _BOOL4 v41;
  BOOL v42;
  id v43;
  void *v44;
  __int128 v45;
  void *v46;
  id v47;
  id v48;
  id v49;
  id v50;
  uint64_t v51;
  double v52;
  double v53;
  double v54;
  double v55;
  void *v56;
  _BOOL4 v57;
  id v58;
  unsigned int v59;
  int v60;
  double initialVelocity;
  BOOL v63;
  char *v64;
  unint64_t v65;
  double v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  unsigned int v79;
  id v80;
  void *v81;
  LayoutCardInfo *v82;
  void *v83;
  unsigned int v84;
  void *v85;
  double v86;
  double v87;
  double v88;
  double v89;
  void *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  id v94;
  void ***v95;
  id v96;
  id v97;
  _QWORD *v98;
  NSObject *v99;
  NSObject *v100;
  _QWORD *v101;
  NSObject *v102;
  _QWORD *v103;
  ContainerTransitionManager *v104;
  void (**v105)(_QWORD);
  void ***v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  double v122;
  double v123;
  double v124;
  void ***v125;
  void *v126;
  id v127;
  id v128;
  void *v129;
  unsigned int v130;
  id v131;
  id v132;
  void *v133;
  void *v134;
  id v135;
  unint64_t v136;
  char v137;
  BOOL v138;
  id v139;
  BOOL v140;
  BOOL v141;
  void *v142;
  void *v143;
  void *v144;
  id v145;
  BOOL v146;
  LayoutCardInfo *v147;
  id v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  id v153;
  id v154;
  id *location;
  unsigned int locationa;
  id *locationb;
  void *v158;
  LayoutCardInfo *v159;
  void *v160;
  void *v161;
  _BOOL4 v162;
  id v164;
  _QWORD v165[4];
  _QWORD *v166;
  _QWORD *v167;
  _QWORD v168[5];
  void ***v169;
  _QWORD *v170;
  _QWORD v171[5];
  _QWORD *v172;
  _QWORD v173[5];
  void ***v174;
  _QWORD block[4];
  _QWORD *v176;
  BOOL v177;
  _QWORD v178[5];
  id v179;
  id v180;
  BOOL v181;
  BOOL v182;
  _QWORD v183[4];
  id v184;
  id *v185;
  id v186;
  id v187;
  ContainerTransitionManager *v188;
  LayoutCardInfo *v189;
  NSObject *v190;
  char v191;
  BOOL v192;
  BOOL v193;
  BOOL v194;
  BOOL v195;
  _QWORD v196[4];
  id v197;
  ContainerTransitionManager *v198;
  id v199;
  NSObject *v200;
  unint64_t v201;
  _QWORD v202[4];
  id v203;
  id v204;
  id v205;
  unint64_t v206;
  double v207;
  double v208;
  char v209;
  char v210;
  void **v211;
  uint64_t v212;
  void (*v213)(uint64_t);
  void *v214;
  id v215;
  ContainerTransitionManager *v216;
  CGAffineTransform v217;
  CGAffineTransform v218;
  CGAffineTransform v219;
  CGAffineTransform v220;
  _QWORD v221[5];
  CGAffineTransform v222;
  CGAffineTransform v223;
  CGAffineTransform v224;
  CGAffineTransform v225;
  _OWORD v226[3];
  _QWORD v227[5];
  id v228;
  id v229;
  id v230;
  id v231;
  _QWORD v232[5];
  id v233;
  id v234;
  id v235;
  id v236;
  uint8_t buf[4];
  ContainerTransitionManager *v238;
  __int16 v239;
  id v240;
  __int16 v241;
  void *v242;

  v162 = a6;
  v12 = a3;
  v13 = a7;
  v14 = a8;
  if (!-[ContainerViewController delaysFirstCardPresentation]_0())
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
    v150 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "view"));

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerTransitionManager _currentCardContaineeController](self, "_currentCardContaineeController"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_layoutCardsInfo, "objectForKey:", v28));
    v30 = objc_loadWeakRetained((id *)&self->_containerViewController);
    objc_msgSend(v29, "setBackgroundLayout:", objc_msgSend(v30, "containeeLayout"));

    v31 = objc_loadWeakRetained((id *)&self->_containerViewController);
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "cardForViewController:", v28));

    v152 = v32;
    objc_msgSend(v32, "setUserInteractionEnabled:", 0);
    objc_msgSend(v28, "setEditing:", 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "view"));
    objc_msgSend(v33, "setUserInteractionEnabled:", 0);

    objc_msgSend(v28, "didResignCurrent");
    v34 = objc_loadWeakRetained((id *)&self->_containerViewController);
    objc_msgSend(v34, "setTransitioning:", 1);

    v161 = v13;
    if (v12)
    {
      v35 = (LayoutCardInfo *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_layoutCardsInfo, "objectForKey:", v12));
      if (!v35)
      {
        v35 = objc_opt_new(LayoutCardInfo);
        -[NSMapTable setObject:forKey:](self->_layoutCardsInfo, "setObject:forKey:");
      }
      v36 = objc_loadWeakRetained((id *)&self->_containerViewController);
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "cardForViewController:", v12));

      -[ContainerTransitionManager setupTransitionForViewController:](self, "setupTransitionForViewController:", v12);
      objc_msgSend(v12, "didBecomeCurrent");
      v38 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "view"));
      objc_msgSend(v38, "setUserInteractionEnabled:", 1);
    }
    else
    {
      v38 = objc_loadWeakRetained((id *)&self->_containerViewController);
      objc_msgSend(v38, "setCurrentViewController:", 0);
      v37 = 0;
      v35 = 0;
    }

    v142 = v29;
    v39 = objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "modalPresenter"));
    v158 = (void *)objc_claimAutoreleasedReturnValue(-[LayoutCardInfo modalPresenter](v35, "modalPresenter"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "cardPresentationController"));
    locationa = objc_msgSend(v40, "presentedModally");

    v41 = v39 != 0;
    v147 = v35;
    v149 = (void *)v39;
    v42 = (id)v39 == v12 && v39 != 0;
    v146 = v42;
    if ((id)v39 == v12)
      v41 = 0;
    v141 = v41;
    if (v41)
    {
      v43 = objc_loadWeakRetained((id *)&self->_containerViewController);
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "cardForViewController:", v39));

      objc_msgSend(v44, "setAlpha:", 0.0);
      objc_msgSend(v44, "removeFromSuperview");
      v45 = *(_OWORD *)&CGAffineTransformIdentity.c;
      v226[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
      v226[1] = v45;
      v226[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
      objc_msgSend(v44, "setTransform:", v226);
      objc_msgSend(v149, "removeFromParentViewController");

    }
    v154 = v12;
    v160 = v14;
    if (locationa)
    {
      v46 = (void *)objc_claimAutoreleasedReturnValue(-[LayoutCardInfo modalPresenter](v35, "modalPresenter"));
      v140 = v46 != 0;

    }
    else
    {
      v140 = 0;
    }
    v47 = objc_loadWeakRetained((id *)&self->_containerViewController);
    objc_msgSend(v47, "setPreventEdgeInsetsUpdate:", 1);

    v48 = objc_loadWeakRetained((id *)&self->_containerViewController);
    objc_msgSend(v48, "setLayoutIfSupported:animated:", a4, 0);

    v49 = objc_loadWeakRetained((id *)&self->_containerViewController);
    objc_msgSend(v49, "setPreventEdgeInsetsUpdate:", 0);

    v50 = objc_loadWeakRetained((id *)&self->_containerViewController);
    v51 = objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "cardForViewController:", v158));

    objc_msgSend(v37, "bounds");
    v53 = v52;
    objc_msgSend(v152, "bounds");
    v55 = v54;
    v144 = (void *)objc_claimAutoreleasedReturnValue(+[AnimationSlideParameters defaultParameters](AnimationSlideParameters, "defaultParameters"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v57 = objc_msgSend(v56, "userInterfaceLayoutDirection") == (id)1;

    v58 = objc_loadWeakRetained((id *)&self->_containerViewController);
    v59 = objc_msgSend(v58, "stackOnOppositeSide");

    v60 = v57 ^ v59;
    initialVelocity = self->_initialVelocity;
    v63 = a5 == 4 || (a5 & 0xFFFFFFFFFFFFFFFDLL) == 1;
    v64 = "HomeListSectionControllerSubclassing" + 32;
    v143 = (void *)v51;
    v138 = v63;
    v137 = v60;
    switch(a5)
    {
      case 0uLL:
        v65 = a5;
        v66 = 1.0;
        if (v53 + v55 != 0.0)
          v66 = v53 + v55;
        CGAffineTransformMakeTranslation(&v225, 0.0, v66);
        v224 = v225;
        objc_msgSend(v37, "setTransform:", &v224);
        v67 = v152;
        v68 = v28;
        if (v55 > v53 + 30.0)
        {
          v69 = objc_claimAutoreleasedReturnValue(+[AnimationSlideParameters presentSmallerParameters](AnimationSlideParameters, "presentSmallerParameters"));

          v144 = (void *)v69;
        }
        v70 = v12;
        objc_msgSend(v37, "showShadow:animated:", 0, 0);
        v71 = v152;
        v72 = 1;
        v73 = 1;
        goto LABEL_64;
      case 1uLL:
        v65 = a5;
        v67 = v152;
        objc_msgSend(v150, "insertSubview:belowSubview:", v37, v152);
        if (v51)
        {
          v221[0] = _NSConcreteStackBlock;
          v221[1] = 3221225472;
          v221[2] = sub_100865370;
          v221[3] = &unk_1011AC860;
          v221[4] = self;
          +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v221);
        }
        v68 = v28;
        v70 = v12;
        if (!v146)
        {
          v86 = vabdd_f64(v53, v55);
          if (initialVelocity != 0.0)
            v86 = v53;
          v87 = 1.0;
          if (v86 != 0.0)
            v87 = v86;
          CGAffineTransformMakeTranslation(&v220, 0.0, v87);
          v219 = v220;
          objc_msgSend(v37, "setTransform:", &v219);
        }
        objc_msgSend(v37, "showShadow:animated:", 0, 1);
        v71 = v152;
        v72 = 0;
        v73 = 0;
LABEL_64:
        objc_msgSend(v71, "showShadow:animated:", v72, v73);
        goto LABEL_72;
      case 2uLL:
        v65 = a5;
        v68 = v28;
        objc_msgSend(v37, "frame");
        v89 = -v88;
        if (v60)
          v89 = v88;
        CGAffineTransformMakeTranslation(&v223, v89, 0.0);
        v222 = v223;
        objc_msgSend(v37, "setTransform:", &v222);
        objc_msgSend(v37, "showShadow:animated:", 0, 0);
        v67 = v152;
        v90 = v152;
        v91 = 1;
        v92 = 1;
        goto LABEL_71;
      case 3uLL:
        v65 = a5;
        v68 = v28;
        v67 = v152;
        objc_msgSend(v150, "insertSubview:belowSubview:", v37, v152);
        if (v51)
          objc_msgSend(v150, "insertSubview:belowSubview:", v51, v37);
        CGAffineTransformMakeScale(&v218, 0.970000029, 0.970000029);
        v217 = v218;
        objc_msgSend(v37, "setTransform:", &v217);
        objc_msgSend(v37, "showShadow:animated:", 0, 1);
        v90 = v152;
        v91 = 0;
        v92 = 0;
LABEL_71:
        objc_msgSend(v90, "showShadow:animated:", v91, v92);
        v70 = v12;
LABEL_72:
        v64 = "sing";
        break;
      default:
        v65 = a5;
        v68 = v28;
        v67 = v152;
        v70 = v12;
        break;
    }
    v211 = _NSConcreteStackBlock;
    v212 = *((_QWORD *)v64 + 186);
    v93 = v212;
    v213 = sub_100865378;
    v214 = &unk_1011AC8B0;
    v94 = v37;
    v215 = v94;
    v216 = self;
    v95 = objc_retainBlock(&v211);
    v202[0] = _NSConcreteStackBlock;
    v202[1] = v93;
    v202[2] = sub_1008653D8;
    v202[3] = &unk_1011D96A8;
    v136 = v65;
    v206 = v65;
    v96 = v67;
    v203 = v96;
    v153 = v144;
    v204 = v153;
    v207 = v55;
    v208 = v53;
    v209 = locationa;
    v97 = v68;
    v205 = v97;
    v210 = v137;
    v98 = objc_retainBlock(v202);
    v99 = dispatch_group_create();
    dispatch_group_enter(v99);
    v196[0] = _NSConcreteStackBlock;
    v196[1] = v93;
    v196[2] = sub_10086551C;
    v196[3] = &unk_1011D96D0;
    v197 = v70;
    v198 = self;
    v201 = a4;
    v145 = v94;
    v199 = v145;
    v100 = v99;
    v200 = v100;
    v101 = objc_retainBlock(v196);
    dispatch_group_enter(v100);
    v183[0] = _NSConcreteStackBlock;
    v183[1] = v93;
    v183[2] = sub_1008655A8;
    v183[3] = &unk_1011D96F8;
    v191 = locationa;
    v192 = v138;
    v139 = v158;
    v184 = v139;
    locationb = v147;
    v185 = locationb;
    v164 = v97;
    v186 = v164;
    v148 = v96;
    v187 = v148;
    v188 = self;
    v193 = v146;
    v194 = v141;
    v159 = v142;
    v189 = v159;
    v195 = initialVelocity != 0.0;
    v102 = v100;
    v190 = v102;
    v103 = objc_retainBlock(v183);
    v178[0] = _NSConcreteStackBlock;
    v178[1] = v93;
    v178[2] = sub_10086583C;
    v178[3] = &unk_1011D9720;
    v181 = v140;
    v104 = self;
    v178[4] = self;
    v179 = v161;
    v182 = v162;
    v180 = v160;
    block[0] = _NSConcreteStackBlock;
    block[1] = v93;
    block[2] = sub_1008659C4;
    block[3] = &unk_1011B06A0;
    v177 = v162;
    v176 = objc_retainBlock(v178);
    v105 = v176;
    dispatch_group_notify(v102, (dispatch_queue_t)&_dispatch_main_q, block);
    if (v162)
    {
      v106 = v95;
      if (v136 > 1)
      {
        v168[0] = _NSConcreteStackBlock;
        v168[1] = v93;
        v168[2] = sub_100865A94;
        v168[3] = &unk_1011D9748;
        v169 = v95;
        v170 = v98;
        v168[4] = v104;
        v165[0] = _NSConcreteStackBlock;
        v165[1] = v93;
        v165[2] = sub_100865AF8;
        v165[3] = &unk_1011AF960;
        v166 = v103;
        v167 = v101;
        +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v168, v165, 0.25);

        v125 = v169;
      }
      else
      {
        objc_msgSend(v153, "parametersIn");
        v108 = v107;
        objc_msgSend(v153, "parametersIn");
        v110 = v109;
        objc_msgSend(v153, "parametersIn");
        v112 = v111;
        objc_msgSend(v153, "parametersIn");
        v114 = v113;
        v173[0] = _NSConcreteStackBlock;
        v173[1] = v93;
        v173[2] = sub_1008659DC;
        v173[3] = &unk_1011ACAD0;
        v173[4] = v104;
        v174 = v95;
        +[UIView _animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:](UIView, "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", 0, v173, v101, v108, 0.0, v110, v112, v114, 0.0);
        objc_msgSend(v153, "parametersOut");
        v116 = v115;
        objc_msgSend(v153, "parametersOut");
        v118 = v117;
        objc_msgSend(v153, "parametersOut");
        v120 = v119;
        objc_msgSend(v153, "parametersOut");
        v122 = v121;
        v123 = v104->_initialVelocity;
        v171[0] = _NSConcreteStackBlock;
        v171[1] = v93;
        v171[2] = sub_100865A64;
        v171[3] = &unk_1011ACAD0;
        v124 = v123 / v55;
        v171[4] = v104;
        v172 = v98;
        +[UIView _animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:](UIView, "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", 0, v171, v103, v116, 0.0, v118, v120, v122, v124);

        v125 = v174;
      }

      v17 = v164;
    }
    else
    {
      ((void (*)(_QWORD *))v98[2])(v98);
      ((void (*)(void ***))v95[2])(v95);
      ((void (*)(_QWORD *, uint64_t))v101[2])(v101, 1);
      ((void (*)(_QWORD *, uint64_t))v103[2])(v103, 1);
      v105[2](v105);
      v17 = v164;
      v106 = v95;
    }

    v12 = v154;
    v14 = v160;
    v13 = v161;
    v15 = v150;
    goto LABEL_80;
  }
  v15 = (id)objc_claimAutoreleasedReturnValue(-[ContainerTransitionManager _currentCardContaineeController](self, "_currentCardContaineeController"));
  objc_msgSend(v15, "setEditing:", 0);
  objc_msgSend(v15, "didResignCurrent");
  v16 = v12;
  v17 = v16;
  if (!v16)
  {
    v18 = objc_loadWeakRetained((id *)&self->_containerViewController);
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "rootPresentingViewController"));

  }
  location = (id *)&self->_containerViewController;
  v19 = objc_loadWeakRetained((id *)&self->_containerViewController);
  objc_msgSend(v19, "setCurrentViewController:", v16);

  v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "presentingViewController"));
  if (!v20)
  {
    if (a5 > 4)
      goto LABEL_48;
LABEL_41:
    if (((1 << a5) & 0x1A) == 0)
      goto LABEL_48;
    goto LABEL_42;
  }
  v21 = (void *)v20;
  v22 = v15;
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "presentedViewController"));

  if (!v23)
  {
    v15 = v22;
    if (a5 > 4)
      goto LABEL_48;
    goto LABEL_41;
  }
  v15 = v22;
  if (a5 > 4 || ((1 << a5) & 0x1A) == 0)
  {
    v24 = sub_10043165C();
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
    {
      v26 = objc_loadWeakRetained(location);
      *(_DWORD *)buf = 138412802;
      v238 = self;
      v239 = 2112;
      v240 = v26;
      v241 = 2112;
      v242 = v17;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_FAULT, "%@ for %@: view controller %@ does not have a dismiss transition style but appears to require a dismiss.", buf, 0x20u);

      v15 = v22;
    }

  }
LABEL_42:
  v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "presentedViewController"));

  if (v74)
  {
    if (a4 != 5)
    {
      v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "cardPresentationController"));
      objc_msgSend(v75, "wantsLayout:animated:", a4, 0);

    }
    v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "cardPresentationController"));
    objc_msgSend(v15, "setModalTransitionStyle:", objc_msgSend(v76, "modalDismissStyle"));

    v77 = v15;
    v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "cardPresentationController"));
    v79 = objc_msgSend(v78, "shouldHidePreviousCards");

    if (v79)
    {
      v80 = objc_loadWeakRetained(location);
      objc_msgSend(v80, "setContaineesHidden:", 0);

    }
    v232[0] = _NSConcreteStackBlock;
    v232[1] = 3221225472;
    v232[2] = sub_1008650B0;
    v232[3] = &unk_1011D9680;
    v232[4] = self;
    v233 = v16;
    v15 = v77;
    v234 = v77;
    v235 = v13;
    v236 = v14;
    objc_msgSend(v17, "dismissViewControllerAnimated:completion:", v162, v232);

  }
LABEL_48:
  if (v16)
  {
    v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "presentingViewController"));

    if (!v81)
    {
      v151 = v15;
      v82 = (LayoutCardInfo *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_layoutCardsInfo, "objectForKey:", v16));
      if (!v82)
      {
        v82 = objc_opt_new(LayoutCardInfo);
        -[NSMapTable setObject:forKey:](self->_layoutCardsInfo, "setObject:forKey:", v82, v16);
      }
      v159 = v82;
      v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "cardPresentationController"));
      v84 = objc_msgSend(v83, "wantsFullscreen");

      v85 = v13;
      if (v84)
      {
        objc_msgSend(v16, "setModalPresentationStyle:", 0);
      }
      else
      {
        v126 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "cardPresentationController"));
        v127 = objc_loadWeakRetained(location);
        objc_msgSend(v126, "configureForSheetPresentationWithContainer:layout:", v127, a4);

      }
      v128 = v14;
      v129 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "cardPresentationController"));
      v130 = objc_msgSend(v129, "shouldHidePreviousCards");

      if (v130)
      {
        v131 = objc_loadWeakRetained(location);
        objc_msgSend(v131, "setContaineesHidden:", 1);

      }
      v132 = objc_loadWeakRetained(location);
      v133 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v132, "view"));
      v134 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v133, "window"));
      objc_msgSend(v134, "endEditing:", 1);

      v135 = objc_loadWeakRetained(location);
      v227[0] = _NSConcreteStackBlock;
      v227[1] = 3221225472;
      v227[2] = sub_100865194;
      v227[3] = &unk_1011D9680;
      v227[4] = self;
      v228 = v16;
      v15 = v151;
      v229 = v15;
      v230 = v85;
      v14 = v128;
      v13 = v85;
      v231 = v14;
      objc_msgSend(v135, "_maps_topMostPresentViewController:animated:completion:", v228, v162, v227);

LABEL_80:
    }
  }

}

- (void)didPerformUnmanagedDismissOfViewController:(id)a3 revealingViewController:(id)a4
{
  ContainerViewController **p_containerViewController;
  id v7;
  id v8;
  id WeakRetained;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;

  p_containerViewController = &self->_containerViewController;
  v7 = a4;
  v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_containerViewController);
  objc_msgSend(WeakRetained, "willResignContainee:animated:", v8, 1);

  objc_msgSend(v8, "willResignCurrent:", 1);
  v10 = objc_loadWeakRetained((id *)p_containerViewController);
  objc_msgSend(v10, "willPresentContainee:animated:", v7, 1);

  objc_msgSend(v7, "willBecomeCurrent:", 1);
  objc_msgSend(v8, "setEditing:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "view"));
  objc_msgSend(v11, "setUserInteractionEnabled:", 1);

  v12 = objc_loadWeakRetained((id *)p_containerViewController);
  objc_msgSend(v12, "didResignContainee:finished:", v8, 1);

  objc_msgSend(v8, "didResignCurrent");
  v13 = objc_loadWeakRetained((id *)p_containerViewController);
  objc_msgSend(v13, "didPresentContainee:finished:", v7, 1);

  objc_msgSend(v7, "didBecomeCurrent");
  -[NSMapTable removeObjectForKey:](self->_layoutCardsInfo, "removeObjectForKey:", v8);

  v14 = objc_loadWeakRetained((id *)p_containerViewController);
  objc_msgSend(v14, "setCurrentViewController:", v7);

  -[ContainerTransitionManager dequeueWaitingContainees](self, "dequeueWaitingContainees");
}

- (BOOL)containerReadyToInsert
{
  return self->_containerReadyToInsert;
}

- (double)initialVelocity
{
  return self->_initialVelocity;
}

- (void)setInitialVelocity:(double)a3
{
  self->_initialVelocity = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_containerViewController);
  objc_storeStrong((id *)&self->_waitingTransitions, 0);
  objc_storeStrong((id *)&self->_layoutCardsInfo, 0);
}

@end
