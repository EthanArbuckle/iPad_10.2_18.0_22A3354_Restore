@implementation PUParallaxLayerStackViewManager

- (PUParallaxLayerStackViewManager)initWithViewModel:(id)a3
{
  id v4;
  PUParallaxLayerStackViewManager *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *viewsByLayerIdentifier;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PUParallaxLayerStackViewManager;
  v5 = -[PUParallaxLayerStackViewManager init](&v10, sel_init);
  if (v5)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    viewsByLayerIdentifier = v5->_viewsByLayerIdentifier;
    v5->_viewsByLayerIdentifier = v6;

    objc_storeWeak((id *)&v5->_viewModel, v4);
    objc_msgSend(v4, "registerChangeObserver:context:", v5, "ViewModelObservationContext");
    -[PUParallaxLayerStackViewManager _layoutViewsAnimated:](v5, "_layoutViewsAnimated:", 0);
    +[PUPosterHeadroomSettings sharedInstance](PUPosterHeadroomSettings, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addKeyObserver:", v5);

  }
  return v5;
}

- (PUParallaxLayerStackViewManager)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUParallaxLayerStackViewManager.m"), 55, CFSTR("%s is not available as initializer"), "-[PUParallaxLayerStackViewManager init]");

  abort();
}

- (id)viewForLayer:(id)a3
{
  void *v4;
  void *v5;

  if (a3)
  {
    objc_msgSend(a3, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUParallaxLayerStackViewManager viewForLayerID:](self, "viewForLayerID:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)viewForLayerID:(id)a3
{
  id v4;
  void *v5;
  PUParallaxVideoLayerView *v6;
  void *v7;
  uint64_t v8;
  int v9;
  id WeakRetained;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;

  v4 = a3;
  -[PUParallaxLayerStackViewManager viewsByLayerIdentifier](self, "viewsByLayerIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (PUParallaxVideoLayerView *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[PUParallaxLayerStackViewManager viewModel](self, "viewModel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "environment");

    v9 = PFParallaxLayerIDIsSettlingVideo();
    WeakRetained = objc_loadWeakRetained((id *)&self->_viewModel);
    objc_msgSend(WeakRetained, "currentLayerStack");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "layerWithIdentifier:", v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = v12;
    if (v9)
    {
      if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
      {
        v14 = v13;

        if (v14)
        {
          -[PUParallaxLayerStackViewManager viewModel](self, "viewModel");
          v15 = (id)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v15, "settlingEffectEnabled")
            || !PFPosterEnableSettlingEffect())
          {
            v6 = 0;
            goto LABEL_26;
          }
          -[PUParallaxLayerStackViewManager viewModel](self, "viewModel");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "canCreateSettlingEffectLayerView");

          if (v17)
          {
            v6 = -[PUParallaxVideoLayerView initWithParallaxVideoLayer:]([PUParallaxVideoLayerView alloc], "initWithParallaxVideoLayer:", v14);
            if (-[PUParallaxLayerStackViewManager _debugColorsEnabled](self, "_debugColorsEnabled"))
            {
              -[PUParallaxVideoLayerView layer](v6, "layer");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "setBorderWidth:", 12.0);

              objc_msgSend(MEMORY[0x1E0DC3658], "yellowColor");
              v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              v19 = objc_msgSend(v15, "CGColor");
              -[PUParallaxVideoLayerView layer](v6, "layer");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "setBorderColor:", v19);

LABEL_26:
            }
LABEL_27:

            if (!v6)
            {
LABEL_30:

              goto LABEL_31;
            }
            -[PUParallaxLayerStackViewManager _layoutLayerView:animated:](self, "_layoutLayerView:animated:", v6, 0);
            -[PUParallaxLayerStackViewManager viewsByLayerIdentifier](self, "viewsByLayerIdentifier");
            v14 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "setObject:forKeyedSubscript:", v6, v4);
LABEL_29:

            goto LABEL_30;
          }
        }
      }
      else
      {

        v14 = 0;
      }
      v6 = 0;
      goto LABEL_29;
    }
    if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
      v14 = v13;
    else
      v14 = 0;

    v6 = -[PUParallaxImageLayerView initWithParallaxImageLayer:isEditing:]([PUParallaxImageLayerView alloc], "initWithParallaxImageLayer:isEditing:", v14, v8 == 2);
    if (PFParallaxLayerIDIsForeground())
    {
      if (-[PUParallaxLayerStackViewManager _debugColorsEnabled](self, "_debugColorsEnabled"))
      {
        -[PUParallaxVideoLayerView layer](v6, "layer");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setBorderWidth:", 4.0);

        objc_msgSend(MEMORY[0x1E0DC3658], "blueColor");
        v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v23 = objc_msgSend(v22, "CGColor");
        -[PUParallaxVideoLayerView layer](v6, "layer");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setBorderColor:", v23);

      }
      v25 = objc_loadWeakRetained((id *)&self->_viewModel);
      objc_msgSend(v25, "currentLayerStack");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "foregroundBackfillLayer");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUParallaxVideoLayerView setBackfillParallaxImageLayer:](v6, "setBackfillParallaxImageLayer:", v27);

      -[PUParallaxVideoLayerView setBackfillMaskingEnabled:](v6, "setBackfillMaskingEnabled:", 1);
      goto LABEL_27;
    }
    if (PFParallaxLayerIDIsBackground())
    {
      if (-[PUParallaxLayerStackViewManager _debugColorsEnabled](self, "_debugColorsEnabled"))
      {
        -[PUParallaxVideoLayerView layer](v6, "layer");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setBorderWidth:", 8.0);

        objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
        v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v30 = objc_msgSend(v29, "CGColor");
        -[PUParallaxVideoLayerView layer](v6, "layer");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "setBorderColor:", v30);

      }
      v15 = objc_loadWeakRetained((id *)&self->_viewModel);
      objc_msgSend(v15, "currentLayerStack");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "backgroundBackfillLayer");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUParallaxVideoLayerView setBackfillParallaxImageLayer:](v6, "setBackfillParallaxImageLayer:", v33);

      goto LABEL_26;
    }
    goto LABEL_27;
  }
