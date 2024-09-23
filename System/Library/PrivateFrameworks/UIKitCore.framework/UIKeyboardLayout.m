@implementation UIKeyboardLayout

- (void)willMoveToWindow:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  const char *v12;
  const char *v13;
  id v14;

  v14 = a3;
  -[UIView window](self, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "screen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIKBScreenTraits screen](self->_screenTraits, "screen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(v14, "screen");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  if (v5 != v9)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v5)
    {
      if (self->_listeningForWillChange)
      {
        objc_msgSend(v10, "removeObserver:name:object:", self, CFSTR("UIKeyboardPrivateWillChangeFrameNotification"), v5);
        self->_listeningForWillChange = 0;
      }
      if (self->_listeningForDidChange)
      {
        objc_msgSend(v11, "removeObserver:name:object:", self, CFSTR("UIKeyboardPrivateDidChangeFrameNotification"), v5);
        self->_listeningForDidChange = 0;
      }
    }
    if (objc_msgSend(v9, "_userInterfaceIdiom") == 1)
    {
      v12 = -[UIKeyboardLayout handlerForNotification:](self, "handlerForNotification:", CFSTR("UIKeyboardPrivateWillChangeFrameNotification"));
      if (v12)
      {
        self->_listeningForWillChange = 1;
        objc_msgSend(v11, "addObserver:selector:name:object:", self, v12, CFSTR("UIKeyboardPrivateWillChangeFrameNotification"), v9);
      }
      v13 = -[UIKeyboardLayout handlerForNotification:](self, "handlerForNotification:", CFSTR("UIKeyboardPrivateDidChangeFrameNotification"));
      if (v13)
      {
        self->_listeningForDidChange = 1;
        objc_msgSend(v11, "addObserver:selector:name:object:", self, v13, CFSTR("UIKeyboardPrivateDidChangeFrameNotification"), v9);
      }
    }

  }
}

+ (BOOL)_showSmallDisplayKeyplane
{
  return _AXSLowercaseKeyboardDisplayEnabled() != 0;
}

- (void)updateTouchProcessingForKeyplaneChange
{
  void *v3;
  int v4;
  int v5;
  void *v6;
  _UIKBRTRecognizer *v7;
  void *v8;
  void *v9;
  _UIKBRTFingerDetection *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  _UIKBRTTouchDrifting *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  UIKBCadenceMonitor *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _UIKBRTTouchVelocities *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;

  -[UIKeyboardLayout touchDrifting](self, "touchDrifting");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reset");

  v4 = -[UIKeyboardLayout getHandRestRecognizerState](self, "getHandRestRecognizerState");
  v5 = v4;
  if ((v4 - 1) < 2)
  {
    -[UIKeyboardLayout handRestRecognizer](self, "handRestRecognizer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v7 = objc_alloc_init(_UIKBRTRecognizer);
      -[UIKeyboardLayout setHandRestRecognizer:](self, "setHandRestRecognizer:", v7);

      -[UIKeyboardLayout handRestRecognizer](self, "handRestRecognizer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setDelegate:", self);

    }
    -[UIKeyboardLayout fingerDetection](self, "fingerDetection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      v10 = -[_UIKBRTFingerDetection initWithParentView:]([_UIKBRTFingerDetection alloc], "initWithParentView:", self);
      -[UIKeyboardLayout setFingerDetection:](self, "setFingerDetection:", v10);

    }
    if (v5 == 1)
    {
      v11 = +[_UIKBRTTouchDrifting isEnabled](_UIKBRTTouchDrifting, "isEnabled");
      -[UIKeyboardLayout touchDrifting](self, "touchDrifting");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v11)
      {

        if (!v13)
        {
          v14 = -[_UIKBRTTouchDrifting initWithParentView:]([_UIKBRTTouchDrifting alloc], "initWithParentView:", self);
          -[UIKeyboardLayout setTouchDrifting:](self, "setTouchDrifting:", v14);

          -[UIKeyboardLayout touchDrifting](self, "touchDrifting");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setDelegate:", self);

        }
        goto LABEL_15;
      }
    }
    else
    {
      -[UIKeyboardLayout touchDrifting](self, "touchDrifting");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
    }
    objc_msgSend(v12, "setDelegate:", 0);

    -[UIKeyboardLayout setTouchDrifting:](self, "setTouchDrifting:", 0);
LABEL_15:
    if ((_UIInternalPreferenceUsesDefault_0(&_MergedGlobals_29, (uint64_t)CFSTR("_UIKBRT_CadenceMonitor")) & 1) != 0
      || byte_1ECD766B4)
    {
      -[UIKeyboardLayout cadenceMonitor](self, "cadenceMonitor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v18)
      {
        v19 = objc_alloc_init(UIKBCadenceMonitor);
        -[UIKeyboardLayout setCadenceMonitor:](self, "setCadenceMonitor:", v19);

      }
      -[UIKeyboardLayout handRestRecognizer](self, "handRestRecognizer");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "averagingRules");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKeyboardLayout cadenceMonitor](self, "cadenceMonitor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addObject:", v22);

    }
    if (((_UIInternalPreferenceUsesDefault_0(&dword_1ECD766B8, (uint64_t)CFSTR("_UIKBRT_TouchVelocities")) & 1) != 0
       || byte_1ECD766BC)
      && MGGetBoolAnswer())
    {
      -[UIKeyboardLayout touchVelocities](self, "touchVelocities");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v23)
      {
        v24 = objc_alloc_init(_UIKBRTTouchVelocities);
        -[UIKeyboardLayout setTouchVelocities:](self, "setTouchVelocities:", v24);

      }
      -[UIKeyboardLayout handRestRecognizer](self, "handRestRecognizer");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "averagingRules");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKeyboardLayout touchVelocities](self, "touchVelocities");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "addObject:", v27);

    }
    -[UIKeyboardLayout handRestRecognizerStandardKeyPixelSize](self, "handRestRecognizerStandardKeyPixelSize");
    v29 = v28;
    v31 = v30;
    -[UIKeyboardLayout handRestRecognizer](self, "handRestRecognizer");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setStandardKeyPixelSize:", v29, v31);

    -[UIKeyboardLayout handRestRecognizer](self, "handRestRecognizer");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setDisableHomeRowReturn:", v5 == 2);

    -[UIKeyboardLayout _resetFingerDetectionFromLayout](self, "_resetFingerDetectionFromLayout");
    -[UIKeyboardLayout cadenceMonitor](self, "cadenceMonitor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "reset");

    v17 = 0;
    goto LABEL_27;
  }
  if (!v4)
  {
    -[UIKeyboardLayout setCadenceMonitor:](self, "setCadenceMonitor:", 0);
    -[UIKeyboardLayout touchDrifting](self, "touchDrifting");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setDelegate:", 0);

    -[UIKeyboardLayout setTouchDrifting:](self, "setTouchDrifting:", 0);
    -[UIKeyboardLayout setFingerDetection:](self, "setFingerDetection:", 0);
    -[UIKeyboardLayout setHandRestRecognizer:](self, "setHandRestRecognizer:", 0);
    v17 = 1;
LABEL_27:
    -[UIKeyboardLayout _setRequiresExclusiveTouch:](self, "_setRequiresExclusiveTouch:", v17);
  }
}

- (BOOL)supportsVirtualDrift
{
  void *v2;
  BOOL v3;

  -[UIKeyboardLayout touchDrifting](self, "touchDrifting");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (_UIKBRTTouchDrifting)touchDrifting
{
  return self->_touchDrifting;
}

void __58__UIKeyboardLayout_updateTouchProcessingForKeyboardChange__block_invoke(uint64_t a1, void *a2)
{
  id *WeakRetained;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  void *v15;
  _UIKBRTRecognizer *v16;
  void *v17;
  void *v18;
  _UIKBRTFingerDetection *v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  _UIKBRTTouchDrifting *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  UIKBCadenceMonitor *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _UIKBRTTouchVelocities *v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  _QWORD v47[5];
  _QWORD v48[4];
  id v49;
  id v50;

  v45 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(WeakRetained[77], "count"))
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v6 = WeakRetained[77];
    v7 = MEMORY[0x1E0C809B0];
    v48[0] = MEMORY[0x1E0C809B0];
    v48[1] = 3221225472;
    v48[2] = __58__UIKeyboardLayout_updateTouchProcessingForKeyboardChange__block_invoke_2;
    v48[3] = &unk_1E16D6E90;
    v49 = v4;
    v50 = v5;
    v8 = v5;
    v9 = v4;
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v48);
    v10 = WeakRetained[77];
    objc_msgSend(v8, "allObjects");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObjectsForKeys:", v11);

    v47[0] = v7;
    v47[1] = 3221225472;
    v47[2] = __58__UIKeyboardLayout_updateTouchProcessingForKeyboardChange__block_invoke_5;
    v47[3] = &unk_1E16D6EB8;
    v47[4] = WeakRetained;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v47);

  }
  objc_msgSend(WeakRetained, "touchDrifting", v45);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "reset");

  v13 = objc_msgSend(WeakRetained, "getHandRestRecognizerState");
  v14 = v13;
  if ((v13 - 1) < 2)
  {
    objc_msgSend(WeakRetained, "handRestRecognizer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      v16 = objc_alloc_init(_UIKBRTRecognizer);
      objc_msgSend(WeakRetained, "setHandRestRecognizer:", v16);

      objc_msgSend(WeakRetained, "handRestRecognizer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setDelegate:", WeakRetained);

    }
    objc_msgSend(WeakRetained, "fingerDetection");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
    {
      v19 = -[_UIKBRTFingerDetection initWithParentView:]([_UIKBRTFingerDetection alloc], "initWithParentView:", WeakRetained);
      objc_msgSend(WeakRetained, "setFingerDetection:", v19);

    }
    if (v14 == 1)
    {
      v20 = +[_UIKBRTTouchDrifting isEnabled](_UIKBRTTouchDrifting, "isEnabled");
      objc_msgSend(WeakRetained, "touchDrifting");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21;
      if (v20)
      {

        if (!v22)
        {
          v23 = -[_UIKBRTTouchDrifting initWithParentView:]([_UIKBRTTouchDrifting alloc], "initWithParentView:", WeakRetained);
          objc_msgSend(WeakRetained, "setTouchDrifting:", v23);

          objc_msgSend(WeakRetained, "touchDrifting");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "setDelegate:", WeakRetained);

        }
        goto LABEL_16;
      }
    }
    else
    {
      objc_msgSend(WeakRetained, "touchDrifting");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21;
    }
    objc_msgSend(v21, "setDelegate:", 0);

    objc_msgSend(WeakRetained, "setTouchDrifting:", 0);
LABEL_16:
    if ((_UIInternalPreferenceUsesDefault_0(&_MergedGlobals_29, (uint64_t)CFSTR("_UIKBRT_CadenceMonitor")) & 1) != 0
      || byte_1ECD766B4)
    {
      objc_msgSend(WeakRetained, "cadenceMonitor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v28)
      {
        v29 = objc_alloc_init(UIKBCadenceMonitor);
        objc_msgSend(WeakRetained, "setCadenceMonitor:", v29);

      }
      objc_msgSend(WeakRetained, "handRestRecognizer");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "averagingRules");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "cadenceMonitor");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "addObject:", v32);

    }
    if (((_UIInternalPreferenceUsesDefault_0(&dword_1ECD766B8, (uint64_t)CFSTR("_UIKBRT_TouchVelocities")) & 1) != 0
       || byte_1ECD766BC)
      && MGGetBoolAnswer())
    {
      objc_msgSend(WeakRetained, "touchVelocities");
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v33)
      {
        v34 = objc_alloc_init(_UIKBRTTouchVelocities);
        objc_msgSend(WeakRetained, "setTouchVelocities:", v34);

      }
      objc_msgSend(WeakRetained, "handRestRecognizer");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "averagingRules");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "touchVelocities");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "addObject:", v37);

    }
    objc_msgSend(WeakRetained, "handRestRecognizerStandardKeyPixelSize");
    v39 = v38;
    v41 = v40;
    objc_msgSend(WeakRetained, "handRestRecognizer");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setStandardKeyPixelSize:", v39, v41);

    objc_msgSend(WeakRetained, "handRestRecognizer");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setDisableHomeRowReturn:", v14 == 2);

    objc_msgSend(WeakRetained, "_resetFingerDetectionFromLayout");
    objc_msgSend(WeakRetained, "cadenceMonitor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "reset");

    v27 = 0;
    goto LABEL_28;
  }
  if (!v13)
  {
    objc_msgSend(WeakRetained, "setCadenceMonitor:", 0);
    objc_msgSend(WeakRetained, "touchDrifting");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setDelegate:", 0);

    objc_msgSend(WeakRetained, "setTouchDrifting:", 0);
    objc_msgSend(WeakRetained, "setFingerDetection:", 0);
    objc_msgSend(WeakRetained, "handRestRecognizer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setDelegate:", 0);

    objc_msgSend(WeakRetained, "setHandRestRecognizer:", 0);
    v27 = 1;
LABEL_28:
    objc_msgSend(WeakRetained, "_setRequiresExclusiveTouch:", v27);
  }
  objc_msgSend(v46, "returnExecutionToParent");

}

- (void)setTouchDrifting:(id)a3
{
  objc_storeStrong((id *)&self->_touchDrifting, a3);
}

- (void)setHandRestRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_handRestRecognizer, a3);
}

- (void)setFingerDetection:(id)a3
{
  objc_storeStrong((id *)&self->_fingerDetection, a3);
}

- (void)setCadenceMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_cadenceMonitor, a3);
}

- (CGPoint)rightVirtualDriftOffset
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGPoint result;

  -[UIKeyboardLayout touchDrifting](self, "touchDrifting");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UIKeyboardLayout touchDrifting](self, "touchDrifting");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rightHandDriftOffset");
    v6 = v5;
    v8 = v7;

  }
  else
  {
    v6 = *MEMORY[0x1E0C9D538];
    v8 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }
  v9 = v6;
  v10 = v8;
  result.y = v10;
  result.x = v9;
  return result;
}

- (CGPoint)leftVirtualDriftOffset
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGPoint result;

  -[UIKeyboardLayout touchDrifting](self, "touchDrifting");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UIKeyboardLayout touchDrifting](self, "touchDrifting");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "leftHandDriftOffset");
    v6 = v5;
    v8 = v7;

  }
  else
  {
    v6 = *MEMORY[0x1E0C9D538];
    v8 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }
  v9 = v6;
  v10 = v8;
  result.y = v10;
  result.x = v9;
  return result;
}

- (BOOL)isReachableDevice
{
  return -[UIKBScreenTraits idiom](self->_screenTraits, "idiom") == 0;
}

- (void)_setRequiresExclusiveTouch:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[UIView _rootInputWindowController](self, "_rootInputWindowController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setExclusiveTouch:", v3);

}

- (void)deactivateActiveKeys
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  NSObject *deferredTouchTaskListsQueue;
  void *v11;
  void *v12;
  _QWORD block[7];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[UIKeyboardLayout handRestRecognizer](self, "handRestRecognizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)-[NSMutableArray copy](self->_uncommittedTouchUUIDs, "copy");
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v21 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          if ((!self->_activeTouchUUID || (objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "isEqual:") & 1) == 0)
            && (!self->_shiftKeyTouchUUID || (objc_msgSend(v9, "isEqual:") & 1) == 0))
          {
            -[NSMutableArray removeObject:](self->_uncommittedTouchUUIDs, "removeObject:", v9);
            -[NSMutableSet addObject:](self->_touchIgnoredUUIDSet, "addObject:", v9);
            v14 = 0;
            v15 = &v14;
            v16 = 0x3032000000;
            v17 = __Block_byref_object_copy__132;
            v18 = __Block_byref_object_dispose__132;
            v19 = 0;
            deferredTouchTaskListsQueue = self->_deferredTouchTaskListsQueue;
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __40__UIKeyboardLayout_deactivateActiveKeys__block_invoke;
            block[3] = &unk_1E16B9698;
            block[5] = v9;
            block[6] = &v14;
            block[4] = self;
            dispatch_sync(deferredTouchTaskListsQueue, block);
            if ((objc_msgSend((id)v15[5], "isExecutingFirstTask") & 1) == 0)
            {
              +[UIKBTouchState touchForTouchUUID:](UIKBTouchState, "touchForTouchUUID:", v9);
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              if (v11)
              {
                -[UIKeyboardLayout handRestRecognizer](self, "handRestRecognizer");
                v12 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v12, "markTouchProcessed:withIdentifier:", v11, v9);

              }
            }
            _Block_object_dispose(&v14, 8);

          }
        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v6);
    }

  }
}

- (_UIKBRTRecognizer)handRestRecognizer
{
  return self->_handRestRecognizer;
}

- (void)setIgnoringKeyplaneChange:(BOOL)a3
{
  self->_ignoringKeyplaneChange = a3;
}

- (int64_t)idiom
{
  return -[UIKBScreenTraits idiom](self->_screenTraits, "idiom");
}

- (unint64_t)cursorLocation
{
  return self->_cursorLocation;
}

- (int64_t)orientation
{
  return -[UIKBScreenTraits orientation](self->_screenTraits, "orientation");
}

- (BOOL)isFloating
{
  return -[UIKBScreenTraits isFloating](self->_screenTraits, "isFloating");
}

- (void)setShiftKeyTouchUUID:(id)a3
{
  objc_storeStrong((id *)&self->_shiftKeyTouchUUID, a3);
}

- (BOOL)ignoringKeyplaneChange
{
  return self->_ignoringKeyplaneChange;
}

- (BOOL)hasPreferredHeight
{
  return self->_hasPreferredHeight;
}

- (BOOL)disableInteraction
{
  return self->_disableInteraction;
}

- (void)setTextEditingTraits:(id)a3
{
  objc_storeStrong((id *)&self->_textEditingTraits, a3);
}

- (void)updateTouchProcessingForKeyboardChange
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[UIKeyboardLayout taskQueue](self, "taskQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __58__UIKeyboardLayout_updateTouchProcessingForKeyboardChange__block_invoke;
  v4[3] = &unk_1E16D6A08;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "addTask:", v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (UIKeyboardTaskQueue)taskQueue
{
  UIKeyboardTaskQueue *taskQueue;
  UIKeyboardTaskQueue *v4;
  UIKeyboardTaskQueue *v5;

  taskQueue = self->_taskQueue;
  if (!taskQueue)
  {
    v4 = objc_alloc_init(UIKeyboardTaskQueue);
    v5 = self->_taskQueue;
    self->_taskQueue = v4;

    taskQueue = self->_taskQueue;
  }
  return taskQueue;
}

- (void)setCursorLocation:(unint64_t)a3
{
  self->_cursorLocation = a3;
}

- (UIKeyboardTypingStyleEstimator)typingStyleEstimator
{
  UIKeyboardTypingStyleEstimator *typingStyleEstimator;
  UIKeyboardTypingStyleEstimator *v4;
  UIKeyboardTypingStyleEstimator *v5;

  typingStyleEstimator = self->_typingStyleEstimator;
  if (!typingStyleEstimator)
  {
    v4 = objc_alloc_init(UIKeyboardTypingStyleEstimator);
    v5 = self->_typingStyleEstimator;
    self->_typingStyleEstimator = v4;

    typingStyleEstimator = self->_typingStyleEstimator;
  }
  return typingStyleEstimator;
}

- (void)setTaskQueue:(id)a3
{
  UIKeyboardTaskQueue *v5;
  UIKeyboardTaskQueue *v6;

  v5 = (UIKeyboardTaskQueue *)a3;
  if (self->_taskQueue != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_taskQueue, a3);
    v5 = v6;
  }

}

- (UIKeyboardLayout)initWithFrame:(CGRect)a3
{
  UIKeyboardLayout *v3;
  UIKeyboardLayout *v4;
  NSMutableArray *v5;
  NSMutableArray *uncommittedTouchUUIDs;
  dispatch_queue_t v7;
  OS_dispatch_queue *deferredTouchTaskListsQueue;
  NSMutableDictionary *v9;
  NSMutableDictionary *deferredTouchTaskLists;
  NSMutableSet *v11;
  NSMutableSet *touchIgnoredUUIDSet;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)UIKeyboardLayout;
  v3 = -[UIView initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[UIView setMultipleTouchEnabled:](v3, "setMultipleTouchEnabled:", 1);
    -[UIKeyboardLayout _setRequiresExclusiveTouch:](v4, "_setRequiresExclusiveTouch:", 1);
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    uncommittedTouchUUIDs = v4->_uncommittedTouchUUIDs;
    v4->_uncommittedTouchUUIDs = v5;

    v7 = dispatch_queue_create("com.apple.UIKeyboardLayout.deferredTouchTaskLists", 0);
    deferredTouchTaskListsQueue = v4->_deferredTouchTaskListsQueue;
    v4->_deferredTouchTaskListsQueue = (OS_dispatch_queue *)v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    deferredTouchTaskLists = v4->_deferredTouchTaskLists;
    v4->_deferredTouchTaskLists = v9;

    v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    touchIgnoredUUIDSet = v4->_touchIgnoredUUIDSet;
    v4->_touchIgnoredUUIDSet = v11;

  }
  return v4;
}

- (UIKeyboardLayoutSizeDelegate)sizeDelegate
{
  return (UIKeyboardLayoutSizeDelegate *)objc_loadWeakRetained((id *)&self->_sizeDelegate);
}

- (void)showKeyboardWithInputTraits:(id)a3 screenTraits:(id)a4 splitTraits:(id)a5
{
  UITextInputTraits *v7;
  UIKBScreenTraits *v8;
  UITextInputTraits *inputTraits;
  UIKBScreenTraits *screenTraits;
  UITextInputTraits *v11;

  v7 = (UITextInputTraits *)a3;
  v8 = (UIKBScreenTraits *)a4;
  inputTraits = self->_inputTraits;
  self->_inputTraits = v7;
  v11 = v7;

  screenTraits = self->_screenTraits;
  self->_screenTraits = v8;

}

