@implementation SBVolumeButtonEventMapper

- (SBVolumeButtonEventMapper)init
{
  SBVolumeButtonEventMapper *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id location;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)SBVolumeButtonEventMapper;
  v2 = -[SBVolumeButtonEventMapper init](&v18, sel_init);
  if (v2)
  {
    v3 = SBHScreenTypeForCurrentDevice();
    v4 = 8;
    if (v3 == 34)
      v4 = 1;
    v2->_effectiveInterfaceOrientation = 0;
    v2->_buttonsEdge = v4;
    v2->_layoutDirection = objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1;
    +[SBDefaults localDefaults](SBDefaults, "localDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hardwareDefaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak(&location, v2);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "disableNaturalVolumeButtonOrientation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C80D38];
    v9 = MEMORY[0x1E0C80D38];
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __33__SBVolumeButtonEventMapper_init__block_invoke;
    v15 = &unk_1E8E9DF28;
    objc_copyWeak(&v16, &location);
    v10 = (id)objc_msgSend(v6, "observeDefault:onQueue:withBlock:", v7, v8, &v12);

    -[SBVolumeButtonEventMapper _hardwareDefaultsChanged](v2, "_hardwareDefaultsChanged", v12, v13, v14, v15);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);

  }
  return v2;
}

void __33__SBVolumeButtonEventMapper_init__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_hardwareDefaultsChanged");

}

- (void)dealloc
{
  objc_super v3;

  -[SBVolumeButtonEventMapper setVolumeButtonRemappingEnabled:](self, "setVolumeButtonRemappingEnabled:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SBVolumeButtonEventMapper;
  -[SBVolumeButtonEventMapper dealloc](&v3, sel_dealloc);
}

+ (BOOL)isVolumeButtonRemappingSupported
{
  BOOL v2;
  void *v3;

  if (__sb__runningInSpringBoard())
    return SBFEffectiveDeviceClass() == 2;
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v3, "userInterfaceIdiom") == 1;

  return v2;
}

+ (BOOL)shouldInvertVolumeButtonsOnEdge:(unint64_t)a3 forInterfaceOrientation:(int64_t)a4 userInterfaceLayoutDirection:(int64_t)a5
{
  if (a3 == 8)
  {
    if (a5 == 1)
      return objc_msgSend(a1, "_shouldInvertVolumeButtonsForRTLRightEdgePadInInterfaceOrientation:", a4);
    else
      return objc_msgSend(a1, "_shouldInvertVolumeButtonsForLTRRightEdgePadInInterfaceOrientation:", a4);
  }
  else if (a3 == 1)
  {
    if (a5 == 1)
      return objc_msgSend(a1, "_shouldInvertVolumeButtonsForRTLTopEdgePadInInterfaceOrientation:", a4);
    else
      return objc_msgSend(a1, "_shouldInvertVolumeButtonsForLTRTopEdgePadInInterfaceOrientation:", a4);
  }
  else
  {
    return 0;
  }
}

- (BOOL)isVolumeButtonEventInvertible:(id)a3 withPressType:(int64_t)a4
{
  uint64_t v5;
  int Type;
  char v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t SenderID;
  int v13;
  NSObject *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if ((a4 & 0xFFFFFFFFFFFFFFFELL) != 0x66 || !self->_volumeButtonRemappingEnabled)
    return 0;
  v5 = objc_msgSend(a3, "_hidEvent");
  if ((unint64_t)(IOHIDEventGetIntegerValue() - 233) > 1)
    return 0;
  Type = IOHIDEventGetType();
  v7 = 0;
  if (v5 && Type == 3)
  {
    BKSHIDEventGetBaseAttributes();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "source"))
    {
      SBLogButtonsVolume();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        NSStringFromBKSHIDEventSource();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138543362;
        v16 = (uint64_t)v10;
        _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_INFO, "will not remap presses from source: %{public}@", (uint8_t *)&v15, 0xCu);

      }
      v7 = 0;
    }
    else
    {
      SenderID = IOHIDEventGetSenderID();
      v13 = SBHIDIsAccessibilitySenderID(SenderID);
      if (v13)
      {
        SBLogButtonsVolume();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          v15 = 134217984;
          v16 = SenderID;
          _os_log_impl(&dword_1D0540000, v14, OS_LOG_TYPE_INFO, "will not remap presses from accessibility sender: %llX", (uint8_t *)&v15, 0xCu);
        }

      }
      v7 = v13 ^ 1;
    }

  }
  return v7;
}

