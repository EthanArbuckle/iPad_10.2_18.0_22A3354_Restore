@implementation SBWidgetIconResizeGestureHandler

- (SBWidgetIconResizeGestureHandler)initWithIconView:(id)a3 iconListView:(id)a4 widgetMetricsProvider:(id)a5
{
  id v9;
  id v10;
  id v11;
  SBWidgetIconResizeGestureHandler *v12;
  SBWidgetIconResizeGestureHandler *v13;
  SBFFluidBehaviorSettings *v14;
  SBFFluidBehaviorSettings *animationSettings;
  void *v16;
  SBHWidgetIconResizeViewHelper *v17;
  SBHWidgetIconResizeViewHelper *viewHelper;
  objc_super v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)SBWidgetIconResizeGestureHandler;
  v12 = -[SBWidgetIconResizeGestureHandler init](&v20, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_iconView, a3);
    objc_storeStrong((id *)&v13->_iconListView, a4);
    v14 = (SBFFluidBehaviorSettings *)objc_alloc_init(MEMORY[0x1E0DA9E08]);
    animationSettings = v13->_animationSettings;
    v13->_animationSettings = v14;

    objc_msgSend(v9, "listLayout");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[SBHWidgetIconResizeViewHelper initWithDelegate:listLayout:widgetMetricsProvider:]([SBHWidgetIconResizeViewHelper alloc], "initWithDelegate:listLayout:widgetMetricsProvider:", v13, v16, v11);
    viewHelper = v13->_viewHelper;
    v13->_viewHelper = v17;

  }
  return v13;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_gesturePathVertices);
  v3.receiver = self;
  v3.super_class = (Class)SBWidgetIconResizeGestureHandler;
  -[SBWidgetIconResizeGestureHandler dealloc](&v3, sel_dealloc);
}

- (void)iconView:(id)a3 resizeGestureRecognizerDidUpdate:(id)a4
{
  uint64_t v5;
  BOOL v6;
  void *v7;
  id v8;

  v8 = a4;
  v5 = objc_msgSend(v8, "state");
  if ((unint64_t)(v5 - 3) >= 3)
  {
    if (v5 == 2)
    {
      -[SBWidgetIconResizeGestureHandler updateWithGestureRecognizer:](self, "updateWithGestureRecognizer:", v8);
    }
    else
    {
      v6 = v5 == 1;
      v7 = v8;
      if (!v6)
        goto LABEL_9;
      -[SBWidgetIconResizeGestureHandler setUpWithGestureRecognizer:](self, "setUpWithGestureRecognizer:", v8);
    }
  }
  else
  {
    -[SBWidgetIconResizeGestureHandler finishWithGestureRecognizer:](self, "finishWithGestureRecognizer:", v8);
  }
  v7 = v8;
LABEL_9:

}

