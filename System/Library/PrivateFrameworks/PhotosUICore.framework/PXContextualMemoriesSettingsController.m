@implementation PXContextualMemoriesSettingsController

- (PXContextualMemoriesSettingsController)init
{
  PXContextualMemoriesSettingsController *v2;
  PXContextualMemoriesSettings *v3;
  PXContextualMemoriesSettings *settings;
  NSMutableArray *v5;
  NSMutableArray *completionHandlers;
  NSMutableArray *v7;
  NSMutableArray *registrationIdentifiers;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PXContextualMemoriesSettingsController;
  v2 = -[PXContextualMemoriesSettingsController init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(PXContextualMemoriesSettings);
    settings = v2->_settings;
    v2->_settings = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    completionHandlers = v2->_completionHandlers;
    v2->_completionHandlers = v5;

    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    registrationIdentifiers = v2->_registrationIdentifiers;
    v2->_registrationIdentifiers = v7;

  }
  return v2;
}

- (void)requestUpdatedContextualMemoriesSettingsWithOptions:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  PXContextualMemoriesSettingsController *v18;
  id v19;

  v6 = a3;
  v7 = a4;
  if (!v6)
    v6 = (id)objc_opt_new();
  -[PXContextualMemoriesSettingsController completionHandlers](self, "completionHandlers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = _Block_copy(v7);
  objc_msgSend(v8, "addObject:", v9);

  if (!-[PXContextualMemoriesSettingsController isRequestingUpdates](self, "isRequestingUpdates"))
  {
    -[PXContextualMemoriesSettingsController setRequestingUpdates:](self, "setRequestingUpdates:", 1);
    -[PXContextualMemoriesSettingsController settings](self, "settings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "locationSetting");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accuracy");
    v13 = v12;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __112__PXContextualMemoriesSettingsController_requestUpdatedContextualMemoriesSettingsWithOptions_completionHandler___block_invoke;
    v15[3] = &unk_1E513DD48;
    v16 = v10;
    v17 = v6;
    v18 = self;
    v19 = v8;
    v14 = v10;
    objc_msgSend(v11, "requestLocationUpdateWithAccuracy:completionHandler:", v15, v13);

  }
}

- (void)registerForLocationPrefetchingWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLMemoriesGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v9 = 138412290;
    v10 = v4;
    _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEBUG, "[Settings] Register for location pre-fetching: \"%@\", (uint8_t *)&v9, 0xCu);
  }

  -[PXContextualMemoriesSettingsController registrationIdentifiers](self, "registrationIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v4);
  -[PXContextualMemoriesSettingsController settings](self, "settings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "locationSetting");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setMonitorsCurrentLocation:", 1);

}

- (void)unregisterForLocationPrefetchingWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLMemoriesGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v9 = 138412290;
    v10 = v4;
    _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEBUG, "[Settings] Unregister for location pre-fetching: \"%@\", (uint8_t *)&v9, 0xCu);
  }

  -[PXContextualMemoriesSettingsController registrationIdentifiers](self, "registrationIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObject:", v4);
  if (!objc_msgSend(v6, "count"))
  {
    -[PXContextualMemoriesSettingsController settings](self, "settings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "locationSetting");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setMonitorsCurrentLocation:", 0);

  }
}

- (PXContextualMemoriesSettings)settings
{
  return self->_settings;
}

- (BOOL)isRequestingUpdates
{
  return self->_requestingUpdates;
}

- (void)setRequestingUpdates:(BOOL)a3
{
  self->_requestingUpdates = a3;
}

- (NSMutableArray)completionHandlers
{
  return self->_completionHandlers;
}

- (void)setCompletionHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_completionHandlers, a3);
}

- (NSMutableArray)registrationIdentifiers
{
  return self->_registrationIdentifiers;
}

- (void)setRegistrationIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_registrationIdentifiers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registrationIdentifiers, 0);
  objc_storeStrong((id *)&self->_completionHandlers, 0);
  objc_storeStrong((id *)&self->_settings, 0);
}

void __112__PXContextualMemoriesSettingsController_requestUpdatedContextualMemoriesSettingsWithOptions_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "peopleSetting");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "peopleProximityDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __112__PXContextualMemoriesSettingsController_requestUpdatedContextualMemoriesSettingsWithOptions_completionHandler___block_invoke_2;
  v5[3] = &unk_1E51457C8;
  v4 = *(void **)(a1 + 56);
  v5[4] = *(_QWORD *)(a1 + 48);
  v6 = v4;
  v7 = *(id *)(a1 + 32);
  objc_msgSend(v2, "requestPeopleNamesUpdateSinceDate:withCompletionHandler:", v3, v5);

}

void __112__PXContextualMemoriesSettingsController_requestUpdatedContextualMemoriesSettingsWithOptions_completionHandler___block_invoke_2(id *a1)
{
  id v2;
  _QWORD v3[4];
  id v4;

  objc_msgSend(a1[4], "setRequestingUpdates:", 0);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __112__PXContextualMemoriesSettingsController_requestUpdatedContextualMemoriesSettingsWithOptions_completionHandler___block_invoke_3;
  v3[3] = &unk_1E512B360;
  v2 = a1[5];
  v4 = a1[6];
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v3);
  objc_msgSend(a1[5], "removeAllObjects");

}

uint64_t __112__PXContextualMemoriesSettingsController_requestUpdatedContextualMemoriesSettingsWithOptions_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, _QWORD))(a2 + 16))(a2, *(_QWORD *)(a1 + 32));
}

+ (id)sharedController
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__PXContextualMemoriesSettingsController_sharedController__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedController_onceToken_131578 != -1)
    dispatch_once(&sharedController_onceToken_131578, block);
  return (id)sharedController_s_sharedController;
}

void __58__PXContextualMemoriesSettingsController_sharedController__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedController_s_sharedController;
  sharedController_s_sharedController = (uint64_t)v1;

}

@end
