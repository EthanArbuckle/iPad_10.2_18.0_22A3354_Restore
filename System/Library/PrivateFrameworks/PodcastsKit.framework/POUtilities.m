@implementation POUtilities

+ (id)identifierFromDomainObject:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastPathComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)typeFromDomainObject:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "host");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (void)performPodcastsPlaybackRequestWithIdentifier:(id)a3 assetInfo:(id)a4 hashedRouteUIDs:(id)a5 startPlaying:(BOOL)a6 requesterSharedUserId:(id)a7 sharedUserIdFromPlayableITunesAccount:(id)a8 context:(id)a9 completion:(id)a10
{
  uint64_t v10;

  LOBYTE(v10) = 1;
  objc_msgSend(a1, "performPodcastsPlaybackRequestWithIdentifier:assetInfo:hashedRouteUIDs:startPlaying:requesterSharedUserId:sharedUserIdFromPlayableITunesAccount:context:allowsFallback:completion:", a3, a4, a5, a6, a7, a8, a9, v10, a10);
}

+ (void)performPodcastsPlaybackRequestWithIdentifier:(id)a3 assetInfo:(id)a4 hashedRouteUIDs:(id)a5 startPlaying:(BOOL)a6 requesterSharedUserId:(id)a7 sharedUserIdFromPlayableITunesAccount:(id)a8 context:(id)a9 allowsFallback:(BOOL)a10 completion:(id)a11
{
  uint64_t v11;

  LOBYTE(v11) = a10;
  objc_msgSend(a1, "performPodcastsPlaybackRequestWithIdentifier:assetInfo:hashedRouteUIDs:decodedRouteUIDs:originatingOutputDeviceUID:startPlaying:requesterSharedUserId:sharedUserIdFromPlayableITunesAccount:context:allowsFallback:completion:", a3, a4, a5, 0, 0, a6, a7, a8, a9, v11, a11);
}

+ (void)performPodcastsPlaybackRequestWithIdentifier:(id)a3 assetInfo:(id)a4 decodedRouteUIDs:(id)a5 originatingOutputDeviceUID:(id)a6 startPlaying:(BOOL)a7 requesterSharedUserId:(id)a8 sharedUserIdFromPlayableITunesAccount:(id)a9 context:(id)a10 allowsFallback:(BOOL)a11 completion:(id)a12
{
  uint64_t v12;

  LOBYTE(v12) = a11;
  objc_msgSend(a1, "performPodcastsPlaybackRequestWithIdentifier:assetInfo:hashedRouteUIDs:decodedRouteUIDs:originatingOutputDeviceUID:startPlaying:requesterSharedUserId:sharedUserIdFromPlayableITunesAccount:context:allowsFallback:completion:", a3, a4, 0, a5, a6, a7, a8, a9, a10, v12, a12);
}

