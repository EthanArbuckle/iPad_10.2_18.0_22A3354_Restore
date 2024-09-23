@implementation TVRUIStandardTouchProcessor

- (TVRUIStandardTouchProcessor)initWithTouchpadView:(id)a3
{
  id v5;
  TVRUIStandardTouchProcessor *v6;
  TVRUIStandardTouchProcessor *v7;
  uint64_t v8;
  TVRButtonHaptic *haptic;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TVRUIStandardTouchProcessor;
  v6 = -[TVRUIStandardTouchProcessor init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_touchpadView, a3);
    -[TVRUIStandardTouchProcessor _configureGestureRecognizersOnView](v7, "_configureGestureRecognizersOnView");
    +[TVRButtonHaptic hapticForView:](TVRButtonHaptic, "hapticForView:", v5);
    v8 = objc_claimAutoreleasedReturnValue();
    haptic = v7->_haptic;
    v7->_haptic = (TVRButtonHaptic *)v8;

  }
  return v7;
}

- (void)touchesBegan:(id)a3 touches:(id)a4 withEvent:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  _TVRUITouch *v24;
  double v25;
  _TVRUITouch *v26;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  objc_msgSend(v7, "anyObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIStandardTouchProcessor touchpadView](self, "touchpadView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "preciseLocationInView:", v10);
  -[TVRUIStandardTouchProcessor setStartingPoint:](self, "setStartingPoint:");

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIStandardTouchProcessor setStartingTouches:](self, "setStartingTouches:", v11);

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIStandardTouchProcessor setEndedTouches:](self, "setEndedTouches:", v12);

  -[TVRUIStandardTouchProcessor setVirtualBoundingBox:](self, "setVirtualBoundingBox:", *MEMORY[0x24BDBF070], *(double *)(MEMORY[0x24BDBF070] + 8), *(double *)(MEMORY[0x24BDBF070] + 16), *(double *)(MEMORY[0x24BDBF070] + 24));
  -[TVRUIStandardTouchProcessor setPreviousVelocity:](self, "setPreviousVelocity:", 0.0);
  -[TVRUIStandardTouchProcessor setPreviousTimestamp:](self, "setPreviousTimestamp:", 0.0);
  -[TVRUIStandardTouchProcessor setTouchCnt:](self, "setTouchCnt:", 0);
  _TVRUIViewControllerLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[TVRUIStandardTouchProcessor touchesBegan:touches:withEvent:].cold.1((uint64_t)v7, v13);
  v28 = v7;

  objc_msgSend(v8, "allTouches");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "allObjects");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v16 = v15;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v30 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        v22 = objc_msgSend(v16, "indexOfObject:", v21);
        if (v22 >= 0)
          v23 = v22 + 1;
        else
          v23 = 1;
        v24 = [_TVRUITouch alloc];
        objc_msgSend(v21, "timestamp");
        v26 = -[_TVRUITouch initWithTimestamp:touchPhase:fingerIndex:](v24, "initWithTimestamp:touchPhase:fingerIndex:", objc_msgSend(v21, "phase"), v23, v25);
        -[TVRUIStandardTouchProcessor startingTouches](self, "startingTouches");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "addObject:", v26);

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v18);
  }

}