- (void)setUpWithGestureRecognizer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  CGFloat v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  double MaxX;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  SBWidgetIconResizeTransitionViewController *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  _QWORD v44[4];
  id v45;
  id v46;
  CGRect v47;

  v4 = a3;
  -[SBWidgetIconResizeGestureHandler iconListView](self, "iconListView");
  v43 = (id)objc_claimAutoreleasedReturnValue();
  -[SBWidgetIconResizeGestureHandler iconView](self, "iconView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "icon");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "activeDataSource");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v43, "userInterfaceLayoutDirection");
  -[SBWidgetIconResizeGestureHandler setRTL:](self, "setRTL:", v7 == 1);
  objc_msgSend(v5, "frame");
  v12 = v8;
  v13 = v9;
  v14 = v10;
  v15 = v11;
  if (v7 == 1)
    MaxX = CGRectGetMaxX(*(CGRect *)&v8);
  else
    MaxX = CGRectGetMinX(*(CGRect *)&v8);
  v17 = MaxX;
  v47.origin.x = v12;
  v47.origin.y = v13;
  v47.size.width = v14;
  v47.size.height = v15;
  -[SBWidgetIconResizeGestureHandler setIconViewOrigin:](self, "setIconViewOrigin:", v17, CGRectGetMinY(v47));
  objc_msgSend(v6, "gridSizeClass");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBWidgetIconResizeGestureHandler setOriginalGridSizeClass:](self, "setOriginalGridSizeClass:", v41);
  -[SBWidgetIconResizeGestureHandler setState:](self, "setState:", 1);
  objc_msgSend(v43, "forgetIconView:", v5);
  objc_msgSend(v43, "addPlaceholderRepresentingIcon:reason:options:", v6, CFSTR("resize"), 16);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBWidgetIconResizeGestureHandler placeholder](self, "placeholder");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "invalidate");

  -[SBWidgetIconResizeGestureHandler setPlaceholder:](self, "setPlaceholder:", v40);
  objc_msgSend(v4, "locationInView:", v43);
  v20 = v19;
  v22 = v21;

  -[SBWidgetIconResizeGestureHandler setStartingLocation:](self, "setStartingLocation:", v20, v22);
  -[SBWidgetIconResizeGestureHandler setStretchingStartLocation:](self, "setStretchingStartLocation:", v20, v22);
  v23 = objc_alloc(MEMORY[0x1E0DC3F10]);
  objc_msgSend(v43, "bounds");
  v39 = (void *)objc_msgSend(v23, "initWithFrame:");
  objc_msgSend(v43, "addSubview:", v39);
  objc_msgSend(v39, "addSubview:", v5);
  -[SBWidgetIconResizeGestureHandler setContainerView:](self, "setContainerView:", v39);
  objc_msgSend(v6, "supportedGridSizeClasses");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "model");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "allowedGridSizeClasses");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v38, "gridSizeClassSetByIntersectingWithGridSizeClassSet:", v37);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "gridSizeClassSetByRemovingGridSizeClass:", CFSTR("SBHIconGridSizeClassDefault"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBWidgetIconResizeGestureHandler setAllowedGridSizeClasses:](self, "setAllowedGridSizeClasses:", v25);
  objc_msgSend(v5, "listLayout");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBWidgetIconResizeGestureHandler setListLayout:](self, "setListLayout:", v26);
  SBHIconListLayoutIconGridSizeClassSizes(v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBWidgetIconResizeGestureHandler setIconGridSizeClassSizes:](self, "setIconGridSizeClassSizes:", v27);
  v28 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __63__SBWidgetIconResizeGestureHandler_setUpWithGestureRecognizer___block_invoke;
  v44[3] = &unk_1E8D884B0;
  v45 = v25;
  v46 = v28;
  v29 = v28;
  v30 = v25;
  objc_msgSend(v27, "enumerateGridSizesSortedByAreaWithOptions:usingBlock:", 0, v44);
  -[SBWidgetIconResizeGestureHandler setSortedGridSizeClasses:](self, "setSortedGridSizeClasses:", v29);
  -[SBWidgetIconResizeGestureHandler viewHelper](self, "viewHelper");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "gridSizeClassDomain");
  v32 = v5;
  v33 = v6;
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = -[SBWidgetIconResizeTransitionViewController initWithLeafIcon:allowedGridSizeClasses:gridSizeClassDomain:viewHelper:options:]([SBWidgetIconResizeTransitionViewController alloc], "initWithLeafIcon:allowedGridSizeClasses:gridSizeClassDomain:viewHelper:options:", v33, v30, v34, v31, 0);
  objc_msgSend(v32, "setOverrideCustomIconImageViewController:", v35);
  -[SBWidgetIconResizeGestureHandler setPreviewViewController:](self, "setPreviewViewController:", v35);
  -[SBWidgetIconResizeGestureHandler configureForStretching](self, "configureForStretching");

}

void __63__SBWidgetIconResizeGestureHandler_setUpWithGestureRecognizer___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsGridSizeClass:"))
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

}

- (void)configureForStretching
{
  uint64_t v3;
  uint64_t v4;
  size_t v5;
  double *v6;
  double RectangleFromLine;
  uint64_t ConvexHullPoints;
  id v9;
  _QWORD v10[6];

  -[SBWidgetIconResizeGestureHandler sortedGridSizeClasses](self, "sortedGridSizeClasses");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v9, "count");
  v4 = v3;
  if (v3 == 2)
    v5 = 4;
  else
    v5 = v3;
  v6 = (double *)malloc_type_calloc(v5, 0x10uLL, 0x1000040451B5BE8uLL);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __58__SBWidgetIconResizeGestureHandler_configureForStretching__block_invoke;
  v10[3] = &unk_1E8D8BD80;
  v10[4] = self;
  v10[5] = v6;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v10);
  if (v4 == 2)
    RectangleFromLine = SBHPolygonCreateRectangleFromLine(v6, *v6, v6[1], v6[2], v6[3], 10.0);
  if (-[SBWidgetIconResizeGestureHandler gesturePathVertexCapacity](self, "gesturePathVertexCapacity", RectangleFromLine) < v5)
  {
    self->_gesturePathVertices = (CGPoint *)reallocf(self->_gesturePathVertices, 16 * v5);
    -[SBWidgetIconResizeGestureHandler setGesturePathVertexCapacity:](self, "setGesturePathVertexCapacity:", v5);
  }
  ConvexHullPoints = SBHPolygonFindConvexHullPoints(v6, v5, (uint64_t)self->_gesturePathVertices);
  free(v6);
  -[SBWidgetIconResizeGestureHandler setGesturePathVertexCount:](self, "setGesturePathVertexCount:", ConvexHullPoints);

}