+ (void)performPodcastsPlaybackRequestWithIdentifier:(id)a3 assetInfo:(id)a4 hashedRouteUIDs:(id)a5 decodedRouteUIDs:(id)a6 originatingOutputDeviceUID:(id)a7 startPlaying:(BOOL)a8 requesterSharedUserId:(id)a9 sharedUserIdFromPlayableITunesAccount:(id)a10 context:(id)a11 allowsFallback:(BOOL)a12 completion:(id)a13
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void (**v22)(id, uint64_t, void *);
  void *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  MTMPCAssistantGenericPlaybackQueue *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  MTMPCAssistantGenericPlaybackQueue *v37;
  void *v38;
  MTMPCAssistantGenericPlaybackQueue *v39;
  id v40;
  NSObject *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  char v51;
  void *v52;
  _BOOL4 v54;
  id v55;
  id v56;
  id v57;
  _QWORD v58[4];
  id v59;
  id v60;
  id v61;
  id v62;
  MTMPCAssistantGenericPlaybackQueue *v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  void (**v69)(id, uint64_t, void *);
  id v70;
  BOOL v71;
  BOOL v72;
  id v73;
  uint8_t buf[4];
  id v75;
  __int16 v76;
  void *v77;
  __int16 v78;
  void *v79;
  __int16 v80;
  id v81;
  uint64_t v82;

  v54 = a8;
  v82 = *MEMORY[0x24BDAC8D0];
  v17 = a3;
  v56 = a4;
  v18 = a5;
  v19 = a6;
  v55 = a7;
  v20 = a9;
  v57 = a10;
  v21 = a11;
  v22 = (void (**)(id, uint64_t, void *))a13;
  if (!objc_msgSend(v17, "length"))
  {
    v38 = v20;
    POLogInitIfNeeded();
    if (POLogContextCommand)
      v41 = POLogContextCommand;
    else
      v41 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      +[POUtilities performPodcastsPlaybackRequestWithIdentifier:assetInfo:hashedRouteUIDs:decodedRouteUIDs:originatingOutputDeviceUID:startPlaying:requesterSharedUserId:sharedUserIdFromPlayableITunesAccount:context:allowsFallback:completion:].cold.1(v41, v42, v43, v44, v45, v46, v47, v48);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("POUtilitiesErrorDomain"), 102, 0);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v22[2](v22, 2, v49);

    v23 = v19;
    v35 = v55;
    goto LABEL_15;
  }
  v23 = v19;
  if (!objc_msgSend(v18, "count") && (!objc_msgSend(v19, "count") || !objc_msgSend(v55, "length")))
  {
    +[PODataSource sharedInstance](PODataSource, "sharedInstance");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v50, "isPodcastsInstalled");

    if ((v51 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("POUtilitiesErrorDomain"), 103, 0);
      v38 = v20;
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v22[2](v22, 2, v52);

      v35 = v55;
LABEL_15:
      v36 = v57;
      goto LABEL_16;
    }
  }
  v24 = v20;
  POLogInitIfNeeded();
  if (POLogContextCommand)
    v25 = POLogContextCommand;
  else
    v25 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    v26 = v25;
    objc_msgSend(v18, "componentsJoinedByString:", CFSTR(", "));
    v27 = v18;
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "componentsJoinedByString:", CFSTR(", "));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v75 = v17;
    v76 = 2112;
    v77 = v28;
    v78 = 2112;
    v79 = v29;
    v80 = 2112;
    v81 = v55;
    v23 = v19;
    _os_log_impl(&dword_22FB0C000, v26, OS_LOG_TYPE_DEFAULT, "Will be setting playbackQueue using MediaRemote to %@ with routeUIDs %@ decodedRouteUIDs %@ originatingOutputDeviceUID %@", buf, 0x2Au);

    v18 = v27;
  }
  v73 = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v73, 1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(a1, "createPlaybackQueueFromRequestIdentifiers:startPlaying:assetInfo:requesterSharedUserId:sharedUserIdFromPlayableITunesAccount:", v30, v54, v56, v24, v57);

  v32 = -[MTMPCAssistantGenericPlaybackQueue initWithContextID:playbackQueueRef:]([MTMPCAssistantGenericPlaybackQueue alloc], "initWithContextID:playbackQueueRef:", v21, v31);
  v33 = objc_alloc(MEMORY[0x24BE64D00]);
  v34 = (void *)objc_msgSend(v33, "initWithAppBundleID:playerID:origin:", *MEMORY[0x24BE739D8], CFSTR("Podcasts"), 0);
  objc_msgSend(v34, "setSingleGroup:", 1);
  v58[0] = MEMORY[0x24BDAC760];
  v58[1] = 3221225472;
  v58[2] = __237__POUtilities_performPodcastsPlaybackRequestWithIdentifier_assetInfo_hashedRouteUIDs_decodedRouteUIDs_originatingOutputDeviceUID_startPlaying_requesterSharedUserId_sharedUserIdFromPlayableITunesAccount_context_allowsFallback_completion___block_invoke;
  v58[3] = &unk_24FD629B0;
  v70 = a1;
  v59 = v34;
  v60 = v18;
  v61 = v23;
  v35 = v55;
  v62 = v55;
  v69 = v22;
  v63 = v32;
  v71 = a12;
  v64 = v17;
  v72 = v54;
  v65 = v56;
  v66 = v24;
  v36 = v57;
  v67 = v57;
  v68 = v21;
  v37 = v32;
  v38 = v24;
  v39 = v37;
  v40 = v34;
  MPAssistantWatchGetCurrentAudioRoutingInfo((uint64_t)v58);

LABEL_16:
}

