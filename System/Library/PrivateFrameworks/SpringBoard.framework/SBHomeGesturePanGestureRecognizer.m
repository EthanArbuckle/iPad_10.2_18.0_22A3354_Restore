@implementation SBHomeGesturePanGestureRecognizer

- (int64_t)_touchInterfaceOrientation
{
  void *v3;
  void *v4;
  id v5;
  int64_t v6;
  objc_super v8;

  -[SBHomeGesturePanGestureRecognizer interfaceDelegate](self, "interfaceDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = (id)objc_msgSend(v3, "touchInterfaceOrientationForGestureRecognizer:", self);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBHomeGesturePanGestureRecognizer;
    v5 = -[SBScreenEdgePanGestureRecognizer _touchInterfaceOrientation](&v8, sel__touchInterfaceOrientation);
  }
  v6 = (int64_t)v5;

  return v6;
}

- (SBHomeGesturePanGestureRecognizerInterfaceDelegate)interfaceDelegate
{
  return (SBHomeGesturePanGestureRecognizerInterfaceDelegate *)objc_loadWeakRetained((id *)&self->_interfaceDelegate);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;

  v7 = a4;
  v8 = a3;
  objc_msgSend(v8, "anyObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "coalescedTouchesForTouch:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBHomeGesturePanGestureRecognizer viewForTouchHistory](self, "viewForTouchHistory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  _SBUpdateTouchHistoryWithCoalescedTouches(self->_touchHistory, v10, self, v11, 1);
  _SBLogCoalescedTouchesForGestureAndView(v10, self);
  NSStringFromSelector(a2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHomeGesturePanGestureRecognizer _SBLogTouchesWithMethodName:withMethodName:](self, "_SBLogTouchesWithMethodName:withMethodName:", v8, v12);

  v13.receiver = self;
  v13.super_class = (Class)SBHomeGesturePanGestureRecognizer;
  -[UIScreenEdgePanGestureRecognizer touchesEnded:withEvent:](&v13, sel_touchesEnded_withEvent_, v8, v7);

}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;

  v7 = a4;
  v8 = a3;
  objc_msgSend(v8, "anyObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "coalescedTouchesForTouch:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBHomeGesturePanGestureRecognizer viewForTouchHistory](self, "viewForTouchHistory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  _SBUpdateTouchHistoryWithCoalescedTouches(self->_touchHistory, v10, self, v11, 1);
  _SBLogCoalescedTouchesForGestureAndView(v10, self);
  NSStringFromSelector(a2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHomeGesturePanGestureRecognizer _SBLogTouchesWithMethodName:withMethodName:](self, "_SBLogTouchesWithMethodName:withMethodName:", v8, v12);

  v13.receiver = self;
  v13.super_class = (Class)SBHomeGesturePanGestureRecognizer;
  -[UIScreenEdgePanGestureRecognizer touchesBegan:withEvent:](&v13, sel_touchesBegan_withEvent_, v8, v7);

}

- (void)_SBLogTouchesWithMethodName:(id)a3 withMethodName:(id)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  SBHomeGesturePanGestureRecognizer *v13;
  id v14;

  v10 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0DAFEC0], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEnabled");

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0DAFEC0], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __80__SBHomeGesturePanGestureRecognizer__SBLogTouchesWithMethodName_withMethodName___block_invoke;
    v11[3] = &unk_1E8EAE6B8;
    v12 = v10;
    v13 = self;
    v14 = v6;
    objc_msgSend(v9, "logBlock:", v11);

  }
}

- (UIView)viewForTouchHistory
{
  void *v3;
  void *v4;

  -[SBHomeGesturePanGestureRecognizer delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewForSystemGestureRecognizer:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v4;
}

- (void)reset
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBHomeGesturePanGestureRecognizer;
  -[UIScreenEdgePanGestureRecognizer reset](&v3, sel_reset);
  -[SBTouchHistory reset](self->_touchHistory, "reset");
}

