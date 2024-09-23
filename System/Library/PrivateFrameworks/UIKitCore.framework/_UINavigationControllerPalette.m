@implementation _UINavigationControllerPalette

- (UIEdgeInsets)preferredContentInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_preferredContentInsets.top;
  left = self->_preferredContentInsets.left;
  bottom = self->_preferredContentInsets.bottom;
  right = self->_preferredContentInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (BOOL)isAttached
{
  return *(_BYTE *)&self->_paletteFlags & 1;
}

- (BOOL)isVisibleWhenPinningBarIsHidden
{
  return self->_visibleWhenPinningBarIsHidden;
}

- (BOOL)_attachmentIsChanging
{
  return (*(_BYTE *)&self->_paletteFlags >> 1) & 1;
}

- (BOOL)paletteIsHidden
{
  return (*(_BYTE *)&self->_paletteFlags & 1) != 0 && -[UIView superview](self, "superview") == 0;
}

- (void)_updateBackgroundConstraintsIfNecessary
{
  NSArray *backgroundConstraints;
  id v4;
  id v5;
  double v6;
  double v7;
  double backgroundUnderlapHeight;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  backgroundConstraints = self->__backgroundConstraints;
  if (backgroundConstraints)
  {
    v4 = -[NSArray objectAtIndex:](backgroundConstraints, "objectAtIndex:", 1);
    v5 = -[NSArray objectAtIndex:](self->__backgroundConstraints, "objectAtIndex:", 3);
    if (self->__palettePinningBarHidden && -[_UINavigationControllerPalette isAttached](self, "isAttached"))
    {
      v6 = 0.0;
      if (-[UINavigationController _viewControllerUnderlapsStatusBar](self->_navController, "_viewControllerUnderlapsStatusBar"))
      {
        -[UINavigationController _statusBarHeightForCurrentInterfaceOrientation](self->_navController, "_statusBarHeightForCurrentInterfaceOrientation");
        v6 = v7;
      }
      backgroundUnderlapHeight = self->_backgroundUnderlapHeight;
      if (v6 != backgroundUnderlapHeight)
      {
        v9 = v6 - backgroundUnderlapHeight;
        objc_msgSend(v4, "constant");
        objc_msgSend(v4, "setConstant:", v10 - v9);
        objc_msgSend(v5, "constant");
        objc_msgSend(v5, "setConstant:", v9 + v11);
        self->_backgroundUnderlapHeight = v6;
      }
    }
    else if (self->_backgroundUnderlapHeight != 0.0)
    {
      objc_msgSend(v4, "constant");
      objc_msgSend(v4, "setConstant:", v12 + self->_backgroundUnderlapHeight);
      objc_msgSend(v5, "constant");
      objc_msgSend(v5, "setConstant:", v13 - self->_backgroundUnderlapHeight);
      self->_backgroundUnderlapHeight = 0.0;
    }
  }
}

- (void)_setTopConstraintConstant:(double)a3
{
  NSArray *constraints;
  unint64_t boundaryEdge;
  id v8;
  double v9;

  constraints = self->__constraints;
  if (constraints)
  {
    boundaryEdge = self->_boundaryEdge;
    if (boundaryEdge == 5 || boundaryEdge == 2)
    {
      v8 = -[NSArray objectAtIndex:](constraints, "objectAtIndex:", 1);
      objc_msgSend(v8, "constant");
      if (v9 != a3)
        objc_msgSend(v8, "setConstant:", a3);
    }
  }
}

- (void)_setPalettePinningBarHidden:(BOOL)a3
{
  self->__palettePinningBarHidden = a3;
  -[_UINavigationControllerPalette _updateBackgroundConstraintsIfNecessary](self, "_updateBackgroundConstraintsIfNecessary");
}

- (BOOL)paletteShadowIsHidden
{
  if ((*(_BYTE *)&self->_paletteFlags & 0x20) != 0)
    return 1;
  else
    return objc_msgSend(-[_UINavigationControllerPalette _attachedPinningTopBar](self, "_attachedPinningTopBar"), "_hidesShadow");
}

