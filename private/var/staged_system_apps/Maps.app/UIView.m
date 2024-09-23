@implementation UIView

- (void)_maps_annotateViewWithPlaceCardViewController:(id)a3
{
  PlaceCardViewController *v4;
  UIView *v5;

  v4 = (PlaceCardViewController *)a3;
  v5 = self;
  UIView.annotateView(placeCardViewController:)(v4);

}

- (void)_maps_annotateViewForAvoidTolls
{
  UIView *v2;

  v2 = self;
  UIView.annotateViewForAvoidTolls()();

}

- (void)_maps_annotateViewForAvoidHighways
{
  UIView *v2;

  v2 = self;
  UIView.annotateViewForAvoidHighways()();

}

- (void)_maps_annotateViewForAvoidHillsInWalking
{
  UIView *v2;

  v2 = self;
  UIView.annotateViewForAvoidHillsInWalking()();

}

- (void)_maps_annotateViewForAvoidBusyRoadsInWalking
{
  UIView *v2;

  v2 = self;
  UIView.annotateViewForAvoidBusyRoadsInWalking()();

}

- (void)_maps_annotateViewForAvoidStairs
{
  UIView *v2;

  v2 = self;
  UIView.annoateViewForAvoidStairs()();

}

- (void)_maps_annotateViewForAvoidHillsInCycling
{
  UIView *v2;

  v2 = self;
  UIView.annotateViewForAvoidHillsInCycling()();

}

- (void)_maps_annotateViewForAvoidBusyRoadsInCycling
{
  UIView *v2;

  v2 = self;
  UIView.annotateViewForAvoidBusyRoadsInCycling()();

}

- (void)_maps_annotateViewForTransitPreferenceMode:(unint64_t)a3
{
  UIView *v4;

  v4 = self;
  UIView.annotateViewForTransitPreferenceMode(mode:)(a3);

}

- (void)_maps_recursivelySetAllowsGroupOpacity:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self, "layer"));
  objc_msgSend(v5, "setAllowsGroupOpacity:", v3);

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIView subviews](self, "subviews", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v10), "_maps_recursivelySetAllowsGroupOpacity:", v3);
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)_maps_initializeWithAutolayoutCompressedSize
{
  double y;
  double v4;
  double v5;

  y = CGRectZero.origin.y;
  -[UIView systemLayoutSizeFittingSize:](self, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height);
  -[UIView setBounds:](self, "setBounds:", CGRectZero.origin.x, y, v4, v5);
  -[UIView layoutIfNeeded](self, "layoutIfNeeded");
}

