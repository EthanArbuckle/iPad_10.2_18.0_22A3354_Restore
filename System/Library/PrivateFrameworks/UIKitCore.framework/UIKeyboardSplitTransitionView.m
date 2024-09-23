@implementation UIKeyboardSplitTransitionView

- (void)dealloc
{
  CADisplayLink *displayLink;
  CADisplayLink *v4;
  UIKeyboardSliceSet *sliceSet;
  void *v6;
  objc_super v7;

  displayLink = self->_displayLink;
  if (displayLink)
  {
    -[CADisplayLink invalidate](displayLink, "invalidate");
    v4 = self->_displayLink;
    self->_displayLink = 0;

  }
  -[UIKeyboardSplitTransitionView setCompletionBlock:](self, "setCompletionBlock:", 0);
  sliceSet = self->_sliceSet;
  self->_sliceSet = 0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:name:object:", self, CFSTR("UIKeyboardRivenVisualStyleDidChange"), 0);

  v7.receiver = self;
  v7.super_class = (Class)UIKeyboardSplitTransitionView;
  -[UIView dealloc](&v7, sel_dealloc);
}

- (void)didMoveToWindow
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  -[UIView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UIView window](self, "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "screen");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "scale");
    v7 = v6;
    -[UIView layer](self, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setRasterizationScale:", v7);

    -[UIView window](self, "window");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "screen");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKeyboardMotionSupport supportForScreen:](UISplitKeyboardSupport, "supportForScreen:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardSplitTransitionView setSplitTransitionDelegate:](self, "setSplitTransitionDelegate:", v11);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", self, sel_rebuildTransitionForSplitStyleChange_, CFSTR("UIKeyboardRivenVisualStyleDidChange"), 0);
  }
  else
  {
    -[UIKeyboardSplitTransitionView setSplitTransitionDelegate:](self, "setSplitTransitionDelegate:", 0);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeObserver:", self);
  }

}

- (void)setFrame:(CGRect)a3
{
  void *v4;
  _QWORD v5[5];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIKeyboardSplitTransitionView;
  -[UIView setFrame:](&v6, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[UIKeyboardSplitTransitionView backgroundLayers](self, "backgroundLayers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__UIKeyboardSplitTransitionView_setFrame___block_invoke;
  v5[3] = &unk_1E16B40F8;
  v5[4] = self;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v5);

}

void __42__UIKeyboardSplitTransitionView_setFrame___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  void *v13;
  void *v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  id v24;
  CGRect v25;
  CGRect v26;

  v24 = a2;
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "preferencesActions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "rivenSizeFactor:", 9.0);
  v16 = v15 * -2.0;
  v25.origin.x = v6;
  v25.origin.y = v8;
  v25.size.width = v10;
  v25.size.height = v12;
  v26 = CGRectInset(v25, v16, 0.0);
  objc_msgSend(v24, "setBounds:", v26.origin.x, v26.origin.y, v26.size.width, v26.size.height);

  if (a3 == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "bounds");
    v18 = v17;
    +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "preferencesActions");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "rivenSizeFactor:", 9.0);
    v22 = v18 + v21;
  }
  else
  {
    +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "preferencesActions");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "rivenSizeFactor:", 9.0);
    v22 = -v23;
  }
  objc_msgSend(v24, "setPosition:", v22, 0.0);

}

- (NSArray)shadowLayers
{
  return 0;
}

- (NSArray)backgroundLayers
{
  void *v2;
  int v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)backgroundLayers_backgroundLayers;
  if (!backgroundLayers_backgroundLayers)
  {
    v3 = 3;
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 3);
    v5 = (void *)backgroundLayers_backgroundLayers;
    backgroundLayers_backgroundLayers = v4;

    do
    {
      v6 = (void *)backgroundLayers_backgroundLayers;
      objc_msgSend(MEMORY[0x1E0CD2790], "layer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v7);

      --v3;
    }
    while (v3);
    v2 = (void *)backgroundLayers_backgroundLayers;
  }
  return (NSArray *)v2;
}

