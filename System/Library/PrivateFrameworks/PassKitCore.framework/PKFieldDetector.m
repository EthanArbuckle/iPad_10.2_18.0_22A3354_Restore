@implementation PKFieldDetector

- (PKFieldDetector)init
{
  return -[PKFieldDetector initWithDelegate:](self, "initWithDelegate:", 0);
}

- (PKFieldDetector)initWithDelegate:(id)a3
{
  id v4;
  PKFieldDetector *v5;
  PKFieldDetector *v6;
  PKFieldDetector *v7;
  NSObject *v8;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *fieldDetectorSerialQueue;
  dispatch_queue_t v12;
  OS_dispatch_queue *replyQueue;
  uint64_t v14;
  NSHashTable *observers;
  NSObject *v16;
  id *v17;
  _QWORD block[4];
  id *v20;
  objc_super v21;

  v4 = a3;
  if (PKNearFieldRadioIsAvailable()
    && !+[PKSecureElement isInFailForward](PKSecureElement, "isInFailForward"))
  {
    v21.receiver = self;
    v21.super_class = (Class)PKFieldDetector;
    v6 = -[PKFieldDetector init](&v21, sel_init);
    v7 = v6;
    if (v6)
    {
      v6->_lock._os_unfair_lock_opaque = 0;
      dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, -1);
      v8 = objc_claimAutoreleasedReturnValue();
      dispatch_queue_attr_make_with_autorelease_frequency(v8, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v9 = objc_claimAutoreleasedReturnValue();

      v10 = dispatch_queue_create("com.apple.passkit.fielddetector", v9);
      fieldDetectorSerialQueue = v7->_fieldDetectorSerialQueue;
      v7->_fieldDetectorSerialQueue = (OS_dispatch_queue *)v10;

      v12 = dispatch_queue_create("com.apple.passkit.fielddetector.reply", v9);
      replyQueue = v7->_replyQueue;
      v7->_replyQueue = (OS_dispatch_queue *)v12;

      objc_msgSend(MEMORY[0x1E0CB3690], "pk_weakObjectsHashTableUsingPointerPersonality");
      v14 = objc_claimAutoreleasedReturnValue();
      observers = v7->_observers;
      v7->_observers = (NSHashTable *)v14;

      v7->_nfcRadioEnabled = PKNearFieldRadioIsEnabled();
      v16 = v7->_fieldDetectorSerialQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __36__PKFieldDetector_initWithDelegate___block_invoke;
      block[3] = &unk_1E2ABE120;
      v17 = v7;
      v20 = v17;
      dispatch_async(v16, block);
      objc_storeWeak(v17 + 10, v4);

    }
    self = v7;
    v5 = self;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t __36__PKFieldDetector_initWithDelegate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startFieldDetectSession");
}

- (void)dealloc
{
  objc_super v3;

  -[PKFieldPropertiesProbe invalidate](self->_fieldPropertiesProbe, "invalidate");
  -[NFFieldDetectSession setDelegate:](self->_fieldDetectSession, "setDelegate:", 0);
  -[NFFieldDetectSession endSession](self->_fieldDetectSession, "endSession");
  v3.receiver = self;
  v3.super_class = (Class)PKFieldDetector;
  -[PKFieldDetector dealloc](&v3, sel_dealloc);
}

- (void)fieldDetectSession:(id)a3 didEnterFieldWithNotification:(id)a4
{
  id v5;
  NSObject *fieldDetectorSerialQueue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  kdebug_trace();
  fieldDetectorSerialQueue = self->_fieldDetectorSerialQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __68__PKFieldDetector_fieldDetectSession_didEnterFieldWithNotification___block_invoke;
  v8[3] = &unk_1E2ABE0D0;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(fieldDetectorSerialQueue, v8);

}

void __68__PKFieldDetector_fieldDetectSession_didEnterFieldWithNotification___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  unint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[5];
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 28));
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 80));
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 28));
  if (WeakRetained
    && (objc_msgSend(WeakRetained, "fieldDetectorShouldProcessFieldEvents:", *(_QWORD *)(a1 + 32)) & 1) == 0)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Field Detector Ignoring Field Entrance", buf, 2u);
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_endLookup");
    PKLogFacilityTypeGetObject(6uLL);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v16 = v4;
      _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Field Detector Did Enter Field: %@.", buf, 0xCu);
    }

    +[PKFieldProperties fieldPropertiesForFieldNotification:](PKFieldProperties, "fieldPropertiesForFieldNotification:", *(_QWORD *)(a1 + 40));
    v5 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject terminalType](v5, "terminalType") == 5)
    {
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Field Detector Ignoring Connection Handover Entrance", buf, 2u);
      }
    }
    else
    {
      +[PKAnalyticsReporter beginSubjectReporting:](PKAnalyticsReporter, "beginSubjectReporting:", CFSTR("fieldDetect"));
      v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("fieldEntered"), CFSTR("eventType"));
      v3 = v6;
      v7 = v5;
      v8 = -[NSObject terminalType](v7, "terminalType");
      if (v8 <= 5)
      {
        if (((1 << v8) & 0x2D) == 0)
        {
          if (v8 != 1)
            -[NSObject setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", CFSTR("identity"), CFSTR("readerType"));
          -[NSObject setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", CFSTR("payment"), CFSTR("readerType"));
        }
        -[NSObject setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", CFSTR("other"), CFSTR("readerType"));
      }

      +[PKAnalyticsReporter subject:sendEvent:](PKAnalyticsReporter, "subject:sendEvent:", CFSTR("fieldDetect"), v3);
      if (PKFieldPropertiesCanLookupSecondaryProperties(v7))
      {
        -[NSObject setSecondaryPropertiesRequired:](v7, "setSecondaryPropertiesRequired:", 1);
        v9 = +[PKFieldPropertiesProbe createProbeForProperties:queue:](PKFieldPropertiesProbe, "createProbeForProperties:queue:", v7, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64));
        v10 = *(_QWORD *)(a1 + 32);
        v11 = *(void **)(v10 + 56);
        *(_QWORD *)(v10 + 56) = v9;

        v12 = *(_QWORD *)(a1 + 32);
        v13 = *(void **)(v12 + 56);
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __68__PKFieldDetector_fieldDetectSession_didEnterFieldWithNotification___block_invoke_25;
        v14[3] = &unk_1E2AD73C8;
        v14[4] = v12;
        objc_msgSend(v13, "beginWithCompletion:", v14);
      }
      else
      {
        objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 48), v5);
        objc_msgSend(*(id *)(a1 + 32), "_notify");
      }
    }

  }
}