- (CGRect)_maps_centeringFrameForView:(id)a3 fit:(BOOL)a4 constrain:(BOOL)a5 inRect:(CGRect)a6
{
  double v6;
  double v7;
  double v8;
  double v9;
  CGRect result;

  if (a5)
    -[UIView _maps_centeringFrameForView:inRect:options:](self, "_maps_centeringFrameForView:inRect:options:", a3, a4 | 4, a6.origin.x, a6.origin.y, a6.size.width, a6.size.height);
  else
    -[UIView _maps_centeringFrameForView:inRect:options:](self, "_maps_centeringFrameForView:inRect:options:", a3, a4, a6.origin.x, a6.origin.y, a6.size.width, a6.size.height);
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (CGRect)_maps_centeringFrameForView:(id)a3 inRect:(CGRect)a4 options:(int64_t)a5
{
  char v5;
  double height;
  double width;
  double y;
  double x;
  id v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
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
  _BOOL4 v29;
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
  CGRect v43;
  CGRect v44;
  CGRect result;
  CGRect v46;

  v5 = a5;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v11 = a3;
  v12 = v11;
  if ((v5 & 8) != 0)
  {
    objc_msgSend(v11, "bounds");
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;
    objc_msgSend(v12, "layoutMargins");
    v46.origin.x = v14 + v21;
    v46.origin.y = v16 + v22;
    v46.size.width = v18 - (v21 + v23);
    v46.size.height = v20 - (v22 + v24);
    v43.origin.x = x;
    v43.origin.y = y;
    v43.size.width = width;
    v43.size.height = height;
    v44 = CGRectIntersection(v43, v46);
    x = v44.origin.x;
    y = v44.origin.y;
    width = v44.size.width;
    height = v44.size.height;
  }
  if ((v5 & 2) != 0)
  {
    objc_msgSend(v12, "systemLayoutSizeFittingSize:", width, height);
  }
  else if ((v5 & 1) != 0)
  {
    objc_msgSend(v12, "sizeThatFits:", width, height);
  }
  else
  {
    objc_msgSend(v12, "frame");
    v26 = v25;
    v28 = v27;
  }
  v29 = (v5 & 4) == 0;
  if (v26 >= width && (v5 & 4) != 0)
    v26 = width;
  if (v28 < height)
    v29 = 1;
  if (!v29)
    v28 = height;
  -[UIView _maps_centeringFrameForView:size:inRect:](self, "_maps_centeringFrameForView:size:inRect:", v12, v26, v28, x, y, width, height);
  v32 = v31;
  v34 = v33;
  v36 = v35;
  v38 = v37;

  v39 = v32;
  v40 = v34;
  v41 = v36;
  v42 = v38;
  result.size.height = v42;
  result.size.width = v41;
  result.origin.y = v40;
  result.origin.x = v39;
  return result;
}

- (CGRect)_maps_centeringFrameForView:(id)a3 size:(CGSize)a4 inRect:(CGRect)a5
{
  double height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v9;
  CGFloat v10;
  CGFloat v11;
  CGRect v12;
  CGRect v13;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v9 = a4.height;
  v10 = a4.width;
  v11 = (a5.size.width - a4.width) * 0.5 + CGRectGetMinX(a5);
  v12.origin.x = x;
  v12.origin.y = y;
  v12.size.width = width;
  v12.size.height = height;
  v13.origin.y = (height - v9) * 0.5 + CGRectGetMinY(v12);
  v13.origin.x = v11;
  v13.size.width = v10;
  v13.size.height = v9;
  return CGRectIntegral(v13);
}

- (CGSize)_maps_compressedSizeForWidth:(double)a3 withBlock:(id)a4
{
  double v4;
  double v5;
  double v8;
  double v9;
  CGSize result;

  if (a4)
    (*((void (**)(id, SEL))a4 + 2))(a4, a2);
  LODWORD(v4) = 1148846080;
  LODWORD(v5) = 1112014848;
  -[UIView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", a3, 0.0, v4, v5);
  v9 = a3;
  result.height = v8;
  result.width = v9;
  return result;
}

+ (BOOL)_maps_shouldAdoptImplicitAnimationParameters
{
  unsigned int v2;

  v2 = +[UIView _isInAnimationBlock](UIView, "_isInAnimationBlock");
  if (v2)
    LOBYTE(v2) = +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled");
  return v2;
}

- (BOOL)_maps_isVisible
{
  BOOL v3;
  void *v4;

  if (-[UIView isHidden](self, "isHidden"))
    return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIView window](self, "window"));
  v3 = v4 != 0;

  return v3;
}

- (void)_maps_alignTopToView:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  CGRect v19;

  v4 = a3;
  -[UIView frame](self, "frame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  objc_msgSend(v4, "frame");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  v19.origin.x = v12;
  v19.origin.y = v14;
  v19.size.width = v16;
  v19.size.height = v18;
  -[UIView setFrame:](self, "setFrame:", v6, CGRectGetMinY(v19), v8, v10);
}

- (id)_maps_constraintsForCenteringInView:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;

  LODWORD(v3) = 1148846080;
  LODWORD(v4) = 1148846080;
  LODWORD(v5) = 1148846080;
  LODWORD(v6) = 1148846080;
  return -[UIView _maps_constraintsForCenteringInView:edgeInsets:priorities:](self, "_maps_constraintsForCenteringInView:edgeInsets:priorities:", a3, 0.0, 0.0, 0.0, 0.0, v3, v4, v5, v6);
}

- (id)_maps_constraintsForCenteringInView:(id)a3 edgeInsets:(UIEdgeInsets)a4
{
  double v4;
  double v5;
  double v6;
  double v7;

  LODWORD(v4) = 1148846080;
  LODWORD(v5) = 1148846080;
  LODWORD(v6) = 1148846080;
  LODWORD(v7) = 1148846080;
  return -[UIView _maps_constraintsForCenteringInView:edgeInsets:priorities:](self, "_maps_constraintsForCenteringInView:edgeInsets:priorities:", a3, a4.top, a4.left, a4.bottom, a4.right, v4, v5, v6, v7);
}

- (id)_maps_constraintsForCenteringInView:(id)a3 priorities:(id)a4
{
  double v4;
  double v5;
  double v6;
  double v7;

  *(float *)&v7 = a4.var3;
  *(float *)&v6 = a4.var2;
  *(float *)&v5 = a4.var1;
  *(float *)&v4 = a4.var0;
  return -[UIView _maps_constraintsForCenteringInView:edgeInsets:priorities:](self, "_maps_constraintsForCenteringInView:edgeInsets:priorities:", a3, 0.0, 0.0, 0.0, 0.0, v4, v5, v6, v7);
}

