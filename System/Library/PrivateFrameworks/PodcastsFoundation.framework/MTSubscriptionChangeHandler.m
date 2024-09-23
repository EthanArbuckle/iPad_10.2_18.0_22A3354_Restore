@implementation MTSubscriptionChangeHandler

- (void)setDownloadManager:(id)a3
{
  self->_downloadManager = (MTLegacyDownloadManagerProtocol *)a3;
}

- (void)unsafeHandleSubscriptionChangeForChannel:(id)a3 subscriptionBecameActive:(BOOL)a4 subscriptionEnabledDate:(double)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  _BOOL4 v18;
  uint64_t v19;

  v6 = a4;
  v19 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  _MTLogCategoryDatabase();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138543874;
    v14 = v10;
    v15 = 2048;
    v16 = objc_msgSend(v8, "storeId");
    v17 = 1024;
    v18 = v6;
    _os_log_impl(&dword_1A904E000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Handling subscription change for channel: %lld. Switching to active: %d", (uint8_t *)&v13, 0x1Cu);
  }

  objc_msgSend(v8, "setSubscriptionActive:", v6);
  objc_msgSend(v8, "setSubscriptionEnabledDate:", a5);
  v12 = (void *)objc_opt_new();
  -[MTSubscriptionChangeHandler _unsafeUpdatePriceTypeAndSendNotificationsIfNeededFor:subscriptionActive:episodeEffects:taskID:](self, "_unsafeUpdatePriceTypeAndSendNotificationsIfNeededFor:subscriptionActive:episodeEffects:taskID:", v8, v6, v12, v10);
  -[MTSubscriptionChangeHandler _unsafeApplyDownloadEffects:channel:taskID:](self, "_unsafeApplyDownloadEffects:channel:taskID:", v12, v8, v10);

}

- (void)_unsafeApplyDownloadEffects:(id)a3 channel:(id)a4 taskID:(id)a5
{
  id v8;
  id v9;
  id v10;
  _BOOL4 v11;
  NSObject *v12;
  _BOOL4 v13;
  int v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = +[PFClientUtil supportsDownloads](PFClientUtil, "supportsDownloads");
  _MTLogCategoryDownload();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
  if (v11)
  {
    if (v13)
    {
      v14 = 138543618;
      v15 = v10;
      v16 = 2114;
      v17 = v8;
      _os_log_impl(&dword_1A904E000, v12, OS_LOG_TYPE_INFO, "[%{public}@] Applying effects for subscription change: %{public}@", (uint8_t *)&v14, 0x16u);
    }

    -[MTSubscriptionChangeHandler _applyEffectsOffMoC:channel:taskID:](self, "_applyEffectsOffMoC:channel:taskID:", v8, v9, v10);
  }
  else
  {
    if (v13)
    {
      v14 = 138543362;
      v15 = v10;
      _os_log_impl(&dword_1A904E000, v12, OS_LOG_TYPE_INFO, "[%{public}@] Platform does not support downloads. Effects cannot be applied.", (uint8_t *)&v14, 0xCu);
    }

  }
}

