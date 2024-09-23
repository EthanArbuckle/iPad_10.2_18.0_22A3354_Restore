@implementation UIKBHandwritingView

- (UIKBHandwritingView)initWithFrame:(CGRect)a3 keyplane:(id)a4 key:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  id v12;
  UIKBHandwritingView *v13;
  UIKBHandwritingView *v14;
  UIKBHandwritingInputSpeedModel *v15;
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
  uint64_t v27;
  double v28;
  UIKBHandwritingStrokeView *v29;
  UIKBHandwritingStrokeView *v30;
  void *v31;
  char v32;
  void *v33;
  void *v34;
  UIKBHandwritingQuadCurvePointFIFO *v35;
  void *v36;
  UIKBHandwritingQuadCurvePointFIFO *v37;
  id v38;
  void *v39;
  char v40;
  void *v41;
  void *v42;
  UIKBHandwritingBezierPathPointFIFO *v43;
  void *v44;
  UIKBHandwritingBoxcarFilterPointFIFO *v45;
  void *v46;
  void *v47;
  UIKBHandwritingBoxcarFilterPointFIFO *v48;
  UIKBHandwritingStrokePointFIFO *v49;
  void *v50;
  UIKBHandwritingStrokePointFIFO *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  double v57;
  double v58;
  void *v59;
  uint64_t v60;
  void *v61;
  UIKBHandwritingView *v62;
  uint64_t v64;
  UIKBHandwritingStrokeView *v65;
  id v66[2];
  id location;
  _QWORD v68[4];
  id v69;
  UIKBHandwritingStrokeView *v70;
  objc_super v71;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = a4;
  v12 = a5;
  v71.receiver = self;
  v71.super_class = (Class)UIKBHandwritingView;
  v13 = -[UIKBKeyView initWithFrame:keyplane:key:](&v71, sel_initWithFrame_keyplane_key_, v11, v12, x, y, width, height);
  v14 = v13;
  if (!v13)
    goto LABEL_20;
  -[UIKBHandwritingView setInkMask:](v13, "setInkMask:", 0);
  -[UIView setOpaque:](v14, "setOpaque:", 0);
  -[UIView setClipsToBounds:](v14, "setClipsToBounds:", 1);
  -[UIView setEnabled:](v14, "setEnabled:", 1);
  v15 = objc_alloc_init(UIKBHandwritingInputSpeedModel);
  -[UIKBHandwritingView setInputSpeedModel:](v14, "setInputSpeedModel:", v15);

  -[UIView bounds](v14, "bounds");
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  -[UIKBHandwritingView inputSpeedModel](v14, "inputSpeedModel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setHandwritingFrame:", v17, v19, v21, v23);

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBHandwritingView setActiveTouches:](v14, "setActiveTouches:", v25);

  -[UIView setMultipleTouchEnabled:](v14, "setMultipleTouchEnabled:", 0);
  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "userInterfaceIdiom");
  v28 = 2.7;
  if (!v27)
    v28 = 2.5;
  -[UIKBHandwritingView setInkWidth:](v14, "setInkWidth:", v28);

  -[UIKBHandwritingView updateInkColor](v14, "updateInkColor");
  v29 = [UIKBHandwritingStrokeView alloc];
  -[UIView bounds](v14, "bounds");
  v30 = -[UIView initWithFrame:](v29, "initWithFrame:");
  -[UIView setUserInteractionEnabled:](v30, "setUserInteractionEnabled:", 0);
  -[UIView setOpaque:](v30, "setOpaque:", 0);
  -[UIKBHandwritingStrokeView setKeyView:](v30, "setKeyView:", v14);
  -[UIView setContentMode:](v30, "setContentMode:", 5);
  -[UIView addSubview:](v14, "addSubview:", v30);
  -[UIKBHandwritingView setStrokeView:](v14, "setStrokeView:", v30);
  -[UIKBHandwritingView recreateInkMaskIfNeeded](v14, "recreateInkMaskIfNeeded");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBHandwritingView setInterpolatedPoints:](v14, "setInterpolatedPoints:", v31);

  v32 = objc_msgSend(MEMORY[0x1E0CA58E0], "isCurrentProcessAnApplicationExtension");
  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v33, "_supportsForceTouch") & 1) == 0)
  {
    if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      v40 = +[UIDevice _isLowEnd](UIDevice, "_isLowEnd") | v32;

      if ((v40 & 1) == 0)
        goto LABEL_6;
    }
    else
    {

    }
    objc_initWeak(&location, v14);
    -[UIKBHandwritingView inkWidth](v14, "inkWidth");
    v42 = v41;
    v43 = -[UIKBHandwritingBezierPathPointFIFO initWithFIFO:]([UIKBHandwritingBezierPathPointFIFO alloc], "initWithFIFO:", 0);
    -[UIKBHandwritingView setBezierPathFIFO:](v14, "setBezierPathFIFO:", v43);

    v64 = MEMORY[0x1E0C809B0];
    objc_copyWeak(v66, &location);
    v66[1] = v42;
    v65 = v30;
    -[UIKBHandwritingView bezierPathFIFO](v14, "bezierPathFIFO", v64, 3221225472, __50__UIKBHandwritingView_initWithFrame_keyplane_key___block_invoke_2, &unk_1E16D3840);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setEmissionHandler:", &v64);

    objc_destroyWeak(v66);
    objc_destroyWeak(&location);
    goto LABEL_12;
  }

LABEL_6:
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBHandwritingView setCurrentPoints:](v14, "setCurrentPoints:", v34);
  v35 = [UIKBHandwritingQuadCurvePointFIFO alloc];
  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "scale");
  v37 = -[UIKBHandwritingQuadCurvePointFIFO initWithFIFO:scale:](v35, "initWithFIFO:scale:", 0);
  -[UIKBHandwritingView setInterpolatingFIFO:](v14, "setInterpolatingFIFO:", v37);

  v68[0] = MEMORY[0x1E0C809B0];
  v68[1] = 3221225472;
  v68[2] = __50__UIKBHandwritingView_initWithFrame_keyplane_key___block_invoke;
  v68[3] = &unk_1E16D3818;
  v38 = v34;
  v69 = v38;
  v70 = v30;
  -[UIKBHandwritingView interpolatingFIFO](v14, "interpolatingFIFO");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setEmissionHandler:", v68);

LABEL_12:
  v45 = [UIKBHandwritingBoxcarFilterPointFIFO alloc];
  -[UIKBHandwritingView bezierPathFIFO](v14, "bezierPathFIFO");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v46;
  if (!v46)
  {
    -[UIKBHandwritingView interpolatingFIFO](v14, "interpolatingFIFO");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v48 = -[UIKBHandwritingBoxcarFilterPointFIFO initWithFIFO:width:](v45, "initWithFIFO:width:", v47, 3);
  -[UIKBHandwritingView setSmoothingFIFO:](v14, "setSmoothingFIFO:", v48);

  if (!v46)
  v49 = [UIKBHandwritingStrokePointFIFO alloc];
  -[UIKBHandwritingView smoothingFIFO](v14, "smoothingFIFO");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = -[UIKBHandwritingStrokePointFIFO initWithFIFO:](v49, "initWithFIFO:", v50);
  -[UIKBHandwritingView setStrokeFIFO:](v14, "setStrokeFIFO:", v51);

  -[UIKBKeyView factory](v14, "factory");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBKeyView key](v14, "key");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBKeyView keyplane](v14, "keyplane");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "traitsForKey:onKeyplane:", v53, v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v55, "geometry");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "roundRectRadius");
  v58 = v57;

  if (v58 != 0.0)
  {
    objc_msgSend(v55, "geometry");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = objc_msgSend(v59, "roundRectCorners") & 0xF;

    if (v60)
    {
      -[UIView layer](v14, "layer");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "setCornerRadius:", v58);

    }
  }
  v62 = v14;