- (void)touchesMoved:(id)a3 touches:(id)a4 withEvent:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v21;
  void *v22;
  _TVRUITouch *v23;
  _TVRUITouch *v24;
  void *v25;
  void *v26;
  int64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  TVRUITouchEvent *v38;
  double v39;
  TVRUITouchEvent *v40;
  void *v41;
  void *v42;
  _BOOL4 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;
  CGPoint v50;
  CGPoint v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;

  v49 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  objc_msgSend(v6, "anyObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIStandardTouchProcessor touchpadView](self, "touchpadView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "preciseLocationInView:", v8);
  v10 = v9;
  v12 = v11;

  -[TVRUIStandardTouchProcessor virtualBoundingBox](self, "virtualBoundingBox");
  if (!CGRectIsEmpty(v52))
  {
    -[TVRUIStandardTouchProcessor virtualBoundingBox](self, "virtualBoundingBox");
    if (!CGRectIsNull(v53))
      goto LABEL_19;
  }
  -[TVRUIStandardTouchProcessor startingTouches](self, "startingTouches");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "count"))
  {
    -[TVRUIStandardTouchProcessor startingPoint](self, "startingPoint");
    v15 = v14;
    v17 = v16;
    v18 = *MEMORY[0x24BDBEFB0];
    v19 = *(double *)(MEMORY[0x24BDBEFB0] + 8);

    if (v15 != v18 || v17 != v19)
      goto LABEL_11;
  }
  else
  {

  }
  objc_msgSend(v6, "anyObject");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIStandardTouchProcessor touchpadView](self, "touchpadView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "preciseLocationInView:", v22);
  -[TVRUIStandardTouchProcessor setStartingPoint:](self, "setStartingPoint:");

  v23 = [_TVRUITouch alloc];
  objc_msgSend(v21, "timestamp");
  v24 = -[_TVRUITouch initWithTimestamp:touchPhase:fingerIndex:](v23, "initWithTimestamp:touchPhase:fingerIndex:", 0, 1);
  -[TVRUIStandardTouchProcessor startingTouches](self, "startingTouches");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addObject:", v24);

  -[TVRUIStandardTouchProcessor endedTouches](self, "endedTouches");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "removeAllObjects");

LABEL_11:
  -[TVRUIStandardTouchProcessor startingPoint](self, "startingPoint");
  v27 = -[TVRUIStandardTouchProcessor _calculateDominantSwipeDirection:toPoint:](self, "_calculateDominantSwipeDirection:toPoint:");
  -[TVRUIStandardTouchProcessor startingPoint](self, "startingPoint");
  -[TVRUIStandardTouchProcessor _calculateVirtualBoundingBox:sizingRatio:swipeDirection:](self, "_calculateVirtualBoundingBox:sizingRatio:swipeDirection:", v27);
  -[TVRUIStandardTouchProcessor setVirtualBoundingBox:](self, "setVirtualBoundingBox:");
  -[TVRUIStandardTouchProcessor setStartingSwipeDirection:](self, "setStartingSwipeDirection:", v27);
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  -[TVRUIStandardTouchProcessor startingTouches](self, "startingTouches", 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v45;
    do
    {
      v32 = 0;
      do
      {
        if (*(_QWORD *)v45 != v31)
          objc_enumerationMutation(v28);
        v33 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v32);
        -[TVRUIStandardTouchProcessor startingPoint](self, "startingPoint");
        -[TVRUIStandardTouchProcessor _virtualTouchLocationForTouchPoint:](self, "_virtualTouchLocationForTouchPoint:");
        v35 = v34;
        v37 = v36;
        v38 = [TVRUITouchEvent alloc];
        objc_msgSend(v33, "timestamp");
        v40 = -[TVRUITouchEvent initWithTimestamp:touchPhase:fingerIndex:digitizerLocation:](v38, "initWithTimestamp:touchPhase:fingerIndex:digitizerLocation:", objc_msgSend(v33, "phase"), 1, v39, v35, v37);
        -[TVRUIStandardTouchProcessor eventDelegate](self, "eventDelegate");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "generatedTouchEvent:", v40);

        ++v32;
      }
      while (v30 != v32);
      v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
    }
    while (v30);
  }

LABEL_19:
  -[TVRUIStandardTouchProcessor virtualBoundingBox](self, "virtualBoundingBox");
  v50.x = v10;
  v50.y = v12;
  if (CGRectContainsPoint(v54, v50))
  {
    -[TVRUIStandardTouchProcessor _processTouches:](self, "_processTouches:", v6);
  }
  else
  {
    -[TVRUIStandardTouchProcessor touchpadView](self, "touchpadView");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "bounds");
    v51.x = v10;
    v51.y = v12;
    v43 = CGRectContainsPoint(v55, v51);

    if (v43)
      -[TVRUIStandardTouchProcessor _endAndRestartTouchesManually:](self, "_endAndRestartTouchesManually:", v6);
  }

}