id __80__SBHomeGesturePanGestureRecognizer__SBLogTouchesWithMethodName_withMethodName___block_invoke(uint64_t a1)
{
  uint64_t i;
  void *v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_class *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  uint64_t v34;
  id obj;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _QWORD v50[3];
  _QWORD v51[3];
  _QWORD v52[2];
  _QWORD v53[2];
  _QWORD v54[13];
  _QWORD v55[13];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v34 = a1;
  obj = *(id *)(a1 + 32);
  v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
  if (v38)
  {
    v36 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v38; ++i)
      {
        if (*(_QWORD *)v47 != v36)
          objc_enumerationMutation(obj);
        v3 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
        v4 = _SBLocationForTouch(v3);
        v6 = v5;
        v54[0] = CFSTR("timestamp");
        v7 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v3, "timestamp");
        objc_msgSend(v7, "numberWithDouble:");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v55[0] = v45;
        v54[1] = CFSTR("phase");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "phase"));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v55[1] = v44;
        v54[2] = CFSTR("tapCount");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v3, "tapCount"));
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v55[2] = v43;
        v54[3] = CFSTR("type");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "type"));
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v55[3] = v42;
        v54[4] = CFSTR("majorRadius");
        v8 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v3, "majorRadius");
        objc_msgSend(v8, "numberWithDouble:");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v55[4] = v41;
        v54[5] = CFSTR("majorRadiusToTolerance");
        v9 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v3, "majorRadiusTolerance");
        objc_msgSend(v9, "numberWithDouble:");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v55[5] = v40;
        v54[6] = CFSTR("force");
        v10 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v3, "force");
        objc_msgSend(v10, "numberWithDouble:");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v55[6] = v39;
        v54[7] = CFSTR("maximumPossibleForce");
        v11 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v3, "maximumPossibleForce");
        objc_msgSend(v11, "numberWithDouble:");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v55[7] = v12;
        v54[8] = CFSTR("altitudeAngle");
        v13 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v3, "altitudeAngle");
        objc_msgSend(v13, "numberWithDouble:");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v55[8] = v14;
        v54[9] = CFSTR("estimationUpdateIndex");
        objc_msgSend(v3, "estimationUpdateIndex");
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = (void *)v15;
        v17 = &unk_1E91D0E60;
        if (v15)
          v17 = (void *)v15;
        v55[9] = v17;
        v54[10] = CFSTR("estimatedProperties");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "estimatedProperties"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v55[10] = v18;
        v54[11] = CFSTR("estimatedPropertiesExpectingUpdates");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "estimatedPropertiesExpectingUpdates"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v55[11] = v19;
        v54[12] = CFSTR("location");
        v52[0] = CFSTR("x");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v4);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v52[1] = CFSTR("y");
        v53[0] = v20;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v6);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v53[1] = v21;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, v52, 2);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v55[12] = v22;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, v54, 13);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v37, "addObject:", v23);
      }
      v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
    }
    while (v38);
  }

  v24 = (void *)MEMORY[0x1E0CB3940];
  v25 = (objc_class *)objc_opt_class();
  NSStringFromClass(v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "stringWithFormat:", CFSTR("[%@ %@]"), v26, *(_QWORD *)(v34 + 48));
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v51[0] = v37;
  v50[0] = v27;
  v50[1] = CFSTR("address");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", *(_QWORD *)(v34 + 40));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v51[1] = v28;
  v50[2] = CFSTR("name");
  objc_msgSend(*(id *)(v34 + 40), "name");
  v29 = objc_claimAutoreleasedReturnValue();
  v30 = (void *)v29;
  v31 = &stru_1E8EC7EC0;
  if (v29)
    v31 = (const __CFString *)v29;
  v51[2] = v31;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, v50, 3);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  return v32;
}

