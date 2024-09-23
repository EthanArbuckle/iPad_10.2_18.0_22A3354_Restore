@implementation SBApplicationPrivacyPreflightController

- (SBApplicationPrivacyPreflightController)initWithPreflightManager:(id)a3 applicationIdentity:(id)a4
{
  id v7;
  id v8;
  SBApplicationPrivacyPreflightController *v9;
  SBApplicationPrivacyPreflightController *v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *pendingCompletionsBySceneIdentifier;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SBApplicationPrivacyPreflightController;
  v9 = -[SBApplicationPrivacyPreflightController init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_privacyPreflightManager, a3);
    objc_storeStrong((id *)&v10->_applicationIdentity, a4);
    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    pendingCompletionsBySceneIdentifier = v10->_pendingCompletionsBySceneIdentifier;
    v10->_pendingCompletionsBySceneIdentifier = v11;

  }
  return v10;
}

- (void)addPendingCompletion:(id)a3 forSceneIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  PDCPreflightRequestCanceling *preflightCancelToken;
  PDCPreflightRequestCanceling *v11;
  PDCPreflightManager *privacyPreflightManager;
  LSApplicationIdentity *applicationIdentity;
  void *v14;
  PDCPreflightRequestCanceling *WeakRetained;
  PDCPreflightRequestCanceling *v16;
  void *v17;
  void *v18;
  _QWORD v19[6];
  uint64_t v20;
  id *v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBApplicationPrivacyPreflightController addPendingCompletion:forSceneIdentifier:]");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, CFSTR("SBApplicationPrivacyPreflightController.m"), 35, CFSTR("this call must be made on the main thread"));

  }
  -[NSMutableDictionary objectForKey:](self->_pendingCompletionsBySceneIdentifier, "objectForKey:", v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[NSMutableDictionary setObject:forKey:](self->_pendingCompletionsBySceneIdentifier, "setObject:forKey:", v8, v7);
  }
  v9 = (void *)MEMORY[0x1D17E5550](v6);
  objc_msgSend(v8, "addObject:", v9);

  preflightCancelToken = self->_preflightCancelToken;
  if (preflightCancelToken)
  {
    -[PDCPreflightRequestCanceling cancel](preflightCancelToken, "cancel");
    v11 = self->_preflightCancelToken;
    self->_preflightCancelToken = 0;

  }
  v20 = 0;
  v21 = (id *)&v20;
  v22 = 0x3042000000;
  v23 = __Block_byref_object_copy__100;
  v24 = __Block_byref_object_dispose__100;
  v25 = 0;
  privacyPreflightManager = self->_privacyPreflightManager;
  applicationIdentity = self->_applicationIdentity;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __83__SBApplicationPrivacyPreflightController_addPendingCompletion_forSceneIdentifier___block_invoke;
  v19[3] = &unk_1E8EBC768;
  v19[4] = self;
  v19[5] = &v20;
  -[PDCPreflightManager preflightLaunchForApplication:withCompletionHandler:](privacyPreflightManager, "preflightLaunchForApplication:withCompletionHandler:", applicationIdentity, v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeWeak(v21 + 5, v14);

  WeakRetained = (PDCPreflightRequestCanceling *)objc_loadWeakRetained(v21 + 5);
  v16 = self->_preflightCancelToken;
  self->_preflightCancelToken = WeakRetained;

  _Block_object_dispose(&v20, 8);
  objc_destroyWeak(&v25);

}

void __83__SBApplicationPrivacyPreflightController_addPendingCompletion_forSceneIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  id WeakRetained;

  if (a2 == 1)
    v2 = 1;
  else
    v2 = 2 * (a2 != 0);
  v3 = *(void **)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  objc_msgSend(v3, "_notePreflightFinishedWithResult:cancelToken:", v2, WeakRetained);

}