- (void)setSizeDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_sizeDelegate, a3);
}

- (void)setScreenEdgePanRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_screenEdgePanRecognizer, a3);
}

- (void)reloadKeyboardGestureRecognition
{
  unint64_t v3;
  void *v4;
  void *v5;
  _UIScreenEdgePanRecognizer *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;

  -[UIKeyboardLayout setDeferredTouchDownTask:](self, "setDeferredTouchDownTask:", 0);
  -[UIKeyboardLayout setDeferredTouchMovedTask:](self, "setDeferredTouchMovedTask:", 0);
  v3 = -[UIKeyboardLayout targetEdgesForScreenGestureRecognition](self, "targetEdgesForScreenGestureRecognition");
  -[UIKeyboardLayout screenEdgePanRecognizer](self, "screenEdgePanRecognizer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {

    if (!v5)
    {
      v6 = -[_UIScreenEdgePanRecognizer initWithType:]([_UIScreenEdgePanRecognizer alloc], "initWithType:", 3);
      -[UIKeyboardLayout setScreenEdgePanRecognizer:](self, "setScreenEdgePanRecognizer:", v6);

      -[UIKeyboardLayout screenEdgePanRecognizer](self, "screenEdgePanRecognizer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setDelegate:", self);

      -[UIKeyboardLayout screenEdgePanRecognizer](self, "screenEdgePanRecognizer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView _window](self, "_window");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_sceneReferenceBounds");
      objc_msgSend(v8, "setScreenBounds:");

    }
    -[UIKeyboardLayout screenEdgePanRecognizer](self, "screenEdgePanRecognizer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "reset");

    -[UIKeyboardLayout screenEdgePanRecognizer](self, "screenEdgePanRecognizer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "targetEdges");

    if (v12 != v3)
    {
      -[UIKeyboardLayout screenEdgePanRecognizer](self, "screenEdgePanRecognizer");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setTargetEdges:", v3);

    }
  }
  else
  {
    objc_msgSend(v4, "setDelegate:", 0);

    -[UIKeyboardLayout setScreenEdgePanRecognizer:](self, "setScreenEdgePanRecognizer:", 0);
  }
}

- (void)didMoveToWindow
{
  void *v3;
  void *v4;
  id v5;

  -[UIKeyboardLayout screenEdgePanRecognizer](self, "screenEdgePanRecognizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UIKeyboardLayout screenEdgePanRecognizer](self, "screenEdgePanRecognizer");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[UIView _window](self, "_window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_sceneReferenceBounds");
    objc_msgSend(v5, "setScreenBounds:");

  }
}

- (_UIScreenEdgePanRecognizer)screenEdgePanRecognizer
{
  return self->_screenEdgePanRecognizer;
}

- (void)setDeferredTouchMovedTask:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 536);
}

- (void)setDeferredTouchDownTask:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 528);
}

+ (CGSize)keyboardSizeForInputMode:(id)a3 screenTraits:(id)a4 keyboardType:(int64_t)a5
{
  double v5;
  double v6;
  CGSize result;

  v5 = *MEMORY[0x1E0C9D820];
  v6 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)dealloc
{
  OS_dispatch_queue *deferredTouchTaskListsQueue;
  void *v4;
  void *v5;
  objc_super v6;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  deferredTouchTaskListsQueue = self->_deferredTouchTaskListsQueue;
  self->_deferredTouchTaskListsQueue = 0;

  -[UIKeyboardLayout setActiveTouchUUID:](self, "setActiveTouchUUID:", 0);
  -[UIKeyboardLayout setShiftKeyTouchUUID:](self, "setShiftKeyTouchUUID:", 0);
  -[_UIKBRTRecognizer setDelegate:](self->_handRestRecognizer, "setDelegate:", 0);
  -[_UIScreenEdgePanRecognizer setDelegate:](self->_screenEdgePanRecognizer, "setDelegate:", 0);
  -[UIKeyboardLayout setSizeDelegate:](self, "setSizeDelegate:", 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = CFSTR("UIKeyboardPrivateWillChangeFrameNotification");
  v7[1] = CFSTR("UIKeyboardPrivateDidChangeFrameNotification");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSNotificationCenter _uiRemoveObserver:names:](v4, self, v5);

  v6.receiver = self;
  v6.super_class = (Class)UIKeyboardLayout;
  -[UIView dealloc](&v6, sel_dealloc);
}

- (UIEvent)currentTouchDownEvent
{
  return self->_currentTouchDownEvent;
}

- (unint64_t)textEditingKeyMask
{
  return 0;
}

void __40__UIKeyboardLayout_deactivateActiveKeys__block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 616), "objectForKey:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)usesAutoShift
{
  return 0;
}

- (BOOL)ignoresShiftState
{
  return 0;
}

- (BOOL)isAlphabeticPlane
{
  return 0;
}

- (BOOL)isKanaPlane
{
  return 0;
}

- (BOOL)isDynamicLayout
{
  return 0;
}

- (BOOL)diacriticForwardCompose
{
  return 0;
}

- (BOOL)isShiftKeyBeingHeld
{
  return 0;
}

- (BOOL)isGeometricShiftOrMoreKeyForTouch:(id)a3
{
  return 0;
}

- (BOOL)isShiftKeyPlaneChooser
{
  return 0;
}

- (id)_keyboardLongPressInteractionRegions
{
  return 0;
}

- (BOOL)performReturnAction
{
  return 0;
}

- (BOOL)performSpaceAction
{
  return 0;
}

- (id)candidateList
{
  return 0;
}

- (BOOL)hasCandidateKeys
{
  return 0;
}

- (BOOL)hasAccentKey
{
  return 0;
}

- (BOOL)canMultitap
{
  return 0;
}

- (NSString)layoutTag
{
  return 0;
}

- (id)activationIndicatorView
{
  return 0;
}

- (id)activationIndicatorMask
{
  return 0;
}

- (BOOL)shouldShowIndicator
{
  return 1;
}

- (BOOL)canProduceString:(id)a3
{
  return 0;
}

- (id)touchDownTaskForTouchState:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  UIKeyboardLayout *v13;
  id v14;

  v4 = a3;
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __47__UIKeyboardLayout_touchDownTaskForTouchState___block_invoke;
  v12 = &unk_1E16BB0D8;
  v13 = self;
  v14 = v4;
  v5 = v4;
  v6 = _Block_copy(&v9);
  v7 = (void *)objc_msgSend(v6, "copy", v9, v10, v11, v12, v13);

  return v7;
}

void __47__UIKeyboardLayout_touchDownTaskForTouchState___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  void *v17;
  id v18;

  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 440);
  objc_msgSend(*(id *)(a1 + 40), "touchUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "indexOfObject:", v5);

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v3, "returnExecutionToParent");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "touchUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setActiveTouchUUID:", v7);

    objc_msgSend(*(id *)(a1 + 32), "cadenceMonitor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "timestamp");
    objc_msgSend(v8, "addTypingTouchTime:");

    v10 = *(void **)(a1 + 32);
    v9 = *(void **)(a1 + 40);
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __47__UIKeyboardLayout_touchDownTaskForTouchState___block_invoke_2;
    v16 = &unk_1E16BB0D8;
    v17 = v10;
    v11 = v9;
    v18 = v11;
    objc_msgSend(v3, "childWithContinuation:", &v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "touchDown:executionContext:", v11, v12, v13, v14, v15, v16, v17);

  }
}

void __47__UIKeyboardLayout_touchDownTaskForTouchState___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a2;
  CFAbsoluteTimeGetCurrent();
  v4 = *(void **)(a1 + 40);
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 616);
  objc_msgSend(v4, "touchUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "originalStartTime");
  +[_UIKeyboardUsageTracking keyboardPerformanceFromTouchStart:until:](_UIKeyboardUsageTracking, "keyboardPerformanceFromTouchStart:until:");
  objc_msgSend(v3, "info");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "returnExecutionToParentWithInfo:", v7);

}

- (id)_touchStateForTouch:(id)a3
{
  return +[UIKBTouchState touchStateForTouch:](UIKBTouchState, "touchStateForTouch:", a3);
}

- (void)touchDown:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_signpost_id_t v10;
  os_signpost_id_t v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  _QWORD aBlock[4];
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint8_t buf[16];

  v4 = a3;
  -[UIKeyboardLayout _touchStateForTouch:](self, "_touchStateForTouch:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timestamp");
  v7 = v6;
  v8 = mach_absolute_time();
  kdebug_trace();
  kac_get_log();
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = os_signpost_id_make_with_pointer(v9, v5);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v11 = v10;
    if (os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_185066000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v11, "appTouchDown", " enableTelemetry=YES ", buf, 2u);
    }
  }

  -[UIKeyboardLayout touchDownTaskForTouchState:](self, "touchDownTaskForTouchState:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __30__UIKeyboardLayout_touchDown___block_invoke;
  aBlock[3] = &unk_1E16D6968;
  v20 = v12;
  v13 = v5;
  v19 = v13;
  v21 = v7;
  v22 = 0;
  v23 = v8;
  v14 = v12;
  v15 = _Block_copy(aBlock);
  v16 = -[UIKeyboardLayout _shouldAllowKeyboardHandlingIfNecessaryForTouch:phase:withTouchState:task:](self, "_shouldAllowKeyboardHandlingIfNecessaryForTouch:phase:withTouchState:task:", v4, 0, v13, v15);

  if (v16)
  {
    -[UIKeyboardLayout taskQueue](self, "taskQueue");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addTask:", v15);

  }
}

void __30__UIKeyboardLayout_touchDown___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;
  __int128 v9;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __30__UIKeyboardLayout_touchDown___block_invoke_2;
  v6[3] = &unk_1E16D6940;
  v4 = *(_QWORD *)(a1 + 40);
  v7 = *(id *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 48);
  v9 = *(_OWORD *)(a1 + 56);
  objc_msgSend(a2, "childWithContinuation:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

}

void __30__UIKeyboardLayout_touchDown___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  os_signpost_id_t v6;
  os_signpost_id_t v7;
  void *v8;
  uint8_t v9[16];

  v3 = a2;
  v4 = mach_absolute_time();
  kdebug_trace();
  kac_get_log();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_make_with_pointer(v5, *(const void **)(a1 + 32));
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v7 = v6;
    if (os_signpost_enabled(v5))
    {
      *(_WORD *)v9 = 0;
      _os_signpost_emit_with_name_impl(&dword_185066000, v5, OS_SIGNPOST_INTERVAL_END, v7, "appTouchDown", " enableTelemetry=YES ", v9, 2u);
    }
  }

  +[_UIKeyboardDiagnosticCollection _requestTailspinWithDescription:startMAT:endMAT:ifExceedsThresholdSec:](_UIKeyboardDiagnosticCollection, "_requestTailspinWithDescription:startMAT:endMAT:ifExceedsThresholdSec:", CFSTR("KeyboardTouchToPaddleLatency"), *(_QWORD *)(a1 + 56), v4, 0.5);
  objc_msgSend(v3, "info");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "returnExecutionToParentWithInfo:", v8);

}

- (void)touchDown:(id)a3 executionContext:(id)a4
{
  objc_msgSend(a4, "returnExecutionToParent", a3);
}

- (id)touchDraggedTaskForTouchState:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  UIKeyboardLayout *v13;
  id v14;

  v4 = a3;
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __50__UIKeyboardLayout_touchDraggedTaskForTouchState___block_invoke;
  v12 = &unk_1E16BB0D8;
  v13 = self;
  v14 = v4;
  v5 = v4;
  v6 = _Block_copy(&v9);
  v7 = (void *)objc_msgSend(v6, "copy", v9, v10, v11, v12, v13);

  return v7;
}

void __50__UIKeyboardLayout_touchDraggedTaskForTouchState___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;

  v3 = *(void **)(a1 + 40);
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 440);
  v11 = a2;
  objc_msgSend(v3, "touchUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "indexOfObject:", v5);

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v11, "returnExecutionToParent");
    v7 = v11;
  }
  else
  {
    v9 = *(void **)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v11, "childWithContinuation:", &__block_literal_global_184_0);
    v10 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "touchDragged:executionContext:", v8, v10);
    v7 = (void *)v10;
  }

}

uint64_t __50__UIKeyboardLayout_touchDraggedTaskForTouchState___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "returnExecutionToParent");
}

- (void)touchDragged:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  os_signpost_id_t v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  id v20;
  uint8_t buf[16];

  v4 = a3;
  -[UIKeyboardLayout _touchStateForTouch:](self, "_touchStateForTouch:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  kdebug_trace();
  kac_get_log();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = os_signpost_id_make_with_pointer(v6, v5);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v8 = v7;
    if (os_signpost_enabled(v6))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_185066000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v8, "appTouchDragged", " enableTelemetry=YES ", buf, 2u);
    }
  }

  -[UIKeyboardLayout touchDraggedTaskForTouchState:](self, "touchDraggedTaskForTouchState:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __33__UIKeyboardLayout_touchDragged___block_invoke;
  v18 = &unk_1E16BB6B8;
  v20 = v9;
  v10 = v5;
  v19 = v10;
  v11 = v9;
  v12 = _Block_copy(&v15);
  v13 = -[UIKeyboardLayout _shouldAllowKeyboardHandlingIfNecessaryForTouch:phase:withTouchState:task:](self, "_shouldAllowKeyboardHandlingIfNecessaryForTouch:phase:withTouchState:task:", v4, 1, v10, v12, v15, v16, v17, v18);

  if (v13)
  {
    -[UIKeyboardLayout taskQueue](self, "taskQueue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addTask:", v12);

  }
}

void __33__UIKeyboardLayout_touchDragged___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __33__UIKeyboardLayout_touchDragged___block_invoke_2;
  v5[3] = &unk_1E16BAF98;
  v3 = *(_QWORD *)(a1 + 40);
  v6 = *(id *)(a1 + 32);
  objc_msgSend(a2, "childWithContinuation:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

}

void __33__UIKeyboardLayout_touchDragged___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  os_signpost_id_t v5;
  os_signpost_id_t v6;
  void *v7;
  uint8_t v8[16];

  v3 = a2;
  kdebug_trace();
  kac_get_log();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = os_signpost_id_make_with_pointer(v4, *(const void **)(a1 + 32));
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v6 = v5;
    if (os_signpost_enabled(v4))
    {
      *(_WORD *)v8 = 0;
      _os_signpost_emit_with_name_impl(&dword_185066000, v4, OS_SIGNPOST_INTERVAL_END, v6, "appTouchDragged", " enableTelemetry=YES ", v8, 2u);
    }
  }

  objc_msgSend(v3, "info");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "returnExecutionToParentWithInfo:", v7);

}

- (void)touchDragged:(id)a3 executionContext:(id)a4
{
  objc_msgSend(a4, "returnExecutionToParent", a3);
}

- (void)_touchEndedProcessingForTouches:(id)a3
{
  id v4;
  void *v5;
  NSMutableArray *uncommittedTouchUUIDs;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *, uint64_t);
  void *v18;
  id v19;
  id v20;
  UIKeyboardLayout *v21;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  uncommittedTouchUUIDs = self->_uncommittedTouchUUIDs;
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __52__UIKeyboardLayout__touchEndedProcessingForTouches___block_invoke;
  v18 = &unk_1E16D6990;
  v14 = v4;
  v19 = v14;
  v7 = v5;
  v20 = v7;
  v21 = self;
  -[NSMutableArray enumerateObjectsWithOptions:usingBlock:](uncommittedTouchUUIDs, "enumerateObjectsWithOptions:usingBlock:", 2, &v15);
  if (objc_msgSend(v7, "count"))
  {
    v8 = objc_msgSend(v7, "lastIndex", v14, v15, v16, v17, v18, v19);
    objc_msgSend(v7, "removeIndex:", v8);
    -[NSMutableArray objectAtIndex:](self->_uncommittedTouchUUIDs, "objectAtIndex:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)v9;
      +[UIKBTouchState touchForTouchUUID:](UIKBTouchState, "touchForTouchUUID:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray objectsAtIndexes:](self->_uncommittedTouchUUIDs, "objectsAtIndexes:", v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKeyboardLayout commitTouchUUIDs:](self, "commitTouchUUIDs:", v12);

      -[UIKeyboardLayout touchUp:](self, "touchUp:", v11);
LABEL_7:

      goto LABEL_8;
    }
  }
  if (!-[NSMutableArray count](self->_uncommittedTouchUUIDs, "count", v14))
  {
    -[UIKeyboardLayout screenEdgePanRecognizer](self, "screenEdgePanRecognizer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[UIKeyboardLayout _clearDeferredTouchTasks](self, "_clearDeferredTouchTasks");
      -[UIKeyboardLayout screenEdgePanRecognizer](self, "screenEdgePanRecognizer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "reset");
      goto LABEL_7;
    }
  }
LABEL_8:

}

void __52__UIKeyboardLayout__touchEndedProcessingForTouches___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  char v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  +[UIKBTouchState touchForTouchUUID:](UIKBTouchState, "touchForTouchUUID:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v5);
  v7 = objc_msgSend(*(id *)(a1 + 40), "count");
  if ((v6 & 1) != 0
    || v7
    && (v8 = *(void **)(a1 + 48),
        objc_msgSend(v5, "window"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        LODWORD(v8) = objc_msgSend(v8, "canForceTouchUUIDCommit:inWindow:", v10, v9),
        v9,
        (_DWORD)v8))
  {
    objc_msgSend(*(id *)(a1 + 40), "addIndex:", a3);
  }

}

- (id)touchUpTaskForTouchState:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  UIKeyboardLayout *v13;
  id v14;

  v4 = a3;
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __45__UIKeyboardLayout_touchUpTaskForTouchState___block_invoke;
  v12 = &unk_1E16BB0D8;
  v13 = self;
  v14 = v4;
  v5 = v4;
  v6 = _Block_copy(&v9);
  v7 = (void *)objc_msgSend(v6, "copy", v9, v10, v11, v12, v13);

  return v7;
}

void __45__UIKeyboardLayout_touchUpTaskForTouchState___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  void *v15;
  id v16;

  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 440);
  objc_msgSend(*(id *)(a1 + 40), "touchUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "indexOfObject:", v5);

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v3, "returnExecutionToParent");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "clearShiftIfNecessaryForEndedTouchState:", *(_QWORD *)(a1 + 40));
    v8 = *(void **)(a1 + 32);
    v7 = *(void **)(a1 + 40);
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __45__UIKeyboardLayout_touchUpTaskForTouchState___block_invoke_2;
    v14 = &unk_1E16BB0D8;
    v15 = v8;
    v9 = v7;
    v16 = v9;
    objc_msgSend(v3, "childWithContinuation:", &v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "touchUp:executionContext:", v9, v10, v11, v12, v13, v14, v15);

  }
}

void __45__UIKeyboardLayout_touchUpTaskForTouchState___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  double v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v6 = a2;
  objc_msgSend(v3, "didCommitTouchState:", v4);
  objc_msgSend(*(id *)(a1 + 40), "timestamp");
  +[_UIKeyboardUsageTracking keyboardPerformanceFromTouchRelease:until:](_UIKeyboardUsageTracking, "keyboardPerformanceFromTouchRelease:until:", v5, CFAbsoluteTimeGetCurrent() + *(double *)&sSystemUptimeFromAbsoluteTimeDiff);
  objc_msgSend(v6, "returnExecutionToParent");

}

- (void)touchUp:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_signpost_id_t v9;
  os_signpost_id_t v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *);
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint8_t buf[16];

  v4 = a3;
  -[UIKeyboardLayout _touchStateForTouch:](self, "_touchStateForTouch:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timestamp");
  v7 = v6;
  kdebug_trace();
  kac_get_log();
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_make_with_pointer(v8, v5);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v10 = v9;
    if (os_signpost_enabled(v8))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_185066000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v10, "appTouchUp", " enableTelemetry=YES ", buf, 2u);
    }
  }

  -[UIKeyboardLayout touchUpTaskForTouchState:](self, "touchUpTaskForTouchState:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __28__UIKeyboardLayout_touchUp___block_invoke;
  v20 = &unk_1E16D69B8;
  v22 = v11;
  v12 = v5;
  v21 = v12;
  v23 = v7;
  v24 = 0;
  v13 = v11;
  v14 = _Block_copy(&v17);
  v15 = -[UIKeyboardLayout _shouldAllowKeyboardHandlingIfNecessaryForTouch:phase:withTouchState:task:](self, "_shouldAllowKeyboardHandlingIfNecessaryForTouch:phase:withTouchState:task:", v4, 3, v12, v14, v17, v18, v19, v20);

  if (v15)
  {
    -[UIKeyboardLayout taskQueue](self, "taskQueue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addTask:", v14);

  }
}

void __28__UIKeyboardLayout_touchUp___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;
  uint64_t v9;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __28__UIKeyboardLayout_touchUp___block_invoke_2;
  v6[3] = &unk_1E16BBA40;
  v4 = *(_QWORD *)(a1 + 40);
  v7 = *(id *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 48);
  v9 = *(_QWORD *)(a1 + 56);
  objc_msgSend(a2, "childWithContinuation:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

}

void __28__UIKeyboardLayout_touchUp___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  os_signpost_id_t v5;
  os_signpost_id_t v6;
  void *v7;
  uint8_t v8[16];

  v3 = a2;
  kdebug_trace();
  kac_get_log();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = os_signpost_id_make_with_pointer(v4, *(const void **)(a1 + 32));
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v6 = v5;
    if (os_signpost_enabled(v4))
    {
      *(_WORD *)v8 = 0;
      _os_signpost_emit_with_name_impl(&dword_185066000, v4, OS_SIGNPOST_INTERVAL_END, v6, "appTouchUp", " enableTelemetry=YES ", v8, 2u);
    }
  }

  objc_msgSend(v3, "info");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "returnExecutionToParentWithInfo:", v7);

}

