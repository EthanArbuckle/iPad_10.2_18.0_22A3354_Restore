@implementation SBUIFlashlightController

- (void)_postAvailabilityChangeNotification:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "flashlightAvailabilityDidChange:", v3);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (BOOL)isAvailable
{
  return self->_available;
}

- (unint64_t)level
{
  return self->_level;
}

uint64_t __75__SBUIFlashlightController_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateObservedAvailability:isOverheated:", *(unsigned __int8 *)(a1 + 40), objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "isOverheated"));
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  id v25;
  char v26;
  NSObject *v27;
  _QWORD *v28;
  void *v29;
  uint64_t v30;
  id v31;
  void *v32;
  char v33;
  int v34;
  int v35;
  objc_super v36;
  _QWORD block[5];
  int v38;
  _QWORD v39[5];
  int v40;
  _QWORD v41[5];
  char v42;
  _QWORD v43[5];
  char v44;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("available")))
  {
    objc_msgSend(v12, "objectForKey:", *MEMORY[0x24BDD0E70]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_opt_class();
    v15 = v13;
    if (v14)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v16 = v15;
      else
        v16 = 0;
    }
    else
    {
      v16 = 0;
    }
    v25 = v16;

    if (os_log_type_enabled((os_log_t)CCUILogFlashlightModule, OS_LOG_TYPE_DEBUG))
      -[SBUIFlashlightController observeValueForKeyPath:ofObject:change:context:].cold.1();
    v26 = objc_msgSend(v25, "BOOLValue");
    v43[0] = MEMORY[0x24BDAC760];
    v43[1] = 3221225472;
    v43[2] = __75__SBUIFlashlightController_observeValueForKeyPath_ofObject_change_context___block_invoke;
    v43[3] = &unk_24D4D0448;
    v43[4] = self;
    v44 = v26;
    v27 = MEMORY[0x24BDAC9B8];
    v28 = v43;
LABEL_38:
    dispatch_async(v27, v28);

    goto LABEL_39;
  }
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("overheated")))
  {
    objc_msgSend(v12, "objectForKey:", *MEMORY[0x24BDD0E70]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_opt_class();
    v19 = v17;
    if (v18)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v20 = v19;
      else
        v20 = 0;
    }
    else
    {
      v20 = 0;
    }
    v25 = v20;

    if (os_log_type_enabled((os_log_t)CCUILogFlashlightModule, OS_LOG_TYPE_DEBUG))
      -[SBUIFlashlightController observeValueForKeyPath:ofObject:change:context:].cold.2();
    v33 = objc_msgSend(v25, "BOOLValue");
    v41[0] = MEMORY[0x24BDAC760];
    v41[1] = 3221225472;
    v41[2] = __75__SBUIFlashlightController_observeValueForKeyPath_ofObject_change_context___block_invoke_24;
    v41[3] = &unk_24D4D0448;
    v41[4] = self;
    v42 = v33;
    v27 = MEMORY[0x24BDAC9B8];
    v28 = v41;
    goto LABEL_38;
  }
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("flashlightLevel")))
  {
    objc_msgSend(v12, "objectForKey:", *MEMORY[0x24BDD0E70]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_opt_class();
    v23 = v21;
    if (v22)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v24 = v23;
      else
        v24 = 0;
    }
    else
    {
      v24 = 0;
    }
    v25 = v24;

    if (os_log_type_enabled((os_log_t)CCUILogFlashlightModule, OS_LOG_TYPE_DEBUG))
      -[SBUIFlashlightController observeValueForKeyPath:ofObject:change:context:].cold.3();
    objc_msgSend(v25, "floatValue");
    v39[0] = MEMORY[0x24BDAC760];
    v39[1] = 3221225472;
    v39[2] = __75__SBUIFlashlightController_observeValueForKeyPath_ofObject_change_context___block_invoke_25;
    v39[3] = &unk_24D4D0470;
    v39[4] = self;
    v40 = v34;
    v27 = MEMORY[0x24BDAC9B8];
    v28 = v39;
    goto LABEL_38;
  }
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("beamWidth")))
  {
    objc_msgSend(v12, "objectForKey:", *MEMORY[0x24BDD0E70]);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_opt_class();
    v31 = v29;
    if (v30)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v32 = v31;
      else
        v32 = 0;
    }
    else
    {
      v32 = 0;
    }
    v25 = v32;

    if (os_log_type_enabled((os_log_t)CCUILogFlashlightModule, OS_LOG_TYPE_DEBUG))
      -[SBUIFlashlightController observeValueForKeyPath:ofObject:change:context:].cold.4();
    objc_msgSend(v25, "floatValue");
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __75__SBUIFlashlightController_observeValueForKeyPath_ofObject_change_context___block_invoke_26;
    block[3] = &unk_24D4D0470;
    block[4] = self;
    v38 = v35;
    v27 = MEMORY[0x24BDAC9B8];
    v28 = block;
    goto LABEL_38;
  }
  v36.receiver = self;
  v36.super_class = (Class)SBUIFlashlightController;
  -[SBUIFlashlightController observeValueForKeyPath:ofObject:change:context:](&v36, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
LABEL_39:

}