void __68__PKFieldDetector_fieldDetectSession_didEnterFieldWithNotification___block_invoke_25(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  if (*(id *)(*(_QWORD *)(a1 + 32) + 56) == v8)
  {
    objc_msgSend(v8, "invalidate");
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 56);
    *(_QWORD *)(v6 + 56) = 0;

    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 48), a3);
    objc_msgSend(*(id *)(a1 + 32), "_notify");
  }

}

- (void)fieldDetectSessionDidExitField:(id)a3
{
  NSObject *fieldDetectorSerialQueue;
  _QWORD block[5];

  kdebug_trace();
  fieldDetectorSerialQueue = self->_fieldDetectorSerialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__PKFieldDetector_fieldDetectSessionDidExitField___block_invoke;
  block[3] = &unk_1E2ABE120;
  block[4] = self;
  dispatch_async(fieldDetectorSerialQueue, block);
}

void __50__PKFieldDetector_fieldDetectSessionDidExitField___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  uint8_t buf[8];
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v13 = CFSTR("eventType");
  v14[0] = CFSTR("fieldExited");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKAnalyticsReporter subject:sendEvent:](PKAnalyticsReporter, "subject:sendEvent:", CFSTR("fieldDetect"), v2);

  +[PKAnalyticsReporter endSubjectReporting:](PKAnalyticsReporter, "endSubjectReporting:", CFSTR("fieldDetect"));
  PKLogFacilityTypeGetObject(6uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Field Detector Did Exit Field", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_endLookup");
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 28));
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 48);
  if (v5)
  {
    *(_QWORD *)(v4 + 48) = 0;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "allObjects");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 28));
    if (v6)
    {
      v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 72);
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __50__PKFieldDetector_fieldDetectSessionDidExitField___block_invoke_28;
      v9[3] = &unk_1E2ABE0D0;
      v6 = v6;
      v8 = *(_QWORD *)(a1 + 32);
      v10 = v6;
      v11 = v8;
      dispatch_async(v7, v9);

    }
  }
  else
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 28));
    v6 = 0;
  }

}

