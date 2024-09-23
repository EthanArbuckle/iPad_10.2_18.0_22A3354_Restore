@implementation _UIFeedbackVisualizer

+ (id)sharedVisualizer
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41___UIFeedbackVisualizer_sharedVisualizer__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_MergedGlobals_1031 != -1)
    dispatch_once(&_MergedGlobals_1031, block);
  return (id)qword_1ECD7D910;
}

- (id)visualFeedbackWindowForScene:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  _UIFeedbackVisualizerWindow *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = self->_feedbackWindows;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v16 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          objc_msgSend(v10, "windowScene", (_QWORD)v15);
          v11 = (id)objc_claimAutoreleasedReturnValue();

          if (v11 == v4)
          {
            v12 = v10;

            goto LABEL_13;
          }
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v7)
          continue;
        break;
      }
    }

    v12 = -[_UIFeedbackVisualizerWindow initWithWindowScene:]([_UIFeedbackVisualizerWindow alloc], "initWithWindowScene:", v4);
    objc_msgSend(v4, "screen");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_referenceBounds");
    -[UIWindow setFrame:](v12, "setFrame:");

    -[UIView setUserInteractionEnabled:](v12, "setUserInteractionEnabled:", 0);
    -[UIView setBackgroundColor:](v12, "setBackgroundColor:", 0);
    -[UIWindow setWindowLevel:](v12, "setWindowLevel:", 2200.0);
    -[UIWindow setHidden:](v12, "setHidden:", 0);
    -[NSMutableArray addObject:](self->_feedbackWindows, "addObject:", v12);
  }
  else
  {
    v12 = 0;
  }
LABEL_13:

  return v12;
}

- (id)engineLayersForEngine:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  NSMutableArray *obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;
  CGRect v34;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = self->_feedbackWindows;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v29 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v10, "engineLayers");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKey:", v4);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          objc_msgSend(v5, "addObject:", v12);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UIFeedbackVisualizer _colorForEngine:](self, "_colorForEngine:", v4);
          v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          objc_msgSend(v12, "setBorderColor:", objc_msgSend(v13, "CGColor"));

          objc_msgSend(v12, "setBorderWidth:", 4.0);
          objc_msgSend(v12, "setBounds:", 0.0, 0.0, 32.0, 32.0);
          objc_msgSend(v12, "setCornerRadius:", 16.0);
          LODWORD(v14) = 1063675494;
          objc_msgSend(v12, "setOpacity:", v14);
          objc_msgSend(v10, "safeAreaInsets");
          if (v15 <= 0.0)
            v16 = 24.0;
          else
            v16 = v15 + 16.0;
          objc_msgSend(v10, "engineLayers");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "count");

          if (objc_msgSend((id)UIApp, "_isSpringBoard"))
          {
            objc_msgSend(v10, "layer");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "bounds");
            v20 = CGRectGetWidth(v34) - ((double)v18 * 40.0 + 24.0);

          }
          else
          {
            v20 = (double)v18 * 40.0 + 24.0;
          }
          objc_msgSend(v12, "setPosition:", v20, v16);
          objc_msgSend(MEMORY[0x1E0CD28A0], "layer");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UIFeedbackVisualizer _monogramForEngine:](self, "_monogramForEngine:", v4);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setString:", v22);

          objc_msgSend(v21, "setFontSize:", 6.4);
          objc_msgSend(v21, "setAlignmentMode:", CFSTR("center"));
          objc_msgSend(v21, "setContentsGravity:", CFSTR("center"));
          objc_msgSend(v21, "setContentsScale:", 3.0);
          objc_msgSend(v21, "setFrame:", 4.0, 10.6666667, 24.0, 10.6666667);
          +[UIColor whiteColor](UIColor, "whiteColor");
          v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          objc_msgSend(v21, "setForegroundColor:", objc_msgSend(v23, "CGColor"));

          objc_msgSend(v12, "addSublayer:", v21);
          objc_msgSend(v10, "layer");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "addSublayer:", v12);

          objc_msgSend(v10, "engineLayers");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setObject:forKey:", v12, v4);

        }
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v7);
  }

  return v5;
}

- (_UIFeedbackVisualizer)init
{
  _UIFeedbackVisualizer *v2;
  uint64_t v3;
  NSMutableArray *feedbackWindows;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIFeedbackVisualizer;
  v2 = -[_UIFeedbackVisualizer init](&v6, sel_init);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = objc_claimAutoreleasedReturnValue();
  feedbackWindows = v2->_feedbackWindows;
  v2->_feedbackWindows = (NSMutableArray *)v3;

  return v2;
}

