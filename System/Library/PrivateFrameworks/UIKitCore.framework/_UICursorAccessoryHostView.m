@implementation _UICursorAccessoryHostView

- (void)layoutSubviews
{
  double v3;
  double v4;
  _UICursorAccessoryView *cursorAccessoryView;
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  double v10;
  double v11;
  CGRect *p_selectionRect;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  double MidX;
  double v35;
  unint64_t preferredPlacementEdge;
  double v37;
  double MinY;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  void *v55;
  void *v56;
  void *v57;
  double v58;
  CGFloat v59;
  double v60;
  CGFloat v61;
  double v62;
  CGFloat v63;
  double v64;
  CGFloat v65;
  void *v66;
  double v67;
  CGFloat v68;
  double v69;
  CGFloat v70;
  double v71;
  CGFloat v72;
  double v73;
  CGFloat v74;
  double v75;
  CGFloat v76;
  double MaxX;
  double v78;
  void *v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  CGFloat v99;
  double v100;
  CGFloat v101;
  double v102;
  CGFloat v103;
  double v104;
  CGFloat v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double v111;
  CGFloat v112;
  CGFloat v113;
  CGFloat v114;
  CGFloat v115;
  double Height;
  double v117;
  CGFloat v118;
  CGFloat rect;
  double v120;
  double v121;
  objc_super v122;
  CGRect v123;
  CGRect v124;
  CGRect v125;
  CGRect v126;
  CGRect v127;
  CGRect v128;
  CGRect v129;
  CGRect v130;
  CGRect v131;
  CGRect v132;
  CGRect v133;
  CGRect v134;
  CGRect v135;
  CGRect v136;
  CGRect v137;
  CGRect v138;
  CGRect v139;
  CGRect v140;
  CGRect v141;
  CGRect v142;
  CGRect v143;

  v122.receiver = self;
  v122.super_class = (Class)_UICursorAccessoryHostView;
  -[UIView layoutSubviews](&v122, sel_layoutSubviews);
  if (!-[UIView isHidden](self, "isHidden"))
  {
    v3 = *MEMORY[0x1E0C9D648];
    v4 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    cursorAccessoryView = self->_cursorAccessoryView;
    -[UIView bounds](self, "bounds");
    -[_UICursorAccessoryView sizeThatFits:](cursorAccessoryView, "sizeThatFits:", v6, v7);
    v9 = v8;
    v11 = v10;
    -[UIView setBounds:](self->_cursorAccessoryView, "setBounds:", v3, v4, v8, v10);
    v123.origin.x = v3;
    v123.origin.y = v4;
    v123.size.width = v9;
    v123.size.height = v11;
    -[_UIContainerWindowPortalInteraction setEnabled:](self->_portalInteraction, "setEnabled:", !CGRectIsEmpty(v123));
    p_selectionRect = &self->_selectionRect;
    if (CGRectIsEmpty(self->_selectionRect))
    {
LABEL_23:
      -[UIView layoutIfNeeded](self->_cursorAccessoryView, "layoutIfNeeded");
      -[_UIContainerWindowPortalInteraction ensureVisibilityInContainerWindow](self->_portalInteraction, "ensureVisibilityInContainerWindow");
      return;
    }
    -[UIView keyboardSceneDelegate](self, "keyboardSceneDelegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "visibleFrameInView:", self);
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;

    -[UIView window](self, "window");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "windowScene");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "coordinateSpace");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView convertRect:fromCoordinateSpace:](self, "convertRect:fromCoordinateSpace:", v24, v15, v17, v19, v21);
    v26 = v25;
    v28 = v27;
    v30 = v29;
    v32 = v31;

    v114 = v28;
    v115 = v26;
    v124.origin.x = v26;
    v124.origin.y = v28;
    v112 = v32;
    v113 = v30;
    v124.size.width = v30;
    v124.size.height = v32;
    Height = CGRectGetHeight(v124);
    v118 = v3;
    rect = v4;
    v125.origin.x = v3;
    v125.origin.y = v4;
    v125.size.width = v9;
    v125.size.height = v11;
    v33 = CGRectGetHeight(v125) * 0.5 + 3.0;
    v126.origin.x = p_selectionRect->origin.x;
    v126.origin.y = self->_selectionRect.origin.y;
    v126.size.width = self->_selectionRect.size.width;
    v126.size.height = self->_selectionRect.size.height;
    MidX = CGRectGetMidX(v126);
    -[_UICursorAccessoryView activeAccessoryXOffset](self->_cursorAccessoryView, "activeAccessoryXOffset");
    v120 = MidX + v35;
    preferredPlacementEdge = self->_preferredPlacementEdge;
    if (preferredPlacementEdge != 1)
    {
      if (preferredPlacementEdge != 4)
      {
        v117 = *(double *)(MEMORY[0x1E0C9D538] + 8);
        goto LABEL_11;
      }
      v127.origin.x = p_selectionRect->origin.x;
      v127.origin.y = self->_selectionRect.origin.y;
      v127.size.width = self->_selectionRect.size.width;
      v127.size.height = self->_selectionRect.size.height;
      v117 = v33 + CGRectGetMaxY(v127);
      v37 = v11 * 0.5 + v117;
      MinY = Height;
      if (Height <= 0.0
        || (v128.origin.y = v28,
            v128.origin.x = v115,
            v128.size.height = v32,
            v128.size.width = v30,
            MinY = CGRectGetMinY(v128),
            v37 <= MinY))
      {
        -[UIView window](self, "window", MinY);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "safeAreaInsets");
        v41 = v40;
        v43 = v42;
        v45 = v44;
        v47 = v46;

        -[UIView window](self, "window");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "frame");
        v110 = v41 + v50;
        v111 = v43 + v49;
        v52 = v51 - (v43 + v47);
        v54 = v53 - (v41 + v45);

        -[UIView window](self, "window");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "windowScene");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "coordinateSpace");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView convertRect:fromCoordinateSpace:](self, "convertRect:fromCoordinateSpace:", v57, v111, v110, v52, v54);
        v59 = v58;
        v61 = v60;
        v63 = v62;
        v65 = v64;

        v129.origin.x = v59;
        v129.origin.y = v61;
        v129.size.width = v63;
        v129.size.height = v65;
        if (v37 <= CGRectGetMaxY(v129))
        {
          preferredPlacementEdge = 4;
          goto LABEL_11;
        }
      }
    }
    v130.origin.x = p_selectionRect->origin.x;
    v130.origin.y = self->_selectionRect.origin.y;
    v130.size.width = self->_selectionRect.size.width;
    v130.size.height = self->_selectionRect.size.height;
    v117 = CGRectGetMinY(v130) - v33;
    preferredPlacementEdge = 1;