uint64_t __58__SBWidgetIconResizeGestureHandler_configureForStretching__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  result = objc_msgSend(*(id *)(a1 + 32), "resizeHandlePointForGridSizeClass:", a2);
  v6 = (_QWORD *)(*(_QWORD *)(a1 + 40) + 16 * a3);
  *v6 = v7;
  v6[1] = v8;
  return result;
}

- (void)updateWithGestureRecognizer:(id)a3
{
  void *v4;
  int64_t v5;
  id v6;

  v6 = a3;
  -[SBWidgetIconResizeGestureHandler iconView](self, "iconView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutIfNeeded");
  -[SBWidgetIconResizeGestureHandler updatePreviewSizeWithGestureRecognizer:](self, "updatePreviewSizeWithGestureRecognizer:", v6);
  v5 = -[SBWidgetIconResizeGestureHandler state](self, "state");
  if (v5 == 2)
  {
    -[SBWidgetIconResizeGestureHandler updateResizingWithGestureRecognizer:](self, "updateResizingWithGestureRecognizer:", v6);
  }
  else if (v5 == 1)
  {
    -[SBWidgetIconResizeGestureHandler updateStretchingWithGestureRecognizer:](self, "updateStretchingWithGestureRecognizer:", v6);
  }

}

- (void)updatePreviewSizeWithGestureRecognizer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  _BOOL4 v15;
  uint64_t v16;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGFloat y;
  double width;
  double height;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
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
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  id v49;
  CGRect rect;
  void *v51;
  id v52;
  double v53;
  double v54;
  uint64_t v55;
  uint64_t v56;
  double v57;
  uint64_t v58;
  double v59;
  double v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;

  v4 = a3;
  -[SBWidgetIconResizeGestureHandler iconView](self, "iconView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBWidgetIconResizeGestureHandler iconListView](self, "iconListView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v6);
  v8 = v7;
  v10 = v9;
  objc_msgSend(v4, "locationInView:", v5);
  v12 = v11;
  v14 = v13;

  v15 = -[SBWidgetIconResizeGestureHandler isRTL](self, "isRTL");
  objc_msgSend(v5, "frame");
  v20 = 0.0;
  if (v15)
    v20 = CGRectGetWidth(*(CGRect *)&v16) + -1.0;
  if (!-[SBWidgetIconResizeGestureHandler isPointInsideGesturePath:](self, "isPointInsideGesturePath:", v8, v10))
  {
    -[SBWidgetIconResizeGestureHandler nearestPointInsideGesturePathForPoint:](self, "nearestPointInsideGesturePathForPoint:", v8, v10);
    v22 = v21;
    v24 = v23;
    UIDistanceBetweenPoints();
    BSUIConstrainValueWithRubberBand();
    objc_msgSend(v5, "convertPoint:fromView:", v6, SBHPointAtDistanceFromPointToPoint(v22, v24, v8, v10, v25));
    v12 = v26;
    v14 = v27;
  }
  v61.origin.y = 0.0;
  v61.size.width = 1.0;
  v61.size.height = 1.0;
  v64.size.width = 1.0;
  v64.size.height = 1.0;
  v61.origin.x = v20;
  v64.origin.x = v12;
  v64.origin.y = v14;
  v62 = CGRectUnion(v61, v64);
  rect.origin.x = v62.origin.x;
  y = v62.origin.y;
  width = v62.size.width;
  height = v62.size.height;
  objc_msgSend(v5, "iconImageInfo");
  v32 = v31;
  v34 = v33;
  -[SBWidgetIconResizeGestureHandler sortedGridSizeClasses](self, "sortedGridSizeClasses");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "firstObject");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBWidgetIconResizeGestureHandler listLayout](self, "listLayout");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = SBHIconListLayoutIconImageInfoForGridSizeClass(v37, v36);
  v40 = height;
  if (width <= v38)
  {
    v41 = v39;
    v40 = height;
    if (height <= v39)
    {
      v42 = v38;
      if ((unint64_t)objc_msgSend(v35, "count") >= 3)
        v40 = width * (v42 / v41);
      else
        v40 = height;
    }
  }
  -[SBWidgetIconResizeGestureHandler iconViewOrigin](self, "iconViewOrigin");
  v44 = v43;
  v46 = v45;
  if (v15)
  {
    v63.origin.x = rect.origin.x;
    v63.origin.y = y;
    v63.size.width = width;
    v63.size.height = height;
    v44 = v44 - CGRectGetWidth(v63);
  }
  -[SBWidgetIconResizeGestureHandler animationSettings](self, "animationSettings");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = (void *)MEMORY[0x1E0DC3F10];
  *(_QWORD *)&rect.origin.y = MEMORY[0x1E0C809B0];
  *(_QWORD *)&rect.size.width = 3221225472;
  *(_QWORD *)&rect.size.height = __75__SBWidgetIconResizeGestureHandler_updatePreviewSizeWithGestureRecognizer___block_invoke;
  v51 = &unk_1E8D8BDA8;
  v52 = v5;
  v53 = width;
  v54 = v40;
  v55 = v32;
  v56 = v34;
  v57 = v44;
  v58 = v46;
  v59 = width;
  v60 = height;
  v49 = v5;
  objc_msgSend(v48, "sb_animateWithSettings:mode:animations:completion:", v47, 5, &rect.origin.y, 0);

}

