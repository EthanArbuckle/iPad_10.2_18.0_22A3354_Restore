@implementation IMViewControllerTransition

- (IMViewControllerTransition)init
{
  IMViewControllerTransition *v2;
  IMViewControllerTransition *v3;
  uint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IMViewControllerTransition;
  v2 = -[IMTransition init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    v4 = objc_opt_class(v2);
    if (v4 == objc_opt_class(IMViewControllerTransition))
      -[IMTransition setAnimated:](v3, "setAnimated:", 0);
  }
  return v3;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)IMViewControllerTransition;
  v3 = -[IMViewControllerTransition description](&v9, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IMViewControllerTransition fromViewController](self, "fromViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IMViewControllerTransition toViewController](self, "toViewController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@\nfromViewController:%@\ntoViewController:%@"), v4, v5, v6));

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)IMViewControllerTransition;
  v4 = -[IMTransition copyWithZone:](&v7, "copyWithZone:", a3);
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setFromViewController:", self->_fromViewController);
    objc_msgSend(v5, "setToViewController:", self->_toViewController);
    objc_msgSend(v5, "setFromViewSnapshot:", self->_fromViewSnapshot);
    objc_msgSend(v5, "setToViewSnapshot:", self->_toViewSnapshot);
  }
  return v5;
}

- (void)beginTransition
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)IMViewControllerTransition;
  -[IMTransition beginTransition](&v2, "beginTransition");
}

- (void)p_setFrame:(CGRect)a3 onViewController:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v9;
  char v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  id v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v14 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[IMTransition parentViewController](self, "parentViewController"));
  v10 = objc_opt_respondsToSelector(v9, "setFrameOnViewController:forTransition:");

  if ((v10 & 1) == 0
    || (v11 = (void *)objc_claimAutoreleasedReturnValue(-[IMTransition parentViewController](self, "parentViewController")),
        v12 = objc_msgSend(v11, "setFrameOnViewController:forTransition:", v14, self),
        v11,
        (v12 & 1) == 0))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "view"));
    objc_msgSend(v13, "setFrame:", x, y, width, height);

  }
}

- (id)parentView
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  UIView *v8;
  objc_super v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IMTransition parentViewController](self, "parentViewController"));
  v4 = objc_opt_respondsToSelector(v3, "containerViewForIMTransition:");

  if ((v4 & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[IMTransition parentViewController](self, "parentViewController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "containerViewForIMTransition:", self));

    return v6;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)IMViewControllerTransition;
    v8 = -[IMTransition parentView](&v9, "parentView");
    return (id)objc_claimAutoreleasedReturnValue(v8);
  }
}