- (id)_monogramForEngine:(id)a3
{
  objc_class *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");
  if (objc_msgSend(v4, "hasPrefix:", CFSTR("_UIFeedback")))
  {
    v5 -= 11;
    v6 = 11;
  }
  else
  {
    v6 = 0;
  }
  if (objc_msgSend(v4, "hasSuffix:", CFSTR("Engine")))
    v7 = v6 - 6;
  else
    v7 = v6;
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 6;
  do
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "uppercaseLetterCharacterSet");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v4, "rangeOfCharacterFromSet:options:range:", v10, 0, v7, v5);
    v13 = v12;

    if (v11 == 0x7FFFFFFFFFFFFFFFLL)
      break;
    objc_msgSend(v4, "substringWithRange:", v11, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendString:", v14);

    v5 += v7 + ~v11;
    if (!v5)
      break;
    v7 = v11 + 1;
    --v9;
  }
  while (v9);

  return v8;
}

- (id)_colorForEngine:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _QWORD v24[4];

  v24[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)_colorForEngine__sampleFeedbacks;
  if (!_colorForEngine__sampleFeedbacks)
  {
    +[_UIDiscreteFeedback discreteFeedbackForType:](_UIDiscreteFeedback, "discreteFeedbackForType:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v6;
    +[_UIDiscreteFeedback discreteFeedbackForType:](_UIDiscreteFeedback, "discreteFeedbackForType:", 1000);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = v7;
    +[_UIDiscreteFeedback discreteFeedbackForType:](_UIDiscreteFeedback, "discreteFeedbackForType:", 1001);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v24[2] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 3);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)_colorForEngine__sampleFeedbacks;
    _colorForEngine__sampleFeedbacks = v9;

    v5 = (void *)_colorForEngine__sampleFeedbacks;
  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v11 = v5;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v20;
    while (2)
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v15);
        if ((objc_msgSend((id)objc_opt_class(), "_supportsPlayingFeedback:", v16, (_QWORD)v19) & 1) != 0)
        {
          -[_UIFeedbackVisualizer _colorForFeedback:](self, "_colorForFeedback:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_13;
        }
        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v13)
        continue;
      break;
    }
  }

  +[UIColor blackColor](UIColor, "blackColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:

  return v17;
}

- (id)_colorForEngineState:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v9;

  switch(a3)
  {
    case 0:
      v5 = 0.3;
      v6 = 1.0;
      v7 = 0.3;
      goto LABEL_10;
    case 1:
      v5 = 0.6;
      goto LABEL_6;
    case 2:
      v5 = 0.9;
LABEL_6:
      v9 = 0.2;
      v6 = 1.0;
      v7 = v5;
      goto LABEL_12;
    case 3:
      v7 = 0.6;
      goto LABEL_9;
    case 4:
      v7 = 0.9;
LABEL_9:
      v5 = 0.2;
      v6 = 1.0;
LABEL_10:
      v9 = v5;
      goto LABEL_12;
    case 5:
      v5 = 0.2;
      v7 = 0.6;
      v9 = 0.8;
      v6 = 1.0;
LABEL_12:
      +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", v5, v7, v9, v6, v3, v4);
      self = (_UIFeedbackVisualizer *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      return self;
  }
  return self;
}

- (id)_colorForFeedback:(id)a3
{
  id v3;
  double v4;
  int v5;
  double v6;
  char v7;
  double v8;

  v3 = a3;
  if (objc_msgSend(v3, "_effectiveEventType"))
    v4 = 0.3;
  else
    v4 = 0.1;
  v5 = objc_msgSend(v3, "_effectiveSystemSoundID");
  if (v5 == _UISystemSoundIDNone)
    v6 = 0.1;
  else
    v6 = 0.3;
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
    v8 = 0.3;
  else
    v8 = 0.1;
  return +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", v8, v6, v4, 1.0);
}

- (void)addEngine:(id)a3
{
  objc_msgSend(a3, "addObserver:forKeyPath:options:context:", self, CFSTR("state"), 4, 0);
}

- (void)_updateEngine:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "_state");
  -[_UIFeedbackVisualizer engineLayersForEngine:](self, "engineLayersForEngine:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v11);
        -[_UIFeedbackVisualizer _colorForEngineState:](self, "_colorForEngineState:", v5, (_QWORD)v14);
        v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v12, "setBackgroundColor:", objc_msgSend(v13, "CGColor"));

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (void)showVisualForFeedback:(id)a3 withDelay:(double)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v7 = v6;
  if (a4 <= 0.0)
  {
    -[_UIFeedbackVisualizer _showVisualForFeedback:](self, "_showVisualForFeedback:", v6);
  }
  else
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__81;
    v19 = __Block_byref_object_dispose__81;
    v20 = 0;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __57___UIFeedbackVisualizer_showVisualForFeedback_withDelay___block_invoke;
    v12[3] = &unk_1E16BDBB0;
    v12[4] = self;
    v8 = v6;
    v13 = v8;
    v14 = &v15;
    _UIFeedbackPreciseDispatchAfter(0, v12, a4);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v16[5];
    v16[5] = v9;

    objc_msgSend(v8, "visualizerSources");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v16[5]);

    _Block_object_dispose(&v15, 8);
  }

}

