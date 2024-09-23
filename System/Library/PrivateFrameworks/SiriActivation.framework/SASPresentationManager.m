@implementation SASPresentationManager

- (SASPresentationManager)init
{
  SASPresentationManager *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *presentations;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SASPresentationManager;
  v2 = -[SASPresentationManager init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    presentations = v2->_presentations;
    v2->_presentations = v3;

  }
  return v2;
}

- (int64_t)requestState
{
  os_log_t *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  os_log_t v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v3 = (os_log_t *)MEMORY[0x1E0CFE6A0];
  v4 = (void *)*MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)MEMORY[0x1E0CB3978];
    v6 = v4;
    objc_msgSend(v5, "currentThread");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v34 = "-[SASPresentationManager requestState]";
    v35 = 2048;
    v36 = objc_msgSend(v7, "qualityOfService");
    _os_log_impl(&dword_1D132F000, v6, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock about to lock with qos: %zd", buf, 0x16u);

  }
  os_unfair_lock_lock(&presentationsLock);
  v8 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v34 = "-[SASPresentationManager requestState]";
    _os_log_impl(&dword_1D132F000, v8, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock successfully locked", buf, 0xCu);
  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  -[NSMutableDictionary allValues](self->_presentations, "allValues", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v45, 16);
  if (!v10)
  {

    v14 = 0;
    goto LABEL_20;
  }
  v11 = v10;
  v12 = 0;
  v13 = 0;
  v14 = 0;
  v15 = 0;
  v16 = *(_QWORD *)v30;
  do
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v30 != v16)
        objc_enumerationMutation(v9);
      switch(objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "requestState"))
      {
        case 0:
          ++v14;
          break;
        case 2:
          ++v12;
          break;
        case 3:
          ++v15;
          break;
        case 4:
          ++v13;
          break;
        default:
          continue;
      }
    }
    v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v45, 16);
  }
  while (v11);

  if (v15)
  {
    v18 = 3;
    goto LABEL_25;
  }
  if (v12)
  {
    v15 = 0;
    v18 = 2;
    goto LABEL_25;
  }
  if (!v13)
  {
LABEL_20:
    v15 = 0;
    v13 = 0;
    v12 = 0;
    v18 = 0;
    goto LABEL_25;
  }
  v15 = 0;
  v12 = 0;
  v18 = 4;
LABEL_25:
  v19 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
  {
    v20 = (void *)MEMORY[0x1E0CB37E8];
    v21 = v19;
    objc_msgSend(v20, "numberWithUnsignedInteger:", v15);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v12);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v13);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v14);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    SASRequestStateGetName(v18);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136316418;
    v34 = "-[SASPresentationManager requestState]";
    v35 = 2112;
    v36 = (uint64_t)v22;
    v37 = 2112;
    v38 = v23;
    v39 = 2112;
    v40 = v24;
    v41 = 2112;
    v42 = v25;
    v43 = 2112;
    v44 = v26;
    _os_log_impl(&dword_1D132F000, v21, OS_LOG_TYPE_DEFAULT, "%s #activation active: %@ | starting: %@ | stopping: %@ | off: %@ | computed state: %@", buf, 0x3Eu);

  }
  os_unfair_lock_unlock(&presentationsLock);
  v27 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v34 = "-[SASPresentationManager requestState]";
    _os_log_impl(&dword_1D132F000, v27, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock unlocked", buf, 0xCu);
  }
  return v18;
}

- (void)registerSiriPresentation:(id)a3 withIdentifier:(int64_t)a4
{
  id v6;
  void *v7;
  os_log_t *v8;
  NSObject *v9;
  os_log_t v10;
  os_log_t *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  int64_t v17;
  void *v18;
  int v19;
  SASPresentationModel *v20;
  int64_t v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  id v39;
  uint8_t v40[128];
  uint8_t buf[4];
  const char *v42;
  __int16 v43;
  uint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithSiriPresentationIdentifier:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (os_log_t *)MEMORY[0x1E0CFE6A0];
  v9 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v42 = "-[SASPresentationManager registerSiriPresentation:withIdentifier:]";
    v43 = 2112;
    v44 = (uint64_t)v7;
    _os_log_impl(&dword_1D132F000, v9, OS_LOG_TYPE_DEFAULT, "%s #activation presentationIdentifierKey: %@", buf, 0x16u);
  }
  v10 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
  {
    v11 = v8;
    v12 = (void *)MEMORY[0x1E0CB3978];
    v13 = v10;
    objc_msgSend(v12, "currentThread");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "qualityOfService");
    *(_DWORD *)buf = 136315394;
    v42 = "-[SASPresentationManager registerSiriPresentation:withIdentifier:]";
    v43 = 2048;
    v44 = v15;
    _os_log_impl(&dword_1D132F000, v13, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock about to lock with qos: %zd", buf, 0x16u);

    v8 = v11;
  }
  os_unfair_lock_lock(&presentationsLock);
  v16 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v42 = "-[SASPresentationManager registerSiriPresentation:withIdentifier:]";
    _os_log_impl(&dword_1D132F000, v16, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock successfully locked", buf, 0xCu);
  }
  v17 = -[SASPresentationManager _presentationsLock_nextPresentationToActivate](self, "_presentationsLock_nextPresentationToActivate");
  -[NSMutableDictionary allKeys](self->_presentations, "allKeys");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "containsObject:", v7);

  if (v19)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_ERROR))
      -[SASPresentationManager registerSiriPresentation:withIdentifier:].cold.1();
    -[NSMutableDictionary removeObjectForKey:](self->_presentations, "removeObjectForKey:", v7);
  }
  -[SASPresentationManager _presentationsLock_cancelAllPreheatedPresentations](self, "_presentationsLock_cancelAllPreheatedPresentations");
  v20 = -[SASPresentationModel initWithPresentationServer:]([SASPresentationModel alloc], "initWithPresentationServer:", v6);
  -[NSMutableDictionary setObject:forKey:](self->_presentations, "setObject:forKey:", v20, v7);
  v21 = -[SASPresentationManager _presentationsLock_nextPresentationToActivate](self, "_presentationsLock_nextPresentationToActivate");
  if (v17 == v21)
    -[SASPresentationManager _informPresentationOfPresentationWithPriority:nextPresentationToActivate:](self, "_informPresentationOfPresentationWithPriority:nextPresentationToActivate:", v20, v17, v20, v6);
  else
    -[SASPresentationManager _presentationsLock_nextPresentationToActivateDidChange:](self, "_presentationsLock_nextPresentationToActivateDidChange:", v21, v20, v6);
  v22 = v7;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  -[NSMutableDictionary allKeys](self->_presentations, "allKeys");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v36 != v26)
          objc_enumerationMutation(v23);
        v28 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
        if ((objc_msgSend(v22, "isEqualToString:", v28) & 1) == 0)
        {
          -[NSMutableDictionary valueForKey:](self->_presentations, "valueForKey:", v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "presentationState");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = v22;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v39, 1);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          -[SASPresentationManager _presentationsLock_broadcastPresentationStateForIdentifier:presentationState:presentationIdentifiersToInform:](self, "_presentationsLock_broadcastPresentationStateForIdentifier:presentationState:presentationIdentifiersToInform:", v28, v30, v31);

        }
      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v25);
  }

  os_unfair_lock_unlock(&presentationsLock);
  v32 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v42 = "-[SASPresentationManager registerSiriPresentation:withIdentifier:]";
    _os_log_impl(&dword_1D132F000, v32, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock unlocked", buf, 0xCu);
  }

}

