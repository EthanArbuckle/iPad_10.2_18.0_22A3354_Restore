@implementation SBPIPInteractionControllerVisualizationView

- (void)layoutSubviews
{
  UIView *containerView;
  int *v4;
  int *v5;
  int *v6;
  void *v7;
  UIView *v8;
  UIView *v9;
  id v10;
  UIView *v11;
  UIView *insetsGeometryView;
  UIView *v13;
  void *v14;
  UIView *v15;
  UIView *unionView;
  UIView *v17;
  void *v18;
  UIView *v19;
  UIView *mainGeometryView;
  UIView *v21;
  void *v22;
  void *v23;
  UIView *v24;
  UIView *extendedGeometryView;
  UIView *v26;
  void *v27;
  void *v28;
  UIView *v29;
  UIView *fakePIPView;
  UIView *v31;
  void *v32;
  __int128 v33;
  UIView *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  UIView *v38;
  void *v39;
  id v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  uint64_t v45;
  double v46;
  double v47;
  CGFloat v48;
  UIView *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  void *v57;
  void *v58;
  id v59;
  NSMutableArray *regionViews;
  void *v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t i;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _QWORD v71[5];
  id v72;
  CGAffineTransform v73;
  _OWORD v74[3];
  objc_super v75;
  _BYTE v76[128];
  uint64_t v77;
  CGRect v78;
  CGRect v79;

  v77 = *MEMORY[0x1E0C80C00];
  v75.receiver = self;
  v75.super_class = (Class)SBPIPInteractionControllerVisualizationView;
  -[SBPIPInteractionControllerVisualizationView layoutSubviews](&v75, sel_layoutSubviews);
  containerView = self->_containerView;
  v4 = &OBJC_IVAR___SBPhysicalButtonZStackPolicyAssistant__foregroundCaptureSceneTargets;
  v5 = &OBJC_IVAR___SBPhysicalButtonZStackPolicyAssistant__foregroundCaptureSceneTargets;
  v6 = &OBJC_IVAR___SBPhysicalButtonZStackPolicyAssistant__foregroundCaptureSceneTargets;
  if (!containerView)
  {
    -[SBPIPInteractionControllerVisualizationView layer](self, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAllowsHitTesting:", 0);

    v8 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
    v9 = self->_containerView;
    self->_containerView = v8;

    -[UIView setUserInteractionEnabled:](self->_containerView, "setUserInteractionEnabled:", 0);
    v10 = objc_alloc(MEMORY[0x1E0CEABB0]);
    v11 = (UIView *)objc_msgSend(v10, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    insetsGeometryView = self->_insetsGeometryView;
    self->_insetsGeometryView = v11;

    v13 = self->_insetsGeometryView;
    objc_msgSend(MEMORY[0x1E0CEA478], "systemOrangeColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v13, "setBackgroundColor:", v14);

    -[UIView setUserInteractionEnabled:](self->_insetsGeometryView, "setUserInteractionEnabled:", 0);
    -[UIView addSubview:](self->_containerView, "addSubview:", self->_insetsGeometryView);
    v15 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
    unionView = self->_unionView;
    self->_unionView = v15;

    -[UIView setUserInteractionEnabled:](self->_unionView, "setUserInteractionEnabled:", 0);
    v17 = self->_unionView;
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 0.2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v17, "setBackgroundColor:", v18);

    v19 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
    mainGeometryView = self->_mainGeometryView;
    self->_mainGeometryView = v19;

    v21 = self->_mainGeometryView;
    objc_msgSend(MEMORY[0x1E0CEA478], "systemYellowColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "colorWithAlphaComponent:", 0.2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v21, "setBackgroundColor:", v23);

    v24 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
    extendedGeometryView = self->_extendedGeometryView;
    self->_extendedGeometryView = v24;

    v26 = self->_extendedGeometryView;
    objc_msgSend(MEMORY[0x1E0CEA478], "systemRedColor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "colorWithAlphaComponent:", 0.2);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v26, "setBackgroundColor:", v28);

    v4 = &OBJC_IVAR___SBPhysicalButtonZStackPolicyAssistant__foregroundCaptureSceneTargets;
    -[UIView addSubview:](self->_containerView, "addSubview:", self->_unionView);
    v6 = &OBJC_IVAR___SBPhysicalButtonZStackPolicyAssistant__foregroundCaptureSceneTargets;
    -[UIView addSubview:](self->_containerView, "addSubview:", self->_mainGeometryView);
    -[UIView addSubview:](self->_containerView, "addSubview:", self->_extendedGeometryView);
    v5 = &OBJC_IVAR___SBPhysicalButtonZStackPolicyAssistant__foregroundCaptureSceneTargets;
    v29 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
    fakePIPView = self->_fakePIPView;
    self->_fakePIPView = v29;

    v31 = self->_fakePIPView;
    objc_msgSend(MEMORY[0x1E0CEA478], "systemMintColor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v31, "setBackgroundColor:", v32);

    -[UIView addSubview:](self->_containerView, "addSubview:", self->_fakePIPView);
    -[SBPIPInteractionControllerVisualizationView addSubview:](self, "addSubview:", self->_containerView);
    containerView = self->_containerView;
  }
  v33 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v74[0] = *MEMORY[0x1E0C9BAA8];
  v74[1] = v33;
  v74[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  -[UIView setTransform:](containerView, "setTransform:", v74);
  v34 = self->_containerView;
  -[SBPIPInteractionControllerVisualizationView _unionFrame](self, "_unionFrame");
  -[UIView setFrame:](v34, "setFrame:");
  v35 = v4[725];
  v36 = *(Class *)((char *)&self->super.super.super.isa + v35);
  -[SBPIPInteractionControllerVisualizationView _backgroundFrame](self, "_backgroundFrame");
  objc_msgSend(v36, "setFrame:");
  -[UIView setFrame:](self->_extendedGeometryView, "setFrame:", self->_extendedGeometryContext.containerBounds.origin.x, self->_extendedGeometryContext.containerBounds.origin.y, self->_extendedGeometryContext.containerBounds.size.width, self->_extendedGeometryContext.containerBounds.size.height);
  v37 = v5[726];
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v37), "setFrame:", self->_mainGeometryContext.containerBounds.origin.x, self->_mainGeometryContext.containerBounds.origin.y, self->_mainGeometryContext.containerBounds.size.width, self->_mainGeometryContext.containerBounds.size.height);
  v38 = self->_insetsGeometryView;
  UIRectInset();
  -[UIView setFrame:](v38, "setFrame:");
  -[UIView layer](self->_extendedGeometryView, "layer");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "yellowColor");
  v40 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v39, "setBorderColor:", objc_msgSend(v40, "CGColor"));

  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v37), "layer");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "yellowColor");
  v42 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v41, "setBorderColor:", objc_msgSend(v42, "CGColor"));

  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v37), "layer");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setBorderWidth:", 20.0);

  -[UIView layer](self->_extendedGeometryView, "layer");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setBorderWidth:", 20.0);

  v45 = v6[728];
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v45), "setSize:", self->_mainGeometryContext.pipCurrentSize.width, self->_mainGeometryContext.pipCurrentSize.height);
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v45), "setCenter:", self->_interactionContext.currentPosition.x, self->_interactionContext.currentPosition.y);
  -[UIView bounds](self->_containerView, "bounds");
  v46 = 300.0 / CGRectGetWidth(v78);
  -[UIView bounds](self->_containerView, "bounds");
  v47 = 300.0 / CGRectGetHeight(v79);
  if (v46 >= v47)
    v48 = v47;
  else
    v48 = v46;
  v49 = self->_containerView;
  CGAffineTransformMakeScale(&v73, v48, v48);
  -[UIView setTransform:](v49, "setTransform:", &v73);
  -[SBPIPInteractionControllerVisualizationView bounds](self, "bounds");
  UIRectGetCenter();
  v51 = v50;
  v53 = v52;
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v35), "frame");
  v55 = v51 - v54 * v48;
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v35), "frame");
  -[UIView setCenter:](self->_containerView, "setCenter:", v55, v53 - v56 * v48);
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", self->_regionViews);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIHyperregionUnion _regions](self->_regionUnion, "_regions");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v71[0] = MEMORY[0x1E0C809B0];
  v71[1] = 3221225472;
  v71[2] = __61__SBPIPInteractionControllerVisualizationView_layoutSubviews__block_invoke;
  v71[3] = &unk_1E8EA74C8;
  v71[4] = self;
  v59 = v57;
  v72 = v59;
  objc_msgSend(v58, "enumerateObjectsUsingBlock:", v71);

  regionViews = self->_regionViews;
  objc_msgSend(v59, "allObjects");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray removeObjectsInArray:](regionViews, "removeObjectsInArray:", v61);

  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  v62 = v59;
  v63 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v67, v76, 16);
  if (v63)
  {
    v64 = v63;
    v65 = *(_QWORD *)v68;
    do
    {
      for (i = 0; i != v64; ++i)
      {
        if (*(_QWORD *)v68 != v65)
          objc_enumerationMutation(v62);
        objc_msgSend(*(id *)(*((_QWORD *)&v67 + 1) + 8 * i), "removeFromSuperview", (_QWORD)v67);
      }
      v64 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v67, v76, 16);
    }
    while (v64);
  }

}