void __237__POUtilities_performPodcastsPlaybackRequestWithIdentifier_assetInfo_hashedRouteUIDs_decodedRouteUIDs_originatingOutputDeviceUID_startPlaying_requesterSharedUserId_sharedUserIdFromPlayableITunesAccount_context_allowsFallback_completion___block_invoke(uint64_t a1, unsigned int a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  char v20;
  char v21;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 56);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __237__POUtilities_performPodcastsPlaybackRequestWithIdentifier_assetInfo_hashedRouteUIDs_decodedRouteUIDs_originatingOutputDeviceUID_startPlaying_requesterSharedUserId_sharedUserIdFromPlayableITunesAccount_context_allowsFallback_completion___block_invoke_2;
  v11[3] = &unk_24FD62988;
  v8 = *(void **)(a1 + 120);
  v18 = *(id *)(a1 + 112);
  v9 = *(id *)(a1 + 64);
  v20 = *(_BYTE *)(a1 + 128);
  v10 = *(_QWORD *)(a1 + 120);
  v12 = v9;
  v19 = v10;
  v13 = *(id *)(a1 + 72);
  v21 = *(_BYTE *)(a1 + 129);
  v14 = *(id *)(a1 + 80);
  v15 = *(id *)(a1 + 88);
  v16 = *(id *)(a1 + 96);
  v17 = *(id *)(a1 + 104);
  objc_msgSend(v8, "_resolveWithDestination:hashedRouteIdentifiers:decodedRouteIdentifiers:originatingOutputDeviceUID:localPlaybackPermitted:audioRoutingInfo:completion:", v4, v5, v6, v7, 1, a2, v11);

}

void __237__POUtilities_performPodcastsPlaybackRequestWithIdentifier_assetInfo_hashedRouteUIDs_decodedRouteUIDs_originatingOutputDeviceUID_startPlaying_requesterSharedUserId_sharedUserIdFromPlayableITunesAccount_context_allowsFallback_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  char v19;
  char v20;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v21 = *MEMORY[0x24BE658A8];
  v22[0] = &unk_24FD6BE30;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x24BE64CD8]);
  v6 = *(_QWORD *)(a1 + 32);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __237__POUtilities_performPodcastsPlaybackRequestWithIdentifier_assetInfo_hashedRouteUIDs_decodedRouteUIDs_originatingOutputDeviceUID_startPlaying_requesterSharedUserId_sharedUserIdFromPlayableITunesAccount_context_allowsFallback_completion___block_invoke_18;
  v10[3] = &unk_24FD62960;
  v7 = *(id *)(a1 + 80);
  v19 = *(_BYTE *)(a1 + 96);
  v11 = v3;
  v8 = *(_QWORD *)(a1 + 88);
  v17 = v7;
  v18 = v8;
  v12 = *(id *)(a1 + 40);
  v20 = *(_BYTE *)(a1 + 97);
  v13 = *(id *)(a1 + 48);
  v14 = *(id *)(a1 + 56);
  v15 = *(id *)(a1 + 64);
  v16 = *(id *)(a1 + 72);
  v9 = v3;
  objc_msgSend(v5, "sendPlaybackQueueWithResult:toDestination:withOptions:completion:", v6, v9, v4, v10);

}