LABEL_20:
  return v14;
}

void __50__UIKBHandwritingView_initWithFrame_keyplane_key___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "lastObject");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v19;
    do
    {
      v8 = 0;
      v9 = v4;
      do
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v8);
        objc_msgSend(v10, "UIKBHandwritingPointValue", (_QWORD)v18);
        v12 = v11;
        v14 = v13;
        v16 = v15;
        if (v9)
        {
          v17 = *(void **)(a1 + 40);
          objc_msgSend(v9, "UIKBHandwritingPointValue");
          objc_msgSend(v17, "addTrapezoidFromFirstPoint:secondPoint:");
        }
        objc_msgSend(*(id *)(a1 + 32), "addObject:", v10);
        objc_msgSend(*(id *)(a1 + 40), "addHandwritingPoint:", v12, v14, v16);
        v4 = v10;

        ++v8;
        v9 = v4;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v6);
  }

  objc_msgSend(*(id *)(a1 + 40), "displayAggregateInvalidRect");
}

void __50__UIKBHandwritingView_initWithFrame_keyplane_key___block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  double x;
  double y;
  double width;
  double height;
  void *v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
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
  id v40;
  CGRect v41;
  CGRect v42;

  v40 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    x = *MEMORY[0x1E0C9D628];
    y = *(double *)(MEMORY[0x1E0C9D628] + 8);
    width = *(double *)(MEMORY[0x1E0C9D628] + 16);
    height = *(double *)(MEMORY[0x1E0C9D628] + 24);
    if (objc_msgSend(v40, "count") == 1)
    {
      objc_msgSend(v40, "objectAtIndexedSubscript:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "CGPointValue");
      v10 = v9;
      v11 = *(double *)(a1 + 48);
      objc_msgSend(v40, "objectAtIndexedSubscript:", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "CGPointValue");
      x = v10 + v11 * -0.5;
      width = *(double *)(a1 + 48);
      y = v13 + width * -0.5;

      height = width;
    }
    else if ((unint64_t)objc_msgSend(v40, "count") >= 2)
    {
      objc_msgSend(v40, "objectAtIndexedSubscript:", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "CGPointValue");
      v16 = v15;
      v18 = v17;

      objc_msgSend(v40, "objectAtIndexedSubscript:", 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "CGPointValue");
      v21 = v20;
      v23 = v22;

      v24 = v16 >= v21 ? v21 : v16;
      v25 = *(double *)(a1 + 48);
      v26 = v18 >= v23 ? v23 : v18;
      x = v24 - v25 * 0.5;
      y = v26 - v25 * 0.5;
      width = vabdd_f64(v21, v16) + v25;
      height = vabdd_f64(v23, v18) + v25;
      if (objc_msgSend(v40, "count") == 3)
      {
        objc_msgSend(v40, "objectAtIndexedSubscript:", 2);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "CGPointValue");
        v29 = v28;
        v31 = v30;

        if (v21 >= v29)
          v32 = v29;
        else
          v32 = v21;
        v33 = *(double *)(a1 + 48);
        v34 = v32 - v33 * 0.5;
        if (v23 >= v31)
          v35 = v31;
        else
          v35 = v23;
        v36 = v35 - v33 * 0.5;
        v37 = vabdd_f64(v29, v21) + v33;
        v38 = vabdd_f64(v31, v23) + v33;
        v41.origin.x = x;
        v41.origin.y = y;
        v41.size.width = width;
        v41.size.height = height;
        v42 = CGRectUnion(v41, *(CGRect *)&v34);
        x = v42.origin.x;
        y = v42.origin.y;
        width = v42.size.width;
        height = v42.size.height;
      }
    }
    objc_msgSend(WeakRetained, "pageOffset");
    objc_msgSend(*(id *)(a1 + 32), "setNeedsDisplayInRect:", x - v39, y, width, height);
  }

}

- (void)recreateInkMaskIfNeeded
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  double y;
  double x;
  CGFloat width;
  CGFloat height;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  double v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  CGFloat v45;
  CGImage *inkMask;
  double v47;
  void *v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  CGFloat v56;
  double v57;
  CGFloat v58;
  double v59;
  CGImage *v60;
  CGImage **p_inkMask;
  size_t v62;
  size_t v63;
  CGColorSpace *v64;
  CGContext *v65;
  CGImageRef Image;
  void *v67;
  BOOL v69;
  double sx;
  double v71;
  double v72;
  CGAffineTransform transform;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _BYTE v78[128];
  uint64_t v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;

  v79 = *MEMORY[0x1E0C80C00];
  -[UIKBHandwritingView strokeView](self, "strokeView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v71 = v5;
  v72 = v4;
  v7 = v6;
  v9 = v8;

  sx = UIKBScale();
  x = *MEMORY[0x1E0C9D628];
  y = *(double *)(MEMORY[0x1E0C9D628] + 8);
  width = *(double *)(MEMORY[0x1E0C9D628] + 16);
  height = *(double *)(MEMORY[0x1E0C9D628] + 24);
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  v14 = objc_msgSend(&unk_1E1A93890, "countByEnumeratingWithState:objects:count:", &v74, v78, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v75;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v75 != v15)
          objc_enumerationMutation(&unk_1E1A93890);
        v17 = *(_QWORD *)(*((_QWORD *)&v74 + 1) + 8 * v16);
        -[UIKBKeyView keyplane](self, "keyplane");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "firstCachedKeyWithName:", v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
        {
          objc_msgSend(v19, "frame");
          v91.origin.x = v20;
          v91.origin.y = v21;
          v91.size.width = v22;
          v91.size.height = v23;
          v80.origin.x = x;
          v80.origin.y = y;
          v80.size.width = width;
          v80.size.height = height;
          v81 = CGRectUnion(v80, v91);
          x = v81.origin.x;
          y = v81.origin.y;
          width = v81.size.width;
          height = v81.size.height;
        }

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(&unk_1E1A93890, "countByEnumeratingWithState:objects:count:", &v74, v78, 16);
    }
    while (v14);
  }
  -[UIKBKeyView key](self, "key");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "frame");
  v26 = v25;

  -[UIKBKeyView key](self, "key");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "frame");
  v29 = v28;

  v30 = x - v26;
  v31 = y - v29;
  v82.origin.x = v30;
  v82.origin.y = v31;
  v82.size.width = width;
  v82.size.height = height;
  if (CGRectIsEmpty(v82))
    return;
  v83.size.height = v71;
  v83.origin.x = v72;
  v83.origin.y = v7;
  v83.size.width = v9;
  v92.origin.x = v30;
  v92.origin.y = v31;
  v92.size.width = width;
  v92.size.height = height;
  if (!CGRectIntersectsRect(v83, v92))
    return;
  v84.size.height = v71;
  v84.origin.x = v72;
  v84.origin.y = v7;
  v84.size.width = v9;
  v93.origin.x = v30;
  v93.origin.y = v31;
  v93.size.width = width;
  v93.size.height = height;
  v85 = CGRectIntersection(v84, v93);
  v32 = v85.origin.x;
  v33 = v85.origin.y;
  v34 = v85.size.width;
  v35 = v85.size.height;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "currentHandBias");

  -[UIKBKeyView screenTraits](self, "screenTraits");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v38, "idiom") != 1)
  {
    -[UIKBKeyView screenTraits](self, "screenTraits");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v39, "idiom") != 24)
    {
      -[UIKBKeyView screenTraits](self, "screenTraits");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v40, "idiom") != 25)
      {
        -[UIKBKeyView screenTraits](self, "screenTraits");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v41, "idiom") != 26)
        {
          -[UIKBKeyView screenTraits](self, "screenTraits");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          v69 = objc_msgSend(v67, "idiom") == 23 || v37 != 0;

          if (!v69)
            goto LABEL_21;
          goto LABEL_20;
        }

      }
    }

  }
