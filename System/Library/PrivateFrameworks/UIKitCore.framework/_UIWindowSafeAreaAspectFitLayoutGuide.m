@implementation _UIWindowSafeAreaAspectFitLayoutGuide

- (_UIWindowSafeAreaAspectFitLayoutGuide)init
{
  _UIWindowSafeAreaAspectFitLayoutGuide *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIWindowSafeAreaAspectFitLayoutGuide;
  result = -[UILayoutGuide init](&v3, sel_init);
  if (result)
    result->_aspectRatio = 1.0;
  return result;
}

- (_UIWindowSafeAreaAspectFitLayoutGuide)initWithCoder:(id)a3
{
  id v4;
  _UIWindowSafeAreaAspectFitLayoutGuide *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_UIWindowSafeAreaAspectFitLayoutGuide;
  v5 = -[UILayoutGuide initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_UIWindowSafeAreaAspectFitLayoutGuideAspectRatio"));
    -[_UIWindowSafeAreaAspectFitLayoutGuide setAspectRatio:](v5, "setAspectRatio:");
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIWindowSafeAreaAspectFitLayoutGuide;
  v4 = a3;
  -[UILayoutGuide encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  -[_UIWindowSafeAreaAspectFitLayoutGuide aspectRatio](self, "aspectRatio", v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_UIWindowSafeAreaAspectFitLayoutGuideAspectRatio"));

}

- (void)_setOwningView:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIWindowSafeAreaAspectFitLayoutGuide;
  v4 = a3;
  -[UILayoutGuide _setOwningView:](&v5, sel__setOwningView_, v4);
  self->_layoutFrameDirty = 1;
  objc_msgSend(v4, "_addBoundingPathChangeObserver:", self, v5.receiver, v5.super_class);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[UILayoutGuide owningView](self, "owningView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_removeBoundingPathChangeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)_UIWindowSafeAreaAspectFitLayoutGuide;
  -[UILayoutGuide dealloc](&v4, sel_dealloc);
}

- (void)_boundingPathMayHaveChangedForView:(id)a3 relativeToBoundsOriginOnly:(BOOL)a4
{
  id v4;

  if (!a4)
  {
    self->_layoutFrameDirty = 1;
    -[UILayoutGuide owningView](self, "owningView", a3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setNeedsLayout");

  }
}

- (void)setAspectRatio:(double)a3
{
  double v5;
  void *v7;
  id v8;

  if (a3 <= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIWindowSafeAreaAspectFitLayoutGuide.m"), 81, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("aspectRatio > 0.0"));

  }
  v5 = fmax(fmin(a3, 100.0), 0.01);
  if (self->_aspectRatio != v5)
  {
    self->_aspectRatio = v5;
    self->_layoutFrameDirty = 1;
    -[UILayoutGuide owningView](self, "owningView");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setNeedsLayout");

  }
}

- (void)_updateLayoutFrameInOwningView:(id)a3 fromEngine:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a3;
  v7 = a4;
  if (self->_layoutFrameDirty)
    -[_UIWindowSafeAreaAspectFitLayoutGuide _updateLayoutFrameConstraintsIfNeededWithOwningView:](self, "_updateLayoutFrameConstraintsIfNeededWithOwningView:", v6);
  v8.receiver = self;
  v8.super_class = (Class)_UIWindowSafeAreaAspectFitLayoutGuide;
  -[UILayoutGuide _updateLayoutFrameInOwningView:fromEngine:](&v8, sel__updateLayoutFrameInOwningView_fromEngine_, v6, v7);
  self->_layoutFrameDirty = 0;

}

- (void)_createOrUpdateLeftConstraintWithConstant:(double)a3 owningView:(id)a4 constraintsToActivate:(id)a5
{
  id v8;
  NSLayoutConstraint *leftConstraint;
  void *v10;
  void *v11;
  NSLayoutConstraint *v12;
  NSLayoutConstraint *v13;
  id v14;

  v14 = a4;
  v8 = a5;
  leftConstraint = self->_leftConstraint;
  if (leftConstraint && -[NSLayoutConstraint isActive](leftConstraint, "isActive"))
  {
    -[NSLayoutConstraint setConstant:](self->_leftConstraint, "setConstant:", a3);
  }
  else
  {
    -[UILayoutGuide leftAnchor](self, "leftAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "leftAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:constant:", v11, a3);
    v12 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    v13 = self->_leftConstraint;
    self->_leftConstraint = v12;

    objc_msgSend(v8, "addObject:", self->_leftConstraint);
  }

}

- (void)_createOrUpdateTopConstraintWithConstant:(double)a3 owningView:(id)a4 constraintsToActivate:(id)a5
{
  id v8;
  NSLayoutConstraint *topConstraint;
  void *v10;
  void *v11;
  NSLayoutConstraint *v12;
  NSLayoutConstraint *v13;
  id v14;

  v14 = a4;
  v8 = a5;
  topConstraint = self->_topConstraint;
  if (topConstraint && -[NSLayoutConstraint isActive](topConstraint, "isActive"))
  {
    -[NSLayoutConstraint setConstant:](self->_topConstraint, "setConstant:", a3);
  }
  else
  {
    -[UILayoutGuide topAnchor](self, "topAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "topAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:constant:", v11, a3);
    v12 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    v13 = self->_topConstraint;
    self->_topConstraint = v12;

    objc_msgSend(v8, "addObject:", self->_topConstraint);
  }

}

- (void)_createOrUpdateWidthConstraintWithConstant:(double)a3 owningView:(id)a4 constraintsToActivate:(id)a5
{
  id v8;
  NSLayoutConstraint *widthConstraint;
  void *v10;
  NSLayoutConstraint *v11;
  NSLayoutConstraint *v12;
  id v13;

  v13 = a4;
  v8 = a5;
  widthConstraint = self->_widthConstraint;
  if (widthConstraint && -[NSLayoutConstraint isActive](widthConstraint, "isActive"))
  {
    -[NSLayoutConstraint setConstant:](self->_widthConstraint, "setConstant:", a3);
  }
  else
  {
    -[UILayoutGuide widthAnchor](self, "widthAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToConstant:", a3);
    v11 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    v12 = self->_widthConstraint;
    self->_widthConstraint = v11;

    objc_msgSend(v8, "addObject:", self->_widthConstraint);
  }

}

- (void)_createOrUpdateHeightConstraintWithConstant:(double)a3 owningView:(id)a4 constraintsToActivate:(id)a5
{
  id v8;
  NSLayoutConstraint *heightConstraint;
  void *v10;
  NSLayoutConstraint *v11;
  NSLayoutConstraint *v12;
  id v13;

  v13 = a4;
  v8 = a5;
  heightConstraint = self->_heightConstraint;
  if (heightConstraint && -[NSLayoutConstraint isActive](heightConstraint, "isActive"))
  {
    -[NSLayoutConstraint setConstant:](self->_heightConstraint, "setConstant:", a3);
  }
  else
  {
    -[UILayoutGuide heightAnchor](self, "heightAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToConstant:", a3);
    v11 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    v12 = self->_heightConstraint;
    self->_heightConstraint = v11;

    objc_msgSend(v8, "addObject:", self->_heightConstraint);
  }

}

- (void)_updateLayoutFrameConstraintsIfNeededWithOwningView:(id)a3
{
  double MidX;
  double MidY;
  double aspectRatio;
  double v7;
  CGFloat x;
  double v9;
  CGFloat y;
  double v11;
  CGFloat width;
  double v13;
  CGFloat height;
  void *v15;
  id v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  CGFloat v51;
  CGFloat v52;
  CGFloat v53;
  CGFloat v54;
  void *v55;
  id v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;

  v56 = a3;
  objc_msgSend(v56, "bounds");
  MidX = CGRectGetMidX(v57);
  objc_msgSend(v56, "bounds");
  MidY = CGRectGetMidY(v58);
  aspectRatio = self->_aspectRatio;
  objc_msgSend(v56, "_largestInscribedRectInBoundingPathWithCenter:aspectRatio:", MidX, MidY, aspectRatio);
  x = v7;
  y = v9;
  width = v11;
  height = v13;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v15 = v56;
  else
    v15 = 0;
  v16 = v15;
  v59.origin.x = x;
  v59.origin.y = y;
  v59.size.width = width;
  v59.size.height = height;
  if (!CGRectIsNull(v59))
  {
    if (v16)
    {
      __UIStatusBarManagerForWindow(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "statusBarHeight");
      v19 = v18;

      if (v19 > y)
      {
        objc_msgSend(v16, "_sceneBounds");
        v21 = _UICGRectInsetZeroClamped(x, y, width, height, 0.0, v19 - v20);
        _UIBoundingPathLargestInscribedRectWithAspectRatioAndCenter(aspectRatio, v21, v22, v23, v24, MidX, MidY);
        x = v25;
        y = v26;
        width = v27;
        height = v28;
      }
    }
  }

  v60.origin.x = x;
  v60.origin.y = y;
  v60.size.width = width;
  v60.size.height = height;
  if (CGRectIsNull(v60))
  {
    objc_msgSend(v56, "bounds");
    v30 = v29;
    v32 = v31;
    v34 = v33;
    v36 = v35;
    objc_msgSend(v56, "safeAreaInsets");
    v41 = v34 - v38 - v40;
    v42 = v41 * 0.5;
    if (v41 >= 0.0)
      v42 = 0.0;
    v43 = fmax(v41, 0.0);
    v44 = v36 - v37 - v39;
    if (v44 >= 0.0)
      v45 = 0.0;
    else
      v45 = v44 * 0.5;
    _UIBoundingPathLargestInscribedRectWithAspectRatioAndCenter(aspectRatio, v30 + v38 + v42, v32 + v37 + v45, v43, fmax(v44, 0.0), MidX, MidY);
    x = v61.origin.x;
    y = v61.origin.y;
    width = v61.size.width;
    height = v61.size.height;
    if (CGRectIsNull(v61))
    {
      objc_msgSend(v56, "safeAreaLayoutGuide");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "layoutFrame");
      x = v47;
      y = v48;
      width = v49;
      height = v50;

    }
  }
  v62.origin.x = x;
  v62.origin.y = y;
  v62.size.width = width;
  v62.size.height = height;
  v63 = CGRectInset(v62, ceil(x) - x, ceil(y) - y);
  v64 = CGRectIntegral(v63);
  v51 = v64.origin.x;
  v52 = v64.origin.y;
  v53 = v64.size.width;
  v54 = v64.size.height;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 4);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v65.origin.x = v51;
  v65.origin.y = v52;
  v65.size.width = v53;
  v65.size.height = v54;
  -[_UIWindowSafeAreaAspectFitLayoutGuide _createOrUpdateLeftConstraintWithConstant:owningView:constraintsToActivate:](self, "_createOrUpdateLeftConstraintWithConstant:owningView:constraintsToActivate:", v56, v55, CGRectGetMinX(v65));
  v66.origin.x = v51;
  v66.origin.y = v52;
  v66.size.width = v53;
  v66.size.height = v54;
  -[_UIWindowSafeAreaAspectFitLayoutGuide _createOrUpdateTopConstraintWithConstant:owningView:constraintsToActivate:](self, "_createOrUpdateTopConstraintWithConstant:owningView:constraintsToActivate:", v56, v55, CGRectGetMinY(v66));
  v67.origin.x = v51;
  v67.origin.y = v52;
  v67.size.width = v53;
  v67.size.height = v54;
  -[_UIWindowSafeAreaAspectFitLayoutGuide _createOrUpdateWidthConstraintWithConstant:owningView:constraintsToActivate:](self, "_createOrUpdateWidthConstraintWithConstant:owningView:constraintsToActivate:", v56, v55, CGRectGetWidth(v67));
  v68.origin.x = v51;
  v68.origin.y = v52;
  v68.size.width = v53;
  v68.size.height = v54;
  -[_UIWindowSafeAreaAspectFitLayoutGuide _createOrUpdateHeightConstraintWithConstant:owningView:constraintsToActivate:](self, "_createOrUpdateHeightConstraintWithConstant:owningView:constraintsToActivate:", v56, v55, CGRectGetHeight(v68));
  if (objc_msgSend(v55, "count"))
    objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", v55);

}

- (BOOL)_isSafeAreaAspectFitLayoutGuide
{
  return 1;
}

- (double)aspectRatio
{
  return self->_aspectRatio;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_storeStrong((id *)&self->_widthConstraint, 0);
  objc_storeStrong((id *)&self->_topConstraint, 0);
  objc_storeStrong((id *)&self->_leftConstraint, 0);
}

@end
