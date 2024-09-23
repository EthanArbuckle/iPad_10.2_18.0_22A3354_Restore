@implementation PULayoutAnimationsHelper

- (PULayoutAnimationsHelper)initWithSectionedGridLayout:(id)a3
{
  id v4;
  PULayoutAnimationsHelper *v5;
  PULayoutAnimationsHelper *v6;
  PULayoutAnimationsHelper *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PULayoutAnimationsHelper;
  v5 = -[PULayoutAnimationsHelper init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_layout, v4);
    v7 = v6;
  }

  return v6;
}

- (id)animationsForReusableView:(id)a3 toLayoutAttributes:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD aBlock[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __73__PULayoutAnimationsHelper_animationsForReusableView_toLayoutAttributes___block_invoke;
  aBlock[3] = &unk_1E58A1E08;
  aBlock[4] = self;
  v14 = v6;
  v15 = v7;
  v8 = v7;
  v9 = v6;
  v10 = _Block_copy(aBlock);
  v11 = _Block_copy(v10);

  return v11;
}

- (void)didFinishLayoutTransitionAnimations:(BOOL)a3 transitionIsAppearing:(BOOL)a4
{
  id WeakRetained;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    WeakRetained = objc_loadWeakRetained((id *)&self->_layout);
    objc_msgSend(WeakRetained, "collectionView", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "subviews");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v10);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v11, "layer");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "removeAllAnimations");

            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v11, "transitionFillerView");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "layer");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "removeAllAnimations");

            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v11, "setExtendsToTop:", 0);
              objc_msgSend(v11, "setContentExtenderType:", 0);
            }
          }
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v8);
    }

  }
}