LABEL_20:
  v32 = 0.0;
  v34 = v9;
LABEL_21:
  v86.size.height = v35 + v35;
  v86.origin.x = v32;
  v86.origin.y = v33;
  v86.size.width = v34;
  v87 = CGRectOffset(v86, -v72, -v7);
  v42 = v87.origin.x;
  v43 = v87.origin.y;
  v44 = v87.size.width;
  v45 = v87.size.height;
  inkMask = self->_inkMask;
  if (!inkMask)
    goto LABEL_26;
  v47 = (double)CGImageGetHeight(inkMask) - v71 * sx;
  if (v47 < 0.0)
    v47 = -v47;
  if (v47 >= 1.0)
  {
    CFRelease(self->_inkMask);
    self->_inkMask = 0;
LABEL_26:
    self->_inkMask = UIKBCreateFadeClipImage(1, 0, v72, v7, v9, v71, v42, v43, v44, v45, 1.0);
    if (v37)
    {
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "_layout");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "biasedKeyboardWidthRatio");
      v51 = v50;

      v52 = v9 * (1.0 - v51);
      v54 = v71;
      v53 = v72;
      v55 = v7;
      v56 = v9;
      if (v37 == 2)
      {
        v57 = CGRectGetWidth(*(CGRect *)&v53);
        v88.size.height = v71;
        v88.origin.x = v72;
        v88.origin.y = v7;
        v88.size.width = v9;
        v58 = CGRectGetHeight(v88);
        v59 = v57 - v52;
      }
      else
      {
        v58 = CGRectGetHeight(*(CGRect *)&v53);
        v59 = 0.0;
      }
      v60 = UIKBCreateFadeClipImage(v37 == 1, 1, v72, v7, v9, v71, v59, 0.0, v52, v58, 1.0);
      p_inkMask = &self->_inkMask;
      v62 = CGImageGetWidth(self->_inkMask);
      v63 = CGImageGetHeight(self->_inkMask);
      v64 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9DA18]);
      v65 = CGBitmapContextCreate(0, v62, v63, 8uLL, v62, v64, 0);
      CGAffineTransformMakeScale(&transform, sx, sx);
      CGContextConcatCTM(v65, &transform);
      v89.size.height = v71;
      v89.origin.x = v72;
      v89.origin.y = v7;
      v89.size.width = v9;
      CGContextClipToMask(v65, v89, *p_inkMask);
      v90.size.height = v71;
      v90.origin.x = v72;
      v90.origin.y = v7;
      v90.size.width = v9;
      CGContextDrawImage(v65, v90, v60);
      Image = CGBitmapContextCreateImage(v65);
      CGContextRelease(v65);
      CGColorSpaceRelease(v64);
      CGImageRelease(v60);
      CGImageRelease(*p_inkMask);
      *p_inkMask = Image;
    }
  }
}

- (id)layerForRenderFlags:(int64_t)a3
{
  char v3;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double height;
  double x;
  double y;
  double width;
  double v17;
  double v18;
  double v19;
  double v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  CGAffineTransform v25;
  CGAffineTransform v26;
  double v27;
  objc_super v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;

  v3 = a3;
  v28.receiver = self;
  v28.super_class = (Class)UIKBHandwritingView;
  -[UIKBKeyView layerForRenderFlags:](&v28, sel_layerForRenderFlags_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((v3 & 1) != 0)
  {
    objc_msgSend(v5, "setContentsScaling:", *MEMORY[0x1E0CD29F8]);
    -[UIKBKeyView key](self, "key");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "originalFrame");
    v9 = v8;

    -[UIKBKeyView key](self, "key");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "frame");
    v12 = v11;

    if (v12 >= 1.0)
    {
      if (v12 <= v9)
        height = 1.0;
      else
        height = v9 / v12;
      if (v6)
      {
        objc_msgSend(v6, "affineTransform");
        if (v27 < 0.0)
        {
          v23 = *(_OWORD *)-[UIKBHandwritingView layerForRenderFlags:]::invertTransform;
          v24 = *(_OWORD *)&-[UIKBHandwritingView layerForRenderFlags:]::invertTransform[16];
          v26 = *(CGAffineTransform *)-[UIKBHandwritingView layerForRenderFlags:]::invertTransform;
          v22 = *(_OWORD *)&-[UIKBHandwritingView layerForRenderFlags:]::invertTransform[32];
          v29.origin.x = 0.0;
          v29.origin.y = 0.0;
          v29.size.width = 1.0;
          v29.size.height = height;
          v30 = CGRectApplyAffineTransform(v29, &v26);
          x = v30.origin.x;
          y = v30.origin.y;
          width = v30.size.width;
          height = v30.size.height;
          v25 = *(CGAffineTransform *)-[UIKBHandwritingView layerForRenderFlags:]::invertTransform;
          v30.origin.y = 0.99;
          v30.size.height = 0.01;
          v30.origin.x = 0.0;
          v30.size.width = 1.0;
          v31 = CGRectApplyAffineTransform(v30, &v25);
          v17 = v31.origin.x;
          v18 = v31.origin.y;
          v19 = v31.size.width;
          v20 = v31.size.height;
LABEL_12:
          objc_msgSend(v6, "setContentsRect:", x, y, width, height, v22, v23, v24);
          objc_msgSend(v6, "setContentsCenter:", v17, v18, v19, v20);
          return v6;
        }
        v17 = 0.0;
        v19 = 1.0;
        v18 = 0.99;
        v20 = 0.01;
      }
      else
      {
        v17 = 0.0;
        v19 = 1.0;
        v18 = 0.99;
        v20 = 0.01;
      }
      width = 1.0;
      y = 0.0;
      x = 0.0;
      goto LABEL_12;
    }
  }
  return v6;
}