void __61__SBPIPInteractionControllerVisualizationView_layoutSubviews__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double Width;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  CGRect v28;

  v27 = a2;
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 464);
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 464);
    *(_QWORD *)(v7 + 464) = v6;

    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 464);
  }
  if (objc_msgSend(v5, "count") <= a3)
  {
    v9 = *(void **)(*(_QWORD *)(a1 + 32) + 464);
    v10 = objc_alloc_init(MEMORY[0x1E0CEABB0]);
    objc_msgSend(v9, "addObject:", v10);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "objectAtIndexedSubscript:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "systemOrangeColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "colorWithAlphaComponent:", 0.2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBackgroundColor:", v13);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "objectAtIndexedSubscript:", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "sb_debugFrame");
  objc_msgSend(v14, "setFrame:");

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "objectAtIndexedSubscript:", a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "frame");
  Width = CGRectGetWidth(v28);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "objectAtIndexedSubscript:", a3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "layer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (Width >= 25.0)
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  else
    objc_msgSend(MEMORY[0x1E0CEA478], "redColor");
  v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v18, "setBorderColor:", objc_msgSend(v19, "CGColor"));

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "objectAtIndexedSubscript:", a3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "layer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setBorderWidth:", 20.0);

  v22 = *(_QWORD *)(a1 + 32);
  v23 = *(void **)(v22 + 416);
  objc_msgSend(*(id *)(v22 + 464), "objectAtIndexedSubscript:", a3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addSubview:", v24);

  v25 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "objectAtIndexedSubscript:", a3);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "removeObject:", v26);

}