uint64_t __75__SBWidgetIconResizeGestureHandler_updatePreviewSizeWithGestureRecognizer___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "setIconImageInfo:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  v2 = *(void **)(a1 + 32);
  UIRectGetCenter();
  objc_msgSend(v2, "setCenter:");
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)updateStretchingWithGestureRecognizer:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  NSObject *v13;
  int v14;
  double v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SBWidgetIconResizeGestureHandler iconListView](self, "iconListView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v5);
  v7 = v6;
  v9 = v8;
  -[SBWidgetIconResizeGestureHandler stretchingStartLocation](self, "stretchingStartLocation");
  v12 = hypot(v7 - v10, v9 - v11);
  if (fabs(v12) >= 20.0)
  {
    -[SBWidgetIconResizeGestureHandler updateTransitionEndpointAndProgressWithGestureRecognizer:](self, "updateTransitionEndpointAndProgressWithGestureRecognizer:", v4);
    SBLogWidgetResizing();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 134217984;
      v15 = v12;
      _os_log_impl(&dword_1CFEF3000, v13, OS_LOG_TYPE_DEFAULT, "resize went beyond hysteresis for stretching (%f)", (uint8_t *)&v14, 0xCu);
    }

    -[SBWidgetIconResizeGestureHandler setState:](self, "setState:", 2);
  }

}

- (double)updateTransitionEndpointAndProgressWithGestureRecognizer:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  double v18;
  _QWORD v20[4];
  id v21;
  SBWidgetIconResizeGestureHandler *v22;
  uint64_t *v23;
  _QWORD *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD v30[4];
  uint64_t v31;
  double *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;

  v4 = a3;
  -[SBWidgetIconResizeGestureHandler iconListView](self, "iconListView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v5);
  -[SBWidgetIconResizeGestureHandler nearestPointInsideGesturePathForPoint:](self, "nearestPointInsideGesturePathForPoint:");
  v7 = v6;
  v9 = v8;
  -[SBWidgetIconResizeGestureHandler stretchingStartLocation](self, "stretchingStartLocation");
  v11 = v10;
  v13 = v12;
  -[SBWidgetIconResizeGestureHandler previewViewController](self, "previewViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "startingGridSizeClass");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__16;
  v39 = __Block_byref_object_dispose__16;
  v40 = 0;
  v31 = 0;
  v32 = (double *)&v31;
  v33 = 0x2020000000;
  v34 = 0;
  -[SBWidgetIconResizeGestureHandler sortedGridSizeClasses](self, "sortedGridSizeClasses");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x2020000000;
  v30[3] = 0;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __93__SBWidgetIconResizeGestureHandler_updateTransitionEndpointAndProgressWithGestureRecognizer___block_invoke;
  v20[3] = &unk_1E8D8BDD0;
  v17 = v15;
  v21 = v17;
  v22 = self;
  v26 = v7;
  v27 = v9;
  v23 = &v35;
  v24 = v30;
  v28 = v11;
  v29 = v13;
  v25 = &v31;
  objc_msgSend(v16, "enumerateObjectsUsingBlock:", v20);
  objc_msgSend(v14, "setEndingGridSizeClass:animated:", v36[5], 1);
  objc_msgSend(v14, "setTransitionProgress:", (v32[3] + -0.03) / 0.92);
  v18 = v32[3];

  _Block_object_dispose(v30, 8);
  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v35, 8);

  return v18;
}