void __50__PKFieldDetector_fieldDetectSessionDidExitField___block_invoke_28(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "fieldDetectorDidExitField:", *(_QWORD *)(a1 + 40), (_QWORD)v8);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (void)fieldDetectSessionDidEndUnexpectedly:(id)a3
{
  NSObject *v4;
  NSObject *fieldDetectorSerialQueue;
  _QWORD block[5];
  uint8_t buf[16];

  PKLogFacilityTypeGetObject(6uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "Field Detection Session Ended Unexpectedly", buf, 2u);
  }

  fieldDetectorSerialQueue = self->_fieldDetectorSerialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__PKFieldDetector_fieldDetectSessionDidEndUnexpectedly___block_invoke;
  block[3] = &unk_1E2ABE120;
  block[4] = self;
  dispatch_async(fieldDetectorSerialQueue, block);
}

uint64_t __56__PKFieldDetector_fieldDetectSessionDidEndUnexpectedly___block_invoke(uint64_t a1)
{
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("eventType");
  v5[0] = CFSTR("fieldDetectSessionEndedUnexpectedly");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKAnalyticsReporter subject:sendEvent:](PKAnalyticsReporter, "subject:sendEvent:", CFSTR("fieldDetect"), v2);

  +[PKAnalyticsReporter endSubjectReporting:](PKAnalyticsReporter, "endSubjectReporting:", CFSTR("fieldDetect"));
  objc_msgSend(*(id *)(a1 + 32), "_invalidateFieldDetectSession");
  return objc_msgSend(*(id *)(a1 + 32), "_restartFieldDetectSession");
}

- (void)updateRadioState
{
  NSObject *fieldDetectorSerialQueue;
  _QWORD block[5];

  fieldDetectorSerialQueue = self->_fieldDetectorSerialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__PKFieldDetector_updateRadioState__block_invoke;
  block[3] = &unk_1E2ABE120;
  block[4] = self;
  dispatch_async(fieldDetectorSerialQueue, block);
}

uint64_t __35__PKFieldDetector_updateRadioState__block_invoke(uint64_t a1)
{
  uint64_t result;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 25) = PKNearFieldRadioIsEnabled();
  result = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(result + 25))
    return objc_msgSend((id)result, "_invalidateFieldDetectSession");
  if (*(_BYTE *)(result + 24))
  {
    if (!*(_QWORD *)(result + 8))
      return objc_msgSend((id)result, "_startFieldDetectSession");
  }
  return result;
}

- (void)requestPersistentFieldDetectionEnabled:(BOOL)a3 withReason:(unint64_t)a4
{
  NSObject *fieldDetectorSerialQueue;
  NSObject *v5;
  _QWORD block[6];
  BOOL v7;
  uint8_t buf[16];

  if (a4)
  {
    fieldDetectorSerialQueue = self->_fieldDetectorSerialQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __69__PKFieldDetector_requestPersistentFieldDetectionEnabled_withReason___block_invoke;
    block[3] = &unk_1E2AD73F0;
    v7 = a3;
    block[4] = self;
    block[5] = a4;
    dispatch_async(fieldDetectorSerialQueue, block);
  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Field Detector: Missing reason when enabling field detect", buf, 2u);
    }

  }
}