- (BOOL)_supportsSpecialSearchBarTransitions
{
  return 0;
}

- (BOOL)_paletteOverridesPinningBar
{
  return self->__paletteOverridesPinningBar;
}

- (id)_backgroundViewLayout
{
  return self->_backgroundViewLayout;
}

- (id)_attachedPinningTopBar
{
  if (-[_UINavigationControllerPalette isAttached](self, "isAttached")
    && -[_UINavigationControllerPalette boundaryEdge](self, "boundaryEdge") == 2)
  {
    return self->__pinningBar;
  }
  else
  {
    return 0;
  }
}

- (unint64_t)boundaryEdge
{
  return self->_boundaryEdge;
}

- (UIView)_backgroundView
{
  UIView *result;

  -[_UINavigationControllerPalette _setupBackgroundViewIfNecessary](self, "_setupBackgroundViewIfNecessary");
  result = -[_UIBarBackground customBackgroundView](self->_backgroundView, "customBackgroundView");
  if (!result)
    return &self->_backgroundView->super;
  return result;
}

- (void)_setupBackgroundViewIfNecessary
{
  void *v3;

  if (self->_boundaryEdge != 5 && !self->_backgroundView)
  {
    v3 = (void *)objc_msgSend(self->__pinningBar, "_backgroundViewForPalette:", self);
    self->_backgroundViewLayout = (_UIBarBackgroundLayoutLegacy *)objc_msgSend(v3, "layout");
    -[UIView bounds](self, "bounds");
    objc_msgSend(v3, "setFrame:");
    -[UIView insertSubview:atIndex:](self, "insertSubview:atIndex:", v3, 0);
    -[_UINavigationControllerPalette _configureConstraintsForBackground:](self, "_configureConstraintsForBackground:", v3);
    self->_backgroundView = (_UIBarBackground *)v3;
  }
}

- (void)_setAttached:(BOOL)a3 didComplete:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  char paletteFlags;
  char v8;
  char v9;

  v4 = a4;
  v5 = a3;
  paletteFlags = (char)self->_paletteFlags;
  if (a4)
    v8 = 0;
  else
    v8 = 2;
  *(_BYTE *)&self->_paletteFlags = v8 | a3 | paletteFlags & 0xFC;
  if (a3 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    if (objc_msgSend(self->__pinningBar, "_hidesShadow"))
      v9 = 64;
    else
      v9 = 0;
    *(_BYTE *)&self->_paletteFlags = *(_BYTE *)&self->_paletteFlags & 0xBF | v9;
  }
  if (v4 || ((paletteFlags & 1) == 0) == v5)
  {
    if (!v5)
      self->__unpinnedController = 0;
    objc_msgSend(self->__pinningBar, "_palette:isAttaching:didComplete:", self, v5, v4);
  }
}

- (void)setPinned:(BOOL)a3
{
  char v4;

  if (a3)
  {
    self->__unpinnedController = 0;
    v4 = *(_BYTE *)&self->_paletteFlags | 8;
  }
  else
  {
    self->__unpinnedController = -[UINavigationController topViewController](self->_navController, "topViewController");
    v4 = *(_BYTE *)&self->_paletteFlags & 0xF7;
  }
  *(_BYTE *)&self->_paletteFlags = v4;
}

- (BOOL)_restartPaletteTransitionIfNecessary
{
  return (*(_BYTE *)&self->_paletteFlags >> 2) & 1;
}