- (CGRect)_unionFrame
{
  CGRect v3;

  v3 = CGRectUnion(*MEMORY[0x1E0C9D648], self->_mainGeometryContext.containerBounds);
  return CGRectUnion(v3, self->_extendedGeometryContext.containerBounds);
}

- (CGRect)_backgroundFrame
{
  SBPIPPositionGeometryContext *p_mainGeometryContext;
  SBPIPPositionGeometryContext *p_extendedGeometryContext;
  double x;
  double y;
  CGRect v7;
  CGRect result;

  p_mainGeometryContext = &self->_mainGeometryContext;
  v7 = CGRectUnion(*MEMORY[0x1E0C9D648], self->_mainGeometryContext.containerBounds);
  p_extendedGeometryContext = &self->_extendedGeometryContext;
  result = CGRectUnion(v7, p_extendedGeometryContext->containerBounds);
  x = p_mainGeometryContext->containerBounds.origin.x;
  y = p_mainGeometryContext->containerBounds.origin.y;
  if (x >= p_extendedGeometryContext->containerBounds.origin.x)
    x = p_extendedGeometryContext->containerBounds.origin.x;
  if (y >= p_extendedGeometryContext->containerBounds.origin.y)
    y = p_extendedGeometryContext->containerBounds.origin.y;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  return 0;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  return 0;
}

- (_UIHyperregionUnion)regionUnion
{
  return self->_regionUnion;
}

- (void)setRegionUnion:(id)a3
{
  objc_storeStrong((id *)&self->_regionUnion, a3);
}

