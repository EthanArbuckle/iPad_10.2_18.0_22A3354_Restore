@implementation SBSHardwareButtonService

- (void)_resetEventMaskForButtonKind:(int64_t)a3
{
  BSMutableIntegerMap *buttonConfigurationsPerKind;
  BSMutableIntegerMap *v6;
  BSMutableIntegerMap *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  int v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  _SBSHardwareButtonEventConfiguration *v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  _BYTE v31[10];
  _BYTE v32[10];
  void *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  buttonConfigurationsPerKind = self->_buttonConfigurationsPerKind;
  if (!buttonConfigurationsPerKind)
  {
    v6 = (BSMutableIntegerMap *)objc_alloc_init(MEMORY[0x1E0D017B8]);
    v7 = self->_buttonConfigurationsPerKind;
    self->_buttonConfigurationsPerKind = v6;

    buttonConfigurationsPerKind = self->_buttonConfigurationsPerKind;
  }
  -[BSMutableIntegerMap objectForKey:](buttonConfigurationsPerKind, "objectForKey:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v8, "eventMask");
  v25 = objc_msgSend(v8, "maximumPriority");
  -[BSMutableIntegerMap objectForKey:](self->_consumersPerKind, "objectForKey:", a3);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = 0;
    v14 = *(_QWORD *)v27;
LABEL_5:
    v15 = 0;
    while (1)
    {
      if (*(_QWORD *)v27 != v14)
        objc_enumerationMutation(v9);
      v16 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v15);
      if (objc_msgSend(v16, "buttonKind") == a3)
      {
        v13 |= objc_msgSend(v16, "eventMask");
        v17 = objc_msgSend(v16, "eventPriority");
        if (v17 > v12)
          v12 = v17;
        if ((v13 & 0x10000) != 0)
          break;
      }
      if (v11 == ++v15)
      {
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
        if (v11)
          goto LABEL_5;
        break;
      }
    }
  }
  else
  {
    v12 = 0;
    v13 = 0;
  }

  if (v24 == v13)
  {
    v18 = v25;
    if (v25 == v12)
      goto LABEL_26;
  }
  else
  {
    SBLogCommon();
    v19 = objc_claimAutoreleasedReturnValue();
    v18 = v25;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSBSHardwareButtonKind(a3);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      *(_QWORD *)v31 = v24;
      *(_WORD *)&v31[8] = 2048;
      *(_QWORD *)v32 = v13;
      *(_WORD *)&v32[8] = 2114;
      v33 = v20;
      _os_log_impl(&dword_18EB52000, v19, OS_LOG_TYPE_DEFAULT, "changing event mask from:%lX to:%lX for buttonKind %{public}@", buf, 0x20u);

    }
    if (v25 == v12)
      goto LABEL_25;
  }
  SBLogCommon();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSBSHardwareButtonKind(a3);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)v31 = v18;
    *(_WORD *)&v31[4] = 1024;
    *(_DWORD *)&v31[6] = v12;
    *(_WORD *)v32 = 2114;
    *(_QWORD *)&v32[2] = v22;
    _os_log_impl(&dword_18EB52000, v21, OS_LOG_TYPE_DEFAULT, "changing priority from:%d to:%d for buttonKind %{public}@", buf, 0x18u);

  }
LABEL_25:
  v23 = objc_alloc_init(_SBSHardwareButtonEventConfiguration);
  -[_SBSHardwareButtonEventConfiguration setEventMask:](v23, "setEventMask:", v13);
  -[_SBSHardwareButtonEventConfiguration setMaximumPriority:](v23, "setMaximumPriority:", v12);
  -[BSMutableIntegerMap setObject:forKey:](self->_buttonConfigurationsPerKind, "setObject:forKey:", v23, a3);
  -[SBSHardwareButtonService _setApplicationClientEventMask:buttonKind:priority:](self, "_setApplicationClientEventMask:buttonKind:priority:", v13, a3, v12);

LABEL_26:
}

- (void)_setApplicationClientEventMask:(unint64_t)a3 buttonKind:(int64_t)a4 priority:(int64_t)a5
{
  id v8;

  -[SBSAbstractSystemService client](self, "client");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEventMask:forButtonKind:priority:", a3, a4, a5);

}