- (void)_resetConstraintConstants:(double)a3
{
  NSArray *constraints;
  uint64_t v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  double width;
  uint64_t v14;
  NSArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  double height;
  uint64_t v22;
  NSArray *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t k;
  void *v28;
  double v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  constraints = self->__constraints;
  if (constraints)
  {
    switch(self->_boundaryEdge)
    {
      case 1uLL:
      case 3uLL:
        v6 = -[NSArray objectAtIndex:](constraints, "objectAtIndex:", 2);
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        v37 = 0u;
        v7 = self->__constraints;
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v35;
          do
          {
            for (i = 0; i != v9; ++i)
            {
              if (*(_QWORD *)v35 != v10)
                objc_enumerationMutation(v7);
              v12 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
              if (v12 == (void *)v6)
              {
                width = self->__size.width;
                v12 = (void *)v6;
              }
              else
              {
                width = 0.0;
              }
              objc_msgSend(v12, "setConstant:", width);
            }
            v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
          }
          while (v9);
        }
        break;
      case 2uLL:
      case 4uLL:
        v14 = -[NSArray objectAtIndex:](constraints, "objectAtIndex:", 3);
        v38 = 0u;
        v39 = 0u;
        v40 = 0u;
        v41 = 0u;
        v15 = self->__constraints;
        v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v39;
          do
          {
            for (j = 0; j != v17; ++j)
            {
              if (*(_QWORD *)v39 != v18)
                objc_enumerationMutation(v15);
              v20 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * j);
              if (v20 == (void *)v14)
              {
                height = self->__size.height;
                v20 = (void *)v14;
              }
              else
              {
                height = 0.0;
              }
              objc_msgSend(v20, "setConstant:", height);
            }
            v17 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
          }
          while (v17);
        }
        break;
      case 5uLL:
        v22 = -[NSArray objectAtIndex:](constraints, "objectAtIndex:", 3);
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        v23 = self->__constraints;
        v24 = -[NSArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
        if (v24)
        {
          v25 = v24;
          v26 = *(_QWORD *)v31;
          do
          {
            for (k = 0; k != v25; ++k)
            {
              if (*(_QWORD *)v31 != v26)
                objc_enumerationMutation(v23);
              v28 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * k);
              if (v28 == (void *)v22)
              {
                v29 = self->__size.height;
                v28 = (void *)v22;
              }
              else
              {
                v29 = 0.0;
              }
              objc_msgSend(v28, "setConstant:", v29);
            }
            v25 = -[NSArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
          }
          while (v25);
        }
        break;
      default:
        break;
    }
  }
  if (a3 != 0.0)
    -[_UINavigationControllerPalette _setTopConstraintConstant:](self, "_setTopConstraintConstant:", a3);
}

- (void)setPreferredContentInsets:(UIEdgeInsets)a3
{
  self->_preferredContentInsets = a3;
}

- (NSArray)_constraints
{
  return self->__constraints;
}

- (BOOL)isPinned
{
  return (*(_BYTE *)&self->_paletteFlags >> 3) & 1;
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[_UINavigationControllerPalette _setSize:](self, "_setSize:", a3.size.width, a3.size.height);
  v8.receiver = self;
  v8.super_class = (Class)_UINavigationControllerPalette;
  -[UIView setFrame:](&v8, sel_setFrame_, x, y, width, height);
  if (-[UIView window](self, "window"))
    -[UIView layoutBelowIfNeeded](self, "layoutBelowIfNeeded");
}

- (void)_setSize:(CGSize)a3
{
  double height;

  height = self->__size.height;
  self->__size = a3;
  if (height != a3.height)
    -[_UINavigationControllerPalette _resetHeightConstraintConstant](self, "_resetHeightConstraintConstant");
}

- (void)_setPinningBar:(id)a3
{
  self->__pinningBar = a3;
}

- (void)_resetHeightConstraintConstant
{
  NSArray *constraints;
  unint64_t boundaryEdge;
  id v6;
  CGSize *p_size;
  double height;
  double v9;

  constraints = self->__constraints;
  if (constraints)
  {
    boundaryEdge = self->_boundaryEdge;
    if (boundaryEdge == 5 || boundaryEdge == 2)
    {
      v6 = -[NSArray objectAtIndex:](constraints, "objectAtIndex:", 3);
      p_size = &self->__size;
      height = p_size->height;
      objc_msgSend(v6, "constant");
      if (height != v9)
        objc_msgSend(v6, "setConstant:", p_size->height);
    }
  }
}