- (void)prepareTransition
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  objc_super v67;

  v67.receiver = self;
  v67.super_class = (Class)IMViewControllerTransition;
  -[IMTransition prepareTransition](&v67, "prepareTransition");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IMViewControllerTransition fromView](self, "fromView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "superview"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IMViewControllerTransition parentView](self, "parentView"));

  if (v4 == v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[IMViewControllerTransition parentView](self, "parentView"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[IMTransition view](self, "view"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[IMViewControllerTransition fromView](self, "fromView"));
    objc_msgSend(v6, "insertSubview:aboveSubview:", v7, v8);

  }
  -[IMViewControllerTransition loadToView](self, "loadToView");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[IMTransition parentViewController](self, "parentViewController"));
  v10 = objc_opt_respondsToSelector(v9, "setFrameOnTransitioningView:forTransition:");

  if ((v10 & 1) == 0
    || (v11 = (void *)objc_claimAutoreleasedReturnValue(-[IMTransition parentViewController](self, "parentViewController")),
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[IMTransition view](self, "view")),
        v13 = objc_msgSend(v11, "setFrameOnTransitioningView:forTransition:", v12, self),
        v12,
        v11,
        (v13 & 1) == 0))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[IMViewControllerTransition fromViewController](self, "fromViewController"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "view"));
    objc_msgSend(v15, "frame");
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[IMTransition view](self, "view"));
    objc_msgSend(v24, "setFrame:", v17, v19, v21, v23);

  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[IMTransition parentViewController](self, "parentViewController"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "view"));
  objc_msgSend(v26, "frame");
  v28 = v27;
  v30 = v29;
  v32 = v31;
  v34 = v33;
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[IMTransition view](self, "view"));
  objc_msgSend(v35, "setFrame:", v28, v30, v32, v34);

  v36 = (void *)objc_claimAutoreleasedReturnValue(-[IMViewControllerTransition parentView](self, "parentView"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[IMViewControllerTransition fromViewController](self, "fromViewController"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "view"));
  objc_msgSend(v38, "frame");
  v40 = v39;
  v42 = v41;
  v44 = v43;
  v46 = v45;
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[IMTransition view](self, "view"));
  objc_msgSend(v36, "convertRect:toView:", v47, v40, v42, v44, v46);
  v49 = v48;
  v51 = v50;
  v53 = v52;
  v55 = v54;

  v56 = (void *)objc_claimAutoreleasedReturnValue(-[IMViewControllerTransition fromViewController](self, "fromViewController"));
  -[IMViewControllerTransition p_setFrame:onViewController:](self, "p_setFrame:onViewController:", v56, v49, v51, v53, v55);

  v57 = (void *)objc_claimAutoreleasedReturnValue(-[IMViewControllerTransition toViewController](self, "toViewController"));
  -[IMViewControllerTransition p_setFrame:onViewController:](self, "p_setFrame:onViewController:", v57, v49, v51, v53, v55);

  -[IMViewControllerTransition beginAppearanceTransition](self, "beginAppearanceTransition");
  v58 = (void *)objc_claimAutoreleasedReturnValue(-[IMViewControllerTransition fromView](self, "fromView"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(-[IMViewControllerTransition fromViewController](self, "fromViewController"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "view"));

  if (v58 != v60)
  {
    v61 = (void *)objc_claimAutoreleasedReturnValue(-[IMViewControllerTransition fromViewController](self, "fromViewController"));
    v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "view"));
    objc_msgSend(v62, "removeFromSuperview");

  }
  v63 = (void *)objc_claimAutoreleasedReturnValue(-[IMTransition view](self, "view"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(-[IMViewControllerTransition fromView](self, "fromView"));
  objc_msgSend(v63, "addSubview:", v64);

  v65 = (void *)objc_claimAutoreleasedReturnValue(-[IMTransition view](self, "view"));
  v66 = (void *)objc_claimAutoreleasedReturnValue(-[IMViewControllerTransition toView](self, "toView"));
  objc_msgSend(v65, "addSubview:", v66);

}

- (void)cleanupTransition
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  objc_super v31;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IMViewControllerTransition toViewController](self, "toViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "view"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IMViewControllerTransition parentView](self, "parentView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IMTransition view](self, "view"));
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[IMTransition view](self, "view"));
  objc_msgSend(v5, "convertRect:fromView:", v15, v8, v10, v12, v14);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[IMViewControllerTransition toViewController](self, "toViewController"));
  -[IMViewControllerTransition p_setFrame:onViewController:](self, "p_setFrame:onViewController:", v24, v17, v19, v21, v23);

  -[UIImageView removeFromSuperview](self->_fromViewSnapshot, "removeFromSuperview");
  -[UIImageView removeFromSuperview](self->_toViewSnapshot, "removeFromSuperview");
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[IMTransition view](self, "view"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "superview"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[IMViewControllerTransition parentView](self, "parentView"));

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[IMViewControllerTransition parentView](self, "parentView"));
  v29 = v28;
  if (v26 == v27)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[IMTransition view](self, "view"));
    objc_msgSend(v29, "insertSubview:aboveSubview:", v4, v30);

  }
  else
  {
    objc_msgSend(v28, "addSubview:", v4);
  }

  -[IMViewControllerTransition _updateParentViewBackgroundColorForToView:](self, "_updateParentViewBackgroundColorForToView:", v4);
  v31.receiver = self;
  v31.super_class = (Class)IMViewControllerTransition;
  -[IMTransition cleanupTransition](&v31, "cleanupTransition");
  -[IMViewControllerTransition endAppearanceTransition](self, "endAppearanceTransition");

}