+ (BOOL)deviceSupportsFlashlight
{
  return objc_msgSend(MEMORY[0x24BDB2558], "hasFlashlight");
}

- (BOOL)deviceSupportsDynamicFlashlightInterface
{
  uint64_t v2;

  v2 = SBFEffectiveArtworkSubtype();
  if (v2 > 2795)
  {
    if (v2 != 2868 && v2 != 2796)
      return 0;
    return _os_feature_enabled_impl();
  }
  if (v2 == 2556 || v2 == 2622)
    return _os_feature_enabled_impl();
  return 0;
}

- (SBUIFlashlightController)init
{
  char *v2;
  id v3;
  void *v4;
  BOOL v5;
  float v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  void *v12;
  os_log_t v13;
  void *v14;
  int v15;
  int v16;
  float v17;
  int v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  char *v23;
  void *v24;
  void *v25;
  float v27;
  float v28;
  _QWORD v29[4];
  id v30;
  id location;
  _QWORD v32[4];
  char *v33;
  objc_super v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x24BDAC8D0];
  v34.receiver = self;
  v34.super_class = (Class)SBUIFlashlightController;
  v2 = -[SBUIFlashlightController init](&v34, sel_init);
  if (!v2)
    return (SBUIFlashlightController *)v2;
  v3 = objc_alloc_init(MEMORY[0x24BDB2558]);
  v4 = (void *)*((_QWORD *)v2 + 1);
  *((_QWORD *)v2 + 1) = v3;

  objc_msgSend(*((id *)v2 + 1), "addObserver:forKeyPath:options:context:", v2, CFSTR("available"), 1, 0);
  objc_msgSend(*((id *)v2 + 1), "addObserver:forKeyPath:options:context:", v2, CFSTR("overheated"), 1, 0);
  objc_msgSend(*((id *)v2 + 1), "addObserver:forKeyPath:options:context:", v2, CFSTR("flashlightLevel"), 1, 0);
  v2[65] = objc_msgSend(*((id *)v2 + 1), "isOverheated");
  if (objc_msgSend(*((id *)v2 + 1), "isAvailable"))
    v5 = v2[65] == 0;
  else
    v5 = 0;
  v2[66] = v5;
  objc_msgSend(*((id *)v2 + 1), "flashlightLevel");
  *((float *)v2 + 17) = v6;
  if (v6 == 0.0)
  {
    v7 = 0;
  }
  else if (v6 >= 0.5)
  {
    v7 = 2;
    v8 = 4;
    if (v6 < 1.0)
      v8 = 3;
    if (v6 >= 0.85)
      v7 = v8;
  }
  else
  {
    v7 = 1;
  }
  *((_QWORD *)v2 + 3) = v7;
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v9, QOS_CLASS_USER_INITIATED, 0);
  v10 = objc_claimAutoreleasedReturnValue();

  v11 = dispatch_queue_create("com.apple.ControlCenter.FlashlightModule.AVFlashlight", v10);
  v12 = (void *)*((_QWORD *)v2 + 2);
  *((_QWORD *)v2 + 2) = v11;

  if (!CCUILogFlashlightModule)
  {
    v13 = os_log_create("com.apple.ControlCenter", "Flashlight");
    v14 = (void *)CCUILogFlashlightModule;
    CCUILogFlashlightModule = (uint64_t)v13;

  }
  v15 = objc_msgSend(*((id *)v2 + 1), "beamWidthControlSupported");
  v2[41] = v15;
  if (v15)
  {
    objc_msgSend(*((id *)v2 + 1), "minBeamWidth");
    *((_DWORD *)v2 + 12) = v16;
    objc_msgSend(*((id *)v2 + 1), "maxBeamWidth");
    *((float *)v2 + 13) = v17;
    if (v17 == *((float *)v2 + 12))
    {
      v2[41] = 0;
    }
    else
    {
      objc_msgSend(*((id *)v2 + 1), "addObserver:forKeyPath:options:context:", v2, CFSTR("beamWidth"), 1, 0);
      objc_msgSend(*((id *)v2 + 1), "beamWidth");
      *((float *)v2 + 11) = v27;
      v28 = fmax(fmin((v27 - *((float *)v2 + 12)) / (*((float *)v2 + 13) - *((float *)v2 + 12)), 1.0), 0.0);
      *((float *)v2 + 18) = v28;
      if (v2[41])
        goto LABEL_19;
    }
  }
  *((_DWORD *)v2 + 13) = 1065353216;
  *(_QWORD *)(v2 + 44) = 1065353216;
  *((_DWORD *)v2 + 18) = 1065353216;
