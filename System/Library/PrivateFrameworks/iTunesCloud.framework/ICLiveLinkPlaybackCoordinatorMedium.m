@implementation ICLiveLinkPlaybackCoordinatorMedium

- (ICLiveLinkPlaybackCoordinatorMedium)initWithLiveLink:(id)a3
{
  id v4;
  ICLiveLinkPlaybackCoordinatorMedium *v5;
  ICLiveLinkPlaybackCoordinatorMedium *v6;
  void *v7;
  uint64_t v8;
  NSUUID *localParticipantUUID;
  uint64_t v10;
  NSUUID *v11;
  NSObject *v12;
  NSUUID *v13;
  NSMutableArray *v14;
  NSMutableArray *fetchServerStateCompletions;
  objc_super v17;
  uint8_t buf[4];
  ICLiveLinkPlaybackCoordinatorMedium *v19;
  __int16 v20;
  NSUUID *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ICLiveLinkPlaybackCoordinatorMedium;
  v5 = -[ICLiveLinkPlaybackCoordinatorMedium init](&v17, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_liveLink, v4);
    objc_msgSend(v4, "identity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v8 = objc_claimAutoreleasedReturnValue();
    localParticipantUUID = v6->_localParticipantUUID;
    v6->_localParticipantUUID = (NSUUID *)v8;

    if (!v6->_localParticipantUUID)
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = v6->_localParticipantUUID;
      v6->_localParticipantUUID = (NSUUID *)v10;

      v12 = os_log_create("com.apple.amp.iTunesCloud", "LiveLinkMedium");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = v6->_localParticipantUUID;
        *(_DWORD *)buf = 134218242;
        v19 = v6;
        v20 = 2114;
        v21 = v13;
        _os_log_impl(&dword_1A03E3000, v12, OS_LOG_TYPE_ERROR, "MLLM %p: playback sync initialized without a server defined local participant UUID: locallyGeneratedUUID=%{public}@", buf, 0x16u);
      }

    }
    v6->_fetchServerStateLock._os_unfair_lock_opaque = 0;
    v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    fetchServerStateCompletions = v6->_fetchServerStateCompletions;
    v6->_fetchServerStateCompletions = v14;

  }
  return v6;
}

- (BOOL)isCoordinatorSuspended
{
  return 0;
}

- (void)handlePlaybackSyncPayload:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  const char *v9;
  int v10;
  ICLiveLinkPlaybackCoordinatorMedium *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ICLiveLinkPlaybackSyncParticipantStateKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ICLiveLinkTransportControlStateKey"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (!v5)
  {
    if (v6)
    {
      if (_NSIsNSDictionary())
      {
        -[ICLiveLinkPlaybackCoordinatorMedium handleNewTransportControlStateDictionary:](self, "handleNewTransportControlStateDictionary:", v7);
        goto LABEL_15;
      }
      v8 = os_log_create("com.apple.amp.iTunesCloud", "LiveLinkMedium");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v10 = 134218243;
        v11 = self;
        v12 = 2113;
        v13 = v7;
        v9 = "MLLM %p: ignoring transport control state of unknown form %{private}@";
        goto LABEL_13;
      }
    }
    else
    {
      v8 = os_log_create("com.apple.amp.iTunesCloud", "LiveLinkMedium");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v10 = 134218243;
        v11 = self;
        v12 = 2113;
        v13 = v4;
        v9 = "MLLM %p: no state found in sync payload %{private}@";
        goto LABEL_13;
      }
    }
LABEL_14:

    goto LABEL_15;
  }
  if (!_NSIsNSDictionary())
  {
    v8 = os_log_create("com.apple.amp.iTunesCloud", "LiveLinkMedium");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = 134218243;
      v11 = self;
      v12 = 2113;
      v13 = v5;
      v9 = "MLLM %p: ignoring participant state of unknown form %{private}@";
LABEL_13:
      _os_log_impl(&dword_1A03E3000, v8, OS_LOG_TYPE_ERROR, v9, (uint8_t *)&v10, 0x16u);
      goto LABEL_14;
    }
    goto LABEL_14;
  }
  -[ICLiveLinkPlaybackCoordinatorMedium handleNewParticipantStateDictionary:](self, "handleNewParticipantStateDictionary:", v5);