void __237__POUtilities_performPodcastsPlaybackRequestWithIdentifier_assetInfo_hashedRouteUIDs_decodedRouteUIDs_originatingOutputDeviceUID_startPlaying_requesterSharedUserId_sharedUserIdFromPlayableITunesAccount_context_allowsFallback_completion___block_invoke_18(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  MTMPCAssistantGenericPlaybackQueue *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  int v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(void);
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  NSObject *v47;
  NSObject *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t buf[4];
  _BYTE v54[14];
  __int16 v55;
  uint64_t v56;
  uint64_t v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = v3;
  v5 = MEMORY[0x24BDACB70];
  if (v3)
  {
    objc_msgSend(v3, "returnStatuses");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "unsignedIntValue");

    objc_msgSend(v4, "error");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    POLogInitIfNeeded();
    if (POLogContextCommand)
      v10 = POLogContextCommand;
    else
      v10 = v5;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = v10;
      objc_msgSend(v9, "localizedDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v54 = v12;
      _os_log_impl(&dword_22FB0C000, v11, OS_LOG_TYPE_DEFAULT, "sendPlaybackQueueWithResult Error: %@", buf, 0xCu);

    }
    POLogInitIfNeeded();
    if (POLogContextCommand)
      v13 = POLogContextCommand;
    else
      v13 = v5;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v54 = v8;
      _os_log_impl(&dword_22FB0C000, v13, OS_LOG_TYPE_DEFAULT, "sendPlaybackQueueWithResult Status: %d", buf, 8u);
    }
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    objc_msgSend(v9, "underlyingErrors", 0);
    v14 = (MTMPCAssistantGenericPlaybackQueue *)objc_claimAutoreleasedReturnValue();
    v15 = -[MTMPCAssistantGenericPlaybackQueue countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v50;
      while (2)
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v50 != v17)
            objc_enumerationMutation(v14);
          if (+[POUtilities errorIsNoNetwork:](POUtilities, "errorIsNoNetwork:", *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * i)))
          {
            POLogInitIfNeeded();
            if (POLogContextCommand)
              v26 = POLogContextCommand;
            else
              v26 = MEMORY[0x24BDACB70];
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
              __237__POUtilities_performPodcastsPlaybackRequestWithIdentifier_assetInfo_hashedRouteUIDs_decodedRouteUIDs_originatingOutputDeviceUID_startPlaying_requesterSharedUserId_sharedUserIdFromPlayableITunesAccount_context_allowsFallback_completion___block_invoke_18_cold_3(v26, v27, v28, v29, v30, v31, v32, v33);
            v34 = *(void (**)(void))(*(_QWORD *)(a1 + 80) + 16);
            goto LABEL_63;
          }
        }
        v16 = -[MTMPCAssistantGenericPlaybackQueue countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
        if (v16)
          continue;
        break;
      }
    }

    v19 = v8;
    v20 = MEMORY[0x24BDACB70];
    if (*(_BYTE *)(a1 + 96))
    {
      objc_msgSend(*(id *)(a1 + 32), "outputDeviceUIDs");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v21, "count"))
      {

        if ((v19 - 1) <= 1)
        {
          POLogInitIfNeeded();
          if (POLogContextCommand)
            v22 = POLogContextCommand;
          else
            v22 = v20;
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)v54 = v19;
            _os_log_impl(&dword_22FB0C000, v22, OS_LOG_TYPE_DEFAULT, "Falling back to airplay after status: %d", buf, 8u);
          }
          v23 = *(void **)(a1 + 88);
          v57 = *(_QWORD *)(a1 + 40);
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v57, 1);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v23, "createPlaybackQueueFromRequestIdentifiers:startPlaying:assetInfo:requesterSharedUserId:sharedUserIdFromPlayableITunesAccount:", v24, *(unsigned __int8 *)(a1 + 97), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

          v14 = -[MTMPCAssistantGenericPlaybackQueue initWithContextID:playbackQueueRef:]([MTMPCAssistantGenericPlaybackQueue alloc], "initWithContextID:playbackQueueRef:", *(_QWORD *)(a1 + 72), v25);
          objc_msgSend(*(id *)(a1 + 88), "modifyContextForAirplay:andPlayLocally:completion:", *(_QWORD *)(a1 + 32), v14, *(_QWORD *)(a1 + 80));
          goto LABEL_64;
        }
      }
      else
      {

      }
    }
    if (!*(_QWORD *)(a1 + 80))
    {
LABEL_65:

      goto LABEL_66;
    }
    objc_msgSend(v9, "domain");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v43, "isEqualToString:", *MEMORY[0x24BE64CB8]))
      v44 = objc_msgSend(v9, "code");
    else
      v44 = 0;

    objc_msgSend(v9, "domain");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v45, "isEqualToString:", *MEMORY[0x24BE64CA8]))
      v46 = objc_msgSend(v9, "code");
    else
      v46 = 0;

    POLogInitIfNeeded();
    if (POLogContextCommand)
      v47 = POLogContextCommand;
    else
      v47 = v20;
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109632;
      *(_DWORD *)v54 = v19;
      *(_WORD *)&v54[4] = 2048;
      *(_QWORD *)&v54[6] = v44;
      v55 = 2048;
      v56 = v46;
      _os_log_impl(&dword_22FB0C000, v47, OS_LOG_TYPE_DEFAULT, "Completed sendPlaybackQueueWithResult with MR status: %d, remote error: %ld, assistant error: %ld", buf, 0x1Cu);
    }
    if (v9 && (MPCAssistantErrorIsInformational() & 1) == 0)
    {
      v14 = v9;
      POLogInitIfNeeded();
      if (POLogContextCommand)
        v48 = POLogContextCommand;
      else
        v48 = v20;
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
        __237__POUtilities_performPodcastsPlaybackRequestWithIdentifier_assetInfo_hashedRouteUIDs_decodedRouteUIDs_originatingOutputDeviceUID_startPlaying_requesterSharedUserId_sharedUserIdFromPlayableITunesAccount_context_allowsFallback_completion___block_invoke_18_cold_2((uint64_t)v14, v48);
    }
    else
    {
      v14 = 0;
    }
    v34 = *(void (**)(void))(*(_QWORD *)(a1 + 80) + 16);