LABEL_19:
  v18 = objc_msgSend(v2, "deviceSupportsDynamicFlashlightInterface");
  v2[40] = v18;
  if (v18)
  {
    v19 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6FB8]), "initWithLength:", 2);
    v20 = (void *)*((_QWORD *)v2 + 7);
    *((_QWORD *)v2 + 7) = v19;

    v21 = (void *)*((_QWORD *)v2 + 7);
    v22 = MEMORY[0x24BDAC760];
    v32[0] = MEMORY[0x24BDAC760];
    v32[1] = 3221225472;
    v32[2] = __32__SBUIFlashlightController_init__block_invoke;
    v32[3] = &unk_24D4D03D8;
    v23 = v2;
    v33 = v23;
    objc_msgSend(v21, "_mutateValue:", v32);
    objc_initWeak(&location, v23);
    v24 = (void *)MEMORY[0x24BDF6F90];
    v35[0] = *((_QWORD *)v2 + 7);
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v22;
    v29[1] = 3221225472;
    v29[2] = __32__SBUIFlashlightController_init__block_invoke_2;
    v29[3] = &unk_24D4D0400;
    objc_copyWeak(&v30, &location);
    objc_msgSend(v24, "_createTransformerWithInputAnimatableProperties:presentationValueChangedCallback:", v25, v29);

    v23[64] = 0;
    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);

  }
  return (SBUIFlashlightController *)v2;
}

double __32__SBUIFlashlightController_init__block_invoke(uint64_t a1, double *a2)
{
  double result;

  *a2 = *(float *)(*(_QWORD *)(a1 + 32) + 68);
  result = *(float *)(*(_QWORD *)(a1 + 32) + 44);
  a2[1] = result;
  return result;
}

void __32__SBUIFlashlightController_init__block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  uint64_t v2;
  double v3;
  double v4;
  id *v5;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v2 = objc_msgSend(WeakRetained[7], "_presentationValue");
    v3 = *(double *)v2;
    *(float *)&v3 = *(double *)v2;
    objc_msgSend(v5, "_setFlashlightLevel:", v3);
    v4 = *(double *)(v2 + 8);
    *(float *)&v4 = v4;
    objc_msgSend(v5, "_setFlashlightBeamWidth:", v4);
    WeakRetained = v5;
  }

}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_2);
  return (id)sharedInstance__instance;
}

void __42__SBUIFlashlightController_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance__instance;
  sharedInstance__instance = v0;

}

- (void)turnFlashlightOnForReason:(id)a3
{
  id v4;
  NSObject *v5;
  float v6;
  uint8_t buf[4];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (self->_dynamicInterfaceEnabled)
  {
    v6 = 0.0;
    *(float *)buf = 0.0;
    -[SBUIFlashlightController _loadFlashlightIntensity:width:](self, "_loadFlashlightIntensity:width:", buf, &v6);
    -[SBUIFlashlightController _setIntensity:width:animated:withPowerChange:](self, "_setIntensity:width:animated:withPowerChange:", 1, 0, *(float *)buf, v6);
    self->_level = SBUIFlashlightLevelDefault;
    -[SBUIFlashlightController _postLevelChangeNotification:](self, "_postLevelChangeNotification:");
  }
  else
  {
    -[SBUIFlashlightController setLevel:](self, "setLevel:", -[SBUIFlashlightController _loadFlashlightLevel](self, "_loadFlashlightLevel"));
  }
  v5 = CCUILogFlashlightModule;
  if (os_log_type_enabled((os_log_t)CCUILogFlashlightModule, OS_LOG_TYPE_INFO))
  {
    *(float *)buf = 5.7779e-34;
    v8 = v4;
    _os_log_impl(&dword_215F8C000, v5, OS_LOG_TYPE_INFO, "[Flashlight Controller] On: %@", buf, 0xCu);
  }

}