- (void)didCommitTouchState:(id)a3
{
  NSMutableArray *uncommittedTouchUUIDs;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void (**v13)(void);

  uncommittedTouchUUIDs = self->_uncommittedTouchUUIDs;
  v5 = a3;
  objc_msgSend(v5, "touchUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray removeObject:](uncommittedTouchUUIDs, "removeObject:", v6);

  if (!-[NSMutableArray count](self->_uncommittedTouchUUIDs, "count"))
  {
    -[UIKeyboardLayout screenEdgePanRecognizer](self, "screenEdgePanRecognizer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[UIKeyboardLayout _clearDeferredTouchTasks](self, "_clearDeferredTouchTasks");
      -[UIKeyboardLayout screenEdgePanRecognizer](self, "screenEdgePanRecognizer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "reset");

    }
  }
  objc_msgSend(v5, "timestamp");
  -[UIKeyboardLayout setLastTouchUpTime:](self, "setLastTouchUpTime:");
  objc_msgSend(v5, "touchUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIKeyboardLayout activeTouchUUID](self, "activeTouchUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqual:", v10);

  if (v11)
  {
    -[UIKeyboardLayout setActiveTouchUUID:](self, "setActiveTouchUUID:", 0);
    -[UIKeyboardLayout deferredTaskForActiveTouch](self, "deferredTaskForActiveTouch");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[UIKeyboardLayout deferredTaskForActiveTouch](self, "deferredTaskForActiveTouch");
      v13 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v13[2]();

      -[UIKeyboardLayout setDeferredTaskForActiveTouch:](self, "setDeferredTaskForActiveTouch:", 0);
    }
  }
}

- (void)touchUp:(id)a3 executionContext:(id)a4
{
  objc_msgSend(a4, "returnExecutionToParent", a3);
}

- (id)touchCancelledTaskForTouchState:(id)a3 forResting:(BOOL)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD aBlock[5];
  id v12;
  BOOL v13;

  v6 = a3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __63__UIKeyboardLayout_touchCancelledTaskForTouchState_forResting___block_invoke;
  aBlock[3] = &unk_1E16BB010;
  aBlock[4] = self;
  v12 = v6;
  v13 = a4;
  v7 = v6;
  v8 = _Block_copy(aBlock);
  v9 = (void *)objc_msgSend(v8, "copy");

  return v9;
}

void __63__UIKeyboardLayout_touchCancelledTaskForTouchState_forResting___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  void *v16;
  id v17;

  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 440);
  objc_msgSend(*(id *)(a1 + 40), "touchUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "indexOfObject:", v5);

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v3, "returnExecutionToParent");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "clearShiftIfNecessaryForEndedTouchState:", *(_QWORD *)(a1 + 40));
    v8 = *(void **)(a1 + 32);
    v7 = *(void **)(a1 + 40);
    v9 = *(unsigned __int8 *)(a1 + 48);
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __63__UIKeyboardLayout_touchCancelledTaskForTouchState_forResting___block_invoke_2;
    v15 = &unk_1E16BB0D8;
    v16 = v8;
    v10 = v7;
    v17 = v10;
    objc_msgSend(v3, "childWithContinuation:", &v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "touchCancelled:forResting:executionContext:", v10, v9, v11, v12, v13, v14, v15, v16);

  }
}

void __63__UIKeyboardLayout_touchCancelledTaskForTouchState_forResting___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v2, "didCommitTouchState:", v3);
  objc_msgSend(v4, "returnExecutionToParent");

}

- (void)touchCancelled:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  id v8;

  v4 = a3;
  -[UIKeyboardLayout _touchStateForTouch:](self, "_touchStateForTouch:", v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardLayout touchCancelledTaskForTouchState:forResting:](self, "touchCancelledTaskForTouchState:forResting:", v8, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[UIKeyboardLayout _shouldAllowKeyboardHandlingIfNecessaryForTouch:phase:withTouchState:task:](self, "_shouldAllowKeyboardHandlingIfNecessaryForTouch:phase:withTouchState:task:", v4, 4, v8, v5);

  if (v6)
  {
    -[UIKeyboardLayout taskQueue](self, "taskQueue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addTask:", v5);

  }
}

- (void)touchCancelled:(id)a3 executionContext:(id)a4
{
  -[UIKeyboardLayout touchCancelled:forResting:executionContext:](self, "touchCancelled:forResting:executionContext:", a3, 0, a4);
}

- (void)touchCancelled:(id)a3 forResting:(BOOL)a4 executionContext:(id)a5
{
  objc_msgSend(a5, "returnExecutionToParent", a3, a4);
}

- (void)touchChanged:(id)a3 executionContext:(id)a4
{
  objc_msgSend(a4, "returnExecutionToParent", a3);
}

- (id)touchChangedTaskForTouchState:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  UIKeyboardLayout *v13;
  id v14;

  v4 = a3;
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __50__UIKeyboardLayout_touchChangedTaskForTouchState___block_invoke;
  v12 = &unk_1E16BB0D8;
  v13 = self;
  v14 = v4;
  v5 = v4;
  v6 = _Block_copy(&v9);
  v7 = (void *)objc_msgSend(v6, "copy", v9, v10, v11, v12, v13);

  return v7;
}

void __50__UIKeyboardLayout_touchChangedTaskForTouchState___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  v3 = *(void **)(a1 + 40);
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 440);
  v7 = a2;
  objc_msgSend(v3, "touchUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "indexOfObject:", v5);

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v7, "returnExecutionToParent");
  else
    objc_msgSend(*(id *)(a1 + 32), "touchChanged:executionContext:", *(_QWORD *)(a1 + 40), v7);

}

- (void)touchChanged:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[UIKeyboardLayout _touchStateForTouch:](self, "_touchStateForTouch:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardLayout touchChangedTaskForTouchState:](self, "touchChangedTaskForTouchState:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardLayout taskQueue](self, "taskQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addTask:", v4);

}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  UIKeyboardLayout *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  unint64_t v15;
  _BOOL4 v16;
  void *v17;
  UIKeyboardLayout *v18;
  void *v19;
  uint64_t v20;
  int v21;
  void *v22;
  void *v23;
  void **p_currentTouchDownEvent;
  id v25;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = self;
  if (-[UIKeyboardLayout _shouldAllowKeyboardHandlingForTouchesBegan:withEvent:](v8, "_shouldAllowKeyboardHandlingForTouchesBegan:withEvent:", v6, v7))
  {
    p_currentTouchDownEvent = (void **)&v8->_currentTouchDownEvent;
    v25 = v7;
    objc_storeStrong((id *)&v8->_currentTouchDownEvent, a4);
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    obj = v6;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (!v9)
      goto LABEL_19;
    v10 = v9;
    v11 = *(_QWORD *)v28;
    while (1)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v28 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        +[UIKBTouchState touchUUIDForTouch:](UIKBTouchState, "touchUUIDForTouch:", v13, p_currentTouchDownEvent);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObject:](v8->_uncommittedTouchUUIDs, "addObject:", v14);
        v15 = UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL;
        v16 = +[UIKeyboardImpl isFloating](UIKeyboardImpl, "isFloating");
        if (v15 == 1)
        {
          -[UIKeyboardLayout hasActiveContinuousPathInput](v8, "hasActiveContinuousPathInput");
        }
        else
        {
          v21 = _AXSZoomTouchEnabled();
          if (!-[UIKeyboardLayout hasActiveContinuousPathInput](v8, "hasActiveContinuousPathInput") && !v21)
          {
            -[UIKeyboardLayout touchUUIDsToCommitBeforeTouchUUID:](v8, "touchUUIDsToCommitBeforeTouchUUID:", v14);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = v8;
            v19 = v17;
            v20 = 0;
            goto LABEL_14;
          }
        }
        if (!v16)
          goto LABEL_15;
        -[UIKeyboardLayout touchUUIDsToCommitBeforeTouchUUID:](v8, "touchUUIDsToCommitBeforeTouchUUID:", v14);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v8;
        v19 = v17;
        v20 = 1;
LABEL_14:
        -[UIKeyboardLayout commitTouchUUIDs:cancelInsteadOfUp:](v18, "commitTouchUUIDs:cancelInsteadOfUp:", v19, v20);

LABEL_15:
        objc_msgSend(v13, "window");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (v22)
          -[UIKeyboardLayout touchDown:](v8, "touchDown:", v13);

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      if (!v10)
      {
LABEL_19:

        v23 = *p_currentTouchDownEvent;
        *p_currentTouchDownEvent = 0;

        v7 = v25;
        break;
      }
    }
  }

}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6;
  UIKeyboardLayout *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = self;
  if (-[UIKeyboardLayout _shouldAllowKeyboardHandlingForTouchesMoved:withEvent:](v7, "_shouldAllowKeyboardHandlingForTouchesMoved:withEvent:", v6, a4))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v14;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v14 != v11)
            objc_enumerationMutation(v8);
          -[UIKeyboardLayout touchDragged:](v7, "touchDragged:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12++), (_QWORD)v13);
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v10);
    }

  }
}

- (void)clearShiftIfNecessaryForEndedTouchState:(id)a3
{
  void *v4;
  int v5;
  id v6;

  objc_msgSend(a3, "touchUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", self->_shiftKeyTouchUUID);

  if (v5)
  {
    +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (self->_shiftKeyTouchUUID != self->_activeTouchUUID)
      objc_msgSend(v6, "setShift:", 0);
    -[UIKeyboardLayout setShiftKeyTouchUUID:](self, "setShiftKeyTouchUUID:", 0);

  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  double v8;
  UIKeyboardLayout *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "timestamp");
  self->_timestampOfLastTouchesEnded = v8;
  v9 = self;
  if (-[UIKeyboardLayout _shouldAllowKeyboardHandlingForTouchesEndedOrCancelled:withEvent:](v9, "_shouldAllowKeyboardHandlingForTouchesEndedOrCancelled:withEvent:", v6, v7))
  {
    -[UIKeyboardLayout handRestRecognizer](v9, "handRestRecognizer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      v11 = v6;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v17;
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v17 != v14)
              objc_enumerationMutation(v11);
            -[UIKeyboardLayout touchUp:](v9, "touchUp:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v15++), (_QWORD)v16);
          }
          while (v13 != v15);
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        }
        while (v13);
      }

    }
    else
    {
      -[UIKeyboardLayout _touchEndedProcessingForTouches:](v9, "_touchEndedProcessingForTouches:", v6);
    }
  }
  else
  {
    -[UIKeyboardLayout _removeTouchesFromProcessing:](v9, "_removeTouchesFromProcessing:", v6);
  }

}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v6;
  UIKeyboardLayout *v7;
  id v8;
  uint64_t v9;
  int *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSMutableSet *touchIgnoredUUIDSet;
  int *v19;
  void *v20;
  void *v21;
  NSObject *deferredTouchTaskListsQueue;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD block[5];
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = self;
  if (!-[UIKeyboardLayout _shouldAllowKeyboardHandlingForTouchesEndedOrCancelled:withEvent:](v7, "_shouldAllowKeyboardHandlingForTouchesEndedOrCancelled:withEvent:", v6, a4))
  {
    -[UIKeyboardLayout _removeTouchesFromProcessing:](v7, "_removeTouchesFromProcessing:", v6);
    goto LABEL_27;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v31 = v6;
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  v10 = &OBJC_IVAR___UIKeyboardEmojiCollectionInputView__isSearching;
  if (!v9)
    goto LABEL_15;
  v11 = v9;
  v12 = *(_QWORD *)v40;
  do
  {
    v13 = 0;
    do
    {
      if (*(_QWORD *)v40 != v12)
        objc_enumerationMutation(v8);
      -[UIKeyboardLayout _touchStateForTouch:](v7, "_touchStateForTouch:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * v13), v31);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v14)
      {
        v16 = *(Class *)((char *)&v7->super.super.super.isa + v10[313]);
        objc_msgSend(v14, "touchUUID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v16, "containsObject:", v17))
        {

LABEL_11:
          objc_msgSend(v15, "touchUUID");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "addObject:", v21);

          goto LABEL_13;
        }
        touchIgnoredUUIDSet = v7->_touchIgnoredUUIDSet;
        objc_msgSend(v15, "touchUUID");
        v19 = v10;
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(touchIgnoredUUIDSet) = -[NSMutableSet containsObject:](touchIgnoredUUIDSet, "containsObject:", v20);

        v10 = v19;
        if ((_DWORD)touchIgnoredUUIDSet)
          goto LABEL_11;
        deferredTouchTaskListsQueue = v7->_deferredTouchTaskListsQueue;
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __47__UIKeyboardLayout_touchesCancelled_withEvent___block_invoke;
        block[3] = &unk_1E16B1B50;
        block[4] = v7;
        v38 = v15;
        dispatch_sync(deferredTouchTaskListsQueue, block);

      }
LABEL_13:

      ++v13;
    }
    while (v11 != v13);
    v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  }
  while (v11);
LABEL_15:

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v23 = v32;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v34;
    do
    {
      v27 = 0;
      do
      {
        if (*(_QWORD *)v34 != v26)
          objc_enumerationMutation(v23);
        +[UIKBTouchState touchForTouchUUID:](UIKBTouchState, "touchForTouchUUID:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v27), v31);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIKeyboardLayout touchCancelled:](v7, "touchCancelled:", v28);

        ++v27;
      }
      while (v25 != v27);
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
    }
    while (v25);
  }

  if (!objc_msgSend(*(id *)((char *)&v7->super.super.super.isa + v10[313]), "count"))
  {
    -[UIKeyboardLayout screenEdgePanRecognizer](v7, "screenEdgePanRecognizer");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      -[UIKeyboardLayout _clearDeferredTouchTasks](v7, "_clearDeferredTouchTasks");
      -[UIKeyboardLayout screenEdgePanRecognizer](v7, "screenEdgePanRecognizer");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "reset");

    }
  }

  v6 = v31;
LABEL_27:

}

void __47__UIKeyboardLayout_touchesCancelled_withEvent___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 616);
  objc_msgSend(*(id *)(a1 + 40), "touchUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v4 = *(void **)(a1 + 40);
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 616);
    objc_msgSend(v4, "touchUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObjectForKey:", v6);

  }
}

- (void)touchesEstimatedPropertiesUpdated:(id)a3
{
  id v4;
  UIKeyboardLayout *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v4);
        -[UIKeyboardLayout touchChanged:](v5, "touchChanged:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)_removeTouchesFromProcessing:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  _UIKBRTRecognizer *handRestRecognizer;
  void *v12;
  _UIKBRTFingerDetection *fingerDetection;
  void *v14;
  _UIKBRTTouchDrifting *touchDrifting;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  void *v24;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  obj = a3;
  if (*(_OWORD *)&self->_handRestRecognizer != 0 || self->_touchDrifting)
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v27 != v6)
            objc_enumerationMutation(obj);
          v8 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
          -[UIKeyboardLayout _touchStateForTouch:](self, "_touchStateForTouch:", v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = v9;
          if (v9)
          {
            handRestRecognizer = self->_handRestRecognizer;
            objc_msgSend(v9, "touchUUID");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            -[_UIKBRTRecognizer markTouchProcessed:withIdentifier:](handRestRecognizer, "markTouchProcessed:withIdentifier:", v8, v12);

            fingerDetection = self->_fingerDetection;
            objc_msgSend(v10, "touchUUID");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            -[_UIKBRTFingerDetection removeTouchWithIdentifier:touchCancelled:](fingerDetection, "removeTouchWithIdentifier:touchCancelled:", v14, 1);

            touchDrifting = self->_touchDrifting;
            objc_msgSend(v10, "touchUUID");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            -[_UIKBRTTouchDrifting removeTouchWithIdentifier:touchCancelled:](touchDrifting, "removeTouchWithIdentifier:touchCancelled:", v16, 1);

            objc_msgSend(v10, "locationInWindow");
            -[UIView convertPoint:fromView:](self, "convertPoint:fromView:", 0);
            v18 = v17;
            v20 = v19;
            objc_msgSend(v10, "timestamp");
            v22 = v21;
            v23 = objc_msgSend(v10, "pathIndex");
            objc_msgSend(v10, "touchUUID");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            -[UIKeyboardLayout handRestRecognizerNotifyRestForBegin:location:timestamp:pathIndex:touchUUID:context:](self, "handRestRecognizerNotifyRestForBegin:location:timestamp:pathIndex:touchUUID:context:", 0, v23, v24, 0, v18, v20, v22);

          }
        }
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v5);
    }
  }

}

- (id)touchUUIDsToCommitBeforeTouchUUID:(id)a3
{
  id v4;
  void *v5;
  NSMutableArray *uncommittedTouchUUIDs;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, void *, uint64_t, _BYTE *);
  void *v12;
  id v13;
  UIKeyboardLayout *v14;

  v4 = a3;
  if (-[NSMutableArray indexOfObject:](self->_uncommittedTouchUUIDs, "indexOfObject:", v4) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = 0;
  }
  else
  {
    uncommittedTouchUUIDs = self->_uncommittedTouchUUIDs;
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __54__UIKeyboardLayout_touchUUIDsToCommitBeforeTouchUUID___block_invoke;
    v12 = &unk_1E16D69E0;
    v13 = v4;
    v14 = self;
    -[NSMutableArray indexesOfObjectsPassingTest:](uncommittedTouchUUIDs, "indexesOfObjectsPassingTest:", &v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray objectsAtIndexes:](self->_uncommittedTouchUUIDs, "objectsAtIndexes:", v7, v9, v10, v11, v12);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

uint64_t __54__UIKeyboardLayout_touchUUIDsToCommitBeforeTouchUUID___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a2;
  if (objc_msgSend(v6, "isEqual:", *(_QWORD *)(a1 + 32)))
  {
    v7 = 0;
    *a4 = 1;
  }
  else
  {
    +[UIKBTouchState touchForTouchUUID:](UIKBTouchState, "touchForTouchUUID:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(void **)(a1 + 40);
    objc_msgSend(v8, "window");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v9, "canForceTouchUUIDCommit:inWindow:", v6, v10);

  }
  return v7;
}

- (void)commitTouchUUIDs:(id)a3 cancelInsteadOfUp:(BOOL)a4
{
  _QWORD v4[5];
  BOOL v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __55__UIKeyboardLayout_commitTouchUUIDs_cancelInsteadOfUp___block_invoke;
  v4[3] = &unk_1E16D6A30;
  v4[4] = self;
  v5 = a4;
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", v4);
}

void __55__UIKeyboardLayout_commitTouchUUIDs_cancelInsteadOfUp___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id location;

  v3 = a2;
  +[UIKBTouchState touchForTouchUUID:](UIKBTouchState, "touchForTouchUUID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setWindow:", v6);

  }
  v7 = *(void **)(a1 + 32);
  if (*(_BYTE *)(a1 + 40))
    objc_msgSend(v7, "touchCancelled:", v4);
  else
    objc_msgSend(v7, "touchUp:", v4);
  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "taskQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __55__UIKeyboardLayout_commitTouchUUIDs_cancelInsteadOfUp___block_invoke_2;
  v9[3] = &unk_1E16D6A08;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v8, "addTask:", v9);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __55__UIKeyboardLayout_commitTouchUUIDs_cancelInsteadOfUp___block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "forceUpdatesForCommittedTouch");
  objc_msgSend(v3, "returnExecutionToParent");

}

- (void)commitTouchUUIDs:(id)a3
{
  -[UIKeyboardLayout commitTouchUUIDs:cancelInsteadOfUp:](self, "commitTouchUUIDs:cancelInsteadOfUp:", a3, 0);
}

- (void)forceUpdatesForCommittedTouch
{
  id v2;

  +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "forceShiftUpdateIfKeyboardStateChanged");

}

- (void)commitTouches:(id)a3 executionContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSMutableArray *uncommittedTouchUUIDs;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  id v20;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "objectAtIndex:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "subarrayWithRange:", 1, objc_msgSend(v6, "count") - 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "window");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      -[UIView window](self, "window");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setWindow:", v11);

    }
    -[UIKeyboardLayout _touchStateForTouch:](self, "_touchStateForTouch:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    uncommittedTouchUUIDs = self->_uncommittedTouchUUIDs;
    objc_msgSend(v12, "touchUUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[NSMutableArray indexOfObject:](uncommittedTouchUUIDs, "indexOfObject:", v14);

    if (v15 == 0x7FFFFFFFFFFFFFFFLL)
    {
      -[UIKeyboardLayout commitTouches:executionContext:](self, "commitTouches:executionContext:", v9, v7);
    }
    else
    {
      -[UIKeyboardLayout clearShiftIfNecessaryForEndedTouchState:](self, "clearShiftIfNecessaryForEndedTouchState:", v12);
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __51__UIKeyboardLayout_commitTouches_executionContext___block_invoke;
      v18[3] = &unk_1E16BB128;
      v18[4] = self;
      v16 = v12;
      v19 = v16;
      v20 = v9;
      objc_msgSend(v7, "childWithContinuation:", v18);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKeyboardLayout touchUp:executionContext:](self, "touchUp:executionContext:", v16, v17);

    }
  }
  else
  {
    objc_msgSend(v7, "returnExecutionToParent");
  }

}

void __51__UIKeyboardLayout_commitTouches_executionContext___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = a2;
  objc_msgSend(v3, "didCommitTouchState:", v4);
  objc_msgSend(*(id *)(a1 + 32), "forceUpdatesForCommittedTouch");
  objc_msgSend(*(id *)(a1 + 32), "commitTouches:executionContext:", *(_QWORD *)(a1 + 48), v5);

}

