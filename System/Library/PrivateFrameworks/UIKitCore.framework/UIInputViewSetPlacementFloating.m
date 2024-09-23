@implementation UIInputViewSetPlacementFloating

- (void)_geometryChanged:(id *)a3 forAncestor:(id)a4
{
  UIView **p_responderToFollow;
  id v7;
  id WeakRetained;
  _QWORD *v9;
  id v10;

  p_responderToFollow = &self->_responderToFollow;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_responderToFollow);

  if (WeakRetained != v7)
  {
    if ((a3->var0 & 0x80) != 0)
    {
      -[UIInputViewSetPlacement delegate](self, "delegate");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "placementNeedsUpdate:", self);

    }
    else
    {
      v9 = objc_loadWeakRetained((id *)p_responderToFollow);
      -[UIView _removeGeometryChangeObserver:](v9, self);

      objc_storeWeak((id *)p_responderToFollow, 0);
    }
  }
}

- (void)checkSizeForOwner:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double width;
  double height;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  uint64_t v27;
  double v28;
  double v29;
  id WeakRetained;
  double v31;
  double v32;
  _QWORD *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "hostView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;
  width = self->_lastSize.width;
  height = self->_lastSize.height;

  if (width != v7 || height != v9)
    goto LABEL_21;
  v14 = *MEMORY[0x1E0C9D538];
  v13 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  objc_msgSend(v4, "containerView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bounds");
  v17 = v16;
  v19 = v18;

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  objc_msgSend(v4, "applicator", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraints");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v36 != v24)
          objc_enumerationMutation(v21);
        v26 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        v27 = objc_msgSend(v26, "firstAttribute");
        if (v27 == 4)
        {
          objc_msgSend(v26, "constant");
          v13 = -v29 / v19;
        }
        else if (v27 == 1)
        {
          objc_msgSend(v26, "constant");
          v14 = v28 / v17;
        }
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v23);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_responderToFollow);
  if (!WeakRetained)
  {
    -[UIInputViewSetPlacementUndocked setNormalizedOffset:](self, "setNormalizedOffset:", v14, v13);
    goto LABEL_23;
  }
  -[UIInputViewSetPlacementUndocked normalizedOffset](self, "normalizedOffset");
  if (v32 != v14 || v31 != v13)
  {
    v33 = objc_loadWeakRetained((id *)&self->_responderToFollow);
    -[UIView _removeGeometryChangeObserver:](v33, self);

    objc_storeWeak((id *)&self->_responderToFollow, 0);
    -[UIInputViewSetPlacementUndocked setNormalizedOffset:](self, "setNormalizedOffset:", v14, v13);
LABEL_21:
    -[UIInputViewSetPlacement delegate](self, "delegate");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "placementNeedsUpdate:", self);

  }
LABEL_23:

}

- (Class)applicatorClassForKeyboard:(BOOL)a3
{
  return (Class)objc_opt_class();
}

- (void)setDelegate:(id)a3
{
  id v4;
  id WeakRetained;
  _QWORD *v6;
  void *v7;
  _QWORD *v8;
  objc_super v9;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_responderToFollow);

  if (WeakRetained)
  {
    v6 = objc_loadWeakRetained((id *)&self->_responderToFollow);
    -[UIView _removeGeometryChangeObserver:](v6, self);

    objc_storeWeak((id *)&self->_responderToFollow, 0);
  }
  v9.receiver = self;
  v9.super_class = (Class)UIInputViewSetPlacementFloating;
  -[UIInputViewSetPlacement setDelegate:](&v9, sel_setDelegate_, v4);
  if (v4)
  {
    -[UIInputViewSetPlacementFloating currentResponderView](self, "currentResponderView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&self->_responderToFollow, v7);

    v8 = objc_loadWeakRetained((id *)&self->_responderToFollow);
    -[UIView _addGeometryChangeObserver:](v8, self);

  }
}

- (id)currentResponderView
{
  return 0;
}