- (void)unregisterSiriPresentationWithIdentifier:(int64_t)a3
{
  void *v4;
  os_log_t *v5;
  NSObject *v6;
  os_log_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  int64_t v13;
  void *v14;
  char v15;
  void *v16;
  uint64_t v17;
  int64_t v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  int v22;
  const char *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithSiriPresentationIdentifier:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (os_log_t *)MEMORY[0x1E0CFE6A0];
  v6 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v22 = 136315394;
    v23 = "-[SASPresentationManager unregisterSiriPresentationWithIdentifier:]";
    v24 = 2112;
    v25 = (uint64_t)v4;
    _os_log_impl(&dword_1D132F000, v6, OS_LOG_TYPE_DEFAULT, "%s #activation presentationIdentifierKey: %@", (uint8_t *)&v22, 0x16u);
  }
  v7 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)MEMORY[0x1E0CB3978];
    v9 = v7;
    objc_msgSend(v8, "currentThread");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "qualityOfService");
    v22 = 136315394;
    v23 = "-[SASPresentationManager unregisterSiriPresentationWithIdentifier:]";
    v24 = 2048;
    v25 = v11;
    _os_log_impl(&dword_1D132F000, v9, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock about to lock with qos: %zd", (uint8_t *)&v22, 0x16u);

  }
  os_unfair_lock_lock(&presentationsLock);
  v12 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    v22 = 136315138;
    v23 = "-[SASPresentationManager unregisterSiriPresentationWithIdentifier:]";
    _os_log_impl(&dword_1D132F000, v12, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock successfully locked", (uint8_t *)&v22, 0xCu);
  }
  v13 = -[SASPresentationManager _presentationsLock_nextPresentationToActivate](self, "_presentationsLock_nextPresentationToActivate");
  -[NSMutableDictionary allKeys](self->_presentations, "allKeys");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "containsObject:", v4);

  if ((v15 & 1) != 0)
  {
    -[SASPresentationManager _presentationsLock_cancelAllPreheatedPresentations](self, "_presentationsLock_cancelAllPreheatedPresentations");
    -[NSMutableDictionary removeObjectForKey:](self->_presentations, "removeObjectForKey:", v4);
    -[NSMutableDictionary allKeys](self->_presentations, "allKeys");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "count");

    if (v17)
    {
      v18 = -[SASPresentationManager _presentationsLock_nextPresentationToActivate](self, "_presentationsLock_nextPresentationToActivate");
      if (v13 != v18)
        -[SASPresentationManager _presentationsLock_nextPresentationToActivateDidChange:](self, "_presentationsLock_nextPresentationToActivateDidChange:", v18);
    }
    -[NSMutableDictionary allKeys](self->_presentations, "allKeys");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SASPresentationManager _presentationsLock_broadcastPresentationStateForIdentifier:presentationState:presentationIdentifiersToInform:](self, "_presentationsLock_broadcastPresentationStateForIdentifier:presentationState:presentationIdentifiersToInform:", v4, 0, v19);

    os_unfair_lock_unlock(&presentationsLock);
    v20 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      v22 = 136315138;
      v23 = "-[SASPresentationManager unregisterSiriPresentationWithIdentifier:]";
      _os_log_impl(&dword_1D132F000, v20, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock unlocked", (uint8_t *)&v22, 0xCu);
    }
    -[SASPresentationManager _requestStateDidChange](self, "_requestStateDidChange");
  }
  else
  {
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
      -[SASPresentationManager unregisterSiriPresentationWithIdentifier:].cold.1();
    os_unfair_lock_unlock(&presentationsLock);
    v21 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      v22 = 136315138;
      v23 = "-[SASPresentationManager unregisterSiriPresentationWithIdentifier:]";
      _os_log_impl(&dword_1D132F000, v21, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock unlocked", (uint8_t *)&v22, 0xCu);
    }
  }

}

- (void)requestHintGlowForNextPresentation
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_1D132F000, v0, v1, "%s #activation tried to request hint glow %@ but it's not a registered presentation", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)preheatNextPresentationToActivate
{
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  SASRequestStateGetName(objc_msgSend(a3, "requestState"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 136315650;
  v8 = "-[SASPresentationManager preheatNextPresentationToActivate]";
  v9 = 2112;
  v10 = a1;
  v11 = 2112;
  v12 = v6;
  _os_log_error_impl(&dword_1D132F000, v5, OS_LOG_TYPE_ERROR, "%s #activation #preheat tried to preheat %@ but it's request state is %@", (uint8_t *)&v7, 0x20u);

}

- (void)cancelAllPreheatedPresentations
{
  os_log_t *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = (os_log_t *)MEMORY[0x1E0CFE6A0];
  v4 = (void *)*MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)MEMORY[0x1E0CB3978];
    v6 = v4;
    objc_msgSend(v5, "currentThread");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 136315394;
    v11 = "-[SASPresentationManager cancelAllPreheatedPresentations]";
    v12 = 2048;
    v13 = objc_msgSend(v7, "qualityOfService");
    _os_log_impl(&dword_1D132F000, v6, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock about to lock with qos: %zd", (uint8_t *)&v10, 0x16u);

  }
  os_unfair_lock_lock(&presentationsLock);
  v8 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315138;
    v11 = "-[SASPresentationManager cancelAllPreheatedPresentations]";
    _os_log_impl(&dword_1D132F000, v8, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock successfully locked", (uint8_t *)&v10, 0xCu);
  }
  -[SASPresentationManager _presentationsLock_cancelAllPreheatedPresentations](self, "_presentationsLock_cancelAllPreheatedPresentations");
  os_unfair_lock_unlock(&presentationsLock);
  v9 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315138;
    v11 = "-[SASPresentationManager cancelAllPreheatedPresentations]";
    _os_log_impl(&dword_1D132F000, v9, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock unlocked", (uint8_t *)&v10, 0xCu);
  }
}

- (void)_presentationsLock_cancelAllPreheatedPresentations
{
  void *v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  void *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[NSMutableDictionary allKeys](self->_presentations, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v21;
    *(_QWORD *)&v5 = 136315650;
    v19 = v5;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(v3);
        v9 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        -[NSMutableDictionary objectForKey:](self->_presentations, "objectForKey:", v9, v19);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "requestState");
        v12 = *MEMORY[0x1E0CFE6A0];
        v13 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT);
        if (v11 == 1)
        {
          if (v13)
          {
            *(_DWORD *)buf = 136315394;
            v25 = "-[SASPresentationManager _presentationsLock_cancelAllPreheatedPresentations]";
            v26 = 2112;
            v27 = v9;
            _os_log_impl(&dword_1D132F000, v12, OS_LOG_TYPE_DEFAULT, "%s #activation cancelling preheat for presentation: %@", buf, 0x16u);
          }
          objc_msgSend(v10, "presentationServer");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "connection");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "remoteTarget");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "cancelPreheat");

          objc_msgSend(v10, "setRequestState:", 0);
        }
        else if (v13)
        {
          v17 = v12;
          SASRequestStateGetName(objc_msgSend(v10, "requestState"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v19;
          v25 = "-[SASPresentationManager _presentationsLock_cancelAllPreheatedPresentations]";
          v26 = 2112;
          v27 = v9;
          v28 = 2112;
          v29 = v18;
          _os_log_impl(&dword_1D132F000, v17, OS_LOG_TYPE_DEFAULT, "%s #activation #noisy not cancelling preheat for presentation: %@ because it appears to be %@", buf, 0x20u);

        }
      }
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
    }
    while (v6);
  }

}

- (void)setPresentationManagerDelegate:(id)a3
{
  SASPresentationManagerDelegate **p_presentationManagerDelegate;
  id WeakRetained;
  void *v6;
  id obj;

  obj = a3;
  p_presentationManagerDelegate = &self->_presentationManagerDelegate;
  WeakRetained = objc_loadWeakRetained((id *)p_presentationManagerDelegate);

  v6 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)p_presentationManagerDelegate, obj);
    v6 = obj;
  }

}

- (void)_requestStateDidChange
{
  int64_t v3;
  BOOL v4;
  id v5;
  SASPresentationAggregateState *lastReportedState;
  uint64_t v7;
  NSObject *v8;
  SASPresentationAggregateState *v9;
  id WeakRetained;
  _QWORD v11[6];
  BOOL v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  SASPresentationAggregateState *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = -[SASPresentationManager requestState](self, "requestState");
  v4 = -[SASPresentationManager shouldRejectNewActivationsForRequestState:](self, "shouldRejectNewActivationsForRequestState:", v3);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __48__SASPresentationManager__requestStateDidChange__block_invoke;
  v11[3] = &unk_1E91FC5C8;
  v12 = !v4;
  v11[4] = self;
  v11[5] = v3;
  v5 = +[SASPresentationAggregateState newWithBuilder:](SASPresentationAggregateState, "newWithBuilder:", v11);
  lastReportedState = self->lastReportedState;
  if (!lastReportedState
    || (v7 = -[SASPresentationAggregateState requestState](lastReportedState, "requestState"),
        v7 != objc_msgSend(v5, "requestState")))
  {
    v8 = *MEMORY[0x1E0CFE6A0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
    {
      v9 = self->lastReportedState;
      *(_DWORD *)buf = 136315650;
      v14 = "-[SASPresentationManager _requestStateDidChange]";
      v15 = 2112;
      v16 = v9;
      v17 = 2112;
      v18 = v5;
      _os_log_impl(&dword_1D132F000, v8, OS_LOG_TYPE_DEFAULT, "%s #activation: oldAggregateState %@ | newAggregateState: %@", buf, 0x20u);
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_presentationManagerDelegate);
    objc_msgSend(WeakRetained, "presentationManager:didChangeAggregateState:", self, v5);

    objc_storeStrong((id *)&self->lastReportedState, v5);
  }

}

void __48__SASPresentationManager__requestStateDidChange__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "setRequestState:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v5, "setCanAcceptNewActivations:", *(unsigned __int8 *)(a1 + 48));
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  if (v3)
    v4 = *(unsigned __int8 *)(a1 + 48) != objc_msgSend(v3, "canAcceptNewActivations");
  else
    v4 = 1;
  objc_msgSend(v5, "setDidNewActivationAcceptanceChange:", v4);

}

