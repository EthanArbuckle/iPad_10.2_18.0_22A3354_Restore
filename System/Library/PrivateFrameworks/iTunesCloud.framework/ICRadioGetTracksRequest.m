@implementation ICRadioGetTracksRequest

- (ICRadioGetTracksRequest)init
{
  ICRadioGetTracksRequest *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICRadioGetTracksRequest;
  result = -[ICRadioGetTracksRequest init](&v3, sel_init);
  if (result)
    result->_allowsExplicitContent = 1;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    v6 = -[NSDictionary copyWithZone:](self->_additionalRequestParameters, "copyWithZone:", a3);
    v7 = *(void **)(v5 + 16);
    *(_QWORD *)(v5 + 16) = v6;

    *(_BYTE *)(v5 + 8) = self->_allowsExplicitContent;
    v8 = -[NSNumber copyWithZone:](self->_delegatedPrivateListeningEnabled, "copyWithZone:", a3);
    v9 = *(void **)(v5 + 32);
    *(_QWORD *)(v5 + 32) = v8;

    v10 = -[NSNumber copyWithZone:](self->_privateListeningEnabled, "copyWithZone:", a3);
    v11 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v10;

    v12 = -[ICRadioContentReference copyWithZone:](self->_nowPlayingContentReference, "copyWithZone:", a3);
    v13 = *(void **)(v5 + 104);
    *(_QWORD *)(v5 + 104) = v12;

    *(_BYTE *)(v5 + 9) = self->_preservingCurrentlyPlayingItem;
    *(_QWORD *)(v5 + 40) = self->_reasonType;
    objc_storeStrong((id *)(v5 + 48), self->_requestContext);
    v14 = -[ICRadioContentReference copyWithZone:](self->_seedContentReference, "copyWithZone:", a3);
    v15 = *(void **)(v5 + 96);
    *(_QWORD *)(v5 + 96) = v14;

    *(_BYTE *)(v5 + 10) = self->_shouldResponseContainStationMetadata;
    *(_QWORD *)(v5 + 56) = self->_requestedTrackCount;
    objc_storeStrong((id *)(v5 + 80), self->_stationStringID);
    objc_storeStrong((id *)(v5 + 88), self->_stationURL);
    objc_storeStrong((id *)(v5 + 64), self->_stationHash);
    *(_QWORD *)(v5 + 72) = self->_stationID;
    v16 = -[NSArray copyWithZone:](self->_queueContentReferences, "copyWithZone:", a3);
    v17 = *(void **)(v5 + 112);
    *(_QWORD *)(v5 + 112) = v16;

  }
  return (id)v5;
}

- (NSDictionary)additionalRequestParameters
{
  if (self->_additionalRequestParameters)
    return self->_additionalRequestParameters;
  else
    return (NSDictionary *)MEMORY[0x1E0C9AA70];
}

- (void)performWithResponseHandler:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  ICRadioGetTracksRequest *v13;
  id v14;

  v5 = a3;
  -[ICRadioGetTracksRequest requestContext](self, "requestContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ICRadioGetTracksRequest.m"), 72, CFSTR("Request context must not be nil."));

  }
  +[ICURLBagProvider sharedBagProvider](ICURLBagProvider, "sharedBagProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __54__ICRadioGetTracksRequest_performWithResponseHandler___block_invoke;
  v11[3] = &unk_1E4390DA0;
  v12 = v6;
  v13 = self;
  v14 = v5;
  v8 = v5;
  v9 = v6;
  objc_msgSend(v7, "getBagForRequestContext:withCompletionHandler:", v9, v11);

}

- (void)setAdditionalRequestParameters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)allowsExplicitContent
{
  return self->_allowsExplicitContent;
}

- (void)setAllowsExplicitContent:(BOOL)a3
{
  self->_allowsExplicitContent = a3;
}

- (BOOL)isPreservingCurrentlyPlayingItem
{
  return self->_preservingCurrentlyPlayingItem;
}

- (void)setPreservingCurrentlyPlayingItem:(BOOL)a3
{
  self->_preservingCurrentlyPlayingItem = a3;
}

- (NSNumber)isPrivateListeningEnabled
{
  return self->_privateListeningEnabled;
}

- (void)setPrivateListeningEnabled:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)isDelegatedPrivateListeningEnabled
{
  return self->_delegatedPrivateListeningEnabled;
}