- (id)applicatorInfoForOwner:(id)a3
{
  id v4;
  id WeakRetained;
  _QWORD *v6;
  _QWORD *v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  _QWORD *v12;
  _QWORD *v13;
  id v14;
  id v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  id v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  double v49;
  double v50;
  double v51;
  double v52;
  void *v53;
  double v54;
  double v55;
  void *v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  void *v65;
  void *v66;
  CGSize *p_lastSize;
  void *v68;
  CGFloat v69;
  CGFloat v70;
  double v72;
  objc_super v73;
  _QWORD v74[4];
  id v75;

  v4 = a3;
  if (objc_msgSend(v4, "keyboardController"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_responderToFollow);

    if (WeakRetained)
    {
      -[UIInputViewSetPlacementFloating currentResponderView](self, "currentResponderView");
      v6 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6)
      {
        objc_msgSend(v6, "bounds");
        objc_msgSend(v7, "_convertViewPointToSceneSpaceForKeyboard:");
        self->_responderRect.origin.x = v8;
        self->_responderRect.origin.y = v9;
        self->_responderRect.size.width = v10;
        self->_responderRect.size.height = v11;
        v12 = objc_loadWeakRetained((id *)&self->_responderToFollow);

        if (v12 != v7)
        {
          v13 = objc_loadWeakRetained((id *)&self->_responderToFollow);
          -[UIView _removeGeometryChangeObserver:](v13, self);

          v14 = objc_storeWeak((id *)&self->_responderToFollow, v7);
          -[UIView _addGeometryChangeObserver:](v7, self);

        }
      }

    }
  }
  v74[0] = MEMORY[0x1E0C809B0];
  v74[1] = 3221225472;
  v74[2] = __58__UIInputViewSetPlacementFloating_applicatorInfoForOwner___block_invoke;
  v74[3] = &unk_1E16B1B28;
  v15 = v4;
  v75 = v15;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v74);
  objc_msgSend(v15, "containerView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "frame");
  v18 = v17;
  v20 = v19;

  if (objc_msgSend(v15, "keyboardController")
    && (v21 = objc_loadWeakRetained((id *)&self->_responderToFollow), v21, v21))
  {
    objc_msgSend(v15, "containerView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "layer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "convertRect:fromLayer:", 0, self->_responderRect.origin.x, self->_responderRect.origin.y, self->_responderRect.size.width, self->_responderRect.size.height);
    v25 = v24;
    v27 = v26;
    v29 = v28;
    v31 = v30;

    v32 = (void *)MEMORY[0x1E0C99E08];
    objc_msgSend(v15, "hostView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "bounds");
    +[UIKeyboardPopoverContainer propertiesForTargetRect:withHeight:onScreenSize:](UIKeyboardPopoverContainer, "propertiesForTargetRect:withHeight:onScreenSize:", v25, v27, v29, v31, v34, v18, v20);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "dictionaryWithDictionary:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v36, "objectForKey:", _UIKeyboardPopoverKeyboardRect);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "rectValue");
    v39 = v38;
    v41 = v40;
    v43 = v42;

    v44 = v41 + v43 - v20;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPoint:", v39, v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setObject:forKey:", v45, CFSTR("Origin"));

    -[UIInputViewSetPlacementUndocked setNormalizedOffset:](self, "setNormalizedOffset:", v39 / v18, -v44 / v20);
  }
  else
  {
    v46 = (void *)MEMORY[0x1E0C99E08];
    v73.receiver = self;
    v73.super_class = (Class)UIInputViewSetPlacementFloating;
    -[UIInputViewSetPlacementUndocked applicatorInfoForOwner:](&v73, sel_applicatorInfoForOwner_, v15, *(_QWORD *)&v20);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "dictionaryWithDictionary:", v47);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "applicator");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "contentInsets");
    v50 = v49;
    v52 = v51;

    objc_msgSend(v36, "objectForKey:", CFSTR("Origin"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "CGPointValue");
    v55 = v54;

    objc_msgSend(v15, "hostView");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "bounds");
    v58 = v57;

    +[UIKeyboardImpl floatingWidth](UIKeyboardImpl, "floatingWidth");
    v60 = v59;
    v61 = 0.0;
    v62 = 0.0;
    if (v18 > 0.0)
    {
      v61 = (v18 - v52 - v59) / v18;
      v62 = v50 / v18;
    }
    -[UIInputViewSetPlacementUndocked normalizedOffset](self, "normalizedOffset");
    if (v63 >= v61)
      v63 = v61;
    if (v63 < v62)
      v63 = v62;
    v64 = v18 * v63;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v18 * v63, v55);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setObject:forKey:", v65, CFSTR("Origin"));

    +[UIKeyboardPopoverContainer propertiesForSpecificKeyboardFrame:onScreenSize:](UIKeyboardPopoverContainer, "propertiesForSpecificKeyboardFrame:onScreenSize:", v64, v55, v60, v58, v18, v72);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "addEntriesFromDictionary:", v66);

  }
  p_lastSize = &self->_lastSize;
  objc_msgSend(v15, "hostView");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "frame");
  p_lastSize->width = v69;
  p_lastSize->height = v70;

  return v36;
}

void __58__UIInputViewSetPlacementFloating_applicatorInfoForOwner___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "hostView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "layoutIfNeeded");

}