+ (SBHomeGesturePanGestureRecognizer)homeGesturePanGestureRecognizerWithTarget:(id)a3 action:(SEL)a4
{
  id v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  uint64_t v10;
  void *v11;

  v6 = a3;
  +[SBHomeGestureDomain rootSettings](SBHomeGestureDomain, "rootSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D01800], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "homeButtonType") == 2;

  if ((objc_msgSend(v7, "recognizeAlongEdge") & v9) != 0)
    v10 = 5;
  else
    v10 = 1;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTarget:action:type:options:", v6, a4, v10, 0);

  return (SBHomeGesturePanGestureRecognizer *)v11;
}

- (SBHomeGesturePanGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4 type:(int64_t)a5 options:(unint64_t)a6
{
  SBHomeGesturePanGestureRecognizer *v6;
  SBHomeGesturePanGestureRecognizer *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBHomeGesturePanGestureRecognizer;
  v6 = -[SBScreenEdgePanGestureRecognizer initWithTarget:action:type:options:](&v9, sel_initWithTarget_action_type_options_, a3, a4, a5, a6);
  v7 = v6;
  if (v6)
    -[SBHomeGesturePanGestureRecognizer sb_commonInitHomeGesturePanGestureRecognizer](v6, "sb_commonInitHomeGesturePanGestureRecognizer");
  return v7;
}

- (void)sb_commonInitHomeGesturePanGestureRecognizer
{
  SBTouchHistory *v3;
  SBTouchHistory *touchHistory;
  SBHomeGestureSettings *v5;
  SBHomeGestureSettings *homeGestureSettings;

  -[SBHomeGesturePanGestureRecognizer setAllowedTouchTypes:](self, "setAllowedTouchTypes:", &unk_1E91CE8A8);
  v3 = objc_alloc_init(SBTouchHistory);
  touchHistory = self->_touchHistory;
  self->_touchHistory = v3;

  +[SBHomeGestureDomain rootSettings](SBHomeGestureDomain, "rootSettings");
  v5 = (SBHomeGestureSettings *)objc_claimAutoreleasedReturnValue();
  homeGestureSettings = self->_homeGestureSettings;
  self->_homeGestureSettings = v5;

  -[PTSettings addKeyObserver:](self->_homeGestureSettings, "addKeyObserver:", self);
  self->_preventHorizontalSwipesOutsideTrapezoid = 1;
  self->_installedAsSystemGesture = 1;
  -[SBHomeGesturePanGestureRecognizer setMaximumNumberOfTouches:](self, "setMaximumNumberOfTouches:", 1);
  -[SBHomeGesturePanGestureRecognizer _updateHomeGestureParameters](self, "_updateHomeGestureParameters");
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;

  v7 = a4;
  v8 = a3;
  objc_msgSend(v8, "anyObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "coalescedTouchesForTouch:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBHomeGesturePanGestureRecognizer viewForTouchHistory](self, "viewForTouchHistory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  _SBUpdateTouchHistoryWithCoalescedTouches(self->_touchHistory, v10, self, v11, 1);
  _SBLogCoalescedTouchesForGestureAndView(v10, self);
  NSStringFromSelector(a2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHomeGesturePanGestureRecognizer _SBLogTouchesWithMethodName:withMethodName:](self, "_SBLogTouchesWithMethodName:withMethodName:", v8, v12);

  v13.receiver = self;
  v13.super_class = (Class)SBHomeGesturePanGestureRecognizer;
  -[UIScreenEdgePanGestureRecognizer touchesMoved:withEvent:](&v13, sel_touchesMoved_withEvent_, v8, v7);

}

- (CGPoint)averageTouchVelocityOverTimeDuration:(double)a3
{
  double v3;
  double v4;
  CGPoint result;

  -[SBTouchHistory averageTouchVelocityOverTimeDuration:](self->_touchHistory, "averageTouchVelocityOverTimeDuration:", a3);
  result.y = v4;
  result.x = v3;
  return result;
}

- (double)averageTouchPathAngleOverTimeDuration:(double)a3
{
  double result;

  -[SBTouchHistory averageTouchPathAngleOverTimeDuration:](self->_touchHistory, "averageTouchPathAngleOverTimeDuration:", a3);
  return result;
}

- (double)peakSpeed
{
  double result;

  -[SBTouchHistory peakSpeed](self->_touchHistory, "peakSpeed");
  return result;
}

- (BOOL)_shouldBegin
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  int v7;
  const __CFString *v8;
  BOOL v9;
  char v10;
  int64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v25[5];
  __CFString *v26;
  BOOL v27;
  objc_super v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  SBHomeGesturePanGestureRecognizer *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v28.receiver = self;
  v28.super_class = (Class)SBHomeGesturePanGestureRecognizer;
  if (-[SBHomeGesturePanGestureRecognizer _shouldBegin](&v28, sel__shouldBegin))
  {
    if (-[SBHomeGesturePanGestureRecognizer _isOutsideOfExclusionTrapezoid](self, "_isOutsideOfExclusionTrapezoid"))
    {
      SBLogSystemGestureAppSwitcher();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        v4 = (objc_class *)objc_opt_class();
        NSStringFromClass(v4);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBHomeGesturePanGestureRecognizer name](self, "name");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v30 = v5;
        v31 = 2048;
        v32 = self;
        v33 = 2112;
        v34 = v6;
        _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_INFO, "Preventing the <%@:%p> (%@) because the touch is moving vertically and outside of trapezoidal exclusion area.", buf, 0x20u);

      }
      v7 = 0;
      v8 = CFSTR("HomeGesturePreventedByExclusionTrapezoid");
    }
    else
    {
      v8 = 0;
      v7 = 1;
    }
    if (objc_msgSend(MEMORY[0x1E0CEA6C8], "isOnScreen"))
      v10 = objc_msgSend(MEMORY[0x1E0CEA6C8], "isInHardwareKeyboardMode");
    else
      v10 = 1;
    if (!objc_msgSend((id)SBApp, "isTypingActive") || (v10 & 1) != 0)
      goto LABEL_24;
    v11 = -[SBHomeGesturePanGestureRecognizer _touchInterfaceOrientation](self, "_touchInterfaceOrientation");
    objc_msgSend(MEMORY[0x1E0CEA6F8], "sharedInputModeController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "currentInputModeInPreference");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "userInterfaceIdiom");

    if ((v15 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      SBLogSystemGestureAppSwitcher();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        v17 = (objc_class *)objc_opt_class();
        NSStringFromClass(v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBHomeGesturePanGestureRecognizer name](self, "name");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v30 = v18;
        v31 = 2048;
        v32 = self;
        v33 = 2112;
        v34 = v19;
        _os_log_impl(&dword_1D0540000, v16, OS_LOG_TYPE_INFO, "Preventing the <%@:%p> (%@) because user is typing.", buf, 0x20u);

      }
      v8 = CFSTR("HomeGesturePreventedByiPadKeyboard");
    }
    else
    {
      if ((unint64_t)(v11 - 3) > 1
        || !-[SBHomeGesturePanGestureRecognizer _shouldBlockHomeGestureForKeyboardInputMode:](self, "_shouldBlockHomeGestureForKeyboardInputMode:", v13))
      {
        goto LABEL_23;
      }
      SBLogSystemGestureAppSwitcher();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        v20 = (objc_class *)objc_opt_class();
        NSStringFromClass(v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBHomeGesturePanGestureRecognizer name](self, "name");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v30 = v21;
        v31 = 2048;
        v32 = self;
        v33 = 2112;
        v34 = v22;
        _os_log_impl(&dword_1D0540000, v16, OS_LOG_TYPE_INFO, "Preventing the <%@:%p> (%@) because user is typing on 10-key keyboard in landscape.", buf, 0x20u);

      }
      v8 = CFSTR("HomeGesturePreventedByLandscape10Key");
    }

    v7 = 0;
LABEL_23:

LABEL_24:
    v9 = v7 != 0;
    goto LABEL_25;
  }
  v8 = 0;
  v9 = 0;