- (void)setDelegatedPrivateListeningEnabled:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (int64_t)reasonType
{
  return self->_reasonType;
}

- (void)setReasonType:(int64_t)a3
{
  self->_reasonType = a3;
}

- (ICStoreRequestContext)requestContext
{
  return self->_requestContext;
}

- (void)setRequestContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)shouldResponseContainStationMetadata
{
  return self->_shouldResponseContainStationMetadata;
}

- (void)setShouldResponseContainStationMetadata:(BOOL)a3
{
  self->_shouldResponseContainStationMetadata = a3;
}

- (int64_t)requestedTrackCount
{
  return self->_requestedTrackCount;
}

- (void)setRequestedTrackCount:(int64_t)a3
{
  self->_requestedTrackCount = a3;
}

- (NSString)stationHash
{
  return self->_stationHash;
}

- (void)setStationHash:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (int64_t)stationID
{
  return self->_stationID;
}

- (void)setStationID:(int64_t)a3
{
  self->_stationID = a3;
}

- (NSString)stationStringID
{
  return self->_stationStringID;
}

- (void)setStationStringID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSURL)stationURL
{
  return self->_stationURL;
}

- (void)setStationURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (ICRadioContentReference)seedContentReference
{
  return self->_seedContentReference;
}

- (void)setSeedContentReference:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (ICRadioContentReference)nowPlayingContentReference
{
  return self->_nowPlayingContentReference;
}

- (void)setNowPlayingContentReference:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSArray)queueContentReferences
{
  return self->_queueContentReferences;
}

- (void)setQueueContentReferences:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queueContentReferences, 0);
  objc_storeStrong((id *)&self->_nowPlayingContentReference, 0);
  objc_storeStrong((id *)&self->_seedContentReference, 0);
  objc_storeStrong((id *)&self->_stationURL, 0);
  objc_storeStrong((id *)&self->_stationStringID, 0);
  objc_storeStrong((id *)&self->_stationHash, 0);
  objc_storeStrong((id *)&self->_requestContext, 0);
  objc_storeStrong((id *)&self->_delegatedPrivateListeningEnabled, 0);
  objc_storeStrong((id *)&self->_privateListeningEnabled, 0);
  objc_storeStrong((id *)&self->_additionalRequestParameters, 0);
}

void __54__ICRadioGetTracksRequest_performWithResponseHandler___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  ICNetworkConstraints *v12;
  void *v13;
  ICNetworkConstraints *v14;
  void *v15;
  ICRadioURLRequest *v16;
  void *v17;
  void *v18;
  ICRadioURLRequest *v19;
  id v20;
  void (**v21)(id, _QWORD, id);
  void (**v22)(id, _QWORD, void *);
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  ICRadioURLRequest *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id location;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    v21 = (void (**)(id, _QWORD, id))a1[6];
    if (v21)
    {
      if (v6)
      {
        v21[2](a1[6], 0, v6);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7200, 0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v21[2](v21, 0, v24);

      }
    }
  }
  else
  {
    objc_msgSend(v5, "radioConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "baseURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "URLByAppendingPathComponent:isDirectory:", CFSTR("getTracks"), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v26 = v9;
      objc_msgSend(a1[4], "clientInfo");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = [ICNetworkConstraints alloc];
      v25 = v11;
      objc_msgSend(v11, "clientBundleIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[ICNetworkConstraints initWithBundleIdentifier:](v12, "initWithBundleIdentifier:", v13);

      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C92C28]), "initWithURL:", v10);
      objc_msgSend(v15, "setHTTPMethod:", CFSTR("POST"));
      objc_msgSend(v15, "setAllowsCellularAccess:", -[ICNetworkConstraints shouldAllowDataForCellularNetworkTypes](v14, "shouldAllowDataForCellularNetworkTypes"));
      v16 = -[ICRadioURLRequest initWithURLRequest:requestContext:]([ICRadioURLRequest alloc], "initWithURLRequest:requestContext:", v15, a1[4]);
      -[ICRadioURLRequest setPrivateListeningEnabled:](v16, "setPrivateListeningEnabled:", *((_QWORD *)a1[5] + 3));
      -[ICRadioURLRequest setDelegatedPrivateListeningEnabled:](v16, "setDelegatedPrivateListeningEnabled:", *((_QWORD *)a1[5] + 4));
      -[ICRadioURLRequest setProtocolVersion:](v16, "setProtocolVersion:", objc_msgSend(v8, "maxSupportedProtocolVersion"));
      -[ICURLRequest enableLoadURLMetricsWithRequestName:](v16, "enableLoadURLMetricsWithRequestName:", CFSTR("radio/getTracks"));
      objc_initWeak(&location, a1[5]);
      +[ICMusicSubscriptionStatusController sharedStatusController](ICMusicSubscriptionStatusController, "sharedStatusController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[4], "identity");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __54__ICRadioGetTracksRequest_performWithResponseHandler___block_invoke_2;
      v27[3] = &unk_1E438D038;
      v19 = v16;
      v20 = a1[5];
      v28 = v19;
      v29 = v20;
      objc_copyWeak(&v32, &location);
      v30 = v8;
      v31 = a1[6];
      objc_msgSend(v17, "getSubscriptionStatusForUserIdentity:withCompletionHandler:", v18, v27);

      objc_destroyWeak(&v32);
      objc_destroyWeak(&location);

      v9 = v26;
    }
    else
    {
      v22 = (void (**)(id, _QWORD, void *))a1[6];
      if (v22)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7201, 0);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v22[2](v22, 0, v23);

      }
    }

  }
}