- (id)_createDefaultZoomingOutAnimationForKeyPath:(id)a3 ofReusableView:(id)a4 toLayoutAttributes:(id)a5
{
  id v6;
  void *v7;
  float v8;
  float v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  float v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;

  v6 = a3;
  objc_msgSend(a4, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  UIAnimationDragCoefficient();
  v9 = v8;
  objc_msgSend(v7, "presentationLayer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v7, "presentationLayer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "valueForKeyPath:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v7, "valueForKeyPath:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFromValue:", v12);
  objc_msgSend(v13, "setMass:", 0.899999976);
  objc_msgSend(v13, "setStiffness:", (float)(300.0 / (float)(v9 * v9)));
  objc_msgSend(v13, "setDamping:", (float)(400.0 / v9));
  objc_msgSend(v13, "setVelocity:", (float)(0.0 / v9));
  +[PULayoutAnimationsHelper zoomTransitionAnimationPreferredDurationWhenZoomingIn:](PULayoutAnimationsHelper, "zoomTransitionAnimationPreferredDurationWhenZoomingIn:", 0);
  v15 = v14;
  UIAnimationDragCoefficient();
  objc_msgSend(v13, "setDuration:", v15 * v16);
  LODWORD(v17) = 1048165965;
  LODWORD(v18) = 1002897197;
  LODWORD(v19) = 1062925553;
  LODWORD(v20) = *(_DWORD *)"R\n:?";
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v17, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTimingFunction:", v21);

  objc_msgSend(v13, "setFillMode:", *MEMORY[0x1E0CD2B58]);
  return v13;
}

- (id)_createDefaultZoomingInAnimationForKeyPath:(id)a3 ofReusableView:(id)a4 toLayoutAttributes:(id)a5
{
  id v6;
  void *v7;
  float v8;
  float v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  float v16;
  double v17;

  v6 = a3;
  objc_msgSend(a4, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  UIAnimationDragCoefficient();
  v9 = v8;
  objc_msgSend(v7, "presentationLayer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v7, "presentationLayer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "valueForKeyPath:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v7, "valueForKeyPath:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFromValue:", v12);
  +[PULayoutAnimationsHelper zoomTransitionAnimationPreferredDurationWhenZoomingIn:](PULayoutAnimationsHelper, "zoomTransitionAnimationPreferredDurationWhenZoomingIn:", 1);
  v15 = v14;
  UIAnimationDragCoefficient();
  objc_msgSend(v13, "setDuration:", v15 * v16);
  objc_msgSend(v13, "setMass:", 1.0);
  objc_msgSend(v13, "setStiffness:", 250.0 / (float)(v9 * v9));
  v17 = v9;
  objc_msgSend(v13, "setDamping:", 22.0 / v17);
  objc_msgSend(v13, "setVelocity:", 0.0 / v17);
  objc_msgSend(v13, "setFillMode:", *MEMORY[0x1E0CD2B58]);

  return v13;
}

- (id)_defaultAnimationForKeyPath:(id)a3 ofReusableView:(id)a4 toLayoutAttributes:(id)a5
{
  PUSectionedGridLayout **p_layout;
  id v9;
  id v10;
  id v11;
  id WeakRetained;
  int v13;
  void *v14;

  p_layout = &self->_layout;
  v9 = a5;
  v10 = a4;
  v11 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_layout);
  v13 = objc_msgSend(WeakRetained, "transitionZoomingOut");

  if (v13)
    -[PULayoutAnimationsHelper _createDefaultZoomingOutAnimationForKeyPath:ofReusableView:toLayoutAttributes:](self, "_createDefaultZoomingOutAnimationForKeyPath:ofReusableView:toLayoutAttributes:", v11, v10, v9);
  else
    -[PULayoutAnimationsHelper _createDefaultZoomingInAnimationForKeyPath:ofReusableView:toLayoutAttributes:](self, "_createDefaultZoomingInAnimationForKeyPath:ofReusableView:toLayoutAttributes:", v11, v10, v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)_adjustAnimation:(id)a3 forReusableView:(id)a4 toLayoutAttributes:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id WeakRetained;
  void *v15;
  int v16;
  id v17;
  void *v18;
  int v19;
  void *v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v10, "representedElementCategory");
  objc_msgSend(v10, "representedElementKind");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  switch(v11)
  {
    case 2:
      -[PULayoutAnimationsHelper _adjustDecorationViewAnimation:forReusableView:toLayoutAttributes:](self, "_adjustDecorationViewAnimation:forReusableView:toLayoutAttributes:", v8, v9, v10);
      v13 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 1:
      WeakRetained = objc_loadWeakRetained((id *)&self->_layout);
      objc_msgSend(WeakRetained, "sectionHeaderElementKind");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v12, "isEqualToString:", v15);

      if (v16)
      {
        -[PULayoutAnimationsHelper _adjustSectionHeaderAnimation:forReusableView:toLayoutAttributes:](self, "_adjustSectionHeaderAnimation:forReusableView:toLayoutAttributes:", v8, v9, v10);
        v13 = objc_claimAutoreleasedReturnValue();
        goto LABEL_10;
      }
      v17 = objc_loadWeakRetained((id *)&self->_layout);
      objc_msgSend(v17, "renderedStripsElementKind");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v12, "isEqualToString:", v18);

      if (v19)
      {
        -[PULayoutAnimationsHelper _adjustRenderedStripAnimation:forReusableView:toLayoutAttributes:](self, "_adjustRenderedStripAnimation:forReusableView:toLayoutAttributes:", v8, v9, v10);
        v13 = objc_claimAutoreleasedReturnValue();
        goto LABEL_10;
      }
      break;
    case 0:
      -[PULayoutAnimationsHelper _adjustCellAnimation:forReusableView:toLayoutAttributes:](self, "_adjustCellAnimation:forReusableView:toLayoutAttributes:", v8, v9, v10);
      v13 = objc_claimAutoreleasedReturnValue();
LABEL_10:
      v20 = (void *)v13;

      v8 = v20;
      break;
  }

  return v8;
}

- (id)_adjustCellAnimation:(id)a3 forReusableView:(id)a4 toLayoutAttributes:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  char v15;
  void *v16;
  float v17;
  double v18;
  double v19;
  double v20;
  float v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "keyPath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("opacity"));

  -[PULayoutAnimationsHelper layout](self, "layout");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "transitionIsAppearing");

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (v15 = objc_msgSend(v10, "exists"), v12) && (v15 & 1) == 0)
  {
    objc_msgSend(v9, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    UIAnimationDragCoefficient();
    v18 = v17;
    v19 = 0.18;
    if (v14)
      v19 = 0.24;
    v20 = v19 * v18;
    UIAnimationDragCoefficient();
    v22 = v21 * 0.0;
    objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "presentationLayer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      objc_msgSend(v16, "presentationLayer");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "valueForKeyPath:", CFSTR("opacity"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v16, "valueForKeyPath:", CFSTR("opacity"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend(v23, "setFromValue:", v26);
    objc_msgSend(v23, "setDuration:", v20);
    objc_msgSend(v16, "convertTime:fromLayer:", 0, CACurrentMediaTime());
    objc_msgSend(v23, "setBeginTime:", v22 + v27);
    LODWORD(v28) = 1048165965;
    LODWORD(v29) = 1002897197;
    LODWORD(v30) = 1062925553;
    LODWORD(v31) = *(_DWORD *)"R\n:?";
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v28, v29, v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setTimingFunction:", v32);

    objc_msgSend(v23, "setFillMode:", *MEMORY[0x1E0CD2B58]);
    objc_msgSend(v23, "setRemovedOnCompletion:", 0);

  }
  else
  {
    v23 = v8;
  }

  return v23;
}

