@implementation PUParallaxImageLayerView

- (PUParallaxImageLayerView)initWithParallaxImageLayer:(id)a3 isEditing:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  PUParallaxImageLayerView *v8;
  PUParallaxImageLayerView *v9;
  CALayer *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  CALayer *maskLayer;
  objc_super v19;
  _QWORD v20[3];
  _QWORD v21[4];

  v4 = a4;
  v21[3] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PUParallaxImageLayerView;
  v8 = -[PUParallaxImageLayerView init](&v19, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_parallaxImageLayer, a3);
    v9->_editing = v4;
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
      v10 = (CALayer *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
      v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      -[CALayer setBackgroundColor:](v10, "setBackgroundColor:", objc_msgSend(v11, "CGColor"));

      v20[0] = CFSTR("bounds");
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = v12;
      v20[1] = CFSTR("position");
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v21[1] = v13;
      v20[2] = CFSTR("frame");
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v21[2] = v14;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[CALayer setActions:](v10, "setActions:", v15);

      -[PUParallaxImageLayerView layer](v9, "layer");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setMask:", v10);

      maskLayer = v9->_maskLayer;
      v9->_maskLayer = v10;

    }
    -[PUParallaxImageLayerView _updateParallaxImageLayerProperties](v9, "_updateParallaxImageLayerProperties");
    -[PUParallaxImageLayerView _updateParallaxHeadroomLayerProperties](v9, "_updateParallaxHeadroomLayerProperties");
  }

  return v9;
}

- (void)setParallaxImageLayer:(id)a3
{
  PFParallaxImageLayer *v5;
  PFParallaxImageLayer *v6;
  char v7;
  PFParallaxImageLayer *v8;

  v8 = (PFParallaxImageLayer *)a3;
  v5 = self->_parallaxImageLayer;
  if (v5 == v8)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[PFParallaxImageLayer isEqual:](v5, "isEqual:", v8);

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_parallaxImageLayer, a3);
      -[PUParallaxImageLayerView _updateParallaxImageLayerProperties](self, "_updateParallaxImageLayerProperties");
      -[PUParallaxImageLayerView _updateParallaxHeadroomLayerProperties](self, "_updateParallaxHeadroomLayerProperties");
    }
  }

}

- (void)setBackfillParallaxImageLayer:(id)a3
{
  PFParallaxImageLayer *v5;
  PFParallaxImageLayer *v6;
  char v7;
  PFParallaxImageLayer *v8;
  PFParallaxImageLayer *v9;

  v9 = (PFParallaxImageLayer *)a3;
  v5 = self->_backfillParallaxImageLayer;
  if (v5 == v9)
  {

    goto LABEL_6;
  }
  v6 = v5;
  v7 = -[PFParallaxImageLayer isEqual:](v5, "isEqual:", v9);

  v8 = v9;
  if (v9 && (v7 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_backfillParallaxImageLayer, a3);
    -[PUParallaxImageLayerView _updateParallaxBackfillLayerProperties](self, "_updateParallaxBackfillLayerProperties");
    -[PUParallaxImageLayerView _updateParallaxHeadroomLayerProperties](self, "_updateParallaxHeadroomLayerProperties");
LABEL_6:
    v8 = v9;
  }

}

- (void)setBackfillMaskingEnabled:(BOOL)a3
{
  if (((!self->_backfillMaskingEnabled ^ a3) & 1) == 0)
  {
    self->_backfillMaskingEnabled = a3;
    -[PUParallaxImageLayerView _updateParallaxBackfillMaskingProperties](self, "_updateParallaxBackfillMaskingProperties");
  }
}

- (void)_updateParallaxImageLayerProperties
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  -[PUParallaxImageLayerView parallaxImageLayer](self, "parallaxImageLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0DC3F10];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __63__PUParallaxImageLayerView__updateParallaxImageLayerProperties__block_invoke;
  v6[3] = &unk_1E58ABCA8;
  v6[4] = self;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "performWithoutAnimation:", v6);

}

- (void)_updateParallaxBackfillLayerProperties
{
  _QWORD v3[5];

  if (-[PUParallaxImageLayerView isEditing](self, "isEditing")
    || objc_msgSend(MEMORY[0x1E0D75340], "deviceSupportsLandscapeConfiguration"))
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __66__PUParallaxImageLayerView__updateParallaxBackfillLayerProperties__block_invoke;
    v3[3] = &unk_1E58ABD10;
    v3[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v3);
  }
}

- (void)_updateParallaxBackfillMaskingProperties
{
  _QWORD v3[5];

  if (-[PUParallaxImageLayerView isEditing](self, "isEditing"))
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __68__PUParallaxImageLayerView__updateParallaxBackfillMaskingProperties__block_invoke;
    v3[3] = &unk_1E58ABD10;
    v3[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v3);
  }
}