- (void)_endAndRestartTouchesManually:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  TVRUITouchEvent *v13;
  TVRUITouchEvent *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  int64_t v26;
  TVRUITouchEvent *v27;
  TVRUITouchEvent *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v31;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v31 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v8);
        -[TVRUIStandardTouchProcessor touchpadView](self, "touchpadView");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "preciseLocationInView:", v10);
        -[TVRUIStandardTouchProcessor _virtualTouchLocationForTouchPoint:](self, "_virtualTouchLocationForTouchPoint:");

        -[TVRUIStandardTouchProcessor endedTouches](self, "endedTouches");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "containsObject:", v9);

        if ((v12 & 1) == 0)
        {
          v13 = [TVRUITouchEvent alloc];
          objc_msgSend(v9, "timestamp");
          v14 = -[TVRUITouchEvent initWithTimestamp:touchPhase:fingerIndex:digitizerLocation:](v13, "initWithTimestamp:touchPhase:fingerIndex:digitizerLocation:", 3, 1);
          -[TVRUIStandardTouchProcessor eventDelegate](self, "eventDelegate");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "generatedTouchEvent:", v14);

          -[TVRUIStandardTouchProcessor endedTouches](self, "endedTouches");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addObject:", v9);

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v6);
  }
  -[TVRUIStandardTouchProcessor _cleanupOnTouchesEnded](self, "_cleanupOnTouchesEnded");
  objc_msgSend(v4, "anyObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIStandardTouchProcessor touchpadView](self, "touchpadView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "previousLocationInView:", v18);
  -[TVRUIStandardTouchProcessor setStartingPoint:](self, "setStartingPoint:");

  -[TVRUIStandardTouchProcessor startingPoint](self, "startingPoint");
  v20 = v19;
  v22 = v21;
  -[TVRUIStandardTouchProcessor touchpadView](self, "touchpadView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "preciseLocationInView:", v23);
  v26 = -[TVRUIStandardTouchProcessor _calculateDominantSwipeDirection:toPoint:](self, "_calculateDominantSwipeDirection:toPoint:", v20, v22, v24, v25);

  -[TVRUIStandardTouchProcessor setStartingSwipeDirection:](self, "setStartingSwipeDirection:", v26);
  -[TVRUIStandardTouchProcessor startingPoint](self, "startingPoint");
  -[TVRUIStandardTouchProcessor _calculateVirtualBoundingBox:sizingRatio:swipeDirection:](self, "_calculateVirtualBoundingBox:sizingRatio:swipeDirection:", v26);
  -[TVRUIStandardTouchProcessor setVirtualBoundingBox:](self, "setVirtualBoundingBox:");
  -[TVRUIStandardTouchProcessor startingPoint](self, "startingPoint");
  -[TVRUIStandardTouchProcessor _virtualTouchLocationForTouchPoint:](self, "_virtualTouchLocationForTouchPoint:");
  v27 = [TVRUITouchEvent alloc];
  objc_msgSend(v17, "timestamp");
  v28 = -[TVRUITouchEvent initWithTimestamp:touchPhase:fingerIndex:digitizerLocation:](v27, "initWithTimestamp:touchPhase:fingerIndex:digitizerLocation:", 0, 1);
  -[TVRUIStandardTouchProcessor eventDelegate](self, "eventDelegate");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "generatedTouchEvent:", v28);

  -[TVRUIStandardTouchProcessor _processTouches:](self, "_processTouches:", v4);
}