- (BOOL)shouldRejectNewActivationsForRequestState:(int64_t)a3
{
  return (unint64_t)(a3 - 2) < 3;
}

- (void)_sendBlock:(id)a3 toPresentationWithPresentationIdentifier:(int64_t)a4
{
  void (**v6)(id, void *);
  void *v7;
  os_log_t *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  id WeakRetained;
  int v20;
  const char *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, void *))a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithSiriPresentationIdentifier:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (os_log_t *)MEMORY[0x1E0CFE6A0];
  v9 = (void *)*MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)MEMORY[0x1E0CB3978];
    v11 = v9;
    objc_msgSend(v10, "currentThread");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 136315394;
    v21 = "-[SASPresentationManager _sendBlock:toPresentationWithPresentationIdentifier:]";
    v22 = 2048;
    v23 = objc_msgSend(v12, "qualityOfService");
    _os_log_impl(&dword_1D132F000, v11, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock about to lock with qos: %zd", (uint8_t *)&v20, 0x16u);

  }
  os_unfair_lock_lock(&presentationsLock);
  v13 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 136315138;
    v21 = "-[SASPresentationManager _sendBlock:toPresentationWithPresentationIdentifier:]";
    _os_log_impl(&dword_1D132F000, v13, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock successfully locked", (uint8_t *)&v20, 0xCu);
  }
  -[NSMutableDictionary objectForKey:](self->_presentations, "objectForKey:", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    objc_msgSend(v14, "presentationServer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v16);

    os_unfair_lock_unlock(&presentationsLock);
    v17 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 136315138;
      v21 = "-[SASPresentationManager _sendBlock:toPresentationWithPresentationIdentifier:]";
      _os_log_impl(&dword_1D132F000, v17, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock unlocked", (uint8_t *)&v20, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
      -[SASPresentationManager _sendBlock:toPresentationWithPresentationIdentifier:].cold.1();
    os_unfair_lock_unlock(&presentationsLock);
    v18 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 136315138;
      v21 = "-[SASPresentationManager _sendBlock:toPresentationWithPresentationIdentifier:]";
      _os_log_impl(&dword_1D132F000, v18, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock unlocked", (uint8_t *)&v20, 0xCu);
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_presentationManagerDelegate);
    objc_msgSend(WeakRetained, "presentationManager:didEncounterError:", self, 2);

  }
}

- (void)_sendBlockToActivePresentations:(id)a3
{
  void (**v4)(id, void *);
  os_log_t *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  NSObject *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a3;
  v5 = (os_log_t *)MEMORY[0x1E0CFE6A0];
  v6 = (void *)*MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)MEMORY[0x1E0CB3978];
    v8 = v6;
    objc_msgSend(v7, "currentThread");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v25 = "-[SASPresentationManager _sendBlockToActivePresentations:]";
    v26 = 2048;
    v27 = objc_msgSend(v9, "qualityOfService");
    _os_log_impl(&dword_1D132F000, v8, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock about to lock with qos: %zd", buf, 0x16u);

  }
  os_unfair_lock_lock(&presentationsLock);
  v10 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v25 = "-[SASPresentationManager _sendBlockToActivePresentations:]";
    _os_log_impl(&dword_1D132F000, v10, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock successfully locked", buf, 0xCu);
  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[NSMutableDictionary allValues](self->_presentations, "allValues", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (objc_msgSend(v16, "requestState") == 3)
        {
          objc_msgSend(v16, "presentationServer");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v4[2](v4, v17);

        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v13);
  }

  os_unfair_lock_unlock(&presentationsLock);
  v18 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v25 = "-[SASPresentationManager _sendBlockToActivePresentations:]";
    _os_log_impl(&dword_1D132F000, v18, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock unlocked", buf, 0xCu);
  }

}

- (void)_sendBlockToStartingPresentations:(id)a3
{
  void (**v4)(id, void *);
  os_log_t *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  NSObject *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a3;
  v5 = (os_log_t *)MEMORY[0x1E0CFE6A0];
  v6 = (void *)*MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)MEMORY[0x1E0CB3978];
    v8 = v6;
    objc_msgSend(v7, "currentThread");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v25 = "-[SASPresentationManager _sendBlockToStartingPresentations:]";
    v26 = 2048;
    v27 = objc_msgSend(v9, "qualityOfService");
    _os_log_impl(&dword_1D132F000, v8, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock about to lock with qos: %zd", buf, 0x16u);

  }
  os_unfair_lock_lock(&presentationsLock);
  v10 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v25 = "-[SASPresentationManager _sendBlockToStartingPresentations:]";
    _os_log_impl(&dword_1D132F000, v10, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock successfully locked", buf, 0xCu);
  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[NSMutableDictionary allValues](self->_presentations, "allValues", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (objc_msgSend(v16, "requestState") == 2)
        {
          objc_msgSend(v16, "presentationServer");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v4[2](v4, v17);

        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v13);
  }

  os_unfair_lock_unlock(&presentationsLock);
  v18 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v25 = "-[SASPresentationManager _sendBlockToStartingPresentations:]";
    _os_log_impl(&dword_1D132F000, v18, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock unlocked", buf, 0xCu);
  }

}

- (void)_sendBlockToStoppingPresentations:(id)a3
{
  void (**v4)(id, void *);
  os_log_t *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  NSObject *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a3;
  v5 = (os_log_t *)MEMORY[0x1E0CFE6A0];
  v6 = (void *)*MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)MEMORY[0x1E0CB3978];
    v8 = v6;
    objc_msgSend(v7, "currentThread");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v25 = "-[SASPresentationManager _sendBlockToStoppingPresentations:]";
    v26 = 2048;
    v27 = objc_msgSend(v9, "qualityOfService");
    _os_log_impl(&dword_1D132F000, v8, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock about to lock with qos: %zd", buf, 0x16u);

  }
  os_unfair_lock_lock(&presentationsLock);
  v10 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v25 = "-[SASPresentationManager _sendBlockToStoppingPresentations:]";
    _os_log_impl(&dword_1D132F000, v10, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock successfully locked", buf, 0xCu);
  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[NSMutableDictionary allValues](self->_presentations, "allValues", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (objc_msgSend(v16, "requestState") == 4)
        {
          objc_msgSend(v16, "presentationServer");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v4[2](v4, v17);

        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v13);
  }

  os_unfair_lock_unlock(&presentationsLock);
  v18 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v25 = "-[SASPresentationManager _sendBlockToStoppingPresentations:]";
    _os_log_impl(&dword_1D132F000, v18, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock unlocked", buf, 0xCu);
  }

}

- (void)sendButtonEventCompletionToPresentations:(id)a3 forButtonEventType:(unint64_t)a4
{
  void (**v5)(id, void *);
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  _BOOL4 v34;
  void *v35;
  int v36;
  NSObject *v37;
  void *v38;
  NSObject *v39;
  uint64_t v40;
  NSObject *v41;
  const char *v42;
  NSObject *v43;
  __int128 v44;
  id obj;
  unint64_t v46;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t buf[4];
  const char *v53;
  __int16 v54;
  uint64_t v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  void *v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, void *))a3;
  v6 = *MEMORY[0x1E0CFE6A0];
  v7 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT);
  v46 = a4;
  if (a4)
  {
    if (v7)
    {
      v8 = (void *)MEMORY[0x1E0CB3978];
      v9 = v6;
      objc_msgSend(v8, "currentThread");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v53 = "-[SASPresentationManager sendButtonEventCompletionToPresentations:forButtonEventType:]";
      v54 = 2048;
      v55 = objc_msgSend(v10, "qualityOfService");
      _os_log_impl(&dword_1D132F000, v9, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock about to lock with qos: %zd", buf, 0x16u);

    }
    os_unfair_lock_lock(&presentationsLock);
    v11 = *MEMORY[0x1E0CFE6A0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v53 = "-[SASPresentationManager sendButtonEventCompletionToPresentations:forButtonEventType:]";
      _os_log_impl(&dword_1D132F000, v11, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock successfully locked", buf, 0xCu);
    }
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    -[NSMutableDictionary allKeys](self->_presentations, "allKeys");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
    if (v12)
    {
      v14 = v12;
      v15 = *(_QWORD *)v49;
      *(_QWORD *)&v13 = 136315650;
      v44 = v13;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v49 != v15)
            objc_enumerationMutation(obj);
          v17 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v16);
          -[NSMutableDictionary objectForKeyedSubscript:](self->_presentations, "objectForKeyedSubscript:", v17, v44);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "requestState");
          v20 = (void *)*MEMORY[0x1E0CFE6A0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
          {
            v21 = v20;
            SASButtonEventTypeGetName(v46);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            SASRequestStateGetName(v19);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315906;
            v53 = "-[SASPresentationManager sendButtonEventCompletionToPresentations:forButtonEventType:]";
            v54 = 2112;
            v55 = (uint64_t)v17;
            v56 = 2112;
            v57 = v22;
            v58 = 2112;
            v59 = v23;
            _os_log_impl(&dword_1D132F000, v21, OS_LOG_TYPE_DEFAULT, "%s #activation presentation: %@, type: %@, state: %@", buf, 0x2Au);

          }
          if (objc_msgSend(v18, "requestState") == 3)
          {
            objc_msgSend(v18, "presentationServer");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v5[2](v5, v24);
LABEL_26:

            goto LABEL_27;
          }
          if (objc_msgSend(v18, "requestState") == 2)
          {
            v25 = (void *)*MEMORY[0x1E0CFE6A0];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
            {
              v26 = v25;
              SASRequestStateGetName(3);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136315394;
              v53 = "-[SASPresentationManager sendButtonEventCompletionToPresentations:forButtonEventType:]";
              v54 = 2112;
              v55 = (uint64_t)v27;
              _os_log_impl(&dword_1D132F000, v26, OS_LOG_TYPE_DEFAULT, "%s #activation enqueuing button event completion until State is %@.", buf, 0x16u);
              goto LABEL_23;
            }
            goto LABEL_24;
          }
          v28 = objc_msgSend(v18, "requestState");
          if (v46 == 2 && !v28)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithSiriPresentationIdentifier:", 2);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = objc_msgSend(v17, "isEqualToString:", v29);

            if (v30)
            {
              v31 = (void *)*MEMORY[0x1E0CFE6A0];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
              {
                v26 = v31;
                SASButtonEventTypeGetName(2);
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                SASRequestStateGetName(v19);
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = v44;
                v53 = "-[SASPresentationManager sendButtonEventCompletionToPresentations:forButtonEventType:]";
                v54 = 2112;
                v55 = (uint64_t)v27;
                v56 = 2112;
                v57 = v32;
                _os_log_impl(&dword_1D132F000, v26, OS_LOG_TYPE_DEFAULT, "%s #activation received %@ while request state is %@, enqueueing.", buf, 0x20u);

LABEL_23:
              }
LABEL_24:
              objc_msgSend(v18, "enqueuedButtonEventCompletions");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v33 = _Block_copy(v5);
              objc_msgSend(v24, "addObject:", v33);
LABEL_25:

              goto LABEL_26;
            }
          }
          v34 = -[SASPresentationManager _shouldShowHintGlow](self, "_shouldShowHintGlow");
          if (v46 == 2 && v34)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithSiriPresentationIdentifier:", 1);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = objc_msgSend(v17, "isEqualToString:", v35);

            if (v36)
            {
              v37 = *MEMORY[0x1E0CFE6A0];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315138;
                v53 = "-[SASPresentationManager sendButtonEventCompletionToPresentations:forButtonEventType:]";
                _os_log_impl(&dword_1D132F000, v37, OS_LOG_TYPE_DEFAULT, "%s #activation cancel hint glow activation for button up event", buf, 0xCu);
              }
              objc_msgSend(v18, "presentationServer");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "connection");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "remoteTarget");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "cancelActivatedHintGlow");

              goto LABEL_25;
            }
          }
          v39 = *MEMORY[0x1E0CFE6A0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            v53 = "-[SASPresentationManager sendButtonEventCompletionToPresentations:forButtonEventType:]";
            _os_log_impl(&dword_1D132F000, v39, OS_LOG_TYPE_DEFAULT, "%s #activation unhandled button event, ignoring.", buf, 0xCu);
          }