- (id)_adjustSectionHeaderAnimation:(id)a3 forReusableView:(id)a4 toLayoutAttributes:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  _BOOL4 v13;
  id WeakRetained;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  void *v19;
  int v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  float v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  float v36;
  void *v37;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v10, "indexPath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "section");

  if (v12 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v13 = 0;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_layout);
    objc_msgSend(WeakRetained, "transitionLayout");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_msgSend(v15, "visualSectionForRealSection:", v12);
    if (v16 == 0x7FFFFFFFFFFFFFFFLL || (v17 = v16, objc_msgSend(v15, "mainRealSectionForVisualSection:", v16) != v12))
    {
      v13 = 0;
    }
    else
    {
      objc_msgSend(v9, "frame");
      objc_msgSend(v15, "frameForSectionHeaderAtVisualSection:", v17);
      UIDistanceBetweenPoints();
      v13 = v18 < 3.0;
    }

  }
  -[PULayoutAnimationsHelper layout](self, "layout");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "transitionIsAppearing");

  objc_msgSend(v8, "keyPath");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("opacity"));

  if (v22 && (objc_msgSend(v10, "floating") & 1) == 0)
  {
    objc_msgSend(v9, "layer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (((v20 ^ 1 | v13) & 1) != 0)
    {
      if (v13)
      {
LABEL_21:

        goto LABEL_22;
      }
      objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "presentationLayer");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (v25)
      {
        objc_msgSend(v23, "presentationLayer");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "valueForKeyPath:", CFSTR("opacity"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(v23, "valueForKeyPath:", CFSTR("opacity"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
      }

      objc_msgSend(v24, "setFromValue:", v27);
      UIAnimationDragCoefficient();
      objc_msgSend(v24, "setDuration:", v36 * 0.18);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "presentationLayer");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (v28)
      {
        objc_msgSend(v23, "presentationLayer");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "valueForKeyPath:", CFSTR("opacity"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(v23, "valueForKeyPath:", CFSTR("opacity"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
      }

      objc_msgSend(v24, "setFromValue:", v27);
      UIAnimationDragCoefficient();
      objc_msgSend(v24, "setDuration:", v30 * 0.18);
      objc_msgSend(v23, "convertTime:fromLayer:", 0, CACurrentMediaTime());
      objc_msgSend(v24, "setBeginTime:", v31 + 0.2);
    }
    LODWORD(v32) = 1048165965;
    LODWORD(v33) = 1002897197;
    LODWORD(v34) = 1062925553;
    LODWORD(v35) = *(_DWORD *)"R\n:?";
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v32, v33, v34, v35);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setTimingFunction:", v37);

    objc_msgSend(v24, "setFillMode:", *MEMORY[0x1E0CD2B58]);
    objc_msgSend(v24, "setRemovedOnCompletion:", 0);

    v8 = v24;
    goto LABEL_21;
  }
LABEL_22:

  return v8;
}

- (id)_adjustRenderedStripAnimation:(id)a3 forReusableView:(id)a4 toLayoutAttributes:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  char v15;
  void *v16;
  float v17;
  double v18;
  float v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "keyPath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("opacity"));

  -[PULayoutAnimationsHelper layout](self, "layout");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "transitionIsAppearing");

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (v15 = objc_msgSend(v10, "exists"), ((v14 | v12 ^ 1) & 1) != 0)
    || (v15 & 1) != 0)
  {
    v21 = v8;
  }
  else
  {
    objc_msgSend(v9, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    UIAnimationDragCoefficient();
    v18 = v17 * 0.18;
    UIAnimationDragCoefficient();
    v20 = v19 * 0.0;
    objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "presentationLayer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      objc_msgSend(v16, "presentationLayer");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "valueForKeyPath:", CFSTR("opacity"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v16, "valueForKeyPath:", CFSTR("opacity"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend(v21, "setFromValue:", v24);
    objc_msgSend(v21, "setDuration:", v18);
    objc_msgSend(v16, "convertTime:fromLayer:", 0, CACurrentMediaTime());
    objc_msgSend(v21, "setBeginTime:", v20 + v25);
    LODWORD(v26) = 1048165965;
    LODWORD(v27) = 1002897197;
    LODWORD(v28) = 1062925553;
    LODWORD(v29) = *(_DWORD *)"R\n:?";
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v26, v27, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setTimingFunction:", v30);

    objc_msgSend(v21, "setFillMode:", *MEMORY[0x1E0CD2B58]);
    objc_msgSend(v21, "setRemovedOnCompletion:", 0);

  }
  return v21;
}

- (id)_adjustDecorationViewAnimation:(id)a3 forReusableView:(id)a4 toLayoutAttributes:(id)a5
{
  return a3;
}

- (void)_configureAnimationsForReusableView:(id)a3 toLayoutAttributes:(id)a4 withCompletionBlock:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t);
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  id v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  id v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  BOOL v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id WeakRetained;
  int v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  double v58;
  float v59;
  float v60;
  float v61;
  float v62;
  double v63;
  CGFloat v64;
  double v65;
  double v66;
  void *v67;
  double v68;
  double v69;
  float v70;
  double v71;
  float v72;
  void *v73;
  void *v74;
  void *v75;
  double v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  double v82;
  float v83;
  void *v84;
  void *v85;
  id v86;
  id v87;
  void *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  double v93;
  double v94;
  float v95;
  double v96;
  void *v97;
  void *v98;
  uint64_t v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  id v104;
  char v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  id v109;
  void *v110;
  void *v111;
  int v112;
  void *v113;
  uint64_t v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  _QWORD v120[4];
  id v121;
  id v122;
  CATransform3D v123;
  _QWORD v124[4];
  id v125;
  char v126;
  _QWORD v127[4];
  id v128;
  char v129;
  _QWORD v130[4];
  id v131;
  CATransform3D b;
  CATransform3D a;
  CGRect v134;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t))a5;
  objc_msgSend(v8, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "center");
  v13 = v12;
  v15 = v14;
  objc_msgSend(v8, "center");
  v18 = v15 != v17 || v13 != v16;
  if (v18)
  {
    -[PULayoutAnimationsHelper _defaultAnimationForKeyPath:ofReusableView:toLayoutAttributes:](self, "_defaultAnimationForKeyPath:ofReusableView:toLayoutAttributes:", CFSTR("position"), v8, v9);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PULayoutAnimationsHelper _adjustAnimation:forReusableView:toLayoutAttributes:](self, "_adjustAnimation:forReusableView:toLayoutAttributes:", v19, v8, v9);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = objc_alloc_init(MEMORY[0x1E0D714A0]);
    objc_msgSend(v21, "setCompletion:", v10);
    objc_msgSend(v20, "setDelegate:", v21);

    objc_msgSend(v11, "addAnimation:forKey:", v20, CFSTR("positionAnimation"));
  }
  objc_msgSend(v9, "size");
  v23 = v22;
  v25 = v24;
  objc_msgSend(v8, "bounds");
  if (v23 != v27 || v25 != v26)
  {
    -[PULayoutAnimationsHelper _defaultAnimationForKeyPath:ofReusableView:toLayoutAttributes:](self, "_defaultAnimationForKeyPath:ofReusableView:toLayoutAttributes:", CFSTR("bounds"), v8, v9);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[PULayoutAnimationsHelper _adjustAnimation:forReusableView:toLayoutAttributes:](self, "_adjustAnimation:forReusableView:toLayoutAttributes:", v28, v8, v9);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
    {
      v30 = objc_alloc_init(MEMORY[0x1E0D714A0]);
      objc_msgSend(v30, "setCompletion:", v10);
      objc_msgSend(v29, "setDelegate:", v30);

    }
    objc_msgSend(v11, "addAnimation:forKey:", v29, CFSTR("boundsAnimation"));

    LOBYTE(v18) = 1;
  }
  objc_msgSend(v9, "alpha");
  v32 = v31;
  objc_msgSend(v8, "alpha");
  if (v32 != v33)
  {
    -[PULayoutAnimationsHelper _defaultAnimationForKeyPath:ofReusableView:toLayoutAttributes:](self, "_defaultAnimationForKeyPath:ofReusableView:toLayoutAttributes:", CFSTR("opacity"), v8, v9);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[PULayoutAnimationsHelper _adjustAnimation:forReusableView:toLayoutAttributes:](self, "_adjustAnimation:forReusableView:toLayoutAttributes:", v34, v8, v9);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
    {
      v36 = objc_alloc_init(MEMORY[0x1E0D714A0]);
      objc_msgSend(v36, "setCompletion:", v10);
      objc_msgSend(v35, "setDelegate:", v36);

    }
    objc_msgSend(v11, "addAnimation:forKey:", v35, CFSTR("opacityAnimation"));

    LOBYTE(v18) = 1;
  }
  if (v9)
    objc_msgSend(v9, "transform3D");
  else
    memset(&a, 0, sizeof(a));
  objc_msgSend(v8, "layer");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v37;
  if (v37)
    objc_msgSend(v37, "transform");
  else
    memset(&b, 0, sizeof(b));
  v39 = CATransform3DEqualToTransform(&a, &b);

  if (!v39)
  {
    -[PULayoutAnimationsHelper _defaultAnimationForKeyPath:ofReusableView:toLayoutAttributes:](self, "_defaultAnimationForKeyPath:ofReusableView:toLayoutAttributes:", CFSTR("transform"), v8, v9);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[PULayoutAnimationsHelper _adjustAnimation:forReusableView:toLayoutAttributes:](self, "_adjustAnimation:forReusableView:toLayoutAttributes:", v40, v8, v9);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
    {
      v42 = objc_alloc_init(MEMORY[0x1E0D714A0]);
      objc_msgSend(v42, "setCompletion:", v10);
      objc_msgSend(v41, "setDelegate:", v42);

    }
    objc_msgSend(v11, "addAnimation:forKey:", v41, CFSTR("transformAnimation"));

    LOBYTE(v18) = 1;
  }
  if (-[PULayoutAnimationsHelper shouldAnimateTemporaryImageView](self, "shouldAnimateTemporaryImageView"))
  {
    if (!objc_msgSend(v9, "representedElementCategory"))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v43 = v8;
        objc_msgSend(v43, "temporaryPhotoContentView");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "transitionFillerView");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "layer");
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        v111 = v45;
        objc_msgSend(v45, "layer");
        v108 = objc_claimAutoreleasedReturnValue();
        v117 = v43;
        objc_msgSend(v43, "photoContentView");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "contentHelper");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "badgeContainerView");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "layer");
        v110 = (void *)objc_claimAutoreleasedReturnValue();

        WeakRetained = objc_loadWeakRetained((id *)&self->_layout);
        v50 = objc_msgSend(WeakRetained, "transitionZoomingOut");

        v113 = v44;
        v112 = v50;
        if (v44)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_msgSend(v9, "exists") & 1) != 0 || !v50)
          {
            -[PULayoutAnimationsHelper _defaultAnimationForKeyPath:ofReusableView:toLayoutAttributes:](self, "_defaultAnimationForKeyPath:ofReusableView:toLayoutAttributes:", CFSTR("opacity"), v117, v9);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = (void *)MEMORY[0x1E0CB37E8];
            v53 = v115;
            objc_msgSend(v115, "presentationLayer");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            if (v54)
            {
              objc_msgSend(v115, "presentationLayer");
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v55, "opacity");
              objc_msgSend(v52, "numberWithFloat:");
              v56 = (void *)objc_claimAutoreleasedReturnValue();

              v53 = v115;
            }
            else
            {
              objc_msgSend(v115, "opacity");
              objc_msgSend(v52, "numberWithFloat:");
              v56 = (void *)objc_claimAutoreleasedReturnValue();
            }

            objc_msgSend(v51, "setFromValue:", v56);
            objc_msgSend(v51, "setRemovedOnCompletion:", 0);
            objc_msgSend(v53, "addAnimation:forKey:", v51, CFSTR("opacity"));
            v57 = (void *)MEMORY[0x1E0DC3F10];
            v130[0] = MEMORY[0x1E0C809B0];
            v130[1] = 3221225472;
            v130[2] = __103__PULayoutAnimationsHelper__configureAnimationsForReusableView_toLayoutAttributes_withCompletionBlock___block_invoke;
            v130[3] = &unk_1E58ABD10;
            v131 = v113;
            objc_msgSend(v57, "performWithoutAnimation:", v130);

            v50 = v112;
          }
        }
        if (v50)
          v58 = 0.275;
        else
          v58 = 0.055;
        UIAnimationDragCoefficient();
        v60 = v59;
        UIAnimationDragCoefficient();
        v62 = v61;
        objc_msgSend(v117, "fillerEdgeInsets");
        v64 = fabs(v63);
        objc_msgSend(v117, "bounds");
        if (v64 >= CGRectGetWidth(v134))
        {
          if (v50)
          {
            +[PULayoutAnimationsHelper zoomTransitionAnimationPreferredDurationWhenZoomingIn:](PULayoutAnimationsHelper, "zoomTransitionAnimationPreferredDurationWhenZoomingIn:", 0);
            v69 = v68;
            UIAnimationDragCoefficient();
            v71 = v70;
          }
          else
          {
            UIAnimationDragCoefficient();
            v69 = v72;
            v71 = 0.18;
          }
          v67 = (void *)v108;
          v66 = v69 * v71;
          v65 = 0.0;
        }
        else
        {
          v65 = v58 * v60;
          v66 = v62 * 0.1;
          v67 = (void *)v108;
        }
        objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        v74 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v67, "opacity");
        objc_msgSend(v74, "numberWithFloat:");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "setFromValue:", v75);

        objc_msgSend(v73, "setDuration:", v66);
        objc_msgSend(v67, "convertTime:fromLayer:", 0, CACurrentMediaTime());
        objc_msgSend(v73, "setBeginTime:", v65 + v76);
        v107 = *MEMORY[0x1E0CD3038];
        objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "setTimingFunction:", v77);

        v106 = *MEMORY[0x1E0CD2B58];
        objc_msgSend(v73, "setFillMode:");
        objc_msgSend(v73, "setRemovedOnCompletion:", 0);
        objc_msgSend(v67, "addAnimation:forKey:", v73, CFSTR("opacity"));
        v78 = (void *)MEMORY[0x1E0DC3F10];
        v127[0] = MEMORY[0x1E0C809B0];
        v127[1] = 3221225472;
        v127[2] = __103__PULayoutAnimationsHelper__configureAnimationsForReusableView_toLayoutAttributes_withCompletionBlock___block_invoke_2;
        v127[3] = &unk_1E58AAD68;
        v109 = v67;
        v128 = v109;
        v129 = v112;
        objc_msgSend(v78, "performWithoutAnimation:", v127);
        objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        v80 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v110, "opacity");
        objc_msgSend(v80, "numberWithFloat:");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "setFromValue:", v81);

        if (v112)
          v82 = 0.24;
        else
          v82 = 0.18;
        UIAnimationDragCoefficient();
        objc_msgSend(v79, "setDuration:", v82 * v83);
        objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v107);
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "setTimingFunction:", v84);

        objc_msgSend(v79, "setFillMode:", v106);
        objc_msgSend(v79, "setRemovedOnCompletion:", 0);
        objc_msgSend(v110, "addAnimation:forKey:", v79, CFSTR("opacity"));
        v85 = (void *)MEMORY[0x1E0DC3F10];
        v124[0] = MEMORY[0x1E0C809B0];
        v124[1] = 3221225472;
        v124[2] = __103__PULayoutAnimationsHelper__configureAnimationsForReusableView_toLayoutAttributes_withCompletionBlock___block_invoke_3;
        v124[3] = &unk_1E58AAD68;
        v125 = v110;
        v126 = v112;
        v86 = v110;
        objc_msgSend(v85, "performWithoutAnimation:", v124);

      }
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v87 = v8;
    objc_msgSend(v87, "itemIndexPaths");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = objc_msgSend(v88, "count");
    v90 = objc_msgSend(v87, "numberOfColumns");

    if (v89 == v90)
      v91 = 2;
    else
      v91 = 1;
    objc_msgSend(v87, "setContentExtenderType:", v91);
    if (objc_msgSend(v87, "extendsToTop"))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v87, "topContentView");
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v92, "layer");
        v118 = (void *)objc_claimAutoreleasedReturnValue();

        +[PULayoutAnimationsHelper zoomTransitionAnimationPreferredDurationWhenZoomingIn:](PULayoutAnimationsHelper, "zoomTransitionAnimationPreferredDurationWhenZoomingIn:", 0);
        v94 = v93;
        UIAnimationDragCoefficient();
        v96 = v94 * v95;
        objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v97, "setFromValue:", &unk_1E59BB1D8);
        objc_msgSend(v97, "setDuration:", v96);
        v114 = *MEMORY[0x1E0CD3038];
        objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:");
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v97, "setTimingFunction:", v98);

        v99 = *MEMORY[0x1E0CD2B58];
        objc_msgSend(v97, "setFillMode:", *MEMORY[0x1E0CD2B58]);
        objc_msgSend(v97, "setRemovedOnCompletion:", 1);
        objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("transform"));
        v119 = v11;
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        v101 = (void *)MEMORY[0x1E0CB3B18];
        CATransform3DMakeScale(&v123, 1.0, 0.0, 1.0);
        objc_msgSend(v101, "valueWithCATransform3D:", &v123);
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v100, "setFromValue:", v116);
        objc_msgSend(v100, "setDuration:", v96);
        objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v114);
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v100, "setTimingFunction:", v102);

        objc_msgSend(v100, "setFillMode:", v99);
        objc_msgSend(v100, "setRemovedOnCompletion:", 1);
        objc_msgSend(v118, "addAnimation:forKey:", v97, CFSTR("opacity"));
        objc_msgSend(v118, "addAnimation:forKey:", v100, CFSTR("transform"));
        v103 = (void *)MEMORY[0x1E0DC3F10];
        v120[0] = MEMORY[0x1E0C809B0];
        v120[1] = 3221225472;
        v120[2] = __103__PULayoutAnimationsHelper__configureAnimationsForReusableView_toLayoutAttributes_withCompletionBlock___block_invoke_30;
        v120[3] = &unk_1E58ABCA8;
        v121 = v87;
        v122 = v118;
        v104 = v118;
        objc_msgSend(v103, "performWithoutAnimation:", v120);

        v11 = v119;
      }
    }

  }
  -[PULayoutAnimationsHelper _applyDefaultLayoutAttributes:toView:](self, "_applyDefaultLayoutAttributes:toView:", v9, v8);
  if (v10)
    v105 = v18;
  else
    v105 = 1;
  if ((v105 & 1) == 0)
    v10[2](v10, 1);

}