- (void)touchesEnded:(id)a3 touches:(id)a4 withEvent:(id)a5
{
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  char v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  char v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD block[5];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint8_t v39[128];
  uint8_t buf[4];
  id v41;
  uint64_t v42;
  CGRect v43;

  v42 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  _TVRUIViewControllerLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v41 = v6;
    _os_log_impl(&dword_21B042000, v7, OS_LOG_TYPE_DEFAULT, "TouchesEnded: touches: %@", buf, 0xCu);
  }

  -[TVRUIStandardTouchProcessor virtualBoundingBox](self, "virtualBoundingBox");
  if (CGRectIsNull(v43))
  {
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v35;
      while (2)
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v35 != v11)
            objc_enumerationMutation(v8);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * v12), "tapCount"))
          {
            _TVRUIViewControllerLog();
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
              -[TVRUIStandardTouchProcessor touchesEnded:touches:withEvent:].cold.1(v24);

            -[TVRUIStandardTouchProcessor eventDelegate](self, "eventDelegate");
            v25 = objc_claimAutoreleasedReturnValue();
            if (v25)
            {
              v26 = (void *)v25;
              -[TVRUIStandardTouchProcessor eventDelegate](self, "eventDelegate");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = objc_opt_respondsToSelector();

              if ((v28 & 1) != 0)
              {
                -[TVRUIStandardTouchProcessor _sendSelectButtonPressBegan](self, "_sendSelectButtonPressBegan");
                -[TVRUIStandardTouchProcessor _sendSelectButtonPressEnded](self, "_sendSelectButtonPressEnded");
                -[TVRButtonHaptic userInteractionBegan](self->_haptic, "userInteractionBegan");
                block[0] = MEMORY[0x24BDAC760];
                block[1] = 3221225472;
                block[2] = __62__TVRUIStandardTouchProcessor_touchesEnded_touches_withEvent___block_invoke;
                block[3] = &unk_24DE2C198;
                block[4] = self;
                dispatch_async(MEMORY[0x24BDAC9B8], block);
              }
            }
            -[TVRUIStandardTouchProcessor _cleanupOnTouchesEnded](self, "_cleanupOnTouchesEnded");

            goto LABEL_32;
          }
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
        if (v10)
          continue;
        break;
      }
    }

  }
  -[TVRUIStandardTouchProcessor endedTouches](self, "endedTouches");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (v14)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v16 = v6;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v30;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v30 != v19)
            objc_enumerationMutation(v16);
          v21 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v20);
          -[TVRUIStandardTouchProcessor endedTouches](self, "endedTouches", (_QWORD)v29);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "containsObject:", v21);

          if ((v23 & 1) == 0)
            objc_msgSend(v15, "addObject:", v21);
          ++v20;
        }
        while (v18 != v20);
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
      }
      while (v18);
    }

    -[TVRUIStandardTouchProcessor _processTouches:](self, "_processTouches:", v15);
  }
  else
  {
    -[TVRUIStandardTouchProcessor _processTouches:](self, "_processTouches:", v6);
  }
  -[TVRUIStandardTouchProcessor _cleanupOnTouchesEnded](self, "_cleanupOnTouchesEnded", (_QWORD)v29);
LABEL_32:

}

uint64_t __62__TVRUIStandardTouchProcessor_touchesEnded_touches_withEvent___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "userInteractionEnded");
}

- (void)touchesCancelled:(id)a3 touches:(id)a4 withEvent:(id)a5
{
  -[TVRUIStandardTouchProcessor _processTouches:](self, "_processTouches:", a4);
  -[TVRUIStandardTouchProcessor _cleanupOnTouchesEnded](self, "_cleanupOnTouchesEnded");
}

- (void)_processTouches:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        -[TVRUIStandardTouchProcessor _touchEventForTouch:](self, "_touchEventForTouch:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v8));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[TVRUIStandardTouchProcessor eventDelegate](self, "eventDelegate");
        v10 = objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v11 = (void *)v10;
          -[TVRUIStandardTouchProcessor eventDelegate](self, "eventDelegate");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_opt_respondsToSelector();

          if ((v13 & 1) != 0)
          {
            -[TVRUIStandardTouchProcessor eventDelegate](self, "eventDelegate");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "generatedTouchEvent:", v9);

          }
        }

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

}

- (void)_cleanupOnTouchesEnded
{
  void *v3;
  void *v4;

  -[TVRUIStandardTouchProcessor setVirtualBoundingBox:](self, "setVirtualBoundingBox:", *MEMORY[0x24BDBF070], *(double *)(MEMORY[0x24BDBF070] + 8), *(double *)(MEMORY[0x24BDBF070] + 16), *(double *)(MEMORY[0x24BDBF070] + 24));
  -[TVRUIStandardTouchProcessor startingTouches](self, "startingTouches");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  -[TVRUIStandardTouchProcessor endedTouches](self, "endedTouches");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

  -[TVRUIStandardTouchProcessor setStartingPoint:](self, "setStartingPoint:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
}

- (id)_touchEventForTouch:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  TVRUITouchEvent *v10;
  double v11;
  double v12;
  uint64_t v13;

  v4 = a3;
  -[TVRUIStandardTouchProcessor touchpadView](self, "touchpadView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preciseLocationInView:", v5);
  -[TVRUIStandardTouchProcessor _virtualTouchLocationForTouchPoint:](self, "_virtualTouchLocationForTouchPoint:");
  v7 = v6;
  v9 = v8;

  v10 = [TVRUITouchEvent alloc];
  objc_msgSend(v4, "timestamp");
  v12 = v11;
  v13 = objc_msgSend(v4, "phase");

  return -[TVRUITouchEvent initWithTimestamp:touchPhase:fingerIndex:digitizerLocation:](v10, "initWithTimestamp:touchPhase:fingerIndex:digitizerLocation:", v13, 1, v12, v7, v9);
}