- (void)performNonAnimatedTransition
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v23;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IMTransition parentViewController](self, "parentViewController"));
  v4 = objc_msgSend(v3, "isViewLoaded");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[IMViewControllerTransition fromViewController](self, "fromViewController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[IMViewControllerTransition toViewController](self, "toViewController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "view"));

    -[IMViewControllerTransition beginAppearanceTransition](self, "beginAppearanceTransition");
    objc_msgSend(v6, "frame");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[IMViewControllerTransition toViewController](self, "toViewController"));
    -[IMViewControllerTransition p_setFrame:onViewController:](self, "p_setFrame:onViewController:", v17, v10, v12, v14, v16);

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "superview"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[IMViewControllerTransition parentView](self, "parentView"));

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[IMViewControllerTransition parentView](self, "parentView"));
    v21 = v20;
    if (v18 == v19)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[IMViewControllerTransition parentView](self, "parentView"));
      objc_msgSend(v21, "insertSubview:aboveSubview:", v8, v22);

    }
    else
    {
      objc_msgSend(v20, "addSubview:", v8);
    }

    -[IMViewControllerTransition _updateParentViewBackgroundColorForToView:](self, "_updateParentViewBackgroundColorForToView:", v8);
    objc_msgSend(v6, "removeFromSuperview");
    -[IMViewControllerTransition endAppearanceTransition](self, "endAppearanceTransition");

  }
  v23.receiver = self;
  v23.super_class = (Class)IMViewControllerTransition;
  -[IMTransition performNonAnimatedTransition](&v23, "performNonAnimatedTransition");
}

- (void)transitionDidEnd
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IMViewControllerTransition;
  -[IMTransition transitionDidEnd](&v3, "transitionDidEnd");
  -[IMViewControllerTransition setFromViewController:](self, "setFromViewController:", 0);
  -[IMViewControllerTransition setToViewController:](self, "setToViewController:", 0);
  -[IMViewControllerTransition setFromViewSnapshot:](self, "setFromViewSnapshot:", 0);
  -[IMViewControllerTransition setToViewSnapshot:](self, "setToViewSnapshot:", 0);
}

- (int)roleForViewController:(id)a3
{
  id v4;
  id v5;
  id v6;
  int v7;
  objc_super v9;

  v4 = a3;
  if (v4)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[IMViewControllerTransition fromViewController](self, "fromViewController"));

    if (v5 == v4)
    {
      v7 = 2;
    }
    else
    {
      v6 = (id)objc_claimAutoreleasedReturnValue(-[IMViewControllerTransition toViewController](self, "toViewController"));

      if (v6 == v4)
      {
        v7 = 1;
      }
      else
      {
        v9.receiver = self;
        v9.super_class = (Class)IMViewControllerTransition;
        v7 = -[IMTransition roleForViewController:](&v9, "roleForViewController:", v4);
      }
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (CGRect)fillBoundsTargetRect
{
  void *v2;
  double v3;
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
  CGRect result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IMTransition view](self, "view"));
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CATransform3D)fillBoundsScaleTransformFromTransform:(SEL)a3 sourceRect:(CATransform3D *)a4
{
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat height;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  CGFloat rect;
  CATransform3D v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  rect = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  -[IMViewControllerTransition fillBoundsTargetRect](self, "fillBoundsTargetRect");
  v10 = v25.origin.x;
  v11 = v25.origin.y;
  v12 = v25.size.width;
  height = v25.size.height;
  v14 = CGRectGetWidth(v25);
  v26.origin.x = x;
  v26.origin.y = y;
  v26.size.width = width;
  v26.size.height = rect;
  v15 = v14 / CGRectGetWidth(v26);
  v27.origin.x = v10;
  v27.origin.y = v11;
  v27.size.width = v12;
  v27.size.height = height;
  v16 = CGRectGetHeight(v27);
  v28.origin.x = x;
  v28.origin.y = y;
  v28.size.width = width;
  v28.size.height = rect;
  v17 = CGRectGetHeight(v28);
  *(_OWORD *)&retstr->m11 = 0u;
  *(_OWORD *)&retstr->m13 = 0u;
  *(_OWORD *)&retstr->m21 = 0u;
  *(_OWORD *)&retstr->m23 = 0u;
  *(_OWORD *)&retstr->m31 = 0u;
  *(_OWORD *)&retstr->m33 = 0u;
  *(_OWORD *)&retstr->m41 = 0u;
  *(_OWORD *)&retstr->m43 = 0u;
  v18 = *(_OWORD *)&a4->m33;
  *(_OWORD *)&v24.m31 = *(_OWORD *)&a4->m31;
  *(_OWORD *)&v24.m33 = v18;
  v19 = *(_OWORD *)&a4->m43;
  *(_OWORD *)&v24.m41 = *(_OWORD *)&a4->m41;
  *(_OWORD *)&v24.m43 = v19;
  v20 = *(_OWORD *)&a4->m13;
  *(_OWORD *)&v24.m11 = *(_OWORD *)&a4->m11;
  *(_OWORD *)&v24.m13 = v20;
  v21 = *(_OWORD *)&a4->m23;
  *(_OWORD *)&v24.m21 = *(_OWORD *)&a4->m21;
  *(_OWORD *)&v24.m23 = v21;
  return CATransform3DScale(retstr, &v24, v15, v16 / v17, 1.0);
}