LABEL_15:

}

- (void)removeParticipant:(id)a3
{
  uint64_t v5;
  objc_class *v6;
  void *v7;
  void *v8;
  id v9;

  v5 = +[ICLiveLinkPlaybackCoordinatorMedium instanceMethodForSelector:](ICLiveLinkPlaybackCoordinatorMedium, "instanceMethodForSelector:", a2);
  if (v5 == objc_msgSend((id)objc_opt_class(), "instanceMethodForSelector:", a2))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ICLiveLinkPlaybackCoordinatorMedium.m"), 86, CFSTR("Subclass %@ must implement -%@ defined in %@."), v7, v8, CFSTR("ICLiveLinkPlaybackCoordinatorMedium"));

  }
}

- (void)handleNewParticipantStateDictionary:(id)a3
{
  uint64_t v5;
  objc_class *v6;
  void *v7;
  void *v8;
  id v9;

  v5 = +[ICLiveLinkPlaybackCoordinatorMedium instanceMethodForSelector:](ICLiveLinkPlaybackCoordinatorMedium, "instanceMethodForSelector:", a2);
  if (v5 == objc_msgSend((id)objc_opt_class(), "instanceMethodForSelector:", a2))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ICLiveLinkPlaybackCoordinatorMedium.m"), 90, CFSTR("Subclass %@ must implement -%@ defined in %@."), v7, v8, CFSTR("ICLiveLinkPlaybackCoordinatorMedium"));

  }
}

- (void)handleNewTransportControlStateDictionary:(id)a3
{
  uint64_t v5;
  objc_class *v6;
  void *v7;
  void *v8;
  id v9;

  v5 = +[ICLiveLinkPlaybackCoordinatorMedium instanceMethodForSelector:](ICLiveLinkPlaybackCoordinatorMedium, "instanceMethodForSelector:", a2);
  if (v5 == objc_msgSend((id)objc_opt_class(), "instanceMethodForSelector:", a2))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ICLiveLinkPlaybackCoordinatorMedium.m"), 94, CFSTR("Subclass %@ must implement -%@ defined in %@."), v7, v8, CFSTR("ICLiveLinkPlaybackCoordinatorMedium"));

  }
}

- (void)synchronizePlaybackStateForReason:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  os_unfair_lock_lock(&self->_fetchServerStateLock);
  ++self->_fetchServerStateInProgressCount;
  os_unfair_lock_unlock(&self->_fetchServerStateLock);
  -[ICLiveLinkPlaybackCoordinatorMedium liveLink](self, "liveLink");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __73__ICLiveLinkPlaybackCoordinatorMedium_synchronizePlaybackStateForReason___block_invoke;
  v7[3] = &unk_1E438B2C8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "fetchPlaybackSyncStateWithCompletion:", v7);

}

- (void)clearCoordinationMediumDelegate
{
  uint64_t v4;
  objc_class *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = +[ICLiveLinkPlaybackCoordinatorMedium instanceMethodForSelector:](ICLiveLinkPlaybackCoordinatorMedium, "instanceMethodForSelector:", a2);
  if (v4 == objc_msgSend((id)objc_opt_class(), "instanceMethodForSelector:", a2))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ICLiveLinkPlaybackCoordinatorMedium.m"), 176, CFSTR("Subclass %@ must implement -%@ defined in %@."), v6, v7, CFSTR("ICLiveLinkPlaybackCoordinatorMedium"));

  }
}

- (void)_broadcastLocalParticipantStateDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ICLiveLinkPlaybackCoordinatorMedium liveLink](self, "liveLink");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = CFSTR("ICLiveLinkPlaybackSyncParticipantStateKey");
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "sendPlaybackSyncPayload:", v6);
}