LABEL_31:

  return v6;
}

- (PUParallaxVideoLayerView)videoLayerView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[PUParallaxLayerStackViewManager viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentLayerStack");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "settlingEffectLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUParallaxLayerStackViewManager viewForLayer:](self, "viewForLayer:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;

  return (PUParallaxVideoLayerView *)v7;
}

- (void)releaseVideoLayerView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[PUParallaxLayerStackViewManager viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "videoLayerView");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "removeFromSuperview");
    -[PUParallaxLayerStackViewManager viewsByLayerIdentifier](self, "viewsByLayerIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "parallaxVideoLayer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObjectForKey:", v7);

  }
}

- (PUParallaxDebugInfoView)debugInfoView
{
  PUParallaxDebugInfoView *debugInfoView;
  PUParallaxDebugInfoView *v4;
  void *v5;
  PUParallaxDebugInfoView *v6;
  PUParallaxDebugInfoView *v7;

  debugInfoView = self->_debugInfoView;
  if (!debugInfoView)
  {
    v4 = [PUParallaxDebugInfoView alloc];
    -[PUParallaxLayerStackViewManager viewModel](self, "viewModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[PUParallaxDebugInfoView initWithViewModel:](v4, "initWithViewModel:", v5);
    v7 = self->_debugInfoView;
    self->_debugInfoView = v6;

    debugInfoView = self->_debugInfoView;
  }
  -[PUParallaxLayerStackViewManager _layoutLayerView:animated:](self, "_layoutLayerView:animated:", debugInfoView, 0);
  return self->_debugInfoView;
}

- (NSArray)createdLayerViews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PUParallaxLayerStackViewManager viewsByLayerIdentifier](self, "viewsByLayerIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUParallaxLayerStackViewManager debugInfoView](self, "debugInfoView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayByAddingObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v6;
}

- (void)layoutViewsAnimated:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __55__PUParallaxLayerStackViewManager_layoutViewsAnimated___block_invoke;
  v3[3] = &unk_1E58ABD10;
  v3[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:completion:", v3, a3, 0.3);
}

- (void)_updateViewContents
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  -[PUParallaxLayerStackViewManager viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentLayerStack");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUParallaxLayerStackViewManager viewsByLayerIdentifier](self, "viewsByLayerIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__PUParallaxLayerStackViewManager__updateViewContents__block_invoke;
  v7[3] = &unk_1E58A9B70;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v7);

}