- (id)_maps_constraintsForCenteringInView:(id)a3 edgeInsets:(UIEdgeInsets)a4 priorities:(id)a5
{
  float var3;
  float var2;
  float var1;
  float var0;
  double right;
  double bottom;
  double left;
  double top;
  id v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[4];

  var3 = a5.var3;
  var2 = a5.var2;
  var1 = a5.var1;
  var0 = a5.var0;
  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  v14 = a3;
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self, "topAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "topAnchor"));
  *(float *)&v15 = var0;
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:constant:priority:", v31, top, v15));
  v33[0] = v30;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leftAnchor](self, "leftAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "leftAnchor"));
  *(float *)&v18 = var2;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:constant:priority:", v17, left, v18));
  v33[1] = v19;
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bottomAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self, "bottomAnchor"));
  *(float *)&v22 = var1;
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:constant:priority:", v21, bottom, v22));
  v33[2] = v23;
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "rightAnchor"));

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[UIView rightAnchor](self, "rightAnchor"));
  *(float *)&v26 = var3;
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:constant:priority:", v25, right, v26));
  v33[3] = v27;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v33, 4));

  return v28;
}

- (id)_maps_constraintsEqualToEdgesOfView:(id)a3 priority:(float)a4
{
  double v4;

  *(float *)&v4 = a4;
  return -[UIView _maps_constraintsEqualToEdgesOfView:insets:priority:](self, "_maps_constraintsEqualToEdgesOfView:insets:priority:", a3, UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right, v4);
}

- (id)_maps_constraintsEqualToEdgesOfView:(id)a3 insets:(UIEdgeInsets)a4 priority:(float)a5
{
  double right;
  double bottom;
  double left;
  double top;
  id v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  void *v29;

  if (a3)
  {
    right = a4.right;
    bottom = a4.bottom;
    left = a4.left;
    top = a4.top;
    v11 = a3;
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self, "topAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "topAnchor"));
    *(float *)&v12 = a5;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:constant:priority:", v28, top, v12));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self, "leadingAnchor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "leadingAnchor"));
    *(float *)&v15 = a5;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:constant:priority:", v14, left, v15));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bottomAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self, "bottomAnchor"));
    *(float *)&v19 = a5;
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:constant:priority:", v18, bottom, v19));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "trailingAnchor"));

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self, "trailingAnchor"));
    *(float *)&v23 = a5;
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:constant:priority:", v22, right, v23));
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[MapsEdgeConstraints edgeConstraintsWithTop:leading:bottom:trailing:](MapsEdgeConstraints, "edgeConstraintsWithTop:leading:bottom:trailing:", v13, v16, v20, v24));

  }
  else
  {
    v25 = 0;
  }
  return v25;
}

- (id)_maps_constraintsEqualToEdgesOfLayoutGuide:(id)a3 priority:(float)a4
{
  double v4;

  *(float *)&v4 = a4;
  return -[UIView _maps_constraintsEqualToEdgesOfLayoutGuide:insets:priority:](self, "_maps_constraintsEqualToEdgesOfLayoutGuide:insets:priority:", a3, UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right, v4);
}

- (id)_maps_constraintsEqualToEdgesOfLayoutGuide:(id)a3 insets:(UIEdgeInsets)a4 priority:(float)a5
{
  double right;
  double bottom;
  double left;
  double top;
  id v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  void *v29;

  if (a3)
  {
    right = a4.right;
    bottom = a4.bottom;
    left = a4.left;
    top = a4.top;
    v11 = a3;
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self, "topAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "topAnchor"));
    *(float *)&v12 = a5;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:constant:priority:", v28, top, v12));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self, "leadingAnchor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "leadingAnchor"));
    *(float *)&v15 = a5;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:constant:priority:", v14, left, v15));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bottomAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self, "bottomAnchor"));
    *(float *)&v19 = a5;
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:constant:priority:", v18, bottom, v19));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "trailingAnchor"));

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self, "trailingAnchor"));
    *(float *)&v23 = a5;
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:constant:priority:", v22, right, v23));
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[MapsEdgeConstraints edgeConstraintsWithTop:leading:bottom:trailing:](MapsEdgeConstraints, "edgeConstraintsWithTop:leading:bottom:trailing:", v13, v16, v20, v24));

  }
  else
  {
    v25 = 0;
  }
  return v25;
}