void __93__SBWidgetIconResizeGestureHandler_updateTransitionEndpointAndProgressWithGestureRecognizer___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  char v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  id *v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  id v19;

  v4 = a2;
  v5 = v4;
  if (*(id *)(a1 + 32) != v4)
  {
    v19 = v4;
    v6 = objc_msgSend(v4, "isEqualToString:");
    v5 = v19;
    if ((v6 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "resizeHandlePointForGridSizeClass:", v19);
      v8 = v7;
      v10 = v9;
      UIDistanceBetweenPoints();
      v5 = v19;
      v12 = v11;
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v15 = *(_QWORD *)(v13 + 40);
      v14 = (id *)(v13 + 40);
      if (!v15 || v11 < *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
      {
        objc_storeStrong(v14, a2);
        *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v12;
        SBHNearestPointInLine(*(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), v8, v10);
        UIDistanceBetweenPoints();
        v17 = v16;
        UIDistanceBetweenPoints();
        v5 = v19;
        *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v18 / v17;
      }
    }
  }

}

- (void)updateResizingWithGestureRecognizer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  int v19;
  double v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SBWidgetIconResizeGestureHandler iconListView](self, "iconListView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBWidgetIconResizeGestureHandler containerView](self, "containerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBWidgetIconResizeGestureHandler updateTransitionEndpointAndProgressWithGestureRecognizer:](self, "updateTransitionEndpointAndProgressWithGestureRecognizer:", v4);
  v8 = v7;

  -[SBWidgetIconResizeGestureHandler previewViewController](self, "previewViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "startingGridSizeClass");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "endingGridSizeClass");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v8 <= 0.5)
    v13 = v10;
  else
    v13 = (void *)v11;
  v14 = v13;
  SBLogWidgets();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 138543362;
    v20 = *(double *)&v14;
    _os_log_impl(&dword_1CFEF3000, v15, OS_LOG_TYPE_DEFAULT, "setting placeholder grid size class: %{public}@", (uint8_t *)&v19, 0xCu);
  }

  -[SBWidgetIconResizeGestureHandler placeholder](self, "placeholder");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setGridSizeClass:", v14);
  objc_msgSend(v5, "layoutIconsIfNeededWithAnimationType:options:", 0, 0);
  objc_msgSend(v5, "bringSubviewToFront:", v6);
  SBLogWidgets();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 134217984;
    v20 = v8;
    _os_log_impl(&dword_1CFEF3000, v17, OS_LOG_TYPE_DEFAULT, "widget resize progress: %f", (uint8_t *)&v19, 0xCu);
  }

  if (v8 >= 0.95)
  {
    SBLogWidgetResizing();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 138543362;
      v20 = *(double *)&v12;
      _os_log_impl(&dword_1CFEF3000, v18, OS_LOG_TYPE_DEFAULT, "resize went beyond 95%%, switching to size class %{public}@", (uint8_t *)&v19, 0xCu);
    }

    objc_msgSend(v9, "swapViewControllers");
    objc_msgSend(v9, "setEndingGridSizeClass:", 0);
    objc_msgSend(v9, "setTransitionProgress:", 0.0);
    -[SBWidgetIconResizeGestureHandler resizeHandlePointForGridSizeClass:](self, "resizeHandlePointForGridSizeClass:", v12);
    -[SBWidgetIconResizeGestureHandler setStretchingStartLocation:](self, "setStretchingStartLocation:");
  }
  else if (v8 < 0.03)
  {
    objc_msgSend(v9, "setEndingGridSizeClass:", 0);
    objc_msgSend(v9, "setTransitionProgress:", 0.0);
  }

}