- (void)displayLayer:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[UIKBHandwritingView recreateInkMaskIfNeeded](self, "recreateInkMaskIfNeeded");
  v5.receiver = self;
  v5.super_class = (Class)UIKBHandwritingView;
  -[UIKBKeyView displayLayer:](&v5, sel_displayLayer_, v4);

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  objc_super v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)UIKBHandwritingView;
  -[UIView layoutSubviews](&v17, sel_layoutSubviews);
  -[UIView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[UIKBHandwritingView strokeView](self, "strokeView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frame");
  v9 = v8;
  v11 = v10;
  v13 = v12;

  if (v6 < v13)
    v6 = v13;
  -[UIKBHandwritingView strokeView](self, "strokeView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFrame:", v9, v11, v4, v6);

  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  v16.receiver = self;
  v16.super_class = (Class)UIKBHandwritingView;
  -[UIKBKeyView layerForRenderFlags:](&v16, sel_layerForRenderFlags_, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bounds](self, "bounds");
  objc_msgSend(v15, "setFrame:");
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");

}

- (void)dealloc
{
  CGImage *inkMask;
  objc_super v4;

  inkMask = self->_inkMask;
  if (inkMask)
    CGImageRelease(inkMask);
  -[UIKBHandwritingView cancelPageOffsetTimer](self, "cancelPageOffsetTimer");
  v4.receiver = self;
  v4.super_class = (Class)UIKBHandwritingView;
  -[UIKBKeyView dealloc](&v4, sel_dealloc);
}

- (void)log
{
  void *v2;
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  FILE *v12;
  unint64_t i;
  unint64_t j;
  double v15;
  double v16;
  void (*v17)(uint64_t);
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  void *v27;

  -[UIKBHandwritingView strokeFIFO](self, "strokeFIFO");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "strokes");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "numberOfStrokes"))
    goto LABEL_20;
  v4 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v4, "setDateFormat:", CFSTR("%Y-%m-%d-%H%M%S"));
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFromDate:", v5);
  v6 = objc_claimAutoreleasedReturnValue();

  v22 = (void *)v6;
  if (geteuid())
  {
    NSHomeDirectory();
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = &stru_1E16EDF20;
  }
  -[__CFString stringByAppendingPathComponent:](v7, "stringByAppendingPathComponent:", CFSTR("/Library/Logs/CrashReporter/HandwritingCapture/"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Capture_%@.log"), v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingPathComponent:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_retainAutorelease(v10);
  v12 = fopen((const char *)objc_msgSend(v11, "UTF8String"), "w+");
  if (!v12)
  {
    if (*__error() != 2
      || (objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"),
          v18 = (void *)objc_claimAutoreleasedReturnValue(),
          v19 = objc_msgSend(v18, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v8, 1, 0, 0), v18, !v19)|| (v12 = fopen((const char *)objc_msgSend(objc_retainAutorelease(v11), "UTF8String"), "w+")) == 0)
    {
LABEL_19:

LABEL_20:
      return;
    }
  }
  for (i = 0; i < objc_msgSend(v3, "numberOfStrokes"); ++i)
  {
    for (j = 0; j < objc_msgSend(v3, "numberOfPointsInStrokeAtIndex:", i); ++j)
    {
      objc_msgSend(v3, "pointAtIndex:inStrokeAtIndex:", j, i);
      fprintf(v12, "%d %d\n", (int)v15, (int)v16);
    }
    fwrite(";\n", 2uLL, 1uLL, v12);
  }
  fclose(v12);
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v17 = (void (*)(uint64_t))_MergedGlobals_3_17;
  v27 = _MergedGlobals_3_17;
  if (!_MergedGlobals_3_17)
  {
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = ___ZL40getAudioServicesPlaySystemSoundSymbolLocv_block_invoke;
    v23[3] = &unk_1E16C4AB8;
    v23[4] = &v24;
    ___ZL40getAudioServicesPlaySystemSoundSymbolLocv_block_invoke(v23);
    v17 = (void (*)(uint64_t))v25[3];
  }
  _Block_object_dispose(&v24, 8);
  if (v17)
  {
    v17(1108);
    goto LABEL_19;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void __AudioServicesPlaySystemSound(SystemSoundID)");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, CFSTR("UIKBHandwritingView.mm"), 44, CFSTR("%s"), dlerror());

  __break(1u);
}

- (void)touchPageOffsetTimer
{
  void *v3;
  int v4;
  double v5;
  double v6;
  char v7;
  id v8;
  id v9;
  id v10;
  UIDelayedAction *v11;
  id v12;

  -[UIKBHandwritingView nextPageTimer](self, "nextPageTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    goto LABEL_2;
  -[UIKBHandwritingView inputSpeedModel](self, "inputSpeedModel");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v8, "autoConfirmationEnabled");

  if (v4)
  {
    -[UIKBHandwritingView inputSpeedModel](self, "inputSpeedModel");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeoutForNextPage");
    v6 = v5;

    +[UIDevice currentDevice](UIDevice, "currentDevice");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v10, "userInterfaceIdiom") == 1
      && !+[UIKeyboardImpl isFloating](UIKeyboardImpl, "isFloating");

    if (v6 > 0.0 && (v7 & 1) == 0)
    {
      v11 = -[UIDelayedAction initWithTarget:action:userInfo:delay:]([UIDelayedAction alloc], "initWithTarget:action:userInfo:delay:", self, sel_pageOffsetTimerFired, 0, v6);
      -[UIKBHandwritingView setNextPageTimer:](self, "setNextPageTimer:");
      v3 = v11;
LABEL_2:

    }
  }
  -[UIKBHandwritingView nextPageTimer](self, "nextPageTimer");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "touch");

}