- (void)turnFlashlightOffForReason:(id)a3
{
  -[SBUIFlashlightController turnFlashlightOffForReason:withCoolDown:](self, "turnFlashlightOffForReason:withCoolDown:", a3, 0);
}

- (void)turnFlashlightOffForReason:(id)a3 withCoolDown:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  const __CFString *v8;
  uint64_t v9;
  int v10;
  const __CFString *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v4 = a4;
  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = CCUILogFlashlightModule;
  if (os_log_type_enabled((os_log_t)CCUILogFlashlightModule, OS_LOG_TYPE_INFO))
  {
    v8 = &stru_24D4D22E0;
    if (v4)
      v8 = CFSTR(" (with coolDown)");
    v10 = 138412546;
    v11 = v8;
    v12 = 2112;
    v13 = v6;
    _os_log_impl(&dword_215F8C000, v7, OS_LOG_TYPE_INFO, "[Flashlight Controller] Off%@: %@", (uint8_t *)&v10, 0x16u);
  }
  if (v4)
    v9 = 2;
  else
    v9 = 1;
  if (self->_dynamicInterfaceEnabled && self->_intensity > 0.0)
    -[SBUIFlashlightController _setIntensity:width:animated:withPowerChange:](self, "_setIntensity:width:animated:withPowerChange:", 1, v9, 0.0, 1.0);
  else
    -[SBUIFlashlightController _applyPowerChange:](self, "_applyPowerChange:", v9);

}

- (void)setLevel:(unint64_t)a3
{
  NSObject *v5;
  double v6;
  int v7;
  unint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v5 = CCUILogFlashlightModule;
  if (os_log_type_enabled((os_log_t)CCUILogFlashlightModule, OS_LOG_TYPE_INFO))
  {
    v7 = 134217984;
    v8 = a3;
    _os_log_impl(&dword_215F8C000, v5, OS_LOG_TYPE_INFO, "[Flashlight Controller] setLevel: %lu", (uint8_t *)&v7, 0xCu);
  }
  if (self->_level != a3)
  {
    self->_level = a3;
    -[SBUIFlashlightController _postLevelChangeNotification:](self, "_postLevelChangeNotification:", a3);
    -[SBUIFlashlightController _storeFlashlightLevel:](self, "_storeFlashlightLevel:", a3);
  }
  LODWORD(v6) = 0;
  if (a3 - 1 <= 3)
    LODWORD(v6) = dword_215FA4E80[a3 - 1];
  -[SBUIFlashlightController _setFlashlightLevel:](self, "_setFlashlightLevel:", v6);
}

- (void)setIntensity:(double)a3 width:(double)a4 animated:(BOOL)a5
{
  -[SBUIFlashlightController _setIntensity:width:animated:withPowerChange:](self, "_setIntensity:width:animated:withPowerChange:", a5, 0, a3, a4);
}

- (void)addObserver:(id)a3
{
  id v4;
  NSHashTable *observers;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v4 = a3;
  observers = self->_observers;
  v8 = v4;
  if (!observers)
  {
    objc_msgSend(MEMORY[0x24BDD15C0], "hashTableWithOptions:", 5);
    v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v7 = self->_observers;
    self->_observers = v6;

    v4 = v8;
    observers = self->_observers;
  }
  -[NSHashTable addObject:](observers, "addObject:", v4);

}

- (void)removeObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

- (void)removeAllObservers
{
  -[NSHashTable removeAllObjects](self->_observers, "removeAllObjects");
}

uint64_t __75__SBUIFlashlightController_observeValueForKeyPath_ofObject_change_context___block_invoke_24(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateObservedAvailability:isOverheated:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "isAvailable"), *(unsigned __int8 *)(a1 + 40));
}

uint64_t __75__SBUIFlashlightController_observeValueForKeyPath_ofObject_change_context___block_invoke_25(uint64_t a1, double a2)
{
  LODWORD(a2) = *(_DWORD *)(a1 + 40);
  return objc_msgSend(*(id *)(a1 + 32), "_updateObservedFlashlightLevel:", a2);
}

uint64_t __75__SBUIFlashlightController_observeValueForKeyPath_ofObject_change_context___block_invoke_26(uint64_t a1, double a2)
{
  LODWORD(a2) = *(_DWORD *)(a1 + 40);
  return objc_msgSend(*(id *)(a1 + 32), "_updateObservedBeamWidth:", a2);
}