- (id)topDropShadow
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)topDropShadow_top;
  if (!topDropShadow_top)
  {
    +[UIImage kitImageNamed:](UIImage, "kitImageNamed:", CFSTR("kb-drop-shadow-top.png"));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)topDropShadow_top;
    topDropShadow_top = v3;

    v2 = (void *)topDropShadow_top;
  }
  return v2;
}

- (id)centerDropShadow
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)centerDropShadow_center;
  if (!centerDropShadow_center)
  {
    +[UIImage kitImageNamed:](UIImage, "kitImageNamed:", CFSTR("kb-drop-shadow-center.png"));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)centerDropShadow_center;
    centerDropShadow_center = v3;

    v2 = (void *)centerDropShadow_center;
  }
  return v2;
}

- (id)outerCenterDropShadow
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)outerCenterDropShadow_outerCenter;
  if (!outerCenterDropShadow_outerCenter)
  {
    +[UIImage kitImageNamed:](UIImage, "kitImageNamed:", CFSTR("kb-drop-shadow-outer-center.png"));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)outerCenterDropShadow_outerCenter;
    outerCenterDropShadow_outerCenter = v3;

    v2 = (void *)outerCenterDropShadow_outerCenter;
  }
  return v2;
}

- (id)bottomDropShadow
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)bottomDropShadow_bottom;
  if (!bottomDropShadow_bottom)
  {
    +[UIImage kitImageNamed:](UIImage, "kitImageNamed:", CFSTR("kb-drop-shadow-bottom.png"));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)bottomDropShadow_bottom;
    bottomDropShadow_bottom = v3;

    v2 = (void *)bottomDropShadow_bottom;
  }
  return v2;
}

- (void)initializeLayers
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  _QWORD v23[6];
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;

  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scale");
  v5 = v4;

  -[UIKeyboardSplitTransitionView shadowLayers](self, "shadowLayers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndex:", 0);
  v21 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "contents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    -[UIKeyboardSplitTransitionView topDropShadow](self, "topDropShadow");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardSplitTransitionView centerDropShadow](self, "centerDropShadow");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardSplitTransitionView bottomDropShadow](self, "bottomDropShadow");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardSplitTransitionView outerCenterDropShadow](self, "outerCenterDropShadow");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardSplitTransitionView shadowLayers](self, "shadowLayers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __49__UIKeyboardSplitTransitionView_initializeLayers__block_invoke;
    v24[3] = &unk_1E16D8BD8;
    v25 = v9;
    v26 = v8;
    v27 = v10;
    v28 = v11;
    v29 = v5;
    v13 = v11;
    v14 = v10;
    v15 = v8;
    v16 = v9;
    objc_msgSend(v12, "enumerateObjectsUsingBlock:", v24);

  }
  -[UIKeyboardSplitTransitionView backgroundLayers](self, "backgroundLayers", v21);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectAtIndex:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "contents");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
    -[UIKeyboardSplitTransitionView backgroundLayers](self, "backgroundLayers");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __49__UIKeyboardSplitTransitionView_initializeLayers__block_invoke_2;
    v23[3] = &unk_1E16C0628;
    v23[4] = self;
    v23[5] = v5;
    objc_msgSend(v20, "enumerateObjectsUsingBlock:", v23);

  }
}

void __49__UIKeyboardSplitTransitionView_initializeLayers__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
  id v6;
  id v7;
  id *v8;
  id v9;
  id v10;
  CATransform3D v11;
  CGAffineTransform m;
  CATransform3D v13;

  v5 = a2;
  v6 = *(id *)(a1 + 32);
  objc_msgSend(v5, "setAnchorPoint:", 0.0, 0.0);
  if (a3 == 4 || a3 == 1)
  {
    v7 = *(id *)(a1 + 40);

    v6 = v7;
  }
  if (a3 <= 6 && ((1 << a3) & 0x49) != 0)
  {
    v8 = (id *)(a1 + 48);
  }
  else
  {
    if (a3 - 7 > 1)
      goto LABEL_8;
    v8 = (id *)(a1 + 56);
  }
  v9 = *v8;

  v6 = v9;