- (void)_applyEffectsOffMoC:(id)a3 channel:(id)a4 taskID:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  _QWORD v22[4];
  id v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[MTSubscriptionChangeHandler downloadManager](self, "downloadManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[MTSubscriptionChangeHandler episodesWithEffect:fromEpisodeEffects:](self, "episodesWithEffect:fromEpisodeEffects:", 2, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "mt_uniqued");
    v13 = objc_claimAutoreleasedReturnValue();

    -[MTSubscriptionChangeHandler episodesWithEffect:fromEpisodeEffects:](self, "episodesWithEffect:fromEpisodeEffects:", 4, v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "mt_uniqued");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v15, "isSubsetOfSet:", v13) & 1) == 0)
    {
      _MTLogCategoryDownload();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A904E000, v16, OS_LOG_TYPE_ERROR, "Potential API misuse while applying effect. Deleted episodes should be a strict superset of downloads - but an episode would be downloaded before deletion! This will be corrected, but may be a programming error elsewhere.", buf, 2u);
      }

      -[NSObject setByAddingObjectsFromSet:](v13, "setByAddingObjectsFromSet:", v15);
      v17 = objc_claimAutoreleasedReturnValue();

      v13 = v17;
    }
    -[MTSubscriptionChangeHandler downloadManager](self, "downloadManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "removeDownloadedEpisodes:", v13);

    _MTLogCategoryDownload();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v25 = v10;
      v26 = 2114;
      v27 = (uint64_t)v13;
      _os_log_impl(&dword_1A904E000, v19, OS_LOG_TYPE_DEFAULT, "[%{public}@]Removed episodes from subscription status change: %{public}@", buf, 0x16u);
    }

    -[MTSubscriptionChangeHandler downloadManager](self, "downloadManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __66__MTSubscriptionChangeHandler__applyEffectsOffMoC_channel_taskID___block_invoke;
    v22[3] = &unk_1E54D0E08;
    v23 = v10;
    objc_msgSend(v20, "addEpisodeAutoDownloads:completion:", v15, v22);

    goto LABEL_11;
  }
  _MTLogCategoryDownload();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    v21 = objc_msgSend(v9, "storeId");
    objc_msgSend(v9, "name");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543875;
    v25 = v10;
    v26 = 2049;
    v27 = v21;
    v28 = 2113;
    v29 = v15;
    _os_log_impl(&dword_1A904E000, v13, OS_LOG_TYPE_ERROR, "[%{public}@] No download manager. Failed to re-download episodes after subscription changed for channel: %{private}lld - %{private}@", buf, 0x20u);
LABEL_11:

  }
}

void __66__MTSubscriptionChangeHandler__applyEffectsOffMoC_channel_taskID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "count"))
  {
    _MTLogCategoryDownload();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = 138543618;
      v7 = v5;
      v8 = 2114;
      v9 = v3;
      _os_log_impl(&dword_1A904E000, v4, OS_LOG_TYPE_ERROR, "[%{public}@]Unable to redownload episodes for subscription change: %{public}@", (uint8_t *)&v6, 0x16u);
    }

  }
}

- (id)episodesWithEffect:(unint64_t)a3 fromEpisodeEffects:(id)a4
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __69__MTSubscriptionChangeHandler_episodesWithEffect_fromEpisodeEffects___block_invoke;
  v5[3] = &__block_descriptor_40_e11__24__0_8_16l;
  v5[4] = a3;
  objc_msgSend(a4, "mt_compactMap:", v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __69__MTSubscriptionChangeHandler_episodesWithEffect_fromEpisodeEffects___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a2;
  if ((*(_QWORD *)(a1 + 32) & objc_msgSend(a3, "unsignedIntegerValue")) != 0)
    v6 = v5;
  else
    v6 = 0;

  return v6;
}