- (SBPIPPositionGeometryContext)mainGeometryContext
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  CGPoint v6;
  CGSize v7;
  CGSize v8;

  v3 = *(_OWORD *)&self[3].edgeInsets.left;
  *(_OWORD *)&retstr->stashedMinimumPadding.top = *(_OWORD *)&self[3].containerBounds.size.height;
  *(_OWORD *)&retstr->stashedMinimumPadding.bottom = v3;
  *(_OWORD *)&retstr->offscreenCorners = *(_OWORD *)&self[3].edgeInsets.right;
  v4 = *(_OWORD *)&self[3].pipStashedSize.height;
  *(_OWORD *)&retstr->edgeInsets.top = *(_OWORD *)&self[3].pipLastSteadySize.height;
  *(_OWORD *)&retstr->edgeInsets.bottom = v4;
  v5 = *(_OWORD *)&self[3].containerBounds.origin.y;
  *(_OWORD *)&retstr->minimumPadding.top = *(_OWORD *)&self[3].pipAnchorPointOffset.y;
  *(_OWORD *)&retstr->minimumPadding.bottom = v5;
  v6 = *(CGPoint *)&self[2].stashedMinimumPadding.right;
  retstr->pipStashedSize = *(CGSize *)&self[2].stashedMinimumPadding.left;
  retstr->pipAnchorPointOffset = v6;
  v7 = *(CGSize *)&self[3].pipCurrentSize.height;
  retstr->containerBounds.origin = *(CGPoint *)&self[2].orientation;
  retstr->containerBounds.size = v7;
  v8 = *(CGSize *)&self[2].minimumPadding.right;
  retstr->pipCurrentSize = *(CGSize *)&self[2].minimumPadding.left;
  retstr->pipLastSteadySize = v8;
  return self;
}

- (void)setMainGeometryContext:(SBPIPPositionGeometryContext *)a3
{
  CGPoint origin;
  CGSize pipStashedSize;
  CGSize pipLastSteadySize;
  __int128 v6;
  __int128 v7;
  CGSize size;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  self->_mainGeometryContext.pipCurrentSize = a3->pipCurrentSize;
  origin = a3->containerBounds.origin;
  pipLastSteadySize = a3->pipLastSteadySize;
  pipStashedSize = a3->pipStashedSize;
  self->_mainGeometryContext.pipAnchorPointOffset = a3->pipAnchorPointOffset;
  self->_mainGeometryContext.containerBounds.origin = origin;
  self->_mainGeometryContext.pipLastSteadySize = pipLastSteadySize;
  self->_mainGeometryContext.pipStashedSize = pipStashedSize;
  v6 = *(_OWORD *)&a3->minimumPadding.top;
  size = a3->containerBounds.size;
  v7 = *(_OWORD *)&a3->edgeInsets.top;
  *(_OWORD *)&self->_mainGeometryContext.edgeInsets.bottom = *(_OWORD *)&a3->edgeInsets.bottom;
  *(_OWORD *)&self->_mainGeometryContext.minimumPadding.top = v6;
  self->_mainGeometryContext.containerBounds.size = size;
  *(_OWORD *)&self->_mainGeometryContext.edgeInsets.top = v7;
  v9 = *(_OWORD *)&a3->offscreenCorners;
  v11 = *(_OWORD *)&a3->minimumPadding.bottom;
  v10 = *(_OWORD *)&a3->stashedMinimumPadding.top;
  *(_OWORD *)&self->_mainGeometryContext.stashedMinimumPadding.bottom = *(_OWORD *)&a3->stashedMinimumPadding.bottom;
  *(_OWORD *)&self->_mainGeometryContext.offscreenCorners = v9;
  *(_OWORD *)&self->_mainGeometryContext.minimumPadding.bottom = v11;
  *(_OWORD *)&self->_mainGeometryContext.stashedMinimumPadding.top = v10;
}

- (SBPIPPositionGeometryContext)extendedGeometryContext
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  CGPoint v6;
  CGSize v7;
  CGSize v8;

  v3 = *(_OWORD *)&self[4].edgeInsets.left;
  *(_OWORD *)&retstr->stashedMinimumPadding.top = *(_OWORD *)&self[4].containerBounds.size.height;
  *(_OWORD *)&retstr->stashedMinimumPadding.bottom = v3;
  *(_OWORD *)&retstr->offscreenCorners = *(_OWORD *)&self[4].edgeInsets.right;
  v4 = *(_OWORD *)&self[4].pipStashedSize.height;
  *(_OWORD *)&retstr->edgeInsets.top = *(_OWORD *)&self[4].pipLastSteadySize.height;
  *(_OWORD *)&retstr->edgeInsets.bottom = v4;
  v5 = *(_OWORD *)&self[4].containerBounds.origin.y;
  *(_OWORD *)&retstr->minimumPadding.top = *(_OWORD *)&self[4].pipAnchorPointOffset.y;
  *(_OWORD *)&retstr->minimumPadding.bottom = v5;
  v6 = *(CGPoint *)&self[3].stashedMinimumPadding.right;
  retstr->pipStashedSize = *(CGSize *)&self[3].stashedMinimumPadding.left;
  retstr->pipAnchorPointOffset = v6;
  v7 = *(CGSize *)&self[4].pipCurrentSize.height;
  retstr->containerBounds.origin = *(CGPoint *)&self[3].orientation;
  retstr->containerBounds.size = v7;
  v8 = *(CGSize *)&self[3].minimumPadding.right;
  retstr->pipCurrentSize = *(CGSize *)&self[3].minimumPadding.left;
  retstr->pipLastSteadySize = v8;
  return self;
}