LABEL_11:
    self->_resolvedPlacement = preferredPlacementEdge;
    -[UIView window](self->_cursorAccessoryView, "window");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "bounds");
    -[UIView convertRect:fromView:](self, "convertRect:fromView:", 0);
    v68 = v67;
    v70 = v69;
    v72 = v71;
    v74 = v73;
    v131.origin.x = v118;
    v131.origin.y = rect;
    v131.size.width = v9;
    v131.size.height = v11;
    v75 = CGRectGetWidth(v131) * 0.5;
    v132.origin.x = v68;
    v132.origin.y = v70;
    v132.size.width = v72;
    v132.size.height = v74;
    v76 = CGRectGetMinX(v132) + -1.0;
    v133.origin.x = v68;
    v133.origin.y = v70;
    v133.size.width = v72;
    v133.size.height = v74;
    MaxX = CGRectGetMaxX(v133);
    v78 = v120;
    if (v120 - v75 >= v76)
    {
      if (v120 + v75 > MaxX + 1.0)
      {
        v135.origin.x = v68;
        v135.origin.y = v70;
        v135.size.width = v72;
        v135.size.height = v74;
        v78 = CGRectGetMaxX(v135) - v75;
      }
    }
    else
    {
      v134.origin.x = v68;
      v134.origin.y = v70;
      v134.size.width = v72;
      v134.size.height = v74;
      v78 = v75 + CGRectGetMinX(v134);
    }
    v121 = v78;
    -[UIView _scroller](self, "_scroller");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v79, "_canScrollY"))
    {
      objc_msgSend(v79, "safeAreaInsets");
      v83 = v82;
      v85 = v84;
      v87 = v86;
      v89 = v88;
      objc_msgSend(v79, "visibleBounds");
      v91 = v85 + v90;
      v93 = v83 + v92;
      v95 = v94 - (v85 + v89);
      v97 = v96 - (v83 + v87);
      if (Height > 0.0)
      {
        v136.origin.x = v91;
        v136.origin.y = v93;
        v136.size.width = v95;
        v136.size.height = v97;
        v143.origin.y = v114;
        v143.origin.x = v115;
        v143.size.height = v112;
        v143.size.width = v113;
        v137 = CGRectIntersection(v136, v143);
        v97 = v97 - v137.size.height;
      }
      v138.origin.x = v91;
      v138.origin.y = v93;
      v138.size.width = v95;
      v138.size.height = v97;
      v139 = CGRectInset(v138, 3.0, 3.0);
      -[UIView convertRect:fromView:](self, "convertRect:fromView:", v79, v139.origin.x, v139.origin.y, v139.size.width, v139.size.height);
      v99 = v98;
      v101 = v100;
      v103 = v102;
      v105 = v104;
      v140.origin.x = v118;
      v140.origin.y = rect;
      v140.size.width = v9;
      v140.size.height = v11;
      v106 = CGRectGetHeight(v140) * 0.5;
      v141.origin.x = v99;
      v141.origin.y = v101;
      v141.size.width = v103;
      v141.size.height = v105;
      v107 = CGRectGetMinY(v141);
      v142.origin.x = v99;
      v142.origin.y = v101;
      v142.size.width = v103;
      v142.size.height = v105;
      v108 = CGRectGetMaxY(v142) - v106;
      v81 = v117;
      v109 = v121;
      if (v117 <= v108)
      {
        v80 = v107 + v106;
        v108 = v117;
        if (v117 < v107 + v106)
          v108 = v107 + v106;
      }
    }
    else
    {
      v108 = v117;
      v109 = v121;
    }
    -[UIView setCenter:](self->_cursorAccessoryView, "setCenter:", v109, v108, v80, v81);

    goto LABEL_23;
  }
}