- (CGRect)_calculateVirtualBoundingBox:(CGPoint)a3 sizingRatio:(double)a4 swipeDirection:(int64_t)a5
{
  double y;
  double x;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGFloat v22;
  double MinX;
  double v24;
  double MinY;
  CGFloat MaxY;
  double v27;
  CGFloat v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect result;

  y = a3.y;
  x = a3.x;
  -[TVRUIStandardTouchProcessor touchpadView](self, "touchpadView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  if (TVRPointSizeOfSiriRemoteOnMainScreen_onceToken != -1)
    dispatch_once(&TVRPointSizeOfSiriRemoteOnMainScreen_onceToken, &__block_literal_global_16);
  v18 = *(double *)&TVRPointSizeOfSiriRemoteOnMainScreen_size_0 * a4;
  v19 = *(double *)&TVRPointSizeOfSiriRemoteOnMainScreen_size_1 * a4;
  switch(a5)
  {
    case 1:
      v20 = x + v18 * -0.5;
      v21 = -0.8;
      goto LABEL_12;
    case 2:
      v31 = -0.2;
      goto LABEL_14;
    case 3:
      v20 = x + v18 * -0.5;
      v21 = -0.2;
LABEL_12:
      v30 = y + v19 * v21;
      break;
    case 4:
      v31 = -0.8;
LABEL_14:
      v20 = x + v18 * v31;
      v30 = y + v19 * -0.5;
      break;
    default:
      v38.origin.x = v11;
      v38.origin.y = v13;
      v38.size.width = v15;
      v38.size.height = v17;
      v37 = y;
      v22 = v17;
      MinX = CGRectGetMinX(v38);
      v39.origin.x = v11;
      v39.origin.y = v13;
      v39.size.width = v15;
      v39.size.height = v22;
      v24 = (x - MinX) / (CGRectGetMaxX(v39) - MinX);
      if (v24 < 0.0)
        v24 = 0.0;
      v36 = v18 * fmin(v24, 1.0) + 0.0;
      v40.origin.x = v11;
      v40.origin.y = v13;
      v40.size.width = v15;
      v40.size.height = v22;
      MinY = CGRectGetMinY(v40);
      v41.origin.x = v11;
      v41.origin.y = v13;
      v41.size.width = v15;
      v41.size.height = v22;
      MaxY = CGRectGetMaxY(v41);
      v27 = v37 - MinY;
      v28 = MaxY - MinY;
      v17 = v22;
      v29 = v27 / v28;
      if (v29 < 0.0)
        v29 = 0.0;
      v20 = x - v36;
      v30 = v37 - (v19 * fmin(v29, 1.0) + 0.0);
      break;
  }
  v32 = 0.0;
  v33 = 0.0;
  if (v20 >= 0.0)
  {
    v33 = v20;
    if (v18 + v20 > v15)
      v33 = v15 - v18;
  }
  if (v30 >= 0.0)
  {
    v32 = v30;
    if (v19 + v30 > v17)
      v32 = v17 - v19;
  }
  v34 = v18;
  v35 = v19;
  result.size.height = v35;
  result.size.width = v34;
  result.origin.y = v32;
  result.origin.x = v33;
  return result;
}

- (CGPoint)_virtualTouchLocationForTouchPoint:(CGPoint)a3
{
  double x;
  CGFloat v4;
  CGFloat v5;
  CGFloat width;
  CGFloat height;
  double MinX;
  double v9;
  double v10;
  double MinY;
  double v12;
  double v13;
  double v14;
  double y;
  CGPoint result;
  CGRect v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;

  y = a3.y;
  x = a3.x;
  -[TVRUIStandardTouchProcessor virtualBoundingBox](self, "virtualBoundingBox");
  v4 = v17.origin.x;
  v5 = v17.origin.y;
  width = v17.size.width;
  height = v17.size.height;
  MinX = CGRectGetMinX(v17);
  v18.origin.x = v4;
  v18.origin.y = v5;
  v18.size.width = width;
  v18.size.height = height;
  v9 = (x - MinX) / (CGRectGetMaxX(v18) - MinX);
  if (v9 < 0.0)
    v9 = 0.0;
  if (v9 >= 1.0)
    v10 = 1.0;
  else
    v10 = v9 + 0.0;
  v19.origin.x = v4;
  v19.origin.y = v5;
  v19.size.width = width;
  v19.size.height = height;
  MinY = CGRectGetMinY(v19);
  v20.origin.x = v4;
  v20.origin.y = v5;
  v20.size.width = width;
  v20.size.height = height;
  v12 = (y - MinY) / (CGRectGetMaxY(v20) - MinY);
  if (v12 < 0.0)
    v12 = 0.0;
  v13 = v12 + 0.0;
  if (v12 >= 1.0)
    v13 = 1.0;
  v14 = v10;
  result.y = v13;
  result.x = v14;
  return result;
}

- (int64_t)_calculateDominantSwipeDirection:(CGPoint)a3 toPoint:(CGPoint)a4
{
  int64_t v5;
  int64_t v6;

  if (a3.x == a4.x && a3.y == a4.y)
    return 0;
  v5 = 2;
  if (a4.x - a3.x < 0.0)
    v5 = 4;
  v6 = 3;
  if (a4.y - a3.y < 0.0)
    v6 = 1;
  if (vabdd_f64(a4.x, a3.x) >= vabdd_f64(a4.y, a3.y))
    return v5;
  else
    return v6;
}

- (void)_configureGestureRecognizersOnView
{
  void *v3;
  id v4;

  -[UIView removeAllGestureRecognizers](self->_touchpadView, "removeAllGestureRecognizers");
  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BEBDA20]), "initWithTarget:action:", self, sel_handleTapGesture_);
  objc_msgSend(v4, "setCancelsTouchesInView:", 1);
  objc_msgSend(v4, "setDelaysTouchesBegan:", 0);
  objc_msgSend(v4, "setDelaysTouchesEnded:", 0);
  objc_msgSend(v4, "setAllowableMovement:", 5.0);
  -[UIView addGestureRecognizer:](self->_touchpadView, "addGestureRecognizer:", v4);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD740]), "initWithTarget:action:", self, sel_handleLongPress_);
  objc_msgSend(v3, "setMinimumPressDuration:", 0.3);
  objc_msgSend(v3, "setCancelsTouchesInView:", 1);
  objc_msgSend(v3, "setDelaysTouchesBegan:", 0);
  objc_msgSend(v3, "setDelaysTouchesEnded:", 0);
  -[UIView addGestureRecognizer:](self->_touchpadView, "addGestureRecognizer:", v3);

}

