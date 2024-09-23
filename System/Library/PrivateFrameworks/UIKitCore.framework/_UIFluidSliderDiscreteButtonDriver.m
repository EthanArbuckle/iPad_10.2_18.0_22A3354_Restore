@implementation _UIFluidSliderDiscreteButtonDriver

- (void)stop
{
  -[_UIFluidSliderDiscreteButtonDriver _clearRepeatTimer](self, "_clearRepeatTimer");
  -[_UIFluidSliderDiscreteButtonDriver _clearReleaseTimer](self, "_clearReleaseTimer");
}

- (void)dealloc
{
  objc_super v3;

  -[_UIFluidSliderDiscreteButtonDriver _clearRepeatTimer](self, "_clearRepeatTimer");
  -[_UIFluidSliderDiscreteButtonDriver _clearReleaseTimer](self, "_clearReleaseTimer");
  v3.receiver = self;
  v3.super_class = (Class)_UIFluidSliderDiscreteButtonDriver;
  -[_UIFluidSliderDiscreteButtonDriver dealloc](&v3, sel_dealloc);
}

- (void)pressUp
{
  unint64_t v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = pressUp___s_category;
  if (!pressUp___s_category)
  {
    v3 = __UILogCategoryGetNode("FluidSliderInteraction", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v3, (unint64_t *)&pressUp___s_category);
  }
  v4 = *(NSObject **)(v3 + 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    -[_UIFluidSliderDiscreteButtonDriver name](self, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412546;
    v8 = v6;
    v9 = 2080;
    v10 = "-[_UIFluidSliderDiscreteButtonDriver pressUp]";
    _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_DEFAULT, "[FluidSlider Physical Button Update] %@: %s", (uint8_t *)&v7, 0x16u);

  }
  -[_UIFluidSliderDiscreteButtonDriver _handleButton:state:](self, "_handleButton:state:", 1, 0);
}

- (void)releaseUp
{
  unint64_t v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = releaseUp___s_category;
  if (!releaseUp___s_category)
  {
    v3 = __UILogCategoryGetNode("FluidSliderInteraction", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v3, (unint64_t *)&releaseUp___s_category);
  }
  v4 = *(NSObject **)(v3 + 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    -[_UIFluidSliderDiscreteButtonDriver name](self, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412546;
    v8 = v6;
    v9 = 2080;
    v10 = "-[_UIFluidSliderDiscreteButtonDriver releaseUp]";
    _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_DEFAULT, "[FluidSlider Physical Button Update] %@: %s", (uint8_t *)&v7, 0x16u);

  }
  -[_UIFluidSliderDiscreteButtonDriver _handleButton:state:](self, "_handleButton:state:", 1, 2);
}

- (void)pressDown
{
  unint64_t v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = pressDown___s_category;
  if (!pressDown___s_category)
  {
    v3 = __UILogCategoryGetNode("FluidSliderInteraction", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v3, (unint64_t *)&pressDown___s_category);
  }
  v4 = *(NSObject **)(v3 + 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    -[_UIFluidSliderDiscreteButtonDriver name](self, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412546;
    v8 = v6;
    v9 = 2080;
    v10 = "-[_UIFluidSliderDiscreteButtonDriver pressDown]";
    _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_DEFAULT, "[FluidSlider Physical Button Update] %@: %s", (uint8_t *)&v7, 0x16u);

  }
  -[_UIFluidSliderDiscreteButtonDriver _handleButton:state:](self, "_handleButton:state:", 2, 0);
}

- (void)releaseDown
{
  unint64_t v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = releaseDown___s_category;
  if (!releaseDown___s_category)
  {
    v3 = __UILogCategoryGetNode("FluidSliderInteraction", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v3, (unint64_t *)&releaseDown___s_category);
  }
  v4 = *(NSObject **)(v3 + 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    -[_UIFluidSliderDiscreteButtonDriver name](self, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412546;
    v8 = v6;
    v9 = 2080;
    v10 = "-[_UIFluidSliderDiscreteButtonDriver releaseDown]";
    _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_DEFAULT, "[FluidSlider Physical Button Update] %@: %s", (uint8_t *)&v7, 0x16u);

  }
  -[_UIFluidSliderDiscreteButtonDriver _handleButton:state:](self, "_handleButton:state:", 2, 2);
}