- (void)setPreferredPlacementEdge:(unint64_t)a3
{
  self->_preferredPlacementEdge = a3;
}

- (void)setSelectionRect:(CGRect)a3
{
  self->_selectionRect = a3;
  -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (_UICursorAccessoryView)cursorAccessoryView
{
  return self->_cursorAccessoryView;
}

- (void)setHidden:(BOOL)a3
{
  objc_super v4;

  if (a3)
  {
    v4.receiver = self;
    v4.super_class = (Class)_UICursorAccessoryHostView;
    -[UIView setHidden:](&v4, sel_setHidden_, 1);
    -[_UIContainerWindowPortalInteraction setEnabled:](self->_portalInteraction, "setEnabled:", 0);
  }
  else
  {
    if (-[UIView isHidden](self, "isHidden"))
      -[UIView setNeedsLayout](self, "setNeedsLayout");
    v4.receiver = self;
    v4.super_class = (Class)_UICursorAccessoryHostView;
    -[UIView setHidden:](&v4, sel_setHidden_, 0);
  }
}

- (_UICursorAccessoryHostView)initWithCursorItemDataSource:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  _UICursorAccessoryHostView *v9;
  _UICursorAccessoryHostView *v10;
  _UICursorAccessoryView *v11;
  _UICursorAccessoryView *cursorAccessoryView;
  _UIContainerWindowPortalInteraction *v13;
  _UIContainerWindowPortalInteraction *portalInteraction;
  _UITouchFallbackView *v15;
  _UITouchFallbackView *touchFallbackView;
  UITapGestureRecognizer *v17;
  UITapGestureRecognizer *dismissGestureRecognizer;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)_UICursorAccessoryHostView;
  v5 = *MEMORY[0x1E0C9D648];
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v9 = -[UIView initWithFrame:](&v20, sel_initWithFrame_, *MEMORY[0x1E0C9D648], v6, v7, v8);
  v10 = v9;
  if (v9)
  {
    v9->_preferredPlacementEdge = 4;
    v9->_resolvedPlacement = 0;
    v11 = -[_UICursorAccessoryView initWithDataSource:]([_UICursorAccessoryView alloc], "initWithDataSource:", v4);
    cursorAccessoryView = v10->_cursorAccessoryView;
    v10->_cursorAccessoryView = v11;

    -[UIView addSubview:](v10, "addSubview:", v10->_cursorAccessoryView);
    v13 = objc_alloc_init(_UIContainerWindowPortalInteraction);
    portalInteraction = v10->_portalInteraction;
    v10->_portalInteraction = v13;

    -[_UIContainerWindowPortalInteraction setAttemptsToUseAncestorViewContainer:](v10->_portalInteraction, "setAttemptsToUseAncestorViewContainer:", 0);
    -[UIView addInteraction:](v10->_cursorAccessoryView, "addInteraction:", v10->_portalInteraction);
    v15 = -[_UITouchFallbackView initWithFrame:]([_UITouchFallbackView alloc], "initWithFrame:", v5, v6, v7, v8);
    touchFallbackView = v10->_touchFallbackView;
    v10->_touchFallbackView = v15;

    -[UIView setAutoresizingMask:](v10->_touchFallbackView, "setAutoresizingMask:", 18);
    v17 = -[UITapGestureRecognizer initWithTarget:action:]([UITapGestureRecognizer alloc], "initWithTarget:action:", v10, sel__didRecognizeDismissGestureRecognizer_);
    dismissGestureRecognizer = v10->_dismissGestureRecognizer;
    v10->_dismissGestureRecognizer = v17;

  }
  return v10;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[UIView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeGestureRecognizer:", self->_dismissGestureRecognizer);

  -[UIView removeFromSuperview](self->_touchFallbackView, "removeFromSuperview");
  v4.receiver = self;
  v4.super_class = (Class)_UICursorAccessoryHostView;
  -[UIView dealloc](&v4, sel_dealloc);
}