- (CGAffineTransform)_maps_transformScaledToLeadingAtScale:(SEL)a3
{
  double v6;
  double v7;
  void *v8;
  id v9;
  double v10;
  double v11;
  CGAffineTransform *v12;
  __int128 v13;
  CGAffineTransform v14;
  CGAffineTransform v15;

  if (a4 == 1.0 || a4 == 0.0)
  {
    v13 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&retstr->c = v13;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  }
  else
  {
    -[CGAffineTransform bounds](self, "bounds");
    v7 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v9 = objc_msgSend(v8, "userInterfaceLayoutDirection");

    v10 = v7 - v7 * a4;
    if (v9 == (id)1)
    {
      CGAffineTransformMakeScale(&v15, a4, a4);
      v11 = v10 * 0.5 / a4;
      v12 = &v15;
    }
    else
    {
      CGAffineTransformMakeScale(&v14, a4, a4);
      v11 = v10 * -0.5 / a4;
      v12 = &v14;
    }
    return CGAffineTransformTranslate(retstr, v12, v11, 0.0);
  }
  return self;
}

- (CGAffineTransform)_maps_transformScaledToTopAtScale:(SEL)a3
{
  double v6;
  double v7;
  __int128 v8;
  CGAffineTransform v9;

  if (a4 == 1.0 || a4 == 0.0)
  {
    v8 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&retstr->c = v8;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  }
  else
  {
    -[CGAffineTransform bounds](self, "bounds");
    v7 = v6;
    CGAffineTransformMakeScale(&v9, a4, a4);
    return CGAffineTransformTranslate(retstr, &v9, 0.0, (v7 - v7 * a4) * -0.5 / a4);
  }
  return self;
}

- (CGAffineTransform)_maps_transformScaledToTopAndLeadingAtScale:(SEL)a3
{
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  id v11;
  double v12;
  double v13;
  CGAffineTransform *v14;
  __int128 v15;
  CGAffineTransform v16;
  CGAffineTransform v17;

  if (a4 == 1.0 || a4 == 0.0)
  {
    v15 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&retstr->c = v15;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  }
  else
  {
    -[CGAffineTransform bounds](self, "bounds");
    v7 = v6;
    v9 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v11 = objc_msgSend(v10, "userInterfaceLayoutDirection");

    v12 = v7 - v7 * a4;
    if (v11 == (id)1)
    {
      CGAffineTransformMakeScale(&v17, a4, a4);
      v13 = v12 * 0.5 / a4;
      v14 = &v17;
    }
    else
    {
      CGAffineTransformMakeScale(&v16, a4, a4);
      v13 = v12 * -0.5 / a4;
      v14 = &v16;
    }
    return CGAffineTransformTranslate(retstr, v14, v13, (v9 - v9 * a4) * -0.5 / a4);
  }
  return self;
}

- (CGAffineTransform)_maps_transformScaledToTopAndTrailingAtScale:(SEL)a3
{
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  id v11;
  double v12;
  double v13;
  CGAffineTransform *v14;
  __int128 v15;
  CGAffineTransform v16;
  CGAffineTransform v17;

  if (a4 == 1.0 || a4 == 0.0)
  {
    v15 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&retstr->c = v15;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  }
  else
  {
    -[CGAffineTransform bounds](self, "bounds");
    v7 = v6;
    v9 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v11 = objc_msgSend(v10, "userInterfaceLayoutDirection");

    v12 = v7 - v7 * a4;
    if (v11 == (id)1)
    {
      CGAffineTransformMakeScale(&v17, a4, a4);
      v13 = v12 * -0.5 / a4;
      v14 = &v17;
    }
    else
    {
      CGAffineTransformMakeScale(&v16, a4, a4);
      v13 = v12 * 0.5 / a4;
      v14 = &v16;
    }
    return CGAffineTransformTranslate(retstr, v14, v13, (v9 - v9 * a4) * -0.5 / a4);
  }
  return self;
}

- (double)_maps_maxConstraintConstantForAxis:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIView window](self, "window"));
  if (v5)
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIView window](self, "window"));
  else
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  v7 = v6;
  objc_msgSend(v6, "bounds");
  v9 = v8;
  v11 = v10;

  if (a3 == 1)
    return v11;
  else
    return v9;
}

- (void)_maps_setAllContentHuggingAndCompressionResistancePriorities:(float)a3
{
  double v5;
  double v6;
  double v7;

  -[UIView setContentHuggingPriority:forAxis:](self, "setContentHuggingPriority:forAxis:", 0);
  *(float *)&v5 = a3;
  -[UIView setContentHuggingPriority:forAxis:](self, "setContentHuggingPriority:forAxis:", 1, v5);
  *(float *)&v6 = a3;
  -[UIView setContentCompressionResistancePriority:forAxis:](self, "setContentCompressionResistancePriority:forAxis:", 0, v6);
  *(float *)&v7 = a3;
  -[UIView setContentCompressionResistancePriority:forAxis:](self, "setContentCompressionResistancePriority:forAxis:", 1, v7);
}

+ (void)_maps_animateForAndromeda:(BOOL)a3 animations:(id)a4
{
  +[UIView _maps_animateForAndromeda:animations:completion:](UIView, "_maps_animateForAndromeda:animations:completion:", a3, a4, &stru_1011AF6D8);
}