- (void)_unsafeUpdatePriceTypeAndSendNotificationsIfNeededFor:(id)a3 subscriptionActive:(BOOL)a4 episodeEffects:(id)a5 taskID:(id)a6
{
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  unint64_t v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  uint64_t v37;
  unint64_t v38;
  void *v39;
  id obj;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  id v46;
  id v47;
  _BOOL4 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint64_t v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint8_t buf[4];
  id v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  uint64_t v63;
  __int16 v64;
  unint64_t v65;
  _BYTE v66[128];
  _BYTE v67[128];
  uint64_t v68;

  v48 = a4;
  v68 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v47 = a5;
  v10 = a6;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v39 = v9;
  objc_msgSend(v9, "podcasts");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v67, 16);
  if (v42)
  {
    v41 = *(_QWORD *)v55;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v55 != v41)
          objc_enumerationMutation(obj);
        v44 = v11;
        v12 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v11);
        _MTLogCategoryDatabase();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v12, "uuid");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v12, "storeCollectionId");
          *(_DWORD *)buf = 138543874;
          v59 = v10;
          v60 = 2114;
          v61 = v14;
          v62 = 2048;
          v63 = v15;
          _os_log_impl(&dword_1A904E000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] Updating episodes in podcast: %{public}@ - %lld", buf, 0x20u);

        }
        v53 = 0;
        v49 = 0u;
        v50 = 0u;
        v51 = 0u;
        v52 = 0u;
        v43 = v12;
        objc_msgSend(v12, "episodes");
        v46 = (id)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v49, v66, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v50;
          do
          {
            for (i = 0; i != v17; ++i)
            {
              if (*(_QWORD *)v50 != v18)
                objc_enumerationMutation(v46);
              v20 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
              _MTLogCategoryDatabase();
              v21 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v20, "uuid");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                v23 = objc_msgSend(v20, "storeTrackId");
                *(_DWORD *)buf = 138543874;
                v59 = v10;
                v60 = 2114;
                v61 = v22;
                v62 = 2048;
                v63 = v23;
                _os_log_impl(&dword_1A904E000, v21, OS_LOG_TYPE_DEFAULT, "[%{public}@] Updating episode: %{public}@ - %lld", buf, 0x20u);

              }
              v24 = -[MTSubscriptionChangeHandler _updateEntitledAttributes:subscriptionActive:taskID:](self, "_updateEntitledAttributes:subscriptionActive:taskID:", v20, v48, v10);
              if ((v24 & 8) != 0)
              {
                _MTLogCategoryDatabase();
                v25 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(v20, "uuid");
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  v27 = objc_msgSend(v20, "storeTrackId");
                  *(_DWORD *)buf = 138543874;
                  v59 = v10;
                  v60 = 2114;
                  v61 = v26;
                  v62 = 2048;
                  v63 = v27;
                  _os_log_impl(&dword_1A904E000, v25, OS_LOG_TYPE_DEFAULT, "[%{public}@] Updating episode state: %{public}@ - %lld", buf, 0x20u);

                }
                -[MTSubscriptionChangeHandler _unsafeUpdateEntitlementStateAndCheckForNewEntitlement:newlyEntitledEpisodeUUIDs:latestEpisodeDate:latestEpisodeUUID:](self, "_unsafeUpdateEntitlementStateAndCheckForNewEntitlement:newlyEntitledEpisodeUUIDs:latestEpisodeDate:latestEpisodeUUID:", v20, v45, &v53, 0);
                v24 ^= 8uLL;
              }
              objc_msgSend(v20, "uuid");
              v28 = (void *)objc_claimAutoreleasedReturnValue();

              if (v28)
              {
                _MTLogCategoryDatabase();
                v29 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
                {
                  objc_msgSend(v20, "uuid");
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  v31 = objc_msgSend(v20, "storeTrackId");
                  *(_DWORD *)buf = 138544130;
                  v59 = v10;
                  v60 = 2114;
                  v61 = v30;
                  v62 = 2048;
                  v63 = v31;
                  v64 = 2048;
                  v65 = v24;
                  _os_log_impl(&dword_1A904E000, v29, OS_LOG_TYPE_INFO, "[%{public}@] Returning resulting effects for episode (%{public}@ - %lld): %lu", buf, 0x2Au);

                }
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v24);
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "uuid");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v47, "setObject:forKeyedSubscript:", v32, v33);

              }
            }
            v17 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v49, v66, 16);
          }
          while (v17);
        }

        objc_msgSend(v43, "newestEpisodeByAvailabiltyTime");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "firstTimeAvailable");
        objc_msgSend(v43, "setLatestEpisodeAvailabilityTime:");

        _MTLogCategoryDatabase();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v43, "uuid");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = objc_msgSend(v43, "storeCollectionId");
          objc_msgSend(v43, "latestEpisodeAvailabilityTime");
          *(_DWORD *)buf = 138544130;
          v59 = v10;
          v60 = 2114;
          v61 = v36;
          v62 = 2048;
          v63 = v37;
          v64 = 2048;
          v65 = v38;
          _os_log_impl(&dword_1A904E000, v35, OS_LOG_TYPE_INFO, "[%{public}@] Resolved podcasts latest episode availability for podcast (%{public}@ - %lld): %f", buf, 0x2Au);

        }
        if (v48)
          -[MTSubscriptionChangeHandler _unsafeSendNotificationsForNewlyEntitledEpisodes:latestEpisodeUUID:newlyEntitledEpisodeUUIDs:taskID:](self, "_unsafeSendNotificationsForNewlyEntitledEpisodes:latestEpisodeUUID:newlyEntitledEpisodeUUIDs:taskID:", v43, 0, v45, v10);
        v11 = v44 + 1;
      }
      while (v44 + 1 != v42);
      v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v67, 16);
    }
    while (v42);
  }

}