- (BOOL)shouldInvertVolumeButtonsForEvent:(id)a3 withPressType:(int64_t)a4
{
  int64_t v5;
  int64_t layoutDirection;
  int v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  const __CFString *v13;
  uint64_t v14;
  unint64_t v15;
  const __CFString *v16;
  const __CFString *v17;
  const char *v18;
  NSObject *v19;
  os_log_type_t v20;
  const __CFString *v21;
  int v23;
  uint64_t v24;
  __int16 v25;
  const __CFString *v26;
  __int16 v27;
  const __CFString *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (-[SBVolumeButtonEventMapper isVolumeButtonEventInvertible:withPressType:](self, "isVolumeButtonEventInvertible:withPressType:", a3, a4))
  {
    v5 = -[SBVolumeButtonEventMapper effectiveInterfaceOrientation](self, "effectiveInterfaceOrientation");
    layoutDirection = self->_layoutDirection;
    v7 = objc_msgSend((id)objc_opt_class(), "shouldInvertVolumeButtonsOnEdge:forInterfaceOrientation:userInterfaceLayoutDirection:", self->_buttonsEdge, v5, layoutDirection);
    SBLogButtonsVolume();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v7)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        BSInterfaceOrientationDescription();
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = (void *)v10;
        v12 = self->_buttonsEdge - 1;
        if (v12 > 7)
          v13 = CFSTR("(unknown)");
        else
          v13 = off_1E8EB8628[v12];
        v17 = CFSTR("LTR");
        v23 = 138543874;
        v24 = v10;
        v25 = 2114;
        if (layoutDirection == 1)
          v17 = CFSTR("RTL");
        v26 = v13;
        v27 = 2114;
        v28 = v17;
        v18 = "we will remap presses in %{public}@ on a device with buttons on the %{public}@ in %{public}@";
        v19 = v9;
        v20 = OS_LOG_TYPE_DEFAULT;
LABEL_18:
        _os_log_impl(&dword_1D0540000, v19, v20, v18, (uint8_t *)&v23, 0x20u);

      }
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      BSInterfaceOrientationDescription();
      v14 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v14;
      v15 = self->_buttonsEdge - 1;
      if (v15 > 7)
        v16 = CFSTR("(unknown)");
      else
        v16 = off_1E8EB8628[v15];
      v21 = CFSTR("LTR");
      v23 = 138543874;
      v24 = v14;
      v25 = 2114;
      if (layoutDirection == 1)
        v21 = CFSTR("RTL");
      v26 = v16;
      v27 = 2114;
      v28 = v21;
      v18 = "presses in %{public}@ don't need remapping on a device with buttons on the %{public}@ in %{public}@";
      v19 = v9;
      v20 = OS_LOG_TYPE_INFO;
      goto LABEL_18;
    }

    return v7;
  }
  LOBYTE(v7) = 0;
  return v7;
}

- (void)setVolumeButtonRemappingEnabled:(BOOL)a3
{
  if (self->_volumeButtonRemappingEnabled != a3)
  {
    self->_volumeButtonRemappingEnabled = a3;
    if (a3)
    {
      objc_msgSend((id)SBApp, "addActiveOrientationObserver:", self);
      -[SBVolumeButtonEventMapper _resetEffectiveInterfaceOrientation](self, "_resetEffectiveInterfaceOrientation");
    }
    else
    {
      objc_msgSend((id)SBApp, "removeActiveOrientationObserver:", self);
      self->_effectiveInterfaceOrientation = 0;
    }
  }
}

- (BOOL)isPreventingEffectiveInterfaceOrientationChanges
{
  return 0;
}

- (int64_t)effectiveInterfaceOrientation
{
  void *v3;
  int v4;

  +[SBBacklightController sharedInstance](SBBacklightController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "screenIsOn");

  if (v4)
    return self->_effectiveInterfaceOrientation;
  else
    return BKHIDServicesGetNonFlatDeviceOrientation();
}

- (void)activeInterfaceOrientationDidChangeToOrientation:(int64_t)a3 willAnimateWithDuration:(double)a4 fromOrientation:(int64_t)a5
{
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14[3];
  id location;

  objc_initWeak(&location, self);
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __118__SBVolumeButtonEventMapper_activeInterfaceOrientationDidChangeToOrientation_willAnimateWithDuration_fromOrientation___block_invoke;
  v13 = &unk_1E8EB85E8;
  objc_copyWeak(v14, &location);
  v14[1] = (id)a3;
  v14[2] = (id)a5;
  v8 = MEMORY[0x1D17E5550](&v10);
  v9 = (void *)v8;
  if (a4 <= 0.0)
    (*(void (**)(uint64_t, uint64_t))(v8 + 16))(v8, 1);
  else
    objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:completion:", &__block_literal_global_289, v8, a4, v10, v11, v12, v13);

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
}