LABEL_63:
    v34();
LABEL_64:

    goto LABEL_65;
  }
  POLogInitIfNeeded();
  if (POLogContextCommand)
    v35 = POLogContextCommand;
  else
    v35 = v5;
  if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    __237__POUtilities_performPodcastsPlaybackRequestWithIdentifier_assetInfo_hashedRouteUIDs_decodedRouteUIDs_originatingOutputDeviceUID_startPlaying_requesterSharedUserId_sharedUserIdFromPlayableITunesAccount_context_allowsFallback_completion___block_invoke_18_cold_1(v35, v36, v37, v38, v39, v40, v41, v42);
  (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
LABEL_66:

}

+ (void)_resolveWithDestination:(id)a3 hashedRouteIdentifiers:(id)a4 decodedRouteIdentifiers:(id)a5 originatingOutputDeviceUID:(id)a6 localPlaybackPermitted:(BOOL)a7 audioRoutingInfo:(id)a8 completion:(id)a9
{
  _BOOL8 v10;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;

  v10 = a7;
  v18 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a9;
  if (objc_msgSend(v16, "length"))
    objc_msgSend(v18, "setOriginatingOutputDeviceUID:", v16);
  if (objc_msgSend(v15, "count"))
    objc_msgSend(v18, "resolveWithQueue:routeIdentifiers:localPlaybackPermitted:audioRoutingInfo:completion:", 0, v15, v10, *(unsigned int *)&a8, v17);
  else
    objc_msgSend(v18, "resolveWithQueue:hashedRouteIdentifiers:localPlaybackPermitted:audioRoutingInfo:completion:", 0, v14, v10, *(unsigned int *)&a8, v17);

}

+ (void)modifyContextForAirplay:(id)a3 andPlayLocally:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v7 = a4;
  v8 = a5;
  v9 = modifyContextForAirplay_andPlayLocally_completion__onceToken;
  v10 = a3;
  if (v9 != -1)
    dispatch_once(&modifyContextForAirplay_andPlayLocally_completion__onceToken, &__block_literal_global_1);
  v11 = (void *)modifyContextForAirplay_andPlayLocally_completion__assistantContext;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __65__POUtilities_modifyContextForAirplay_andPlayLocally_completion___block_invoke_2;
  v14[3] = &unk_24FD62A20;
  v15 = v7;
  v16 = v8;
  v12 = v7;
  v13 = v8;
  objc_msgSend(v11, "modifySystemMusicContextForDestination:completion:", v10, v14);

}

void __65__POUtilities_modifyContextForAirplay_andPlayLocally_completion___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BE64CF8]);
  v1 = (void *)modifyContextForAirplay_andPlayLocally_completion__assistantContext;
  modifyContextForAirplay_andPlayLocally_completion__assistantContext = (uint64_t)v0;

}

void __65__POUtilities_modifyContextForAirplay_andPlayLocally_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;

  v3 = a2;
  if (v3)
  {
    v4 = *(_QWORD *)(a1 + 40);
    if (v4)
      (*(void (**)(uint64_t, uint64_t, id))(v4 + 16))(v4, 2, v3);
  }
  else
  {
    v5 = objc_alloc_init(MEMORY[0x24BE64CD8]);
    v6 = objc_alloc(MEMORY[0x24BE64D28]);
    v7 = (void *)objc_msgSend(v6, "initWithAppBundleID:playerID:origin:", *MEMORY[0x24BE739D8], CFSTR("Podcasts"), 0);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __65__POUtilities_modifyContextForAirplay_andPlayLocally_completion___block_invoke_3;
    v9[3] = &unk_24FD629F8;
    v8 = *(_QWORD *)(a1 + 32);
    v10 = *(id *)(a1 + 40);
    objc_msgSend(v5, "sendPlaybackQueue:toDestination:completion:", v8, v7, v9);

  }
}