LABEL_8:
  v10 = objc_retainAutorelease(v6);
  objc_msgSend(v5, "setContents:", objc_msgSend(v10, "CGImage"));
  objc_msgSend(v5, "setContentsScale:", *(double *)(a1 + 64));
  if (a3 <= 8 && ((1 << a3) & 0x1A4) != 0)
  {
    objc_msgSend(v5, "setContentsCenter:", 0.0, 0.5, 0.0, 0.0);
    if ((a3 | 2) == 7)
    {
      CGAffineTransformMakeScale(&m, -1.0, 1.0);
      CATransform3DMakeAffineTransform(&v13, &m);
      v11 = v13;
      objc_msgSend(v5, "setTransform:", &v11);
    }
  }

}

void __49__UIKeyboardSplitTransitionView_initializeLayers__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  double v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (a3 == 2)
    v5 = 1.0;
  else
    v5 = 0.0;
  v9 = a2;
  objc_msgSend(v9, "setAnchorPoint:", v5, 0.0);
  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preferencesActions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rivenSizeFactor:", 9.0);
  objc_msgSend(v9, "setCornerRadius:");

  objc_msgSend(*(id *)(a1 + 32), "colorsForBackgroundLayer:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setColors:", v8);

  objc_msgSend(v9, "setContentsScale:", *(double *)(a1 + 40));
}

- (id)colorsForBackgroundLayer:(int)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  if (!colorsForBackgroundLayer__modernColors)
  {
    v3 = (void *)MEMORY[0x1E0C99D20];
    v4 = UIKBGetNamedColor(CFSTR("UIKBColorLightBackdropTint"));
    objc_msgSend(v3, "arrayWithObjects:", v4, UIKBGetNamedColor(CFSTR("UIKBColorLightBackdropTint")), 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)colorsForBackgroundLayer__modernColors;
    colorsForBackgroundLayer__modernColors = v5;

  }
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance", *(_QWORD *)&a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textInputTraits");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "keyboardAppearance");

  if ((v9 & 0xFFFFFFFFFFFFFFFDLL) != 0)
    v10 = 0;
  else
    v10 = (id)colorsForBackgroundLayer__modernColors;
  return v10;
}

- (CGSize)sizeForShadowLayer:(int)a3
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  switch(a3)
  {
    case 1:
    case 4:
      -[UIKeyboardSplitTransitionView topDropShadow](self, "topDropShadow");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 2:
    case 5:
      -[UIKeyboardSplitTransitionView centerDropShadow](self, "centerDropShadow");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 3:
    case 6:
      -[UIKeyboardSplitTransitionView bottomDropShadow](self, "bottomDropShadow");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 7:
    case 8:
      -[UIKeyboardSplitTransitionView outerCenterDropShadow](self, "outerCenterDropShadow");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
      v4 = v3;
      objc_msgSend(v3, "size");
      v6 = v5;
      v8 = v7;

      break;
    default:
      v6 = *MEMORY[0x1E0C9D820];
      v8 = *(double *)(MEMORY[0x1E0C9D820] + 8);
      break;
  }
  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (CGRect)rectEnclosingKeyplane:(id)a3
{
  CGFloat y;
  CGFloat x;
  CGFloat height;
  CGFloat width;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  double v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;
  CGRect v26;
  CGRect v27;
  CGRect result;
  CGRect v29;

  v25 = *MEMORY[0x1E0C80C00];
  x = *MEMORY[0x1E0C9D648];
  y = *(double *)(MEMORY[0x1E0C9D648] + 8);
  width = *(double *)(MEMORY[0x1E0C9D648] + 16);
  height = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(a3, "subtrees", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v11), "frame");
        v29.origin.x = v12;
        v29.origin.y = v13;
        v29.size.width = v14;
        v29.size.height = v15;
        v26.origin.x = x;
        v26.origin.y = y;
        v26.size.width = width;
        v26.size.height = height;
        v27 = CGRectUnion(v26, v29);
        x = v27.origin.x;
        y = v27.origin.y;
        width = v27.size.width;
        height = v27.size.height;
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }

  v16 = x;
  v17 = y;
  v18 = width;
  v19 = height;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (BOOL)shouldAllowRubberiness
{
  return (-[UIView _clipCorners](self, "_clipCorners") & 3) != 0;
}

