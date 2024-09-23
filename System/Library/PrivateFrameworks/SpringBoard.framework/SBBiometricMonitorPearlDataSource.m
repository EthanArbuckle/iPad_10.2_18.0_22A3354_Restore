@implementation SBBiometricMonitorPearlDataSource

- (SBBiometricMonitorPearlDataSource)init
{
  id v3;
  void *v4;
  void *v5;
  SBBiometricMonitorPearlDataSource *v6;

  v3 = objc_alloc_init(MEMORY[0x1E0DAC700]);
  objc_msgSend(v3, "createPearlDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DAC5A0], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:", self);
  v6 = -[SBBiometricMonitorPearlDataSource initWithPearlDevice:](self, "initWithPearlDevice:", v4);

  return v6;
}

- (SBBiometricMonitorPearlDataSource)initWithPearlDevice:(id)a3
{
  id v5;
  SBBiometricMonitorPearlDataSource *v6;
  SBBiometricMonitorPearlDataSource *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBBiometricMonitorPearlDataSource;
  v6 = -[SBBiometricMonitorPearlDataSource init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_pearlDevice, a3);
    -[BKDevicePearl setDelegate:](v7->_pearlDevice, "setDelegate:", v7);
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[BKDevicePearl setDelegate:](self->_pearlDevice, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SBBiometricMonitorPearlDataSource;
  -[SBBiometricMonitorPearlDataSource dealloc](&v3, sel_dealloc);
}

- (void)_forEachObserver:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
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
  v4 = (void (**)(id, _QWORD))a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
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
          objc_enumerationMutation(v5);
        v4[2](v4, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)_setMatching:(BOOL)a3
{
  uint64_t v3;
  _QWORD v4[5];

  if (self->_matching != a3)
  {
    v3 = MEMORY[0x1E0C809B0];
    self->_matching = a3;
    v4[0] = v3;
    v4[1] = 3221225472;
    v4[2] = __50__SBBiometricMonitorPearlDataSource__setMatching___block_invoke;
    v4[3] = &unk_1E8EA27F8;
    v4[4] = self;
    -[SBBiometricMonitorPearlDataSource _forEachObserver:](self, "_forEachObserver:", v4);
  }
}

void __50__SBBiometricMonitorPearlDataSource__setMatching___block_invoke(uint64_t a1, void *a2)
{
  char v3;
  void *v4;
  char v5;
  id v6;

  v6 = a2;
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 24))
  {
    v3 = objc_opt_respondsToSelector();
    v4 = v6;
    if ((v3 & 1) != 0)
    {
      objc_msgSend(v6, "biometricMonitorDataSourceMatchingStarted:", *(_QWORD *)(a1 + 32));
LABEL_6:
      v4 = v6;
    }
  }
  else
  {
    v5 = objc_opt_respondsToSelector();
    v4 = v6;
    if ((v5 & 1) != 0)
    {
      objc_msgSend(v6, "biometricMonitorDataSourceMatchingEnded:", *(_QWORD *)(a1 + 32));
      goto LABEL_6;
    }
  }

}

- (void)_setFaceDetecting:(BOOL)a3
{
  uint64_t v3;
  _QWORD v4[5];

  if (self->_faceDetecting != a3)
  {
    v3 = MEMORY[0x1E0C809B0];
    self->_faceDetecting = a3;
    v4[0] = v3;
    v4[1] = 3221225472;
    v4[2] = __55__SBBiometricMonitorPearlDataSource__setFaceDetecting___block_invoke;
    v4[3] = &unk_1E8EA27F8;
    v4[4] = self;
    -[SBBiometricMonitorPearlDataSource _forEachObserver:](self, "_forEachObserver:", v4);
  }
}

void __55__SBBiometricMonitorPearlDataSource__setFaceDetecting___block_invoke(uint64_t a1, void *a2)
{
  char v3;
  void *v4;
  char v5;
  id v6;

  v6 = a2;
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 24))
  {
    v3 = objc_opt_respondsToSelector();
    v4 = v6;
    if ((v3 & 1) != 0)
    {
      objc_msgSend(v6, "biometricMonitorDataSourcePresenceDetectionStarted:", *(_QWORD *)(a1 + 32));
LABEL_6:
      v4 = v6;
    }
  }
  else
  {
    v5 = objc_opt_respondsToSelector();
    v4 = v6;
    if ((v5 & 1) != 0)
    {
      objc_msgSend(v6, "biometricMonitorDataSourcePresenceDetectionEnded:", *(_QWORD *)(a1 + 32));
      goto LABEL_6;
    }
  }

}