- (id)_initWithNavigationController:(id)a3 forEdge:(unint64_t)a4
{
  id result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UINavigationControllerPalette;
  result = -[UIView initWithFrame:](&v7, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (result)
  {
    *((_QWORD *)result + 57) = a3;
    *((_QWORD *)result + 56) = a4;
    *((_BYTE *)result + 440) |= 0x18u;
    *((_OWORD *)result + 32) = 0u;
    *((_OWORD *)result + 33) = 0u;
  }
  return result;
}

- (void)_configureConstraintsForBackground:(id)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[5];

  v15[4] = *MEMORY[0x1E0C80C00];
  if (self->_boundaryEdge != 5 && a3 && !self->_backgroundView)
  {
    -[UIView bounds](self, "bounds");
    v6 = v5;
    v8 = v7;
    -[UIView _visualAltitudeSensitiveBoundsWithInfiniteEdges:](self, "_visualAltitudeSensitiveBoundsWithInfiniteEdges:", 10);
    v10 = v9;
    v12 = objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", a3, 1, 0, self, 1, 1.0, v11 - v6);
    v13 = objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", a3, 7, 0, self, 7, 1.0, v10 - v8);
    v14 = objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", a3, 8, 0, self, 8, 1.0, 0.0);
    v15[0] = v12;
    v15[1] = objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", a3, 3, 0, self, 3, 1.0, 0.0);
    v15[2] = v13;
    v15[3] = v14;
    -[_UINavigationControllerPalette _setBackgroundConstraints:](self, "_setBackgroundConstraints:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 4));
    objc_msgSend(a3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView addConstraints:](self, "addConstraints:", self->__backgroundConstraints);
  }
}

- (void)_setBackgroundConstraints:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 488);
}

- (void)didMoveToSuperview
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UINavigationControllerPalette;
  -[UIView didMoveToSuperview](&v3, sel_didMoveToSuperview);
  -[_UINavigationControllerPalette _setupBackgroundViewIfNecessary](self, "_setupBackgroundViewIfNecessary");
  if (-[UIView superview](self, "superview"))
  {
    if (self->__pinningBar)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(self->__pinningBar, "_setShadowAlpha:", (double)(-[_UINavigationControllerPalette pinningBarShadowIsHidden](self, "pinningBarShadowIsHidden") ^ 1));
    }
    -[_UINavigationControllerPalette _configurePaletteConstraintsForBoundary](self, "_configurePaletteConstraintsForBoundary");
  }
}

- (BOOL)pinningBarShadowIsHidden
{
  return (*(_BYTE *)&self->_paletteFlags >> 4) & 1;
}