- (void)_addEventConsumerInfo:(id)a3
{
  uint64_t v4;
  BSMutableIntegerMap *consumersPerKind;
  BSMutableIntegerMap *v6;
  BSMutableIntegerMap *v7;
  id v8;
  id v9;

  v9 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  objc_msgSend(v9, "setService:", self);
  v4 = objc_msgSend(v9, "buttonKind");
  consumersPerKind = self->_consumersPerKind;
  if (!consumersPerKind)
  {
    v6 = (BSMutableIntegerMap *)objc_alloc_init(MEMORY[0x1E0D017B8]);
    v7 = self->_consumersPerKind;
    self->_consumersPerKind = v6;

    consumersPerKind = self->_consumersPerKind;
  }
  -[BSMutableIntegerMap objectForKey:](consumersPerKind, "objectForKey:", v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[BSMutableIntegerMap setObject:forKey:](self->_consumersPerKind, "setObject:forKey:", v8, v4);
  }
  objc_msgSend(v8, "insertObject:atIndex:", v9, 0);
  -[SBSHardwareButtonService _resetEventMaskForButtonKind:](self, "_resetEventMaskForButtonKind:", objc_msgSend(v9, "buttonKind"));

}

void __42__SBSHardwareButtonService_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_instance;
  sharedInstance_instance = (uint64_t)v1;

}

- (id)beginConsumingPressesForButtonKind:(int64_t)a3 eventConsumer:(id)a4 priority:(int64_t)a5
{
  id v9;
  void *v10;
  void *v12;

  v9 = a4;
  if ((unint64_t)(a3 - 1) >= 6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSHardwareButtonService.m"), 419, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_SBSHardwareButtonServiceIsSupportedConsumerButtonKind(buttonKind)"));

  }
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  +[_SBSHardwareButtonEventConsumerInfo infoWithConsumer:](_SBSHardwareButtonEventConsumerInfo, "infoWithConsumer:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setButtonKind:", a3);
  objc_msgSend(v10, "setEventPriority:", a5);
  -[SBSHardwareButtonService _addEventConsumerInfo:](self, "_addEventConsumerInfo:", v10);

  return v10;
}

+ (SBSHardwareButtonService)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__SBSHardwareButtonService_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_1 != -1)
    dispatch_once(&sharedInstance_onceToken_1, block);
  return (SBSHardwareButtonService *)(id)sharedInstance_instance;
}

- (void)acquireHomeHardwareButtonHintSuppressionAssertionForReason:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a4;
  v7 = a3;
  -[SBSAbstractFacilityService callbackQueue](self, "callbackQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSAbstractSystemService client](self, "client");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __98__SBSHardwareButtonService_acquireHomeHardwareButtonHintSuppressionAssertionForReason_completion___block_invoke;
  v12[3] = &unk_1E288DE08;
  v13 = v8;
  v14 = v6;
  v10 = v6;
  v11 = v8;
  objc_msgSend(v9, "acquireAssertionOfType:forReason:withCompletion:", 0, v7, v12);

}

void __98__SBSHardwareButtonService_acquireHomeHardwareButtonHintSuppressionAssertionForReason_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __98__SBSHardwareButtonService_acquireHomeHardwareButtonHintSuppressionAssertionForReason_completion___block_invoke_2;
  v7[3] = &unk_1E288D2E8;
  v4 = *(NSObject **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __98__SBSHardwareButtonService_acquireHomeHardwareButtonHintSuppressionAssertionForReason_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (id)description
{
  void *v3;
  id v4;
  id v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_buttonConfigurationsPerKind, CFSTR("buttonConfigurationsPerKind"), 0);
  v5 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_consumersPerKind, CFSTR("consumersPerKind"), 0);
  objc_msgSend(v3, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_viableConsumerForButtonKind:(int64_t)a3 event:(int64_t)a4 priority:(int64_t)a5
{
  char v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v6 = a4;
  v21 = *MEMORY[0x1E0C80C00];
  -[BSMutableIntegerMap objectForKey:](self->_consumersPerKind, "objectForKey:", a3);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    v11 = (1 << v6) | 0x10000;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v13, "eventPriority", (_QWORD)v16) >= a5 && (objc_msgSend(v13, "eventMask") & v11) != 0)
        {
          v14 = v13;
          goto LABEL_12;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v9)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_12:

  return v14;
}