- (void)dealloc
{
  UIView **p_responderToFollow;
  id WeakRetained;
  _QWORD *v5;
  objc_super v6;

  p_responderToFollow = &self->_responderToFollow;
  WeakRetained = objc_loadWeakRetained((id *)&self->_responderToFollow);

  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)p_responderToFollow);
    -[UIView _removeGeometryChangeObserver:](v5, self);

    objc_storeWeak((id *)p_responderToFollow, 0);
  }
  v6.receiver = self;
  v6.super_class = (Class)UIInputViewSetPlacementFloating;
  -[UIInputViewSetPlacementFloating dealloc](&v6, sel_dealloc);
}

+ (id)placementWithUndockedOffset:(CGPoint)a3 chromeBuffer:(UIEdgeInsets)a4 floatingWidth:(double)a5
{
  void *v6;

  objc_msgSend(a1, "placementWithUndockedOffset:chromeBuffer:", a3.x, a3.y, a4.top, a4.left, a4.bottom, a4.right);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFloatingWidth:", a5);
  return v6;
}

+ (CGRect)frameAtOffset:(CGPoint)a3 keyboardSize:(CGSize)a4 screenSize:(CGSize)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  +[UIKeyboardPopoverContainer frameAtOffset:keyboardSize:screenSize:](UIKeyboardPopoverContainer, "frameAtOffset:keyboardSize:screenSize:", a3.x, a3.y, a4.width, a4.height, a5.width, a5.height);
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (UIInputViewSetPlacementFloating)initWithCoder:(id)a3
{
  id v4;
  UIInputViewSetPlacementFloating *v5;
  double v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UIInputViewSetPlacementFloating;
  v5 = -[UIInputViewSetPlacementUndocked initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("FloatingWidth"));
    v5->_floatingWidth = v6;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIInputViewSetPlacementFloating;
  v4 = a3;
  -[UIInputViewSetPlacementUndocked encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("FloatingWidth"), self->_floatingWidth, v5.receiver, v5.super_class);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)updateChromeBuffer
{
  +[UIPeripheralHost floatingChromeBuffer](UIPeripheralHost, "floatingChromeBuffer");
  -[UIInputViewSetPlacementUndocked setChromeBuffer:](self, "setChromeBuffer:");
}