- (BOOL)canForceTouchUUIDCommit:(id)a3 inWindow:(id)a4
{
  return 1;
}

- (void)_enumerateDeferredTouchUUIDs:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *deferredTouchTaskListsQueue;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  BOOL v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD block[5];
  id v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[UIKeyboardLayout setIsExecutingDeferredTouchTasks:](self, "setIsExecutingDeferredTouchTasks:", 1);
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__132;
  v28 = __Block_byref_object_dispose__132;
  v29 = 0;
  deferredTouchTaskListsQueue = self->_deferredTouchTaskListsQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__UIKeyboardLayout__enumerateDeferredTouchUUIDs_withBlock___block_invoke;
  block[3] = &unk_1E16B9698;
  v23 = &v24;
  block[4] = self;
  v9 = v6;
  v22 = v9;
  dispatch_sync(deferredTouchTaskListsQueue, block);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = (id)v25[5];
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v30, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v18;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v13);
        objc_msgSend(MEMORY[0x1E0C99E38], "null", (_QWORD)v17);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v14 == v15;

        if (!v16)
        {
          while (objc_msgSend(v14, "hasTasks")
               && (objc_msgSend(v14, "executeTasksInView:withBlock:", self, v7) & 1) == 0)
            ;
        }
        ++v13;
      }
      while (v13 != v11);
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v30, 16);
    }
    while (v11);
  }

  -[UIKeyboardLayout setIsExecutingDeferredTouchTasks:](self, "setIsExecutingDeferredTouchTasks:", 0);
  _Block_object_dispose(&v24, 8);

}

void __59__UIKeyboardLayout__enumerateDeferredTouchUUIDs_withBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 616);
  objc_msgSend(*(id *)(a1 + 40), "allObjects");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectsForKeys:notFoundMarker:", v7, v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (void)recognizerBlockUntilTaskQueueReadyForceUsingDeferredTask:(BOOL)a3
{
  void *v6;
  int v7;
  dispatch_semaphore_t v8;
  void *v9;
  NSObject *v10;
  dispatch_time_t v11;
  void *v12;
  _QWORD v13[4];
  dispatch_semaphore_t v14;

  if (pthread_main_np() == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIKeyboardLayout.m"), 1514, CFSTR("Must be called off the main thread"));

    if (!a3)
    {
LABEL_3:
      -[UIKeyboardLayout taskQueue](self, "taskQueue");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isMainThreadExecutingTask");

      if (!v7)
        return;
    }
  }
  else if (!a3)
  {
    goto LABEL_3;
  }
  v8 = dispatch_semaphore_create(0);
  -[UIKeyboardLayout taskQueue](self, "taskQueue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __77__UIKeyboardLayout_recognizerBlockUntilTaskQueueReadyForceUsingDeferredTask___block_invoke;
  v13[3] = &unk_1E16BAF98;
  v14 = v8;
  v10 = v8;
  objc_msgSend(v9, "addDeferredTask:", v13);

  v11 = dispatch_time(0, 10000000000);
  dispatch_semaphore_wait(v10, v11);

}

void __77__UIKeyboardLayout_recognizerBlockUntilTaskQueueReadyForceUsingDeferredTask___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v2;
  id v3;

  v2 = *(NSObject **)(a1 + 32);
  v3 = a2;
  dispatch_semaphore_signal(v2);
  objc_msgSend(v3, "returnExecutionToParent");

}

- (void)recognizer:(id)a3 beginTouchDownForTouchWithId:(id)a4 atPoint:(CGPoint)a5 forBeginState:(unint64_t)a6 whenStateReady:(id)a7
{
  CGFloat y;
  CGFloat x;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  void *v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  _QWORD *v27;
  unint64_t v28;
  CGFloat v29;
  CGFloat v30;
  _QWORD block[5];
  id v32;
  _QWORD *v33;
  unint64_t v34;
  CGFloat v35;
  CGFloat v36;
  _QWORD v37[3];
  char v38;

  y = a5.y;
  x = a5.x;
  v13 = a3;
  v14 = a4;
  v15 = a7;
  -[UIKeyboardLayout handRestRecognizer](self, "handRestRecognizer");
  v16 = (id)objc_claimAutoreleasedReturnValue();

  if (v16 == v13)
  {
    v37[0] = 0;
    v37[1] = v37;
    v37[2] = 0x2020000000;
    v38 = 1;
    v17 = (void *)objc_msgSend(v15, "copy");
    v18 = v14;
    v19 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __97__UIKeyboardLayout_recognizer_beginTouchDownForTouchWithId_atPoint_forBeginState_whenStateReady___block_invoke;
    block[3] = &unk_1E16D6A80;
    block[4] = self;
    v20 = v18;
    v33 = v37;
    v34 = a6;
    v32 = v20;
    v35 = x;
    v36 = y;
    dispatch_sync(MEMORY[0x1E0C80D38], block);
    -[UIKeyboardLayout recognizerBlockUntilTaskQueueReadyForceUsingDeferredTask:](self, "recognizerBlockUntilTaskQueueReadyForceUsingDeferredTask:", 1);
    v23[0] = v19;
    v23[1] = 3221225472;
    v23[2] = __97__UIKeyboardLayout_recognizer_beginTouchDownForTouchWithId_atPoint_forBeginState_whenStateReady___block_invoke_3;
    v23[3] = &unk_1E16D6AF8;
    v27 = v37;
    v28 = a6;
    v23[4] = self;
    v29 = x;
    v30 = y;
    v25 = v20;
    v26 = v17;
    v24 = v25;
    v21 = v17;
    v22 = (void *)MEMORY[0x1E0C80D38];
    dispatch_sync(MEMORY[0x1E0C80D38], v23);

    _Block_object_dispose(v37, 8);
  }
  else
  {
    (*((void (**)(id, id, _QWORD))v15 + 2))(v15, v14, 0);
  }

}

void __97__UIKeyboardLayout_recognizer_beginTouchDownForTouchWithId_atPoint_forBeginState_whenStateReady___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  __int128 v6;
  _QWORD v7[5];
  __int128 v8;
  uint64_t v9;
  __int128 v10;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __97__UIKeyboardLayout_recognizer_beginTouchDownForTouchWithId_atPoint_forBeginState_whenStateReady___block_invoke_2;
  v7[3] = &unk_1E16D6A58;
  v4 = *(_QWORD *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 56);
  v7[4] = v4;
  v6 = *(_OWORD *)(a1 + 40);
  v5 = (id)v6;
  v8 = v6;
  v10 = *(_OWORD *)(a1 + 64);
  objc_msgSend(v2, "_enumerateDeferredTouchUUIDs:withBlock:", v3, v7);

}

void __97__UIKeyboardLayout_recognizer_beginTouchDownForTouchWithId_atPoint_forBeginState_whenStateReady___block_invoke_2(uint64_t a1, void *a2, void *a3, BOOL *a4)
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  v7 = a3;
  v8 = objc_msgSend(v11, "phase");
  *a4 = v8 != 0;
  if (!v8)
  {
    if (*(_QWORD *)(a1 + 56))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "queryShouldNeverIgnoreTouchStateWithIdentifier:touchState:startPoint:forRestingState:", *(_QWORD *)(a1 + 40), v11, 2, *(double *)(a1 + 64), *(double *)(a1 + 72));
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      if (*(_BYTE *)(v9 + 24) || *(_QWORD *)(a1 + 56) == 2)
      {
        *(_BYTE *)(v9 + 24) = 1;
        objc_msgSend(*(id *)(a1 + 32), "taskQueue");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addTask:", v7);

      }
    }
  }

}

void __97__UIKeyboardLayout_recognizer_beginTouchDownForTouchWithId_atPoint_forBeginState_whenStateReady___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  double Current;
  double v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  id v22;
  uint64_t v23;
  _QWORD v24[4];
  id v25;
  id v26;
  __int128 v27;
  double v28;
  uint64_t v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  id location;
  _QWORD block[5];
  id v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;

  v2 = MEMORY[0x1E0C809B0];
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) || !*(_QWORD *)(a1 + 72))
  {
    v38 = 0;
    v39 = &v38;
    v40 = 0x3032000000;
    v41 = __Block_byref_object_copy__132;
    v42 = __Block_byref_object_dispose__132;
    v43 = 0;
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(a1 + 40);
    v5 = *(NSObject **)(v3 + 624);
    block[2] = __97__UIKeyboardLayout_recognizer_beginTouchDownForTouchWithId_atPoint_forBeginState_whenStateReady___block_invoke_4;
    block[3] = &unk_1E16B9698;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    v37 = &v38;
    block[4] = v3;
    v36 = v4;
    dispatch_sync(v5, block);
    objc_msgSend((id)v39[5], "setIgnoredOnBegin:", 1);
    objc_initWeak(&location, *(id *)(a1 + 32));
    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 632), "containsObject:", *(_QWORD *)(a1 + 40))
      || objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "containsObject:", *(_QWORD *)(a1 + 40)))
    {
      +[UIKBTouchState touchForTouchUUID:](UIKBTouchState, "touchForTouchUUID:", *(_QWORD *)(a1 + 40));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "taskQueue");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = v2;
      v30[1] = 3221225472;
      v30[2] = __97__UIKeyboardLayout_recognizer_beginTouchDownForTouchWithId_atPoint_forBeginState_whenStateReady___block_invoke_5;
      v30[3] = &unk_1E16BB640;
      objc_copyWeak(&v33, &location);
      v31 = *(id *)(a1 + 40);
      v8 = v6;
      v32 = v8;
      objc_msgSend(v7, "addTask:", v30);

      objc_destroyWeak(&v33);
    }
    v9 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *(_QWORD *)(a1 + 40));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_enumerateDeferredTouchUUIDs:withBlock:", v10, 0);

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
    Current = CFAbsoluteTimeGetCurrent();
    v12 = *(double *)&sSystemUptimeFromAbsoluteTimeDiff;
    v13 = objc_msgSend((id)v39[5], "pathIndex");
    objc_msgSend((id)v39[5], "touchUUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "taskQueue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v2;
    v24[1] = 3221225472;
    v24[2] = __97__UIKeyboardLayout_recognizer_beginTouchDownForTouchWithId_atPoint_forBeginState_whenStateReady___block_invoke_6;
    v24[3] = &unk_1E16D6AA8;
    objc_copyWeak(&v26, &location);
    v27 = *(_OWORD *)(a1 + 80);
    v28 = Current + v12;
    v29 = v13;
    v16 = v14;
    v25 = v16;
    objc_msgSend(v15, "addTask:", v24);

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);

    _Block_object_dispose(&v38, 8);
  }
  objc_msgSend(*(id *)(a1 + 32), "taskQueue");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v2;
  v20[1] = 3221225472;
  v20[2] = __97__UIKeyboardLayout_recognizer_beginTouchDownForTouchWithId_atPoint_forBeginState_whenStateReady___block_invoke_8;
  v20[3] = &unk_1E16D6AD0;
  v22 = *(id *)(a1 + 56);
  v18 = *(id *)(a1 + 48);
  v19 = *(_QWORD *)(a1 + 64);
  v21 = v18;
  v23 = v19;
  objc_msgSend(v17, "addTask:", v20);

}

void __97__UIKeyboardLayout_recognizer_beginTouchDownForTouchWithId_atPoint_forBeginState_whenStateReady___block_invoke_4(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 616), "objectForKey:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __97__UIKeyboardLayout_recognizer_beginTouchDownForTouchWithId_atPoint_forBeginState_whenStateReady___block_invoke_5(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id *WeakRetained;

  v3 = (id *)(a1 + 48);
  v4 = a2;
  WeakRetained = (id *)objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained[55], "removeObject:", *(_QWORD *)(a1 + 32));
  objc_msgSend(WeakRetained[79], "addObject:", *(_QWORD *)(a1 + 32));
  objc_msgSend(WeakRetained[68], "explicitlyIgnoreTouch:withIdentifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  objc_msgSend(v4, "returnExecutionToParent");

}

void __97__UIKeyboardLayout_recognizer_beginTouchDownForTouchWithId_atPoint_forBeginState_whenStateReady___block_invoke_6(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  v5 = *(double *)(a1 + 64);
  v6 = *(unsigned int *)(a1 + 72);
  v7 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "childWithContinuation:", &__block_literal_global_197_0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "handRestRecognizerNotifyRestForBegin:location:timestamp:pathIndex:touchUUID:context:", 1, v6, v7, v8, *(double *)(a1 + 48), *(double *)(a1 + 56), v5);
}

uint64_t __97__UIKeyboardLayout_recognizer_beginTouchDownForTouchWithId_atPoint_forBeginState_whenStateReady___block_invoke_7(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "returnExecutionToParent");
}

void __97__UIKeyboardLayout_recognizer_beginTouchDownForTouchWithId_atPoint_forBeginState_whenStateReady___block_invoke_8(_QWORD *a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t, uint64_t);
  id v6;

  v3 = a1[4];
  v2 = a1[5];
  v4 = *(unsigned __int8 *)(*(_QWORD *)(a1[6] + 8) + 24);
  v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16);
  v6 = a2;
  v5(v2, v3, v4);
  objc_msgSend(v6, "returnExecutionToParent");

}

- (void)recognizer:(id)a3 restartTouchDownForTouchWithId:(id)a4 startingAt:(double)a5 atPoint:(CGPoint)a6 currentPoint:(CGPoint)a7 whenStateReady:(id)a8
{
  CGFloat y;
  CGFloat x;
  CGFloat v11;
  CGFloat v12;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD block[5];
  id v21;
  id v22;
  _QWORD *v23;
  double v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  _QWORD v29[3];
  char v30;

  y = a7.y;
  x = a7.x;
  v11 = a6.y;
  v12 = a6.x;
  v16 = a4;
  v17 = a8;
  v18 = a3;
  -[UIKeyboardLayout handRestRecognizer](self, "handRestRecognizer");
  v19 = (id)objc_claimAutoreleasedReturnValue();

  if (v19 == v18)
  {
    v29[0] = 0;
    v29[1] = v29;
    v29[2] = 0x2020000000;
    v30 = 1;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __109__UIKeyboardLayout_recognizer_restartTouchDownForTouchWithId_startingAt_atPoint_currentPoint_whenStateReady___block_invoke;
    block[3] = &unk_1E16D6B48;
    block[4] = self;
    v24 = a5;
    v25 = v12;
    v21 = v16;
    v23 = v29;
    v26 = v11;
    v27 = x;
    v28 = y;
    v22 = v17;
    dispatch_sync(MEMORY[0x1E0C80D38], block);

    _Block_object_dispose(v29, 8);
  }
  else
  {
    (*((void (**)(id, id, _QWORD))v17 + 2))(v17, v16, 0);
  }

}

void __109__UIKeyboardLayout_recognizer_restartTouchDownForTouchWithId_startingAt_atPoint_currentPoint_whenStateReady___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  _QWORD v24[4];
  id v25;
  id v26;
  uint64_t v27;
  _QWORD v28[5];
  _QWORD v29[4];
  id v30;
  uint64_t *v31;
  id v32;
  __int128 v33;
  uint64_t v34;
  id location;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  void *(*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  _QWORD block[5];
  id v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;

  v45 = 0;
  v46 = &v45;
  v47 = 0x3032000000;
  v48 = __Block_byref_object_copy__132;
  v49 = __Block_byref_object_dispose__132;
  v50 = 0;
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = *(NSObject **)(v2 + 624);
  block[2] = __109__UIKeyboardLayout_recognizer_restartTouchDownForTouchWithId_startingAt_atPoint_currentPoint_whenStateReady___block_invoke_2;
  block[3] = &unk_1E16B9698;
  v5 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  v44 = &v45;
  block[4] = v2;
  v43 = v3;
  dispatch_sync(v4, block);
  +[UIKBTouchState touchStateForTouchUUID:withTimestamp:phase:location:pathIndex:inView:](UIKBTouchState, "touchStateForTouchUUID:withTimestamp:phase:location:pathIndex:inView:", *(_QWORD *)(a1 + 40), 0, objc_msgSend((id)v46[5], "pathIndex"), *(_QWORD *)(a1 + 32), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "queryShouldNeverIgnoreTouchStateWithIdentifier:touchState:startPoint:forRestingState:", *(_QWORD *)(a1 + 40), v6, 2, *(double *)(a1 + 88), *(double *)(a1 + 96));
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    v36 = 0;
    v37 = &v36;
    v38 = 0x3032000000;
    v39 = __Block_byref_object_copy__198;
    v40 = __Block_byref_object_dispose__199;
    v41 = 0;
    objc_initWeak(&location, *(id *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 32), "taskQueue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v5;
    v29[1] = 3221225472;
    v29[2] = __109__UIKeyboardLayout_recognizer_restartTouchDownForTouchWithId_startingAt_atPoint_currentPoint_whenStateReady___block_invoke_200;
    v29[3] = &unk_1E16D6B20;
    v31 = &v45;
    objc_copyWeak(&v32, &location);
    v30 = *(id *)(a1 + 40);
    v33 = *(_OWORD *)(a1 + 72);
    v34 = *(_QWORD *)(a1 + 64);
    objc_msgSend(v7, "addTask:", v29);

    +[UIKBTouchState touchStateForTouchUUID:withTimestamp:phase:location:pathIndex:inView:](UIKBTouchState, "touchStateForTouchUUID:withTimestamp:phase:location:pathIndex:inView:", *(_QWORD *)(a1 + 40), 0, objc_msgSend((id)v46[5], "pathIndex"), *(_QWORD *)(a1 + 32), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "taskQueue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "touchDownTaskForTouchState:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addTask:", v10);

    if (v37[5])
    {
      objc_msgSend(*(id *)(a1 + 32), "taskQueue");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = v5;
      v28[1] = 3221225472;
      v28[2] = __109__UIKeyboardLayout_recognizer_restartTouchDownForTouchWithId_startingAt_atPoint_currentPoint_whenStateReady___block_invoke_2_201;
      v28[3] = &unk_1E16BB8E0;
      v28[4] = &v36;
      objc_msgSend(v11, "addTask:", v28);

    }
    +[UIKBTouchState touchStateForTouchUUID:withTimestamp:phase:location:pathIndex:inView:](UIKBTouchState, "touchStateForTouchUUID:withTimestamp:phase:location:pathIndex:inView:", *(_QWORD *)(a1 + 40), 1, objc_msgSend((id)v46[5], "pathIndex"), *(_QWORD *)(a1 + 32), *(double *)(a1 + 64), *(double *)(a1 + 88), *(double *)(a1 + 96));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "taskQueue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "touchDraggedTaskForTouchState:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addTask:", v14);

    v15 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *(_QWORD *)(a1 + 40));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_enumerateDeferredTouchUUIDs:withBlock:", v16, 0);

    +[UIKBTouchState touchStateForTouchUUID:withTimestamp:phase:location:pathIndex:inView:](UIKBTouchState, "touchStateForTouchUUID:withTimestamp:phase:location:pathIndex:inView:", *(_QWORD *)(a1 + 40), 3, objc_msgSend((id)v46[5], "pathIndex"), *(_QWORD *)(a1 + 32), CFAbsoluteTimeGetCurrent() + *(double *)&sSystemUptimeFromAbsoluteTimeDiff, *(double *)(a1 + 88), *(double *)(a1 + 96));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = (void *)v46[5];
    objc_msgSend(*(id *)(a1 + 32), "touchUpTaskForTouchState:", v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKBTouchStateTask touchStateTaskForTouchState:andTask:](UIKBTouchStateTask, "touchStateTaskForTouchState:andTask:", v17, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addTask:", v20);

    objc_destroyWeak(&v32);
    objc_destroyWeak(&location);
    _Block_object_dispose(&v36, 8);

  }
  objc_msgSend(*(id *)(a1 + 32), "taskQueue");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v5;
  v24[1] = 3221225472;
  v24[2] = __109__UIKeyboardLayout_recognizer_restartTouchDownForTouchWithId_startingAt_atPoint_currentPoint_whenStateReady___block_invoke_3;
  v24[3] = &unk_1E16D6AD0;
  v26 = *(id *)(a1 + 48);
  v22 = *(id *)(a1 + 40);
  v23 = *(_QWORD *)(a1 + 56);
  v25 = v22;
  v27 = v23;
  objc_msgSend(v21, "addTask:", v24);

  _Block_object_dispose(&v45, 8);
}

void __109__UIKeyboardLayout_recognizer_restartTouchDownForTouchWithId_startingAt_atPoint_currentPoint_whenStateReady___block_invoke_2(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 616), "objectForKey:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __109__UIKeyboardLayout_recognizer_restartTouchDownForTouchWithId_startingAt_atPoint_currentPoint_whenStateReady___block_invoke_200(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id *WeakRetained;

  v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v4 = a2;
  objc_msgSend(v3, "ignoredOnBegin");
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained[55], "addObject:", *(_QWORD *)(a1 + 32));
  objc_msgSend(WeakRetained[79], "removeObject:", *(_QWORD *)(a1 + 32));
  objc_msgSend(WeakRetained, "handRestRecognizerNotifyRestForBegin:location:timestamp:pathIndex:touchUUID:context:", 0, objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "pathIndex"), *(_QWORD *)(a1 + 32), v4, *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));

}

void __109__UIKeyboardLayout_recognizer_restartTouchDownForTouchWithId_startingAt_atPoint_currentPoint_whenStateReady___block_invoke_2_201(uint64_t a1, void *a2)
{
  uint64_t v2;
  void (*v3)(uint64_t);
  id v4;

  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v3 = *(void (**)(uint64_t))(v2 + 16);
  v4 = a2;
  v3(v2);
  objc_msgSend(v4, "returnExecutionToParent");

}