- (void)transformForProgress:(double)a3
{
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  float v9;
  CGFloat v10;
  double v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  void *v16;
  CATransform3D v17;
  CATransform3D v18;
  CATransform3D v19;
  CATransform3D v20;
  CATransform3D v21;
  _OWORD v22[8];

  v5 = -[UIKeyboardSplitTransitionView shouldAllowRubberiness](self, "shouldAllowRubberiness");
  -[UIView layer](self, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v5)
  {
    v12 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
    v22[4] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
    v22[5] = v12;
    v13 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
    v22[6] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
    v22[7] = v13;
    v14 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
    v22[0] = *MEMORY[0x1E0CD2610];
    v22[1] = v14;
    v15 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
    v22[2] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
    v22[3] = v15;
    objc_msgSend(v6, "setTransform:", v22);

    return;
  }
  objc_msgSend(v6, "valueForKeyPath:", CFSTR("transform.translation.y"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "floatValue");
  v10 = v9;

  memset(&v21, 0, sizeof(v21));
  CATransform3DMakeTranslation(&v21, 0.0, v10, 0.0);
  if (a3 > 1.0)
  {
    v11 = (a3 + -1.0) * 0.025 + 1.0;
LABEL_7:
    v19 = v21;
    CATransform3DScale(&v20, &v19, v11, 1.0, 1.0);
    v21 = v20;
    goto LABEL_8;
  }
  if (a3 < 0.0)
  {
    v11 = a3 * 0.025 + 1.0;
    goto LABEL_7;
  }
LABEL_8:
  v18 = v21;
  -[UIView layer](self, "layer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v18;
  objc_msgSend(v16, "setTransform:", &v17);

}

- (BOOL)transitionIsVisible
{
  return 1;
}

- (void)finalizeTransition
{
  CADisplayLink *displayLink;
  CADisplayLink *v4;
  void *v5;
  void (**v6)(void);
  id v7;

  displayLink = self->_displayLink;
  if (displayLink)
  {
    -[CADisplayLink invalidate](displayLink, "invalidate");
    v4 = self->_displayLink;
    self->_displayLink = 0;

  }
  -[UIKeyboardSplitTransitionView updateWithProgress:](self, "updateWithProgress:", self->_finishProgress);
  -[UIKeyboardSplitTransitionView completionBlock](self, "completionBlock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[UIKeyboardSplitTransitionView completionBlock](self, "completionBlock");
    v6 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v6[2]();

    -[UIKeyboardSplitTransitionView setCompletionBlock:](self, "setCompletionBlock:", 0);
  }
  -[UIKeyboardSplitTransitionView splitTransitionDelegate](self, "splitTransitionDelegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "transitionDidFinish:", -[UIKeyboardSplitTransitionView transitionIsVisible](self, "transitionIsVisible"));

}

- (void)transitionToFinalState:(id)a3
{
  double v4;
  double v5;
  double finishProgress;
  double v7;
  double finishDuration;
  CADisplayLink *displayLink;

  objc_msgSend(a3, "timestamp");
  v5 = v4;
  finishProgress = self->_finishProgress;
  if (vabdd_f64(self->_currentProgress, finishProgress) < 0.01
    || (v7 = v5 - self->_finalTransitionStartTime, finishDuration = self->_finishDuration, v7 >= finishDuration))
  {
    -[UIKeyboardSplitTransitionView updateWithProgress:](self, "updateWithProgress:");
    -[CADisplayLink invalidate](self->_displayLink, "invalidate");
    displayLink = self->_displayLink;
    self->_displayLink = 0;

    -[UIKeyboardSplitTransitionView finalizeTransition](self, "finalizeTransition");
  }
  else
  {
    -[UIKeyboardSplitTransitionView updateWithProgress:](self, "updateWithProgress:", self->_liftOffProgress + v7 / finishDuration * (finishProgress - self->_liftOffProgress));
  }
}

- (void)finishWithProgress:(double)a3 completionBlock:(id)a4
{
  double currentProgress;
  BOOL v7;
  double v8;
  void *v9;
  void *v10;
  CADisplayLink *v11;
  CADisplayLink *displayLink;
  CADisplayLink *v13;
  id v14;

  -[UIKeyboardSplitTransitionView setCompletionBlock:](self, "setCompletionBlock:", a4);
  self->_finishProgress = a3;
  self->_liftOffProgress = self->_currentProgress;
  if (+[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"))
  {
    currentProgress = self->_currentProgress;
    v7 = currentProgress >= 0.0 && currentProgress <= 1.0;
    v8 = 3.0;
    if (!v7)
      v8 = 9.0;
    self->_finishDuration = vabdd_f64(currentProgress, self->_finishProgress) / v8;
    self->_finalTransitionStartTime = CACurrentMediaTime();
    -[UIView window](self, "window");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "screen");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "displayLinkWithTarget:selector:", self, sel_transitionToFinalState_);
    v11 = (CADisplayLink *)objc_claimAutoreleasedReturnValue();
    displayLink = self->_displayLink;
    self->_displayLink = v11;

    v13 = self->_displayLink;
    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    -[CADisplayLink addToRunLoop:forMode:](v13, "addToRunLoop:forMode:", v14, *MEMORY[0x1E0C99860]);

  }
  else
  {
    self->_currentProgress = self->_finishProgress;
    -[UIKeyboardSplitTransitionView finalizeTransition](self, "finalizeTransition");
  }
}

- (void)updateWithProgress:(double)a3
{
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  id v11;

  if (!self->_isRebuilding)
  {
    if (a3 > 1.0 || a3 < 0.0)
      -[UIKeyboardSplitTransitionView transformForProgress:](self, "transformForProgress:", a3);
    self->_currentProgress = a3;
    v5 = 1.0;
    if (a3 <= 1.0)
      v5 = a3;
    if (a3 >= 0.0)
      v6 = v5;
    else
      v6 = 0.0;
    -[UIView layer](self, "layer", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTimeOffset:", v6);

    +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "preferencesActions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "currentInputModeSupportsCrescendo");

    if ((v10 & 1) == 0)
    {
      -[UIKeyboardSplitTransitionView splitTransitionDelegate](self, "splitTransitionDelegate");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "updateProgress:startHeight:endHeight:", v6, self->_startFrame.size.height, self->_endFrame.size.height);

    }
  }
}

- (BOOL)canDisplayTransition
{
  if (self->_isRebuilding)
    return 0;
  if (-[UIKeyboardSplitTransitionView defaultKeyboardImage](self, "defaultKeyboardImage"))
    return 1;
  return -[UIKeyboardSplitTransitionView splitKeyboardImage](self, "splitKeyboardImage") != 0;
}

- (CGImage)defaultKeyboardImage
{
  return 0;
}

- (CGImage)splitKeyboardImage
{
  return 0;
}

- (CGImage)keyImageWithToken:(id)a3
{
  UIKeyboardSplitTransitionDataSource **p_transitionDataSource;
  id v4;
  id WeakRetained;
  CGImage *v6;

  p_transitionDataSource = &self->_transitionDataSource;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_transitionDataSource);
  v6 = (CGImage *)objc_msgSend(WeakRetained, "renderedImageWithToken:", v4);

  return v6;
}

- (BOOL)showIntlKey
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_transitionDataSource);
  v3 = objc_msgSend(WeakRetained, "showsInternationalKey");

  return v3;
}

- (BOOL)showDictationKey
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_transitionDataSource);
  v3 = objc_msgSend(WeakRetained, "showsDictationKey");

  return v3;
}

- (id)completionBlock
{
  return objc_getProperty(self, a2, 464, 1);
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 464);
}

- (UIKeyboardKeyplaneTransitionDelegate)splitTransitionDelegate
{
  return (UIKeyboardKeyplaneTransitionDelegate *)objc_loadWeakRetained((id *)&self->_transitionDelegate);
}

- (void)setSplitTransitionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_transitionDelegate, a3);
}

- (UIKeyboardSplitTransitionDataSource)splitTransitionDataSource
{
  return (UIKeyboardSplitTransitionDataSource *)objc_loadWeakRetained((id *)&self->_transitionDataSource);
}

- (void)setSplitTransitionDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_transitionDataSource, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sliceSet, 0);
  objc_destroyWeak((id *)&self->_transitionDataSource);
  objc_destroyWeak((id *)&self->_transitionDelegate);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
}

@end