- (void)_broadcastTransportControlStateDictionary:(id)a3 forItemWithIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  id v12;
  uint8_t buf[4];
  ICLiveLinkPlaybackCoordinatorMedium *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = os_log_create("com.apple.amp.iTunesCloud", "LiveLinkMedium");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    v14 = self;
    v15 = 2114;
    v16 = v7;
    v17 = 2114;
    v18 = v6;
    _os_log_impl(&dword_1A03E3000, v8, OS_LOG_TYPE_DEFAULT, "MLLM %p: broadcastTransportControlStateDictionary [AVPlaybackCoordination] itemID=%{public}@ tcs=%{public}@", buf, 0x20u);
  }

  -[ICLiveLinkPlaybackCoordinatorMedium liveLink](self, "liveLink");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = CFSTR("ICLiveLinkTransportControlStateKey");
  v12 = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sendPlaybackSyncPayload:", v10);

}

- (void)_reloadTransportControlStateForItemWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSMutableArray *fetchServerStateCompletions;
  void *v11;
  NSObject *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  uint8_t buf[4];
  ICLiveLinkPlaybackCoordinatorMedium *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[ICLiveLinkPlaybackCoordinatorMedium liveLink](self, "liveLink");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_fetchServerStateLock);
  if (self->_fetchServerStateInProgressCount && (objc_msgSend(v8, "isExpectingToJoinWithStartItem") & 1) == 0)
  {
    fetchServerStateCompletions = self->_fetchServerStateCompletions;
    v11 = (void *)MEMORY[0x1A1AFA8D0](v7);
    -[NSMutableArray addObject:](fetchServerStateCompletions, "addObject:", v11);

    os_unfair_lock_unlock(&self->_fetchServerStateLock);
    v12 = os_log_create("com.apple.amp.iTunesCloud", "LiveLinkMedium");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v17 = self;
      _os_log_impl(&dword_1A03E3000, v12, OS_LOG_TYPE_DEFAULT, "MLLM %p: reloadTransportControlStateForItemWithIdentifier enqueuing completion handler [fetch server state in progress]", buf, 0xCu);
    }

  }
  else
  {
    os_unfair_lock_unlock(&self->_fetchServerStateLock);
    v9 = os_log_create("com.apple.amp.iTunesCloud", "LiveLinkMedium");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v17 = self;
      v18 = 2114;
      v19 = v6;
      _os_log_impl(&dword_1A03E3000, v9, OS_LOG_TYPE_DEFAULT, "MLLM %p: reloadTransportControlStateForItemWithIdentifier calling fetching item state [coordinator requested] itemID=%{public}@", buf, 0x16u);
    }

    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __107__ICLiveLinkPlaybackCoordinatorMedium__reloadTransportControlStateForItemWithIdentifier_completionHandler___block_invoke;
    v13[3] = &unk_1E438B2F0;
    v13[4] = self;
    v14 = v6;
    v15 = v7;
    objc_msgSend(v8, "fetchPlaybackSyncStateForMediumWithCompletion:", v13);

  }
}

- (ICLiveLink)liveLink
{
  return (ICLiveLink *)objc_loadWeakRetained((id *)&self->_liveLink);
}

- (NSUUID)localParticipantUUID
{
  return self->_localParticipantUUID;
}

- (os_unfair_lock_s)fetchServerStateLock
{
  return self->_fetchServerStateLock;
}

- (int64_t)fetchServerStateInProgressCount
{
  return self->_fetchServerStateInProgressCount;
}

- (NSMutableArray)fetchServerStateCompletions
{
  return self->_fetchServerStateCompletions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchServerStateCompletions, 0);
  objc_storeStrong((id *)&self->_localParticipantUUID, 0);
  objc_destroyWeak((id *)&self->_liveLink);
}