void __109__UIKeyboardLayout_recognizer_restartTouchDownForTouchWithId_startingAt_atPoint_currentPoint_whenStateReady___block_invoke_3(_QWORD *a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t, uint64_t);
  id v6;

  v3 = a1[4];
  v2 = a1[5];
  v4 = *(unsigned __int8 *)(*(_QWORD *)(a1[6] + 8) + 24);
  v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16);
  v6 = a2;
  v5(v2, v3, v4);
  objc_msgSend(v6, "returnExecutionToParent");

}

- (void)recognizer:(id)a3 shouldContinueTrackingTouchWithId:(id)a4 startingAt:(double)a5 atPoint:(CGPoint)a6 currentPoint:(CGPoint)a7 forContinueState:(unint64_t)a8 whenStateReady:(id)a9
{
  CGFloat y;
  CGFloat x;
  void (**v15)(id, id, uint64_t);
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  void (**v21)(id, id, uint64_t);
  unint64_t v22;
  CGFloat v23;
  CGFloat v24;

  y = a6.y;
  x = a6.x;
  v18 = a4;
  v15 = (void (**)(id, id, uint64_t))a9;
  v16 = a3;
  -[UIKeyboardLayout handRestRecognizer](self, "handRestRecognizer");
  v17 = (id)objc_claimAutoreleasedReturnValue();

  if (v17 == v16)
  {
    if (a8 == 3)
    {
      v15[2](v15, v18, objc_msgSend(v18, "isEqual:", self->_shiftKeyTouchUUID));
    }
    else
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __129__UIKeyboardLayout_recognizer_shouldContinueTrackingTouchWithId_startingAt_atPoint_currentPoint_forContinueState_whenStateReady___block_invoke;
      block[3] = &unk_1E16D6BC0;
      block[4] = self;
      v20 = v18;
      v22 = a8;
      v23 = x;
      v24 = y;
      v21 = v15;
      dispatch_sync(MEMORY[0x1E0C80D38], block);

    }
  }
  else
  {
    v15[2](v15, v18, 0);
  }

}

void __129__UIKeyboardLayout_recognizer_shouldContinueTrackingTouchWithId_startingAt_atPoint_currentPoint_forContinueState_whenStateReady___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;
  __int128 v18;
  uint64_t v19;
  id location;
  _QWORD v21[4];
  id v22;
  uint64_t v23;
  _QWORD block[5];
  id v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__132;
  v31 = __Block_byref_object_dispose__132;
  v32 = 0;
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = *(NSObject **)(v2 + 624);
  block[2] = __129__UIKeyboardLayout_recognizer_shouldContinueTrackingTouchWithId_startingAt_atPoint_currentPoint_forContinueState_whenStateReady___block_invoke_2;
  block[3] = &unk_1E16B9698;
  v5 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  v26 = &v27;
  block[4] = v2;
  v25 = v3;
  dispatch_sync(v4, block);
  v6 = 0;
  v7 = *(_QWORD *)(a1 + 56);
  if (!v7)
  {
    objc_msgSend((id)v28[5], "firstTouchStateForUITouchPhase:", 1);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v8 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *(_QWORD *)(a1 + 40));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = v5;
      v21[1] = 3221225472;
      v21[2] = __129__UIKeyboardLayout_recognizer_shouldContinueTrackingTouchWithId_startingAt_atPoint_currentPoint_forContinueState_whenStateReady___block_invoke_3;
      v21[3] = &unk_1E16D6B70;
      v6 = v6;
      v10 = *(_QWORD *)(a1 + 32);
      v22 = v6;
      v23 = v10;
      objc_msgSend(v8, "_enumerateDeferredTouchUUIDs:withBlock:", v9, v21);

    }
  }
  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "taskQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v5;
  v13[1] = 3221225472;
  v13[2] = __129__UIKeyboardLayout_recognizer_shouldContinueTrackingTouchWithId_startingAt_atPoint_currentPoint_forContinueState_whenStateReady___block_invoke_4;
  v13[3] = &unk_1E16D6B98;
  objc_copyWeak(&v17, &location);
  v14 = *(id *)(a1 + 40);
  v12 = v6;
  v15 = v12;
  v18 = *(_OWORD *)(a1 + 64);
  v19 = v7;
  v16 = *(id *)(a1 + 48);
  objc_msgSend(v11, "addTask:", v13);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  _Block_object_dispose(&v27, 8);
}

void __129__UIKeyboardLayout_recognizer_shouldContinueTrackingTouchWithId_startingAt_atPoint_currentPoint_forContinueState_whenStateReady___block_invoke_2(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 616), "objectForKey:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __129__UIKeyboardLayout_recognizer_shouldContinueTrackingTouchWithId_startingAt_atPoint_currentPoint_forContinueState_whenStateReady___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, BOOL *a4)
{
  uint64_t v4;
  void *v5;
  id v6;
  id v7;

  v4 = *(_QWORD *)(a1 + 32);
  *a4 = v4 != a2;
  if (v4 == a2)
  {
    v5 = *(void **)(a1 + 40);
    v6 = a3;
    objc_msgSend(v5, "taskQueue");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addTask:", v6);

  }
}

void __129__UIKeyboardLayout_recognizer_shouldContinueTrackingTouchWithId_startingAt_atPoint_currentPoint_forContinueState_whenStateReady___block_invoke_4(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  void *v5;
  id WeakRetained;

  v3 = (id *)(a1 + 56);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "queryShouldNeverIgnoreTouchStateWithIdentifier:touchState:startPoint:forRestingState:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 80), *(double *)(a1 + 64), *(double *)(a1 + 72));
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_msgSend(v4, "info");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "returnExecutionToParentWithInfo:", v5);

}

- (BOOL)queryShouldNeverIgnoreTouchStateWithIdentifier:(id)a3 touchState:(id)a4 startPoint:(CGPoint)a5 forRestingState:(unint64_t)a6
{
  double y;
  double x;
  id v11;
  id v12;
  NSObject *deferredTouchTaskListsQueue;
  id v14;
  void *v15;
  double v16;
  double v17;
  _QWORD block[5];
  id v20;
  uint64_t *v21;
  uint64_t *v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  y = a5.y;
  x = a5.x;
  v11 = a3;
  v12 = a4;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__132;
  v34 = __Block_byref_object_dispose__132;
  v35 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__132;
  v28 = __Block_byref_object_dispose__132;
  v29 = 0;
  deferredTouchTaskListsQueue = self->_deferredTouchTaskListsQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __105__UIKeyboardLayout_queryShouldNeverIgnoreTouchStateWithIdentifier_touchState_startPoint_forRestingState___block_invoke;
  block[3] = &unk_1E16D6C10;
  v21 = &v30;
  block[4] = self;
  v14 = v11;
  v22 = &v24;
  v23 = a6;
  v20 = v14;
  dispatch_sync(deferredTouchTaskListsQueue, block);
  objc_msgSend((id)v31[5], "currentTouchPoint");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "CGPointValue");
  LOBYTE(a6) = -[UIKeyboardLayout handRestRecognizerShouldNeverIgnoreTouchState:fromPoint:toPoint:forRestingState:otherRestedTouchLocations:](self, "handRestRecognizerShouldNeverIgnoreTouchState:fromPoint:toPoint:forRestingState:otherRestedTouchLocations:", v12, a6, v25[5], x, y, v16, v17);

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

  return a6;
}

void __105__UIKeyboardLayout_queryShouldNeverIgnoreTouchStateWithIdentifier_touchState_startPoint_forRestingState___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 616), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (*(_QWORD *)(a1 + 64) == 1)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 616), "allValues");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __105__UIKeyboardLayout_queryShouldNeverIgnoreTouchStateWithIdentifier_touchState_startPoint_forRestingState___block_invoke_2;
    v13[3] = &unk_1E16D6BE8;
    v6 = *(id *)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 32);
    v14 = v6;
    v15 = v7;
    objc_msgSend(v5, "indexesOfObjectsPassingTest:", v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectsAtIndexes:", v8);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v12, "count"))
    {
      objc_msgSend(v12, "valueForKey:", CFSTR("currentTouchPoint"));
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v11 = *(void **)(v10 + 40);
      *(_QWORD *)(v10 + 40) = v9;

    }
  }
}

uint64_t __105__UIKeyboardLayout_queryShouldNeverIgnoreTouchStateWithIdentifier_touchState_startPoint_forRestingState___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a2;
  objc_msgSend(v3, "touchUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqual:", *(_QWORD *)(a1 + 32)) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v3, "currentTouchPoint");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = *(void **)(*(_QWORD *)(a1 + 40) + 632);
      objc_msgSend(v3, "touchUUID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v7, "containsObject:", v8);

    }
    else
    {
      v5 = 0;
    }

  }
  return v5;
}

- (void)recognizer:(id)a3 willIgnoreTouchWithId:(id)a4 startingAt:(double)a5 atPoint:(CGPoint)a6 currentPoint:(CGPoint)a7 whenReady:(id)a8
{
  CGFloat y;
  CGFloat x;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  CGFloat v20;
  CGFloat v21;

  y = a7.y;
  x = a7.x;
  v16 = a4;
  v13 = a8;
  v14 = a3;
  -[UIKeyboardLayout handRestRecognizer](self, "handRestRecognizer");
  v15 = (id)objc_claimAutoreleasedReturnValue();

  if (v15 == v14)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __95__UIKeyboardLayout_recognizer_willIgnoreTouchWithId_startingAt_atPoint_currentPoint_whenReady___block_invoke;
    block[3] = &unk_1E16D6CD8;
    block[4] = self;
    v18 = v16;
    v20 = x;
    v21 = y;
    v19 = v13;
    dispatch_sync(MEMORY[0x1E0C80D38], block);

  }
  else
  {
    (*((void (**)(id, id))v13 + 2))(v13, v16);
  }

}

void __95__UIKeyboardLayout_recognizer_willIgnoreTouchWithId_startingAt_atPoint_currentPoint_whenReady___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t *v21;
  id v22;
  __int128 v23;
  _QWORD v24[5];
  uint64_t v25;
  double *v26;
  uint64_t v27;
  double v28;
  id location;
  _QWORD block[5];
  id v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;

  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 0;
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = *(NSObject **)(v2 + 624);
  block[2] = __95__UIKeyboardLayout_recognizer_willIgnoreTouchWithId_startingAt_atPoint_currentPoint_whenReady___block_invoke_2;
  block[3] = &unk_1E16BDBB0;
  v5 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[4] = v2;
  v31 = v3;
  v32 = &v33;
  dispatch_sync(v4, block);
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 632), "containsObject:", *(_QWORD *)(a1 + 40)) & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "taskQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v5;
    v13[1] = 3221225472;
    v13[2] = __95__UIKeyboardLayout_recognizer_willIgnoreTouchWithId_startingAt_atPoint_currentPoint_whenReady___block_invoke_7;
    v13[3] = &unk_1E16BB6B8;
    v15 = *(id *)(a1 + 48);
    v14 = *(id *)(a1 + 40);
    objc_msgSend(v6, "addTask:", v13);

  }
  else
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    v25 = 0;
    v26 = (double *)&v25;
    v27 = 0x2020000000;
    v28 = 0.0;
    v28 = CFAbsoluteTimeGetCurrent() + *(double *)&sSystemUptimeFromAbsoluteTimeDiff;
    v7 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *(_QWORD *)(a1 + 40));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v5;
    v24[1] = 3221225472;
    v24[2] = __95__UIKeyboardLayout_recognizer_willIgnoreTouchWithId_startingAt_atPoint_currentPoint_whenReady___block_invoke_3;
    v24[3] = &unk_1E16D6C38;
    v24[4] = &v25;
    objc_msgSend(v7, "_enumerateDeferredTouchUUIDs:withBlock:", v8, v24);

    +[UIKBTouchState touchStateForTouchUUID:withTimestamp:phase:location:pathIndex:inView:](UIKBTouchState, "touchStateForTouchUUID:withTimestamp:phase:location:pathIndex:inView:", *(_QWORD *)(a1 + 40), 4, *((unsigned __int8 *)v34 + 24), *(_QWORD *)(a1 + 32), v26[3], *(double *)(a1 + 56), *(double *)(a1 + 64));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "touchCancelledTaskForTouchState:forResting:", v9, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "taskQueue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v5;
    v16[1] = 3221225472;
    v16[2] = __95__UIKeyboardLayout_recognizer_willIgnoreTouchWithId_startingAt_atPoint_currentPoint_whenReady___block_invoke_4;
    v16[3] = &unk_1E16D6CB0;
    v12 = v10;
    v18 = v12;
    objc_copyWeak(&v22, &location);
    v23 = *(_OWORD *)(a1 + 56);
    v20 = &v25;
    v21 = &v33;
    v17 = *(id *)(a1 + 40);
    v19 = *(id *)(a1 + 48);
    objc_msgSend(v11, "addTask:", v16);

    objc_destroyWeak(&v22);
    _Block_object_dispose(&v25, 8);
    objc_destroyWeak(&location);
  }

  _Block_object_dispose(&v33, 8);
}

void __95__UIKeyboardLayout_recognizer_willIgnoreTouchWithId_startingAt_atPoint_currentPoint_whenReady___block_invoke_2(_QWORD *a1)
{
  id v2;

  objc_msgSend(*(id *)(a1[4] + 616), "objectForKey:", a1[5]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(v2, "pathIndex");

}

uint64_t __95__UIKeyboardLayout_recognizer_willIgnoreTouchWithId_startingAt_atPoint_currentPoint_whenReady___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t result;
  uint64_t v4;

  result = objc_msgSend(a2, "timestamp");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v4;
  return result;
}

void __95__UIKeyboardLayout_recognizer_willIgnoreTouchWithId_startingAt_atPoint_currentPoint_whenReady___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  __int128 v9;
  id v10;
  __int128 v11;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 40);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __95__UIKeyboardLayout_recognizer_willIgnoreTouchWithId_startingAt_atPoint_currentPoint_whenReady___block_invoke_5;
  v6[3] = &unk_1E16D6C88;
  objc_copyWeak(&v10, (id *)(a1 + 72));
  v11 = *(_OWORD *)(a1 + 80);
  v9 = *(_OWORD *)(a1 + 56);
  v7 = *(id *)(a1 + 32);
  v8 = *(id *)(a1 + 48);
  objc_msgSend(v3, "childWithContinuation:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  objc_destroyWeak(&v10);
}

void __95__UIKeyboardLayout_recognizer_willIgnoreTouchWithId_startingAt_atPoint_currentPoint_whenReady___block_invoke_5(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  double v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v3 = (id *)(a1 + 64);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  v6 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  v7 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  v8 = *(void **)(a1 + 32);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __95__UIKeyboardLayout_recognizer_willIgnoreTouchWithId_startingAt_atPoint_currentPoint_whenReady___block_invoke_6;
  v11[3] = &unk_1E16D6C60;
  v11[4] = WeakRetained;
  v9 = v8;
  v12 = v9;
  v13 = *(id *)(a1 + 40);
  objc_msgSend(v4, "childWithContinuation:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "handRestRecognizerNotifyRestForBegin:location:timestamp:pathIndex:touchUUID:context:", 1, v7, v9, v10, *(double *)(a1 + 72), *(double *)(a1 + 80), v6);
}

void __95__UIKeyboardLayout_recognizer_willIgnoreTouchWithId_startingAt_atPoint_currentPoint_whenReady___block_invoke_6(_QWORD *a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = a1[5];
  v4 = *(void **)(a1[4] + 632);
  v5 = a2;
  objc_msgSend(v4, "addObject:", v3);
  (*(void (**)(void))(a1[6] + 16))();
  objc_msgSend(v5, "returnExecutionToParent");

}

void __95__UIKeyboardLayout_recognizer_willIgnoreTouchWithId_startingAt_atPoint_currentPoint_whenReady___block_invoke_7(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t, uint64_t);
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v4 = *(void (**)(uint64_t, uint64_t))(v2 + 16);
  v5 = a2;
  v4(v2, v3);
  objc_msgSend(v5, "returnExecutionToParent");

}

- (void)recognizer:(id)a3 continueTrackingIgnoredTouchWithId:(id)a4 currentPoint:(CGPoint)a5 whenReady:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;

  v12 = a4;
  v9 = a6;
  v10 = a3;
  -[UIKeyboardLayout handRestRecognizer](self, "handRestRecognizer");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11 == v10)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __89__UIKeyboardLayout_recognizer_continueTrackingIgnoredTouchWithId_currentPoint_whenReady___block_invoke;
    block[3] = &unk_1E16BAD68;
    block[4] = self;
    v14 = v12;
    v15 = v9;
    dispatch_sync(MEMORY[0x1E0C80D38], block);

  }
  else
  {
    (*((void (**)(id, id))v9 + 2))(v9, v12);
  }

}

void __89__UIKeyboardLayout_recognizer_continueTrackingIgnoredTouchWithId_currentPoint_whenReady___block_invoke(id *a1)
{
  id v2;
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[4];
  _QWORD v19[2];
  id v20;
  id v21;
  _QWORD block[5];
  id v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__132;
  v29 = __Block_byref_object_dispose__132;
  v30 = 0;
  v2 = a1[4];
  v3 = a1[5];
  v4 = *((_QWORD *)v2 + 78);
  block[2] = __89__UIKeyboardLayout_recognizer_continueTrackingIgnoredTouchWithId_currentPoint_whenReady___block_invoke_2;
  block[3] = &unk_1E16B9698;
  v5 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  v24 = &v25;
  block[4] = v2;
  v23 = v3;
  dispatch_sync(v4, block);
  objc_msgSend((id)v26[5], "firstTouchStateForUITouchPhase:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = a1[4];
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", a1[5]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v5;
    v18[1] = 3221225472;
    v18[2] = __89__UIKeyboardLayout_recognizer_continueTrackingIgnoredTouchWithId_currentPoint_whenReady___block_invoke_3;
    v18[3] = &unk_1E16D6D28;
    v9 = v6;
    v10 = a1[4];
    v11 = a1[5];
    v19[0] = v9;
    v19[1] = v10;
    v20 = v11;
    v21 = a1[6];
    objc_msgSend(v7, "_enumerateDeferredTouchUUIDs:withBlock:", v8, v18);
    v12 = (id *)v19;

    v13 = v20;
  }
  else
  {
    objc_msgSend(a1[4], "taskQueue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v5;
    v15[1] = 3221225472;
    v15[2] = __89__UIKeyboardLayout_recognizer_continueTrackingIgnoredTouchWithId_currentPoint_whenReady___block_invoke_6;
    v15[3] = &unk_1E16BB6B8;
    v17 = a1[6];
    v16 = a1[5];
    objc_msgSend(v14, "addTask:", v15);
    v12 = &v17;

    v13 = v16;
  }

  _Block_object_dispose(&v25, 8);
}

void __89__UIKeyboardLayout_recognizer_continueTrackingIgnoredTouchWithId_currentPoint_whenReady___block_invoke_2(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 616), "objectForKey:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __89__UIKeyboardLayout_recognizer_continueTrackingIgnoredTouchWithId_currentPoint_whenReady___block_invoke_3(uint64_t a1, void *a2, void *a3, BOOL *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id v15;
  id location;

  v7 = a2;
  v8 = a3;
  v9 = *(id *)(a1 + 32);
  *a4 = v9 != v7;
  if (v9 == v7)
  {
    objc_initWeak(&location, *(id *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 40), "taskQueue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __89__UIKeyboardLayout_recognizer_continueTrackingIgnoredTouchWithId_currentPoint_whenReady___block_invoke_4;
    v11[3] = &unk_1E16D6D00;
    objc_copyWeak(&v15, &location);
    v12 = *(id *)(a1 + 48);
    v13 = v8;
    v14 = *(id *)(a1 + 56);
    objc_msgSend(v10, "addTask:", v11);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

}

void __89__UIKeyboardLayout_recognizer_continueTrackingIgnoredTouchWithId_currentPoint_whenReady___block_invoke_4(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id *WeakRetained;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  id v10;

  v3 = (id *)(a1 + 56);
  v4 = a2;
  WeakRetained = (id *)objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained[55], "addObject:", *(_QWORD *)(a1 + 32));
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __89__UIKeyboardLayout_recognizer_continueTrackingIgnoredTouchWithId_currentPoint_whenReady___block_invoke_5;
  v8[3] = &unk_1E16D6C60;
  v8[4] = WeakRetained;
  v6 = *(_QWORD *)(a1 + 40);
  v9 = *(id *)(a1 + 32);
  v10 = *(id *)(a1 + 48);
  objc_msgSend(v4, "childWithContinuation:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
}

void __89__UIKeyboardLayout_recognizer_continueTrackingIgnoredTouchWithId_currentPoint_whenReady___block_invoke_5(_QWORD *a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = a1[5];
  v4 = *(void **)(a1[4] + 440);
  v5 = a2;
  objc_msgSend(v4, "removeObject:", v3);
  (*(void (**)(void))(a1[6] + 16))();
  objc_msgSend(v5, "returnExecutionToParent");

}

void __89__UIKeyboardLayout_recognizer_continueTrackingIgnoredTouchWithId_currentPoint_whenReady___block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t, uint64_t);
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v4 = *(void (**)(uint64_t, uint64_t))(v2 + 16);
  v5 = a2;
  v4(v2, v3);
  objc_msgSend(v5, "returnExecutionToParent");

}