LABEL_27:

          ++v16;
        }
        while (v14 != v16);
        v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
        v14 = v40;
      }
      while (v40);
    }

    os_unfair_lock_unlock(&presentationsLock);
    v41 = *MEMORY[0x1E0CFE6A0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v53 = "-[SASPresentationManager sendButtonEventCompletionToPresentations:forButtonEventType:]";
      v42 = "%s #activation #locks #noisy presentationsLock unlocked";
      v43 = v41;
LABEL_42:
      _os_log_impl(&dword_1D132F000, v43, OS_LOG_TYPE_DEFAULT, v42, buf, 0xCu);
    }
  }
  else if (v7)
  {
    *(_DWORD *)buf = 136315138;
    v53 = "-[SASPresentationManager sendButtonEventCompletionToPresentations:forButtonEventType:]";
    v42 = "%s Received unknown button event type. Ignoring.";
    v43 = v6;
    goto LABEL_42;
  }

}

- (void)activePresentations_handleRequestWithOptions:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD aBlock[4];
  id v8;

  v4 = a3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __71__SASPresentationManager_activePresentations_handleRequestWithOptions___block_invoke;
  aBlock[3] = &unk_1E91FC5F0;
  v8 = v4;
  v5 = v4;
  v6 = _Block_copy(aBlock);
  -[SASPresentationManager _sendBlockToActivePresentations:](self, "_sendBlockToActivePresentations:", v6);

}

void __71__SASPresentationManager_activePresentations_handleRequestWithOptions___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  objc_msgSend(a2, "connection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteTarget");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "handleRequestWithOptions:", *(_QWORD *)(a1 + 32));

}

- (void)startingPresentations_cancelPendingActivationWithReason:(unint64_t)a3
{
  SiriPresentationActivationCancelReasonTransport *v4;
  SiriPresentationActivationCancelReasonTransport *v5;
  void *v6;
  _QWORD aBlock[4];
  SiriPresentationActivationCancelReasonTransport *v8;

  v4 = -[SiriPresentationActivationCancelReasonTransport initWithSiriPresentationActivationCancelReason:]([SiriPresentationActivationCancelReasonTransport alloc], "initWithSiriPresentationActivationCancelReason:", a3);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __82__SASPresentationManager_startingPresentations_cancelPendingActivationWithReason___block_invoke;
  aBlock[3] = &unk_1E91FC5F0;
  v8 = v4;
  v5 = v4;
  v6 = _Block_copy(aBlock);
  -[SASPresentationManager _sendBlockToStartingPresentations:](self, "_sendBlockToStartingPresentations:", v6);

}

void __82__SASPresentationManager_startingPresentations_cancelPendingActivationWithReason___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  objc_msgSend(a2, "connection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteTarget");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelPendingActivationEventWithReason:", *(_QWORD *)(a1 + 32));

}

- (void)activePresentations_deviceWonMyriadElection
{
  -[SASPresentationManager _sendBlockToActivePresentations:](self, "_sendBlockToActivePresentations:", &__block_literal_global_8);
}

void __69__SASPresentationManager_activePresentations_deviceWonMyriadElection__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  objc_msgSend(a2, "connection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteTarget");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deviceWonMyriadElection");

}

- (void)activeAndStartingPresentations_updateCurrentLockState:(unint64_t)a3
{
  SASLockStateTransport *v4;
  SASLockStateTransport *v5;
  void *v6;
  _QWORD aBlock[4];
  SASLockStateTransport *v8;

  v4 = -[SASLockStateTransport initWithSASLockState:]([SASLockStateTransport alloc], "initWithSASLockState:", a3);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __80__SASPresentationManager_activeAndStartingPresentations_updateCurrentLockState___block_invoke;
  aBlock[3] = &unk_1E91FC5F0;
  v8 = v4;
  v5 = v4;
  v6 = _Block_copy(aBlock);
  -[SASPresentationManager _sendBlockToActivePresentations:](self, "_sendBlockToActivePresentations:", v6);
  -[SASPresentationManager _sendBlockToStartingPresentations:](self, "_sendBlockToStartingPresentations:", v6);

}

void __80__SASPresentationManager_activeAndStartingPresentations_updateCurrentLockState___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  objc_msgSend(a2, "connection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteTarget");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateCurrentLockState:", *(_QWORD *)(a1 + 32));

}

- (void)startingAndActiveAndStoppingPresentations_presentationDismissalRequestedWithOptions:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD aBlock[4];
  id v8;

  v4 = a3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __110__SASPresentationManager_startingAndActiveAndStoppingPresentations_presentationDismissalRequestedWithOptions___block_invoke;
  aBlock[3] = &unk_1E91FC5F0;
  v8 = v4;
  v5 = v4;
  v6 = _Block_copy(aBlock);
  -[SASPresentationManager _sendBlockToStartingPresentations:](self, "_sendBlockToStartingPresentations:", v6);
  -[SASPresentationManager _sendBlockToActivePresentations:](self, "_sendBlockToActivePresentations:", v6);
  -[SASPresentationManager _sendBlockToStoppingPresentations:](self, "_sendBlockToStoppingPresentations:", v6);

}

void __110__SASPresentationManager_startingAndActiveAndStoppingPresentations_presentationDismissalRequestedWithOptions___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  objc_msgSend(a2, "connection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteTarget");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentationDismissalRequestedWithOptions:", *(_QWORD *)(a1 + 32));

}