- (void)finishWithGestureRecognizer:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  _QWORD v31[5];
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  double v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  double v42;

  -[SBWidgetIconResizeGestureHandler iconView](self, "iconView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBWidgetIconResizeGestureHandler placeholder](self, "placeholder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "gridSizeClass");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "gridCellIndex");
  -[SBWidgetIconResizeGestureHandler listLayout](self, "listLayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = SBHIconListLayoutIconImageInfoForGridSizeClass(v8, v6);
  v11 = v10;
  objc_msgSend(v4, "iconImageInfo");
  v13 = v12;
  v15 = v14;
  -[SBWidgetIconResizeGestureHandler iconListView](self, "iconListView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = SBIconCoordinateMakeWithGridCellIndex(v7, objc_msgSend(v16, "gridSizeForCurrentOrientation"));
  objc_msgSend(v16, "centerForIconCoordinate:", v17, v18);
  v20 = v19;
  v22 = v21;
  -[SBWidgetIconResizeGestureHandler previewViewController](self, "previewViewController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "endingGridSizeClass");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 == v24)
  {
    v25 = 1.0;
  }
  else if (objc_msgSend(v6, "isEqualToString:", v24))
  {
    v25 = 1.0;
  }
  else
  {
    v25 = 0.0;
  }
  -[SBWidgetIconResizeGestureHandler animationSettings](self, "animationSettings");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)MEMORY[0x1E0DC3F10];
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __64__SBWidgetIconResizeGestureHandler_finishWithGestureRecognizer___block_invoke;
  v33[3] = &unk_1E8D8BDF8;
  v36 = v9;
  v37 = v11;
  v38 = v13;
  v39 = v15;
  v40 = v20;
  v41 = v22;
  v34 = v4;
  v35 = v23;
  v42 = v25;
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __64__SBWidgetIconResizeGestureHandler_finishWithGestureRecognizer___block_invoke_2;
  v31[3] = &unk_1E8D86CC8;
  v31[4] = self;
  v32 = v6;
  v28 = v6;
  v29 = v23;
  v30 = v4;
  objc_msgSend(v27, "sb_animateWithSettings:mode:animations:completion:", v26, 3, v33, v31);

}

uint64_t __64__SBWidgetIconResizeGestureHandler_finishWithGestureRecognizer___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setIconImageInfo:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  objc_msgSend(*(id *)(a1 + 32), "setCenter:", *(double *)(a1 + 80), *(double *)(a1 + 88));
  objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
  return objc_msgSend(*(id *)(a1 + 40), "setTransitionProgress:", *(double *)(a1 + 96));
}

uint64_t __64__SBWidgetIconResizeGestureHandler_finishWithGestureRecognizer___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "informDelegateFinishedWithSizeClass:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "tearDown");
}

- (void)tearDown
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[SBWidgetIconResizeGestureHandler placeholder](self, "placeholder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[SBWidgetIconResizeGestureHandler setPlaceholder:](self, "setPlaceholder:", 0);
  -[SBWidgetIconResizeGestureHandler containerView](self, "containerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeFromSuperview");

  -[SBWidgetIconResizeGestureHandler setContainerView:](self, "setContainerView:", 0);
  -[SBWidgetIconResizeGestureHandler previewViewController](self, "previewViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidate");
  -[SBWidgetIconResizeGestureHandler iconListView](self, "iconListView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layoutIconsNow");

}

- (void)setState:(int64_t)a3
{
  NSObject *v5;
  __CFString *v6;
  int v7;
  __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (self->_state != a3)
  {
    SBLogWidgetResizing();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      if ((unint64_t)a3 > 4)
        v6 = 0;
      else
        v6 = off_1E8D8BE18[a3];
      v7 = 138543362;
      v8 = v6;
      _os_log_impl(&dword_1CFEF3000, v5, OS_LOG_TYPE_DEFAULT, "changing resize gesture handler state to %{public}@", (uint8_t *)&v7, 0xCu);
    }

    self->_state = a3;
  }
}

- (void)informDelegateFinishedWithSizeClass:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SBWidgetIconResizeGestureHandler delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resizeGestureHandler:didFinishWithGridSizeClass:", self, v4);

}