void __107__ICLiveLinkPlaybackCoordinatorMedium__reloadTransportControlStateForItemWithIdentifier_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  int v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;
  __int16 v37;
  void *v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    v6 = os_log_create("com.apple.amp.iTunesCloud", "LiveLinkMedium");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134218242;
      v32 = v7;
      v33 = 2114;
      v34 = v5;
      _os_log_impl(&dword_1A03E3000, v6, OS_LOG_TYPE_ERROR, "MLLM %p: reloadTransportControlStateForItemWithIdentifier [fetch request failed] error=%{public}@", buf, 0x16u);
    }
  }
  else
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    if (a2)
      v8 = *(void **)(a2 + 32);
    else
      v8 = 0;
    v6 = v8;
    v9 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v28;
      do
      {
        v12 = v6;
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v28 != v11)
            objc_enumerationMutation(v12);
          v14 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          objc_msgSend(v14, "dataUsingEncoding:", 4);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = 0;
          objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v15, 0, &v26);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v26;
          if (v17)
          {
            v18 = os_log_create("com.apple.amp.iTunesCloud", "LiveLinkMedium");
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              v19 = *(_QWORD *)(a1 + 32);
              v20 = *(void **)(a1 + 40);
              *(_DWORD *)buf = 134218754;
              v32 = v19;
              v33 = 2114;
              v34 = v20;
              v35 = 2114;
              v36 = v17;
              v37 = 2114;
              v38 = v14;
              _os_log_impl(&dword_1A03E3000, v18, OS_LOG_TYPE_ERROR, "MLLM %p: reloadTransportControlStateForItemWithIdentifier [invalid JSON] itemID=%{public}@ error=%{public}@ transportControlStateString=%{public}@", buf, 0x2Au);
            }

          }
          else
          {
            objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("Identifier"));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v21, "isEqual:", *(_QWORD *)(a1 + 40));

            if (v22)
            {
              v23 = os_log_create("com.apple.amp.iTunesCloud", "LiveLinkMedium");
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
              {
                v24 = *(_QWORD *)(a1 + 32);
                v25 = *(void **)(a1 + 40);
                *(_DWORD *)buf = 134218498;
                v32 = v24;
                v33 = 2114;
                v34 = v25;
                v35 = 2114;
                v36 = v16;
                _os_log_impl(&dword_1A03E3000, v23, OS_LOG_TYPE_DEFAULT, "MLLM %p: reloadTransportControlStateForItemWithIdentifier [importing] itemID=%{public}@ transportControlState=%{public}@", buf, 0x20u);
              }

              objc_msgSend(*(id *)(a1 + 32), "handleNewTransportControlStateDictionary:", v16);
            }
          }

        }
        v6 = v12;
        v10 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
      }
      while (v10);
      v5 = 0;
    }
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __73__ICLiveLinkPlaybackCoordinatorMedium_synchronizePlaybackStateForReason___block_invoke(uint64_t a1, void *a2, void *a3)
{
  _QWORD *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void (**v11)(_QWORD);
  NSObject *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  id v29;
  id v30;
  os_log_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  NSObject *v40;
  uint64_t v41;
  void *v42;
  id v43;
  id v44;
  void *v45;
  uint64_t v46;
  void *v47;
  id v48;
  void *v49;
  NSObject *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  NSObject *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void (**v60)(_QWORD);
  id v61;
  char v62;
  uint64_t v63;
  id *v64;
  id obj;
  os_log_t obja;
  id v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  id v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _QWORD v77[4];
  id v78;
  uint64_t v79;
  uint8_t v80[128];
  uint8_t buf[4];
  uint64_t v82;
  __int16 v83;
  id v84;
  __int16 v85;
  id v86;
  __int16 v87;
  void *v88;
  _BYTE v89[128];
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  --*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
  v7 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "copy");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeAllObjects");
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  v77[0] = MEMORY[0x1E0C809B0];
  v77[1] = 3221225472;
  v77[2] = __73__ICLiveLinkPlaybackCoordinatorMedium_synchronizePlaybackStateForReason___block_invoke_2;
  v77[3] = &unk_1E4391110;
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 32);
  v78 = v8;
  v79 = v9;
  v10 = MEMORY[0x1A1AFA8D0](v77);
  v11 = (void (**)(_QWORD))v10;
  v64 = (id *)v5;
  if (v6)
  {
    v12 = os_log_create("com.apple.amp.iTunesCloud", "LiveLinkMedium");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134218242;
      v82 = v13;
      v83 = 2114;
      v84 = v6;
      _os_log_impl(&dword_1A03E3000, v12, OS_LOG_TYPE_ERROR, "MLLM %p: _loadInitialPlaybackSyncData [request failed] error=%{public}@", buf, 0x16u);
    }

    v11[2](v11);
    goto LABEL_57;
  }
  v76 = 0u;
  v74 = 0u;
  v75 = 0u;
  v73 = 0u;
  v61 = v8;
  v60 = (void (**)(_QWORD))v10;
  if (v5)
    v14 = (void *)v5[3];
  else
    v14 = 0;
  obj = v14;
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v89, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v74;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v74 != v17)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * i);
        objc_msgSend(v19, "dataUsingEncoding:", 4);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v72 = 0;
        objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v20, 0, &v72);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v72;
        v23 = os_log_create("com.apple.amp.iTunesCloud", "LiveLinkMedium");
        v24 = v23;
        if (v22)
        {
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            v25 = *(_QWORD *)(a1 + 32);
            v26 = *(void **)(a1 + 40);
            *(_DWORD *)buf = 134218754;
            v82 = v25;
            v83 = 2114;
            v84 = v26;
            v85 = 2114;
            v86 = v22;
            v87 = 2114;
            v88 = v19;
            _os_log_impl(&dword_1A03E3000, v24, OS_LOG_TYPE_ERROR, "MLLM %p: synchronizePlaybackState [invalid JSON] reason=%{public}@ error=%{public}@ participantStateString=%{public}@", buf, 0x2Au);
          }

        }
        else
        {
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            v27 = *(_QWORD *)(a1 + 32);
            v28 = *(void **)(a1 + 40);
            *(_DWORD *)buf = 134218498;
            v82 = v27;
            v83 = 2114;
            v84 = v28;
            v85 = 2114;
            v86 = v21;
            _os_log_impl(&dword_1A03E3000, v24, OS_LOG_TYPE_DEFAULT, "MLLM %p: synchronizePlaybackState [importing] reason=%{public}@ participantState=%{public}@", buf, 0x20u);
          }

          objc_msgSend(*(id *)(a1 + 32), "handleNewParticipantStateDictionary:", v21);
        }

      }
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v89, 16);
    }
    while (v16);
  }

  if (v64)
  {
    v29 = v64[1];
    v68 = 0u;
    v69 = 0u;
    v70 = 0u;
    v71 = 0u;
    v30 = v64[4];
  }
  else
  {
    v29 = 0;
    v30 = 0;
    v68 = 0u;
    v69 = 0u;
    v70 = 0u;
    v71 = 0u;
  }
  v31 = (os_log_t)v30;
  v32 = -[NSObject countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v68, v80, 16);
  if (v32)
  {
    v33 = v32;
    v63 = 0;
    v62 = 0;
    v34 = *(_QWORD *)v69;
    obja = v31;
    do
    {
      v35 = 0;
      do
      {
        if (*(_QWORD *)v69 != v34)
          objc_enumerationMutation(obja);
        v36 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * v35);
        objc_msgSend(v36, "dataUsingEncoding:", 4);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v67 = 0;
        objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v37, 0, &v67);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = v67;
        if (v39)
        {
          v40 = os_log_create("com.apple.amp.iTunesCloud", "LiveLinkMedium");
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          {
            v41 = *(_QWORD *)(a1 + 32);
            v42 = *(void **)(a1 + 40);
            *(_DWORD *)buf = 134218754;
            v82 = v41;
            v83 = 2114;
            v84 = v42;
            v85 = 2114;
            v86 = v39;
            v87 = 2114;
            v88 = v36;
            _os_log_impl(&dword_1A03E3000, v40, OS_LOG_TYPE_ERROR, "MLLM %p: synchronizePlaybackState [invalid JSON] reason=%{public}@ error=%{public}@ transportControlStateString=%{public}@", buf, 0x2Au);
          }

        }
        else
        {
          if (v64)
            v43 = v64[1];
          else
            v43 = 0;
          v44 = v43;

          if (!v44)
          {
            objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("LamportTimestamp"));
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v46 = objc_msgSend(v45, "integerValue");

            if (v46 > v63)
            {
              objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("Identifier"));
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v47, "length"))
              {
                v48 = v47;
                v49 = v29;
                v29 = v48;

                v62 = 1;
                v63 = v46;
              }

            }
          }
          v50 = os_log_create("com.apple.amp.iTunesCloud", "LiveLinkMedium");
          if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
          {
            v51 = *(_QWORD *)(a1 + 32);
            v52 = *(void **)(a1 + 40);
            *(_DWORD *)buf = 134218498;
            v82 = v51;
            v83 = 2114;
            v84 = v52;
            v85 = 2114;
            v86 = v38;
            _os_log_impl(&dword_1A03E3000, v50, OS_LOG_TYPE_DEFAULT, "MLLM %p: synchronizePlaybackState [importing] reason=%{public}@ transportControlState=%{public}@", buf, 0x20u);
          }

          objc_msgSend(*(id *)(a1 + 32), "handleNewTransportControlStateDictionary:", v38);
        }

        ++v35;
      }
      while (v33 != v35);
      v53 = -[NSObject countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v68, v80, 16);
      v33 = v53;
    }
    while (v53);

    if ((v62 & 1) == 0)
    {
      v8 = v61;
      v6 = 0;
      v11 = v60;
      goto LABEL_52;
    }
    v31 = os_log_create("com.apple.amp.iTunesCloud", "LiveLinkMedium");
    v8 = v61;
    v6 = 0;
    v11 = v60;
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      v54 = *(_QWORD *)(a1 + 32);
      v55 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 134218498;
      v82 = v54;
      v83 = 2114;
      v84 = v55;
      v85 = 2114;
      v86 = v29;
      _os_log_impl(&dword_1A03E3000, v31, OS_LOG_TYPE_DEFAULT, "MLLM %p: synchronizePlaybackState [computed local currentItemID] reason=%{public}@ currentItemID=%{public}@", buf, 0x20u);
    }
  }
  else
  {
    v6 = 0;
    v11 = v60;
  }

