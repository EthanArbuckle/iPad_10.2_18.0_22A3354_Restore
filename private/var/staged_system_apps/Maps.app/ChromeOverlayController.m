@implementation ChromeOverlayController

- (ChromeOverlayController)init
{
  ChromeOverlayController *v2;
  uint64_t v3;
  NSMutableOrderedSet *overlays;
  uint64_t v5;
  NSMapTable *layoutGuidesByOverlay;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ChromeOverlayController;
  v2 = -[ChromeOverlayController init](&v8, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSMutableOrderedSet orderedSet](NSMutableOrderedSet, "orderedSet"));
    overlays = v2->_overlays;
    v2->_overlays = (NSMutableOrderedSet *)v3;

    v5 = objc_claimAutoreleasedReturnValue(+[NSMapTable weakToStrongObjectsMapTable](NSMapTable, "weakToStrongObjectsMapTable"));
    layoutGuidesByOverlay = v2->_layoutGuidesByOverlay;
    v2->_layoutGuidesByOverlay = (NSMapTable *)v5;

  }
  return v2;
}

- (UIView)overlayContentView
{
  return self->_passThroughView;
}

- (void)addOverlay:(id)a3
{
  -[ChromeOverlayController addOverlay:inLayoutGuide:](self, "addOverlay:inLayoutGuide:", a3, 0);
}

- (void)addOverlay:(id)a3 inLayoutGuide:(id)a4
{
  id v6;
  NSMapTable *layoutGuidesByOverlay;
  id v8;

  v8 = a3;
  v6 = a4;
  -[NSMutableOrderedSet addObject:](self->_overlays, "addObject:", v8);
  layoutGuidesByOverlay = self->_layoutGuidesByOverlay;
  if (v6)
    -[NSMapTable setObject:forKey:](layoutGuidesByOverlay, "setObject:forKey:", v6, v8);
  else
    -[NSMapTable removeObjectForKey:](layoutGuidesByOverlay, "removeObjectForKey:", v8);
  if (-[ChromeOverlayController _canHostOverlays](self, "_canHostOverlays"))
    objc_msgSend(v8, "setHost:", self);

}

- (void)removeOverlay:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setHost:", 0);
  -[NSMutableOrderedSet removeObject:](self->_overlays, "removeObject:", v4);
  -[NSMapTable removeObjectForKey:](self->_layoutGuidesByOverlay, "removeObjectForKey:", v4);
  -[NSMapTable removeObjectForKey:](self->_hidingConstraintsByOverlay, "removeObjectForKey:", v4);
  -[NSMapTable removeObjectForKey:](self->_showingConstraintsByOverlay, "removeObjectForKey:", v4);
  -[NSMapTable removeObjectForKey:](self->_collisionConstraintsByOverlay, "removeObjectForKey:", v4);
  -[NSMapTable removeObjectForKey:](self->_mapInsetsConstraintsByOverlay, "removeObjectForKey:", v4);
  -[NSMapTable removeObjectForKey:](self->_viewportConstraintsByOverlay, "removeObjectForKey:", v4);

}

- (void)removeAllOverlays
{
  -[ChromeOverlayController _deactivateHosting](self, "_deactivateHosting");
  -[NSMutableOrderedSet removeAllObjects](self->_overlays, "removeAllObjects");
}

- (void)enumerateOverlaysUsingBlock:(id)a3
{
  -[NSMutableOrderedSet enumerateObjectsUsingBlock:](self->_overlays, "enumerateObjectsUsingBlock:", a3);
}

- (BOOL)_canHostOverlays
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeOverlayController parentView](self, "parentView"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeOverlayController contentLayoutGuide](self, "contentLayoutGuide"));
    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeOverlayController mapInsetsLayoutGuide](self, "mapInsetsLayoutGuide"));
      if (v5)
      {
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeOverlayController viewportLayoutGuide](self, "viewportLayoutGuide"));
        v7 = v6 != 0;

      }
      else
      {
        v7 = 0;
      }

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_activateHosting
{
  NSMutableOrderedSet *overlays;
  _QWORD v4[5];

  if (-[ChromeOverlayController _canHostOverlays](self, "_canHostOverlays"))
  {
    overlays = self->_overlays;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_100919818;
    v4[3] = &unk_1011DBEE8;
    v4[4] = self;
    -[NSMutableOrderedSet enumerateObjectsUsingBlock:](overlays, "enumerateObjectsUsingBlock:", v4);
  }
}