- (void)notePreflightFinishedWithResult:(unint64_t)a3
{
  -[SBApplicationPrivacyPreflightController _notePreflightFinishedWithResult:cancelToken:](self, "_notePreflightFinishedWithResult:cancelToken:", a3, self->_preflightCancelToken);
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D01750], "descriptionForRootObject:", self);
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  SBApplicationPrivacyPreflightController *v9;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72__SBApplicationPrivacyPreflightController_appendDescriptionToFormatter___block_invoke;
  v7[3] = &unk_1E8E9E820;
  v8 = v4;
  v9 = self;
  v6 = v4;
  objc_msgSend(v6, "appendProem:block:", self, v7);
  v5 = (id)objc_msgSend(v6, "appendObject:withName:", self->_pendingCompletionsBySceneIdentifier, CFSTR("pendingCompletions"));

}

void __72__SBApplicationPrivacyPreflightController_appendDescriptionToFormatter___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "identityString");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "appendString:withName:", v2, CFSTR("applicationIdentity"));

}

- (void)_notePreflightFinishedWithResult:(unint64_t)a3 cancelToken:(id)a4
{
  PDCPreflightRequestCanceling *v6;
  NSMutableDictionary *v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void (**v16)(void *, unint64_t, BOOL);
  void (**v17)(void *, unint64_t, BOOL);
  NSMutableDictionary *pendingCompletionsBySceneIdentifier;
  NSMutableDictionary *v19;
  PDCPreflightRequestCanceling *preflightCancelToken;
  void *v21;
  void *v22;
  SBApplicationPrivacyPreflightController *v23;
  PDCPreflightRequestCanceling *v24;
  NSMutableDictionary *obj;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = (PDCPreflightRequestCanceling *)a4;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBApplicationPrivacyPreflightController _notePreflightFinishedWithResult:cancelToken:]");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, CFSTR("SBApplicationPrivacyPreflightController.m"), 89, CFSTR("this call must be made on the main thread"));

  }
  if (self->_preflightCancelToken == v6)
  {
    v24 = v6;
    v7 = (NSMutableDictionary *)-[NSMutableDictionary mutableCopy](self->_pendingCompletionsBySceneIdentifier, "mutableCopy");
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v23 = self;
    obj = self->_pendingCompletionsBySceneIdentifier;
    v27 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    if (v27)
    {
      v26 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v27; ++i)
        {
          if (*(_QWORD *)v33 != v26)
            objc_enumerationMutation(obj);
          v9 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
          -[NSMutableDictionary objectForKey:](v7, "objectForKey:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary removeObjectForKey:](v7, "removeObjectForKey:", v9);
          v30 = 0u;
          v31 = 0u;
          v28 = 0u;
          v29 = 0u;
          objc_msgSend(v10, "reverseObjectEnumerator");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v29;
            do
            {
              for (j = 0; j != v13; ++j)
              {
                if (*(_QWORD *)v29 != v14)
                  objc_enumerationMutation(v11);
                v16 = *(void (***)(void *, unint64_t, BOOL))(*((_QWORD *)&v28 + 1) + 8 * j);
                objc_msgSend(v10, "lastObject");
                v17 = (void (**)(void *, unint64_t, BOOL))objc_claimAutoreleasedReturnValue();
                v16[2](v16, a3, v16 == v17);

              }
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
            }
            while (v13);
          }

        }
        v27 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      }
      while (v27);
    }

    pendingCompletionsBySceneIdentifier = v23->_pendingCompletionsBySceneIdentifier;
    v23->_pendingCompletionsBySceneIdentifier = v7;
    v19 = v7;

    preflightCancelToken = v23->_preflightCancelToken;
    v23->_preflightCancelToken = 0;

    v6 = v24;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preflightCancelToken, 0);
  objc_storeStrong((id *)&self->_pendingCompletionsBySceneIdentifier, 0);
  objc_storeStrong((id *)&self->_applicationIdentity, 0);
  objc_storeStrong((id *)&self->_privacyPreflightManager, 0);
}

@end