+ (void)_maps_animateForAndromeda:(BOOL)a3 animations:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  BOOL v15;

  v8 = a4;
  v9 = a5;
  if (!a3 && !+[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v10, "postNotificationName:object:", CFSTR("BacklightLuminanceDidChangeNotification"), a1);

  }
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1002A5AA0;
  v12[3] = &unk_1011AF700;
  v15 = a3;
  v13 = v9;
  v14 = a1;
  v11 = v9;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0x10000, v8, v12, 0.25, 0.0);

}

- (NSString)sceneIdentifierForLogging
{
  void *v2;
  void *v3;
  void *v4;
  __CFString *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UIView window](self, "window"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "windowScene"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "delegate"));

  if (objc_msgSend(v4, "conformsToProtocol:", &OBJC_PROTOCOL___SceneIdentifierProviding))
  {
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sceneIdentifier"));
  }
  else if (v4)
  {
    v5 = CFSTR("iOS");
  }
  else
  {
    v5 = CFSTR("Unknown");
  }

  return (NSString *)v5;
}

- (id)_mapsCar_injectBlurView
{
  CarDynamicBlurView *v3;
  UIView *v4;
  UIView *v5;
  UIView *v6;
  CarDynamicBlurView *v7;
  void *v8;
  void *v9;

  v3 = [CarDynamicBlurView alloc];
  v4 = self;
  if (-[UIView conformsToProtocol:](v4, "conformsToProtocol:", &OBJC_PROTOCOL___CarDynamicBlurViewDelegate))v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  v7 = -[CarDynamicBlurView initWithBlurViewContext:delegate:](v3, "initWithBlurViewContext:delegate:", 0, v6);
  -[CarDynamicBlurView setTranslatesAutoresizingMaskIntoConstraints:](v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CarDynamicBlurView setUserInteractionEnabled:](v7, "setUserInteractionEnabled:", 0);
  -[UIView insertSubview:atIndex:](v4, "insertSubview:atIndex:", v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarDynamicBlurView _maps_constraintsForCenteringInView:](v7, "_maps_constraintsForCenteringInView:", v4));
  -[UIView addConstraints:](v4, "addConstraints:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarDynamicBlurView layer](v7, "layer"));
  objc_msgSend(v9, "setShadowPathIsBounds:", 1);

  return v7;
}

- (void)_mapsCar_updateShadow
{
  void *v3;
  int v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  id v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIView traitCollection](self, "traitCollection"));
  v4 = dword_100E375E8[objc_msgSend(v3, "userInterfaceStyle") == (id)1];

  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 1.0)));
  v6 = objc_msgSend(v5, "CGColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self, "layer"));
  objc_msgSend(v7, "setShadowColor:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self, "layer"));
  objc_msgSend(v8, "setShadowOffset:", 0.0, 2.0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self, "layer"));
  objc_msgSend(v9, "setShadowRadius:", 4.0);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self, "layer"));
  LODWORD(v11) = v4;
  objc_msgSend(v10, "setShadowOpacity:", v11);

  v12 = (id)objc_claimAutoreleasedReturnValue(-[UIView layer](self, "layer"));
  objc_msgSend(v12, "setShadowPathIsBounds:", 1);

}

- (NSLayoutXAxisAnchor)_maps_leftRHDAnchor
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIView window](self, "window"));
  if (objc_msgSend(v3, "_car_isHybridInstrumentCluster"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIView window](self, "window"));
    v5 = objc_msgSend(v4, "_car_hybridInstrumentClusterAlignment") == (id)2;

  }
  else
  {
    v5 = 0;
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MapsExternalDevice sharedInstance](MapsExternalDevice, "sharedInstance"));
  v7 = objc_msgSend(v6, "rightHandDrive");

  if ((v7 & 1) != 0 || v5)
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIView rightAnchor](self, "rightAnchor"));
  else
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leftAnchor](self, "leftAnchor"));
  return (NSLayoutXAxisAnchor *)v8;
}

- (NSLayoutXAxisAnchor)_maps_rightRHDAnchor
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIView window](self, "window"));
  if (objc_msgSend(v3, "_car_isHybridInstrumentCluster"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIView window](self, "window"));
    v5 = objc_msgSend(v4, "_car_hybridInstrumentClusterAlignment") == (id)2;

  }
  else
  {
    v5 = 0;
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MapsExternalDevice sharedInstance](MapsExternalDevice, "sharedInstance"));
  v7 = objc_msgSend(v6, "rightHandDrive");

  if ((v7 & 1) != 0 || v5)
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leftAnchor](self, "leftAnchor"));
  else
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIView rightAnchor](self, "rightAnchor"));
  return (NSLayoutXAxisAnchor *)v8;
}