- (void)recognizer:(id)a3 releaseTouchToLayoutWithId:(id)a4 startPoint:(CGPoint)a5 endPoint:(CGPoint)a6 whenReady:(id)a7
{
  CGFloat y;
  CGFloat x;
  CGFloat v10;
  CGFloat v11;
  id v13;
  id v14;
  void *v15;
  id v16;
  OS_dispatch_queue *v17;
  NSMutableSet *v18;
  NSMutableDictionary *v19;
  OS_dispatch_queue *v20;
  NSMutableSet *v21;
  NSMutableDictionary *v22;
  id v23;
  id v24;
  _QWORD block[4];
  OS_dispatch_queue *v26;
  UIKeyboardLayout *v27;
  id v28;
  NSMutableSet *v29;
  id v30;
  NSMutableDictionary *v31;
  id v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;

  y = a6.y;
  x = a6.x;
  v10 = a5.y;
  v11 = a5.x;
  v13 = a4;
  v14 = a7;
  -[UIKeyboardLayout recognizerBlockUntilTaskQueueReadyForceUsingDeferredTask:](self, "recognizerBlockUntilTaskQueueReadyForceUsingDeferredTask:", 0);
  v15 = (void *)objc_msgSend(v14, "copy");

  v16 = v13;
  v17 = self->_deferredTouchTaskListsQueue;
  v18 = self->_touchIgnoredUUIDSet;
  v19 = self->_deferredTouchTaskLists;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __88__UIKeyboardLayout_recognizer_releaseTouchToLayoutWithId_startPoint_endPoint_whenReady___block_invoke;
  block[3] = &unk_1E16D6DA0;
  v26 = v17;
  v27 = self;
  v33 = v11;
  v34 = v10;
  v35 = x;
  v36 = y;
  v28 = v16;
  v29 = v18;
  v30 = v16;
  v31 = v19;
  v32 = v15;
  v20 = v17;
  v21 = v18;
  v22 = v19;
  v23 = v15;
  v24 = v16;
  dispatch_sync(MEMORY[0x1E0C80D38], block);

}

void __88__UIKeyboardLayout_recognizer_releaseTouchToLayoutWithId_startPoint_endPoint_whenReady___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  _QWORD v32[5];
  _QWORD block[5];
  id v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;

  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__132;
  v40 = __Block_byref_object_dispose__132;
  v41 = 0;
  v2 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __88__UIKeyboardLayout_recognizer_releaseTouchToLayoutWithId_startPoint_endPoint_whenReady___block_invoke_2;
  block[3] = &unk_1E16B9698;
  v4 = *(NSObject **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v35 = &v36;
  block[4] = v3;
  v34 = *(id *)(a1 + 48);
  dispatch_sync(v4, block);
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 632), "containsObject:", *(_QWORD *)(a1 + 48)) & 1) != 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 632), "removeObject:", *(_QWORD *)(a1 + 48));
    if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 440), "containsObject:", *(_QWORD *)(a1 + 48)) & 1) == 0)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 440), "addObject:", *(_QWORD *)(a1 + 48));
      v5 = *(_QWORD *)(a1 + 48);
      objc_msgSend((id)v37[5], "originalStartTime");
      +[UIKBTouchState touchStateForTouchUUID:withTimestamp:phase:location:pathIndex:inView:](UIKBTouchState, "touchStateForTouchUUID:withTimestamp:phase:location:pathIndex:inView:", v5, 0, objc_msgSend((id)v37[5], "pathIndex"), *(_QWORD *)(a1 + 40), v6, *(double *)(a1 + 88), *(double *)(a1 + 96));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "taskQueue");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "touchDownTaskForTouchState:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addTask:", v9);

      v10 = *(_QWORD *)(a1 + 48);
      objc_msgSend((id)v37[5], "originalStartTime");
      +[UIKBTouchState touchStateForTouchUUID:withTimestamp:phase:location:pathIndex:inView:](UIKBTouchState, "touchStateForTouchUUID:withTimestamp:phase:location:pathIndex:inView:", v10, 1, objc_msgSend((id)v37[5], "pathIndex"), *(_QWORD *)(a1 + 40), v11, *(double *)(a1 + 104), *(double *)(a1 + 112));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 40), "taskQueue");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "touchDraggedTaskForTouchState:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addTask:", v14);

    }
    objc_msgSend((id)v37[5], "firstTouchStateForUITouchPhase:", 3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      +[UIKBTouchState touchStateForTouchUUID:withTimestamp:phase:location:pathIndex:inView:](UIKBTouchState, "touchStateForTouchUUID:withTimestamp:phase:location:pathIndex:inView:", *(_QWORD *)(a1 + 48), 3, objc_msgSend((id)v37[5], "pathIndex"), *(_QWORD *)(a1 + 40), CFAbsoluteTimeGetCurrent() + *(double *)&sSystemUptimeFromAbsoluteTimeDiff, *(double *)(a1 + 104), *(double *)(a1 + 112));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)v37[5];
      objc_msgSend(*(id *)(a1 + 40), "touchUpTaskForTouchState:", v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIKBTouchStateTask touchStateTaskForTouchState:andTask:](UIKBTouchStateTask, "touchStateTaskForTouchState:andTask:", v16, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addTask:", v19);

    }
  }
  v20 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 440), "indexOfObject:", *(_QWORD *)(a1 + 48));
  if (v20 != 0x7FFFFFFFFFFFFFFFLL && v20 + 1 != objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 440), "count"))
  {
    v21 = *(void **)(*(_QWORD *)(a1 + 40) + 440);
    objc_msgSend(v21, "objectAtIndex:", v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObject:", v22);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 440), "removeObjectAtIndex:", v20);
  }
  v23 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *(_QWORD *)(a1 + 48));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v2;
  v32[1] = 3221225472;
  v32[2] = __88__UIKeyboardLayout_recognizer_releaseTouchToLayoutWithId_startPoint_endPoint_whenReady___block_invoke_3;
  v32[3] = &unk_1E16D6D50;
  v32[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v23, "_enumerateDeferredTouchUUIDs:withBlock:", v24, v32);

  objc_msgSend(*(id *)(a1 + 40), "taskQueue");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v2;
  v26[1] = 3221225472;
  v26[2] = __88__UIKeyboardLayout_recognizer_releaseTouchToLayoutWithId_startPoint_endPoint_whenReady___block_invoke_4;
  v26[3] = &unk_1E16D6D78;
  v27 = *(id *)(a1 + 56);
  v28 = *(id *)(a1 + 64);
  v29 = *(id *)(a1 + 32);
  v30 = *(id *)(a1 + 72);
  v31 = *(id *)(a1 + 80);
  objc_msgSend(v25, "addTask:", v26);

  _Block_object_dispose(&v36, 8);
}

void __88__UIKeyboardLayout_recognizer_releaseTouchToLayoutWithId_startPoint_endPoint_whenReady___block_invoke_2(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 616), "objectForKey:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __88__UIKeyboardLayout_recognizer_releaseTouchToLayoutWithId_startPoint_endPoint_whenReady___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a3;
  objc_msgSend(v3, "taskQueue");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addTask:", v4);

}

void __88__UIKeyboardLayout_recognizer_releaseTouchToLayoutWithId_startPoint_endPoint_whenReady___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  void *v12;
  id v13;
  id v14;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = a2;
  objc_msgSend(v3, "removeObject:", v4);
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __88__UIKeyboardLayout_recognizer_releaseTouchToLayoutWithId_startPoint_endPoint_whenReady___block_invoke_5;
  v12 = &unk_1E16B1B50;
  v6 = *(NSObject **)(a1 + 48);
  v13 = *(id *)(a1 + 56);
  v14 = *(id *)(a1 + 40);
  dispatch_sync(v6, &v9);
  (*(void (**)(_QWORD, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(a1 + 64) + 16))(*(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), v7, v8);
  objc_msgSend(v5, "returnExecutionToParent", v9, v10, v11, v12);

}

uint64_t __88__UIKeyboardLayout_recognizer_releaseTouchToLayoutWithId_startPoint_endPoint_whenReady___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
}

- (void)recognizer:(id)a3 cancelTouchOnLayoutWithId:(id)a4 startPoint:(CGPoint)a5 endPoint:(CGPoint)a6 whenReady:(id)a7
{
  id v9;
  id v10;
  OS_dispatch_queue *v11;
  id v12;
  OS_dispatch_queue *v13;
  id v14;
  _QWORD block[4];
  OS_dispatch_queue *v16;
  UIKeyboardLayout *v17;
  id v18;
  id v19;

  v9 = a4;
  v10 = a7;
  -[UIKeyboardLayout recognizerBlockUntilTaskQueueReadyForceUsingDeferredTask:](self, "recognizerBlockUntilTaskQueueReadyForceUsingDeferredTask:", 0);
  v11 = self->_deferredTouchTaskListsQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87__UIKeyboardLayout_recognizer_cancelTouchOnLayoutWithId_startPoint_endPoint_whenReady___block_invoke;
  block[3] = &unk_1E16B4420;
  v16 = v11;
  v17 = self;
  v18 = v9;
  v19 = v10;
  v12 = v10;
  v14 = v9;
  v13 = v11;
  dispatch_sync(MEMORY[0x1E0C80D38], block);

}

void __87__UIKeyboardLayout_recognizer_cancelTouchOnLayoutWithId_startPoint_endPoint_whenReady___block_invoke(id *a1)
{
  uint64_t v2;
  id v3;
  NSObject *v4;
  int v5;
  id *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double Current;
  double v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  uint64_t *v30;
  id v31[5];
  id location;
  _QWORD v33[4];
  id v34;
  id v35;
  uint64_t *v36;
  _QWORD v37[5];
  id v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  void *(*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  _QWORD block[5];
  id v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;

  v49 = 0;
  v50 = &v49;
  v51 = 0x3032000000;
  v52 = __Block_byref_object_copy__132;
  v53 = __Block_byref_object_dispose__132;
  v54 = 0;
  v2 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87__UIKeyboardLayout_recognizer_cancelTouchOnLayoutWithId_startPoint_endPoint_whenReady___block_invoke_2;
  block[3] = &unk_1E16B9698;
  v4 = a1[4];
  v3 = a1[5];
  v48 = &v49;
  block[4] = v3;
  v47 = a1[6];
  dispatch_sync(v4, block);
  v5 = objc_msgSend(*((id *)a1[5] + 55), "containsObject:", a1[6]);
  v6 = (id *)a1[5];
  if (v5)
  {
    v7 = objc_msgSend(v6[55], "indexOfObject:", a1[6]);
    if (v7 != 0x7FFFFFFFFFFFFFFFLL && v7 + 1 != objc_msgSend(*((id *)a1[5] + 55), "count"))
    {
      v8 = (void *)*((_QWORD *)a1[5] + 55);
      objc_msgSend(v8, "objectAtIndex:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v9);

      objc_msgSend(*((id *)a1[5] + 55), "removeObjectAtIndex:", v7);
    }
  }
  else if (objc_msgSend(v6[79], "containsObject:", a1[6]))
  {
    objc_msgSend(*((id *)a1[5] + 55), "addObject:", a1[6]);
    objc_msgSend(*((id *)a1[5] + 79), "removeObject:", a1[6]);
  }
  v40 = 0;
  v41 = &v40;
  v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__198;
  v44 = __Block_byref_object_dispose__199;
  v45 = 0;
  v10 = a1[5];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", a1[6]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v2;
  v37[1] = 3221225472;
  v37[2] = __87__UIKeyboardLayout_recognizer_cancelTouchOnLayoutWithId_startPoint_endPoint_whenReady___block_invoke_3;
  v37[3] = &unk_1E16D6DC8;
  v12 = a1[6];
  v37[4] = a1[5];
  v39 = &v40;
  v38 = v12;
  objc_msgSend(v10, "_enumerateDeferredTouchUUIDs:withBlock:", v11, v37);

  if (!v41[5])
  {
    v33[0] = v2;
    v33[1] = 3221225472;
    v33[2] = __87__UIKeyboardLayout_recognizer_cancelTouchOnLayoutWithId_startPoint_endPoint_whenReady___block_invoke_4;
    v33[3] = &unk_1E16BB908;
    v13 = a1[6];
    v14 = a1[5];
    v34 = v13;
    v35 = v14;
    v36 = &v49;
    v15 = objc_msgSend(v33, "copy");
    v16 = (void *)v41[5];
    v41[5] = v15;

  }
  objc_msgSend((id)v50[5], "currentTouchPoint");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "CGPointValue");
  v19 = v18;
  v21 = v20;

  Current = CFAbsoluteTimeGetCurrent();
  v23 = *(double *)&sSystemUptimeFromAbsoluteTimeDiff;
  v24 = (void *)objc_msgSend((id)v50[5], "pathIndex");
  objc_initWeak(&location, a1[5]);
  objc_msgSend(a1[5], "taskQueue");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v2;
  v26[1] = 3221225472;
  v26[2] = __87__UIKeyboardLayout_recognizer_cancelTouchOnLayoutWithId_startPoint_endPoint_whenReady___block_invoke_5;
  v26[3] = &unk_1E16D6E18;
  v30 = &v40;
  objc_copyWeak(v31, &location);
  v27 = a1[6];
  v28 = a1[4];
  v31[1] = v19;
  v31[2] = v21;
  *(double *)&v31[3] = Current + v23;
  v31[4] = v24;
  v29 = a1[7];
  objc_msgSend(v25, "addTask:", v26);

  objc_destroyWeak(v31);
  objc_destroyWeak(&location);

  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v49, 8);

}

void __87__UIKeyboardLayout_recognizer_cancelTouchOnLayoutWithId_startPoint_endPoint_whenReady___block_invoke_2(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 616), "objectForKey:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __87__UIKeyboardLayout_recognizer_cancelTouchOnLayoutWithId_startPoint_endPoint_whenReady___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;

  v19 = a2;
  v5 = a3;
  if (objc_msgSend(v19, "phase") == 3 || objc_msgSend(v19, "phase") == 4)
  {
    if (objc_msgSend(v19, "phase") == 4
      || objc_msgSend(*(id *)(a1 + 32), "_handRestRecognizerCancelShouldBeEnd"))
    {
      v6 = objc_msgSend(v5, "copy");
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v8 = *(void **)(v7 + 40);
      *(_QWORD *)(v7 + 40) = v6;
    }
    else
    {
      v9 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v19, "timestamp");
      v11 = v10;
      v12 = *(void **)(a1 + 32);
      objc_msgSend(v19, "locationInWindow");
      objc_msgSend(v12, "convertPoint:fromView:", 0);
      +[UIKBTouchState touchStateForTouchUUID:withTimestamp:phase:location:pathIndex:inView:](UIKBTouchState, "touchStateForTouchUUID:withTimestamp:phase:location:pathIndex:inView:", v9, 4, objc_msgSend(v19, "pathIndex"), *(_QWORD *)(a1 + 32), v11, v13, v14);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "touchCancelledTaskForTouchState:forResting:", v8, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "copy");
      v17 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v18 = *(void **)(v17 + 40);
      *(_QWORD *)(v17 + 40) = v16;

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "taskQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addTask:", v5);
  }

}

void __87__UIKeyboardLayout_recognizer_cancelTouchOnLayoutWithId_startPoint_endPoint_whenReady___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  CFAbsoluteTime v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  id v10;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  v5 = CFAbsoluteTimeGetCurrent() + *(double *)&sSystemUptimeFromAbsoluteTimeDiff;
  v6 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "currentTouchPoint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "CGPointValue");
  objc_msgSend(v6, "convertPoint:fromView:", 0);
  +[UIKBTouchState touchStateForTouchUUID:withTimestamp:phase:location:pathIndex:inView:](UIKBTouchState, "touchStateForTouchUUID:withTimestamp:phase:location:pathIndex:inView:", v3, 4, objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "pathIndex"), *(_QWORD *)(a1 + 40), v5, v8, v9);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "touchCancelled:forResting:executionContext:", v10, 0, v4);
}

void __87__UIKeyboardLayout_recognizer_cancelTouchOnLayoutWithId_startPoint_endPoint_whenReady___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  id v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;

  v3 = a2;
  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __87__UIKeyboardLayout_recognizer_cancelTouchOnLayoutWithId_startPoint_endPoint_whenReady___block_invoke_6;
  v6[3] = &unk_1E16D6DF0;
  objc_copyWeak(&v10, (id *)(a1 + 64));
  v7 = *(id *)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v11 = *(_OWORD *)(a1 + 72);
  v12 = *(_QWORD *)(a1 + 88);
  v13 = *(_QWORD *)(a1 + 96);
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v3, "childWithContinuation:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  objc_destroyWeak(&v10);
}

void __87__UIKeyboardLayout_recognizer_cancelTouchOnLayoutWithId_startPoint_endPoint_whenReady___block_invoke_6(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id *WeakRetained;
  uint64_t v6;
  NSObject *v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  id v17;
  _QWORD block[5];
  id v19;

  v3 = (id *)(a1 + 56);
  v4 = a2;
  WeakRetained = (id *)objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained[55], "removeObject:", *(_QWORD *)(a1 + 32));
  objc_msgSend(WeakRetained[79], "removeObject:", *(_QWORD *)(a1 + 32));
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87__UIKeyboardLayout_recognizer_cancelTouchOnLayoutWithId_startPoint_endPoint_whenReady___block_invoke_7;
  block[3] = &unk_1E16B1B50;
  block[4] = WeakRetained;
  v7 = *(NSObject **)(a1 + 40);
  v19 = *(id *)(a1 + 32);
  dispatch_sync(v7, block);
  v8 = *(double *)(a1 + 80);
  v9 = *(unsigned int *)(a1 + 88);
  v10 = *(_QWORD *)(a1 + 32);
  v12 = v6;
  v13 = 3221225472;
  v14 = __87__UIKeyboardLayout_recognizer_cancelTouchOnLayoutWithId_startPoint_endPoint_whenReady___block_invoke_8;
  v15 = &unk_1E16BB6B8;
  v17 = *(id *)(a1 + 48);
  v16 = *(id *)(a1 + 32);
  objc_msgSend(v4, "childWithContinuation:", &v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "handRestRecognizerNotifyRestForBegin:location:timestamp:pathIndex:touchUUID:context:", 0, v9, v10, v11, *(double *)(a1 + 64), *(double *)(a1 + 72), v8, v12, v13, v14, v15);
}

uint64_t __87__UIKeyboardLayout_recognizer_cancelTouchOnLayoutWithId_startPoint_endPoint_whenReady___block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 616), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
}

void __87__UIKeyboardLayout_recognizer_cancelTouchOnLayoutWithId_startPoint_endPoint_whenReady___block_invoke_8(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t, uint64_t);
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v4 = *(void (**)(uint64_t, uint64_t))(v2 + 16);
  v5 = a2;
  v4(v2, v3);
  objc_msgSend(v5, "returnExecutionToParent");

}

- (void)resetHRRLayoutState
{
  NSObject *deferredTouchTaskListsQueue;
  _QWORD block[5];

  -[_UIKBRTRecognizer reset](self->_handRestRecognizer, "reset");
  deferredTouchTaskListsQueue = self->_deferredTouchTaskListsQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__UIKeyboardLayout_resetHRRLayoutState__block_invoke;
  block[3] = &unk_1E16B1B28;
  block[4] = self;
  dispatch_sync(deferredTouchTaskListsQueue, block);
  -[_UIKBRTFingerDetection reset](self->_fingerDetection, "reset");
  -[_UIKBRTTouchDrifting reset](self->_touchDrifting, "reset");
}

uint64_t __39__UIKeyboardLayout_resetHRRLayoutState__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CFAbsoluteTime v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  uint64_t v21;
  uint64_t v23;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v23 = 632;
  obj = *(id *)(*(_QWORD *)(a1 + 32) + 632);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v30 != v4)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 616), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i), v23);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = *(void **)(a1 + 32);
        objc_msgSend(v6, "currentTouchPoint");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "CGPointValue");
        v10 = v9;
        v12 = v11;
        v13 = CFAbsoluteTimeGetCurrent() + *(double *)&sSystemUptimeFromAbsoluteTimeDiff;
        v14 = objc_msgSend(v6, "pathIndex");
        objc_msgSend(v6, "touchUUID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "handRestRecognizerNotifyRestForBegin:location:timestamp:pathIndex:touchUUID:context:", 0, v14, v15, 0, v10, v12, v13);

      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v3);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 616), "allKeys");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v26;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v26 != v19)
          objc_enumerationMutation(v16);
        v21 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * j);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 552), "removeTouchWithIdentifier:touchCancelled:", v21, 1, v23);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 608), "removeTouchWithIdentifier:touchCancelled:", v21, 1);
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v18);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + v23), "removeAllObjects");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 616), "removeAllObjects");
}