- (void)_setPoseIsMarginal:(BOOL)a3
{
  uint64_t v3;
  _QWORD v4[5];

  if (self->_poseIsMarginal != a3)
  {
    v3 = MEMORY[0x1E0C809B0];
    self->_poseIsMarginal = a3;
    v4[0] = v3;
    v4[1] = 3221225472;
    v4[2] = __56__SBBiometricMonitorPearlDataSource__setPoseIsMarginal___block_invoke;
    v4[3] = &unk_1E8EA27F8;
    v4[4] = self;
    -[SBBiometricMonitorPearlDataSource _forEachObserver:](self, "_forEachObserver:", v4);
  }
}

void __56__SBBiometricMonitorPearlDataSource__setPoseIsMarginal___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "biometricMonitorDataSourcePoseUpdated:", *(_QWORD *)(a1 + 32));

}

- (void)_updateMatching
{
  -[SBBiometricMonitorPearlDataSource _setMatching:](self, "_setMatching:", -[BKDevicePearl pearlState](self->_pearlDevice, "pearlState") == 3);
}

- (void)_updateFaceDetecting
{
  -[SBBiometricMonitorPearlDataSource _setFaceDetecting:](self, "_setFaceDetecting:", (unint64_t)(-[BKDevicePearl pearlState](self->_pearlDevice, "pearlState") - 2) < 3);
}

- (void)biometricResource:(id)a3 observeEvent:(unint64_t)a4
{
  -[SBBiometricMonitorPearlDataSource _setPoseIsMarginal:](self, "_setPoseIsMarginal:", a4 == 23);
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
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
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

- (BOOL)presenceDetectRunning
{
  -[SBBiometricMonitorPearlDataSource _updateFaceDetecting](self, "_updateFaceDetecting");
  return self->_faceDetecting;
}

- (BOOL)matchRunning
{
  -[SBBiometricMonitorPearlDataSource _updateMatching](self, "_updateMatching");
  return self->_matching;
}

- (BOOL)poseIsMarginal
{
  return self->_poseIsMarginal;
}

- (void)device:(id)a3 pearlStateChanged:(int64_t)a4
{
  id v6;
  char v7;
  uint64_t v8;
  id v9;

  v6 = a3;
  v7 = a4 - 1;
  if ((unint64_t)(a4 - 1) <= 4)
  {
    v8 = (0xEu >> v7) & 1;
    v9 = v6;
    -[SBBiometricMonitorPearlDataSource _setMatching:](self, "_setMatching:", (v7 & 0x1F) == 2);
    -[SBBiometricMonitorPearlDataSource _setFaceDetecting:](self, "_setFaceDetecting:", v8);
    v6 = v9;
  }

}

- (void)device:(id)a3 pearlEventOccurred:(int64_t)a4
{
  id v6;
  void (*v7)(uint64_t, void *);
  uint64_t *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v6 = a3;
  switch(a4)
  {
    case 3:
      v9 = v6;
      v11 = MEMORY[0x1E0C809B0];
      v7 = __63__SBBiometricMonitorPearlDataSource_device_pearlEventOccurred___block_invoke_3;
      v8 = &v11;
      goto LABEL_6;
    case 4:
      v9 = v6;
      v10 = MEMORY[0x1E0C809B0];
      v7 = __63__SBBiometricMonitorPearlDataSource_device_pearlEventOccurred___block_invoke_4;
      v8 = &v10;
      goto LABEL_6;
    case 6:
      v9 = v6;
      v13 = MEMORY[0x1E0C809B0];
      v7 = __63__SBBiometricMonitorPearlDataSource_device_pearlEventOccurred___block_invoke;
      v8 = &v13;
      goto LABEL_6;
    case 7:
      v9 = v6;
      v12 = MEMORY[0x1E0C809B0];
      v7 = __63__SBBiometricMonitorPearlDataSource_device_pearlEventOccurred___block_invoke_2;
      v8 = &v12;
LABEL_6:
      v8[1] = 3221225472;
      v8[2] = (uint64_t)v7;
      v8[3] = (uint64_t)&unk_1E8EA27F8;
      v8[4] = (uint64_t)self;
      -[SBBiometricMonitorPearlDataSource _forEachObserver:](self, "_forEachObserver:");
      v6 = v9;
      break;
    default:
      break;
  }

}

void __63__SBBiometricMonitorPearlDataSource_device_pearlEventOccurred___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "biometricMonitorDataSourceMatchingSucceeded:", *(_QWORD *)(a1 + 32));

}

void __63__SBBiometricMonitorPearlDataSource_device_pearlEventOccurred___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "biometricMonitorDataSourceMatchingFailed:", *(_QWORD *)(a1 + 32));

}

void __63__SBBiometricMonitorPearlDataSource_device_pearlEventOccurred___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "biometricMonitorDataSourcePresenceDetectionSucceeded:", *(_QWORD *)(a1 + 32));

}

void __63__SBBiometricMonitorPearlDataSource_device_pearlEventOccurred___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "biometricMonitorDataSourcePresenceDetectionFailed:", *(_QWORD *)(a1 + 32));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_pearlDevice, 0);
}

@end