- (unint64_t)_updateEntitledAttributes:(id)a3 subscriptionActive:(BOOL)a4 taskID:(id)a5
{
  _BOOL4 v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  char v36;
  void *v37;
  void *v38;
  char v39;
  char v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  unint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  char v55;
  NSObject *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  NSObject *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  id v67;
  uint8_t buf[4];
  id v69;
  __int16 v70;
  void *v71;
  __int16 v72;
  uint64_t v73;
  __int16 v74;
  uint64_t v75;
  __int16 v76;
  void *v77;
  __int16 v78;
  void *v79;
  __int16 v80;
  void *v81;
  uint64_t v82;

  v6 = a4;
  v82 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  _MTLogCategoryDatabase();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "uuid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v69 = v8;
    v70 = 2112;
    v71 = v10;
    v72 = 2048;
    v73 = objc_msgSend(v7, "storeTrackId");
    v74 = 1024;
    LODWORD(v75) = v6;
    _os_log_impl(&dword_1A904E000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Updating entitled attributes in episode: %@ - %lld. subscriptionActive: %d", buf, 0x26u);

  }
  objc_msgSend(v7, "priceType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "enclosureURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(v7, "freeDuration");
    if (v23 > 0.0)
    {
      objc_msgSend(v7, "freeDuration");
      objc_msgSend(v7, "setDuration:");
    }
    objc_msgSend(v7, "freeEnclosureURL");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setEnclosureURL:", v24);

    objc_msgSend(v7, "freePriceType");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPriceType:", v25);

    objc_msgSend(v7, "freeTranscriptIdentifier");
    v22 = objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  objc_msgSend(v7, "entitledDuration");
  if (v13 > 0.0)
  {
    objc_msgSend(v7, "entitledDuration");
    objc_msgSend(v7, "setDuration:");
  }
  objc_msgSend(v7, "entitledEnclosureURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v7, "entitledEnclosureURL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setEnclosureURL:", v15);

  }
  objc_msgSend(v7, "entitledPriceType");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPriceType:", v16);

  _MTLogCategoryDatabase();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "entitledPriceType");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uuid");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v7, "storeTrackId");
    *(_DWORD *)buf = 138544386;
    v69 = v8;
    v70 = 2112;
    v71 = v18;
    v72 = 2112;
    v73 = (uint64_t)v19;
    v74 = 2048;
    v75 = v20;
    v76 = 1024;
    LODWORD(v77) = 1;
    _os_log_impl(&dword_1A904E000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set priceType to entitledPriceType %@ for episode: %@ - %lld. subscriptionActive: %d", buf, 0x30u);

  }
  objc_msgSend(v7, "entitledTranscriptIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_msgSend(v7, "entitledTranscriptIdentifier");
    v22 = objc_claimAutoreleasedReturnValue();
LABEL_15:
    v26 = (void *)v22;
    objc_msgSend(v7, "setTranscriptIdentifier:", v22);

  }
  objc_msgSend(v7, "priceType");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v11, "isEqualToString:", v27);

  if ((v28 & 1) == 0)
  {
    _MTLogCategoryDatabase();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "uuid");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "priceType");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v69 = v8;
      v70 = 2112;
      v71 = v30;
      v72 = 2112;
      v73 = (uint64_t)v11;
      v74 = 2112;
      v75 = (uint64_t)v31;
      _os_log_impl(&dword_1A904E000, v29, OS_LOG_TYPE_DEFAULT, "[%{public}@] Entitled state is changed for episode uuid %@ from priceType: %@ to %@", buf, 0x2Au);

    }
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    objc_msgSend(v7, "setPriceTypeChangedDate:");
  }
  objc_msgSend(v7, "resolveAvailabilityDate");
  objc_msgSend(v7, "assetURL");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "length");

  if (v33)
  {
    v67 = v8;
    v34 = v12;
    objc_msgSend(v7, "priceType");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "isEqualToString:", v11);

    objc_msgSend(v7, "entitledEnclosureURL");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "freeEnclosureURL");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v37, "isEqualToString:", v38);

    v40 = v39 | v36;
    _MTLogCategoryFeedUpdate();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v7, "uuid");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "priceType");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "freePriceType");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromBOOL();
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "enclosureURL");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v69 = v42;
      v70 = 2112;
      v71 = v11;
      v72 = 2112;
      v73 = (uint64_t)v43;
      v74 = 2112;
      v75 = (uint64_t)v44;
      v76 = 2112;
      v77 = v45;
      v78 = 2112;
      v79 = v46;
      _os_log_impl(&dword_1A904E000, v41, OS_LOG_TYPE_INFO, "Updating entitlement info for %{public}@. PriceType: (%@ -> %@), freePriceType: %@. Requires new media: %@. New enclosure url: %@", buf, 0x3Eu);

    }
    if ((v40 & 1) != 0)
    {
      v47 = 1;
    }
    else
    {
      objc_msgSend(v7, "enclosureURL");
      v48 = (void *)objc_claimAutoreleasedReturnValue();

      if (v48)
        v47 = 7;
      else
        v47 = 3;
    }
    v12 = v34;
    v8 = v67;
    if (!v11)
      goto LABEL_40;
  }
  else
  {
    v47 = 1;
    if (!v11)
      goto LABEL_40;
  }
  objc_msgSend(v7, "priceType");
  v49 = objc_claimAutoreleasedReturnValue();
  if (v49)
  {
    v50 = (void *)v49;
    objc_msgSend(v7, "priceType");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "isEqualToString:", v51) & 1) == 0
      && v12
      && (objc_msgSend(v7, "enclosureURL"), (v52 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v53 = (void *)v52;
      objc_msgSend(v7, "enclosureURL");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = objc_msgSend(v12, "isEqualToString:", v54);

      if ((v55 & 1) == 0)
      {
        _MTLogCategoryDatabase();
        v56 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v7, "uuid");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v58 = objc_msgSend(v7, "storeTrackId");
          objc_msgSend(v7, "priceType");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "enclosureURL");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544898;
          v69 = v8;
          v70 = 2112;
          v71 = v57;
          v72 = 2048;
          v73 = v58;
          v74 = 2112;
          v75 = (uint64_t)v11;
          v76 = 2112;
          v77 = v59;
          v78 = 2112;
          v79 = v12;
          v80 = 2112;
          v81 = v60;
          _os_log_impl(&dword_1A904E000, v56, OS_LOG_TYPE_DEFAULT, "[%{public}@] Will update entitlement state for episode %@ - %lld. oldPriceType: %@, priceType: %@, oldEnclosureUrl: %@, enclosureUrl: %@", buf, 0x48u);

        }
        v47 |= 8uLL;
        goto LABEL_43;
      }
    }
    else
    {

    }
  }