- (void)_deactivateHosting
{
  -[NSMutableOrderedSet enumerateObjectsUsingBlock:](self->_overlays, "enumerateObjectsUsingBlock:", &stru_1011DBF28);
}

- (void)installInView:(id)a3 containingViewController:(id)a4 contentLayoutGuide:(id)a5 mapInsetsLayoutGuide:(id)a6 viewportLayoutGuide:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;

  v17 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = (id)objc_claimAutoreleasedReturnValue(-[ChromeOverlayController parentView](self, "parentView"));

  if (v16 != v17)
  {
    -[ChromeOverlayController _teardownIfNeeded](self, "_teardownIfNeeded");
    -[ChromeOverlayController setParentView:](self, "setParentView:", v17);
    -[ChromeOverlayController setContainingViewController:](self, "setContainingViewController:", v12);
    -[ChromeOverlayController setContentLayoutGuide:](self, "setContentLayoutGuide:", v13);
    -[ChromeOverlayController setMapInsetsLayoutGuide:](self, "setMapInsetsLayoutGuide:", v14);
    -[ChromeOverlayController setViewportLayoutGuide:](self, "setViewportLayoutGuide:", v15);
    -[ChromeOverlayController _setupIfNeeded](self, "_setupIfNeeded");
  }

}

- (id)layoutGuideForOverlay:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (!v4
    || (v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_layoutGuidesByOverlay, "objectForKey:", v4))) == 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeOverlayController contentLayoutGuide](self, "contentLayoutGuide"));
  }

  return v5;
}

- (void)setConstraints:(id)a3 forHidingOverlay:(id)a4
{
  -[ChromeOverlayController _setConstraints:view:container:forOverlay:](self, "_setConstraints:view:container:forOverlay:", a3, self->_passThroughView, self->_hidingConstraintsByOverlay, a4);
}

- (void)setConstraints:(id)a3 forShowingOverlay:(id)a4
{
  -[ChromeOverlayController _setConstraints:view:container:forOverlay:](self, "_setConstraints:view:container:forOverlay:", a3, self->_passThroughView, self->_showingConstraintsByOverlay, a4);
}

- (void)setShowingConstraintsEnabled:(BOOL)a3 forOverlay:(id)a4
{
  _BOOL8 v4;
  _BOOL8 v6;
  NSMapTable *hidingConstraintsByOverlay;
  id v8;

  v4 = a3;
  v6 = !a3;
  hidingConstraintsByOverlay = self->_hidingConstraintsByOverlay;
  v8 = a4;
  -[ChromeOverlayController _setConstraintsEnabled:container:overlay:](self, "_setConstraintsEnabled:container:overlay:", v6, hidingConstraintsByOverlay, v8);
  -[ChromeOverlayController _setConstraintsEnabled:container:overlay:](self, "_setConstraintsEnabled:container:overlay:", v4, self->_showingConstraintsByOverlay, v8);

}

- (void)setMapInsetsConstraints:(id)a3 forOverlay:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeOverlayController parentView](self, "parentView"));
  -[ChromeOverlayController _setConstraints:view:container:forOverlay:](self, "_setConstraints:view:container:forOverlay:", v7, v8, self->_mapInsetsConstraintsByOverlay, v6);

  v9 = (id)objc_claimAutoreleasedReturnValue(-[ChromeOverlayController delegate](self, "delegate"));
  objc_msgSend(v9, "overlayControllerDidUpdateMapInsets:fromOverlay:", self, v6);

}

- (void)setMapInsetsConstraintsEnabled:(BOOL)a3 forOverlay:(id)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;

  v4 = a3;
  v7 = a4;
  if (-[ChromeOverlayController _setConstraintsEnabled:container:overlay:](self, "_setConstraintsEnabled:container:overlay:", v4, self->_mapInsetsConstraintsByOverlay))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeOverlayController delegate](self, "delegate"));
    objc_msgSend(v6, "overlayControllerDidUpdateMapInsets:fromOverlay:", self, v7);

  }
}