LABEL_25:
  objc_msgSend(MEMORY[0x1E0DAFEC0], "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __49__SBHomeGesturePanGestureRecognizer__shouldBegin__block_invoke;
  v25[3] = &unk_1E8EAE6E0;
  v27 = v9;
  v25[4] = self;
  v26 = (__CFString *)v8;
  objc_msgSend(v23, "logBlock:", v25);

  return v9;
}

id __49__SBHomeGesturePanGestureRecognizer__shouldBegin__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  _QWORD v12[4];
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v13 = CFSTR("[SBHomeGesturePanGestureRecognizer _shouldBegin]");
  v11[0] = CFSTR("shouldBegin");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v2;
  v11[1] = CFSTR("address");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v3;
  v11[2] = CFSTR("name");
  objc_msgSend(*(id *)(a1 + 32), "name");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = &stru_1E8EC7EC0;
  if (v4)
    v7 = (const __CFString *)v4;
  else
    v7 = &stru_1E8EC7EC0;
  v11[3] = CFSTR("failureReason");
  if (*(_QWORD *)(a1 + 40))
    v6 = *(const __CFString **)(a1 + 40);
  v12[2] = v7;
  v12[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)setPreventHorizontalSwipesOutsideTrapezoid:(BOOL)a3
{
  if (self->_preventHorizontalSwipesOutsideTrapezoid != a3)
  {
    self->_preventHorizontalSwipesOutsideTrapezoid = a3;
    -[SBHomeGesturePanGestureRecognizer _setUpExclusionTrapezoids](self, "_setUpExclusionTrapezoids");
  }
}