- (void)_applyDefaultLayoutAttributes:(id)a3 toView:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1E0DC3F10];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __65__PULayoutAnimationsHelper__applyDefaultLayoutAttributes_toView___block_invoke;
  v10[3] = &unk_1E58ABCA8;
  v11 = v6;
  v12 = v5;
  v8 = v5;
  v9 = v6;
  objc_msgSend(v7, "performWithoutAnimation:", v10);

}

- (PUSectionedGridLayout)layout
{
  return (PUSectionedGridLayout *)objc_loadWeakRetained((id *)&self->_layout);
}

- (BOOL)shouldAnimateTemporaryImageView
{
  return self->_shouldAnimateTemporaryImageView;
}

- (void)setShouldAnimateTemporaryImageView:(BOOL)a3
{
  self->_shouldAnimateTemporaryImageView = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_layout);
}

void __65__PULayoutAnimationsHelper__applyDefaultLayoutAttributes_toView___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  _OWORD v12[8];

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "center");
  objc_msgSend(v2, "setCenter:");
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  v4 = v3;
  v6 = v5;
  objc_msgSend(*(id *)(a1 + 40), "size");
  objc_msgSend(*(id *)(a1 + 32), "setBounds:", v4, v6, v7, v8);
  v9 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "alpha");
  objc_msgSend(v9, "setAlpha:");
  objc_msgSend(*(id *)(a1 + 32), "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(void **)(a1 + 40);
  if (v11)
    objc_msgSend(v11, "transform3D");
  else
    memset(v12, 0, sizeof(v12));
  objc_msgSend(v10, "setTransform:", v12);

}