- (void)_mainQueue_handleButtonPressMessage:(int64_t)a3 forButtonKind:(int64_t)a4 priority:(int64_t)a5
{
  void *v10;
  NSObject *v11;
  unint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  uint8_t buf[4];
  _BYTE v21[14];
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[SBSHardwareButtonService _viableConsumerForButtonKind:event:priority:](self, "_viableConsumerForButtonKind:event:priority:", a4, a3, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogCommon();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)v21 = a3;
    *(_WORD *)&v21[4] = 2114;
    *(_QWORD *)&v21[6] = v10;
    v22 = 1024;
    LODWORD(v23) = a5;
    _os_log_impl(&dword_18EB52000, v11, OS_LOG_TYPE_INFO, "dispatch eventType:%d to consumer:%{public}@ at priority:%d", buf, 0x18u);
  }

  if (v10)
  {
    v12 = objc_msgSend(v10, "eventMask");
    objc_msgSend(v10, "consumer");
    v13 = objc_claimAutoreleasedReturnValue();
    if (((v12 >> a3) & 1) == 0)
    {
      if ((v12 & 0x10000) != 0)
      {
LABEL_8:
        -[NSObject consumeAnyPressEventForButtonKind:](v13, "consumeAnyPressEventForButtonKind:", a4);
        goto LABEL_23;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSHardwareButtonService.m"), 372, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("NO"));

    }
    switch(a3)
    {
      case 0:
        goto LABEL_8;
      case 1:
        -[NSObject consumeSinglePressUpForButtonKind:](v13, "consumeSinglePressUpForButtonKind:", a4);
        break;
      case 2:
        -[NSObject consumeDoublePressDownForButtonKind:](v13, "consumeDoublePressDownForButtonKind:", a4);
        break;
      case 3:
        -[NSObject consumeDoublePressUpForButtonKind:](v13, "consumeDoublePressUpForButtonKind:", a4);
        break;
      case 4:
        -[NSObject consumeTriplePressUpForButtonKind:](v13, "consumeTriplePressUpForButtonKind:", a4);
        break;
      case 5:
        -[NSObject consumeLongPressForButtonKind:](v13, "consumeLongPressForButtonKind:", a4);
        break;
      case 6:
        -[NSObject consumeSinglePressDownForButtonKind:](v13, "consumeSinglePressDownForButtonKind:", a4);
        break;
      case 7:
        v17 = v13;
        v18 = 1;
        goto LABEL_19;
      case 8:
        v17 = v13;
        v18 = 0;
LABEL_19:
        -[NSObject consumeStateChange:forButtonKind:](v17, "consumeStateChange:forButtonKind:", v18, a4);
        break;
      default:
        SBLogCommon();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          -[SBSHardwareButtonService _mainQueue_handleButtonPressMessage:forButtonKind:priority:].cold.1(a3, v19);

        break;
    }
  }
  else
  {
    SBLogCommon();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSBSHardwareButtonKind(a4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[BSMutableIntegerMap objectForKey:](self->_consumersPerKind, "objectForKey:", a4);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)v21 = v15;
      *(_WORD *)&v21[8] = 1024;
      *(_DWORD *)&v21[10] = a3;
      v22 = 2114;
      v23 = v16;
      _os_log_error_impl(&dword_18EB52000, v13, OS_LOG_TYPE_ERROR, "no viable consumer for button:%{public}@ eventType:%d -- consumers:%{public}@", buf, 0x1Cu);

    }
  }
LABEL_23:

}