- (void)_updateObservedAvailability:(BOOL)a3 isOverheated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL4 v5;
  NSObject *v7;
  _BOOL4 overheated;
  _BOOL8 v9;
  NSObject *v10;
  _BOOL4 v11;
  int v12;
  _BOOL4 v13;
  uint64_t v14;

  v4 = a4;
  v5 = a3;
  v14 = *MEMORY[0x24BDAC8D0];
  if (self->_overheated != a4)
  {
    self->_overheated = a4;
    v7 = CCUILogFlashlightModule;
    if (os_log_type_enabled((os_log_t)CCUILogFlashlightModule, OS_LOG_TYPE_INFO))
    {
      overheated = self->_overheated;
      v12 = 67109120;
      v13 = overheated;
      _os_log_impl(&dword_215F8C000, v7, OS_LOG_TYPE_INFO, "[Flashlight Controller] posting overheated change to: %u", (uint8_t *)&v12, 8u);
    }
    -[SBUIFlashlightController _postOverheatedChangeNotification:](self, "_postOverheatedChangeNotification:", v4);
  }
  v9 = v5 & ~v4;
  if (self->_available != v9)
  {
    self->_available = v9;
    v10 = CCUILogFlashlightModule;
    if (os_log_type_enabled((os_log_t)CCUILogFlashlightModule, OS_LOG_TYPE_INFO))
    {
      v11 = self->_overheated;
      v12 = 67109120;
      v13 = v11;
      _os_log_impl(&dword_215F8C000, v10, OS_LOG_TYPE_INFO, "[Flashlight Controller] posting available change to: %u", (uint8_t *)&v12, 8u);
    }
    -[SBUIFlashlightController _postAvailabilityChangeNotification:](self, "_postAvailabilityChangeNotification:", v9);
  }
}

- (void)_updateObservedFlashlightLevel:(float)a3
{
  unint64_t v4;
  uint64_t v5;
  NSObject *v6;
  unint64_t level;
  int v8;
  unint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (a3 == 0.0)
  {
    v4 = 0;
  }
  else if (a3 >= 0.5)
  {
    v5 = 4;
    if (a3 < 1.0)
      v5 = 3;
    if (a3 >= 0.85)
      v4 = v5;
    else
      v4 = 2;
  }
  else
  {
    v4 = 1;
  }
  if (self->_level != v4 && !self->_segmentAnimationInProgress)
  {
    self->_level = v4;
    v6 = CCUILogFlashlightModule;
    if (os_log_type_enabled((os_log_t)CCUILogFlashlightModule, OS_LOG_TYPE_INFO))
    {
      level = self->_level;
      v8 = 134217984;
      v9 = level;
      _os_log_impl(&dword_215F8C000, v6, OS_LOG_TYPE_INFO, "[Flashlight Controller] posting intensity change to: %lu", (uint8_t *)&v8, 0xCu);
    }
    -[SBUIFlashlightController _postLevelChangeNotification:](self, "_postLevelChangeNotification:", v4);
  }
}