- (BOOL)_shouldAllowKeyboardHandlingIfNecessaryForTouch:(id)a3 phase:(int64_t)a4 withTouchState:(id)a5 task:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *deferredTouchTaskListsQueue;
  id v16;
  void *v17;
  BOOL v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  _UIKBRTFingerDetection *fingerDetection;
  void *v36;
  _UIKBRTTouchDrifting *touchDrifting;
  void *v38;
  _UIKBRTFingerDetection *v39;
  void *v40;
  _UIKBRTTouchDrifting *v41;
  void *v42;
  uint64_t v44;
  uint64_t v45;
  void (*v46)(uint64_t);
  void *v47;
  UIKeyboardLayout *v48;
  id v49;
  uint64_t *v50;
  int64_t v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  id v57;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (-[UIKeyboardLayout isExecutingDeferredTouchTasks](self, "isExecutingDeferredTouchTasks")
    || (-[UIKeyboardLayout handRestRecognizer](self, "handRestRecognizer"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v13,
        !v13))
  {
    v18 = 1;
  }
  else
  {
    +[UIKBTouchStateTask touchStateTaskForTouchState:andTask:](UIKBTouchStateTask, "touchStateTaskForTouchState:andTask:", v11, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = 0;
    v53 = &v52;
    v54 = 0x3032000000;
    v55 = __Block_byref_object_copy__132;
    v56 = __Block_byref_object_dispose__132;
    v57 = 0;
    deferredTouchTaskListsQueue = self->_deferredTouchTaskListsQueue;
    v44 = MEMORY[0x1E0C809B0];
    v45 = 3221225472;
    v46 = __94__UIKeyboardLayout__shouldAllowKeyboardHandlingIfNecessaryForTouch_phase_withTouchState_task___block_invoke;
    v47 = &unk_1E16BCCD0;
    v50 = &v52;
    v48 = self;
    v16 = v11;
    v49 = v16;
    v51 = a4;
    dispatch_sync(deferredTouchTaskListsQueue, &v44);
    v17 = (void *)v53[5];
    v18 = v17 == 0;
    if (v17)
    {
      objc_msgSend(v17, "addTask:", v14, v44, v45, v46, v47, v48);
      switch(a4)
      {
        case 0:
          -[UIKeyboardLayout handRestRecognizer](self, "handRestRecognizer");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "touchUUID");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "touchDown:withIdentifier:canLogTouch:", v10, v31, -[UITextInputTraits isSecureTextEntry](self->_inputTraits, "isSecureTextEntry") ^ 1);
          goto LABEL_10;
        case 1:
        case 2:
          -[UIKeyboardLayout handRestRecognizer](self, "handRestRecognizer");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "touchUUID");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "touchDragged:withIdentifier:", v10, v20);

          objc_msgSend(v16, "locationInWindow");
          -[UIView convertPoint:fromView:](self, "convertPoint:fromView:", 0);
          v22 = v21;
          v24 = v23;
          -[UIKeyboardLayout fingerDetection](self, "fingerDetection");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "touchUUID");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "pathMajorRadius");
          v28 = v27;
          objc_msgSend(v16, "timestamp");
          objc_msgSend(v25, "moveTouchWithIdentifier:toLocation:withRadius:atTouchTime:", v26, v22, v24, v28, v29);

          -[UIKeyboardLayout touchDrifting](self, "touchDrifting");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "touchUUID");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "pathMajorRadius");
          v33 = v32;
          objc_msgSend(v16, "timestamp");
          objc_msgSend(v30, "moveTouchWithIdentifier:toLocation:withRadius:atTouchTime:", v31, v22, v24, v33, v34);
          goto LABEL_10;
        case 3:
          fingerDetection = self->_fingerDetection;
          objc_msgSend(v16, "touchUUID");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UIKBRTFingerDetection removeTouchWithIdentifier:touchCancelled:](fingerDetection, "removeTouchWithIdentifier:touchCancelled:", v36, 0);

          touchDrifting = self->_touchDrifting;
          objc_msgSend(v16, "touchUUID");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UIKBRTTouchDrifting removeTouchWithIdentifier:touchCancelled:](touchDrifting, "removeTouchWithIdentifier:touchCancelled:", v38, 0);

          -[UIKeyboardLayout handRestRecognizer](self, "handRestRecognizer");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "touchUUID");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "touchUp:withIdentifier:", v10, v31);
          goto LABEL_10;
        case 4:
          v39 = self->_fingerDetection;
          objc_msgSend(v16, "touchUUID");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UIKBRTFingerDetection removeTouchWithIdentifier:touchCancelled:](v39, "removeTouchWithIdentifier:touchCancelled:", v40, 1);

          v41 = self->_touchDrifting;
          objc_msgSend(v16, "touchUUID");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UIKBRTTouchDrifting removeTouchWithIdentifier:touchCancelled:](v41, "removeTouchWithIdentifier:touchCancelled:", v42, 1);

          -[UIKeyboardLayout handRestRecognizer](self, "handRestRecognizer");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "touchUUID");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "touchCancelled:withIdentifier:", v10, v31);
LABEL_10:

          break;
        default:
          break;
      }
    }

    _Block_object_dispose(&v52, 8);
  }

  return v18;
}

void __94__UIKeyboardLayout__shouldAllowKeyboardHandlingIfNecessaryForTouch_phase_withTouchState_task___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
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
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  id v30;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 616);
  objc_msgSend(*(id *)(a1 + 40), "touchUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) && !*(_QWORD *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 40), "touchUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKBTouchOrderedTaskList taskListForTouchUUID:withPathIndex:](UIKBTouchOrderedTaskList, "taskListForTouchUUID:withPathIndex:", v7, objc_msgSend(*(id *)(a1 + 40), "pathIndex"));
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    v11 = *(void **)(*(_QWORD *)(a1 + 32) + 616);
    v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    objc_msgSend(*(id *)(a1 + 40), "touchUUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v12, v13);

    v14 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "locationInWindow");
    objc_msgSend(v14, "convertPoint:fromView:", 0);
    v16 = v15;
    v18 = v17;
    v19 = *(void **)(*(_QWORD *)(a1 + 32) + 552);
    objc_msgSend(*(id *)(a1 + 40), "pathMajorRadius");
    v21 = v20;
    objc_msgSend(*(id *)(a1 + 40), "timestamp");
    v23 = v22;
    objc_msgSend(*(id *)(a1 + 40), "touchUUID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addTouchLocation:withRadius:withTouchTime:withIdentifier:", v24, v16, v18, v21, v23);

    v25 = *(void **)(*(_QWORD *)(a1 + 32) + 608);
    objc_msgSend(*(id *)(a1 + 40), "pathMajorRadius");
    v27 = v26;
    objc_msgSend(*(id *)(a1 + 40), "timestamp");
    v29 = v28;
    objc_msgSend(*(id *)(a1 + 40), "touchUUID");
    v30 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addTouchLocation:withRadius:withTouchTime:withIdentifier:", v30, v16, v18, v27, v29);

  }
}

- (void)_clearDeferredTouchTasks
{
  -[UIKeyboardLayout setDeferredTouchDownTask:](self, "setDeferredTouchDownTask:", 0);
  -[UIKeyboardLayout setDeferredTouchMovedTask:](self, "setDeferredTouchMovedTask:", 0);
}

- (void)_executeDeferredTouchTasks
{
  id deferredTouchDownTask;
  void (**v4)(_QWORD);
  id deferredTouchMovedTask;
  void (**v6)(_QWORD);

  -[UIKeyboardLayout setIsExecutingDeferredTouchTasks:](self, "setIsExecutingDeferredTouchTasks:", 1);
  deferredTouchDownTask = self->_deferredTouchDownTask;
  if (deferredTouchDownTask)
  {
    v4 = (void (**)(_QWORD))objc_msgSend(deferredTouchDownTask, "copy");
    -[UIKeyboardLayout setDeferredTouchDownTask:](self, "setDeferredTouchDownTask:", 0);
    v4[2](v4);

  }
  deferredTouchMovedTask = self->_deferredTouchMovedTask;
  if (deferredTouchMovedTask)
  {
    v6 = (void (**)(_QWORD))objc_msgSend(deferredTouchMovedTask, "copy");
    -[UIKeyboardLayout setDeferredTouchMovedTask:](self, "setDeferredTouchMovedTask:", 0);
    v6[2](v6);

  }
  -[UIKeyboardLayout setIsExecutingDeferredTouchTasks:](self, "setIsExecutingDeferredTouchTasks:", 0);
}

- (void)_addTouchToScreenEdgePanRecognizer:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  uint64_t v14;
  id v15;

  v4 = a3;
  -[UIKeyboardLayout screenEdgePanRecognizer](self, "screenEdgePanRecognizer");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_locationInSceneReferenceSpace");
  v6 = v5;
  v8 = v7;
  objc_msgSend(v4, "timestamp");
  v10 = v9;
  v11 = objc_msgSend(v4, "_edgeType");
  v12 = objc_msgSend(v4, "_edgeAim");
  v13 = -[UIKBScreenTraits orientation](self->_screenTraits, "orientation");
  if ((objc_msgSend(v4, "_edgeForcePending") & 1) != 0)
  {
    v14 = 1;
  }
  else if (objc_msgSend(v4, "_edgeForceActive"))
  {
    v14 = 2;
  }
  else
  {
    v14 = 0;
  }
  if ((unint64_t)(v11 - 1) >= 4)
    v11 = 0;

  objc_msgSend(v15, "incorporateTouchSampleAtLocation:timestamp:modifier:region:interfaceOrientation:forceState:", v11, (v12 >> 1) & 1 | (4 * (v12 & 1)) & 0xF7 | (8 * ((v12 >> 2) & 1)) | (v12 >> 2) & 2, v13, v14, v6, v8, v10);
}

- (void)assertSavedLocation:(CGPoint)a3 onTouch:(id)a4 inWindow:(id)a5 resetPrevious:(BOOL)a6
{
  _BOOL8 v6;
  double y;
  double x;
  id v10;
  void *v11;
  double v12;
  double v13;
  id v14;

  v6 = a6;
  y = a3.y;
  x = a3.x;
  v14 = a4;
  v10 = a5;
  objc_msgSend(v14, "window");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(v10, "convertPoint:toWindow:", 0, x, y);
    x = v12;
    y = v13;
  }
  objc_msgSend(v14, "_setLocationInWindow:resetPrevious:", v6, x, y);

}

- (BOOL)_shouldAllowKeyboardHandlingForTouchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  BOOL v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  id v27[3];
  id location;

  v6 = a3;
  v7 = a4;
  if (!-[UIKeyboardLayout canHandleEvent:](self, "canHandleEvent:", v7))
    goto LABEL_12;
  if (!-[UIKeyboardLayout isExecutingDeferredTouchTasks](self, "isExecutingDeferredTouchTasks"))
  {
    if (!self->_deferredTouchDownTask)
      goto LABEL_16;
    -[UIKeyboardLayout screenEdgePanRecognizer](self, "screenEdgePanRecognizer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "state");

    if (!v9)
    {
      -[UIKeyboardLayout _executeDeferredTouchTasks](self, "_executeDeferredTouchTasks");
      goto LABEL_10;
    }
    if (!self->_deferredTouchDownTask)
    {
LABEL_16:
      if (-[UIKeyboardLayout _canAddTouchesToScreenGestureRecognizer:](self, "_canAddTouchesToScreenGestureRecognizer:", v6))
      {
        objc_msgSend(v6, "anyObject");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIKeyboardLayout _addTouchToScreenEdgePanRecognizer:](self, "_addTouchToScreenEdgePanRecognizer:", v10);
        -[UIKeyboardLayout screenEdgePanRecognizer](self, "screenEdgePanRecognizer");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "state");

        if (v12)
        {

          goto LABEL_10;
        }
        objc_msgSend(v10, "locationInView:", 0);
        v15 = v14;
        v17 = v16;
        objc_msgSend(v10, "window");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_initWeak(&location, self);
        v22[0] = MEMORY[0x1E0C809B0];
        v22[1] = 3221225472;
        v22[2] = __74__UIKeyboardLayout__shouldAllowKeyboardHandlingForTouchesBegan_withEvent___block_invoke;
        v22[3] = &unk_1E16D6E40;
        objc_copyWeak(v27, &location);
        v27[1] = v15;
        v27[2] = v17;
        v19 = v10;
        v23 = v19;
        v20 = v18;
        v24 = v20;
        v25 = v6;
        v26 = v7;
        -[UIKeyboardLayout setDeferredTouchDownTask:](self, "setDeferredTouchDownTask:", v22);

        objc_destroyWeak(v27);
        objc_destroyWeak(&location);

LABEL_12:
        v13 = 0;
        goto LABEL_13;
      }
    }
  }
LABEL_10:
  v13 = 1;
LABEL_13:

  return v13;
}

void __74__UIKeyboardLayout__shouldAllowKeyboardHandlingForTouchesBegan_withEvent___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "assertSavedLocation:onTouch:inWindow:resetPrevious:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 1, *(double *)(a1 + 72), *(double *)(a1 + 80));
  objc_msgSend(WeakRetained, "touchesBegan:withEvent:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

- (BOOL)_shouldAllowKeyboardHandlingForTouchesMoved:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  BOOL v19;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;
  id v26[3];
  id location;

  v6 = a3;
  v7 = a4;
  if (!-[UIKeyboardLayout canHandleEvent:](self, "canHandleEvent:", v7))
    goto LABEL_10;
  if (-[UIKeyboardLayout isExecutingDeferredTouchTasks](self, "isExecutingDeferredTouchTasks")
    || !self->_deferredTouchDownTask
    || !-[UIKeyboardLayout _canAddTouchesToScreenGestureRecognizer:](self, "_canAddTouchesToScreenGestureRecognizer:", v6))
  {
LABEL_12:
    v19 = 1;
    goto LABEL_13;
  }
  objc_msgSend(v6, "anyObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardLayout _addTouchToScreenEdgePanRecognizer:](self, "_addTouchToScreenEdgePanRecognizer:", v8);
  -[UIKeyboardLayout screenEdgePanRecognizer](self, "screenEdgePanRecognizer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "state");

  if (!v10)
  {
    objc_msgSend(v8, "locationInView:", 0);
    v14 = v13;
    v16 = v15;
    objc_msgSend(v8, "window");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __74__UIKeyboardLayout__shouldAllowKeyboardHandlingForTouchesMoved_withEvent___block_invoke;
    v21[3] = &unk_1E16D6E40;
    objc_copyWeak(v26, &location);
    v26[1] = v14;
    v26[2] = v16;
    v22 = v8;
    v18 = v17;
    v23 = v18;
    v24 = v6;
    v25 = v7;
    -[UIKeyboardLayout setDeferredTouchMovedTask:](self, "setDeferredTouchMovedTask:", v21);

    objc_destroyWeak(v26);
    objc_destroyWeak(&location);

    goto LABEL_9;
  }
  -[UIKeyboardLayout screenEdgePanRecognizer](self, "screenEdgePanRecognizer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "state");

  if (v12 != 1)
  {

    goto LABEL_12;
  }
  -[UIKeyboardLayout _clearDeferredTouchTasks](self, "_clearDeferredTouchTasks");
LABEL_9:

LABEL_10:
  v19 = 0;
LABEL_13:

  return v19;
}

void __74__UIKeyboardLayout__shouldAllowKeyboardHandlingForTouchesMoved_withEvent___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "assertSavedLocation:onTouch:inWindow:resetPrevious:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0, *(double *)(a1 + 72), *(double *)(a1 + 80));
  objc_msgSend(WeakRetained, "touchesMoved:withEvent:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

- (BOOL)_shouldAllowKeyboardHandlingForTouchesEndedOrCancelled:(id)a3 withEvent:(id)a4
{
  _BOOL4 v5;
  void *v6;
  uint64_t v7;

  v5 = -[UIKeyboardLayout canHandleEvent:](self, "canHandleEvent:", a4);
  if (v5)
  {
    -[UIKeyboardLayout screenEdgePanRecognizer](self, "screenEdgePanRecognizer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "state");

    if (!v7)
      -[UIKeyboardLayout _executeDeferredTouchTasks](self, "_executeDeferredTouchTasks");
  }
  return v5;
}

- (void)_resetFingerDetectionFromLayout
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;

  -[UIKeyboardLayout handRestRecognizerStandardKeyPixelSize](self, "handRestRecognizerStandardKeyPixelSize");
  v4 = v3;
  v6 = v5;
  -[UIKeyboardLayout getCenterForKeyUnderLeftIndexFinger](self, "getCenterForKeyUnderLeftIndexFinger");
  v8 = v7;
  v10 = v9;
  -[UIKeyboardLayout getCenterForKeyUnderRightIndexFinger](self, "getCenterForKeyUnderRightIndexFinger");
  v12 = v11;
  v14 = v13;
  v24 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[UIKeyboardLayout getHorizontalOffsetFromHomeRowForRowRelativeToHomeRow:](self, "getHorizontalOffsetFromHomeRowForRowRelativeToHomeRow:", -1);
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = (void *)v15;
    v17 = -2;
    do
    {
      objc_msgSend(v24, "insertObject:atIndex:", v16, 0);

      -[UIKeyboardLayout getHorizontalOffsetFromHomeRowForRowRelativeToHomeRow:](self, "getHorizontalOffsetFromHomeRowForRowRelativeToHomeRow:", v17);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      --v17;
    }
    while (v16);
  }
  v18 = objc_msgSend(v24, "count");
  objc_msgSend(v24, "addObject:", &unk_1E1A98EE0);
  -[UIKeyboardLayout getHorizontalOffsetFromHomeRowForRowRelativeToHomeRow:](self, "getHorizontalOffsetFromHomeRowForRowRelativeToHomeRow:", 1);
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = (void *)v19;
    v21 = 2;
    do
    {
      objc_msgSend(v24, "addObject:", v20);

      -[UIKeyboardLayout getHorizontalOffsetFromHomeRowForRowRelativeToHomeRow:](self, "getHorizontalOffsetFromHomeRowForRowRelativeToHomeRow:", v21);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      ++v21;
    }
    while (v20);
  }
  -[UIKeyboardLayout fingerDetection](self, "fingerDetection");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "updateWithFCenter:jCenter:keySize:rowOffsets:homeRowOffsetIndex:", v24, v18, v8, v10, v12, v14, v4, v6);

  -[UIKeyboardLayout touchDrifting](self, "touchDrifting");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "updateWithFCenter:jCenter:keySize:rowOffsets:homeRowOffsetIndex:", v24, v18, v8, v10, v12, v14, v4, v6);

}

void __58__UIKeyboardLayout_updateTouchProcessingForKeyboardChange__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v7 = a2;
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 != v5)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __58__UIKeyboardLayout_updateTouchProcessingForKeyboardChange__block_invoke_3;
    v8[3] = &unk_1E16D6E68;
    v9 = *(id *)(a1 + 32);
    objc_msgSend(v5, "removeTasksMatchingFilter:", v8);
    if ((objc_msgSend(v5, "hasTasks") & 1) == 0)
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);

  }
}

uint64_t __58__UIKeyboardLayout_updateTouchProcessingForKeyboardChange__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  if ((objc_msgSend(v3, "isBusy") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "insertObject:atIndex:", v3, objc_msgSend(*(id *)(a1 + 32), "indexOfObject:inSortedRange:options:usingComparator:", v3, 0, objc_msgSend(*(id *)(a1 + 32), "count"), 1024, &__block_literal_global_207_0));
  v4 = objc_msgSend(v3, "isBusy") ^ 1;

  return v4;
}

uint64_t __58__UIKeyboardLayout_updateTouchProcessingForKeyboardChange__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

void __58__UIKeyboardLayout_updateTouchProcessingForKeyboardChange__block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "taskQueue");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "task");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "addTask:", v4);
}

- (BOOL)_canAddTouchesToScreenGestureRecognizer:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  BOOL v10;
  void *v11;
  void *v12;
  BOOL v13;

  v4 = a3;
  if (objc_msgSend(v4, "count") == 1)
  {
    objc_msgSend(v4, "anyObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardLayout lastTouchUpTime](self, "lastTouchUpTime");
    if (v6 == 0.0
      || (objc_msgSend(v5, "timestamp"),
          v8 = v7,
          -[UIKeyboardLayout lastTouchUpTime](self, "lastTouchUpTime"),
          v8 - v9 >= 0.15))
    {
      -[UIKeyboardLayout screenEdgePanRecognizer](self, "screenEdgePanRecognizer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        -[UIKeyboardLayout screenEdgePanRecognizer](self, "screenEdgePanRecognizer");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "state") != 2;

      }
      else
      {
        v13 = 0;
      }

      if (-[NSMutableArray count](self->_uncommittedTouchUUIDs, "count"))
        v10 = 0;
      else
        v10 = v13;
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)screenEdgePanRecognizerStateDidChange:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "state") == 1)
  {
    -[UIKeyboardLayout _clearDeferredTouchTasks](self, "_clearDeferredTouchTasks");
  }
  else if (objc_msgSend(v4, "state") == 2)
  {
    -[UIKeyboardLayout _executeDeferredTouchTasks](self, "_executeDeferredTouchTasks");
  }

}

- (unsigned)getHandRestRecognizerState
{
  return 0;
}

- (BOOL)handRestRecognizerShouldNeverIgnoreTouchState:(id)a3 fromPoint:(CGPoint)a4 toPoint:(CGPoint)a5 forRestingState:(unint64_t)a6 otherRestedTouchLocations:(id)a7
{
  return 0;
}

- (CGSize)handRestRecognizerStandardKeyPixelSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 0.0;
  v3 = 0.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)handRestRecognizerSilenceNextTouchDown
{
  return 0;
}

- (void)handRestRecognizerNotifyRestForBegin:(BOOL)a3 location:(CGPoint)a4 timestamp:(double)a5 pathIndex:(int)a6 touchUUID:(id)a7 context:(id)a8
{
  objc_msgSend(a8, "returnExecutionToParent", a3, *(_QWORD *)&a6, a7, a4.x, a4.y, a5);
}

- (CGPoint)getCenterForKeyUnderLeftIndexFinger
{
  double v2;
  double v3;
  CGPoint result;

  v2 = *MEMORY[0x1E0C9D538];
  v3 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)getCenterForKeyUnderRightIndexFinger
{
  double v2;
  double v3;
  CGPoint result;

  v2 = *MEMORY[0x1E0C9D538];
  v3 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  result.y = v3;
  result.x = v2;
  return result;
}

- (id)getHorizontalOffsetFromHomeRowForRowRelativeToHomeRow:(int64_t)a3
{
  return 0;
}

- (void)_updateTouchState:(id)a3 errorVector:(CGPoint)a4 rowOffsetFromHomeRow:(int64_t)a5
{
  _UIKBRTTouchDrifting *touchDrifting;
  double y;
  double x;
  id v9;
  double v10;
  double v11;
  id v12;

  touchDrifting = self->_touchDrifting;
  if (touchDrifting)
  {
    y = a4.y;
    x = a4.x;
    v9 = a3;
    objc_msgSend(v9, "touchUUID");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timestamp");
    v11 = v10;

    -[_UIKBRTTouchDrifting updateTouchWithIdentifier:withTouchTime:resultingError:rowOffsetFromHomeRow:](touchDrifting, "updateTouchWithIdentifier:withTouchTime:resultingError:rowOffsetFromHomeRow:", v12, a5, v11, x, y);
  }
}