void __69__PKFieldDetector_requestPersistentFieldDetectionEnabled_withReason___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  PKFieldDetectorPersistentFieldDetectionReasonToString(*(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  PKLogFacilityTypeGetObject(6uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = "enable";
    if (!*(_BYTE *)(a1 + 48))
      v4 = "disable";
    v11 = 136446466;
    v12 = v4;
    v13 = 2112;
    v14 = v2;
    _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Field Detector: Requesting to %{public}s field detect for reason: %@", (uint8_t *)&v11, 0x16u);
  }

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(_QWORD *)(v5 + 40);
  v8 = v7 & ~v6;
  v9 = v6 | v7;
  if (!*(_BYTE *)(a1 + 48))
    v9 = v8;
  *(_QWORD *)(v5 + 40) = v9;
  v10 = *(_QWORD **)(a1 + 32);
  if (v7 != v10[5])
    objc_msgSend(v10, "_evaulatePersistentFieldDetectionEnablementReasons");

}

- (void)setPersistentFieldDetectionEnabled:(BOOL)a3
{
  NSObject *fieldDetectorSerialQueue;
  _QWORD v4[5];
  BOOL v5;

  fieldDetectorSerialQueue = self->_fieldDetectorSerialQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __54__PKFieldDetector_setPersistentFieldDetectionEnabled___block_invoke;
  v4[3] = &unk_1E2ABE1C0;
  v4[4] = self;
  v5 = a3;
  dispatch_async(fieldDetectorSerialQueue, v4);
}

uint64_t __54__PKFieldDetector_setPersistentFieldDetectionEnabled___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setPersistentFieldDetectionEnabled:", *(unsigned __int8 *)(a1 + 40));
}

- (void)registerObserver:(id)a3
{
  id v4;
  PKFieldProperties *v5;
  NSObject *replyQueue;
  _QWORD block[4];
  id v8;
  PKFieldDetector *v9;
  PKFieldProperties *v10;

  v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_lock);
    v5 = self->_fieldProperties;
    if (-[NSHashTable containsObject:](self->_observers, "containsObject:", v4))
    {
      os_unfair_lock_unlock(&self->_lock);
    }
    else
    {
      -[NSHashTable addObject:](self->_observers, "addObject:", v4);
      os_unfair_lock_unlock(&self->_lock);
      if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        replyQueue = self->_replyQueue;
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __36__PKFieldDetector_registerObserver___block_invoke;
        block[3] = &unk_1E2ABE0F8;
        v8 = v4;
        v9 = self;
        v10 = v5;
        dispatch_async(replyQueue, block);

      }
    }

  }
}

uint64_t __36__PKFieldDetector_registerObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "fieldDetectorDidEnterField:withProperties:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)unregisterObserver:(id)a3
{
  id v4;

  v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_lock);
    -[NSHashTable removeObject:](self->_observers, "removeObject:", v4);
    os_unfair_lock_unlock(&self->_lock);
  }

}