- (void)cancelPageOffsetTimer
{
  void *v3;
  void *v4;

  -[UIKBHandwritingView nextPageTimer](self, "nextPageTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  -[UIKBHandwritingView nextPageTimer](self, "nextPageTimer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTarget:", 0);

  -[UIKBHandwritingView setNextPageTimer:](self, "setNextPageTimer:", 0);
}

- (void)pageOffsetTimerFired
{
  void *v3;
  void *v4;
  CGFloat y;
  double width;
  CGFloat height;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  double v21;
  double v22;
  CGFloat v23;
  double v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  double r1[5];
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;

  v33 = *MEMORY[0x1E0C80C00];
  -[UIKBHandwritingView inputSpeedModel](self, "inputSpeedModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endCharacter");

  -[UIKBHandwritingView startFadeOutAnimation](self, "startFadeOutAnimation");
  -[UIKBHandwritingView bezierPathFIFO](self, "bezierPathFIFO");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    y = *(double *)(MEMORY[0x1E0C9D628] + 8);
    r1[0] = *(double *)MEMORY[0x1E0C9D628];
    width = *(double *)(MEMORY[0x1E0C9D628] + 16);
    height = *(double *)(MEMORY[0x1E0C9D628] + 24);
    memset(&r1[1], 0, 32);
    v30 = 0u;
    v31 = 0u;
    -[UIKBHandwritingView interpolatedPoints](self, "interpolatedPoints");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &r1[1], v32, 16);
    if (v9)
    {
      v10 = **(_QWORD **)&r1[3];
      do
      {
        v11 = 0;
        do
        {
          if (**(_QWORD **)&r1[3] != v10)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*(_QWORD *)&r1[2] + 8 * v11), "bounds");
          v13 = v12;
          v15 = v14;
          v17 = v16;
          v19 = v18;
          -[UIKBHandwritingView inkWidth](self, "inkWidth");
          v21 = v20;
          -[UIKBHandwritingView inkWidth](self, "inkWidth");
          v23 = v22 * -0.5;
          v34.origin.x = v13;
          v34.origin.y = v15;
          v34.size.width = v17;
          v34.size.height = v19;
          v37 = CGRectInset(v34, v21 * -0.5, v23);
          v35.origin.x = r1[0];
          v35.origin.y = y;
          v35.size.width = width;
          v35.size.height = height;
          v36 = CGRectUnion(v35, v37);
          r1[0] = v36.origin.x;
          y = v36.origin.y;
          width = v36.size.width;
          height = v36.size.height;
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &r1[1], v32, 16);
      }
      while (v9);
    }

    -[UIKBHandwritingView pageOffset](self, "pageOffset");
    -[UIKBHandwritingView setPageOffset:](self, "setPageOffset:", r1[0] + width + v24);
    -[UIKBHandwritingView strokeView](self, "strokeView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setNeedsDisplay");

  }
  else
  {
    -[UIKBHandwritingView pageOffset](self, "pageOffset");
    -[UIKBHandwritingView setPageOffset:](self, "setPageOffset:", v26 + 10000.0);
    -[UIKBHandwritingView strokeView](self, "strokeView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBHandwritingView strokeView](self, "strokeView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "bounds");
    objc_msgSend(v27, "clearRect:");

  }
  -[UIKBHandwritingView cancelPageOffsetTimer](self, "cancelPageOffsetTimer");
}

- (void)didMoveToWindow
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIKBHandwritingView;
  -[UIView didMoveToWindow](&v4, sel_didMoveToWindow);
  -[UIView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    -[UIKBHandwritingView cancelPageOffsetTimer](self, "cancelPageOffsetTimer");
}

- (void)startFadeOutAnimation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  _QWORD v9[5];

  -[UIKBHandwritingView snapshotView](self, "snapshotView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UIKBHandwritingView snapshotView](self, "snapshotView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeFromSuperview");

  }
  -[UIView snapshotViewAfterScreenUpdates:](self, "snapshotViewAfterScreenUpdates:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBHandwritingView setSnapshotView:](self, "setSnapshotView:", v5);

  -[UIKBHandwritingView snapshotView](self, "snapshotView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUserInteractionEnabled:", 0);

  -[UIKBHandwritingView snapshotView](self, "snapshotView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView addSubview:](self, "addSubview:", v7);

  v8[4] = self;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __44__UIKBHandwritingView_startFadeOutAnimation__block_invoke;
  v9[3] = &unk_1E16D3868;
  v9[4] = self;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __44__UIKBHandwritingView_startFadeOutAnimation__block_invoke_2;
  v8[3] = &unk_1E16D3890;
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v9, v8, 0.25);
}

void __44__UIKBHandwritingView_startFadeOutAnimation__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "snapshotView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 0.0);

}

void __44__UIKBHandwritingView_startFadeOutAnimation__block_invoke_2(uint64_t a1)
{
  id v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "snapshotView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeFromSuperview");

  objc_msgSend(*(id *)(a1 + 32), "setSnapshotView:", 0);
  objc_msgSend(*(id *)(a1 + 32), "inputSpeedModel");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endCharacter");

}

- (BOOL)shouldCache
{
  return 0;
}

- (void)setRenderConfig:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  void *v9;
  objc_super v10;

  v4 = a3;
  -[UIKBKeyView renderConfig](self, "renderConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[UIKBKeyView renderConfig](self, "renderConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "whiteText");
    v8 = v7 ^ objc_msgSend(v4, "whiteText");

  }
  else
  {
    v8 = 1;
  }

  v10.receiver = self;
  v10.super_class = (Class)UIKBHandwritingView;
  -[UIKBKeyView setRenderConfig:](&v10, sel_setRenderConfig_, v4);
  if (v8)
    -[UIKBHandwritingView updateInkColor](self, "updateInkColor");
  -[UIKBHandwritingView strokeView](self, "strokeView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setNeedsDisplay");

}

- (void)updateForKeyplane:(id)a3 key:(id)a4
{
  -[UIKBHandwritingView updateInkColor](self, "updateInkColor", a3, a4);
  -[UIKBHandwritingView clearAndNotify:](self, "clearAndNotify:", 0);
}

- (void)updateInkColor
{
  id v3;
  void *v4;
  id v5;
  id v6;

  -[UIKBKeyView renderConfig](self, "renderConfig");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "whiteText"))
    +[UIColor whiteColor](UIColor, "whiteColor");
  else
    +[UIColor blackColor](UIColor, "blackColor");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[UIKBHandwritingView setInkColor:](self, "setInkColor:", objc_msgSend(v3, "CGColor"));

  -[UIKBHandwritingView bezierPathFIFO](self, "bezierPathFIFO");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[UIKBHandwritingView strokeView](self, "strokeView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updateInkColor");

  }
}

- (void)clearAndNotify:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;

  v3 = a3;
  -[UIKBHandwritingView inputSpeedModel](self, "inputSpeedModel");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "endCharacter");

  -[UIKBHandwritingView inputSpeedModel](self, "inputSpeedModel");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "updatePreferences");

  -[UIKBHandwritingView setPageOffset:](self, "setPageOffset:", 0.0);
  -[UIKBHandwritingView cancelPageOffsetTimer](self, "cancelPageOffsetTimer");
  -[UIKBHandwritingView strokeFIFO](self, "strokeFIFO");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "clear");

  -[UIKBHandwritingView interpolatedPoints](self, "interpolatedPoints");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeAllObjects");

  -[UIKBHandwritingView bezierPathFIFO](self, "bezierPathFIFO");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[UIKBHandwritingView setCurrentPath:](self, "setCurrentPath:", 0);
    -[UIKBHandwritingView strokeView](self, "strokeView");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setNeedsDisplay");
  }
  else
  {
    -[UIKBHandwritingView currentPoints](self, "currentPoints");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "removeAllObjects");

    -[UIKBHandwritingView strokeView](self, "strokeView");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    -[UIKBHandwritingView strokeView](self, "strokeView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    objc_msgSend(v13, "clearRect:");

  }
  if (v3)
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "clearInput");
    -[UIKBHandwritingView strokeFIFO](self, "strokeFIFO");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "strokes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addInputObject:", v8);

  }
}