void __54__ICRadioGetTracksRequest_performWithResponseHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  int8x16_t v13;
  _QWORD v14[4];
  int8x16_t v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;

  v5 = a2;
  v6 = a3;
  v7 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __54__ICRadioGetTracksRequest_performWithResponseHandler___block_invoke_3;
  v18[3] = &unk_1E438D010;
  v8 = *(void **)(a1 + 32);
  v18[4] = *(_QWORD *)(a1 + 40);
  objc_copyWeak(&v21, (id *)(a1 + 64));
  v19 = *(id *)(a1 + 48);
  v9 = v5;
  v20 = v9;
  objc_msgSend(v8, "setRadioContentDictionaryCreationBlock:", v18);
  +[ICURLSessionManager highPrioritySession](ICURLSessionManager, "highPrioritySession");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v7;
  v14[1] = 3221225472;
  v14[2] = __54__ICRadioGetTracksRequest_performWithResponseHandler___block_invoke_59;
  v14[3] = &unk_1E4390F90;
  v13 = *(int8x16_t *)(a1 + 32);
  v11 = (id)v13.i64[0];
  v15 = vextq_s8(v13, v13, 8uLL);
  v12 = v6;
  v16 = v12;
  v17 = *(id *)(a1 + 56);
  objc_msgSend(v10, "enqueueDataRequest:withCompletionHandler:", v11, v14);

  objc_destroyWeak(&v21);
}

void __54__ICRadioGetTracksRequest_performWithResponseHandler___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  id WeakRetained;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  _BOOL4 v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  unint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  const __CFString *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t i;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  NSObject *v54;
  int v55;
  void *v56;
  id v57;
  id v58;
  void *v59;
  void *v60;
  id v61;
  int v62;
  int v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  id v70;
  id v71;
  void *v72;
  id v73;
  id v74;
  id v75;
  void *v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  id v81;
  id v82;
  uint8_t buf[4];
  void *v84;
  __int16 v85;
  int v86;
  __int16 v87;
  int v88;
  __int16 v89;
  int v90;
  __int16 v91;
  id v92;
  __int16 v93;
  id v94;
  const __CFString *v95;
  void *v96;
  _BYTE v97[128];
  _QWORD v98[3];

  v98[1] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "count"))
    objc_msgSend(v10, "addEntriesFromDictionary:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v12 = objc_msgSend(*(id *)(a1 + 40), "getTracksDPInfoKBSyncCount");
  objc_msgSend(v8, "DSID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "unsignedLongLongValue");

  v75 = v7;
  v76 = WeakRetained;
  v74 = v9;
  if (v12 < 1)
  {
    v16 = 0;
  }
  else
  {
    v70 = v8;
    v15 = 0;
    v16 = 0;
    while (1)
    {
      v17 = v15;
      v81 = v15;
      v82 = 0;
      v18 = ICFairPlayCopyKeyBagSyncData(v14, 9, &v82, &v81);
      v19 = v82;
      v15 = v81;

      if (!v18)
        break;
      objc_msgSend(v19, "base64EncodedStringWithOptions:", 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v20, "length"))
      {
        if (!v16)
          v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        objc_msgSend(v16, "addObject:", v20);
      }

      if (!--v12)
        goto LABEL_16;
    }
    if (!v15)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7002, 0);
      v15 = (id)objc_claimAutoreleasedReturnValue();
    }