- (void)_configurePaletteConstraintsForBoundary
{
  unint64_t boundaryEdge;
  void *v4;
  NSArray *v5;
  uint64_t v6;
  void *v7;
  id v8;
  UINavigationBar *v9;
  NSArray *constraints;
  double height;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  unint64_t v16;
  NSObject *v17;
  NSArray *v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  NSArray *v23;
  _QWORD v24[4];
  _QWORD v25[4];
  uint8_t buf[4];
  NSArray *v27;
  _QWORD v28[4];

  v28[3] = *MEMORY[0x1E0C80C00];
  boundaryEdge = self->_boundaryEdge;
  if (boundaryEdge == 5)
  {
    v9 = -[UINavigationController navigationBar](self->_navController, "navigationBar");
    if (-[UIView superview](v9, "superview") && -[UIView superview](self, "superview"))
    {
      constraints = self->__constraints;
      if (!constraints)
      {
        height = self->__size.height;
        v12 = objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self, 1, 0, v9, 1, 1.0, 0.0);
        v13 = objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self, 7, 0, v9, 7, 1.0, 0.0);
        v14 = objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self, 8, 0, 0, 0, 0.0, height);
        v24[0] = v12;
        v24[1] = objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self, 4, 0, v9, 3, 1.0, 0.0);
        v24[2] = v13;
        v24[3] = v14;
        -[_UINavigationControllerPalette _setConstraints:](self, "_setConstraints:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 4));
        -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        constraints = self->__constraints;
      }
      v15 = (void *)MEMORY[0x1E0D156E0];
      goto LABEL_30;
    }
  }
  else
  {
    if (boundaryEdge != 2)
    {
      -[UIView setAutoresizingMask:](self, "setAutoresizingMask:", 0);
      return;
    }
    v4 = (void *)objc_msgSend(-[UINavigationController _outermostNavigationController](self->_navController, "_outermostNavigationController"), "navigationBar");
    if (objc_msgSend(v4, "superview") && -[UIView superview](self, "superview"))
    {
      v5 = self->__constraints;
      if (!v5)
      {
        v8 = 0;
        goto LABEL_26;
      }
      v6 = -[NSArray count](v5, "count");
      if (v6)
      {
        if (v6 == 4)
        {
          if (v4 != (void *)objc_msgSend(-[NSArray firstObject](self->__constraints, "firstObject"), "secondItem"))
          {
            v7 = (void *)MEMORY[0x1E0D156E0];
            v28[0] = -[NSArray objectAtIndexedSubscript:](self->__constraints, "objectAtIndexedSubscript:", 0);
            v28[1] = -[NSArray objectAtIndexedSubscript:](self->__constraints, "objectAtIndexedSubscript:", 1);
            v28[2] = -[NSArray objectAtIndexedSubscript:](self->__constraints, "objectAtIndexedSubscript:", 2);
            objc_msgSend(v7, "deactivateConstraints:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 3));
            v8 = -[NSArray objectAtIndexedSubscript:](self->__constraints, "objectAtIndexedSubscript:", 3);
            -[_UINavigationControllerPalette _setConstraints:](self, "_setConstraints:", 0);
            goto LABEL_25;
          }
LABEL_24:
          v8 = 0;
LABEL_25:
          constraints = self->__constraints;
          if (constraints)
          {
LABEL_29:
            v15 = (void *)MEMORY[0x1E0D156E0];
LABEL_30:
            objc_msgSend(v15, "activateConstraints:", constraints);
            return;
          }
LABEL_26:
          v19 = self->__size.height;
          v20 = objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self, 1, 0, v4, 1, 1.0, 0.0);
          v21 = objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self, 7, 0, v4, 7, 1.0, 0.0);
          if (!v8)
            v8 = (id)objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self, 8, 0, 0, 0, 0.0, v19);
          v25[0] = v20;
          v25[1] = objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self, 3, 0, v4, 4, 1.0, 0.0);
          v25[2] = v21;
          v25[3] = v8;
          -[_UINavigationControllerPalette _setConstraints:](self, "_setConstraints:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 4));
          -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
          constraints = self->__constraints;
          goto LABEL_29;
        }
        if (os_variant_has_internal_diagnostics())
        {
          v22 = __UIFaultDebugAssertLog();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
          {
            v23 = self->__constraints;
            *(_DWORD *)buf = 138412290;
            v27 = v23;
            _os_log_fault_impl(&dword_185066000, v22, OS_LOG_TYPE_FAULT, "If we have a constraints array, we should have exactly 4 constraints, but we have: %@", buf, 0xCu);
          }
        }
        else
        {
          v16 = _configurePaletteConstraintsForBoundary___s_category;
          if (!_configurePaletteConstraintsForBoundary___s_category)
          {
            v16 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v16, (unint64_t *)&_configurePaletteConstraintsForBoundary___s_category);
          }
          v17 = *(NSObject **)(v16 + 8);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            v18 = self->__constraints;
            *(_DWORD *)buf = 138412290;
            v27 = v18;
            _os_log_impl(&dword_185066000, v17, OS_LOG_TYPE_ERROR, "If we have a constraints array, we should have exactly 4 constraints, but we have: %@", buf, 0xCu);
          }
        }
        objc_msgSend(MEMORY[0x1E0D156E0], "deactivateConstraints:", self->__constraints);
      }
      -[_UINavigationControllerPalette _setConstraints:](self, "_setConstraints:", 0);
      goto LABEL_24;
    }
  }
}

- (void)_setConstraints:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 480);
}