- (void)deleteStrokesAtIndexes:(id)a3
{
  id v4;
  double y;
  double x;
  double width;
  double height;
  unint64_t i;
  void *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  BOOL v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  double v26;
  double v27;
  CGFloat v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  void *v34;
  void *v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  void *v50;
  BOOL v51;
  double v52;
  void *v53;
  CGFloat rect;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  uint64_t v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;

  v60 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[UIKBHandwritingView cancelPageOffsetTimer](self, "cancelPageOffsetTimer");
    x = *MEMORY[0x1E0C9D628];
    y = *(double *)(MEMORY[0x1E0C9D628] + 8);
    width = *(double *)(MEMORY[0x1E0C9D628] + 16);
    height = *(double *)(MEMORY[0x1E0C9D628] + 24);
    for (i = objc_msgSend(v4, "lastIndex"); i != 0x7FFFFFFFFFFFFFFFLL; i = objc_msgSend(v4, "indexLessThanIndex:", i))
    {
      -[UIKBHandwritingView interpolatedPoints](self, "interpolatedPoints");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (i >= objc_msgSend(v10, "count"))
      {

LABEL_18:
        NSLog(CFSTR("%s: invalid stroke indexes: %@"), "-[UIKBHandwritingView deleteStrokesAtIndexes:]", v4);
        -[UIKBHandwritingView strokeView](self, "strokeView");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "bounds");
        x = v44;
        y = v45;
        width = v46;
        height = v47;

        -[UIKBHandwritingView clearAndNotify:](self, "clearAndNotify:", 0);
        break;
      }
      -[UIKBHandwritingView strokeFIFO](self, "strokeFIFO");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "strokes");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = i < objc_msgSend(v12, "numberOfStrokes");

      if (!v13)
        goto LABEL_18;
      -[UIKBHandwritingView bezierPathFIFO](self, "bezierPathFIFO");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14 == 0;

      if (v15)
      {
        v57 = 0u;
        v58 = 0u;
        v55 = 0u;
        v56 = 0u;
        -[UIKBHandwritingView interpolatedPoints](self, "interpolatedPoints");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "objectAtIndexedSubscript:", i);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
        if (v31)
        {
          v32 = *(_QWORD *)v56;
          do
          {
            for (j = 0; j != v31; ++j)
            {
              if (*(_QWORD *)v56 != v32)
                objc_enumerationMutation(v30);
              v34 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * j);
              -[UIKBHandwritingView strokeView](self, "strokeView");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "UIKBHandwritingPointValue");
              objc_msgSend(v35, "handwritingPointToRect:");
              v69.origin.x = v36;
              v69.origin.y = v37;
              v69.size.width = v38;
              v69.size.height = v39;
              v64.origin.x = x;
              v64.origin.y = y;
              v64.size.width = width;
              v64.size.height = height;
              v65 = CGRectUnion(v64, v69);
              x = v65.origin.x;
              y = v65.origin.y;
              width = v65.size.width;
              height = v65.size.height;

            }
            v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
          }
          while (v31);
        }

        v66.origin.x = x;
        v66.origin.y = y;
        v66.size.width = width;
        v66.size.height = height;
        v67 = CGRectInset(v66, -0.200000003, -0.200000003);
        x = v67.origin.x;
        y = v67.origin.y;
        width = v67.size.width;
        height = v67.size.height;
      }
      else
      {
        -[UIKBHandwritingView interpolatedPoints](self, "interpolatedPoints");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectAtIndex:", i);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "bounds");
        rect = v18;
        v20 = v19;
        v22 = v21;
        v24 = v23;
        -[UIKBHandwritingView inkWidth](self, "inkWidth");
        v26 = v25;
        -[UIKBHandwritingView inkWidth](self, "inkWidth");
        v28 = v27 * -0.5;
        v61.origin.x = v20;
        v61.origin.y = v22;
        v61.size.width = v24;
        v61.size.height = rect;
        v68 = CGRectInset(v61, v26 * -0.5, v28);
        v62.origin.x = x;
        v62.origin.y = y;
        v62.size.width = width;
        v62.size.height = height;
        v63 = CGRectUnion(v62, v68);
        x = v63.origin.x;
        y = v63.origin.y;
        width = v63.size.width;
        height = v63.size.height;

      }
      -[UIKBHandwritingView interpolatedPoints](self, "interpolatedPoints");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "removeObjectAtIndex:", i);

      -[UIKBHandwritingView strokeFIFO](self, "strokeFIFO");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "strokes");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "removeStrokeAtIndex:", i);

    }
    -[UIKBHandwritingView pageOffset](self, "pageOffset");
    v49 = v48;
    -[UIKBHandwritingView bezierPathFIFO](self, "bezierPathFIFO");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = v50 == 0;

    v52 = x - v49;
    -[UIKBHandwritingView strokeView](self, "strokeView");
    if (v51)
    {
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "clearRect:", v52, y, width, height);
    }
    else
    {
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "setNeedsDisplayInRect:", v52, y, width, height);
    }

  }
}

- (void)send
{
  void *v3;
  void *v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  id v11;

  -[UIKBHandwritingView strokeFIFO](self, "strokeFIFO");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "strokes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "numberOfStrokes");

  if (v5)
  {
    -[UIView bounds](self, "bounds");
    v6 = 1.0;
    if (v7 > 0.0)
    {
      -[UIView bounds](self, "bounds");
      v6 = 1000.0 / v8;
    }
    -[UIKBHandwritingView strokeFIFO](self, "strokeFIFO");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "scaleStrokes:", v6);
    v11 = (id)objc_claimAutoreleasedReturnValue();

    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addInputObject:", v11);

  }
}

- (void)addInkPoint:(CGPoint)a3 value:(double)a4
{
  double y;
  double x;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;

  y = a3.y;
  x = a3.x;
  -[UIKBHandwritingView strokeFIFO](self, "strokeFIFO");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addPoint:", x, y, a4);

  -[UIKBHandwritingView bezierPathFIFO](self, "bezierPathFIFO");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[UIKBHandwritingView bezierPathFIFO](self, "bezierPathFIFO");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBHandwritingView setCurrentPath:](self, "setCurrentPath:", v9);

  }
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "updateIdleDetection:", 0);

}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;

  v18 = a3;
  -[UIKBHandwritingView inputSpeedModel](self, "inputSpeedModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "beginStroke");

  -[UIKBHandwritingView activeTouches](self, "activeTouches");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unionSet:", v18);

  objc_msgSend(v18, "anyObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "locationInView:", self);
  v9 = v8;
  v11 = v10;
  -[UIKBHandwritingView inputSpeedModel](self, "inputSpeedModel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timestamp");
  objc_msgSend(v12, "addPoint:timestamp:", v9, v11, v13);

  -[UIKBHandwritingView pageOffset](self, "pageOffset");
  v15 = v14;
  objc_msgSend(v7, "force");
  v17 = v16;
  -[UIKBHandwritingView setInitialPointPosted:](self, "setInitialPointPosted:", 0);
  -[UIKBHandwritingView setPreviousPoint:](self, "setPreviousPoint:", v9 + v15, v11, v17);
  -[UIKBHandwritingView cancelPageOffsetTimer](self, "cancelPageOffsetTimer");

}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(v6, "mutableCopy");
  -[UIKBHandwritingView activeTouches](self, "activeTouches");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "intersectSet:", v9);

  v10 = v8;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend(v10, "anyObject", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "coalescedTouchesForTouch:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v29 != v14)
          objc_enumerationMutation(v12);
        v16 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v16, "locationInView:", self);
        v18 = v17;
        v20 = v19;
        -[UIKBHandwritingView inputSpeedModel](self, "inputSpeedModel");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "timestamp");
        objc_msgSend(v21, "addPoint:timestamp:", v18, v20, v22);

        -[UIKBHandwritingView pageOffset](self, "pageOffset");
        v24 = v23;
        objc_msgSend(v16, "force");
        v26 = v25;
        if (!-[UIKBHandwritingView initialPointPosted](self, "initialPointPosted"))
        {
          -[UIKBHandwritingView previousPoint](self, "previousPoint");
          -[UIKBHandwritingView addInkPoint:value:](self, "addInkPoint:value:");
          -[UIKBHandwritingView setInitialPointPosted:](self, "setInitialPointPosted:", 1);
        }
        v27 = v18 + v24;
        -[UIKBHandwritingView addInkPoint:value:](self, "addInkPoint:value:", v27, v20, v26);
        -[UIKBHandwritingView setPreviousPoint:](self, "setPreviousPoint:", v27, v20, v26);
      }
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v13);
  }

  -[UIKBHandwritingView cancelPageOffsetTimer](self, "cancelPageOffsetTimer");
}