- (NSString)name
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (void)_handleButton:(unint64_t)a3 state:(unint64_t)a4
{
  _BOOL4 v5;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  uint64_t v24;
  id v25;
  id *v26;
  void *v27;
  double v28;
  double v29;
  uint64_t v30;
  id v31;
  void *v33;
  _QWORD v34[4];
  id v35;
  _QWORD v36[4];
  id v37;
  id location;

  if (a4)
  {
    if (a4 == 1)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFluidSliderDiscreteButtonDriver.m"), 115, CFSTR("Received a button update in the changed state. This is a discrete driver, so this shouldn't be possible."));

    }
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    -[_UIFluidSliderDiscreteButtonDriver set_lastReleaseTimestamp:](self, "set_lastReleaseTimestamp:");
    v5 = -[_UIFluidSliderDiscreteButtonDriver _isRepeating](self, "_isRepeating");
    -[_UIFluidSliderDiscreteButtonDriver _clearRepeatTimer](self, "_clearRepeatTimer");
    if (v5)
    {
      -[_UIFluidSliderDiscreteButtonDriver _releaseCurrentlyPressedButton](self, "_releaseCurrentlyPressedButton");
      return;
    }
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D01690]), "initWithIdentifier:", CFSTR("com.apple.UIKit.DiscreteButtonDriverReleaseTimer"));
    -[_UIFluidSliderDiscreteButtonDriver set_releaseTimer:](self, "set_releaseTimer:", v27);

    objc_initWeak(&location, self);
    -[_UIFluidSliderDiscreteButtonDriver _releaseTimer](self, "_releaseTimer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIFluidSliderDiscreteButtonDriver _minimumPressDuration](self, "_minimumPressDuration");
    v29 = v28;
    v30 = MEMORY[0x1E0C80D38];
    v31 = MEMORY[0x1E0C80D38];
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __58___UIFluidSliderDiscreteButtonDriver__handleButton_state___block_invoke_2;
    v34[3] = &unk_1E16CCA18;
    v26 = &v35;
    objc_copyWeak(&v35, &location);
    objc_msgSend(v21, "scheduleWithFireInterval:leewayInterval:queue:handler:", v30, v34, v29, 0.0);
    goto LABEL_15;
  }
  -[_UIFluidSliderDiscreteButtonDriver _releaseTimer](self, "_releaseTimer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[_UIFluidSliderDiscreteButtonDriver _clearReleaseTimer](self, "_clearReleaseTimer");
    -[_UIFluidSliderDiscreteButtonDriver _releaseCurrentlyPressedButton](self, "_releaseCurrentlyPressedButton");
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v9 = v8;
  -[_UIFluidSliderDiscreteButtonDriver _lastReleaseTimestamp](self, "_lastReleaseTimestamp");
  v11 = v10;
  -[_UIFluidSliderDiscreteButtonDriver _minimumPressDuration](self, "_minimumPressDuration");
  v13 = v12;
  -[_UIFluidSliderDiscreteButtonDriver set_lastReleaseTimestamp:](self, "set_lastReleaseTimestamp:", 0.0);
  -[_UIFluidSliderDiscreteButtonDriver set_pressedButton:](self, "set_pressedButton:", a3);
  -[_UIFluidSliderDiscreteButtonDriver drivable](self, "drivable");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "value");
  -[_UIFluidSliderDiscreteButtonDriver set_value:](self, "set_value:");

  -[_UIFluidSliderDiscreteButtonDriver _repeatTimer](self, "_repeatTimer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    -[_UIFluidSliderDiscreteButtonDriver _incrementValue](self, "_incrementValue");
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D01690]), "initWithIdentifier:", CFSTR("com.apple.UIKit.DiscreteButtonDriverRepeatTimer"));
    -[_UIFluidSliderDiscreteButtonDriver set_repeatTimer:](self, "set_repeatTimer:", v16);

    objc_initWeak(&location, self);
    -[_UIFluidSliderDiscreteButtonDriver _repeatDelay](self, "_repeatDelay");
    v18 = v17;
    v19 = v9 - v11;
    if (v9 - v11 < v13
      || (-[_UIFluidSliderDiscreteButtonDriver _value](self, "_value", v19), v19 <= 0.0)
      || (-[_UIFluidSliderDiscreteButtonDriver _value](self, "_value"), v19 >= 1.0))
    {
      -[_UIFluidSliderDiscreteButtonDriver _repeatCadence](self, "_repeatCadence", v19);
      v18 = v20;
    }
    -[_UIFluidSliderDiscreteButtonDriver _repeatTimer](self, "_repeatTimer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIFluidSliderDiscreteButtonDriver _repeatCadence](self, "_repeatCadence");
    v23 = v22;
    v24 = MEMORY[0x1E0C80D38];
    v25 = MEMORY[0x1E0C80D38];
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __58___UIFluidSliderDiscreteButtonDriver__handleButton_state___block_invoke;
    v36[3] = &unk_1E16CCA18;
    v26 = &v37;
    objc_copyWeak(&v37, &location);
    objc_msgSend(v21, "scheduleRepeatingWithFireInterval:repeatInterval:leewayInterval:queue:handler:", v24, v36, v18, v23, 0.0);
LABEL_15:

    objc_destroyWeak(v26);
    objc_destroyWeak(&location);
  }
}