- (void)overlayDidUpdateExistingMapInsetConstraints:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[ChromeOverlayController delegate](self, "delegate"));
  objc_msgSend(v5, "overlayControllerDidUpdateMapInsets:fromOverlay:", self, v4);

}

- (void)setViewportConstraints:(id)a3 forOverlay:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[ChromeOverlayController parentView](self, "parentView"));
  -[ChromeOverlayController _setConstraints:view:container:forOverlay:](self, "_setConstraints:view:container:forOverlay:", v7, v8, self->_viewportConstraintsByOverlay, v6);

}

- (void)setViewportConstraintsEnabled:(BOOL)a3 forOverlay:(id)a4
{
  -[ChromeOverlayController _setConstraintsEnabled:container:overlay:](self, "_setConstraintsEnabled:container:overlay:", a3, self->_viewportConstraintsByOverlay, a4);
}

- (void)setCollisionConstraints:(id)a3 forOverlay:(id)a4
{
  -[ChromeOverlayController _setConstraints:view:container:forOverlay:](self, "_setConstraints:view:container:forOverlay:", a3, self->_passThroughView, self->_collisionConstraintsByOverlay, a4);
}

- (void)setCollisionConstraintsEnabled:(BOOL)a3 forOverlay:(id)a4
{
  -[ChromeOverlayController _setConstraintsEnabled:container:overlay:](self, "_setConstraintsEnabled:container:overlay:", a3, self->_collisionConstraintsByOverlay, a4);
}

- (void)_setConstraints:(id)a3 view:(id)a4 container:(id)a5 forOverlay:(id)a6
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  v8 = a5;
  v9 = a6;
  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", v9));
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v10);
    if (v11)
    {
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v11);
      objc_msgSend(v8, "setObject:forKey:", v11, v9);
    }
    else
    {
      objc_msgSend(v8, "removeObjectForKey:", v9);
    }

  }
}

- (BOOL)_setConstraintsEnabled:(BOOL)a3 container:(id)a4 overlay:(id)a5
{
  _BOOL4 v5;
  void *v7;
  ChromeOverlayController *v8;
  BOOL v9;

  if (a5)
  {
    v5 = a3;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "objectForKey:", a5));
    if (v7)
    {
      v8 = self;
      if (v5)
      {
        v9 = 0;
        if (!-[ChromeOverlayController _checkIfAnyConstraints:match:](v8, "_checkIfAnyConstraints:match:", v7, 0))
        {
LABEL_11:

          return v9;
        }
        +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v7);
LABEL_9:
        v9 = 1;
        goto LABEL_11;
      }
      if (-[ChromeOverlayController _checkIfAnyConstraints:match:](self, "_checkIfAnyConstraints:match:", v7, 1))
      {
        +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v7);
        goto LABEL_9;
      }
    }
    v9 = 0;
    goto LABEL_11;
  }
  return 0;
}

- (BOOL)_checkIfAnyConstraints:(id)a3 match:(BOOL)a4
{
  _QWORD v5[4];
  BOOL v6;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100919DC8;
  v5[3] = &unk_1011DBF48;
  v6 = a4;
  return objc_msgSend(a3, "indexOfObjectWithOptions:passingTest:", 1, v5) != (id)0x7FFFFFFFFFFFFFFFLL;
}

- (id)collisionGuideForEdge:(unint64_t)a3
{
  NSDictionary *collisionGuidesByEdge;
  void *v4;
  void *v5;

  collisionGuidesByEdge = self->_collisionGuidesByEdge;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](collisionGuidesByEdge, "objectForKeyedSubscript:", v4));

  return v5;
}