void __65__POUtilities_modifyContextForAirplay_andPlayLocally_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  _DWORD v14[2];
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  objc_msgSend(a3, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntValue");

  objc_msgSend(v5, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BE64CB8]))
    v9 = objc_msgSend(v5, "code");
  else
    v9 = 0;

  objc_msgSend(v5, "domain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x24BE64CA8]))
    v11 = objc_msgSend(v5, "code");
  else
    v11 = 0;

  POLogInitIfNeeded();
  if (POLogContextCommand)
    v12 = POLogContextCommand;
  else
    v12 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v14[0] = 67109632;
    v14[1] = v7;
    v15 = 2048;
    v16 = v9;
    v17 = 2048;
    v18 = v11;
    _os_log_impl(&dword_22FB0C000, v12, OS_LOG_TYPE_DEFAULT, "Completed Airplay fallback with MR status: %d, remote error: %ld, assistant error: %ld", (uint8_t *)v14, 0x1Cu);
  }
  v13 = *(_QWORD *)(a1 + 32);
  if (v13)
    (*(void (**)(uint64_t, uint64_t, id))(v13 + 16))(v13, v7, v5);

}

+ (_MRSystemAppPlaybackQueue)createPlaybackQueueFromRequestIdentifiers:(id)a3 startPlaying:(BOOL)a4 assetInfo:(id)a5 requesterSharedUserId:(id)a6 sharedUserIdFromPlayableITunesAccount:(id)a7
{
  id v10;
  id v11;
  id v12;
  id v13;
  _MRSystemAppPlaybackQueue *v14;
  void *v15;
  void *v16;

  v10 = a6;
  v11 = a7;
  v12 = a5;
  v13 = a3;
  v14 = (_MRSystemAppPlaybackQueue *)MRSystemAppPlaybackQueueCreate();
  MRSystemAppPlaybackQueueSetGenericTrackIdentifiers();

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v10)
    objc_msgSend(v15, "setObject:forKey:", v10, CFSTR("requesterUserId"));
  if (v11)
    objc_msgSend(v16, "setObject:forKey:", v11, CFSTR("sharedUserId"));
  MRSystemAppPlaybackQueueSetUserInfo();
  MRSystemAppPlaybackQueueSetTracklistShuffleMode();
  MRSystemAppPlaybackQueueSetIsRequestingImmediatePlayback();
  MRSystemAppPlaybackQueueSetReplaceIntent();
  MRSystemAppPlaybackQueueSetSiriAssetInfo();

  return v14;
}