LABEL_16:
    v21 = v75;
    if (v15)
    {
      v22 = v9;
      (*((void (**)(id, _QWORD, id))v9 + 2))(v9, 0, v15);
      v8 = v70;
      WeakRetained = v76;
      goto LABEL_54;
    }
    v8 = v70;
    WeakRetained = v76;
  }
  if (objc_msgSend(v16, "count"))
    objc_msgSend(v10, "setObject:forKey:", v16, CFSTR("kbsyncs"));
  v23 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(WeakRetained, "stationStringID");
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = 0x1E0CB3000;
  if (!v24)
  {
    objc_msgSend(WeakRetained, "stationURL");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "absoluteString");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27)
    {
      objc_msgSend(v23, "setObject:forKey:", v27, CFSTR("url"));
LABEL_31:

      v25 = 0x1E0CB3000uLL;
      goto LABEL_32;
    }
    v28 = objc_msgSend(WeakRetained, "stationID");
    if (v28)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = CFSTR("station-id");
    }
    else
    {
      objc_msgSend(WeakRetained, "stationHash");
      v31 = objc_claimAutoreleasedReturnValue();
      v32 = WeakRetained;
      v29 = (void *)v31;
      if (!v31)
      {
        v73 = v8;
        objc_msgSend(v32, "seedContentReference");
        v64 = v23;
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "matchDictionaryWithSubscriptionStatus:", *(_QWORD *)(a1 + 48));
        v66 = (void *)objc_claimAutoreleasedReturnValue();

        v23 = v64;
        if (objc_msgSend(v66, "count"))
          objc_msgSend(v64, "setObject:forKey:", v66, CFSTR("match"));

        v8 = v73;
        goto LABEL_30;
      }
      v30 = CFSTR("station-hash");
    }
    objc_msgSend(v23, "setObject:forKey:", v29, v30);
LABEL_30:

    WeakRetained = v76;
    goto LABEL_31;
  }
  objc_msgSend(v23, "setObject:forKey:", v24, CFSTR("radio-station-id"));