LABEL_52:
  if (objc_msgSend(v29, "length"))
  {
    v56 = os_log_create("com.apple.amp.iTunesCloud", "LiveLinkMedium");
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
    {
      v57 = *(_QWORD *)(a1 + 32);
      v58 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 134218498;
      v82 = v57;
      v83 = 2114;
      v84 = v58;
      v85 = 2114;
      v86 = v29;
      _os_log_impl(&dword_1A03E3000, v56, OS_LOG_TYPE_DEFAULT, "MLLM %p: synchronizePlaybackState [importing] reason=%{public}@ currentItemID=%{public}@", buf, 0x20u);
    }

    objc_msgSend(*(id *)(a1 + 32), "liveLink");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "receivedCurrentItemIdentifier:fromParticipant:", v29, 0);

  }
  v11[2](v11);

LABEL_57:
}

void __73__ICLiveLinkPlaybackCoordinatorMedium_synchronizePlaybackStateForReason___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t v14[128];
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v2 = os_log_create("com.apple.amp.iTunesCloud", "LiveLinkMedium");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(_QWORD *)(a1 + 40);
      v4 = objc_msgSend(*(id *)(a1 + 32), "count");
      *(_DWORD *)buf = 134218240;
      v16 = v3;
      v17 = 2048;
      v18 = v4;
      _os_log_impl(&dword_1A03E3000, v2, OS_LOG_TYPE_DEFAULT, "MLLM %p: synchronizePlaybackStateForReason [flushing pending completions] completionCount=%ld", buf, 0x16u);
    }

    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v5 = *(id *)(a1 + 32);
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
          (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9) + 16))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9));
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

  }
}

@end