- (void)_layoutViewsAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v3 = a3;
  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[PUParallaxLayerStackViewManager viewsByLayerIdentifier](self, "viewsByLayerIdentifier", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        -[PUParallaxLayerStackViewManager _layoutLayerView:animated:](self, "_layoutLayerView:animated:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10++), v3);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  -[PUParallaxLayerStackViewManager viewsByLayerIdentifier](self, "viewsByLayerIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v12)
  {
    -[PUParallaxLayerStackViewManager debugInfoView](self, "debugInfoView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUParallaxLayerStackViewManager _layoutLayerView:animated:](self, "_layoutLayerView:animated:", v13, v3);

  }
}

- (void)_layoutLayerView:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;

  v4 = a4;
  v6 = a3;
  -[PUParallaxLayerStackViewManager viewModel](self, "viewModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUParallaxLayerStackViewManager _layerLayoutInfoForViewModel:animateChanges:](self, "_layerLayoutInfoForViewModel:animateChanges:", v7, v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "layoutWithInfo:", v8);
}

- (id)_layerLayoutInfoForViewModel:(id)a3 animateChanges:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  uint64_t v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  _BOOL8 v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  PUParallaxLayerLayoutInfo *v34;
  uint64_t v35;
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
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  PUParallaxLayerLayoutInfo *v56;
  double v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  double v68;

  v4 = a4;
  v5 = a3;
  v6 = objc_msgSend(v5, "layoutOrder");
  objc_msgSend(v5, "visibilityAmount");
  v8 = v7;
  v9 = *MEMORY[0x1E0C9D648];
  v10 = *(_QWORD *)(MEMORY[0x1E0C9D648] + 8);
  v11 = *(_QWORD *)(MEMORY[0x1E0C9D648] + 16);
  v12 = *(_QWORD *)(MEMORY[0x1E0C9D648] + 24);
  v68 = v7;
  if (objc_msgSend(v5, "settlingEffectEnabled") && v8 == 1.0)
  {
    objc_msgSend(v5, "currentLayerStack");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "settlingEffectLayer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "frame");
    v9 = v15;
    v10 = v16;
    v11 = v17;
    v12 = v18;

  }
  v67 = v9;
  objc_msgSend(v5, "currentLayerStack");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "layout");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  +[PUPosterHeadroomSettings sharedInstance](PUPosterHeadroomSettings, "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "falloffHeight");

  objc_msgSend(v20, "extendedImageSize");
  objc_msgSend(v20, "extendedImageSize");
  objc_msgSend(v20, "imageSize");
  objc_msgSend(v20, "imageSize");
  PXRectWithOriginAndSize();
  v62 = v23;
  v63 = v22;
  v60 = v25;
  v61 = v24;
  objc_msgSend(v5, "style");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v26, "hasTonalityMode"))
    v27 = objc_msgSend(v26, "tonality") == 3;
  else
    v27 = 0;
  if (objc_msgSend(v26, "hasHeadroomLook"))
    v27 = objc_msgSend(v26, "headroomLook") == 2;
  v65 = v11;
  v66 = v10;
  v64 = v12;
  if (objc_msgSend(v26, "hasColorParameter"))
  {
    v28 = (void *)MEMORY[0x1E0DC3658];
    objc_msgSend(v26, "color");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "colorWithCGColor:", objc_msgSend(v29, "CGColor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v30 = 0;
  }
  if (v6 == 1)
    v31 = 8;
  else
    v31 = 2;
  +[PUSuggestionsSettings sharedInstance](PUSuggestionsSettings, "sharedInstance");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "parallaxAmount");
  v59 = v33;

  v34 = [PUParallaxLayerLayoutInfo alloc];
  v35 = objc_msgSend(v5, "deviceOrientation");
  objc_msgSend(v5, "containerFrame");
  v37 = v36;
  v39 = v38;
  v58 = v40;
  v42 = v41;
  objc_msgSend(v5, "visibleFrame");
  v44 = v43;
  v46 = v45;
  v48 = v47;
  v50 = v49;
  objc_msgSend(v5, "headroomVisibilityAmount");
  v52 = v51;
  v53 = objc_msgSend(v5, "canApplyParallax");
  objc_msgSend(v5, "parallaxVector");
  v56 = -[PUParallaxLayerLayoutInfo initWithDeviceOrientation:containerFrame:visibleFrame:settlingEffectFrame:headroomFrame:headroomVisibilityAmount:styleIsHighKey:primaryStyleColor:canApplyParallax:parallaxVector:parallaxAmount:visibilityAmount:visibilityEdge:animateChanges:](v34, "initWithDeviceOrientation:containerFrame:visibleFrame:settlingEffectFrame:headroomFrame:headroomVisibilityAmount:styleIsHighKey:primaryStyleColor:canApplyParallax:parallaxVector:parallaxAmount:visibilityAmount:visibilityEdge:animateChanges:", v35, v27, v30, v53, v31, v4, v37, v39, v58, v42, v44, v46, v48, v50, v67,
          v66,
          v65,
          v64,
          v63,
          v62,
          v61,
          v60,
          v52,
          v54,
          v55,
          v59,
          *(_QWORD *)&v68);

  return v56;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  int v6;
  id v9;
  id v10;
  char v11;
  char v12;
  void *v13;
  objc_class *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  id v18;

  v6 = a4;
  v9 = a3;
  if (a5 != "ViewModelObservationContext")
    goto LABEL_14;
  v18 = v9;
  v10 = v9;
  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_4;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "px_descriptionForAssertionMessage");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUParallaxLayerStackViewManager.m"), 239, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("observable"), v15, v17);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUParallaxLayerStackViewManager.m"), 239, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("observable"), v15);
  }