uint64_t __103__PULayoutAnimationsHelper__configureAnimationsForReusableView_toLayoutAttributes_withCompletionBlock___block_invoke(uint64_t a1)
{
  double v2;

  objc_msgSend(*(id *)(a1 + 32), "alpha");
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0 - v2);
}

uint64_t __103__PULayoutAnimationsHelper__configureAnimationsForReusableView_toLayoutAttributes_withCompletionBlock___block_invoke_2(uint64_t a1, double a2)
{
  LODWORD(a2) = 0;
  if (!*(_BYTE *)(a1 + 40))
    *(float *)&a2 = 1.0;
  return objc_msgSend(*(id *)(a1 + 32), "setOpacity:", a2);
}

uint64_t __103__PULayoutAnimationsHelper__configureAnimationsForReusableView_toLayoutAttributes_withCompletionBlock___block_invoke_3(uint64_t a1, double a2)
{
  LODWORD(a2) = 0;
  if (!*(_BYTE *)(a1 + 40))
    *(float *)&a2 = 1.0;
  return objc_msgSend(*(id *)(a1 + 32), "setOpacity:", a2);
}

uint64_t __103__PULayoutAnimationsHelper__configureAnimationsForReusableView_toLayoutAttributes_withCompletionBlock___block_invoke_30(uint64_t a1)
{
  void *v2;
  void *v3;
  CATransform3D v5;
  CATransform3D v6;

  objc_msgSend(*(id *)(a1 + 32), "topContentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 0.699999988);

  memset(&v6, 0, sizeof(v6));
  CATransform3DMakeScale(&v6, 1.0, -1.0, 1.0);
  v3 = *(void **)(a1 + 40);
  v5 = v6;
  return objc_msgSend(v3, "setTransform:", &v5);
}

void __73__PULayoutAnimationsHelper_animationsForReusableView_toLayoutAttributes___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  _QWORD aBlock[4];
  id v7;

  v3 = a2;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __73__PULayoutAnimationsHelper_animationsForReusableView_toLayoutAttributes___block_invoke_2;
  aBlock[3] = &unk_1E58AA518;
  v7 = v3;
  v4 = v3;
  v5 = _Block_copy(aBlock);
  objc_msgSend(*(id *)(a1 + 32), "_configureAnimationsForReusableView:toLayoutAttributes:withCompletionBlock:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v5);

}

uint64_t __73__PULayoutAnimationsHelper_animationsForReusableView_toLayoutAttributes___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

+ (double)zoomTransitionAnimationPreferredDurationWhenZoomingIn:(BOOL)a3
{
  double result;

  if (!a3)
    return 0.6;
  objc_msgSend(MEMORY[0x1E0DC3F10], "pu_springOscillationRootAtIndex:forMass:stiffness:damping:initialVelocity:", 2, 1.0, 250.0, 22.0, 0.0);
  return result;
}

+ (id)stackedTransitionAnimationsForReusableView:(id)a3 toLayoutAttributes:(id)a4 shouldUseSpringAnimations:(BOOL)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD aBlock[4];
  id v15;
  id v16;
  BOOL v17;

  v7 = a3;
  v8 = a4;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __116__PULayoutAnimationsHelper_stackedTransitionAnimationsForReusableView_toLayoutAttributes_shouldUseSpringAnimations___block_invoke;
  aBlock[3] = &unk_1E58A1E30;
  v15 = v7;
  v16 = v8;
  v17 = a5;
  v9 = v8;
  v10 = v7;
  v11 = _Block_copy(aBlock);
  v12 = _Block_copy(v11);

  return v12;
}