void __118__SBVolumeButtonEventMapper_activeInterfaceOrientationDidChangeToOrientation_willAnimateWithDuration_fromOrientation___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained[2];
  if (objc_msgSend(WeakRetained, "isPreventingEffectiveInterfaceOrientationChanges"))
  {
    SBLogButtonsVolume();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      BSInterfaceOrientationDescription();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      BSInterfaceOrientationDescription();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v5;
      v14 = 2114;
      v15 = v6;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_INFO, "effective interface orientation for volume button remapping NOT changing from: %{public}@ to: %{public}@ (it's disabled!)", (uint8_t *)&v12, 0x16u);

    }
LABEL_9:

    goto LABEL_10;
  }
  WeakRetained[2] = *(_QWORD *)(a1 + 40);
  SBLogButtonsVolume();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    BSInterfaceOrientationDescription();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    BSInterfaceOrientationDescription();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v8;
    v14 = 2114;
    v15 = v9;
    _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_INFO, "effective interface orientation for volume button remapping changing from: %{public}@ to: %{public}@", (uint8_t *)&v12, 0x16u);

  }
  if (*(_QWORD *)(a1 + 48) != v3)
  {
    SBLogButtonsVolume();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      BSInterfaceOrientationDescription();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      BSInterfaceOrientationDescription();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v10;
      v14 = 2114;
      v15 = v11;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_INFO, "effective interface orientation for volume button remapping - update had a fromOrientation mismatch, got: %{public}@, expected: %{public}@", (uint8_t *)&v12, 0x16u);

    }
    goto LABEL_9;
  }
LABEL_10:

}

+ (BOOL)_shouldInvertVolumeButtonsForLTRRightEdgePadInInterfaceOrientation:(int64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFELL) == 2;
}

+ (BOOL)_shouldInvertVolumeButtonsForRTLRightEdgePadInInterfaceOrientation:(int64_t)a3
{
  return ((a3 - 2) & 0xFFFFFFFFFFFFFFFDLL) == 0;
}

+ (BOOL)_shouldInvertVolumeButtonsForLTRTopEdgePadInInterfaceOrientation:(int64_t)a3
{
  return ((a3 - 2) & 0xFFFFFFFFFFFFFFFDLL) == 0;
}

+ (BOOL)_shouldInvertVolumeButtonsForRTLTopEdgePadInInterfaceOrientation:(int64_t)a3
{
  return a3 == 4 || a3 == 1;
}

- (void)_hardwareDefaultsChanged
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  NSObject *v6;
  const __CFString *v7;
  int v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = -[SBVolumeButtonEventMapper isVolumeButtonRemappingEnabled](self, "isVolumeButtonRemappingEnabled");
  +[SBDefaults localDefaults](SBDefaults, "localDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hardwareDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBVolumeButtonEventMapper setVolumeButtonRemappingEnabled:](self, "setVolumeButtonRemappingEnabled:", objc_msgSend(v5, "isNaturalVolumeButtonOrientationEnabled"));

  if (v3 != -[SBVolumeButtonEventMapper isVolumeButtonRemappingEnabled](self, "isVolumeButtonRemappingEnabled"))
  {
    SBLogButtonsVolume();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_volumeButtonRemappingEnabled)
        v7 = CFSTR("enabled");
      else
        v7 = CFSTR("disabled");
      v8 = 138543362;
      v9 = v7;
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "volume button remapping is now %{public}@", (uint8_t *)&v8, 0xCu);
    }

  }
}

- (void)_resetEffectiveInterfaceOrientation
{
  self->_effectiveInterfaceOrientation = objc_msgSend((id)*MEMORY[0x1E0CEB258], "activeInterfaceOrientation");
}

- (BOOL)isVolumeButtonRemappingEnabled
{
  return self->_volumeButtonRemappingEnabled;
}

- (void)setEffectiveInterfaceOrientation:(int64_t)a3
{
  self->_effectiveInterfaceOrientation = a3;
}

- (unint64_t)buttonsEdge
{
  return self->_buttonsEdge;
}

- (void)setButtonsEdge:(unint64_t)a3
{
  self->_buttonsEdge = a3;
}

- (int64_t)layoutDirection
{
  return self->_layoutDirection;
}

- (void)setLayoutDirection:(int64_t)a3
{
  self->_layoutDirection = a3;
}

@end