- (void)_setUpExclusionTrapezoids
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  _BOOL8 v11;
  SBFluidSwitcherGestureExclusionTrapezoid *v12;
  SBFluidSwitcherGestureExclusionTrapezoid *landscapeExclusionTrapezoid;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  _BOOL8 v22;
  SBFluidSwitcherGestureExclusionTrapezoid *v23;
  SBFluidSwitcherGestureExclusionTrapezoid *portraitExclusionTrapezoid;
  id v25;

  if (SBFEffectiveHomeButtonType() == 2)
  {
    -[SBHomeGestureSettings exclusionTrapezoidSettings](self->_homeGestureSettings, "exclusionTrapezoidSettings");
    v25 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "landscapeTrapezoidBaseHeight");
    v4 = v3;
    objc_msgSend(v25, "landscapeTrapezoidHeight");
    v6 = v5;
    objc_msgSend(v25, "landscapeTrapezoidAdjacentXDistanceFromEdge");
    v8 = v7;
    objc_msgSend(v25, "landscapeTrapezoidOpposingXDistanceFromEdge");
    v10 = v9;
    if (objc_msgSend(v25, "allowHorizontalSwipesOutsideLandscapeTrapezoid"))
      v11 = !self->_preventHorizontalSwipesOutsideTrapezoid;
    else
      v11 = 0;
    +[SBFluidSwitcherGestureExclusionTrapezoid exclusionTrapezoidWithBaseHeight:trapezoidHeight:adjacentBaseXDistanceFromEdge:opposingBaseXDistanceFromEdge:allowHorizontalSwipesOutsideTrapezoid:](SBFluidSwitcherGestureExclusionTrapezoid, "exclusionTrapezoidWithBaseHeight:trapezoidHeight:adjacentBaseXDistanceFromEdge:opposingBaseXDistanceFromEdge:allowHorizontalSwipesOutsideTrapezoid:", v11, v4, v6, v8, v10);
    v12 = (SBFluidSwitcherGestureExclusionTrapezoid *)objc_claimAutoreleasedReturnValue();
    landscapeExclusionTrapezoid = self->_landscapeExclusionTrapezoid;
    self->_landscapeExclusionTrapezoid = v12;

    objc_msgSend(v25, "portraitTrapezoidBaseHeight");
    v15 = v14;
    objc_msgSend(v25, "portraitTrapezoidHeight");
    v17 = v16;
    objc_msgSend(v25, "portraitTrapezoidAdjacentXDistanceFromEdge");
    v19 = v18;
    objc_msgSend(v25, "portraitTrapezoidOpposingXDistanceFromEdge");
    v21 = v20;
    if (objc_msgSend(v25, "allowHorizontalSwipesOutsidePortraitTrapezoid"))
      v22 = !self->_preventHorizontalSwipesOutsideTrapezoid;
    else
      v22 = 0;
    +[SBFluidSwitcherGestureExclusionTrapezoid exclusionTrapezoidWithBaseHeight:trapezoidHeight:adjacentBaseXDistanceFromEdge:opposingBaseXDistanceFromEdge:allowHorizontalSwipesOutsideTrapezoid:](SBFluidSwitcherGestureExclusionTrapezoid, "exclusionTrapezoidWithBaseHeight:trapezoidHeight:adjacentBaseXDistanceFromEdge:opposingBaseXDistanceFromEdge:allowHorizontalSwipesOutsideTrapezoid:", v22, v15, v17, v19, v21);
    v23 = (SBFluidSwitcherGestureExclusionTrapezoid *)objc_claimAutoreleasedReturnValue();
    portraitExclusionTrapezoid = self->_portraitExclusionTrapezoid;
    self->_portraitExclusionTrapezoid = v23;

  }
}