LABEL_4:
  v11 = objc_msgSend(v10, "currentLayerStackPropertiesChange");
  v12 = objc_msgSend(v10, "stylePropertiesChange");
  if ((v6 & 4) != 0 && (v11 & 2) != 0)
    -[PUParallaxLayerStackViewManager _updateViewContents](self, "_updateViewContents");
  if ((v6 & 2) != 0)
    -[PUParallaxLayerStackViewManager _updateViewContents](self, "_updateViewContents");
  if ((*(_QWORD *)&v6 & 0x1A6660) != 0)
    -[PUParallaxLayerStackViewManager _layoutViewsAnimated:](self, "_layoutViewsAnimated:", 0);
  if ((v12 & 6) != 0)
    -[PUParallaxLayerStackViewManager _layoutViewsAnimated:](self, "_layoutViewsAnimated:", 0);

  v9 = v18;
LABEL_14:

}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  -[PUParallaxLayerStackViewManager _layoutViewsAnimated:](self, "_layoutViewsAnimated:", 0, a4);
}

- (BOOL)_debugColorsEnabled
{
  return 0;
}

- (void)setDebugInfoView:(id)a3
{
  objc_storeStrong((id *)&self->_debugInfoView, a3);
}

- (PUParallaxLayerStackViewModel)viewModel
{
  return (PUParallaxLayerStackViewModel *)objc_loadWeakRetained((id *)&self->_viewModel);
}

- (NSMutableDictionary)viewsByLayerIdentifier
{
  return self->_viewsByLayerIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewsByLayerIdentifier, 0);
  objc_destroyWeak((id *)&self->_viewModel);
  objc_storeStrong((id *)&self->_debugInfoView, 0);
}

void __54__PUParallaxLayerStackViewManager__updateViewContents__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  int v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;

  v15 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "layerWithIdentifier:", v15);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = PFParallaxLayerIDIsSettlingVideo();
  v8 = v5;
  if (v7)
  {
    if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;

    v10 = v6;
    if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;

    objc_msgSend(v9, "setParallaxVideoLayer:", v11);
    goto LABEL_24;
  }
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;

  v12 = v6;
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
    v13 = v12;
  else
    v13 = 0;

  objc_msgSend(v9, "setParallaxImageLayer:", v13);
  if (PFParallaxLayerIDIsForeground())
  {
    objc_msgSend(*(id *)(a1 + 32), "foregroundBackfillLayer");
    v14 = objc_claimAutoreleasedReturnValue();
LABEL_23:
    v11 = (id)v14;
    objc_msgSend(v9, "setBackfillParallaxImageLayer:", v14);
LABEL_24:

    goto LABEL_25;
  }
  if (PFParallaxLayerIDIsBackground())
  {
    objc_msgSend(*(id *)(a1 + 32), "backgroundBackfillLayer");
    v14 = objc_claimAutoreleasedReturnValue();
    goto LABEL_23;
  }
LABEL_25:

}

uint64_t __55__PUParallaxLayerStackViewManager_layoutViewsAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_layoutViewsAnimated:", 1);
}

@end