- (void)removeFromSuperview
{
  objc_super v3;

  -[_UICursorAccessoryHostView setTouchFallbackEnabled:](self, "setTouchFallbackEnabled:", 0);
  v3.receiver = self;
  v3.super_class = (Class)_UICursorAccessoryHostView;
  -[UIView removeFromSuperview](&v3, sel_removeFromSuperview);
}

- (void)setTouchFallbackEnabled:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  UITapGestureRecognizer *dismissGestureRecognizer;
  void *v8;
  void *v9;

  if (self->_touchFallbackEnabled != a3)
  {
    v3 = a3;
    -[UIView window](self, "window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    dismissGestureRecognizer = self->_dismissGestureRecognizer;
    if (v3)
    {
      objc_msgSend(v5, "addGestureRecognizer:", dismissGestureRecognizer);

      -[UIView window](self, "window");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "bounds");
      -[UIView setFrame:](self->_touchFallbackView, "setFrame:");

      -[UIView window](self, "window");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "insertSubview:atIndex:", self->_touchFallbackView, 0);

    }
    else
    {
      objc_msgSend(v5, "removeGestureRecognizer:", dismissGestureRecognizer);

      -[UIView removeFromSuperview](self->_touchFallbackView, "removeFromSuperview");
    }
    self->_touchFallbackEnabled = v3;
  }
}

- (void)setCollapsed:(BOOL)a3
{
  double v4;
  _UICursorAccessoryView *cursorAccessoryView;
  double v6;
  _UICursorAccessoryView *v7;
  __int128 v8;
  _OWORD v9[3];
  CGAffineTransform v10;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGAffineTransform v13;
  CGAffineTransform v14;

  self->_collapsed = a3;
  if (a3)
  {
    -[UIView layoutIfNeeded](self, "layoutIfNeeded");
    v4 = 3.0;
    if (self->_resolvedPlacement == 1)
      v4 = -3.0;
    memset(&v14, 0, sizeof(v14));
    CGAffineTransformMakeTranslation(&v14, 0.0, -v4);
    v13 = v14;
    CGAffineTransformScale(&t2, &v13, 0.4, 0.4);
    t1 = v14;
    CGAffineTransformConcat(&v13, &t1, &t2);
    v14 = v13;
    v10 = v13;
    -[UIView setTransform:](self->_cursorAccessoryView, "setTransform:", &v10);
    cursorAccessoryView = self->_cursorAccessoryView;
    v6 = 0.0;
  }
  else
  {
    v7 = self->_cursorAccessoryView;
    v8 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v9[0] = *MEMORY[0x1E0C9BAA8];
    v9[1] = v8;
    v9[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    -[UIView setTransform:](v7, "setTransform:", v9);
    cursorAccessoryView = self->_cursorAccessoryView;
    v6 = 1.0;
  }
  -[UIView setAlpha:](cursorAccessoryView, "setAlpha:", v6);
}

- (void)_didRecognizeDismissGestureRecognizer:(id)a3
{
  id v3;

  if ((objc_msgSend(a3, "state") & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dismissCursorAccessory");

  }
}

- (CGRect)selectionRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_selectionRect.origin.x;
  y = self->_selectionRect.origin.y;
  width = self->_selectionRect.size.width;
  height = self->_selectionRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (unint64_t)preferredPlacementEdge
{
  return self->_preferredPlacementEdge;
}

- (BOOL)isCollapsed
{
  return self->_collapsed;
}

- (void)setCursorAccessoryView:(id)a3
{
  objc_storeStrong((id *)&self->_cursorAccessoryView, a3);
}

- (BOOL)touchFallbackEnabled
{
  return self->_touchFallbackEnabled;
}

- (_UIContainerWindowPortalInteraction)portalInteraction
{
  return self->_portalInteraction;
}

- (void)setPortalInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_portalInteraction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_portalInteraction, 0);
  objc_storeStrong((id *)&self->_cursorAccessoryView, 0);
  objc_storeStrong((id *)&self->_touchFallbackView, 0);
  objc_storeStrong((id *)&self->_dismissGestureRecognizer, 0);
}

@end