- (id)_maps_addHairlineAtTopWithMargin:(double)a3
{
  return -[UIView _maps_addHairlineAtTopWithLeadingMargin:trailingMargin:](self, "_maps_addHairlineAtTopWithLeadingMargin:trailingMargin:", a3, a3);
}

- (id)_maps_addHairlineAtTopWithLeadingMargin:(double)a3 trailingMargin:(double)a4
{
  return -[UIView _addHairlineAtBottom:leadingMargin:trailingMargin:](self, "_addHairlineAtBottom:leadingMargin:trailingMargin:", 0, a3, a4);
}

- (id)_maps_addHairlineAtBottomWithMargin:(double)a3
{
  return -[UIView _maps_addHairlineAtBottomWithLeadingMargin:trailingMargin:](self, "_maps_addHairlineAtBottomWithLeadingMargin:trailingMargin:", a3, a3);
}

- (id)_maps_addHairlineAtBottomWithLeadingMargin:(double)a3 trailingMargin:(double)a4
{
  return -[UIView _addHairlineAtBottom:leadingMargin:trailingMargin:](self, "_addHairlineAtBottom:leadingMargin:trailingMargin:", 1, a3, a4);
}

- (id)_addHairlineAtBottom:(BOOL)a3 leadingMargin:(double)a4 trailingMargin:(double)a5
{
  _BOOL4 v7;
  HairlineView *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;

  v7 = a3;
  v9 = objc_alloc_init(HairlineView);
  -[HairlineView setTranslatesAutoresizingMaskIntoConstraints:](v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView addSubview:](self, "addSubview:", v9);
  v10 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[HairlineView leadingAnchor](v9, "leadingAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self, "leadingAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:constant:", v12, a4));
  -[HairlineView setLeadingMarginConstraint:](v9, "setLeadingMarginConstraint:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[HairlineView leadingMarginConstraint](v9, "leadingMarginConstraint"));
  objc_msgSend(v10, "addObject:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self, "trailingAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[HairlineView trailingAnchor](v9, "trailingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:constant:", v16, a5));
  -[HairlineView setTrailingMarginConstraint:](v9, "setTrailingMarginConstraint:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[HairlineView trailingMarginConstraint](v9, "trailingMarginConstraint"));
  objc_msgSend(v10, "addObject:", v18);

  if (v7)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[HairlineView bottomAnchor](v9, "bottomAnchor"));
    v20 = objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self, "bottomAnchor"));
  }
  else
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[HairlineView topAnchor](v9, "topAnchor"));
    v20 = objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self, "topAnchor"));
  }
  v21 = (void *)v20;
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v20));
  objc_msgSend(v10, "addObject:", v22);

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v10);
  return v9;
}

- (id)_maps_addHairlineAtLeadingWithMargin:(double)a3
{
  return -[UIView _addHairlineAtTrailing:topMargin:bottomMargin:](self, "_addHairlineAtTrailing:topMargin:bottomMargin:", 0, a3, a3);
}

- (id)_addHairlineAtLeadingWithTopMargin:(double)a3 bottomMargin:(double)a4
{
  return -[UIView _addHairlineAtTrailing:topMargin:bottomMargin:](self, "_addHairlineAtTrailing:topMargin:bottomMargin:", 0, a3, a4);
}

- (id)_maps_addHairlineAtTrailingWithMargin:(double)a3
{
  return -[UIView _addHairlineAtTrailing:topMargin:bottomMargin:](self, "_addHairlineAtTrailing:topMargin:bottomMargin:", 1, a3, a3);
}

- (id)_addHairlineAtTrailingWithTopMargin:(double)a3 bottomMargin:(double)a4
{
  return -[UIView _addHairlineAtTrailing:topMargin:bottomMargin:](self, "_addHairlineAtTrailing:topMargin:bottomMargin:", 1, a3, a4);
}

- (id)_addHairlineAtTrailing:(BOOL)a3 topMargin:(double)a4 bottomMargin:(double)a5
{
  _BOOL4 v7;
  HairlineView *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;

  v7 = a3;
  v9 = objc_alloc_init(HairlineView);
  -[HairlineView setTranslatesAutoresizingMaskIntoConstraints:](v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[HairlineView setVertical:](v9, "setVertical:", 1);
  -[UIView addSubview:](self, "addSubview:", v9);
  v10 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[HairlineView topAnchor](v9, "topAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self, "topAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:constant:", v12, a4));
  -[HairlineView setLeadingMarginConstraint:](v9, "setLeadingMarginConstraint:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[HairlineView leadingMarginConstraint](v9, "leadingMarginConstraint"));
  objc_msgSend(v10, "addObject:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self, "bottomAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[HairlineView bottomAnchor](v9, "bottomAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:constant:", v16, a5));
  -[HairlineView setTrailingMarginConstraint:](v9, "setTrailingMarginConstraint:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[HairlineView trailingMarginConstraint](v9, "trailingMarginConstraint"));
  objc_msgSend(v10, "addObject:", v18);

  if (v7)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[HairlineView trailingAnchor](v9, "trailingAnchor"));
    v20 = objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self, "trailingAnchor"));
  }
  else
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[HairlineView leadingAnchor](v9, "leadingAnchor"));
    v20 = objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self, "leadingAnchor"));
  }
  v21 = (void *)v20;
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v20));
  objc_msgSend(v10, "addObject:", v22);

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v10);
  return v9;
}