- (void)_clearRepeatTimer
{
  BSAbsoluteMachTimer *repeatTimer;

  -[BSAbsoluteMachTimer invalidate](self->_repeatTimer, "invalidate");
  repeatTimer = self->_repeatTimer;
  self->_repeatTimer = 0;

  -[_UIFluidSliderDiscreteButtonDriver set_isRepeating:](self, "set_isRepeating:", 0);
}

- (void)_clearReleaseTimer
{
  BSAbsoluteMachTimer *releaseTimer;

  -[BSAbsoluteMachTimer invalidate](self->_releaseTimer, "invalidate");
  releaseTimer = self->_releaseTimer;
  self->_releaseTimer = 0;

}

- (void)_incrementValue
{
  unint64_t v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;

  if (-[_UIFluidSliderDiscreteButtonDriver _pressedButton](self, "_pressedButton"))
  {
    v3 = -[_UIFluidSliderDiscreteButtonDriver _pressedButton](self, "_pressedButton");
    -[_UIFluidSliderDiscreteButtonDriver drivable](self, "drivable");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 1.0 / (double)(unint64_t)objc_msgSend(v4, "stepCount");

    -[_UIFluidSliderDiscreteButtonDriver _value](self, "_value");
    if (v3 != 1)
      v5 = -v5;
    -[_UIFluidSliderDiscreteButtonDriver velocityMultiplier](self, "velocityMultiplier");
    v7 = v5 * v6;
    -[_UIFluidSliderDiscreteButtonDriver _value](self, "_value");
    -[_UIFluidSliderDiscreteButtonDriver set_value:](self, "set_value:", v8 + v7);
    -[_UIFluidSliderDiscreteButtonDriver _value](self, "_value");
    -[_UIFluidSliderDiscreteButtonDriver _issueUpdateWithValue:](self, "_issueUpdateWithValue:");
  }
}

- (void)_releaseCurrentlyPressedButton
{
  void *v3;
  double v4;
  double v5;

  -[_UIFluidSliderDiscreteButtonDriver set_pressedButton:](self, "set_pressedButton:", 0);
  -[_UIFluidSliderDiscreteButtonDriver drivable](self, "drivable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v5 = v4;

  -[_UIFluidSliderDiscreteButtonDriver _issueUpdateWithValue:](self, "_issueUpdateWithValue:", fmax(fmin(v5, 1.0), 0.0));
}

- (void)_issueUpdateWithValue:(double)a3
{
  unint64_t v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  unint64_t v17;
  unint64_t v18;
  double v19;
  _BOOL4 v20;
  void *v21;
  double v22;
  _BOOL8 v23;
  void *v24;
  uint64_t v25;
  _QWORD v26[10];

  v5 = -[_UIFluidSliderDiscreteButtonDriver _pressedButton](self, "_pressedButton");
  -[_UIFluidSliderDiscreteButtonDriver stretchAmount](self, "stretchAmount");
  v7 = v6;
  -[_UIFluidSliderDiscreteButtonDriver drivable](self, "drivable");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentTrackLength");
  v10 = v7 / v9;

  -[_UIFluidSliderDiscreteButtonDriver _range](self, "_range");
  v13 = -v10;
  if (v11 <= a3)
    v13 = v10;
  v14 = fmax(v11, fmin(a3, v12));
  if (v13 != 0.0)
    v14 = v14 + v13 * (1.0 - 1.0 / ((a3 - v14) / v13 * 0.55 + 1.0));
  +[_UIFluidSliderSettingsDomain rootSettings](_UIFluidSliderSettingsDomain, "rootSettings");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "discreteButtonDriverSettings");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v17 = -[_UIFluidSliderDiscreteButtonDriver _pressedButton](self, "_pressedButton");
    v18 = -[_UIFluidSliderDiscreteButtonDriver trackAxis](self, "trackAxis");
    if (v17 == 1)
    {
      if (v18 == 1)
        objc_msgSend(v16, "horizontalVolumeUpScale");
      else
        objc_msgSend(v16, "verticalVolumeUpScale");
    }
    else if (v18 == 1)
    {
      objc_msgSend(v16, "horizontalVolumeDownScale");
    }
    else
    {
      objc_msgSend(v16, "verticalVolumeDownScale");
    }
    v22 = v19;
    v20 = -[_UIFluidSliderDiscreteButtonDriver _isRepeating](self, "_isRepeating");
    objc_msgSend(v16, "update");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = -[_UIFluidSliderDiscreteButtonDriver _isRepeating](self, "_isRepeating");
    objc_msgSend(v16, "settle");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 1.0;
  }
  v23 = v5 != 0;
  objc_msgSend(v21, "springAnimationBehavior");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = 2;
  if (v20)
    v25 = 3;
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __60___UIFluidSliderDiscreteButtonDriver__issueUpdateWithValue___block_invoke;
  v26[3] = &unk_1E16E0798;
  v26[4] = self;
  *(double *)&v26[5] = v14;
  *(double *)&v26[6] = v22;
  v26[7] = v23;
  v26[8] = v25;
  v26[9] = 0xBFF0000000000000;
  +[UIView _animateUsingSpringBehavior:tracking:animations:completion:](UIView, "_animateUsingSpringBehavior:tracking:animations:completion:", v24, 0, v26, 0);

}