- (id)_currentKeyboardExclusionCompositeShape
{
  void *v2;
  void *v3;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CEA6C8], "homeGestureExclusionZones");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = (void *)MEMORY[0x1E0C9AA60];
  }
  +[SBFluidSwitcherGestureExclusionCompositeShape exclusionCompositeShapeWithRects:allowHorizontalSwipes:](SBFluidSwitcherGestureExclusionCompositeShape, "exclusionCompositeShapeWithRects:allowHorizontalSwipes:", v2, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_isOutsideOfExclusionTrapezoid
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
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
  double v21;
  double v22;

  -[SBHomeGesturePanGestureRecognizer _currentExclusionShapeForEdge:](self, "_currentExclusionShapeForEdge:", SBScreenOrientedEdgeForHomeGestureRecognizer(self));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    SBInterfaceOrientationOfTouchedEdgeForHomeGestureRecognizer(self);
    -[SBHomeGesturePanGestureRecognizer view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");

    -[SBHomeGesturePanGestureRecognizer view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHomeGesturePanGestureRecognizer locationInView:](self, "locationInView:", v5);

    if (!self->_installedAsSystemGesture)
    {
      -[SBHomeGesturePanGestureRecognizer view](self, "view");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "window");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "interfaceOrientation");

    }
    _UIWindowConvertPointFromOrientationToOrientation();
    v10 = v9;
    v12 = v11;
    _UIWindowConvertRectFromOrientationToOrientation();
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;
    -[SBTouchHistory averageTouchVelocityOverTimeDuration:](self->_touchHistory, "averageTouchVelocityOverTimeDuration:", 0.0416666667);
    v6 = objc_msgSend(v3, "shouldBeginGestureAtStartingPoint:velocity:bounds:", v10, v12, v21, v22, v14, v16, v18, v20) ^ 1;
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (id)_currentExclusionShapeForEdge:(unint64_t)a3
{
  char v3;
  id v5;
  void *v6;
  void *v7;
  int *v8;

  v3 = a3;
  if (!UIKeyboardAutomaticIsOnScreen())
  {
    -[SBHomeGestureSettings exclusionTrapezoidSettings](self->_homeGestureSettings, "exclusionTrapezoidSettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if ((v3 & 0xA) != 0)
    {
      if ((objc_msgSend(v6, "landscapeTrapezoidEnabled") & 1) != 0)
      {
        v8 = &OBJC_IVAR___SBHomeGesturePanGestureRecognizer__landscapeExclusionTrapezoid;
LABEL_10:
        v5 = *(id *)((char *)&self->super.super.super.super.super.isa + *v8);
        goto LABEL_11;
      }
    }
    else if (objc_msgSend(v6, "portraitTrapezoidEnabled")
           && (objc_msgSend(v7, "portraitTrapezoidEnabledOnlyForKeyboards") & 1) == 0)
    {
      v8 = &OBJC_IVAR___SBHomeGesturePanGestureRecognizer__portraitExclusionTrapezoid;
      goto LABEL_10;
    }
    v5 = 0;
LABEL_11:

    return v5;
  }
  -[SBHomeGesturePanGestureRecognizer _currentKeyboardExclusionCompositeShape](self, "_currentKeyboardExclusionCompositeShape");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  return v5;
}

- (BOOL)_shouldBlockHomeGestureForKeyboardInputMode:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "softwareLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Kana")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("Kana-Flick")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("Korean10Key")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("Pinyin10-Simplified"));
  }

  return v4;
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  id v6;
  SBHomeGestureSettings *homeGestureSettings;
  SBHomeGestureSettings *v8;
  SBHomeGestureSettings *v9;

  v9 = (SBHomeGestureSettings *)a3;
  v6 = a4;
  homeGestureSettings = self->_homeGestureSettings;
  if (homeGestureSettings == v9
    || (-[SBHomeGestureSettings exclusionTrapezoidSettings](homeGestureSettings, "exclusionTrapezoidSettings"),
        v8 = (SBHomeGestureSettings *)objc_claimAutoreleasedReturnValue(),
        v8,
        v8 == v9))
  {
    -[SBHomeGesturePanGestureRecognizer _updateHomeGestureParameters](self, "_updateHomeGestureParameters");
  }

}