- (void)activePresentations_bulletinManagerDidChangeBulletins
{
  -[SASPresentationManager _sendBlockToActivePresentations:](self, "_sendBlockToActivePresentations:", &__block_literal_global_55);
}

void __79__SASPresentationManager_activePresentations_bulletinManagerDidChangeBulletins__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  objc_msgSend(a2, "connection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteTarget");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bulletinManagerDidChangeBulletins");

}

- (BOOL)activePresentationsAreIdleAndQuiet
{
  os_log_t *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  char **__ptr32 *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  BOOL v20;
  NSObject *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = (os_log_t *)MEMORY[0x1E0CFE6A0];
  v4 = (void *)*MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)MEMORY[0x1E0CB3978];
    v6 = v4;
    objc_msgSend(v5, "currentThread");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v29 = "-[SASPresentationManager activePresentationsAreIdleAndQuiet]";
    v30 = 2048;
    v31 = objc_msgSend(v7, "qualityOfService");
    _os_log_impl(&dword_1D132F000, v6, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock about to lock with qos: %zd", buf, 0x16u);

  }
  os_unfair_lock_lock(&presentationsLock);
  v8 = *v3;
  v9 = &off_1D1378000;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v29 = "-[SASPresentationManager activePresentationsAreIdleAndQuiet]";
    _os_log_impl(&dword_1D132F000, v8, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock successfully locked", buf, 0xCu);
  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[NSMutableDictionary allValues](self->_presentations, "allValues", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v24;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v24 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        if (objc_msgSend(v15, "requestState") == 3)
        {
          objc_msgSend(v15, "presentationServer");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "connection");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "remoteTarget");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "presentationisIdleAndQuiet");

          if (!v19)
          {
            v20 = 0;
            goto LABEL_16;
          }
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v12)
        continue;
      break;
    }
    v20 = 1;
LABEL_16:
    v9 = &off_1D1378000;
  }
  else
  {
    v20 = 1;
  }

  os_unfair_lock_unlock(&presentationsLock);
  v21 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = *((_QWORD *)v9 + 83);
    v29 = "-[SASPresentationManager activePresentationsAreIdleAndQuiet]";
    _os_log_impl(&dword_1D132F000, v21, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock unlocked", buf, 0xCu);
  }
  return v20;
}

+ (BOOL)_canTransitionFromState:(int64_t)a3 toState:(int64_t)a4
{
  return objc_msgSend(a1, "_canTransitionFromState:toState:presentationIdentifier:", a3, a4, 0);
}