LABEL_40:
  _MTLogCategoryDatabase();
  v61 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "uuid");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = objc_msgSend(v7, "storeTrackId");
    objc_msgSend(v7, "priceType");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "enclosureURL");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544898;
    v69 = v8;
    v70 = 2112;
    v71 = v62;
    v72 = 2048;
    v73 = v63;
    v74 = 2112;
    v75 = (uint64_t)v11;
    v76 = 2112;
    v77 = v64;
    v78 = 2112;
    v79 = v12;
    v80 = 2112;
    v81 = v65;
    _os_log_impl(&dword_1A904E000, v61, OS_LOG_TYPE_DEFAULT, "[%{public}@] Will not update entitlement state for episode %@ - %lld. oldPriceType: %@, priceType: %@, oldEnclosureUrl: %@, enclosureUrl: %@", buf, 0x48u);

  }
LABEL_43:

  return v47;
}

- (void)_unsafeUpdateEntitlementStateAndCheckForNewEntitlement:(id)a3 newlyEntitledEpisodeUUIDs:(id)a4 latestEpisodeDate:(double *)a5 latestEpisodeUUID:(id)a6
{
  id v9;
  id v10;
  id v11;
  int v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  void *v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  void *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a6;
  v12 = objc_msgSend(v9, "isEntitled");
  _MTLogCategoryDatabase();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v9, "uuid");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138413058;
    v25 = v14;
    v26 = 2048;
    v27 = objc_msgSend(v9, "storeTrackId");
    v28 = 2048;
    v29 = objc_msgSend(v9, "entitlementState");
    v30 = 1024;
    v31 = v12;
    _os_log_impl(&dword_1A904E000, v13, OS_LOG_TYPE_DEFAULT, "[MTSubscriptionChangeHandler] Updating entitlementState for episode: %@ - %lld. oldEntitlementState: %lld, oldIsEntitled: %d", (uint8_t *)&v24, 0x26u);

  }
  objc_msgSend(v9, "updateEntitlementState");
  _MTLogCategoryDatabase();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v9, "uuid");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v9, "storeTrackId");
    v18 = objc_msgSend(v9, "entitlementState");
    v19 = objc_msgSend(v9, "isEntitled");
    v24 = 138413058;
    v25 = v16;
    v26 = 2048;
    v27 = v17;
    v28 = 2048;
    v29 = v18;
    v30 = 1024;
    v31 = v19;
    _os_log_impl(&dword_1A904E000, v15, OS_LOG_TYPE_DEFAULT, "[MTSubscriptionChangeHandler] Updated entitlementState for episode: %@ - %lld. newEntitlementState: %lld, newIsEntitled: %d", (uint8_t *)&v24, 0x26u);

  }
  if (objc_msgSend(v9, "isEntitled") && v12 != objc_msgSend(v9, "isEntitled"))
  {
    objc_msgSend(v9, "uuid");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v20);

  }
  objc_msgSend(v9, "pubDate");
  if (v21 > *a5 && objc_msgSend(v9, "isMedia"))
  {
    objc_msgSend(v9, "pubDate");
    *(_QWORD *)a5 = v22;
    objc_msgSend(v9, "uuid");
    v23 = objc_claimAutoreleasedReturnValue();

    v11 = (id)v23;
  }

}