- (int64_t)toggleStateForButtonKind:(int64_t)a3
{
  void *v3;
  int64_t v4;

  if (a3 != 6)
    return -1;
  -[SBSAbstractSystemService client](self, "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "toggleStateForButtonKind:", 6);

  return v4;
}

- (id)deferHIDEventsForButtonKind:(int64_t)a3 toToken:(id)a4
{
  id v7;
  BSMutableIntegerMap *requestHIDAssertionsPerKind;
  BSMutableIntegerMap *v9;
  BSMutableIntegerMap *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  SBSHardwareButtonService *v25;
  id v26;
  int64_t v27;

  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSHardwareButtonService.m"), 441, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("token != nil"));

  }
  if (a3 != 7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSHardwareButtonService.m"), 442, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_SBSHardwareButtonServiceIsSupportedDeferringButtonKind(kind)"));

  }
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  requestHIDAssertionsPerKind = self->_requestHIDAssertionsPerKind;
  if (!requestHIDAssertionsPerKind)
  {
    v9 = (BSMutableIntegerMap *)objc_alloc_init(MEMORY[0x1E0D017B8]);
    v10 = self->_requestHIDAssertionsPerKind;
    self->_requestHIDAssertionsPerKind = v9;

    requestHIDAssertionsPerKind = self->_requestHIDAssertionsPerKind;
  }
  -[BSMutableIntegerMap objectForKey:](requestHIDAssertionsPerKind, "objectForKey:", a3);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[BSMutableIntegerMap setObject:forKey:](self->_requestHIDAssertionsPerKind, "setObject:forKey:", v11, a3);
  }
  v12 = objc_alloc(MEMORY[0x1E0D01868]);
  v13 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSBSHardwareButtonKind(a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("I wanna %@"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __64__SBSHardwareButtonService_deferHIDEventsForButtonKind_toToken___block_invoke;
  v23[3] = &unk_1E288DE30;
  v16 = v11;
  v24 = v16;
  v25 = self;
  v17 = v7;
  v26 = v17;
  v27 = a3;
  v18 = (void *)objc_msgSend(v12, "initWithIdentifier:forReason:invalidationBlock:", CFSTR("HID event request"), v15, v23);

  objc_msgSend(v16, "addObject:", v18);
  if (objc_msgSend(v16, "count") == 1)
  {
    -[SBSAbstractSystemService client](self, "client");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setRequestsHIDEvents:token:forButtonKind:", 1, v17, a3);

  }
  return v18;
}

void __64__SBSHardwareButtonService_deferHIDEventsForButtonKind_toToken___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "removeObject:", a2);
  if (!objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    objc_msgSend(*(id *)(a1 + 40), "client");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setRequestsHIDEvents:token:forButtonKind:", 0, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

  }
}

- (void)setHapticType:(int64_t)a3 forButtonKind:(int64_t)a4
{
  id v6;

  -[SBSAbstractSystemService client](self, "client");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHapticType:forButtonKind:", a3, a4);

}

- (void)fetchHapticTypeForButtonKind:(int64_t)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a4;
  if (v6)
  {
    -[SBSAbstractFacilityService callbackQueue](self, "callbackQueue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSAbstractSystemService client](self, "client");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __68__SBSHardwareButtonService_fetchHapticTypeForButtonKind_completion___block_invoke;
    v10[3] = &unk_1E288DE80;
    v11 = v7;
    v12 = v6;
    v9 = v7;
    objc_msgSend(v8, "fetchHapticTypeForButtonKind:completion:", a3, v10);

  }
}

void __68__SBSHardwareButtonService_fetchHapticTypeForButtonKind_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  uint64_t v6;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __68__SBSHardwareButtonService_fetchHapticTypeForButtonKind_completion___block_invoke_2;
  v4[3] = &unk_1E288DE58;
  v3 = *(NSObject **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v6 = a2;
  dispatch_async(v3, v4);

}

uint64_t __68__SBSHardwareButtonService_fetchHapticTypeForButtonKind_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (BOOL)getAssociatedHintViewsSupported
{
  void *v2;
  char v3;

  -[SBSAbstractSystemService client](self, "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "getAssociatedHintViewsSupported");

  return v3;
}

- (id)registerAssociatedHintViewContextId:(unsigned int)a3 layerRenderId:(unint64_t)a4 layerSize:(CGSize)a5 forButtonKind:(int64_t)a6
{
  double height;
  double width;
  uint64_t v10;
  void *v13;
  void *v14;
  void *v16;

  height = a5.height;
  width = a5.width;
  v10 = *(_QWORD *)&a3;
  if ((unint64_t)a6 > 0xA || ((1 << a6) & 0x51C) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSHardwareButtonService.m"), 490, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_SBSHardwareButtonServiceIsSupportedHintViewButtonKind(buttonKind)"));

  }
  -[SBSAbstractSystemService client](self, "client");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "registerAssociatedHintViewContextId:layerRenderId:layerSize:forButtonKind:", v10, a4, a6, width, height);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)updateHintViewContentVisibility:(int64_t)a3 forButton:(int64_t)a4 animationSettings:(id)a5
{
  id v8;
  id v9;

  v8 = a5;
  -[SBSAbstractSystemService client](self, "client");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "updateHintViewContentVisibility:forButton:animationSettings:", a3, a4, v8);

}