+ (BOOL)_canTransitionFromState:(int64_t)a3 toState:(int64_t)a4 presentationIdentifier:(int64_t)a5
{
  BOOL result;

  switch(a4)
  {
    case 0:
      result = objc_msgSend(a1, "_canTransitionToOffFromState:", a3);
      break;
    case 1:
      result = objc_msgSend(a1, "_canTransitionToHeatedFromState:", a3);
      break;
    case 2:
      result = objc_msgSend(a1, "_canTransitionToStartingFromState:", a3);
      break;
    case 3:
      result = objc_msgSend(a1, "_canTransitionToActiveFromState:presentationIdentifier:", a3, a5);
      break;
    case 4:
      result = objc_msgSend(a1, "_canTransitionToStoppingFromState:", a3);
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

+ (BOOL)_canTransitionToOffFromState:(int64_t)a3
{
  return a3 != 3 && a3 != 0;
}

+ (BOOL)_canTransitionToHeatedFromState:(int64_t)a3
{
  return (unint64_t)(a3 - 5) < 0xFFFFFFFFFFFFFFFCLL;
}

+ (BOOL)_canTransitionToStartingFromState:(int64_t)a3
{
  return (unint64_t)(a3 - 5) < 0xFFFFFFFFFFFFFFFDLL;
}

+ (BOOL)_canTransitionToStoppingFromState:(int64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFELL) == 2;
}

+ (BOOL)_canTransitionToActiveFromState:(int64_t)a3 presentationIdentifier:(int64_t)a4
{
  if ((unint64_t)a3 < 2)
    return 0;
  if (a3 == 4)
    return a4 == 4;
  return a3 != 3;
}

- (void)presentationWithPresentationIdentifierBeganStarting:(int64_t)a3
{
  -[SASPresentationManager _transitionPresentationWithPresentationIdentifier:toState:](self, "_transitionPresentationWithPresentationIdentifier:toState:", a3, 2);
}

- (void)presentationWithPresentationIdentifierBeganStopping:(int64_t)a3
{
  -[SASPresentationManager _transitionPresentationWithPresentationIdentifier:toState:](self, "_transitionPresentationWithPresentationIdentifier:toState:", a3, 4);
}

- (void)presentationWithPresentationIdentifierBecameActive:(int64_t)a3
{
  -[SASPresentationManager _transitionPresentationWithPresentationIdentifier:toState:](self, "_transitionPresentationWithPresentationIdentifier:toState:", a3, 3);
}

- (void)presentationWithPresentationIdentifierBecameOff:(int64_t)a3
{
  -[SASPresentationManager _transitionPresentationWithPresentationIdentifier:toState:](self, "_transitionPresentationWithPresentationIdentifier:toState:", a3, 0);
}

- (void)_transitionPresentationWithPresentationIdentifier:(int64_t)a3 toState:(int64_t)a4
{
  void *v7;
  os_log_t *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  BOOL v16;
  os_log_t v17;
  _BOOL4 v18;
  NSObject *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  id WeakRetained;
  void *v26;
  SASPresentationManager *v27;
  uint64_t v28;
  NSObject *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  int v33;
  const char *v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithSiriPresentationIdentifier:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (os_log_t *)MEMORY[0x1E0CFE6A0];
  v9 = (void *)*MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)MEMORY[0x1E0CB3978];
    v11 = v9;
    objc_msgSend(v10, "currentThread");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 136315394;
    v34 = "-[SASPresentationManager _transitionPresentationWithPresentationIdentifier:toState:]";
    v35 = 2048;
    v36 = objc_msgSend(v12, "qualityOfService");
    _os_log_impl(&dword_1D132F000, v11, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock about to lock with qos: %zd", (uint8_t *)&v33, 0x16u);

  }
  os_unfair_lock_lock(&presentationsLock);
  v13 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
  {
    v33 = 136315138;
    v34 = "-[SASPresentationManager _transitionPresentationWithPresentationIdentifier:toState:]";
    _os_log_impl(&dword_1D132F000, v13, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock successfully locked", (uint8_t *)&v33, 0xCu);
  }
  -[NSMutableDictionary objectForKey:](self->_presentations, "objectForKey:", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (!v14)
  {
    v23 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
    {
      v33 = 136315394;
      v34 = "-[SASPresentationManager _transitionPresentationWithPresentationIdentifier:toState:]";
      v35 = 2112;
      v36 = (uint64_t)v7;
      _os_log_impl(&dword_1D132F000, v23, OS_LOG_TYPE_DEFAULT, "%s #activation presentation with identifier %@ isn't registered", (uint8_t *)&v33, 0x16u);
    }
    os_unfair_lock_unlock(&presentationsLock);
    v24 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
    {
      v33 = 136315138;
      v34 = "-[SASPresentationManager _transitionPresentationWithPresentationIdentifier:toState:]";
      _os_log_impl(&dword_1D132F000, v24, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock unlocked", (uint8_t *)&v33, 0xCu);
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_presentationManagerDelegate);
    v26 = WeakRetained;
    v27 = self;
    v28 = 1;
    goto LABEL_26;
  }
  v16 = +[SASPresentationManager _canTransitionFromState:toState:presentationIdentifier:](SASPresentationManager, "_canTransitionFromState:toState:presentationIdentifier:", objc_msgSend(v14, "requestState"), a4, a3);
  v17 = *v8;
  v18 = os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT);
  if (!v16)
  {
    if (v18)
    {
      v29 = v17;
      SASRequestStateGetName(a4);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      SASRequestStateGetName(objc_msgSend(v15, "requestState"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 136315906;
      v34 = "-[SASPresentationManager _transitionPresentationWithPresentationIdentifier:toState:]";
      v35 = 2112;
      v36 = (uint64_t)v7;
      v37 = 2112;
      v38 = v30;
      v39 = 2112;
      v40 = v31;
      _os_log_impl(&dword_1D132F000, v29, OS_LOG_TYPE_DEFAULT, "%s #activation presentation with identifier %@ can't transition to state: %@ from state: %@", (uint8_t *)&v33, 0x2Au);

    }
    os_unfair_lock_unlock(&presentationsLock);
    v32 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
    {
      v33 = 136315138;
      v34 = "-[SASPresentationManager _transitionPresentationWithPresentationIdentifier:toState:]";
      _os_log_impl(&dword_1D132F000, v32, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock unlocked", (uint8_t *)&v33, 0xCu);
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_presentationManagerDelegate);
    v26 = WeakRetained;
    v27 = self;
    v28 = 0;
LABEL_26:
    objc_msgSend(WeakRetained, "presentationManager:didEncounterError:", v27, v28);

    goto LABEL_27;
  }
  if (v18)
  {
    v19 = v17;
    SASRequestStateGetName(objc_msgSend(v15, "requestState"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    SASRequestStateGetName(a4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 136315906;
    v34 = "-[SASPresentationManager _transitionPresentationWithPresentationIdentifier:toState:]";
    v35 = 2112;
    v36 = (uint64_t)v7;
    v37 = 2112;
    v38 = v20;
    v39 = 2112;
    v40 = v21;
    _os_log_impl(&dword_1D132F000, v19, OS_LOG_TYPE_DEFAULT, "%s #activation %@: transitioning from %@ to %@", (uint8_t *)&v33, 0x2Au);

  }
  objc_msgSend(v15, "setRequestState:", a4);
  if (a4 == 3)
    objc_msgSend(v15, "flushEnqueuedButtonEventCompletions");
  os_unfair_lock_unlock(&presentationsLock);
  v22 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
  {
    v33 = 136315138;
    v34 = "-[SASPresentationManager _transitionPresentationWithPresentationIdentifier:toState:]";
    _os_log_impl(&dword_1D132F000, v22, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock unlocked", (uint8_t *)&v33, 0xCu);
  }
  -[SASPresentationManager _requestStateDidChange](self, "_requestStateDidChange");
  if (a4)
  {
    if (a4 == 2)
      -[SASPresentationManager _setupPingTimerForPresentationIdentifier:](self, "_setupPingTimerForPresentationIdentifier:", a3);
  }
  else
  {
    -[SASPresentationManager _teardownPingTimerForPresentationIdentifier:](self, "_teardownPingTimerForPresentationIdentifier:", a3);
  }
LABEL_27:

}

- (int64_t)nextPresentationToActivate
{
  os_log_t *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  int64_t v9;
  NSObject *v10;
  int v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (os_log_t *)MEMORY[0x1E0CFE6A0];
  v4 = (void *)*MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)MEMORY[0x1E0CB3978];
    v6 = v4;
    objc_msgSend(v5, "currentThread");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 136315394;
    v13 = "-[SASPresentationManager nextPresentationToActivate]";
    v14 = 2048;
    v15 = objc_msgSend(v7, "qualityOfService");
    _os_log_impl(&dword_1D132F000, v6, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock about to lock with qos: %zd", (uint8_t *)&v12, 0x16u);

  }
  os_unfair_lock_lock(&presentationsLock);
  v8 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 136315138;
    v13 = "-[SASPresentationManager nextPresentationToActivate]";
    _os_log_impl(&dword_1D132F000, v8, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock successfully locked", (uint8_t *)&v12, 0xCu);
  }
  v9 = -[SASPresentationManager _presentationsLock_nextPresentationToActivate](self, "_presentationsLock_nextPresentationToActivate");
  os_unfair_lock_unlock(&presentationsLock);
  v10 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 136315138;
    v13 = "-[SASPresentationManager nextPresentationToActivate]";
    _os_log_impl(&dword_1D132F000, v10, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock unlocked", (uint8_t *)&v12, 0xCu);
  }
  return v9;
}

- (int64_t)_presentationsLock_nextPresentationToActivate
{
  void *v2;
  int64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[NSMutableDictionary allKeys](self->_presentations, "allKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[SASPresentationDecision activationPresentationForPresentationIdentifiers:](SASPresentationDecision, "activationPresentationForPresentationIdentifiers:", v2);

  v4 = (void *)*MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    v6 = v4;
    objc_msgSend(v5, "stringWithSiriPresentationIdentifier:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 136315394;
    v10 = "-[SASPresentationManager _presentationsLock_nextPresentationToActivate]";
    v11 = 2112;
    v12 = v7;
    _os_log_impl(&dword_1D132F000, v6, OS_LOG_TYPE_DEFAULT, "%s #activation identifier: %@", (uint8_t *)&v9, 0x16u);

  }
  return v3;
}

- (void)_presentationsLock_nextPresentationToActivateDidChange:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[NSMutableDictionary allKeys](self->_presentations, "allKeys", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v10, "siriPresentationIdentifier") != 3)
        {
          -[NSMutableDictionary objectForKey:](self->_presentations, "objectForKey:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[SASPresentationManager _informPresentationOfPresentationWithPriority:nextPresentationToActivate:](self, "_informPresentationOfPresentationWithPriority:nextPresentationToActivate:", v11, a3);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

- (void)_informPresentationOfPresentationWithPriority:(id)a3 nextPresentationToActivate:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  SiriPresentationIdentifierTransport *v9;

  v5 = a3;
  v9 = -[SiriPresentationIdentifierTransport initWithSiriPresentationIdentifier:]([SiriPresentationIdentifierTransport alloc], "initWithSiriPresentationIdentifier:", a4);
  objc_msgSend(v5, "presentationServer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "remoteTarget");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "presentationActivationPriorityDidChange:", v9);

}

- (void)presentationRequestedWithPresentationIdentifier:(int64_t)a3 presentationOptions:(id)a4 requestOptions:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  id v18;

  v8 = a4;
  v9 = a5;
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __109__SASPresentationManager_presentationRequestedWithPresentationIdentifier_presentationOptions_requestOptions___block_invoke;
  v16 = &unk_1E91FC658;
  v17 = v8;
  v18 = v9;
  v10 = v9;
  v11 = v8;
  v12 = _Block_copy(&v13);
  -[SASPresentationManager _sendBlock:toPresentationWithPresentationIdentifier:](self, "_sendBlock:toPresentationWithPresentationIdentifier:", v12, a3, v13, v14, v15, v16);

}

void __109__SASPresentationManager_presentationRequestedWithPresentationIdentifier_presentationOptions_requestOptions___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  objc_msgSend(a2, "connection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteTarget");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentationRequestedWithPresentationOptions:requestOptions:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)presentationWithPresentationIdentifier:(int64_t)a3 activationDeterminedShouldDeferWake:(BOOL)a4
{
  void *v6;
  _QWORD aBlock[4];
  BOOL v8;

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __101__SASPresentationManager_presentationWithPresentationIdentifier_activationDeterminedShouldDeferWake___block_invoke;
  aBlock[3] = &__block_descriptor_33_e31_v16__0__SASPresentationServer_8l;
  v8 = a4;
  v6 = _Block_copy(aBlock);
  -[SASPresentationManager _sendBlock:toPresentationWithPresentationIdentifier:](self, "_sendBlock:toPresentationWithPresentationIdentifier:", v6, a3);

}

void __101__SASPresentationManager_presentationWithPresentationIdentifier_activationDeterminedShouldDeferWake___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a2, "connection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteTarget");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activationDeterminedShouldDeferWake:", v4);

}

- (void)presentationWithPresentationIdentifierWakeScreenAfterActivation:(int64_t)a3 reason:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD aBlock[4];
  id v10;

  v6 = a4;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __97__SASPresentationManager_presentationWithPresentationIdentifierWakeScreenAfterActivation_reason___block_invoke;
  aBlock[3] = &unk_1E91FC5F0;
  v10 = v6;
  v7 = v6;
  v8 = _Block_copy(aBlock);
  -[SASPresentationManager _sendBlock:toPresentationWithPresentationIdentifier:](self, "_sendBlock:toPresentationWithPresentationIdentifier:", v8, a3);

}

void __97__SASPresentationManager_presentationWithPresentationIdentifierWakeScreenAfterActivation_reason___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  objc_msgSend(a2, "connection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteTarget");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "wakeScreenAfterActivationWithReason:", *(_QWORD *)(a1 + 32));

}

- (void)_setupPingTimerForPresentationIdentifier:(int64_t)a3
{
  void *v5;
  os_log_t *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  id WeakRetained;
  os_log_t v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  _QWORD v26[4];
  id v27;
  id v28[2];
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithSiriPresentationIdentifier:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (os_log_t *)MEMORY[0x1E0CFE6A0];
  v7 = (void *)*MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)MEMORY[0x1E0CB3978];
    v9 = v7;
    objc_msgSend(v8, "currentThread");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v30 = "-[SASPresentationManager _setupPingTimerForPresentationIdentifier:]";
    v31 = 2048;
    v32 = objc_msgSend(v10, "qualityOfService");
    _os_log_impl(&dword_1D132F000, v9, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock about to lock with qos: %zd", buf, 0x16u);

  }
  os_unfair_lock_lock(&presentationsLock);
  v11 = *v6;
  if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v30 = "-[SASPresentationManager _setupPingTimerForPresentationIdentifier:]";
    _os_log_impl(&dword_1D132F000, v11, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock successfully locked", buf, 0xCu);
  }
  -[NSMutableDictionary objectForKey:](self->_presentations, "objectForKey:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    if (+[SASPresentationManager _shouldKeepPingingForRequestState:](SASPresentationManager, "_shouldKeepPingingForRequestState:", objc_msgSend(v12, "requestState")))
    {
      objc_initWeak((id *)buf, self);
      v14 = (void *)MEMORY[0x1E0C99E88];
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __67__SASPresentationManager__setupPingTimerForPresentationIdentifier___block_invoke;
      v26[3] = &unk_1E91FC6A0;
      v15 = v13;
      v27 = v15;
      objc_copyWeak(v28, (id *)buf);
      v28[1] = (id)a3;
      objc_msgSend(v14, "timerWithTimeInterval:repeats:block:", 0, v26, 1.0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "pingTimer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "invalidate");

      objc_msgSend(v15, "setPingTimer:", v16);
      objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addTimer:forMode:", v16, *MEMORY[0x1E0C99860]);

      objc_destroyWeak(v28);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      v22 = *v6;
      if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
      {
        v23 = v22;
        SASRequestStateGetName(objc_msgSend(v13, "requestState"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v30 = "-[SASPresentationManager _setupPingTimerForPresentationIdentifier:]";
        v31 = 2112;
        v32 = (uint64_t)v5;
        v33 = 2112;
        v34 = v24;
        _os_log_impl(&dword_1D132F000, v23, OS_LOG_TYPE_DEFAULT, "%s #pingpong not returning ping because presentation with identifier %@ is in request state %@", buf, 0x20u);

      }
    }
    os_unfair_lock_unlock(&presentationsLock);
    v25 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v30 = "-[SASPresentationManager _setupPingTimerForPresentationIdentifier:]";
      _os_log_impl(&dword_1D132F000, v25, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock unlocked", buf, 0xCu);
    }
  }
  else
  {
    v19 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v30 = "-[SASPresentationManager _setupPingTimerForPresentationIdentifier:]";
      v31 = 2112;
      v32 = (uint64_t)v5;
      _os_log_impl(&dword_1D132F000, v19, OS_LOG_TYPE_DEFAULT, "%s #activation presentation with identifier %@ isn't registered", buf, 0x16u);
    }
    os_unfair_lock_unlock(&presentationsLock);
    v20 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v30 = "-[SASPresentationManager _setupPingTimerForPresentationIdentifier:]";
      _os_log_impl(&dword_1D132F000, v20, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock unlocked", buf, 0xCu);
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_presentationManagerDelegate);
    objc_msgSend(WeakRetained, "presentationManager:didEncounterError:", self, 3);

  }
}

void __67__SASPresentationManager__setupPingTimerForPresentationIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id WeakRetained;
  int v15;
  const char *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v2 = (void *)*MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    objc_msgSend(v3, "presentationServer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "presentationServer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "connection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "presentationServer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "connection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "remoteTarget");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 136316162;
    v16 = "-[SASPresentationManager _setupPingTimerForPresentationIdentifier:]_block_invoke";
    v17 = 2112;
    v18 = v3;
    v19 = 2112;
    v20 = v5;
    v21 = 2112;
    v22 = v7;
    v23 = 2112;
    v24 = v10;
    _os_log_impl(&dword_1D132F000, v4, OS_LOG_TYPE_DEFAULT, "%s #pingpong sending ping and waiting for pong - model: %@ | server: %@ | connection: %@ | remoteTarget: %@", (uint8_t *)&v15, 0x34u);

  }
  objc_msgSend(*(id *)(a1 + 32), "presentationServer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "connection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "remoteTarget");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "ping");

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_waitForPongFromPresentationWithPresentationIdentifier:", *(_QWORD *)(a1 + 48));

}

- (void)_waitForPongFromPresentationWithPresentationIdentifier:(int64_t)a3
{
  void *v4;
  os_log_t *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  id WeakRetained;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  id v23;
  id location;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithSiriPresentationIdentifier:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (os_log_t *)MEMORY[0x1E0CFE6A0];
  v6 = (void *)*MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)MEMORY[0x1E0CB3978];
    v8 = v6;
    objc_msgSend(v7, "currentThread");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v26 = "-[SASPresentationManager _waitForPongFromPresentationWithPresentationIdentifier:]";
    v27 = 2048;
    v28 = objc_msgSend(v9, "qualityOfService");
    _os_log_impl(&dword_1D132F000, v8, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock about to lock with qos: %zd", buf, 0x16u);

  }
  os_unfair_lock_lock(&presentationsLock);
  v10 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v26 = "-[SASPresentationManager _waitForPongFromPresentationWithPresentationIdentifier:]";
    _os_log_impl(&dword_1D132F000, v10, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock successfully locked", buf, 0xCu);
  }
  -[NSMutableDictionary objectForKey:](self->_presentations, "objectForKey:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_initWeak(&location, self);
    v12 = (void *)MEMORY[0x1E0C99E88];
    v19 = MEMORY[0x1E0C809B0];
    v20 = 3221225472;
    v21 = __81__SASPresentationManager__waitForPongFromPresentationWithPresentationIdentifier___block_invoke;
    v22 = &unk_1E91FC6C8;
    objc_copyWeak(&v23, &location);
    objc_msgSend(v12, "scheduledTimerWithTimeInterval:repeats:block:", 0, &v19, 2.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "pingTimer", v19, v20, v21, v22);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "invalidate");

    objc_msgSend(v11, "setPingTimer:", v13);
    os_unfair_lock_unlock(&presentationsLock);
    v15 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v26 = "-[SASPresentationManager _waitForPongFromPresentationWithPresentationIdentifier:]";
      _os_log_impl(&dword_1D132F000, v15, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock unlocked", buf, 0xCu);
    }

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }
  else
  {
    v16 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v26 = "-[SASPresentationManager _waitForPongFromPresentationWithPresentationIdentifier:]";
      v27 = 2112;
      v28 = (uint64_t)v4;
      _os_log_impl(&dword_1D132F000, v16, OS_LOG_TYPE_DEFAULT, "%s #activation presentation with identifier %@ isn't registered", buf, 0x16u);
    }
    os_unfair_lock_unlock(&presentationsLock);
    v17 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v26 = "-[SASPresentationManager _waitForPongFromPresentationWithPresentationIdentifier:]";
      _os_log_impl(&dword_1D132F000, v17, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock unlocked", buf, 0xCu);
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_presentationManagerDelegate);
    objc_msgSend(WeakRetained, "presentationManager:didEncounterError:", self, 3);

  }
}