- (void)handleTapGesture:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  _QWORD block[5];
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "state") == 3)
  {
    _TVRUIViewControllerLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v4;
      _os_log_impl(&dword_21B042000, v5, OS_LOG_TYPE_DEFAULT, "Handling tap gesture on touchpad %@", buf, 0xCu);
    }

    -[TVRUIStandardTouchProcessor eventDelegate](self, "eventDelegate");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)v6;
      -[TVRUIStandardTouchProcessor eventDelegate](self, "eventDelegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_opt_respondsToSelector();

      if ((v9 & 1) != 0)
      {
        -[TVRUIStandardTouchProcessor _sendSelectButtonPressBegan](self, "_sendSelectButtonPressBegan");
        -[TVRUIStandardTouchProcessor _sendSelectButtonPressEnded](self, "_sendSelectButtonPressEnded");
        -[TVRButtonHaptic userInteractionBegan](self->_haptic, "userInteractionBegan");
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __48__TVRUIStandardTouchProcessor_handleTapGesture___block_invoke;
        block[3] = &unk_24DE2C198;
        block[4] = self;
        dispatch_async(MEMORY[0x24BDAC9B8], block);
      }
    }
  }

}

uint64_t __48__TVRUIStandardTouchProcessor_handleTapGesture___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "userInteractionEnded");
}

