@implementation WFHealthFeatureAvailability

- (void)setObserver:(id)a3
{
  objc_storeWeak((id *)&self->_observer, a3);
}

void __56__WFHealthFeatureAvailability_getSleepOnboardingStatus___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;

  v5 = a3;
  objc_msgSend(a2, "BOOLValue");
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __52__WFHealthFeatureAvailability_initWithSleepFeature___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    getWFGeneralLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 136315394;
      v8 = "-[WFHealthFeatureAvailability initWithSleepFeature:]_block_invoke_2";
      v9 = 2114;
      v10 = v5;
      _os_log_impl(&dword_1C15B3000, v6, OS_LOG_TYPE_ERROR, "%s Encountered error in retrieving sleep onboarding status from HealthKit: %{public}@", (uint8_t *)&v7, 0x16u);
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setSleepOnboardingStatus:", a2);
  }

}

- (void)setSleepOnboardingStatus:(unint64_t)a3
{
  void *v5;
  void *v6;
  id v7;

  if (-[WFHealthFeatureAvailability sleepOnboardingStatus](self, "sleepOnboardingStatus") != a3)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "systemShortcutsUserDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFHealthFeatureAvailability onboardingCompletedKey](self, "onboardingCompletedKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setInteger:forKey:", a3, v6);

    -[WFHealthFeatureAvailability observer](self, "observer");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "healthFeatureAvailability:sleepOnboardingStatusDidChange:", self, a3);

  }
}

- (unint64_t)sleepOnboardingStatus
{
  void *v3;
  void *v4;
  unint64_t v5;

  objc_msgSend(MEMORY[0x1E0C99EA0], "systemShortcutsUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFHealthFeatureAvailability onboardingCompletedKey](self, "onboardingCompletedKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "integerForKey:", v4);

  return v5;
}

- (NSString)onboardingCompletedKey
{
  return self->_onboardingCompletedKey;
}

void __52__WFHealthFeatureAvailability_initWithSleepFeature___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  objc_class *v4;
  id v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;

  v22 = 0;
  v23 = &v22;
  v24 = 0x2050000000;
  v2 = (void *)getHKSPSleepStoreClass_softClass;
  v25 = getHKSPSleepStoreClass_softClass;
  v3 = MEMORY[0x1E0C809B0];
  if (!getHKSPSleepStoreClass_softClass)
  {
    v17 = MEMORY[0x1E0C809B0];
    v18 = 3221225472;
    v19 = __getHKSPSleepStoreClass_block_invoke;
    v20 = &unk_1E7AF9520;
    v21 = &v22;
    __getHKSPSleepStoreClass_block_invoke((uint64_t)&v17);
    v2 = (void *)v23[3];
  }
  v4 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v22, 8);
  v5 = [v4 alloc];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithIdentifier:", v7);

  v22 = 0;
  v23 = &v22;
  v24 = 0x2050000000;
  v9 = (void *)getHKSPFeatureAvailabilityStoreClass_softClass;
  v25 = getHKSPFeatureAvailabilityStoreClass_softClass;
  if (!getHKSPFeatureAvailabilityStoreClass_softClass)
  {
    v17 = v3;
    v18 = 3221225472;
    v19 = __getHKSPFeatureAvailabilityStoreClass_block_invoke;
    v20 = &unk_1E7AF9520;
    v21 = &v22;
    __getHKSPFeatureAvailabilityStoreClass_block_invoke((uint64_t)&v17);
    v9 = (void *)v23[3];
  }
  v10 = objc_retainAutorelease(v9);
  _Block_object_dispose(&v22, 8);
  v11 = objc_msgSend([v10 alloc], "initWithFeatureIdentifier:sleepStore:", *(_QWORD *)(a1 + 40), v8);
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(void **)(v12 + 16);
  *(_QWORD *)(v12 + 16) = v11;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "registerObserver:queue:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
  v14 = *(void **)(a1 + 32);
  v15[0] = v3;
  v15[1] = 3221225472;
  v15[2] = __52__WFHealthFeatureAvailability_initWithSleepFeature___block_invoke_2;
  v15[3] = &unk_1E7AF2800;
  v16 = v14;
  objc_msgSend(v16, "getSleepOnboardingStatus:", v15);

}

- (void)getSleepOnboardingStatus:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[WFHealthFeatureAvailability store](self, "store");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__WFHealthFeatureAvailability_getSleepOnboardingStatus___block_invoke;
  v7[3] = &unk_1E7AED378;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "isCurrentOnboardingVersionCompletedWithCompletion:", v7);

}

- (HKSPFeatureAvailabilityStore)store
{
  return self->_store;
}