- (void)_updateObservedBeamWidth:(float)a3
{
  float v4;
  NSObject *v5;
  double width;
  double beamWidth;
  int v8;
  double v9;
  __int16 v10;
  double v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (self->_beamWidthSupported && self->_beamWidth != a3 && !self->_segmentAnimationInProgress)
  {
    self->_beamWidth = a3;
    v4 = fmax(fmin((a3 - self->_minBeamWidth) / (self->_maxBeamWidth - self->_minBeamWidth), 1.0), 0.0);
    self->_width = v4;
    v5 = CCUILogFlashlightModule;
    if (os_log_type_enabled((os_log_t)CCUILogFlashlightModule, OS_LOG_TYPE_INFO))
    {
      width = self->_width;
      beamWidth = self->_beamWidth;
      v8 = 134218240;
      v9 = width;
      v10 = 2048;
      v11 = beamWidth;
      _os_log_impl(&dword_215F8C000, v5, OS_LOG_TYPE_INFO, "[Flashlight Controller] applied width change to: %f beamWidth: %f", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (void)_setIntensity:(double)a3 width:(double)a4 animated:(BOOL)a5 withPowerChange:(unint64_t)a6
{
  double v8;
  double v9;
  float v10;
  float v11;
  float maxBeamWidth;
  void *v13;
  void *v14;
  UIViewVectorAnimatableProperty *animatableProperties;
  double v16;
  _QWORD v17[5];
  float v18;
  _QWORD v19[6];
  _QWORD v20[6];
  float v21;

  v8 = fmin(fmax(a3, 0.0), 1.0);
  v9 = fmin(fmax(a4, 0.0), 1.0);
  if (v8 != self->_intensity || v9 != self->_width)
  {
    v10 = v8;
    v11 = v9;
    self->_intensity = v10;
    self->_width = v11;
  }
  if (self->_beamWidthSupported)
  {
    v9 = v9 * self->_maxBeamWidth + (1.0 - v9) * self->_minBeamWidth;
    maxBeamWidth = v9;
    if (!a5)
      goto LABEL_10;
  }
  else
  {
    maxBeamWidth = self->_maxBeamWidth;
    if (!a5)
      goto LABEL_10;
  }
  if (self->_dynamicInterfaceEnabled)
  {
    v13 = (void *)MEMORY[0x24BDF6F90];
    objc_msgSend(MEMORY[0x24BDF6FB0], "behaviorWithDampingRatio:response:", 1.0, 0.3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __73__SBUIFlashlightController__setIntensity_width_animated_withPowerChange___block_invoke;
    v20[3] = &unk_24D4D04B8;
    v20[4] = self;
    *(double *)&v20[5] = v8;
    v21 = maxBeamWidth;
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __73__SBUIFlashlightController__setIntensity_width_animated_withPowerChange___block_invoke_3;
    v19[3] = &unk_24D4D04E0;
    v19[4] = self;
    v19[5] = a6;
    objc_msgSend(v13, "_animateUsingSpringBehavior:tracking:animations:completion:", v14, 0, v20, v19);

    return;
  }
LABEL_10:
  if (!self->_segmentAnimationInProgress && self->_dynamicInterfaceEnabled)
  {
    animatableProperties = self->_animatableProperties;
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __73__SBUIFlashlightController__setIntensity_width_animated_withPowerChange___block_invoke_4;
    v17[3] = &__block_descriptor_44_e9_v16__0_d8l;
    *(double *)&v17[4] = v8;
    v18 = maxBeamWidth;
    -[UIViewVectorAnimatableProperty _mutateValue:](animatableProperties, "_mutateValue:", v17);
  }
  *(float *)&v9 = v8;
  -[SBUIFlashlightController _setFlashlightLevel:](self, "_setFlashlightLevel:", v9);
  *(float *)&v16 = maxBeamWidth;
  -[SBUIFlashlightController _setFlashlightBeamWidth:](self, "_setFlashlightBeamWidth:", v16);
  if (a6)
    -[SBUIFlashlightController _applyPowerChange:](self, "_applyPowerChange:", a6);
}

uint64_t __73__SBUIFlashlightController__setIntensity_width_animated_withPowerChange___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;
  _QWORD v4[5];
  int v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __73__SBUIFlashlightController__setIntensity_width_animated_withPowerChange___block_invoke_2;
  v4[3] = &__block_descriptor_44_e9_v16__0_d8l;
  v4[4] = *(_QWORD *)(a1 + 40);
  v5 = *(_DWORD *)(a1 + 48);
  result = objc_msgSend(v2, "_mutateValue:", v4);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 64) = 1;
  return result;
}

double __73__SBUIFlashlightController__setIntensity_width_animated_withPowerChange___block_invoke_2(uint64_t a1, double *a2)
{
  double result;
  double v3;

  result = *(double *)(a1 + 32);
  v3 = *(float *)(a1 + 40);
  *a2 = result;
  a2[1] = v3;
  return result;
}

uint64_t __73__SBUIFlashlightController__setIntensity_width_animated_withPowerChange___block_invoke_3(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 64) = 0;
  if (*(_QWORD *)(result + 40))
    return objc_msgSend(*(id *)(result + 32), "_applyPowerChange:");
  return result;
}

double __73__SBUIFlashlightController__setIntensity_width_animated_withPowerChange___block_invoke_4(uint64_t a1, double *a2)
{
  double result;
  double v3;

  result = *(double *)(a1 + 32);
  v3 = *(float *)(a1 + 40);
  *a2 = result;
  a2[1] = v3;
  return result;
}

- (void)_applyPowerChange:(unint64_t)a3
{
  NSObject *v5;
  int v6;
  unint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v5 = CCUILogFlashlightModule;
  if (os_log_type_enabled((os_log_t)CCUILogFlashlightModule, OS_LOG_TYPE_INFO))
  {
    v6 = 134217984;
    v7 = a3;
    _os_log_impl(&dword_215F8C000, v5, OS_LOG_TYPE_INFO, "Applying power change: %lu", (uint8_t *)&v6, 0xCu);
  }
  if (a3 == 2)
  {
    -[SBUIFlashlightController _turnPowerOff](self, "_turnPowerOff");
  }
  else if (a3 == 1)
  {
    -[SBUIFlashlightController setLevel:](self, "setLevel:", 0);
  }
}

- (void)_postOverheatedChangeNotification:(BOOL)a3
{
  _BOOL8 v3;
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

  v3 = a3;
  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
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
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v9, "flashlightOverheatedDidChange:", v3);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (void)_postLevelChangeNotification:(unint64_t)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "flashlightLevelDidChange:", a3);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)_setFlashlightLevel:(float)a3
{
  NSObject *flashlightQueue;
  _QWORD v4[5];
  float v5;

  flashlightQueue = self->_flashlightQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __48__SBUIFlashlightController__setFlashlightLevel___block_invoke;
  v4[3] = &unk_24D4D0470;
  v4[4] = self;
  v5 = a3;
  dispatch_async(flashlightQueue, v4);
}