- (void)_setupIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  PassThroughView *v6;
  UIView *v7;
  UIView *passThroughView;
  void *v9;
  unsigned int v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  NSMapTable *v15;
  NSMapTable *hidingConstraintsByOverlay;
  NSMapTable *v17;
  NSMapTable *showingConstraintsByOverlay;
  NSMapTable *v19;
  NSMapTable *mapInsetsConstraintsByOverlay;
  NSMapTable *v21;
  NSMapTable *viewportConstraintsByOverlay;
  NSMapTable *v23;
  NSMapTable *collisionConstraintsByOverlay;
  void *v25;
  UIView *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  UIView *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  UIView *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  UIView *v41;
  void *v42;
  void *v43;
  void *v44;
  NSDictionary *v45;
  NSDictionary *collisionGuidesByEdge;
  _QWORD v47[4];
  _QWORD v48[4];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIView superview](self->_passThroughView, "superview"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeOverlayController parentView](self, "parentView"));

  if (v3 != v4 && -[ChromeOverlayController _canHostOverlays](self, "_canHostOverlays"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeOverlayController parentView](self, "parentView"));
    v6 = [PassThroughView alloc];
    objc_msgSend(v5, "bounds");
    v7 = -[PassThroughView initWithFrame:](v6, "initWithFrame:");
    passThroughView = self->_passThroughView;
    self->_passThroughView = v7;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_passThroughView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView setClipsToBounds:](self->_passThroughView, "setClipsToBounds:", 1);
    -[UIView setAccessibilityIdentifier:](self->_passThroughView, "setAccessibilityIdentifier:", CFSTR("ChromeOverlayController"));
    objc_msgSend(v5, "addSubview:", self->_passThroughView);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MKSystemController sharedInstance](MKSystemController, "sharedInstance"));
    v10 = objc_msgSend(v9, "isInternalInstall");

    if (v10)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      -[UIView setHidden:](self->_passThroughView, "setHidden:", objc_msgSend(v12, "BOOLForKey:", CFSTR("__internal__DisableChrome")));

    }
    LODWORD(v11) = 1148846080;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIView _maps_constraintsEqualToEdgesOfView:priority:](self->_passThroughView, "_maps_constraintsEqualToEdgesOfView:priority:", v5, v11));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "allConstraints"));
    objc_msgSend(v5, "addConstraints:", v14);

    v15 = (NSMapTable *)objc_claimAutoreleasedReturnValue(+[NSMapTable weakToStrongObjectsMapTable](NSMapTable, "weakToStrongObjectsMapTable"));
    hidingConstraintsByOverlay = self->_hidingConstraintsByOverlay;
    self->_hidingConstraintsByOverlay = v15;

    v17 = (NSMapTable *)objc_claimAutoreleasedReturnValue(+[NSMapTable weakToStrongObjectsMapTable](NSMapTable, "weakToStrongObjectsMapTable"));
    showingConstraintsByOverlay = self->_showingConstraintsByOverlay;
    self->_showingConstraintsByOverlay = v17;

    v19 = (NSMapTable *)objc_claimAutoreleasedReturnValue(+[NSMapTable weakToStrongObjectsMapTable](NSMapTable, "weakToStrongObjectsMapTable"));
    mapInsetsConstraintsByOverlay = self->_mapInsetsConstraintsByOverlay;
    self->_mapInsetsConstraintsByOverlay = v19;

    v21 = (NSMapTable *)objc_claimAutoreleasedReturnValue(+[NSMapTable weakToStrongObjectsMapTable](NSMapTable, "weakToStrongObjectsMapTable"));
    viewportConstraintsByOverlay = self->_viewportConstraintsByOverlay;
    self->_viewportConstraintsByOverlay = v21;

    v23 = (NSMapTable *)objc_claimAutoreleasedReturnValue(+[NSMapTable weakToStrongObjectsMapTable](NSMapTable, "weakToStrongObjectsMapTable"));
    collisionConstraintsByOverlay = self->_collisionConstraintsByOverlay;
    self->_collisionConstraintsByOverlay = v23;

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeOverlayController _addCollisionGuideAlongAxis:](self, "_addCollisionGuideAlongAxis:", 0));
    objc_msgSend(v25, "setIdentifier:", CFSTR("card.collision.top"));
    v26 = self->_passThroughView;
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "topAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_passThroughView, "topAnchor"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:", v28));
    -[UIView addConstraint:](v26, "addConstraint:", v29);

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeOverlayController _addCollisionGuideAlongAxis:](self, "_addCollisionGuideAlongAxis:", 1));
    objc_msgSend(v30, "setIdentifier:", CFSTR("card.collision.left"));
    v31 = self->_passThroughView;
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "leftAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leftAnchor](self->_passThroughView, "leftAnchor"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:", v33));
    -[UIView addConstraint:](v31, "addConstraint:", v34);

    v35 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeOverlayController _addCollisionGuideAlongAxis:](self, "_addCollisionGuideAlongAxis:", 0));
    objc_msgSend(v35, "setIdentifier:", CFSTR("card.collision.bottom"));
    v36 = self->_passThroughView;
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "bottomAnchor"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_passThroughView, "bottomAnchor"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToAnchor:", v38));
    -[UIView addConstraint:](v36, "addConstraint:", v39);

    v40 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeOverlayController _addCollisionGuideAlongAxis:](self, "_addCollisionGuideAlongAxis:", 1));
    objc_msgSend(v40, "setIdentifier:", CFSTR("card.collision.right"));
    v41 = self->_passThroughView;
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "rightAnchor"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[UIView rightAnchor](self->_passThroughView, "rightAnchor"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintEqualToAnchor:", v43));
    -[UIView addConstraint:](v41, "addConstraint:", v44);

    v47[0] = &off_10126FBE0;
    v47[1] = &off_10126FBF8;
    v48[0] = v25;
    v48[1] = v30;
    v47[2] = &off_10126FC10;
    v47[3] = &off_10126FC28;
    v48[2] = v35;
    v48[3] = v40;
    v45 = (NSDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v48, v47, 4));
    collisionGuidesByEdge = self->_collisionGuidesByEdge;
    self->_collisionGuidesByEdge = v45;

    -[ChromeOverlayController _activateHosting](self, "_activateHosting");
  }
}