- (WFHealthFeatureAvailability)initWithSleepFeature:(unint64_t)a3
{
  WFHealthFeatureAvailability *v4;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *queue;
  id *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  id v12;
  NSObject *v13;
  WFHealthFeatureAvailability *v14;
  id v15;
  WFHealthFeatureAvailability *v16;
  WFHealthFeatureAvailability *result;
  void *v18;
  void *v19;
  _QWORD block[4];
  WFHealthFeatureAvailability *v21;
  id v22;
  objc_super v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;

  v23.receiver = self;
  v23.super_class = (Class)WFHealthFeatureAvailability;
  v4 = -[WFHealthFeatureAvailability init](&v23, sel_init);
  if (!v4)
    goto LABEL_12;
  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = dispatch_queue_create("com.apple.shortcuts.WFHealthFeatureAvailability", v5);
  queue = v4->_queue;
  v4->_queue = (OS_dispatch_queue *)v6;

  if (a3)
  {
    v24 = 0;
    v25 = &v24;
    v26 = 0x2020000000;
    v8 = (id *)getHKFeatureIdentifierSleepActionsSymbolLoc_ptr;
    v27 = getHKFeatureIdentifierSleepActionsSymbolLoc_ptr;
    if (!getHKFeatureIdentifierSleepActionsSymbolLoc_ptr)
    {
      v9 = HealthKitLibrary();
      v8 = (id *)dlsym(v9, "HKFeatureIdentifierSleepActions");
      v25[3] = (uint64_t)v8;
      getHKFeatureIdentifierSleepActionsSymbolLoc_ptr = (uint64_t)v8;
    }
    _Block_object_dispose(&v24, 8);
    if (v8)
    {
      v10 = CFSTR("WFShortcutsHealthSleepOnboardingCompleted");
LABEL_11:
      v12 = *v8;
      objc_storeStrong((id *)&v4->_onboardingCompletedKey, v10);
      v13 = v4->_queue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __52__WFHealthFeatureAvailability_initWithSleepFeature___block_invoke;
      block[3] = &unk_1E7AF92C0;
      v14 = v4;
      v21 = v14;
      v22 = v12;
      v15 = v12;
      dispatch_async(v13, block);
      v16 = v14;

LABEL_12:
      return v4;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "HKFeatureIdentifier getHKFeatureIdentifierSleepActions(void)");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, CFSTR("WFHealthFeatureAvailability.m"), 30, CFSTR("%s"), dlerror());
  }
  else
  {
    v24 = 0;
    v25 = &v24;
    v26 = 0x2020000000;
    v8 = (id *)getHKFeatureIdentifierSleepCoachingSymbolLoc_ptr;
    v27 = getHKFeatureIdentifierSleepCoachingSymbolLoc_ptr;
    if (!getHKFeatureIdentifierSleepCoachingSymbolLoc_ptr)
    {
      v11 = HealthKitLibrary();
      v8 = (id *)dlsym(v11, "HKFeatureIdentifierSleepCoaching");
      v25[3] = (uint64_t)v8;
      getHKFeatureIdentifierSleepCoachingSymbolLoc_ptr = (uint64_t)v8;
    }
    _Block_object_dispose(&v24, 8);
    if (v8)
    {
      v10 = CFSTR("WFShortcutsHealthSleepCoachingCompleted");
      goto LABEL_11;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "HKFeatureIdentifier getHKFeatureIdentifierSleepCoaching(void)");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, CFSTR("WFHealthFeatureAvailability.m"), 29, CFSTR("%s"), dlerror());
  }

  __break(1u);
  return result;
}

- (void)featureAvailabilityProvidingDidUpdateOnboardingCompletion:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __89__WFHealthFeatureAvailability_featureAvailabilityProvidingDidUpdateOnboardingCompletion___block_invoke;
  v3[3] = &unk_1E7AF2800;
  v3[4] = self;
  -[WFHealthFeatureAvailability getSleepOnboardingStatus:](self, "getSleepOnboardingStatus:", v3);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[WFHealthFeatureAvailability store](self, "store");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)WFHealthFeatureAvailability;
  -[WFHealthFeatureAvailability dealloc](&v4, sel_dealloc);
}

- (WFHealthFeatureObserver)observer
{
  return (WFHealthFeatureObserver *)objc_loadWeakRetained((id *)&self->_observer);
}

- (void)setStore:(id)a3
{
  objc_storeStrong((id *)&self->_store, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_onboardingCompletedKey, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_destroyWeak((id *)&self->_observer);
}

void __89__WFHealthFeatureAvailability_featureAvailabilityProvidingDidUpdateOnboardingCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    getWFGeneralLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 136315394;
      v8 = "-[WFHealthFeatureAvailability featureAvailabilityProvidingDidUpdateOnboardingCompletion:]_block_invoke";
      v9 = 2114;
      v10 = v5;
      _os_log_impl(&dword_1C15B3000, v6, OS_LOG_TYPE_ERROR, "%s Got notified that sleep onboarding status has changed, but encountered error in retrieving new value: %{public}@", (uint8_t *)&v7, 0x16u);
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setSleepOnboardingStatus:", a2);
  }

}

@end