- (void)_updateParallaxHeadroomLayerProperties
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  PUHeadroomGradientView *v8;
  PUHeadroomGradientView *v9;
  PUHeadroomGradientView *v10;
  PUHeadroomGradientView *v11;
  void *v12;
  PUHeadroomGradientView *headroomGradientView;

  -[PUParallaxImageLayerView parallaxImageLayer](self, "parallaxImageLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (PFParallaxLayerIDIsBackground())
  {

  }
  else
  {
    -[PUParallaxImageLayerView backfillParallaxImageLayer](self, "backfillParallaxImageLayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = PFParallaxLayerIDIsBackground();

    if (!v7)
    {
      -[PUHeadroomGradientView removeFromSuperview](self->_headroomGradientView, "removeFromSuperview");
      headroomGradientView = self->_headroomGradientView;
      self->_headroomGradientView = 0;

      return;
    }
  }
  v8 = self->_headroomGradientView;
  if (!v8)
  {
    v9 = [PUHeadroomGradientView alloc];
    v10 = -[PUHeadroomGradientView initWithFrame:](v9, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v11 = self->_headroomGradientView;
    self->_headroomGradientView = v10;

    -[PUHeadroomGradientView layer](self->_headroomGradientView, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setZPosition:", 2.0);

    -[PUParallaxImageLayerView addSubview:](self, "addSubview:", self->_headroomGradientView);
    v8 = self->_headroomGradientView;
  }
  -[PUParallaxImageLayerView bringSubviewToFront:](self, "bringSubviewToFront:", v8);
}

- (void)setCurrentLayoutInfo:(id)a3
{
  PUParallaxLayerLayoutInfo *v5;
  PUParallaxLayerLayoutInfo *v6;
  BOOL v7;
  PUParallaxLayerLayoutInfo *v8;

  v8 = (PUParallaxLayerLayoutInfo *)a3;
  v5 = self->_currentLayoutInfo;
  if (v5 == v8)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[PUParallaxLayerLayoutInfo isEqual:](v5, "isEqual:", v8);

    if (!v7)
    {
      objc_storeStrong((id *)&self->_currentLayoutInfo, a3);
      -[PUParallaxImageLayerView _layoutWithCurrentLayoutInfo](self, "_layoutWithCurrentLayoutInfo");
    }
  }

}

- (void)_layoutWithCurrentLayoutInfo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double x;
  double y;
  double width;
  double height;
  void *v19;
  void *v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  void *v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  void *v49;
  uint64_t v50;
  double v51;
  CGFloat v52;
  double v53;
  CGFloat v54;
  double v55;
  CGFloat v56;
  double v57;
  CGFloat v58;
  uint64_t v59;
  void *v60;
  double v61;
  CGFloat v62;
  double v63;
  CGFloat v64;
  double v65;
  CGFloat v66;
  double v67;
  CGFloat v68;
  void *v69;
  uint64_t v70;
  _OWORD v71[6];
  CGAffineTransform v72;
  CGAffineTransform v73;
  CGAffineTransform v74;
  CGAffineTransform v75;
  CGAffineTransform v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;

  -[PUParallaxImageLayerView currentLayoutInfo](self, "currentLayoutInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PUParallaxImageLayerView parallaxImageLayer](self, "parallaxImageLayer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[PUParallaxImageLayerView contentView](self, "contentView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUParallaxImageLayerView backfillMaskView](self, "backfillMaskView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "frame");
      objc_msgSend(v3, "viewFrameForLayerFrame:");
      v8 = v7;
      v10 = v9;
      v12 = v11;
      v14 = v13;
      objc_msgSend(v3, "additionalContentTransform");
      v77.origin.x = v8;
      v77.origin.y = v10;
      v77.size.width = v12;
      v77.size.height = v14;
      v78 = CGRectApplyAffineTransform(v77, &v76);
      x = v78.origin.x;
      y = v78.origin.y;
      width = v78.size.width;
      height = v78.size.height;
      objc_msgSend(v5, "setFrame:");
      objc_msgSend(v6, "setFrame:", x, y, width, height);

    }
    -[PUParallaxImageLayerView backfillParallaxImageLayer](self, "backfillParallaxImageLayer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      -[PUParallaxImageLayerView backfillView](self, "backfillView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "frame");
      objc_msgSend(v3, "viewFrameForLayerFrame:");
      v22 = v21;
      v24 = v23;
      v26 = v25;
      v28 = v27;
      objc_msgSend(v3, "additionalContentTransform");
      v79.origin.x = v22;
      v79.origin.y = v24;
      v79.size.width = v26;
      v79.size.height = v28;
      v80 = CGRectApplyAffineTransform(v79, &v75);
      objc_msgSend(v20, "setFrame:", v80.origin.x, v80.origin.y, v80.size.width, v80.size.height);

    }
    -[PUParallaxImageLayerView headroomGradientView](self, "headroomGradientView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      objc_msgSend(v3, "headroomFrame");
      objc_msgSend(v3, "viewFrameForLayerFrame:");
      v31 = v30;
      v33 = v32;
      v35 = v34;
      v37 = v36;
      objc_msgSend(v3, "additionalContentTransform");
      v81.origin.x = v31;
      v81.origin.y = v33;
      v81.size.width = v35;
      v81.size.height = v37;
      CGRectApplyAffineTransform(v81, &v74);
      -[PUParallaxImageLayerView window](self, "window");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "screen");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      if (v39)
      {
        -[PUParallaxImageLayerView window](self, "window");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "screen");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "scale");

      }
      PXRectRoundToPixel();
      v83 = CGRectInset(v82, -1.0, -1.0);
      objc_msgSend(v29, "setFrame:animated:", objc_msgSend(v3, "animateChanges"), v83.origin.x, v83.origin.y, v83.size.width, v83.size.height);
      objc_msgSend(v3, "headroomVisibilityAmount");
      objc_msgSend(v29, "setVisibilityAmount:");
      objc_msgSend(v29, "setUsesHighKeyStyle:", objc_msgSend(v3, "styleIsHighKey"));
      objc_msgSend(v3, "primaryStyleColor");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setPrimaryGradientColor:", v42);

      objc_msgSend(v29, "setIsInactive:", objc_msgSend(v4, "isInactive"));
    }
    objc_msgSend(v3, "containerFrame");
    v43 = objc_msgSend(v3, "canApplyParallax");
    objc_msgSend(v3, "parallaxAmount");
    if (v43)
      objc_msgSend(v3, "parallaxVector");
    if (!-[PUParallaxImageLayerView isEditing](self, "isEditing"))
      goto LABEL_21;
    -[PUParallaxImageLayerView maskLayer](self, "maskLayer");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "settlingEffectFrame");
    v45 = v84.origin.x;
    v46 = v84.origin.y;
    v47 = v84.size.width;
    v48 = v84.size.height;
    if (CGRectIsEmpty(v84))
    {
      objc_msgSend(v3, "visibilityEdge");
      -[PUParallaxImageLayerView traitCollection](self, "traitCollection");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_msgSend(v49, "layoutDirection");

      if (v50 == 1)
        PXEdgesFlippedHorizontally();
      objc_msgSend(v3, "visibleFrame");
      objc_msgSend(v3, "viewFrameForLayerFrame:");
      v52 = v51;
      v54 = v53;
      v56 = v55;
      v58 = v57;
      objc_msgSend(v3, "additionalContentTransform");
      v85.origin.x = v52;
      v85.origin.y = v54;
      v85.size.width = v56;
      v85.size.height = v58;
      v86 = CGRectApplyAffineTransform(v85, &v72);
      CGRectGetHeight(v86);
      PXRectWithOriginAndSize();
      objc_msgSend(v3, "visibilityAmount");
      v70 = v59;
      PXRectByLinearlyInterpolatingRects();
      PXRectWithSizeAlignedToRectEdges();
      objc_msgSend(v44, "setFrame:", v70);
      objc_msgSend(v3, "visibilityAmount");
      if ((PXFloatApproximatelyEqualToFloat() & 1) != 0)
      {
        v60 = 0;
LABEL_20:
        -[PUParallaxImageLayerView layer](self, "layer");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "setMask:", v60);

LABEL_21:
        objc_msgSend(v3, "additionalTransform");
        v71[0] = v71[3];
        v71[1] = v71[4];
        v71[2] = v71[5];
        -[PUParallaxImageLayerView setTransform:](self, "setTransform:", v71);
        PXRectWithSize();
        -[PUParallaxImageLayerView setBounds:](self, "setBounds:");
        PXRectGetCenter();
        -[PUParallaxImageLayerView setCenter:](self, "setCenter:");

        goto LABEL_22;
      }
    }
    else
    {
      objc_msgSend(v3, "viewFrameForLayerFrame:", v45, v46, v47, v48);
      v62 = v61;
      v64 = v63;
      v66 = v65;
      v68 = v67;
      objc_msgSend(v3, "additionalContentTransform");
      v87.origin.x = v62;
      v87.origin.y = v64;
      v87.size.width = v66;
      v87.size.height = v68;
      v88 = CGRectApplyAffineTransform(v87, &v73);
      objc_msgSend(v44, "setFrame:", v88.origin.x, v88.origin.y, v88.size.width, v88.size.height);
    }
    v60 = v44;
    goto LABEL_20;
  }