- ($F24F406B2B787EFB06265DBA3D28CBD5)_range
{
  void *v3;
  int v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  -[_UIFluidSliderDiscreteButtonDriver drivable](self, "drivable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isLocked");

  if (v4)
  {
    -[_UIFluidSliderDiscreteButtonDriver drivable](self, "drivable");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "value");
    v7 = v6;

    v8 = v7;
  }
  else
  {
    v8 = 1.0;
    v7 = 0.0;
  }
  v9 = v7;
  result.var1 = v8;
  result.var0 = v9;
  return result;
}

- (double)_trackLength
{
  void *v2;
  double v3;
  double v4;

  -[_UIFluidSliderDiscreteButtonDriver drivable](self, "drivable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentTrackLength");
  v4 = v3;

  return v4;
}

- (double)_overflowAmount
{
  double v3;
  double v4;
  double v5;

  -[_UIFluidSliderDiscreteButtonDriver stretchAmount](self, "stretchAmount");
  v4 = v3;
  -[_UIFluidSliderDiscreteButtonDriver _trackLength](self, "_trackLength");
  return v4 / v5 * 0.5;
}

- (double)_repeatDelay
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  +[_UIFluidSliderSettingsDomain rootSettings](_UIFluidSliderSettingsDomain, "rootSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "discreteButtonDriverSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "repeatDelay");
  v5 = v4;

  return v5;
}

- (double)_repeatCadence
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  +[_UIFluidSliderSettingsDomain rootSettings](_UIFluidSliderSettingsDomain, "rootSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "discreteButtonDriverSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "repeatCadence");
  v5 = v4;

  return v5;
}

- (double)_minimumPressDuration
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  +[_UIFluidSliderSettingsDomain rootSettings](_UIFluidSliderSettingsDomain, "rootSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "discreteButtonDriverSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "minimumPressDuration");
  v5 = v4;

  return v5;
}

- (id)drivable
{
  return objc_loadWeakRetained((id *)&self->_drivable);
}

- (void)setDrivable:(id)a3
{
  objc_storeWeak((id *)&self->_drivable, a3);
}

- (UIView)view
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_view);
}

- (void)setView:(id)a3
{
  objc_storeWeak((id *)&self->_view, a3);
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (double)stretchAmount
{
  return self->_stretchAmount;
}

- (void)setStretchAmount:(double)a3
{
  self->_stretchAmount = a3;
}

- (double)velocityMultiplier
{
  return self->_velocityMultiplier;
}

- (void)setVelocityMultiplier:(double)a3
{
  self->_velocityMultiplier = a3;
}

- (unint64_t)trackAxis
{
  return self->_trackAxis;
}

- (void)setTrackAxis:(unint64_t)a3
{
  self->_trackAxis = a3;
}

- (BSAbsoluteMachTimer)_repeatTimer
{
  return self->_repeatTimer;
}

- (void)set_repeatTimer:(id)a3
{
  objc_storeStrong((id *)&self->_repeatTimer, a3);
}

- (BSAbsoluteMachTimer)_releaseTimer
{
  return self->_releaseTimer;
}

- (void)set_releaseTimer:(id)a3
{
  objc_storeStrong((id *)&self->_releaseTimer, a3);
}

- (BOOL)_isRepeating
{
  return self->_isRepeating;
}

- (void)set_isRepeating:(BOOL)a3
{
  self->_isRepeating = a3;
}

- (unint64_t)_pressedButton
{
  return self->__pressedButton;
}

- (void)set_pressedButton:(unint64_t)a3
{
  self->__pressedButton = a3;
}

- (double)_value
{
  return self->__value;
}

- (void)set_value:(double)a3
{
  self->__value = a3;
}

- (double)_lastReleaseTimestamp
{
  return self->__lastReleaseTimestamp;
}

- (void)set_lastReleaseTimestamp:(double)a3
{
  self->__lastReleaseTimestamp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_releaseTimer, 0);
  objc_storeStrong((id *)&self->_repeatTimer, 0);
  objc_destroyWeak((id *)&self->_view);
  objc_destroyWeak((id *)&self->_drivable);
}

@end