void __81__SASPresentationManager__waitForPongFromPresentationWithPresentationIdentifier___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  NSObject *v2;
  id v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = *MEMORY[0x1E0CFE6A0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_ERROR))
      __81__SASPresentationManager__waitForPongFromPresentationWithPresentationIdentifier___block_invoke_cold_1(v2);
    v3 = objc_loadWeakRetained(WeakRetained + 2);
    objc_msgSend(v3, "presentationManager:didEncounterError:", WeakRetained, 5);

    objc_msgSend(WeakRetained, "_forceAllPresentationsOff");
  }

}

- (void)_teardownPingTimerForPresentationIdentifier:(int64_t)a3
{
  os_log_t *v5;
  NSObject *v6;
  void *v7;
  os_log_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  id WeakRetained;
  int v21;
  const char *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = (os_log_t *)MEMORY[0x1E0CFE6A0];
  v6 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v21 = 136315138;
    v22 = "-[SASPresentationManager _teardownPingTimerForPresentationIdentifier:]";
    _os_log_impl(&dword_1D132F000, v6, OS_LOG_TYPE_DEFAULT, "%s #pingpong", (uint8_t *)&v21, 0xCu);
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithSiriPresentationIdentifier:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)MEMORY[0x1E0CB3978];
    v10 = v8;
    objc_msgSend(v9, "currentThread");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "qualityOfService");
    v21 = 136315394;
    v22 = "-[SASPresentationManager _teardownPingTimerForPresentationIdentifier:]";
    v23 = 2048;
    v24 = v12;
    _os_log_impl(&dword_1D132F000, v10, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock about to lock with qos: %zd", (uint8_t *)&v21, 0x16u);

  }
  os_unfair_lock_lock(&presentationsLock);
  v13 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    v21 = 136315138;
    v22 = "-[SASPresentationManager _teardownPingTimerForPresentationIdentifier:]";
    _os_log_impl(&dword_1D132F000, v13, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock successfully locked", (uint8_t *)&v21, 0xCu);
  }
  -[NSMutableDictionary objectForKey:](self->_presentations, "objectForKey:", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    objc_msgSend(v14, "pingTimer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "invalidate");

    objc_msgSend(v15, "setPingTimer:", 0);
    os_unfair_lock_unlock(&presentationsLock);
    v17 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      v21 = 136315138;
      v22 = "-[SASPresentationManager _teardownPingTimerForPresentationIdentifier:]";
      _os_log_impl(&dword_1D132F000, v17, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock unlocked", (uint8_t *)&v21, 0xCu);
    }
  }
  else
  {
    v18 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      v21 = 136315394;
      v22 = "-[SASPresentationManager _teardownPingTimerForPresentationIdentifier:]";
      v23 = 2112;
      v24 = (uint64_t)v7;
      _os_log_impl(&dword_1D132F000, v18, OS_LOG_TYPE_DEFAULT, "%s #activation presentation with identifier %@ isn't registered", (uint8_t *)&v21, 0x16u);
    }
    os_unfair_lock_unlock(&presentationsLock);
    v19 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      v21 = 136315138;
      v22 = "-[SASPresentationManager _teardownPingTimerForPresentationIdentifier:]";
      _os_log_impl(&dword_1D132F000, v19, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock unlocked", (uint8_t *)&v21, 0xCu);
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_presentationManagerDelegate);
    objc_msgSend(WeakRetained, "presentationManager:didEncounterError:", self, 4);

  }
}