LABEL_22:

}

- (id)currentLayoutInfo
{
  return self->_currentLayoutInfo;
}

- (PFParallaxImageLayer)parallaxImageLayer
{
  return self->_parallaxImageLayer;
}

- (PFParallaxImageLayer)backfillParallaxImageLayer
{
  return self->_backfillParallaxImageLayer;
}

- (BOOL)backfillMaskingEnabled
{
  return self->_backfillMaskingEnabled;
}

- (BOOL)isEditing
{
  return self->_editing;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
  objc_storeStrong((id *)&self->_contentView, a3);
}

- (UIView)backfillView
{
  return self->_backfillView;
}

- (void)setBackfillView:(id)a3
{
  objc_storeStrong((id *)&self->_backfillView, a3);
}

- (UIView)backfillMaskView
{
  return self->_backfillMaskView;
}

- (void)setBackfillMaskView:(id)a3
{
  objc_storeStrong((id *)&self->_backfillMaskView, a3);
}

- (PUHeadroomGradientView)headroomGradientView
{
  return self->_headroomGradientView;
}

- (void)setHeadroomGradientView:(id)a3
{
  objc_storeStrong((id *)&self->_headroomGradientView, a3);
}

- (CALayer)maskLayer
{
  return self->_maskLayer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maskLayer, 0);
  objc_storeStrong((id *)&self->_headroomGradientView, 0);
  objc_storeStrong((id *)&self->_backfillMaskView, 0);
  objc_storeStrong((id *)&self->_backfillView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_backfillParallaxImageLayer, 0);
  objc_storeStrong((id *)&self->_parallaxImageLayer, 0);
  objc_storeStrong((id *)&self->_currentLayoutInfo, 0);
}