- (UIView)fromView
{
  void *v3;
  void *v4;

  if (-[IMTransition useSnapshots](self, "useSnapshots"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[IMViewControllerTransition fromViewSnapshot](self, "fromViewSnapshot"));
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[IMViewControllerTransition fromViewController](self, "fromViewController"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));

  }
  return (UIView *)v3;
}

- (UIView)toView
{
  void *v3;
  void *v4;

  if (-[IMTransition useSnapshots](self, "useSnapshots"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[IMViewControllerTransition toViewSnapshot](self, "toViewSnapshot"));
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[IMViewControllerTransition toViewController](self, "toViewController"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));

  }
  return (UIView *)v3;
}

- (UIImageView)fromViewSnapshot
{
  UIImageView *fromViewSnapshot;
  void *v4;
  void *v5;
  void *v6;
  UIImageView *v7;
  UIImageView *v8;
  void *v9;
  void *v10;

  fromViewSnapshot = self->_fromViewSnapshot;
  if (!fromViewSnapshot)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[IMViewControllerTransition fromViewController](self, "fromViewController"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "im_snapshotInContext"));

    if (v6)
    {
      v7 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", v6);
      v8 = self->_fromViewSnapshot;
      self->_fromViewSnapshot = v7;

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[IMViewControllerTransition fromViewController](self, "fromViewController"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "view"));
      objc_msgSend(v10, "frame");
      -[UIImageView setFrame:](self->_fromViewSnapshot, "setFrame:");

    }
    fromViewSnapshot = self->_fromViewSnapshot;
  }
  return fromViewSnapshot;
}

- (UIImageView)toViewSnapshot
{
  UIImageView *toViewSnapshot;
  void *v4;
  void *v5;
  void *v6;
  UIImageView *v7;
  UIImageView *v8;
  void *v9;
  void *v10;

  toViewSnapshot = self->_toViewSnapshot;
  if (!toViewSnapshot)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[IMViewControllerTransition toViewController](self, "toViewController"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "im_snapshotInContext"));

    if (v6)
    {
      v7 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", v6);
      v8 = self->_toViewSnapshot;
      self->_toViewSnapshot = v7;

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[IMViewControllerTransition toViewController](self, "toViewController"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "view"));
      objc_msgSend(v10, "frame");
      -[UIImageView setFrame:](self->_toViewSnapshot, "setFrame:");

    }
    toViewSnapshot = self->_toViewSnapshot;
  }
  return toViewSnapshot;
}

- (void)setReverse:(BOOL)a3
{
  _BOOL8 v3;
  unsigned int v5;
  objc_super v6;

  v3 = a3;
  v5 = -[IMTransition reverse](self, "reverse");
  v6.receiver = self;
  v6.super_class = (Class)IMViewControllerTransition;
  -[IMTransition setReverse:](&v6, "setReverse:", v3);
  if (v5 != -[IMTransition reverse](self, "reverse"))
  {
    if (self->_toViewSnapshot)
      -[IMViewControllerTransition setToViewSnapshot:](self, "setToViewSnapshot:", 0);
    if (self->_fromViewSnapshot)
      -[IMViewControllerTransition setFromViewSnapshot:](self, "setFromViewSnapshot:", 0);
  }
}