- (void)_teardownIfNeeded
{
  UIView *passThroughView;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSDictionary *collisionGuidesByEdge;
  NSMapTable *mapInsetsConstraintsByOverlay;
  NSMapTable *viewportConstraintsByOverlay;
  NSMapTable *collisionConstraintsByOverlay;
  NSMapTable *hidingConstraintsByOverlay;
  NSMapTable *showingConstraintsByOverlay;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];

  -[ChromeOverlayController _deactivateHosting](self, "_deactivateHosting");
  -[UIView removeFromSuperview](self->_passThroughView, "removeFromSuperview");
  passThroughView = self->_passThroughView;
  self->_passThroughView = 0;

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectEnumerator](self->_viewportConstraintsByOverlay, "objectEnumerator"));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v29;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v29 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeOverlayController parentView](self, "parentView"));
        objc_msgSend(v10, "removeConstraints:", v9);

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v6);
  }

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectEnumerator](self->_mapInsetsConstraintsByOverlay, "objectEnumerator", 0));
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v25;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v25 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeOverlayController parentView](self, "parentView"));
        objc_msgSend(v17, "removeConstraints:", v16);

        v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v13);
  }

  collisionGuidesByEdge = self->_collisionGuidesByEdge;
  self->_collisionGuidesByEdge = 0;

  mapInsetsConstraintsByOverlay = self->_mapInsetsConstraintsByOverlay;
  self->_mapInsetsConstraintsByOverlay = 0;

  viewportConstraintsByOverlay = self->_viewportConstraintsByOverlay;
  self->_viewportConstraintsByOverlay = 0;

  collisionConstraintsByOverlay = self->_collisionConstraintsByOverlay;
  self->_collisionConstraintsByOverlay = 0;

  hidingConstraintsByOverlay = self->_hidingConstraintsByOverlay;
  self->_hidingConstraintsByOverlay = 0;

  showingConstraintsByOverlay = self->_showingConstraintsByOverlay;
  self->_showingConstraintsByOverlay = 0;

  -[ChromeOverlayController setContentLayoutGuide:](self, "setContentLayoutGuide:", 0);
  -[ChromeOverlayController setMapInsetsLayoutGuide:](self, "setMapInsetsLayoutGuide:", 0);
  -[ChromeOverlayController setViewportLayoutGuide:](self, "setViewportLayoutGuide:", 0);
}