+ (double)stackedTransitionAnimationPreferredDurationUsingSpringAnimations:(BOOL)a3
{
  double result;

  if (!a3)
    return 0.3;
  objc_msgSend(MEMORY[0x1E0DC3F10], "pu_springOscillationRootAtIndex:forMass:stiffness:damping:initialVelocity:", 2, 1.0, 200.0, 22.0, 0.0);
  return result;
}

void __116__PULayoutAnimationsHelper_stackedTransitionAnimationsForReusableView_toLayoutAttributes_shouldUseSpringAnimations___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  _QWORD aBlock[4];
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __116__PULayoutAnimationsHelper_stackedTransitionAnimationsForReusableView_toLayoutAttributes_shouldUseSpringAnimations___block_invoke_2;
  aBlock[3] = &unk_1E58A9C48;
  v19 = *(id *)(a1 + 32);
  v20 = *(id *)(a1 + 40);
  v21 = v5;
  v22 = v7;
  v23 = v9;
  v24 = v11;
  v13 = _Block_copy(aBlock);
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __116__PULayoutAnimationsHelper_stackedTransitionAnimationsForReusableView_toLayoutAttributes_shouldUseSpringAnimations___block_invoke_3;
  v16[3] = &unk_1E58AA518;
  v14 = v3;
  v17 = v14;
  v15 = _Block_copy(v16);
  if (*(_BYTE *)(a1 + 48))
    objc_msgSend(MEMORY[0x1E0DC3F10], "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", 5, v13, v15, 0.3, 0.0, 1.0, 200.0, 22.0, 0.0);
  else
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 5, v13, v15, 0.3, 0.0);

}

void __116__PULayoutAnimationsHelper_stackedTransitionAnimationsForReusableView_toLayoutAttributes_shouldUseSpringAnimations___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  _OWORD v10[8];

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "center");
  objc_msgSend(v2, "setCenter:");
  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "alpha");
  objc_msgSend(v3, "setAlpha:");
  v4 = *(double *)(a1 + 48);
  v5 = *(double *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 40), "size");
  objc_msgSend(*(id *)(a1 + 32), "setBounds:", v4, v5, v6, v7);
  objc_msgSend(*(id *)(a1 + 32), "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(void **)(a1 + 40);
  if (v9)
    objc_msgSend(v9, "transform3D");
  else
    memset(v10, 0, sizeof(v10));
  objc_msgSend(v8, "setTransform:", v10);

}

uint64_t __116__PULayoutAnimationsHelper_stackedTransitionAnimationsForReusableView_toLayoutAttributes_shouldUseSpringAnimations___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

@end