- (id)horizontalConstraintForInputViewSet:(id)a3 hostView:(id)a4 containerView:(id)a5
{
  id v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;

  v7 = a5;
  if (a4)
  {
    v8 = a4;
    +[UIKeyboardImpl floatingWidth](UIKeyboardImpl, "floatingWidth");
    v10 = v9;
    objc_msgSend(v7, "bounds");
    v12 = v11;
    v13 = 0.0;
    if (v11 > 0.0)
      v13 = (v11 - v10) / v11;
    -[UIInputViewSetPlacementUndocked normalizedOffset](self, "normalizedOffset");
    if (v14 >= v13)
      v14 = v13;
    objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v8, 1, 0, v7, 1, 1.0, v12 * v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)widthConstraintForInputViewSet:(id)a3 hostView:(id)a4 containerView:(id)a5
{
  if (!a4)
    return 0;
  objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", a4, 7, 0, 0, 0, 1.0, self->_floatingWidth);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isEqual:(id)a3
{
  id *v4;
  id WeakRetained;
  id v6;
  BOOL v7;
  objc_super v9;

  v4 = (id *)a3;
  v9.receiver = self;
  v9.super_class = (Class)UIInputViewSetPlacementFloating;
  if (-[UIInputViewSetPlacementUndocked isEqual:](&v9, sel_isEqual_, v4)
    && *((double *)v4 + 11) == self->_floatingWidth)
  {
    WeakRetained = objc_loadWeakRetained(v4 + 12);
    v6 = objc_loadWeakRetained((id *)&self->_responderToFollow);
    v7 = WeakRetained == v6;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)infoWithPoint:(CGPoint)a3 forOwner:(id)a4
{
  double y;
  double x;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;

  y = a3.y;
  x = a3.x;
  v6 = (void *)MEMORY[0x1E0C99E08];
  v7 = a4;
  +[UIInputViewSetPlacementUndocked infoWithPoint:](UIInputViewSetPlacementUndocked, "infoWithPoint:", x, y);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryWithDictionary:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "containerView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  v12 = v11;
  v14 = v13;

  objc_msgSend(v7, "hostView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "frame");
  v17 = v16;
  v19 = v18;

  +[UIKeyboardPopoverContainer propertiesForSpecificKeyboardFrame:onScreenSize:](UIKeyboardPopoverContainer, "propertiesForSpecificKeyboardFrame:onScreenSize:", x, y, v17, v19, v12, v14);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addEntriesFromDictionary:", v20);

  return v9;
}

- (void)setSubPlacements:(id)a3
{
  NSArray *v4;
  NSArray *subPlacements;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  subPlacements = self->_subPlacements;
  self->_subPlacements = v4;

}

- (id)subPlacements
{
  NSArray *subPlacements;
  UIInputViewSetPlacementOnScreen *cachedSecondaryPlacement;
  UIInputViewSetPlacementOnScreen *v6;
  UIInputViewSetPlacementOnScreen *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  subPlacements = self->_subPlacements;
  if (subPlacements)
    return subPlacements;
  cachedSecondaryPlacement = self->_cachedSecondaryPlacement;
  if (!cachedSecondaryPlacement)
  {
    +[UIInputViewSetPlacement placement](UIInputViewSetPlacementOnScreen, "placement");
    v6 = (UIInputViewSetPlacementOnScreen *)objc_claimAutoreleasedReturnValue();
    v7 = self->_cachedSecondaryPlacement;
    self->_cachedSecondaryPlacement = v6;

    cachedSecondaryPlacement = self->_cachedSecondaryPlacement;
  }
  v8[0] = cachedSecondaryPlacement;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)indexForPurpose:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  unint64_t result;

  result = 0;
  if ((uint64_t)a3 <= 3)
  {
    if (a3 < 4)
      return result;
    return 1;
  }
  if ((uint64_t)a3 > 100)
  {
    if (a3 == 102)
      return -[NSArray count](self->_subPlacements, "count", v3, v4) != 0;
    return 1;
  }
  if (a3 != 100)
    return 1;
  return result;
}

- (id)expiringPlacement
{
  UIInputViewSetPlacementFloating *v3;

  if (-[UIInputViewSetPlacement isVisible](self, "isVisible"))
  {
    +[UIInputViewSetPlacementInvisible placementWithPlacement:](UIInputViewSetPlacementInvisible, "placementWithPlacement:", self);
    v3 = (UIInputViewSetPlacementFloating *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = self;
  }
  return v3;
}

- (CGRect)adjustBoundsForNotificationsWithOwner:(id)a3
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  objc_super v31;
  CGRect result;

  v31.receiver = self;
  v31.super_class = (Class)UIInputViewSetPlacementFloating;
  v3 = a3;
  -[UIInputViewSetPlacement adjustBoundsForNotificationsWithOwner:](&v31, sel_adjustBoundsForNotificationsWithOwner_, v3);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(v3, "containerView", v31.receiver, v31.super_class);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "frame");
  v14 = v13;
  v16 = v15;

  +[UIKeyboardPopoverContainer propertiesForSpecificKeyboardFrame:onScreenSize:](UIKeyboardPopoverContainer, "propertiesForSpecificKeyboardFrame:onScreenSize:", v5, v7, v9, v11, v14, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("PopoverRect"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "CGRectValue");
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;

  v27 = v20;
  v28 = v11 + v22 - v16;
  v29 = v24;
  v30 = v26;
  result.size.height = v30;
  result.size.width = v29;
  result.origin.y = v28;
  result.origin.x = v27;
  return result;
}

- (CGRect)remoteIntrinsicContentSizeForInputViewInSet:(id)a3 includingIAV:(BOOL)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  objc_super v17;
  CGRect result;

  v17.receiver = self;
  v17.super_class = (Class)UIInputViewSetPlacementFloating;
  -[UIInputViewSetPlacementUndocked remoteIntrinsicContentSizeForInputViewInSet:includingIAV:](&v17, sel_remoteIntrinsicContentSizeForInputViewInSet_includingIAV_, a3, a4);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  +[UIKeyboardImpl floatingWidth](UIKeyboardImpl, "floatingWidth");
  if (v9 <= v12)
    v13 = v7;
  else
    v13 = 0.0;
  v14 = v5;
  v15 = v9;
  v16 = v11;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v13;
  result.origin.x = v14;
  return result;
}

- (BOOL)showsEditItems
{
  return 0;
}

- (BOOL)isFloating
{
  return 1;
}

- (id)assistantView
{
  return -[NSArray firstObject](self->_subPlacements, "firstObject");
}

- (BOOL)isFloatingAssistantView
{
  return -[NSArray count](self->_subPlacements, "count") != 0;
}

- (BOOL)accessoryViewWillAppear
{
  return 1;
}

- (UIResponder)responderToFollow
{
  return (UIResponder *)objc_loadWeakRetained((id *)&self->_responderToFollow);
}

- (void)setResponderToFollow:(id)a3
{
  objc_storeWeak((id *)&self->_responderToFollow, a3);
}

- (double)floatingWidth
{
  return self->_floatingWidth;
}

- (void)setFloatingWidth:(double)a3
{
  self->_floatingWidth = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subPlacements, 0);
  objc_storeStrong((id *)&self->_cachedSecondaryPlacement, 0);
  objc_destroyWeak((id *)&self->_responderToFollow);
}

@end