- (BOOL)endStrokeWithTouches:(id)a3 event:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  BOOL v34;
  NSMutableArray *interpolatedPoints;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[UIKBHandwritingView activeTouches](self, "activeTouches");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "isSubsetOfSet:", v8);

  -[UIKBHandwritingView activeTouches](self, "activeTouches");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "minusSet:", v6);

  if ((v9 & 1) != 0)
  {
    if (!-[UIKBHandwritingView initialPointPosted](self, "initialPointPosted"))
    {
      -[UIKBHandwritingView previousPoint](self, "previousPoint");
      v12 = v11;
      v14 = v13;
      -[UIKBHandwritingView previousPoint](self, "previousPoint");
      -[UIKBHandwritingView addInkPoint:value:](self, "addInkPoint:value:", v12, v14);
      -[UIKBHandwritingView setInitialPointPosted:](self, "setInitialPointPosted:", 1);
    }
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    objc_msgSend(v6, "anyObject", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "coalescedTouchesForTouch:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v43 != v18)
            objc_enumerationMutation(v16);
          v20 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
          objc_msgSend(v20, "locationInView:", self);
          v22 = v21;
          v24 = v23;
          -[UIKBHandwritingView inputSpeedModel](self, "inputSpeedModel");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "timestamp");
          objc_msgSend(v25, "addPoint:timestamp:", v22, v24, v26);

          -[UIKBHandwritingView pageOffset](self, "pageOffset");
          v28 = v27;
          objc_msgSend(v20, "force");
          v30 = v29;
          -[UIKBHandwritingView previousPoint](self, "previousPoint");
          v31 = v22 + v28;
          -[UIKBHandwritingView addInkPoint:value:](self, "addInkPoint:value:", v31, v24, v32 * 0.5);
          -[UIKBHandwritingView setPreviousPoint:](self, "setPreviousPoint:", v31, v24, v30);
        }
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
      }
      while (v17);
    }

    -[UIKBHandwritingStrokePointFIFO flush](self->_strokeFIFO, "flush");
    -[UIKBHandwritingView bezierPathFIFO](self, "bezierPathFIFO");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v33 == 0;

    interpolatedPoints = self->_interpolatedPoints;
    if (v34)
    {
      v39 = (void *)-[NSMutableArray copy](self->_currentPoints, "copy");
      -[NSMutableArray addObject:](interpolatedPoints, "addObject:", v39);

      -[NSMutableArray removeAllObjects](self->_currentPoints, "removeAllObjects");
    }
    else
    {
      -[UIKBHandwritingView bezierPathFIFO](self, "bezierPathFIFO");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "path");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = (void *)objc_msgSend(v37, "copy");
      -[NSMutableArray addObject:](interpolatedPoints, "addObject:", v38);

      -[UIKBHandwritingView setCurrentPath:](self, "setCurrentPath:", 0);
    }
    -[UIKBHandwritingView inputSpeedModel](self, "inputSpeedModel");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "endStroke");

    -[UIKBHandwritingView touchPageOffsetTimer](self, "touchPageOffsetTimer");
  }

  return v9;
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (-[UIKBHandwritingView endStrokeWithTouches:event:](self, "endStrokeWithTouches:event:", v7, v6))
    -[UIKBHandwritingView send](self, "send");

}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  uint64_t v5;
  id v6;
  id v7;

  if (-[UIKBHandwritingView endStrokeWithTouches:event:](self, "endStrokeWithTouches:event:", a3, a4))
  {
    -[UIKBHandwritingStrokePointFIFO strokes](self->_strokeFIFO, "strokes");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "numberOfStrokes");

    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", v5 - 1);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      -[UIKBHandwritingView deleteStrokesAtIndexes:](self, "deleteStrokesAtIndexes:");

    }
  }
}

- (unint64_t)numberOfStrokes
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[UIKBHandwritingView strokeFIFO](self, "strokeFIFO");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "strokes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfStrokes");

  return v4;
}

- (BOOL)shouldAllowSelectionGestures:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  BOOL v6;
  NSMutableArray *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v3 = a3;
  v27 = *MEMORY[0x1E0C80C00];
  -[UIKBHandwritingView bezierPathFIFO](self, "bezierPathFIFO");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = 1;
  if (v3 && !v5)
  {
    if ((unint64_t)-[NSMutableArray count](self->_currentPoints, "count") <= 0xF)
    {
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v7 = self->_currentPoints;
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v8)
      {
        v9 = 0;
        v10 = *(_QWORD *)v23;
        v11 = 0.0;
        while (2)
        {
          v12 = 0;
          v13 = v9;
          do
          {
            if (*(_QWORD *)v23 != v10)
              objc_enumerationMutation(v7);
            v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v12);
            if (v13)
            {
              objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v12), "UIKBHandwritingPointValue", (_QWORD)v22);
              v16 = v15;
              v18 = v17;
              objc_msgSend(v13, "UIKBHandwritingPointValue");
              v11 = v11 + hypot(v16 - v19, v18 - v20);
              if (v11 > 15.0)
              {
                v6 = 0;
                goto LABEL_17;
              }
            }
            v9 = v14;

            ++v12;
            v13 = v9;
          }
          while (v8 != v12);
          v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
          if (v8)
            continue;
          break;
        }
        v6 = 1;
        v13 = v9;
      }
      else
      {
        v13 = 0;
        v6 = 1;
      }
LABEL_17:

    }
    else
    {
      return 0;
    }
  }
  return v6;
}

- (void)clearTouches
{
  id v2;

  -[UIKBHandwritingView activeTouches](self, "activeTouches");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

}