- (id)_addCollisionGuideAlongAxis:(int64_t)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD *v15;
  void *v16;
  void *v17;
  UIView *passThroughView;
  void *v20;
  void *v21;
  _QWORD v22[4];
  _QWORD v23[4];

  v5 = objc_alloc_init((Class)UILayoutGuide);
  -[UIView addLayoutGuide:](self->_passThroughView, "addLayoutGuide:", v5);
  if (!a3)
  {
    passThroughView = self->_passThroughView;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "leadingAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_passThroughView, "leadingAnchor"));
    v21 = v16;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintGreaterThanOrEqualToAnchor:", v20));
    v22[0] = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "trailingAnchor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_passThroughView, "trailingAnchor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintLessThanOrEqualToAnchor:", v9));
    v22[1] = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "widthAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintGreaterThanOrEqualToConstant:", 8.0));
    v22[2] = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "heightAnchor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToConstant:", 0.0));
    v22[3] = v14;
    v15 = v22;
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    passThroughView = self->_passThroughView;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_passThroughView, "topAnchor"));
    v21 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintGreaterThanOrEqualToAnchor:", v20));
    v23[0] = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bottomAnchor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_passThroughView, "bottomAnchor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintLessThanOrEqualToAnchor:", v9));
    v23[1] = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "heightAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintGreaterThanOrEqualToConstant:", 8.0));
    v23[2] = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "widthAnchor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToConstant:", 0.0));
    v23[3] = v14;
    v15 = v23;
LABEL_5:
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v15, 4));
    -[UIView addConstraints:](passThroughView, "addConstraints:", v17);

  }
  return v5;
}

- (UIView)passThroughView
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeOverlayController delegate](self, "delegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "passThroughView"));

  return (UIView *)v3;
}

- (ChromeOverlayControllerDelegate)delegate
{
  return (ChromeOverlayControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIView)parentView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_parentView);
}

- (void)setParentView:(id)a3
{
  objc_storeWeak((id *)&self->_parentView, a3);
}

- (UIViewController)containingViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_containingViewController);
}

- (void)setContainingViewController:(id)a3
{
  objc_storeWeak((id *)&self->_containingViewController, a3);
}

- (UILayoutGuide)contentLayoutGuide
{
  return self->_contentLayoutGuide;
}

- (void)setContentLayoutGuide:(id)a3
{
  objc_storeStrong((id *)&self->_contentLayoutGuide, a3);
}

- (UILayoutGuide)mapInsetsLayoutGuide
{
  return self->_mapInsetsLayoutGuide;
}

- (void)setMapInsetsLayoutGuide:(id)a3
{
  objc_storeStrong((id *)&self->_mapInsetsLayoutGuide, a3);
}

- (UILayoutGuide)viewportLayoutGuide
{
  return self->_viewportLayoutGuide;
}

- (void)setViewportLayoutGuide:(id)a3
{
  objc_storeStrong((id *)&self->_viewportLayoutGuide, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewportLayoutGuide, 0);
  objc_storeStrong((id *)&self->_mapInsetsLayoutGuide, 0);
  objc_storeStrong((id *)&self->_contentLayoutGuide, 0);
  objc_destroyWeak((id *)&self->_containingViewController);
  objc_destroyWeak((id *)&self->_parentView);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_collisionGuidesByEdge, 0);
  objc_storeStrong((id *)&self->_overlays, 0);
  objc_storeStrong((id *)&self->_passThroughView, 0);
  objc_storeStrong((id *)&self->_layoutGuidesByOverlay, 0);
  objc_storeStrong((id *)&self->_collisionConstraintsByOverlay, 0);
  objc_storeStrong((id *)&self->_viewportConstraintsByOverlay, 0);
  objc_storeStrong((id *)&self->_mapInsetsConstraintsByOverlay, 0);
  objc_storeStrong((id *)&self->_showingConstraintsByOverlay, 0);
  objc_storeStrong((id *)&self->_hidingConstraintsByOverlay, 0);
}

@end