- (PKFieldProperties)fieldProperties
{
  os_unfair_lock_s *p_lock;
  PKFieldProperties *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_fieldProperties;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (PKFieldDetectorDelegate)delegate
{
  os_unfair_lock_s *p_lock;
  id WeakRetained;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  os_unfair_lock_unlock(p_lock);
  return (PKFieldDetectorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  objc_storeWeak((id *)&self->_delegate, v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)_evaulatePersistentFieldDetectionEnablementReasons
{
  unint64_t enablePersistentFieldDetectionReasons;
  void *v4;
  NSObject *v5;
  const char *v6;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  enablePersistentFieldDetectionReasons = self->_enablePersistentFieldDetectionReasons;
  PKFieldDetectorPersistentFieldDetectionReasonToString(enablePersistentFieldDetectionReasons);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PKLogFacilityTypeGetObject(6uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = "disable";
    if (enablePersistentFieldDetectionReasons)
      v6 = "enable";
    v7 = 136446466;
    v8 = v6;
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Field Detector: Requesting to %{public}s field detect with reasons: %@", (uint8_t *)&v7, 0x16u);
  }

  -[PKFieldDetector _setPersistentFieldDetectionEnabled:](self, "_setPersistentFieldDetectionEnabled:", enablePersistentFieldDetectionReasons != 0);
}

- (void)_setPersistentFieldDetectionEnabled:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  const __CFString *v6;
  void *v7;
  int v8;
  _BOOL4 v9;
  const __CFString *v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  int v14;
  const __CFString *v15;
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  if (!PKNearFieldRadioIsAvailable())
    return;
  PKLogFacilityTypeGetObject(6uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("Disabling");
    if (v3)
      v6 = CFSTR("Enabling");
    v14 = 138543362;
    v15 = v6;
    _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Field Detector: %{public}@ field detection...", (uint8_t *)&v14, 0xCu);
  }

  objc_msgSend(PKGetClassNFHardwareManager(), "sharedHardwareManagerWithNoUI");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "setFieldDetectEnabled:", v3);
  v9 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v9)
    {
      v10 = CFSTR("Disabled");
      if (v3)
        v10 = CFSTR("Enabled");
      v14 = 138543362;
      v15 = v10;
      v11 = "Field Detector: %{public}@ field detection.";
      v12 = v5;
      v13 = 12;
      goto LABEL_13;
    }
  }
  else if (v9)
  {
    LOWORD(v14) = 0;
    v11 = "Field Detector: failed to mutate field detection state.";
    v12 = v5;
    v13 = 2;
LABEL_13:
    _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v14, v13);
  }

  if (v3 && !self->_fieldDetectSessionRequested)
    -[PKFieldDetector _startFieldDetectSession](self, "_startFieldDetectSession");

}

- (void)_invalidateFieldDetectSession
{
  NFFieldDetectSession *fieldDetectSession;
  PKFieldProperties *fieldProperties;

  -[NFFieldDetectSession setDelegate:](self->_fieldDetectSession, "setDelegate:", 0);
  -[NFFieldDetectSession endSession](self->_fieldDetectSession, "endSession");
  fieldDetectSession = self->_fieldDetectSession;
  self->_fieldDetectSession = 0;

  os_unfair_lock_lock(&self->_lock);
  fieldProperties = self->_fieldProperties;
  self->_fieldProperties = 0;

  os_unfair_lock_unlock(&self->_lock);
  -[PKFieldDetector _endLookup](self, "_endLookup");
}

- (void)_restartFieldDetectSession
{
  unint64_t v3;
  double v4;
  NSObject *v5;
  dispatch_time_t v6;
  NSObject *fieldDetectorSerialQueue;
  _QWORD block[5];
  uint8_t buf[4];
  double v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = self->_fieldDetectSessionRetryCount + 1;
  self->_fieldDetectSessionRetryCount = v3;
  v4 = 0.0;
  if (v3 >= 4)
    v4 = fmin((exp2((double)v3) + -1.0) * 0.5, 600.0);
  PKLogFacilityTypeGetObject(6uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v10 = v4;
    _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Attempting to Restart Field Detection Session After Delay (%.2f seconds)...", buf, 0xCu);
  }

  v6 = dispatch_time(0, (uint64_t)(v4 * 1000000000.0));
  fieldDetectorSerialQueue = self->_fieldDetectorSerialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__PKFieldDetector__restartFieldDetectSession__block_invoke;
  block[3] = &unk_1E2ABE120;
  block[4] = self;
  dispatch_after(v6, fieldDetectorSerialQueue, block);
}

uint64_t __45__PKFieldDetector__restartFieldDetectSession__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startFieldDetectSession");
}