- (MapsTheme)theme
{
  void *v3;
  id v4;
  void *v5;
  _BOOL8 v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIView traitCollection](self, "traitCollection"));
  v4 = objc_msgSend(v3, "userInterfaceStyle");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIView traitCollection](self, "traitCollection"));
    v6 = objc_msgSend(v5, "userInterfaceStyle") != (id)1;

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MapsTheme sharedTheme](MapsTheme, "sharedTheme"));
    objc_msgSend(v7, "setMapsThemeStyle:", v6);

  }
  return (MapsTheme *)+[MapsTheme sharedTheme](MapsTheme, "sharedTheme");
}

- (CarCardView)_cardView
{
  id v2;
  uint64_t v3;
  uint64_t v4;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[UIView superview](self, "superview"));
  if (v2)
  {
    while (1)
    {
      v3 = objc_opt_class(CarCardView);
      if ((objc_opt_isKindOfClass(v2, v3) & 1) != 0)
        break;
      v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "superview"));

      v2 = (id)v4;
      if (!v4)
        goto LABEL_6;
    }
    v2 = v2;
  }
LABEL_6:

  return (CarCardView *)v2;
}

- (id)_mapsCar_insertFocusGuideWithOriginView:(id)a3 toDestinationFocusEnvironments:(id)a4 forDirection:(unint64_t)a5
{
  id v8;
  id v9;
  CarFocusGuide *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  UIView *v16;
  UIView *v17;
  objc_class *v18;
  NSString *v19;
  void *v20;
  void *v21;
  void *v22;
  __CFString *v23;
  id v24;
  UIView *v25;
  UIView *v26;
  objc_class *v27;
  NSString *v28;
  void *v29;
  void *v30;
  void *v31;
  __CFString *v32;
  void *v33;
  uint8_t buf[4];
  __CFString *v36;
  __int16 v37;
  void *v38;

  v8 = a3;
  v9 = a4;
  if ((objc_msgSend(v8, "isDescendantOfView:", self) & 1) == 0)
  {
    v24 = sub_10043348C();
    v15 = objc_claimAutoreleasedReturnValue(v24);
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
LABEL_24:
      v10 = 0;
      goto LABEL_25;
    }
    v25 = self;
    v26 = v25;
    if (!v25)
    {
      v32 = CFSTR("<nil>");
      goto LABEL_23;
    }
    v27 = (objc_class *)objc_opt_class(v25);
    v28 = NSStringFromClass(v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    if ((objc_opt_respondsToSelector(v26, "accessibilityIdentifier") & 1) != 0)
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[UIView performSelector:](v26, "performSelector:", "accessibilityIdentifier"));
      v31 = v30;
      if (v30 && !objc_msgSend(v30, "isEqualToString:", v29))
      {
        v32 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v29, v26, v31));

        goto LABEL_19;
      }

    }
    v32 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v29, v26));
LABEL_19:

LABEL_23:
    *(_DWORD *)buf = 138543362;
    v36 = v32;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "[%{public}@] Tried to insert focus guide along a originView, but originView and focusGuide don't share a common superview", buf, 0xCu);

    goto LABEL_24;
  }
  v10 = -[CarFocusGuide initWithOriginView:toDestinationFocusEnvironments:forDirection:]([CarFocusGuide alloc], "initWithOriginView:toDestinationFocusEnvironments:forDirection:", v8, v9, a5);
  -[UIView addLayoutGuide:](self, "addLayoutGuide:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusGuide debugView](v10, "debugView"));

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusGuide debugView](v10, "debugView"));
    -[UIView addSubview:](self, "addSubview:", v12);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusGuide activationConstraints](v10, "activationConstraints"));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v13);

  v14 = sub_10043348C();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    v16 = self;
    v17 = v16;
    if (!v16)
    {
      v23 = CFSTR("<nil>");
      goto LABEL_21;
    }
    v18 = (objc_class *)objc_opt_class(v16);
    v19 = NSStringFromClass(v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    if ((objc_opt_respondsToSelector(v17, "accessibilityIdentifier") & 1) != 0)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[UIView performSelector:](v17, "performSelector:", "accessibilityIdentifier"));
      v22 = v21;
      if (v21 && !objc_msgSend(v21, "isEqualToString:", v20))
      {
        v23 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v20, v17, v22));

        goto LABEL_11;
      }

    }
    v23 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v20, v17));