- (id)effectiveGridSizeClassDomain
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[SBWidgetIconResizeGestureHandler iconView](self, "iconView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "gridSizeClassDomain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    +[SBHIconGridSizeClassDomain globalDomain](SBHIconGridSizeClassDomain, "globalDomain");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (CGPoint)resizeHandlePointForGridSizeClass:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  _BOOL4 v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGPoint result;

  v4 = a3;
  -[SBWidgetIconResizeGestureHandler listLayout](self, "listLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = SBHIconListLayoutIconImageInfoForGridSizeClass(v5, v4);
  v8 = v7;
  v10 = v9;

  -[SBWidgetIconResizeGestureHandler iconViewOrigin](self, "iconViewOrigin");
  v12 = v11;
  v14 = v13;
  v15 = -[SBWidgetIconResizeGestureHandler isRTL](self, "isRTL");
  v16 = -v6;
  v17 = -v10;
  if (v15)
    v17 = v10;
  else
    v16 = v6;
  v18 = v17 + v12 + v16;
  v19 = -(v10 * 0.707106781);
  if (!v15)
    v19 = v10 * 0.707106781;
  v20 = v19 + v18;

  v21 = v20;
  v22 = v10 * 0.707106781 + v14 + v8 - v10;
  result.y = v22;
  result.x = v21;
  return result;
}

- (BOOL)isPointInsideGesturePath:(CGPoint)a3
{
  return SBHPolygonContainsPoint((uint64_t)self->_gesturePathVertices, -[SBWidgetIconResizeGestureHandler gesturePathVertexCount](self, "gesturePathVertexCount"), a3.x, a3.y);
}

- (CGPoint)nearestPointInsideGesturePathForPoint:(CGPoint)a3
{
  double v3;
  double v4;
  CGPoint result;

  v3 = SBHPolygonNearestPointToPoint((uint64_t)self->_gesturePathVertices, -[SBWidgetIconResizeGestureHandler gesturePathVertexCount](self, "gesturePathVertexCount"), a3.x, a3.y);
  result.y = v4;
  result.x = v3;
  return result;
}

- (id)iconResizeViewHelper:(id)a3 intentForWidget:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  -[SBWidgetIconResizeGestureHandler delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "resizeGestureHandler:intentForWidget:", self, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)iconResizeViewHelper:(id)a3 viewControllerForIconDataSource:(id)a4 icon:(id)a5 gridSizeClass:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  -[SBWidgetIconResizeGestureHandler delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v12, "resizeGestureHandler:viewControllerForIconDataSource:icon:gridSizeClass:", self, v9, v10, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D01750], "descriptionForRootObject:", self);
}

- (id)succinctDescription
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0D01750];
  objc_msgSend(MEMORY[0x1E0D01758], "succinctStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "descriptionForRootObject:withStyle:", self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)appendDescriptionToStream:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  SBWidgetIconResizeGestureHandler *v12;
  id v13;
  id v14;

  v4 = a3;
  -[SBWidgetIconResizeGestureHandler effectiveGridSizeClassDomain](self, "effectiveGridSizeClassDomain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBWidgetIconResizeGestureHandler previewViewController](self, "previewViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __62__SBWidgetIconResizeGestureHandler_appendDescriptionToStream___block_invoke;
  v10[3] = &unk_1E8D86330;
  v11 = v4;
  v12 = self;
  v13 = v5;
  v14 = v6;
  v7 = v6;
  v8 = v5;
  v9 = v4;
  objc_msgSend(v9, "appendProem:block:", self, v10);

}

void __62__SBWidgetIconResizeGestureHandler_appendDescriptionToStream___block_invoke(uint64_t a1)
{
  void *v2;
  unint64_t v3;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;

  v2 = *(void **)(a1 + 32);
  v3 = objc_msgSend(*(id *)(a1 + 40), "state");
  if (v3 > 4)
    v4 = 0;
  else
    v4 = off_1E8D8BE18[v3];
  objc_msgSend(v2, "appendString:withName:", v4, CFSTR("state"));
  v5 = *(void **)(a1 + 48);
  v6 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "originalGridSizeClass");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "descriptionForGridSizeClass:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendString:withName:", v8, CFSTR("originalGridSizeClass"));

  v9 = *(void **)(a1 + 32);
  v10 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 56), "startingGridSizeClass");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "descriptionForGridSizeClass:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendString:withName:", v12, CFSTR("startingGridSizeClass"));

  v13 = *(void **)(a1 + 32);
  v14 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 56), "endingGridSizeClass");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "descriptionForGridSizeClass:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "appendString:withName:", v16, CFSTR("endingGridSizeClass"));

  v17 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "previewViewController");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v18 = (id)objc_msgSend(v17, "appendObject:withName:", v19, CFSTR("previewViewController"));

}