void __48__SBUIFlashlightController__setFlashlightLevel___block_invoke(uint64_t a1, double a2)
{
  void *v2;
  char v3;
  id v4;
  id v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  LODWORD(a2) = *(_DWORD *)(a1 + 40);
  v5 = 0;
  v3 = objc_msgSend(v2, "setFlashlightLevel:withError:", &v5, a2);
  v4 = v5;
  if ((v3 & 1) == 0 && os_log_type_enabled((os_log_t)CCUILogFlashlightModule, OS_LOG_TYPE_ERROR))
    __48__SBUIFlashlightController__setFlashlightLevel___block_invoke_cold_1();

}

- (void)_setFlashlightBeamWidth:(float)a3
{
  float v3;
  NSObject *flashlightQueue;
  _QWORD v5[5];
  float v6;

  if (self->_beamWidthSupported)
  {
    v3 = fmaxf(self->_minBeamWidth, fminf(a3, self->_maxBeamWidth));
    flashlightQueue = self->_flashlightQueue;
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __52__SBUIFlashlightController__setFlashlightBeamWidth___block_invoke;
    v5[3] = &unk_24D4D0470;
    v5[4] = self;
    v6 = v3;
    dispatch_async(flashlightQueue, v5);
  }
}

uint64_t __52__SBUIFlashlightController__setFlashlightBeamWidth___block_invoke(uint64_t a1, double a2)
{
  LODWORD(a2) = *(_DWORD *)(a1 + 40);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setBeamWidth:", a2);
}

- (void)_turnPowerOn
{
  NSObject *v3;
  NSObject *flashlightQueue;
  _QWORD block[5];
  uint8_t buf[16];

  v3 = CCUILogFlashlightModule;
  if (os_log_type_enabled((os_log_t)CCUILogFlashlightModule, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_215F8C000, v3, OS_LOG_TYPE_INFO, "[Flashlight Controller] Power On", buf, 2u);
  }
  flashlightQueue = self->_flashlightQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40__SBUIFlashlightController__turnPowerOn__block_invoke;
  block[3] = &unk_24D4CFFF8;
  block[4] = self;
  dispatch_async(flashlightQueue, block);
}

void __40__SBUIFlashlightController__turnPowerOn__block_invoke(uint64_t a1)
{
  void *v1;
  char v2;
  id v3;
  id v4;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v4 = 0;
  v2 = objc_msgSend(v1, "turnPowerOnWithError:", &v4);
  v3 = v4;
  if ((v2 & 1) == 0 && os_log_type_enabled((os_log_t)CCUILogFlashlightModule, OS_LOG_TYPE_ERROR))
    __40__SBUIFlashlightController__turnPowerOn__block_invoke_cold_1();

}

- (void)_turnPowerOff
{
  NSObject *v3;
  NSObject *flashlightQueue;
  _QWORD block[5];
  uint8_t buf[16];

  -[SBUIFlashlightController setLevel:](self, "setLevel:", 0);
  v3 = CCUILogFlashlightModule;
  if (os_log_type_enabled((os_log_t)CCUILogFlashlightModule, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_215F8C000, v3, OS_LOG_TYPE_INFO, "[Flashlight Controller] Power Off", buf, 2u);
  }
  flashlightQueue = self->_flashlightQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__SBUIFlashlightController__turnPowerOff__block_invoke;
  block[3] = &unk_24D4CFFF8;
  block[4] = self;
  dispatch_async(flashlightQueue, block);
}

uint64_t __41__SBUIFlashlightController__turnPowerOff__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "turnPowerOff");
}