LABEL_11:

LABEL_21:
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusGuide description](v10, "description"));
    *(_DWORD *)buf = 138543618;
    v36 = v23;
    v37 = 2112;
    v38 = v33;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "[%{public}@] Adding focus guide: %@", buf, 0x16u);

  }
LABEL_25:

  return v10;
}

- (id)_mapsCar_insertFocusContainerGuide
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  UIView *v9;
  UIView *v10;
  objc_class *v11;
  NSString *v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  void *v17;
  uint8_t buf[4];
  __CFString *v20;
  __int16 v21;
  void *v22;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CarFocusContainerGuide focusContainerGuideInstalledInView:](CarFocusContainerGuide, "focusContainerGuideInstalledInView:", self));
  -[UIView addLayoutGuide:](self, "addLayoutGuide:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "debugView"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "debugView"));
    -[UIView insertSubview:atIndex:](self, "insertSubview:atIndex:", v5, 0);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "activationConstraints"));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v6);

  v7 = sub_10043348C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = self;
    v10 = v9;
    if (!v9)
    {
      v16 = CFSTR("<nil>");
      goto LABEL_12;
    }
    v11 = (objc_class *)objc_opt_class(v9);
    v12 = NSStringFromClass(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    if ((objc_opt_respondsToSelector(v10, "accessibilityIdentifier") & 1) != 0)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[UIView performSelector:](v10, "performSelector:", "accessibilityIdentifier"));
      v15 = v14;
      if (v14 && !objc_msgSend(v14, "isEqualToString:", v13))
      {
        v16 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v13, v10, v15));

        goto LABEL_10;
      }

    }
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v13, v10));
LABEL_10:

LABEL_12:
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "description"));
    *(_DWORD *)buf = 138543618;
    v20 = v16;
    v21 = 2112;
    v22 = v17;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "[%{public}@] Adding focus guide: %@", buf, 0x16u);

  }
  return v3;
}

- (id)_maps_mapsSceneDelegate
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UIView window](self, "window"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "windowScene"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "delegate"));

  v5 = objc_opt_class(MapsSceneDelegate);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    v6 = v4;
  else
    v6 = 0;
  v7 = v6;

  return v7;
}

- (id)_maps_sceneIdentifierString
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UIView window](self, "window"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "windowScene"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_sceneIdentifier"));

  return v4;
}

- (id)_maps_carSceneDelegate
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UIView window](self, "window"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "windowScene"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "delegate"));

  v5 = objc_opt_class(CarSceneDelegate);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    v6 = v4;
  else
    v6 = 0;
  v7 = v6;

  return v7;
}

- (double)_car_dynamicPointScaleValue
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  unsigned int v7;
  double v8;
  void *v9;
  double v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIView window](self, "window"));
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "screen"));
  if (!v4)
  {
    v8 = 1.0;
    goto LABEL_5;
  }
  v5 = (void *)v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIView window](self, "window"));
  v7 = objc_msgSend(v6, "_car_isHybridInstrumentCluster");

  v8 = 1.0;
  if (v7)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIView window](self, "window"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "screen"));
    objc_msgSend(v9, "_car_dynamicPointScaleValue");
    v8 = v10;

LABEL_5:
  }
  return v8;
}

- (double)_car_dynamicPixelScaleValue
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  unsigned int v7;
  double v8;
  void *v9;
  double v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIView window](self, "window"));
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "screen"));
  if (!v4)
  {
    v8 = 1.0;
    goto LABEL_5;
  }
  v5 = (void *)v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIView window](self, "window"));
  v7 = objc_msgSend(v6, "_car_isHybridInstrumentCluster");

  v8 = 1.0;
  if (v7)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIView window](self, "window"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "screen"));
    objc_msgSend(v9, "_car_dynamicPixelScaleValue");
    v8 = v10;

LABEL_5:
  }
  return v8;
}

- (id)_mapsCar_recursiveSubviewsWithClass:(Class)a3
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIView subviews](self, "subviews", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "_mapsCar_recursiveSubviewsWithClass:", a3));
        objc_msgSend(v5, "addObjectsFromArray:", v12);

        if ((objc_opt_isKindOfClass(v11, a3) & 1) != 0)
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  v13 = objc_msgSend(v5, "copy");
  return v13;
}

@end