- (void)_startFieldDetectSession
{
  NSObject *v3;
  NSObject *v4;
  id v5;
  _QWORD v6[5];
  uint8_t buf[16];

  if (!self->_fieldDetectSessionRequested)
    self->_fieldDetectSessionRequested = 1;
  if (self->_nfcRadioEnabled)
  {
    objc_msgSend(PKGetClassNFHardwareManager(), "sharedHardwareManagerWithNoUI");
    v3 = objc_claimAutoreleasedReturnValue();
    PKLogFacilityTypeGetObject(6uLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "Starting Field Detection Session...", buf, 2u);
    }

    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __43__PKFieldDetector__startFieldDetectSession__block_invoke;
    v6[3] = &unk_1E2AD7418;
    v6[4] = self;
    v5 = (id)-[NSObject startFieldDetectSession:](v3, "startFieldDetectSession:", v6);
  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Cannot start field detect session because the NFC radio is disabled", buf, 2u);
    }
  }

}

void __43__PKFieldDetector__startFieldDetectSession__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  uint64_t v14;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(NSObject **)(v7 + 64);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__PKFieldDetector__startFieldDetectSession__block_invoke_2;
  block[3] = &unk_1E2ABE0F8;
  v12 = v5;
  v13 = v6;
  v14 = v7;
  v9 = v6;
  v10 = v5;
  dispatch_async(v8, block);

}

void __43__PKFieldDetector__startFieldDetectSession__block_invoke_2(id *a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (!a1[4] || a1[5])
  {
    PKLogFacilityTypeGetObject(6uLL);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = a1[5];
      v10 = 138412290;
      v11 = v3;
      _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "Error Starting Field Detection Session: %@", (uint8_t *)&v10, 0xCu);
    }

    objc_msgSend(a1[5], "domain");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "nfcd");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isEqualToString:", v5))
    {
      v6 = objc_msgSend(a1[5], "code");

      if (v6 == 14)
        return;
    }
    else
    {

    }
    objc_msgSend(a1[6], "_restartFieldDetectSession");
    return;
  }
  PKLogFacilityTypeGetObject(6uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v10) = 0;
    _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "Field Detection Session Started", (uint8_t *)&v10, 2u);
  }

  v8 = a1[6];
  v9 = (void *)*((_QWORD *)v8 + 1);
  if (v9)
  {
    objc_msgSend(v9, "setDelegate:", 0);
    objc_msgSend(*((id *)a1[6] + 1), "endSession");
    v8 = a1[6];
  }
  objc_storeStrong((id *)v8 + 1, a1[4]);
  objc_msgSend(a1[4], "setDelegate:", a1[6]);
  *((_QWORD *)a1[6] + 2) = 0;
}

- (void)_notify
{
  os_unfair_lock_s *p_lock;
  PKFieldProperties *v4;
  void *v5;
  NSObject *v6;
  NSObject *replyQueue;
  PKFieldProperties *v8;
  id v9;
  _QWORD block[4];
  id v11;
  PKFieldDetector *v12;
  PKFieldProperties *v13;
  uint8_t buf[4];
  PKFieldProperties *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_fieldProperties;
  -[NSHashTable allObjects](self->_observers, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  PKLogFacilityTypeGetObject(6uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v4;
    _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Field Detector Did Enter Field With Properties: %@", buf, 0xCu);
  }

  replyQueue = self->_replyQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26__PKFieldDetector__notify__block_invoke;
  block[3] = &unk_1E2ABE0F8;
  v11 = v5;
  v12 = self;
  v13 = v4;
  v8 = v4;
  v9 = v5;
  dispatch_async(replyQueue, block);

}

void __26__PKFieldDetector__notify__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "fieldDetectorDidEnterField:withProperties:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), (_QWORD)v8);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (void)_endLookup
{
  PKFieldPropertiesProbe *fieldPropertiesProbe;

  -[PKFieldPropertiesProbe invalidate](self->_fieldPropertiesProbe, "invalidate");
  fieldPropertiesProbe = self->_fieldPropertiesProbe;
  self->_fieldPropertiesProbe = 0;

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong((id *)&self->_fieldDetectorSerialQueue, 0);
  objc_storeStrong((id *)&self->_fieldPropertiesProbe, 0);
  objc_storeStrong((id *)&self->_fieldProperties, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_fieldDetectSession, 0);
}

@end