+ (id)commandStatusForRemoteStatus:(unsigned int)a3 error:(id)a4 isRemoteStorePlayback:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t *v21;
  objc_class *v22;
  id v23;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t *v28;

  v5 = a5;
  v7 = a4;
  objc_msgSend(v7, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BE64CB8]) & 1) != 0)
  {
    v9 = objc_msgSend(v7, "code");
  }
  else
  {
    objc_msgSend(v7, "domain");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("POUtilitiesMRSendCommandErrorDomain")))
      v9 = objc_msgSend(v7, "code");
    else
      v9 = 0;

  }
  objc_msgSend(v7, "domain");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BE64CA8]))
    v12 = objc_msgSend(v7, "code");
  else
    v12 = 0;

  objc_msgSend(v7, "domain");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "isEqualToString:", CFSTR("POUtilitiesErrorDomain")))
    v14 = objc_msgSend(v7, "code");
  else
    v14 = 0;

  if (!v9)
  {
    if ((int)a3 > 9)
    {
      if (a3 == 20)
      {
        v18 = (uint64_t *)MEMORY[0x24BE823A0];
        goto LABEL_28;
      }
      if (a3 == 10)
      {
        v18 = (uint64_t *)MEMORY[0x24BE82340];
        goto LABEL_28;
      }
    }
    else
    {
      if (!a3)
      {
        v19 = 0;
        goto LABEL_29;
      }
      if (a3 == 1)
      {
        if (v5)
        {
          v18 = (uint64_t *)MEMORY[0x24BE82380];
LABEL_28:
          v19 = *v18;
          goto LABEL_29;
        }
        +[PODataSource sharedInstance](PODataSource, "sharedInstance");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "podcastCollections");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "count");
        v28 = (uint64_t *)MEMORY[0x24BE82350];
        if (!v27)
          v28 = (uint64_t *)MEMORY[0x24BE82358];
        v19 = *v28;

LABEL_29:
        switch(v14)
        {
          case 'e':
            v20 = (uint64_t *)MEMORY[0x24BE82378];
            goto LABEL_34;
          case 'g':
            v20 = (uint64_t *)MEMORY[0x24BE82348];
            goto LABEL_34;
          case 'h':
            v20 = (uint64_t *)MEMORY[0x24BE82338];
            goto LABEL_34;
          case 'i':
            v20 = (uint64_t *)MEMORY[0x24BE82330];
LABEL_34:
            v19 = *v20;
            break;
          default:
            break;
        }
        if (v19)
        {
          if (v12 != 1)
            goto LABEL_43;
          v21 = (uint64_t *)MEMORY[0x24BE82330];
        }
        else if (v12 == 6)
        {
          v21 = (uint64_t *)MEMORY[0x24BE82388];
        }
        else
        {
          if (v12 != 7)
            goto LABEL_45;
          v21 = (uint64_t *)MEMORY[0x24BE82390];
        }
        v19 = *v21;
        if (*v21)
        {
LABEL_43:
          v22 = (objc_class *)MEMORY[0x24BE811A8];
          if (v19 != -1)
          {
            v23 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BE811A8]), "initWithErrorCode:", v19);
LABEL_47:
            v17 = v23;
            goto LABEL_48;
          }
LABEL_46:
          v23 = objc_alloc_init(v22);
          goto LABEL_47;
        }
LABEL_45:
        v22 = (objc_class *)MEMORY[0x24BE811B8];
        goto LABEL_46;
      }
    }
    if (v5)
      v19 = *MEMORY[0x24BE82398];
    else
      v19 = -1;
    goto LABEL_29;
  }
  v15 = objc_alloc(MEMORY[0x24BE811A8]);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("MediaRemote error code %ld"), v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "initWithReason:", v16);

LABEL_48:
  return v17;
}

+ (BOOL)isPodcastsNowPlaying
{
  dispatch_semaphore_t v2;
  void *v3;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__1;
  v11 = __Block_byref_object_dispose__1;
  v12 = 0;
  v2 = dispatch_semaphore_create(0);
  dispatch_get_global_queue(0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDAC760];
  v6 = v2;
  MRMediaRemoteGetNowPlayingClient();

  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  LOBYTE(v3) = objc_msgSend((id)v8[5], "isEqual:", CFSTR("com.apple.podcasts"), v5, 3221225472, __35__POUtilities_isPodcastsNowPlaying__block_invoke, &unk_24FD62A48);

  _Block_object_dispose(&v7, 8);
  return (char)v3;
}

void __35__POUtilities_isPodcastsNowPlaying__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;

  v8 = (id)MRNowPlayingClientCopyBundleIdentifierHierarchy();
  MRNowPlayingClientGetParentAppBundleIdentifier();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(v8, "lastObject");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;
  }
  else
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = v2;
    v5 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v7;
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (void)setPlaybackRate:(float)a3 failureErrorCode:(int64_t)a4 completion:(id)a5
{
  id v6;
  double v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  uint8_t buf[4];
  double v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x24BDAC8D0];
  v6 = a5;
  v15[0] = *MEMORY[0x24BE65950];
  *(float *)&v7 = a3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = *MEMORY[0x24BE658F0];
  v16[0] = v8;
  v16[1] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  POLogInitIfNeeded();
  if (POLogContextCommand)
    v10 = POLogContextCommand;
  else
    v10 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v14 = a3;
    _os_log_impl(&dword_22FB0C000, v10, OS_LOG_TYPE_INFO, "Will be setting currentPlaybackRate using MediaRemote to %f", buf, 0xCu);
  }
  dispatch_get_global_queue(0, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v6;
  MRMediaRemoteSendCommandWithReply();

}