- (void)loadToView
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IMViewControllerTransition toViewController](self, "toViewController"));
  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "view"));

}

- (void)beginAppearanceTransition
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  void *v10;
  id v11;

  v11 = (id)objc_claimAutoreleasedReturnValue(-[IMTransition parentViewController](self, "parentViewController"));
  if (!objc_msgSend(v11, "isViewLoaded"))
    goto LABEL_7;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IMTransition parentViewController](self, "parentViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "window"));

  if (v5)
  {
    v6 = -[IMTransition animated](self, "animated");
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[IMTransition parentViewController](self, "parentViewController"));
    v8 = objc_msgSend(v7, "shouldAutomaticallyForwardAppearanceMethods");

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[IMViewControllerTransition fromViewController](self, "fromViewController"));
    v10 = v9;
    if ((v8 & 1) != 0)
    {
      objc_msgSend(v9, "beginAppearanceTransition:animated:", 0, v6);

      v11 = (id)objc_claimAutoreleasedReturnValue(-[IMViewControllerTransition toViewController](self, "toViewController"));
      objc_msgSend(v11, "beginAppearanceTransition:animated:", 1, v6);
    }
    else
    {
      objc_msgSend(v9, "viewWillDisappear:", v6);

      v11 = (id)objc_claimAutoreleasedReturnValue(-[IMViewControllerTransition toViewController](self, "toViewController"));
      objc_msgSend(v11, "viewWillAppear:", v6);
    }
LABEL_7:

  }
}

- (void)endAppearanceTransition
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  id v11;

  v11 = (id)objc_claimAutoreleasedReturnValue(-[IMTransition parentViewController](self, "parentViewController"));
  if (!objc_msgSend(v11, "isViewLoaded"))
    goto LABEL_7;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IMTransition parentViewController](self, "parentViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "window"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[IMTransition parentViewController](self, "parentViewController"));
    v7 = objc_msgSend(v6, "shouldAutomaticallyForwardAppearanceMethods");

    if ((v7 & 1) != 0)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[IMViewControllerTransition fromViewController](self, "fromViewController"));
      objc_msgSend(v8, "endAppearanceTransition");

      v11 = (id)objc_claimAutoreleasedReturnValue(-[IMViewControllerTransition toViewController](self, "toViewController"));
      objc_msgSend(v11, "endAppearanceTransition");
    }
    else
    {
      v9 = -[IMTransition animated](self, "animated");
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[IMViewControllerTransition fromViewController](self, "fromViewController"));
      objc_msgSend(v10, "viewDidDisappear:", v9);

      v11 = (id)objc_claimAutoreleasedReturnValue(-[IMViewControllerTransition toViewController](self, "toViewController"));
      objc_msgSend(v11, "viewDidAppear:", v9);
    }
LABEL_7:

  }
}

- (void)_updateParentViewBackgroundColorForToView:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "backgroundColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IMTransition parentViewController](self, "parentViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
  objc_msgSend(v5, "setBackgroundColor:", v6);

}

- (void)setFromViewSnapshot:(id)a3
{
  objc_storeStrong((id *)&self->_fromViewSnapshot, a3);
}

- (void)setToViewSnapshot:(id)a3
{
  objc_storeStrong((id *)&self->_toViewSnapshot, a3);
}

- (IMViewControllerContaining)fromViewController
{
  return self->_fromViewController;
}

- (void)setFromViewController:(id)a3
{
  objc_storeStrong((id *)&self->_fromViewController, a3);
}

- (IMViewControllerContaining)toViewController
{
  return self->_toViewController;
}

- (void)setToViewController:(id)a3
{
  objc_storeStrong((id *)&self->_toViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toViewSnapshot, 0);
  objc_storeStrong((id *)&self->_fromViewSnapshot, 0);
  objc_storeStrong((id *)&self->_toViewController, 0);
  objc_storeStrong((id *)&self->_fromViewController, 0);
}

@end