- (void)dealloc
{
  _UIBarBackground *backgroundView;
  NSArray *constraints;
  NSArray *backgroundConstraints;
  objc_super v6;

  backgroundView = self->_backgroundView;
  if (backgroundView)

  constraints = self->__constraints;
  if (constraints)

  backgroundConstraints = self->__backgroundConstraints;
  if (backgroundConstraints)

  v6.receiver = self;
  v6.super_class = (Class)_UINavigationControllerPalette;
  -[UIView dealloc](&v6, sel_dealloc);
}

- (void)_setAttachmentIsChanging:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_paletteFlags = *(_BYTE *)&self->_paletteFlags & 0xFD | v3;
}

- (void)_setRestartPaletteTransitionIfNecessary:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_paletteFlags = *(_BYTE *)&self->_paletteFlags & 0xFB | v3;
}

- (void)setPinningBarShadowIsHidden:(BOOL)a3
{
  _BOOL4 v3;
  char v5;

  v3 = a3;
  if (-[_UINavigationControllerPalette pinningBarShadowIsHidden](self, "pinningBarShadowIsHidden") != a3)
  {
    if (v3)
      v5 = 16;
    else
      v5 = 0;
    *(_BYTE *)&self->_paletteFlags = *(_BYTE *)&self->_paletteFlags & 0xEF | v5;
    if (-[UIView superview](self, "superview") && self->__pinningBar && (objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(self->__pinningBar, "_setShadowAlpha:", (double)(-[_UINavigationControllerPalette pinningBarShadowIsHidden](self, "pinningBarShadowIsHidden") ^ 1));
  }
}

- (BOOL)pinningBarShadowWasHidden
{
  return (*(_BYTE *)&self->_paletteFlags >> 6) & 1;
}

- (void)setPinningBarShadowWasHidden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_paletteFlags = *(_BYTE *)&self->_paletteFlags & 0xBF | v3;
}

- (void)_updateBackgroundView
{
  -[UINavigationBar _updatePaletteBackgroundIfNecessary](-[UINavigationController navigationBar](self->_navController, "navigationBar"), "_updatePaletteBackgroundIfNecessary");
}

- (void)setPaletteShadowIsHidden:(BOOL)a3
{
  _BOOL4 v3;
  char v5;

  v3 = a3;
  if (-[_UINavigationControllerPalette paletteShadowIsHidden](self, "paletteShadowIsHidden") != a3)
  {
    if (v3)
      v5 = 32;
    else
      v5 = 0;
    *(_BYTE *)&self->_paletteFlags = *(_BYTE *)&self->_paletteFlags & 0xDF | v5;
    -[_UINavigationControllerPalette _updateBackgroundView](self, "_updateBackgroundView");
  }
}

- (void)_disableConstraints
{
  if (self->__constraints)
  {
    objc_msgSend(MEMORY[0x1E0D156E0], "deactivateConstraints:");
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self, "setTranslatesAutoresizingMaskIntoConstraints:", 1);
  }
}

- (void)_enableConstraints
{
  if (self->__constraints)
  {
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", self->__constraints);
  }
}