void __59__POUtilities_setPlaybackRate_failureErrorCode_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  int v12;
  BOOL v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  int v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v3 = a2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (!v4)
  {

LABEL_26:
    v7 = objc_alloc_init(MEMORY[0x24BE811B8]);
    goto LABEL_27;
  }
  v6 = v4;
  v7 = 0;
  v8 = *(_QWORD *)v20;
  v9 = MEMORY[0x24BDACB70];
  *(_QWORD *)&v5 = 67109120;
  v18 = v5;
LABEL_3:
  v10 = 0;
  while (1)
  {
    if (*(_QWORD *)v20 != v8)
      objc_enumerationMutation(v3);
    v11 = objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v10), "integerValue", v18, (_QWORD)v19);
    v12 = v11;
    if (v11)
      v13 = v11 == 3;
    else
      v13 = 1;
    if (!v13)
    {
      POLogInitIfNeeded();
      if (POLogContextCommand)
        v14 = POLogContextCommand;
      else
        v14 = v9;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = v18;
        v24 = v12;
        _os_log_error_impl(&dword_22FB0C000, v14, OS_LOG_TYPE_ERROR, "MediaRemote command failed with status %u", buf, 8u);
      }
      v15 = objc_msgSend(objc_alloc(MEMORY[0x24BE811A8]), "initWithErrorCode:", *(_QWORD *)(a1 + 40));

      v7 = (id)v15;
    }
    if (v12 != 3 && v12 != 0)
      break;
    if (v6 == ++v10)
    {
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
      if (v6)
        goto LABEL_3;
      break;
    }
  }

  if (!v7)
    goto LABEL_26;
LABEL_27:
  v17 = *(_QWORD *)(a1 + 32);
  if (v17)
    (*(void (**)(uint64_t, id))(v17 + 16))(v17, v7);

}

+ (BOOL)assistantErrorIsInformational:(id)a3
{
  return 0;
}

+ (BOOL)errorIsMaxStreamCount:(id)a3
{
  return 0;
}

+ (BOOL)errorIsNoNetwork:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;

  v3 = a3;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("MTSetPlaybackQueueUtilErrorDomain")))
    v5 = objc_msgSend(v3, "code") == -433001;
  else
    v5 = 0;

  return v5;
}

+ (BOOL)errorIsApplicationRequiresPreflight:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;

  v3 = a3;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE64CB8]))
    v5 = objc_msgSend(v3, "code") == 15;
  else
    v5 = 0;

  return v5;
}

+ (void)performPodcastsPlaybackRequestWithIdentifier:(uint64_t)a3 assetInfo:(uint64_t)a4 hashedRouteUIDs:(uint64_t)a5 decodedRouteUIDs:(uint64_t)a6 originatingOutputDeviceUID:(uint64_t)a7 startPlaying:(uint64_t)a8 requesterSharedUserId:sharedUserIdFromPlayableITunesAccount:context:allowsFallback:completion:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_22FB0C000, a1, a3, "Unable to play an empty URL", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __237__POUtilities_performPodcastsPlaybackRequestWithIdentifier_assetInfo_hashedRouteUIDs_decodedRouteUIDs_originatingOutputDeviceUID_startPlaying_requesterSharedUserId_sharedUserIdFromPlayableITunesAccount_context_allowsFallback_completion___block_invoke_18_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_22FB0C000, a1, a3, "No result from sendPlaybackQueueWithResult.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __237__POUtilities_performPodcastsPlaybackRequestWithIdentifier_assetInfo_hashedRouteUIDs_decodedRouteUIDs_originatingOutputDeviceUID_startPlaying_requesterSharedUserId_sharedUserIdFromPlayableITunesAccount_context_allowsFallback_completion___block_invoke_18_cold_2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_22FB0C000, a2, OS_LOG_TYPE_ERROR, "sendPlaybackQueueWithResult encountered error %@", (uint8_t *)&v2, 0xCu);
}

void __237__POUtilities_performPodcastsPlaybackRequestWithIdentifier_assetInfo_hashedRouteUIDs_decodedRouteUIDs_originatingOutputDeviceUID_startPlaying_requesterSharedUserId_sharedUserIdFromPlayableITunesAccount_context_allowsFallback_completion___block_invoke_18_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_22FB0C000, a1, a3, "sendPlaybackQueueWithResult encountered a network error -- Network connection needed but there is no network connection.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

@end