- (SBIconView)iconView
{
  return self->_iconView;
}

- (SBIconListView)iconListView
{
  return self->_iconListView;
}

- (SBWidgetIconResizeGestureHandlerDelegate)delegate
{
  return (SBWidgetIconResizeGestureHandlerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)state
{
  return self->_state;
}

- (SBIconListViewPlaceholderPositioning)placeholder
{
  return self->_placeholder;
}

- (void)setPlaceholder:(id)a3
{
  objc_storeStrong((id *)&self->_placeholder, a3);
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_containerView, a3);
}

- (SBWidgetIconResizeTransitionViewController)previewViewController
{
  return self->_previewViewController;
}

- (void)setPreviewViewController:(id)a3
{
  objc_storeStrong((id *)&self->_previewViewController, a3);
}

- (CGPoint)startingLocation
{
  double x;
  double y;
  CGPoint result;

  x = self->_startingLocation.x;
  y = self->_startingLocation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setStartingLocation:(CGPoint)a3
{
  self->_startingLocation = a3;
}

- (CGPoint)stretchingStartLocation
{
  double x;
  double y;
  CGPoint result;

  x = self->_stretchingStartLocation.x;
  y = self->_stretchingStartLocation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setStretchingStartLocation:(CGPoint)a3
{
  self->_stretchingStartLocation = a3;
}

- (SBHIconGridSizeClassSizeMap)iconGridSizeClassSizes
{
  return self->_iconGridSizeClassSizes;
}

- (void)setIconGridSizeClassSizes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (SBHIconGridSizeClassSet)allowedGridSizeClasses
{
  return self->_allowedGridSizeClasses;
}

- (void)setAllowedGridSizeClasses:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSArray)sortedGridSizeClasses
{
  return self->_sortedGridSizeClasses;
}

- (void)setSortedGridSizeClasses:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (CGPoint)iconViewOrigin
{
  double x;
  double y;
  CGPoint result;

  x = self->_iconViewOrigin.x;
  y = self->_iconViewOrigin.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setIconViewOrigin:(CGPoint)a3
{
  self->_iconViewOrigin = a3;
}

- (BOOL)isRTL
{
  return self->_RTL;
}

- (void)setRTL:(BOOL)a3
{
  self->_RTL = a3;
}

- (NSString)originalGridSizeClass
{
  return self->_originalGridSizeClass;
}

- (void)setOriginalGridSizeClass:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (SBIconListLayout)listLayout
{
  return self->_listLayout;
}

- (void)setListLayout:(id)a3
{
  objc_storeStrong((id *)&self->_listLayout, a3);
}

- (SBFFluidBehaviorSettings)animationSettings
{
  return self->_animationSettings;
}

- (SBHWidgetIconResizeViewHelper)viewHelper
{
  return self->_viewHelper;
}

- (unint64_t)gesturePathVertexCount
{
  return self->_gesturePathVertexCount;
}

- (void)setGesturePathVertexCount:(unint64_t)a3
{
  self->_gesturePathVertexCount = a3;
}

- (unint64_t)gesturePathVertexCapacity
{
  return self->_gesturePathVertexCapacity;
}

- (void)setGesturePathVertexCapacity:(unint64_t)a3
{
  self->_gesturePathVertexCapacity = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewHelper, 0);
  objc_storeStrong((id *)&self->_animationSettings, 0);
  objc_storeStrong((id *)&self->_listLayout, 0);
  objc_storeStrong((id *)&self->_originalGridSizeClass, 0);
  objc_storeStrong((id *)&self->_sortedGridSizeClasses, 0);
  objc_storeStrong((id *)&self->_allowedGridSizeClasses, 0);
  objc_storeStrong((id *)&self->_iconGridSizeClassSizes, 0);
  objc_storeStrong((id *)&self->_previewViewController, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_placeholder, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_iconListView, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
}

@end