- (void)_unsafeSendNotificationsForNewlyEntitledEpisodes:(id)a3 latestEpisodeUUID:(id)a4 newlyEntitledEpisodeUUIDs:(id)a5 taskID:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  int v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a6;
  v12 = a5;
  objc_msgSend(v9, "managedObjectContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "uuid");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[MTRecencyUtil upNextForPodcastUuid:ctx:](MTRecencyUtil, "upNextForPodcastUuid:ctx:", v14, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "episodeUuid");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
    v17 = v16;
  else
    v17 = v10;
  v18 = v17;
  v19 = objc_msgSend(v12, "containsObject:", v18);

  if (v19)
  {
    objc_msgSend(v13, "objectForUuid:entityName:", v16, CFSTR("MTEpisode"));
    v20 = objc_claimAutoreleasedReturnValue();
    _MTLogCategoryDatabase();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v9, "uuid");
      v28 = v10;
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "title");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject uuid](v20, "uuid");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject title](v20, "title");
      v29 = v11;
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v31 = v29;
      v32 = 2114;
      v33 = v22;
      v34 = 2112;
      v35 = v23;
      v36 = 2114;
      v37 = v24;
      v38 = 2112;
      v39 = v25;
      _os_log_impl(&dword_1A904E000, v21, OS_LOG_TYPE_DEFAULT, "[%{public}@] %{public}@ - '%@' Found new smart play episode from episode entitlement changed %{public}@ - %@", buf, 0x34u);

      v11 = v29;
      v10 = v28;
    }

    -[NSObject unsuppressAutomaticDownloadsIfNeeded](v20, "unsuppressAutomaticDownloadsIfNeeded");
    -[NSObject setIsNew:](v20, "setIsNew:", 1);
    -[NSObject setSentNotification:](v20, "setSentNotification:", 0);
  }
  else
  {
    _MTLogCategoryDatabase();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v9, "uuid");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "title");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v31 = v11;
      v32 = 2114;
      v33 = v26;
      v34 = 2112;
      v35 = v27;
      _os_log_impl(&dword_1A904E000, v20, OS_LOG_TYPE_INFO, "[%{public}@] %{public}@ - Skipping '%@' smart playlist episode, not found during entitlement update.", buf, 0x20u);

    }
  }

}

- (MTLegacyDownloadManagerProtocol)downloadManager
{
  return self->_downloadManager;
}

@end