- (void)_updateHomeGestureParameters
{
  -[SBHomeGestureSettings hysteresis](self->_homeGestureSettings, "hysteresis");
  -[UIScreenEdgePanGestureRecognizer _setHysteresis:](self, "_setHysteresis:");
  -[SBHomeGesturePanGestureRecognizer _setUpExclusionTrapezoids](self, "_setUpExclusionTrapezoids");
}

- (void)setInterfaceDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_interfaceDelegate, a3);
}

- (BOOL)preventHorizontalSwipesOutsideTrapezoid
{
  return self->_preventHorizontalSwipesOutsideTrapezoid;
}

- (BOOL)installedAsSystemGesture
{
  return self->_installedAsSystemGesture;
}

- (void)setInstalledAsSystemGesture:(BOOL)a3
{
  self->_installedAsSystemGesture = a3;
}

- (SBHomeGestureSettings)homeGestureSettings
{
  return self->_homeGestureSettings;
}

- (void)setHomeGestureSettings:(id)a3
{
  objc_storeStrong((id *)&self->_homeGestureSettings, a3);
}

- (SBFluidSwitcherGestureExclusionTrapezoid)portraitExclusionTrapezoid
{
  return self->_portraitExclusionTrapezoid;
}

- (void)setPortraitExclusionTrapezoid:(id)a3
{
  objc_storeStrong((id *)&self->_portraitExclusionTrapezoid, a3);
}

- (SBFluidSwitcherGestureExclusionTrapezoid)landscapeExclusionTrapezoid
{
  return self->_landscapeExclusionTrapezoid;
}

- (void)setLandscapeExclusionTrapezoid:(id)a3
{
  objc_storeStrong((id *)&self->_landscapeExclusionTrapezoid, a3);
}

- (SBTouchHistory)touchHistory
{
  return self->_touchHistory;
}

- (void)setTouchHistory:(id)a3
{
  objc_storeStrong((id *)&self->_touchHistory, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touchHistory, 0);
  objc_storeStrong((id *)&self->_landscapeExclusionTrapezoid, 0);
  objc_storeStrong((id *)&self->_portraitExclusionTrapezoid, 0);
  objc_storeStrong((id *)&self->_homeGestureSettings, 0);
  objc_destroyWeak((id *)&self->_interfaceDelegate);
}

@end