- (void)handleLongPress:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "state") == 1)
  {
    -[TVRUIStandardTouchProcessor _sendSelectButtonPressBegan](self, "_sendSelectButtonPressBegan");
  }
  else if (objc_msgSend(v4, "state") == 3 || objc_msgSend(v4, "state") == 4)
  {
    -[TVRUIStandardTouchProcessor _sendSelectButtonPressEnded](self, "_sendSelectButtonPressEnded");
  }

}

- (void)_sendSelectButtonPressBegan
{
  void *v3;
  id v4;

  +[TVRUIButtonEvent createButtonEvent:buttonType:](TVRUIButtonEvent, "createButtonEvent:buttonType:", 1, 1);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[TVRUIStandardTouchProcessor eventDelegate](self, "eventDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "generatedButtonEvent:", v4);

}

- (void)_sendSelectButtonPressEnded
{
  void *v3;
  id v4;

  +[TVRUIButtonEvent createButtonEvent:buttonType:](TVRUIButtonEvent, "createButtonEvent:buttonType:", 2, 1);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[TVRUIStandardTouchProcessor eventDelegate](self, "eventDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "generatedButtonEvent:", v4);

}

- (UIView)touchpadView
{
  return self->_touchpadView;
}

- (void)setTouchpadView:(id)a3
{
  objc_storeStrong((id *)&self->_touchpadView, a3);
}

- (_TVRUIEventDelegate)eventDelegate
{
  return (_TVRUIEventDelegate *)objc_loadWeakRetained((id *)&self->_eventDelegate);
}

- (void)setEventDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_eventDelegate, a3);
}

- (TVRButtonHaptic)haptic
{
  return self->_haptic;
}

- (void)setHaptic:(id)a3
{
  objc_storeStrong((id *)&self->_haptic, a3);
}

- (CGRect)virtualBoundingBox
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_virtualBoundingBox.origin.x;
  y = self->_virtualBoundingBox.origin.y;
  width = self->_virtualBoundingBox.size.width;
  height = self->_virtualBoundingBox.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setVirtualBoundingBox:(CGRect)a3
{
  self->_virtualBoundingBox = a3;
}

- (UIView)debugView
{
  return self->_debugView;
}

- (void)setDebugView:(id)a3
{
  objc_storeStrong((id *)&self->_debugView, a3);
}

- (double)previousVelocity
{
  return self->_previousVelocity;
}

- (void)setPreviousVelocity:(double)a3
{
  self->_previousVelocity = a3;
}

- (double)previousTimestamp
{
  return self->_previousTimestamp;
}

- (void)setPreviousTimestamp:(double)a3
{
  self->_previousTimestamp = a3;
}

- (NSMutableSet)startingTouches
{
  return self->_startingTouches;
}

- (void)setStartingTouches:(id)a3
{
  objc_storeStrong((id *)&self->_startingTouches, a3);
}

- (CGPoint)startingPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_startingPoint.x;
  y = self->_startingPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setStartingPoint:(CGPoint)a3
{
  self->_startingPoint = a3;
}

- (int64_t)startingSwipeDirection
{
  return self->_startingSwipeDirection;
}

- (void)setStartingSwipeDirection:(int64_t)a3
{
  self->_startingSwipeDirection = a3;
}

- (NSMutableSet)endedTouches
{
  return self->_endedTouches;
}

- (void)setEndedTouches:(id)a3
{
  objc_storeStrong((id *)&self->_endedTouches, a3);
}

- (int64_t)touchCnt
{
  return self->_touchCnt;
}

- (void)setTouchCnt:(int64_t)a3
{
  self->_touchCnt = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endedTouches, 0);
  objc_storeStrong((id *)&self->_startingTouches, 0);
  objc_storeStrong((id *)&self->_debugView, 0);
  objc_storeStrong((id *)&self->_haptic, 0);
  objc_destroyWeak((id *)&self->_eventDelegate);
  objc_storeStrong((id *)&self->_touchpadView, 0);
}

- (void)touchesBegan:(uint64_t)a1 touches:(NSObject *)a2 withEvent:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_21B042000, a2, OS_LOG_TYPE_DEBUG, "TouchesBegan: touches: %@", (uint8_t *)&v2, 0xCu);
}

- (void)touchesEnded:(os_log_t)log touches:withEvent:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21B042000, log, OS_LOG_TYPE_ERROR, "Detected a tap event in touchesEnded", v1, 2u);
}

@end