LABEL_32:
  if (*(uint64_t *)(*(_QWORD *)(a1 + 32) + 56) >= 2)
  {
    objc_msgSend(*(id *)(v25 + 2024), "numberWithInteger:");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setObject:forKey:", v33, CFSTR("count"));

  }
  v34 = (void *)v24;
  objc_msgSend(*(id *)(v25 + 2024), "numberWithBool:", objc_msgSend(WeakRetained, "allowsExplicitContent") ^ 1);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setObject:forKey:", v35, CFSTR("clean"));

  v98[0] = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v98, 1);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v36, CFSTR("station-requests"));

  objc_msgSend(v10, "setObject:forKey:", &unk_1E43E6778, CFSTR("global-version"));
  v37 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(v10, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("include-metadata"));
  objc_msgSend(v10, "setObject:forKey:", v37, CFSTR("include-asset-info"));
  if (objc_msgSend(WeakRetained, "shouldResponseContainStationMetadata"))
    objc_msgSend(v10, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("include-station-dict"));
  objc_msgSend(WeakRetained, "nowPlayingContentReference");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "matchDictionaryWithSubscriptionStatus:", *(_QWORD *)(a1 + 48));
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v39, "count"))
    objc_msgSend(v10, "setObject:forKey:", v39, CFSTR("now-playing-match"));
  v69 = v39;
  v40 = objc_msgSend(WeakRetained, "reasonType");
  v41 = v34;
  v21 = v75;
  if (v40)
  {
    v42 = v40;
    if (v40 == 6)
    {
      v67 = v41;
      v68 = v23;
      v71 = v8;
      objc_msgSend(WeakRetained, "queueContentReferences");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v43, "count"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = 0u;
      v78 = 0u;
      v79 = 0u;
      v80 = 0u;
      v45 = v43;
      v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v77, v97, 16);
      if (v46)
      {
        v47 = v46;
        v48 = *(_QWORD *)v78;
        do
        {
          for (i = 0; i != v47; ++i)
          {
            if (*(_QWORD *)v78 != v48)
              objc_enumerationMutation(v45);
            objc_msgSend(*(id *)(*((_QWORD *)&v77 + 1) + 8 * i), "rawContentDictionaryWithSubscriptionStatus:", *(_QWORD *)(a1 + 48));
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v50, "count"))
              objc_msgSend(v44, "addObject:", v50);

          }
          v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v77, v97, 16);
        }
        while (v47);
      }

      v95 = CFSTR("queue");
      v96 = v44;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v96, &v95, 1);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v51, CFSTR("playback-context"));

      v21 = v75;
      WeakRetained = v76;
      v8 = v71;
      v41 = v67;
      v23 = v68;
      v25 = 0x1E0CB3000uLL;
    }
    objc_msgSend(*(id *)(v25 + 2024), "numberWithInteger:", v42);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v52, CFSTR("reason-type"));

  }
  objc_msgSend(*(id *)(v25 + 2024), "numberWithBool:", objc_msgSend(WeakRetained, "isPreservingCurrentlyPlayingItem"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v53, CFSTR("will-continue-playback"));

  v54 = os_log_create("com.apple.amp.iTunesCloud", "Default_Oversize");
  if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(WeakRetained, "isPrivateListeningEnabled");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = objc_msgSend(v72, "BOOLValue");
    objc_msgSend(v76, "isDelegatedPrivateListeningEnabled");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = v8;
    v58 = v10;
    v59 = v41;
    v60 = v21;
    v61 = v23;
    v62 = objc_msgSend(v56, "BOOLValue");
    v63 = objc_msgSend(v76, "allowsExplicitContent");
    *(_DWORD *)buf = 134219266;
    v84 = v76;
    v85 = 1024;
    v86 = v55;
    WeakRetained = v76;
    v87 = 1024;
    v88 = v62;
    v23 = v61;
    v21 = v60;
    v41 = v59;
    v10 = v58;
    v8 = v57;
    v89 = 1024;
    v90 = v63;
    v91 = 2114;
    v92 = v23;
    v93 = 2114;
    v94 = v10;
    _os_log_impl(&dword_1A03E3000, v54, OS_LOG_TYPE_DEFAULT, "<ICRadioGetTracksRequest %p> Configured ICRadioURLRequest. privateListeningEnabled=%{BOOL}u delegatedPrivateListeningEnabled=%{BOOL}u allowsExplicitContent=%{BOOL}u stationDictionary=%{public}@ contentDictionary=%{public}@", buf, 0x32u);

  }
  v22 = v74;
  (*((void (**)(id, id, _QWORD))v74 + 2))(v74, v10, 0);

  v15 = 0;
LABEL_54:

}

void __54__ICRadioGetTracksRequest_performWithResponseHandler___block_invoke_59(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  ICRadioGetTracksResponse *v14;
  uint64_t v15;
  uint64_t v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(id *)(a1 + 32);
  v8 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 40);
    v11 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 134218498;
    v18 = v9;
    v19 = 2114;
    v20 = v10;
    v21 = 2114;
    v22 = v11;
    _os_log_impl(&dword_1A03E3000, v8, OS_LOG_TYPE_DEFAULT, "<ICRadioGetTracksRequest %p> Received response for %{public}@ error=%{public}@", buf, 0x20u);
  }

  if (v5 && !v6)
  {
    v12 = objc_msgSend(v5, "statusCode");
    if (v12 < 400)
    {
      v14 = -[ICRadioResponse initWithURLResponse:]([ICRadioGetTracksResponse alloc], "initWithURLResponse:", v5);
      v13 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("ICError"), -7101, CFSTR("httpStatusCode=%ld"), v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 0;
    }
    v16 = *(_QWORD *)(a1 + 56);
    if (v16)
      (*(void (**)(uint64_t, ICRadioGetTracksResponse *, void *))(v16 + 16))(v16, v14, v13);

    goto LABEL_14;
  }
  v15 = *(_QWORD *)(a1 + 56);
  if (v15)
  {
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7102, 0);
      v14 = (ICRadioGetTracksResponse *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, ICRadioGetTracksResponse *))(v15 + 16))(v15, 0, v14);
LABEL_14:

      goto LABEL_15;
    }
    (*(void (**)(uint64_t, _QWORD, id))(v15 + 16))(v15, 0, v6);
  }
LABEL_15:

}

@end