- (BOOL)cancelTouchTracking
{
  void *v3;
  NSMutableArray *interpolatedPoints;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  -[UIKBHandwritingStrokePointFIFO flush](self->_strokeFIFO, "flush");
  -[UIKBHandwritingView bezierPathFIFO](self, "bezierPathFIFO");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  interpolatedPoints = self->_interpolatedPoints;
  if (v3)
  {
    -[UIKBHandwritingView bezierPathFIFO](self, "bezierPathFIFO");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "path");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    -[NSMutableArray addObject:](interpolatedPoints, "addObject:", v7);

    -[UIKBHandwritingView setCurrentPath:](self, "setCurrentPath:", 0);
  }
  else
  {
    v8 = (void *)-[NSMutableArray copy](self->_currentPoints, "copy");
    -[NSMutableArray addObject:](interpolatedPoints, "addObject:", v8);

    -[NSMutableArray removeAllObjects](self->_currentPoints, "removeAllObjects");
  }
  v10.receiver = self;
  v10.super_class = (Class)UIKBHandwritingView;
  return -[UIView cancelTouchTracking](&v10, sel_cancelTouchTracking);
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  void *v13;
  void *v14;
  BOOL v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  objc_super v23;
  CGPoint v24;
  CGPoint v25;
  CGRect v26;
  CGRect v27;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[UIView superview](self, "superview");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "convertPoint:fromView:", self, x, y);
  v10 = v9;
  v12 = v11;

  -[UIKBKeyView keyplane](self, "keyplane");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "firstCachedKeyWithName:", CFSTR("Delete-Key"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14 && (objc_msgSend(v14, "frame"), v24.x = v10, v24.y = v12, CGRectContainsPoint(v26, v24)))
  {
    v15 = 0;
  }
  else
  {
    -[UIKBKeyView keyplane](self, "keyplane");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "firstCachedKeyWithName:", CFSTR("Candidate-Selection"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
      goto LABEL_8;
    objc_msgSend(v17, "frame");
    v25.x = v10;
    v25.y = v12;
    if (!CGRectContainsPoint(v27, v25))
      goto LABEL_8;
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "candidateController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "candidateResultSet");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "hasCandidates");

    if ((v21 & 1) != 0)
    {
      v15 = 0;
    }
    else
    {
LABEL_8:
      v23.receiver = self;
      v23.super_class = (Class)UIKBHandwritingView;
      v15 = -[UIView pointInside:withEvent:](&v23, sel_pointInside_withEvent_, v7, x, y);
    }

  }
  return v15;
}

- (double)inkWidth
{
  return self->_inkWidth;
}

- (void)setInkWidth:(double)a3
{
  self->_inkWidth = a3;
}

- (CGColor)inkColor
{
  return self->_inkColor;
}

- (void)setInkColor:(CGColor *)a3
{
  self->_inkColor = a3;
}

- (CGImage)inkMask
{
  return self->_inkMask;
}

- (void)setInkMask:(CGImage *)a3
{
  self->_inkMask = a3;
}

- (NSMutableArray)interpolatedPoints
{
  return self->_interpolatedPoints;
}

- (void)setInterpolatedPoints:(id)a3
{
  objc_storeStrong((id *)&self->_interpolatedPoints, a3);
}

- (UIBezierPath)currentPath
{
  return self->_currentPath;
}

- (void)setCurrentPath:(id)a3
{
  objc_storeStrong((id *)&self->_currentPath, a3);
}

- (NSMutableArray)currentPoints
{
  return self->_currentPoints;
}

- (void)setCurrentPoints:(id)a3
{
  objc_storeStrong((id *)&self->_currentPoints, a3);
}

- (UIKBHandwritingStrokePointFIFO)strokeFIFO
{
  return self->_strokeFIFO;
}

- (void)setStrokeFIFO:(id)a3
{
  objc_storeStrong((id *)&self->_strokeFIFO, a3);
}

- (UIKBHandwritingBoxcarFilterPointFIFO)smoothingFIFO
{
  return self->_smoothingFIFO;
}

- (void)setSmoothingFIFO:(id)a3
{
  objc_storeStrong((id *)&self->_smoothingFIFO, a3);
}

- (UIKBHandwritingQuadCurvePointFIFO)interpolatingFIFO
{
  return self->_interpolatingFIFO;
}

- (void)setInterpolatingFIFO:(id)a3
{
  objc_storeStrong((id *)&self->_interpolatingFIFO, a3);
}

- (UIKBHandwritingBezierPathPointFIFO)bezierPathFIFO
{
  return self->_bezierPathFIFO;
}

- (void)setBezierPathFIFO:(id)a3
{
  objc_storeStrong((id *)&self->_bezierPathFIFO, a3);
}

- (UIKBHandwritingStrokeView)strokeView
{
  return self->_strokeView;
}

- (void)setStrokeView:(id)a3
{
  objc_storeStrong((id *)&self->_strokeView, a3);
}

- (UIView)snapshotView
{
  return self->_snapshotView;
}

- (void)setSnapshotView:(id)a3
{
  objc_storeStrong((id *)&self->_snapshotView, a3);
}

- (NSMutableSet)activeTouches
{
  return self->_activeTouches;
}

- (void)setActiveTouches:(id)a3
{
  objc_storeStrong((id *)&self->_activeTouches, a3);
}

- (BOOL)initialPointPosted
{
  return self->_initialPointPosted;
}

- (void)setInitialPointPosted:(BOOL)a3
{
  self->_initialPointPosted = a3;
}

- ($89C9DF7554150EC42DA90319EED2ADED)previousPoint
{
  return self;
}

- (void)setPreviousPoint:(id *)a3
{
  CGFloat v3;
  CGFloat v4;
  double v5;

  self->_previousPoint.point.x = v3;
  self->_previousPoint.point.y = v4;
  self->_previousPoint.force = v5;
}

- (double)pageOffset
{
  return self->_pageOffset;
}

- (void)setPageOffset:(double)a3
{
  self->_pageOffset = a3;
}

- (UIDelayedAction)nextPageTimer
{
  return self->_nextPageTimer;
}

- (void)setNextPageTimer:(id)a3
{
  objc_storeStrong((id *)&self->_nextPageTimer, a3);
}

- (UIKBHandwritingInputSpeedModel)inputSpeedModel
{
  return self->_inputSpeedModel;
}

- (void)setInputSpeedModel:(id)a3
{
  objc_storeStrong((id *)&self->_inputSpeedModel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputSpeedModel, 0);
  objc_storeStrong((id *)&self->_nextPageTimer, 0);
  objc_storeStrong((id *)&self->_activeTouches, 0);
  objc_storeStrong((id *)&self->_snapshotView, 0);
  objc_storeStrong((id *)&self->_strokeView, 0);
  objc_storeStrong((id *)&self->_bezierPathFIFO, 0);
  objc_storeStrong((id *)&self->_interpolatingFIFO, 0);
  objc_storeStrong((id *)&self->_smoothingFIFO, 0);
  objc_storeStrong((id *)&self->_strokeFIFO, 0);
  objc_storeStrong((id *)&self->_currentPoints, 0);
  objc_storeStrong((id *)&self->_currentPath, 0);
  objc_storeStrong((id *)&self->_interpolatedPoints, 0);
}

@end