- (void)_storeFlashlightLevel:(unint64_t)a3
{
  id v4;

  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setInteger:forKey:", a3, CFSTR("FlashlightLevel"));

  }
}

- (unint64_t)_loadFlashlightLevel
{
  void *v2;
  unint64_t v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerForKey:", CFSTR("FlashlightLevel"));

  if (v3 - 1 >= 4)
    return SBUIFlashlightLevelDefault;
  else
    return v3;
}

- (void)storeFlashlightIntensity:(float)a3 width:(float)a4
{
  NSObject *v6;
  void *v7;
  double v8;
  void *v9;
  double v10;
  int v11;
  double v12;
  __int16 v13;
  double v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (a3 > 0.0)
  {
    v6 = CCUILogFlashlightModule;
    if (os_log_type_enabled((os_log_t)CCUILogFlashlightModule, OS_LOG_TYPE_INFO))
    {
      v11 = 134218240;
      v12 = a3;
      v13 = 2048;
      v14 = a4;
      _os_log_impl(&dword_215F8C000, v6, OS_LOG_TYPE_INFO, "[Flashlight Controller] Persisting intensity: %f, width: %f", (uint8_t *)&v11, 0x16u);
    }
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v8 = a3;
    objc_msgSend(v7, "setFloat:forKey:", CFSTR("FlashlightIntensity"), v8);

    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v10 = a4;
    objc_msgSend(v9, "setFloat:forKey:", CFSTR("FlashlightWidth"), v10);

  }
}

- (void)_loadFlashlightIntensity:(float *)a3 width:(float *)a4
{
  void *v6;
  void *v7;
  void *v8;
  float v9;
  float v10;
  NSObject *v11;
  double v12;
  void *v13;
  float v14;
  float v15;
  NSObject *v16;
  double v17;
  int v18;
  double v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a3)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("FlashlightIntensity"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v7, "floatForKey:", CFSTR("FlashlightIntensity"));
      v10 = fminf(fmaxf(v9, 0.0), 1.0);
    }
    else
    {
      v10 = 1.0;
    }
    *a3 = v10;
    v11 = CCUILogFlashlightModule;
    if (os_log_type_enabled((os_log_t)CCUILogFlashlightModule, OS_LOG_TYPE_INFO))
    {
      v12 = *a3;
      v18 = 134217984;
      v19 = v12;
      _os_log_impl(&dword_215F8C000, v11, OS_LOG_TYPE_INFO, "[Flashlight Controller] Loaded intensity: %f", (uint8_t *)&v18, 0xCu);
    }
  }
  if (a4)
  {
    objc_msgSend(v7, "objectForKey:", CFSTR("FlashlightWidth"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v7, "floatForKey:", CFSTR("FlashlightWidth"));
      v15 = fminf(fmaxf(v14, 0.0), 1.0);
    }
    else
    {
      v15 = 0.5;
    }
    *a4 = v15;
    v16 = CCUILogFlashlightModule;
    if (os_log_type_enabled((os_log_t)CCUILogFlashlightModule, OS_LOG_TYPE_INFO))
    {
      v17 = *a4;
      v18 = 134217984;
      v19 = v17;
      _os_log_impl(&dword_215F8C000, v16, OS_LOG_TYPE_INFO, "[Flashlight Controller] Loaded width: %f", (uint8_t *)&v18, 0xCu);
    }
  }

}

- (BOOL)isOverheated
{
  return self->_overheated;
}

- (BOOL)isBeamWidthSupported
{
  return self->_beamWidthSupported;
}

- (float)intensity
{
  return self->_intensity;
}

- (float)width
{
  return self->_width;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animatableProperties, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_flashlightQueue, 0);
  objc_storeStrong((id *)&self->_flashlight, 0);
}

- (void)observeValueForKeyPath:ofObject:change:context:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_215F8C000, v0, v1, "[Flashlight Controller] observed available change to: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)observeValueForKeyPath:ofObject:change:context:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_215F8C000, v0, v1, "[Flashlight Controller] observed overheated change to: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)observeValueForKeyPath:ofObject:change:context:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_215F8C000, v0, v1, "[Flashlight Controller] observed flashlightLevel change to: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)observeValueForKeyPath:ofObject:change:context:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_215F8C000, v0, v1, "[Flashlight Controller] observed beamWidth change to: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __48__SBUIFlashlightController__setFlashlightLevel___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_215F8C000, v0, v1, "Error setting flashlight level: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __40__SBUIFlashlightController__turnPowerOn__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_215F8C000, v0, v1, "Error turning on flashlight power: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