- (void)_ignoreTouchState:(id)a3
{
  _UIKBRTTouchDrifting *touchDrifting;
  id v4;
  double v5;
  double v6;
  id v7;

  touchDrifting = self->_touchDrifting;
  if (touchDrifting)
  {
    v4 = a3;
    objc_msgSend(v4, "touchUUID");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timestamp");
    v6 = v5;

    -[_UIKBRTTouchDrifting ignoreTouchWithIdentifier:withTouchTime:](touchDrifting, "ignoreTouchWithIdentifier:withTouchTime:", v7, v6);
  }
}

- (BOOL)_hasRelatedTouchesForTouchState:(id)a3
{
  _UIKBRTFingerDetection *fingerDetection;
  void *v4;
  void *v5;

  fingerDetection = self->_fingerDetection;
  if (fingerDetection)
  {
    objc_msgSend(a3, "touchUUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIKBRTFingerDetection fingerIdsRelatedToTouchWithIdentifier:sinceTimestamp:includeThumbs:](fingerDetection, "fingerIdsRelatedToTouchWithIdentifier:sinceTimestamp:includeThumbs:", v4, 0, 0.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    LOBYTE(fingerDetection) = objc_msgSend(v5, "count") != 0;
  }
  return (char)fingerDetection;
}

- (BOOL)_handRestRecognizerCancelShouldBeEnd
{
  return 0;
}

- (void)_uikbrtTouchDriftingStateChanged:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UIKeyboardLayout touchDrifting](self, "touchDrifting");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
    -[UIKeyboardLayout setNeedsVirtualDriftUpdate](self, "setNeedsVirtualDriftUpdate");
}

- (unint64_t)_uikbrtTouchDrifting:(id)a3 fingerIDFortouchIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  unint64_t v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  -[UIKeyboardLayout touchDrifting](self, "touchDrifting");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v7)
  {
    -[UIKeyboardLayout fingerDetection](self, "fingerDetection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v10, "fingerIdForTouchWithIdentifier:", v6);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_uikbrtTouchDrifting:(id)a3 touchIdentifiersForFingerID:(unint64_t)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a3;
  -[UIKeyboardLayout touchDrifting](self, "touchDrifting");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v6)
  {
    -[UIKeyboardLayout fingerDetection](self, "fingerDetection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "touchIdentifiersForFingerId:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (CGPoint)_uikbrtTouchDrifting:(id)a3 touchCenterForFingerID:(unint64_t)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGPoint result;

  v6 = a3;
  -[UIKeyboardLayout touchDrifting](self, "touchDrifting");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v6)
  {
    -[UIKeyboardLayout fingerDetection](self, "fingerDetection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "touchLocationForFingerId:", a4);
    v8 = v11;
    v9 = v12;

  }
  else
  {
    v8 = *MEMORY[0x1E0C9D538];
    v9 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }
  v13 = v8;
  v14 = v9;
  result.y = v14;
  result.x = v13;
  return result;
}

- (unint64_t)fingerIDForTouchUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;

  v4 = a3;
  -[UIKeyboardLayout fingerDetection](self, "fingerDetection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5
    && (-[UIKeyboardLayout fingerDetection](self, "fingerDetection"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "fingerIdForTouchWithIdentifier:", v4),
        v6,
        (unint64_t)(v7 - 1) <= 0xB))
  {
    v8 = qword_1866813C8[v7 - 1];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)targetEdgesForScreenGestureRecognition
{
  return 0;
}

- (BOOL)canHandleEvent:(id)a3
{
  return objc_msgSend(a3, "type") == 0;
}

- (BOOL)canHandlePresses:(id)a3 withEvent:(id)a4
{
  return -[UIKeyboardLayout canHandleEvent:](self, "canHandleEvent:", a4);
}

- (void)setDisableInteraction:(BOOL)a3
{
  self->_disableInteraction = a3;
  -[UIView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", !a3);
}

- (void)setPreferredHeight:(double)a3
{
  self->_preferredHeight = a3;
  self->_hasPreferredHeight = 1;
}

- (double)hitBuffer
{
  return 0.0;
}

- (double)flickDistance
{
  uint64_t SafeDeviceIdiom;
  double result;

  SafeDeviceIdiom = UIKeyboardGetSafeDeviceIdiom();
  result = 10.0;
  if ((SafeDeviceIdiom & 0xFFFFFFFFFFFFFFFBLL) == 1)
    return 30.0;
  return result;
}

- (CGRect)dragGestureRectInView:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect v17;
  CGRect result;

  v4 = a3;
  -[UIView bounds](self, "bounds");
  -[UIView convertRect:toView:](self, "convertRect:toView:", v4, v17.origin.x + v17.size.width + -80.0, CGRectGetMaxY(v17) + -80.0, 80.0, 80.0);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (CGRect)frameForKeylayoutName:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = *MEMORY[0x1E0C9D648];
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (SEL)handlerForNotification:(id)a3
{
  return 0;
}

- (void)fadeWithInvocation:(id)a3
{
  objc_msgSend(a3, "start");
}

- (BOOL)shouldFadeFromLayout
{
  return 0;
}

- (BOOL)shouldFadeToLayout
{
  return 0;
}

- (void)willBeginIndirectSelectionGesture
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("UIKeyboardWillBeginIndirectSelectionGestureNotification"), 0, 0);

}

- (void)didEndIndirectSelectionGesture
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("UIKeyboardDidEndIndirectSelectionGestureNotification"), 0, 0);

}

- (void)cancelTouchesForTwoFingerTapGesture:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSMutableSet *touchIgnoredUUIDSet;
  void *v16;
  NSMutableArray *uncommittedTouchUUIDs;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    -[UIKeyboardLayout handRestRecognizer](self, "handRestRecognizer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      v35 = v4;
      v6 = v4;
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v37;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v37 != v9)
              objc_enumerationMutation(v6);
            v11 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
            +[UIKBTouchState touchStateForTouch:](UIKBTouchState, "touchStateForTouch:", v11);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = v12;
            if (v12)
            {
              v14 = 632;
              touchIgnoredUUIDSet = self->_touchIgnoredUUIDSet;
              objc_msgSend(v12, "touchUUID");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(touchIgnoredUUIDSet) = -[NSMutableSet containsObject:](touchIgnoredUUIDSet, "containsObject:", v16);

              if ((_DWORD)touchIgnoredUUIDSet
                || (v14 = 440,
                    uncommittedTouchUUIDs = self->_uncommittedTouchUUIDs,
                    objc_msgSend(v13, "touchUUID"),
                    v18 = (void *)objc_claimAutoreleasedReturnValue(),
                    LODWORD(uncommittedTouchUUIDs) = -[NSMutableArray containsObject:](uncommittedTouchUUIDs, "containsObject:", v18), v18, (_DWORD)uncommittedTouchUUIDs))
              {
                v19 = *(Class *)((char *)&self->super.super.super.isa + v14);
                objc_msgSend(v13, "touchUUID");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "removeObject:", v20);

                -[UIKeyboardLayout handRestRecognizer](self, "handRestRecognizer");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v13, "touchUUID");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v21, "markTouchProcessed:withIdentifier:", v11, v22);

              }
              objc_msgSend(v13, "locationInWindow");
              -[UIView convertPoint:fromView:](self, "convertPoint:fromView:", 0);
              v24 = v23;
              v26 = v25;
              objc_msgSend(v13, "timestamp");
              v28 = v27;
              v29 = objc_msgSend(v13, "pathIndex");
              objc_msgSend(v13, "touchUUID");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              -[UIKeyboardLayout handRestRecognizerNotifyRestForBegin:location:timestamp:pathIndex:touchUUID:context:](self, "handRestRecognizerNotifyRestForBegin:location:timestamp:pathIndex:touchUUID:context:", 0, v29, v30, 0, v24, v26, v28);

              -[UIKeyboardLayout fingerDetection](self, "fingerDetection");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "touchUUID");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "removeTouchWithIdentifier:touchCancelled:", v32, 1);

              -[UIKeyboardLayout touchDrifting](self, "touchDrifting");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "touchUUID");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "removeTouchWithIdentifier:touchCancelled:", v34, 1);

            }
          }
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
        }
        while (v8);
      }

      v4 = v35;
    }
  }

}

- (int64_t)currentHandBias
{
  return 0;
}

- (double)biasedKeyboardWidthRatio
{
  return 1.0;
}

- (id)currentKeyplane
{
  return 0;
}

- (BOOL)_allowContinuousPathUI
{
  return 0;
}

- (BOOL)keyplaneContainsDismissKey
{
  return 0;
}

- (BOOL)keyplaneContainsEmojiKey
{
  return 0;
}

- (BOOL)isEmojiKeyplane
{
  return 0;
}

- (BOOL)supportsEmoji
{
  return 0;
}

- (BOOL)isResizing
{
  return 0;
}

- (BOOL)isResized
{
  return 0;
}

- (BOOL)isPossibleToTypeFast
{
  return 1;
}

- (BOOL)globeKeyDisplaysAsEmojiKey
{
  return 0;
}

- (BOOL)showsDedicatedEmojiKeyAlongsideGlobeButton
{
  return 0;
}

- (UIEdgeInsets)keyplanePadding
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  UIEdgeInsets result;

  -[UIKeyboardLayout currentKeyplane](self, "currentKeyplane");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView frame](self, "frame");
  v5 = v4;
  v7 = v6;
  objc_msgSend(v3, "keyUnionPaddedFrame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  if ((objc_msgSend(v3, "visualStyling") & 0xFF0000) == 0x90000)
    v16 = 0.0;
  else
    v16 = v11;

  v17 = v16;
  v18 = v9;
  v19 = v7 - v15 - v11;
  v20 = v5 - v13 - v9;
  result.right = v20;
  result.bottom = v19;
  result.left = v18;
  result.top = v17;
  return result;
}

- (id)internationalKeyDisplayStringOnEmojiKeyboard
{
  return 0;
}

- (BOOL)shouldAllowSelectionGestures:(BOOL)a3 atPoint:(CGPoint)a4 toBegin:(BOOL)a5
{
  BOOL result;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  void *v14;
  double v15;
  double v16;
  uint64_t v17;
  NSMutableSet *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *deferredTouchTaskListsQueue;
  void *v24;
  double v25;
  double v26;
  char v27;
  char v28;
  int v29;
  void *v30;
  BOOL v31;
  id *v32;
  id v33;
  void *v34;
  _QWORD v35[6];
  _QWORD block[7];
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  result = 1;
  if (a5 && !a3)
  {
    -[UIKeyboardLayout handRestRecognizer](self, "handRestRecognizer", a4.x, a4.y);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v49 = 0u;
      v50 = 0u;
      v47 = 0u;
      v48 = 0u;
      -[UIView gestureRecognizers](self, "gestureRecognizers");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
      if (v9)
      {
        v10 = *(_QWORD *)v48;
LABEL_6:
        v11 = 0;
        while (1)
        {
          if (*(_QWORD *)v48 != v10)
            objc_enumerationMutation(v8);
          v12 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * v11);
          if (objc_msgSend(v12, "_isGestureType:", 8))
          {
            if ((unint64_t)objc_msgSend(v12, "minimumNumberOfTouches") > 1)
              break;
          }
          if (v9 == ++v11)
          {
            v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
            if (v9)
              goto LABEL_6;
            goto LABEL_13;
          }
        }
        v32 = v12;

        if (!v32)
          return 1;
        v33 = v32[39];
        +[UIKBTouchState touchUUIDsForTouches:](UIKBTouchState, "touchUUIDsForTouches:");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "lastObject");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "timestamp");
        v16 = v15;

        v17 = objc_msgSend(v34, "count");
        if (v17 == objc_msgSend(v33, "count"))
        {
          v45 = 0u;
          v46 = 0u;
          v43 = 0u;
          v44 = 0u;
          v18 = self->_touchIgnoredUUIDSet;
          v19 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
          if (v19)
          {
            v20 = *(_QWORD *)v44;
            v13 = 1;
LABEL_19:
            v21 = 0;
            while (1)
            {
              if (*(_QWORD *)v44 != v20)
                objc_enumerationMutation(v18);
              v22 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * v21);
              v37 = 0;
              v38 = &v37;
              v39 = 0x3032000000;
              v40 = __Block_byref_object_copy__132;
              v41 = __Block_byref_object_dispose__132;
              v42 = 0;
              deferredTouchTaskListsQueue = self->_deferredTouchTaskListsQueue;
              block[0] = MEMORY[0x1E0C809B0];
              block[1] = 3221225472;
              block[2] = __65__UIKeyboardLayout_shouldAllowSelectionGestures_atPoint_toBegin___block_invoke;
              block[3] = &unk_1E16B9698;
              block[5] = v22;
              block[6] = &v37;
              block[4] = self;
              dispatch_sync(deferredTouchTaskListsQueue, block);
              v24 = (void *)v38[5];
              if (!v24)
                goto LABEL_27;
              objc_msgSend(v24, "originalStartTime");
              v26 = v25;
              v27 = objc_msgSend(v34, "containsObject:", v22);
              v28 = vabdd_f64(v26, v16) >= 0.05 ? 1 : v27;
              if ((v28 & 1) == 0)
              {
                v29 = 0;
                v13 = 0;
              }
              else
              {
LABEL_27:
                v29 = 1;
              }
              _Block_object_dispose(&v37, 8);

              if (!v29)
                break;
              if (v19 == ++v21)
              {
                v19 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
                if (v19)
                  goto LABEL_19;
                break;
              }
            }

            if (!v13)
              goto LABEL_39;
          }
          else
          {

            v13 = 1;
          }
          -[UIKeyboardLayout fingerDetection](self, "fingerDetection", v32);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = v30 == 0;

          if (!v31)
          {
            v37 = 0;
            v38 = &v37;
            v39 = 0x3032000000;
            v40 = __Block_byref_object_copy__132;
            v41 = __Block_byref_object_dispose__132;
            v42 = 0;
            v35[0] = MEMORY[0x1E0C809B0];
            v35[1] = 3221225472;
            v35[2] = __65__UIKeyboardLayout_shouldAllowSelectionGestures_atPoint_toBegin___block_invoke_2;
            v35[3] = &unk_1E16D6EE0;
            v35[4] = self;
            v35[5] = &v37;
            objc_msgSend(v33, "enumerateObjectsUsingBlock:", v35);
            objc_msgSend((id)v38[5], "removeObject:", &unk_1E1A98EF8);
            objc_msgSend((id)v38[5], "removeObject:", &unk_1E1A98F10);
            v13 = objc_msgSend((id)v38[5], "count") == 0;
            _Block_object_dispose(&v37, 8);

          }
        }
        else
        {
          v13 = 1;
        }
LABEL_39:

        v8 = v32;
        goto LABEL_40;
      }
LABEL_13:
      v13 = 1;
LABEL_40:

      return v13;
    }
    else
    {
      return 1;
    }
  }
  return result;
}

void __65__UIKeyboardLayout_shouldAllowSelectionGestures_atPoint_toBegin___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 616), "objectForKey:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __65__UIKeyboardLayout_shouldAllowSelectionGestures_atPoint_toBegin___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  +[UIKBTouchState touchStateForTouch:](UIKBTouchState, "touchStateForTouch:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v13 = v3;
    v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    objc_msgSend(*(id *)(a1 + 32), "fingerDetection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "touchUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v7 = objc_msgSend(v5, "fingerIdForTouchWithIdentifier:", v6);

      v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeObject:", v5);
    }
    else
    {
      objc_msgSend(v5, "fingerIdsRelatedToTouchWithIdentifier:sinceTimestamp:includeThumbs:", v6, 1, 0.0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "mutableCopy");
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v12 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v10;

    }
    v3 = v13;
  }

}

- (CGSize)stretchFactor
{
  double v2;
  double v3;
  CGSize result;

  v2 = 1.0;
  v3 = 1.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)shouldMergeAssistantBarWithKeyboardLayout
{
  return 0;
}

- (id)baseKeyForString:(id)a3
{
  return 0;
}

- (id)keyplaneForKey:(id)a3
{
  return 0;
}

- (id)keyplaneNamed:(id)a3
{
  return 0;
}

- (id)simulateTouch:(CGPoint)a3
{
  return &stru_1E16EDF20;
}

- (id)simulateTouchForCharacter:(id)a3 errorVector:(CGPoint)a4 shouldTypeVariants:(BOOL)a5 baseKeyForVariants:(BOOL)a6
{
  return &stru_1E16EDF20;
}

- (BOOL)hasActiveContinuousPathInput
{
  return 0;
}

- (BOOL)isHandwritingPlane
{
  return 0;
}

- (id)getRomanAccentVariantsForString:(id)a3 inputMode:(id)a4 keyboardVariantIndludes:(int)a5
{
  return UIKeyboardRomanAccentVariants((uint64_t)a3, a4, *(uint64_t *)&a5);
}

- (NSUUID)activeTouchUUID
{
  return self->_activeTouchUUID;
}

- (void)setActiveTouchUUID:(id)a3
{
  objc_storeStrong((id *)&self->_activeTouchUUID, a3);
}

- (NSUUID)shiftKeyTouchUUID
{
  return self->_shiftKeyTouchUUID;
}

- (double)preferredHeight
{
  return self->_preferredHeight;
}

- (BOOL)hideKeysUnderIndicator
{
  return self->hideKeysUnderIndicator;
}

- (void)setHideKeysUnderIndicator:(BOOL)a3
{
  self->hideKeysUnderIndicator = a3;
}

- (id)deferredTouchDownTask
{
  return self->_deferredTouchDownTask;
}

- (id)deferredTouchMovedTask
{
  return self->_deferredTouchMovedTask;
}

- (_UIKBRTFingerDetection)fingerDetection
{
  return self->_fingerDetection;
}

- (UIKBCadenceMonitor)cadenceMonitor
{
  return self->_cadenceMonitor;
}

- (_UIKBRTTouchVelocities)touchVelocities
{
  return self->_touchVelocities;
}

- (void)setTouchVelocities:(id)a3
{
  objc_storeStrong((id *)&self->_touchVelocities, a3);
}

- (double)lastTouchUpTime
{
  return self->lastTouchUpTime;
}

- (void)setLastTouchUpTime:(double)a3
{
  self->lastTouchUpTime = a3;
}

- (UIKBScreenTraits)screenTraits
{
  return self->_screenTraits;
}

- (void)setScreenTraits:(id)a3
{
  objc_storeStrong((id *)&self->_screenTraits, a3);
}

- (double)timestampOfLastTouchesEnded
{
  return self->_timestampOfLastTouchesEnded;
}

- (id)deferredTaskForActiveTouch
{
  return self->_deferredTaskForActiveTouch;
}

- (void)setDeferredTaskForActiveTouch:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 600);
}

- (NSMutableDictionary)deferredTouchTaskLists
{
  return self->_deferredTouchTaskLists;
}

- (void)setDeferredTouchTaskLists:(id)a3
{
  objc_storeStrong((id *)&self->_deferredTouchTaskLists, a3);
}

- (OS_dispatch_queue)deferredTouchTaskListsQueue
{
  return self->_deferredTouchTaskListsQueue;
}

- (void)setDeferredTouchTaskListsQueue:(id)a3
{
  objc_storeStrong((id *)&self->_deferredTouchTaskListsQueue, a3);
}

- (NSMutableSet)touchIgnoredUUIDSet
{
  return self->_touchIgnoredUUIDSet;
}

- (void)setTouchIgnoredUUIDSet:(id)a3
{
  objc_storeStrong((id *)&self->_touchIgnoredUUIDSet, a3);
}

- (BOOL)isExecutingDeferredTouchTasks
{
  return self->_isExecutingDeferredTouchTasks;
}

- (void)setIsExecutingDeferredTouchTasks:(BOOL)a3
{
  self->_isExecutingDeferredTouchTasks = a3;
}

- (BOOL)listeningForWillChange
{
  return self->_listeningForWillChange;
}

- (void)setListeningForWillChange:(BOOL)a3
{
  self->_listeningForWillChange = a3;
}

- (BOOL)listeningForDidChange
{
  return self->_listeningForDidChange;
}

- (void)setListeningForDidChange:(BOOL)a3
{
  self->_listeningForDidChange = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touchIgnoredUUIDSet, 0);
  objc_storeStrong((id *)&self->_deferredTouchTaskListsQueue, 0);
  objc_storeStrong((id *)&self->_deferredTouchTaskLists, 0);
  objc_storeStrong((id *)&self->_touchDrifting, 0);
  objc_storeStrong(&self->_deferredTaskForActiveTouch, 0);
  objc_destroyWeak((id *)&self->_sizeDelegate);
  objc_storeStrong((id *)&self->_touchVelocities, 0);
  objc_storeStrong((id *)&self->_cadenceMonitor, 0);
  objc_storeStrong((id *)&self->_fingerDetection, 0);
  objc_storeStrong((id *)&self->_handRestRecognizer, 0);
  objc_storeStrong(&self->_deferredTouchMovedTask, 0);
  objc_storeStrong(&self->_deferredTouchDownTask, 0);
  objc_storeStrong((id *)&self->_screenEdgePanRecognizer, 0);
  objc_storeStrong((id *)&self->_currentTouchDownEvent, 0);
  objc_storeStrong((id *)&self->_typingStyleEstimator, 0);
  objc_storeStrong((id *)&self->_taskQueue, 0);
  objc_storeStrong((id *)&self->_shiftKeyTouchUUID, 0);
  objc_storeStrong((id *)&self->_activeTouchUUID, 0);
  objc_storeStrong((id *)&self->_uncommittedTouchUUIDs, 0);
  objc_storeStrong((id *)&self->_textEditingTraits, 0);
  objc_storeStrong((id *)&self->_screenTraits, 0);
  objc_storeStrong((id *)&self->_inputTraits, 0);
}

@end