uint64_t __68__PUParallaxImageLayerView__updateParallaxBackfillMaskingProperties__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;

  if (objc_msgSend(*(id *)(a1 + 32), "backfillMaskingEnabled")
    && (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "layer"),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v2, "contents"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        v2,
        v3))
  {
    if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 464))
    {
      v4 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(void **)(v5 + 464);
      *(_QWORD *)(v5 + 464) = v4;

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "layer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setZPosition:", 0.0);

      +[PUSuggestionsSettings sharedInstance](PUSuggestionsSettings, "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "debugBackfillCompositing");

      if (v9)
      {
        objc_msgSend(MEMORY[0x1E0DC3658], "greenColor");
        v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v11 = objc_msgSend(v10, "CGColor");
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "layer");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setBackgroundColor:", v11);

        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "layer");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        v15 = 0;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
        v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v20 = objc_msgSend(v19, "CGColor");
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "layer");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setBackgroundColor:", v20);

        v22 = *MEMORY[0x1E0CD2C50];
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "layer");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        v15 = v22;
      }
      objc_msgSend(v13, "setCompositingFilter:", v15);

      objc_msgSend(*(id *)(a1 + 32), "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 464));
    }
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "removeFromSuperview");
    v16 = *(_QWORD *)(a1 + 32);
    v17 = *(void **)(v16 + 464);
    *(_QWORD *)(v16 + 464) = 0;

  }
  return objc_msgSend(*(id *)(a1 + 32), "_layoutWithCurrentLayoutInfo");
}

void __66__PUParallaxImageLayerView__updateParallaxBackfillLayerProperties__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "backfillParallaxImageLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 456);
  v11 = v2;
  if (v2)
  {
    if (!v3)
    {
      v4 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(void **)(v5 + 456);
      *(_QWORD *)(v5 + 456) = v4;

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 456), "layer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setZPosition:", -1.0);

      objc_msgSend(*(id *)(a1 + 32), "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 456));
      v2 = v11;
    }
    v8 = objc_msgSend(v2, "image");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 456), "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setContents:", v8);
  }
  else
  {
    objc_msgSend(v3, "removeFromSuperview");
    v10 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v10 + 456);
    *(_QWORD *)(v10 + 456) = 0;
  }

  objc_msgSend(*(id *)(a1 + 32), "_layoutWithCurrentLayoutInfo");
}

uint64_t __63__PUParallaxImageLayerView__updateParallaxImageLayerProperties__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  uint64_t v10;
  void *v11;
  uint64_t result;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 448);
  if (!v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 448);
    *(_QWORD *)(v4 + 448) = v3;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setZPosition:", 1.0);

    objc_msgSend(*(id *)(a1 + 32), "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 448));
    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 448);
  }
  objc_msgSend(v2, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contents");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (v8 != 0) ^ (objc_msgSend(*(id *)(a1 + 40), "image") == 0);

  v10 = objc_msgSend(*(id *)(a1 + 40), "image");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setContents:", v10);

  result = objc_msgSend(*(id *)(a1 + 32), "_layoutWithCurrentLayoutInfo");
  if ((v9 & 1) == 0)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "backfillMaskingEnabled");
    if ((_DWORD)result)
      return objc_msgSend(*(id *)(a1 + 32), "_updateParallaxBackfillMaskingProperties");
  }
  return result;
}

@end