- (void)pongWithPresentationIdentifier:(int64_t)a3
{
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = (void *)*MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    v7 = v5;
    objc_msgSend(v6, "stringWithSiriPresentationIdentifier:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 136315394;
    v10 = "-[SASPresentationManager pongWithPresentationIdentifier:]";
    v11 = 2112;
    v12 = v8;
    _os_log_impl(&dword_1D132F000, v7, OS_LOG_TYPE_DEFAULT, "%s #pingpong received pong with presentation identifier: %@", (uint8_t *)&v9, 0x16u);

  }
  -[SASPresentationManager _setupPingTimerForPresentationIdentifier:](self, "_setupPingTimerForPresentationIdentifier:", a3);
}

- (void)_forceAllPresentationsOff
{
  os_log_t *v3;
  NSObject *v4;
  os_log_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = (os_log_t *)MEMORY[0x1E0CFE6A0];
  v4 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v27 = "-[SASPresentationManager _forceAllPresentationsOff]";
    _os_log_impl(&dword_1D132F000, v4, OS_LOG_TYPE_DEFAULT, "%s #pingpong", buf, 0xCu);
  }
  v5 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)MEMORY[0x1E0CB3978];
    v7 = v5;
    objc_msgSend(v6, "currentThread");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "qualityOfService");
    *(_DWORD *)buf = 136315394;
    v27 = "-[SASPresentationManager _forceAllPresentationsOff]";
    v28 = 2048;
    v29 = v9;
    _os_log_impl(&dword_1D132F000, v7, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock about to lock with qos: %zd", buf, 0x16u);

  }
  os_unfair_lock_lock(&presentationsLock);
  v10 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v27 = "-[SASPresentationManager _forceAllPresentationsOff]";
    _os_log_impl(&dword_1D132F000, v10, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock successfully locked", buf, 0xCu);
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[NSMutableDictionary allValues](self->_presentations, "allValues", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v22 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if (objc_msgSend(v16, "requestState") == 1)
        {
          objc_msgSend(v16, "presentationServer");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "connection");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "remoteTarget");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "cancelPreheat");

        }
        objc_msgSend(v16, "setRequestState:", 0);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v13);
  }

  os_unfair_lock_unlock(&presentationsLock);
  v20 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v27 = "-[SASPresentationManager _forceAllPresentationsOff]";
    _os_log_impl(&dword_1D132F000, v20, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock unlocked", buf, 0xCu);
  }
  -[SASPresentationManager _requestStateDidChange](self, "_requestStateDidChange");
}

+ (BOOL)_shouldKeepPingingForRequestState:(int64_t)a3
{
  return (unint64_t)(a3 - 2) < 3;
}

- (void)presentationDidUpdateState:(id)a3
{
  id v4;
  os_log_t *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  NSMutableDictionary *presentations;
  void *v12;
  void *v13;
  void *v14;
  SASPresentationManager *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  char v23;
  void *v24;
  NSObject *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t v31[128];
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (os_log_t *)MEMORY[0x1E0CFE6A0];
  v6 = (void *)*MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)MEMORY[0x1E0CB3978];
    v8 = v6;
    objc_msgSend(v7, "currentThread");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v33 = "-[SASPresentationManager presentationDidUpdateState:]";
    v34 = 2048;
    v35 = objc_msgSend(v9, "qualityOfService");
    _os_log_impl(&dword_1D132F000, v8, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock about to lock with qos: %zd", buf, 0x16u);

  }
  os_unfair_lock_lock(&presentationsLock);
  v10 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v33 = "-[SASPresentationManager presentationDidUpdateState:]";
    _os_log_impl(&dword_1D132F000, v10, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock successfully locked", buf, 0xCu);
  }
  presentations = self->_presentations;
  objc_msgSend(v4, "presentationIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](presentations, "objectForKey:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = v13;
  objc_msgSend(v13, "setPresentationState:", v4);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v15 = self;
  -[NSMutableDictionary allKeys](self->_presentations, "allKeys");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v28;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v28 != v19)
          objc_enumerationMutation(v16);
        v21 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v20);
        objc_msgSend(v4, "presentationIdentifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "isEqualToString:", v21);

        if ((v23 & 1) == 0)
          objc_msgSend(v14, "addObject:", v21);
        ++v20;
      }
      while (v18 != v20);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v18);
  }

  objc_msgSend(v4, "presentationIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[SASPresentationManager _presentationsLock_broadcastPresentationStateForIdentifier:presentationState:presentationIdentifiersToInform:](v15, "_presentationsLock_broadcastPresentationStateForIdentifier:presentationState:presentationIdentifiersToInform:", v24, v4, v14);

  os_unfair_lock_unlock(&presentationsLock);
  v25 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v33 = "-[SASPresentationManager presentationDidUpdateState:]";
    _os_log_impl(&dword_1D132F000, v25, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy presentationsLock unlocked", buf, 0xCu);
  }

}

- (void)_presentationsLock_broadcastPresentationStateForIdentifier:(id)a3 presentationState:(id)a4 presentationIdentifiersToInform:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  SiriPresentationIdentifierTransport *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = a5;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
  if (v9)
  {
    v11 = v9;
    v12 = *(_QWORD *)v25;
    *(_QWORD *)&v10 = 136315906;
    v21 = v10;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v25 != v12)
          objc_enumerationMutation(obj);
        v14 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v13);
        v15 = *MEMORY[0x1E0CFE6A0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v21;
          v29 = "-[SASPresentationManager _presentationsLock_broadcastPresentationStateForIdentifier:presentationState:pr"
                "esentationIdentifiersToInform:]";
          v30 = 2112;
          v31 = v14;
          v32 = 2112;
          v33 = v7;
          v34 = 2112;
          v35 = v8;
          _os_log_impl(&dword_1D132F000, v15, OS_LOG_TYPE_DEFAULT, "%s Sending <%@>'s state --> <%@>: %@", buf, 0x2Au);
        }
        -[NSMutableDictionary objectForKey:](self->_presentations, "objectForKey:", v14, v21);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = -[SiriPresentationIdentifierTransport initWithSiriPresentationIdentifier:]([SiriPresentationIdentifierTransport alloc], "initWithSiriPresentationIdentifier:", objc_msgSend(v7, "siriPresentationIdentifier"));
        objc_msgSend(v16, "presentationServer");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "connection");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "remoteTarget");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "presentationWithIdentifier:didUpdatePresentationState:", v17, v8);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
    }
    while (v11);
  }

}

- (NSMutableDictionary)presentations
{
  return self->_presentations;
}

- (void)setPresentations:(id)a3
{
  objc_storeStrong((id *)&self->_presentations, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentations, 0);
  objc_destroyWeak((id *)&self->_presentationManagerDelegate);
  objc_storeStrong((id *)&self->lastReportedState, 0);
}

- (void)registerSiriPresentation:withIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_1D132F000, v0, v1, "%s #activation Registration of '%@' when it is already connected. Removing.", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)unregisterSiriPresentationWithIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_1D132F000, v0, v1, "%s #activation Unregister request of '%@' when it is not connected.", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)_sendBlock:toPresentationWithPresentationIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_1D132F000, v0, v1, "%s #activation presentation with identifier %@ isn't registered", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __81__SASPresentationManager__waitForPongFromPresentationWithPresentationIdentifier___block_invoke_cold_1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "-[SASPresentationManager _waitForPongFromPresentationWithPresentationIdentifier:]_block_invoke";
  _os_log_error_impl(&dword_1D132F000, log, OS_LOG_TYPE_ERROR, "%s #pingpong timed out waiting for pong", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_2();
}

@end