- (void)setExtendedGeometryContext:(SBPIPPositionGeometryContext *)a3
{
  CGPoint origin;
  CGSize pipStashedSize;
  CGSize pipLastSteadySize;
  __int128 v6;
  __int128 v7;
  CGSize size;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  self->_extendedGeometryContext.pipCurrentSize = a3->pipCurrentSize;
  origin = a3->containerBounds.origin;
  pipLastSteadySize = a3->pipLastSteadySize;
  pipStashedSize = a3->pipStashedSize;
  self->_extendedGeometryContext.pipAnchorPointOffset = a3->pipAnchorPointOffset;
  self->_extendedGeometryContext.containerBounds.origin = origin;
  self->_extendedGeometryContext.pipLastSteadySize = pipLastSteadySize;
  self->_extendedGeometryContext.pipStashedSize = pipStashedSize;
  v6 = *(_OWORD *)&a3->minimumPadding.top;
  size = a3->containerBounds.size;
  v7 = *(_OWORD *)&a3->edgeInsets.top;
  *(_OWORD *)&self->_extendedGeometryContext.edgeInsets.bottom = *(_OWORD *)&a3->edgeInsets.bottom;
  *(_OWORD *)&self->_extendedGeometryContext.minimumPadding.top = v6;
  self->_extendedGeometryContext.containerBounds.size = size;
  *(_OWORD *)&self->_extendedGeometryContext.edgeInsets.top = v7;
  v9 = *(_OWORD *)&a3->offscreenCorners;
  v11 = *(_OWORD *)&a3->minimumPadding.bottom;
  v10 = *(_OWORD *)&a3->stashedMinimumPadding.top;
  *(_OWORD *)&self->_extendedGeometryContext.stashedMinimumPadding.bottom = *(_OWORD *)&a3->stashedMinimumPadding.bottom;
  *(_OWORD *)&self->_extendedGeometryContext.offscreenCorners = v9;
  *(_OWORD *)&self->_extendedGeometryContext.minimumPadding.bottom = v11;
  *(_OWORD *)&self->_extendedGeometryContext.stashedMinimumPadding.top = v10;
}

- (SBPIPPositionInteractionStateContext)interactionContext
{
  CGPoint initialPosition;
  __int128 v4;

  initialPosition = self[7].initialPosition;
  *(CGPoint *)&retstr->initialPosition.y = self[7].projectedPosition;
  *(CGPoint *)&retstr->currentPosition.y = initialPosition;
  retstr->projectedPositionStashProgress = self[7].currentPosition.x;
  v4 = *(_OWORD *)&self[6].projectedPositionStashProgress;
  *(_OWORD *)&retstr->isStashed = *(_OWORD *)&self[6].currentPosition.y;
  *(_OWORD *)&retstr->projectedPosition.y = v4;
  return self;
}

- (void)setInteractionContext:(SBPIPPositionInteractionStateContext *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;

  *(_OWORD *)&self->_interactionContext.isStashed = *(_OWORD *)&a3->isStashed;
  v4 = *(_OWORD *)&a3->initialPosition.y;
  v3 = *(_OWORD *)&a3->currentPosition.y;
  v5 = *(_OWORD *)&a3->projectedPosition.y;
  self->_interactionContext.projectedPositionStashProgress = a3->projectedPositionStashProgress;
  *(_OWORD *)&self->_interactionContext.initialPosition.y = v4;
  *(_OWORD *)&self->_interactionContext.currentPosition.y = v3;
  *(_OWORD *)&self->_interactionContext.projectedPosition.y = v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regionUnion, 0);
  objc_storeStrong((id *)&self->_regionViews, 0);
  objc_storeStrong((id *)&self->_fakePIPView, 0);
  objc_storeStrong((id *)&self->_insetsGeometryView, 0);
  objc_storeStrong((id *)&self->_extendedGeometryView, 0);
  objc_storeStrong((id *)&self->_mainGeometryView, 0);
  objc_storeStrong((id *)&self->_unionView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
}

@end