- (void)setFrame:(CGRect)a3 isAnimating:(BOOL)a4
{
  _BOOL4 v4;
  double height;
  double width;
  double y;
  double x;
  int has_internal_diagnostics;
  int v11;
  UINavigationController *navController;
  NSObject *v13;
  unint64_t v14;
  NSObject *v15;
  objc_super v16;
  objc_super v17;
  uint8_t buf[16];

  v4 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  v11 = +[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled") ^ v4;
  if (has_internal_diagnostics)
  {
    if (v11)
    {
      v13 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v13, OS_LOG_TYPE_FAULT, "The isAnimating parameter in the call to setFrame:isInAnimationBlock: is lying", buf, 2u);
      }
    }
  }
  else if (v11)
  {
    v14 = setFrame_isAnimating____s_category;
    if (!setFrame_isAnimating____s_category)
    {
      v14 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v14, (unint64_t *)&setFrame_isAnimating____s_category);
    }
    v15 = *(NSObject **)(v14 + 8);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_185066000, v15, OS_LOG_TYPE_ERROR, "The isAnimating parameter in the call to setFrame:isInAnimationBlock: is lying", buf, 2u);
    }
  }
  -[_UINavigationControllerPalette _setSize:](self, "_setSize:", width, height);
  if (!+[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled")&& -[UIView window](self, "window")&& -[UIView window](-[UINavigationController navigationBar](-[_UINavigationControllerPalette navController](self, "navController"), "navigationBar"), "window"))
  {
    -[_UINavigationControllerPalette _disableConstraints](self, "_disableConstraints");
    v17.receiver = self;
    v17.super_class = (Class)_UINavigationControllerPalette;
    -[UIView setFrame:](&v17, sel_setFrame_, x, y, width, height);
    -[UIView layoutBelowIfNeeded](self, "layoutBelowIfNeeded");
    -[_UINavigationControllerPalette _enableConstraints](self, "_enableConstraints");
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)_UINavigationControllerPalette;
    -[UIView setFrame:](&v16, sel_setFrame_, x, y, width, height);
    -[UIView layoutBelowIfNeeded](self, "layoutBelowIfNeeded");
  }
  -[_UINavigationControllerPalette _resetConstraintConstants:](self, "_resetConstraintConstants:", 0.0);
  if (self->_boundaryEdge == 5)
  {
    navController = self->_navController;
    if (navController)
      -[UINavigationController _updateLayoutForStatusBarAndInterfaceOrientation](navController, "_updateLayoutForStatusBarAndInterfaceOrientation");
  }
}

- (void)_setLeftConstraintConstant:(double)a3
{
  NSArray *constraints;
  unint64_t boundaryEdge;
  id v8;
  double v9;

  constraints = self->__constraints;
  if (constraints)
  {
    boundaryEdge = self->_boundaryEdge;
    if (boundaryEdge == 5 || boundaryEdge == 2)
    {
      v8 = -[NSArray objectAtIndex:](constraints, "objectAtIndex:", 0);
      objc_msgSend(v8, "constant");
      if (v9 != a3)
        objc_msgSend(v8, "setConstant:", a3);
    }
  }
}

- (void)_setBackgroundView:(id)a3
{
  -[_UINavigationControllerPalette _setupBackgroundViewIfNecessary](self, "_setupBackgroundViewIfNecessary");
  -[_UIBarBackground setCustomBackgroundView:](self->_backgroundView, "setCustomBackgroundView:", a3);
}

- (void)_setVisualAltitude:(double)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UINavigationControllerPalette;
  -[UIView _setVisualAltitude:](&v4, sel__setVisualAltitude_, a3);
  if (self->_backgroundView)
    -[_UINavigationControllerPalette _configureConstraintsForBackground:](self, "_configureConstraintsForBackground:");
}

- (void)_setVisualAltitudeBias:(CGSize)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UINavigationControllerPalette;
  -[UIView _setVisualAltitudeBias:](&v4, sel__setVisualAltitudeBias_, a3.width, a3.height);
  if (self->_backgroundView)
    -[_UINavigationControllerPalette _configureConstraintsForBackground:](self, "_configureConstraintsForBackground:");
}

- (void)_setPaletteOverridesPinningBar:(BOOL)a3
{
  self->__paletteOverridesPinningBar = a3;
}

- (UINavigationController)navController
{
  return self->_navController;
}

- (void)setVisibleWhenPinningBarIsHidden:(BOOL)a3
{
  self->_visibleWhenPinningBarIsHidden = a3;
}

- (UIViewController)_unpinnedController
{
  return self->__unpinnedController;
}

- (void)set_unpinnedController:(id)a3
{
  self->__unpinnedController = (UIViewController *)a3;
}

- (id)_pinningBar
{
  return self->__pinningBar;
}

- (CGSize)_size
{
  double width;
  double height;
  CGSize result;

  width = self->__size.width;
  height = self->__size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (NSArray)_backgroundConstraints
{
  return self->__backgroundConstraints;
}

- (BOOL)_isPalettePinningBarHidden
{
  return self->__palettePinningBarHidden;
}

@end