- (void)requestSystemGlowEffectWithInitialStyle:(int64_t)a3 completion:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[SBSAbstractSystemService client](self, "client");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "requestSystemGlowEffectWithInitialStyle:completion:", a3, v6);

}

- (void)updateSystemGlowStyle:(int64_t)a3
{
  id v4;

  -[SBSAbstractSystemService client](self, "client");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateSystemGlowStyle:", a3);

}

- (id)acquireCaptureButtonSuppressionAssertionWithOptions:(unint64_t)a3 reason:(id)a4
{
  id v6;
  SBSCaptureButtonRestrictionService *captureButtonRestrictionService;
  SBSCaptureButtonRestrictionService *v8;
  SBSCaptureButtonRestrictionService *v9;
  void *v10;

  v6 = a4;
  captureButtonRestrictionService = self->_captureButtonRestrictionService;
  if (!captureButtonRestrictionService)
  {
    v8 = objc_alloc_init(SBSCaptureButtonRestrictionService);
    v9 = self->_captureButtonRestrictionService;
    self->_captureButtonRestrictionService = v8;

    captureButtonRestrictionService = self->_captureButtonRestrictionService;
  }
  -[SBSCaptureButtonRestrictionService acquireCaptureButtonSuppressionAssertionWithOptions:reason:](captureButtonRestrictionService, "acquireCaptureButtonSuppressionAssertionWithOptions:reason:", a3, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)handleButtonPressMessage:(int64_t)a3 forButtonKind:(int64_t)a4 priority:(int64_t)a5
{
  _QWORD v5[8];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __76__SBSHardwareButtonService_handleButtonPressMessage_forButtonKind_priority___block_invoke;
  v5[3] = &unk_1E288DEA8;
  v5[4] = self;
  v5[5] = a3;
  v5[6] = a4;
  v5[7] = a5;
  dispatch_async(MEMORY[0x1E0C80D38], v5);
}

uint64_t __76__SBSHardwareButtonService_handleButtonPressMessage_forButtonKind_priority___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_mainQueue_handleButtonPressMessage:forButtonKind:priority:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)consumerInfoWillInvalidate:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  v4 = objc_msgSend(v6, "buttonKind");
  -[BSMutableIntegerMap objectForKey:](self->_consumersPerKind, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v6);
  if (!objc_msgSend(v5, "count"))
    -[BSMutableIntegerMap removeObjectForKey:](self->_consumersPerKind, "removeObjectForKey:", v4);
  -[SBSHardwareButtonService _resetEventMaskForButtonKind:](self, "_resetEventMaskForButtonKind:", objc_msgSend(v6, "buttonKind"));

}

- (BSMutableIntegerMap)consumersPerKind
{
  return self->_consumersPerKind;
}

- (void)setConsumersPerKind:(id)a3
{
  objc_storeStrong((id *)&self->_consumersPerKind, a3);
}

- (BSMutableIntegerMap)buttonConfigurationsPerKind
{
  return self->_buttonConfigurationsPerKind;
}

- (void)setButtonConfigurationsPerKind:(id)a3
{
  objc_storeStrong((id *)&self->_buttonConfigurationsPerKind, a3);
}

- (BSMutableIntegerMap)requestHIDAssertionsPerKind
{
  return self->_requestHIDAssertionsPerKind;
}

- (void)setRequestHIDAssertionsPerKind:(id)a3
{
  objc_storeStrong((id *)&self->_requestHIDAssertionsPerKind, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestHIDAssertionsPerKind, 0);
  objc_storeStrong((id *)&self->_buttonConfigurationsPerKind, 0);
  objc_storeStrong((id *)&self->_consumersPerKind, 0);
  objc_storeStrong((id *)&self->_captureButtonRestrictionService, 0);
}

- (void)_mainQueue_handleButtonPressMessage:(int)a1 forButtonKind:(NSObject *)a2 priority:.cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_18EB52000, a2, OS_LOG_TYPE_ERROR, "unsupported event type:%d", (uint8_t *)v2, 8u);
}

@end