- (void)cancelVisualForFeedback:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(v3, "visualizerSources", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        dispatch_source_cancel(*(dispatch_source_t *)(*((_QWORD *)&v10 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  objc_msgSend(v3, "visualizerSources");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeAllObjects");

}

- (void)_showVisualForFeedback:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;
  id v17;
  void *v18;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  double MidY;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  float v33;
  double v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  _QWORD v50[4];
  id v51;
  _QWORD v52[4];
  CGRect v53;
  CGRect v54;

  v52[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "_playableProtocol");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == &unk_1EDF1A0F0)
  {
    objc_msgSend(v4, "_view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "window");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "windowScene");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UIFeedbackVisualizer visualFeedbackWindowForScene:](self, "visualFeedbackWindowForScene:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "layer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_location");
      v13 = v12;
      v15 = v14;
      objc_msgSend(v4, "_view");
      v16 = (id)objc_claimAutoreleasedReturnValue();
      if (!v16)
        v16 = v10;
      v17 = v10;
      v18 = v17;
      v48 = v17;
      v49 = v8;
      if (v13 == 1.79769313e308 && v15 == 1.79769313e308)
      {
        objc_msgSend(v16, "bounds");
        objc_msgSend(v18, "convertRect:fromCoordinateSpace:", v16);
        x = v53.origin.x;
        y = v53.origin.y;
        width = v53.size.width;
        height = v53.size.height;
        MidX = CGRectGetMidX(v53);
        v54.origin.x = x;
        v54.origin.y = y;
        v54.size.width = width;
        v54.size.height = height;
        MidY = CGRectGetMidY(v54);
      }
      else
      {
        objc_msgSend(v17, "convertPoint:fromCoordinateSpace:", v16, v13, v15);
        MidX = v25;
      }
      objc_msgSend(v11, "convertPoint:fromLayer:", 0, MidX, MidY);
      v27 = v26;
      v29 = v28;
      -[_UIFeedbackVisualizer _colorForFeedback:](self, "_colorForFeedback:", v4);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "hapticParameters");
      v31 = v11;
      v47 = v11;
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "_effectiveVolume");
      v34 = v33 * 256.0 + 64.0;

      objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_retainAutorelease(v30);
      objc_msgSend(v35, "setBackgroundColor:", objc_msgSend(v36, "CGColor"));
      objc_msgSend(v35, "setBounds:", 0.0, 0.0, 64.0, 64.0);
      objc_msgSend(v35, "setPosition:", v27, v29);
      objc_msgSend(v35, "setCornerRadius:", 32.0);
      objc_msgSend(v31, "addSublayer:", v35);
      objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
      v37 = (void *)MEMORY[0x1E0CD28B0];
      v50[0] = MEMORY[0x1E0C809B0];
      v50[1] = 3221225472;
      v50[2] = __48___UIFeedbackVisualizer__showVisualForFeedback___block_invoke;
      v50[3] = &unk_1E16B1B28;
      v51 = v35;
      v38 = v35;
      objc_msgSend(v37, "setCompletionBlock:", v50);
      objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("bounds"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", 0.0, 0.0, v34, v34);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "setToValue:", v40);

      objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("cornerRadius"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v34 * 0.5);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setToValue:", v42);

      objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "setToValue:", &unk_1E1A95730);
      objc_msgSend(MEMORY[0x1E0CD2700], "animation");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "setDuration:", 0.3);
      objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3050]);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "setTimingFunction:", v45);

      objc_msgSend(v44, "setRemovedOnCompletion:", 0);
      objc_msgSend(v44, "setFillMode:", *MEMORY[0x1E0CD2B60]);
      v52[0] = v39;
      v52[1] = v41;
      v52[2] = v43;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 3);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "setAnimations:", v46);

      objc_msgSend(v38, "addAnimation:forKey:", v44, CFSTR("animation"));
      objc_msgSend(MEMORY[0x1E0CD28B0], "commit");

      v8 = v49;
    }

  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v8 = a4;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("state")))
  {
    v9 = v8;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __72___UIFeedbackVisualizer_observeValueForKeyPath_ofObject_change_context___block_invoke;
    v10[3] = &unk_1E16B1B50;
    v10[4] = self;
    v11 = v9;
    dispatch_async(MEMORY[0x1E0C80D38], v10);

  }
}

- (NSMutableArray)feedbackWindows
{
  return self->_feedbackWindows;
}

- (void)setFeedbackWindows:(id)a3
{
  objc_storeStrong((id *)&self->_feedbackWindows, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedbackWindows, 0);
}

@end
