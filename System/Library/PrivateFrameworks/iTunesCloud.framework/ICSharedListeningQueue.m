@implementation ICSharedListeningQueue

- (ICSharedListeningQueue)initWithProtobuf:(id)a3 serverQueueContext:(id)a4 liveLink:(id)a5 playbackControlSettings:(id)a6
{
  id *v10;
  id v11;
  id v12;
  id v13;
  ICSharedListeningQueue *v14;
  ICSharedListeningQueue *v15;
  uint64_t v16;
  int v17;
  _BOOL8 v18;
  BOOL v19;
  uint64_t v20;
  NSString *serverQueueContext;
  int64_t v22;
  uint64_t v23;
  MSVSectionedCollection *tracklist;
  objc_super v26;

  v10 = (id *)a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v26.receiver = self;
  v26.super_class = (Class)ICSharedListeningQueue;
  v14 = -[ICSharedListeningQueue init](&v26, sel_init);
  v15 = v14;
  if (!v14)
    goto LABEL_10;
  objc_storeWeak((id *)&v14->_liveLink, v12);
  if (v10)
  {
    objc_storeStrong((id *)&v15->_identifier, v10[7]);
    if ((*((_BYTE *)v10 + 68) & 2) != 0)
    {
      v17 = *((_DWORD *)v10 + 11);
      v18 = v17 == 1;
      v19 = v17 == 2;
      v16 = 2;
      if (!v19)
        v16 = v18;
      goto LABEL_7;
    }
  }
  else
  {
    objc_storeStrong((id *)&v15->_identifier, 0);
  }
  v16 = 0;
LABEL_7:
  v15->_explicitContentState = v16;
  v20 = objc_msgSend(v11, "copy");
  serverQueueContext = v15->_serverQueueContext;
  v15->_serverQueueContext = (NSString *)v20;

  if (v10)
    v22 = *((int *)v10 + 16);
  else
    v22 = 0;
  v15->_serverRevision = v22;
  -[ICSharedListeningQueue _tracklistForQueueProto:](v15, "_tracklistForQueueProto:", v10);
  v23 = objc_claimAutoreleasedReturnValue();
  tracklist = v15->_tracklist;
  v15->_tracklist = (MSVSectionedCollection *)v23;

  objc_storeStrong((id *)&v15->_playbackControlSettings, a6);
LABEL_10:

  return v15;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p identifier=%@ queueContext=%@ revision=%ld> (%@)"), objc_opt_class(), self, self->_identifier, self->_serverQueueContext, self->_serverRevision, self->_tracklist);
}

- (NSArray)items
{
  return (NSArray *)-[MSVSectionedCollection allItems](self->_tracklist, "allItems");
}

- (id)containerForIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[MSVSectionedCollection allSections](self->_tracklist, "allSections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __49__ICSharedListeningQueue_containerForIdentifier___block_invoke;
  v9[3] = &unk_1E438BAF8;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "msv_firstWhere:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)hasActiveRadioStation
{
  uint64_t v3;
  BOOL v4;

  if (!_os_feature_enabled_impl())
    return 0;
  -[ICSharedListeningQueue playbackControlSettings](self, "playbackControlSettings");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3 && (*(_BYTE *)(v3 + 52) & 4) != 0 && *(_DWORD *)(v3 + 48) == 2;

  return v4;
}

- (BOOL)isAutoPlayAvailable
{
  uint64_t v3;
  void *v4;
  _BYTE *v5;
  BOOL v6;

  if (!_os_feature_enabled_impl())
    return 0;
  -[ICSharedListeningQueue playbackControlSettings](self, "playbackControlSettings");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (!v3)
  {
    v5 = 0;
    goto LABEL_9;
  }
  v5 = *(id *)(v3 + 16);
  if (!v5)
  {
LABEL_9:
    v6 = 0;
    goto LABEL_5;
  }
  v6 = v5[56] != 0;
LABEL_5:

  return v6;
}

- (BOOL)isAutoPlayEnabled
{
  uint64_t v3;
  BOOL v4;

  if (!_os_feature_enabled_impl()
    || !-[ICSharedListeningQueue isAutoPlayAvailable](self, "isAutoPlayAvailable"))
  {
    return 0;
  }
  -[ICSharedListeningQueue playbackControlSettings](self, "playbackControlSettings");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3 && (*(_BYTE *)(v3 + 52) & 4) != 0 && *(_DWORD *)(v3 + 48) == 1;

  return v4;
}

- (void)setAutoPlayEnabled:(BOOL)a3 completion:(id)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  id *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id *v15;
  id *v16;
  id *v17;
  id *v18;
  void *v19;
  id *v20;
  id *v21;
  id v22;
  void *v23;
  void *v24;
  ICSharedListeningQueue *v25;
  _BYTE *v26;
  id v27;
  uint64_t v28;
  const __CFString *v29;
  void *v30;
  void *v31;
  id *v32;
  id v33;
  void *v34;
  void *v35;
  id WeakRetained;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  BOOL v41;

  v4 = a3;
  v6 = a4;
  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    v7 = objc_opt_new();
    v8 = (id *)v7;
    if (v7)
    {
      *(_BYTE *)(v7 + 52) |= 1u;
      *(_DWORD *)(v7 + 48) = 1;
    }
    v9 = (void *)objc_opt_new();
    -[_ICLLProtocolMessage setCommand:]((uint64_t)v8, v9);

    v10 = (void *)objc_opt_new();
    if (v8)
      v11 = v8[2];
    else
      v11 = 0;
    v12 = v11;
    v13 = v10;
    if (v12)
    {
      -[_ICLLCommandMessage clearOneofValuesForCommand]((uint64_t)v12);
      *((_BYTE *)v12 + 104) |= 1u;
      *((_DWORD *)v12 + 6) = 6;
      objc_storeStrong((id *)v12 + 8, v10);
    }

    v14 = (void *)objc_opt_new();
    if (v8 && (v15 = (id *)v8[2]) != 0)
    {
      v16 = v15;
      v17 = (id *)v15[8];
      v18 = v17;
      if (v17)
        objc_storeStrong(v17 + 1, v14);
    }
    else
    {
      v18 = 0;
      v16 = 0;
    }

    if (v4)
    {
      v19 = (void *)objc_opt_new();
      if (v8 && (v20 = (id *)v8[2]) != 0)
      {
        v21 = v20;
        v22 = v20[8];
        v23 = v22;
        if (v22)
        {
          v24 = (void *)*((_QWORD *)v22 + 1);
          goto LABEL_17;
        }
      }
      else
      {
        v23 = 0;
        v21 = 0;
      }
      v24 = 0;
LABEL_17:
      v25 = self;
      v26 = v24;
      v27 = v19;
      if (v26)
      {
        -[_ICLLPlaybackControlSettings clearOneofValuesForTrackGenerationSource]((uint64_t)v26);
        v26[52] |= 4u;
        *((_DWORD *)v26 + 12) = 1;
        v28 = 8;
LABEL_28:
        v27 = v27;
        v35 = *(void **)&v26[v28];
        *(_QWORD *)&v26[v28] = v27;

        goto LABEL_29;
      }
      goto LABEL_29;
    }
    v31 = (void *)objc_opt_new();
    if (v8 && (v32 = (id *)v8[2]) != 0)
    {
      v21 = v32;
      v33 = v32[8];
      v23 = v33;
      if (v33)
      {
        v34 = (void *)*((_QWORD *)v33 + 1);
        goto LABEL_26;
      }
    }
    else
    {
      v23 = 0;
      v21 = 0;
    }
    v34 = 0;
LABEL_26:
    v25 = self;
    v26 = v34;
    v27 = v31;
    if (v26)
    {
      -[_ICLLPlaybackControlSettings clearOneofValuesForTrackGenerationSource]((uint64_t)v26);
      v26[52] |= 4u;
      *((_DWORD *)v26 + 12) = 3;
      v28 = 24;
      goto LABEL_28;
    }
LABEL_29:

    WeakRetained = objc_loadWeakRetained((id *)&v25->_liveLink);
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __56__ICSharedListeningQueue_setAutoPlayEnabled_completion___block_invoke;
    v38[3] = &unk_1E438BB20;
    v39 = WeakRetained;
    v40 = v6;
    v41 = v4;
    v37 = WeakRetained;
    objc_msgSend(v37, "sendMessage:completion:", v8, v38);

    goto LABEL_30;
  }
  v29 = CFSTR("OFF");
  if (v4)
    v29 = CFSTR("ON");
  objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("ICLiveLinkErrorDomain"), 0, CFSTR("Failed to turn AutoPlay %@, Feature not enabled"), v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *))v6 + 2))(v6, v30);

LABEL_30:
}

- (id)itemForIdentifier:(id)a3
{
  return -[ICSharedListeningQueue _itemForIdentifier:outIndexPath:](self, "_itemForIdentifier:outIndexPath:", a3, 0);
}

- (void)replaceTracklist:(id)a3 preferredStartIndexPath:(id)a4 completion:(id)a5
{
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id *v15;
  void *v16;
  _BYTE *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  NSString *serverQueueContext;
  id *v23;
  id *v24;
  id *v25;
  id *v26;
  int serverRevision;
  id *v28;
  id *v29;
  _BYTE *v30;
  void *v31;
  id *v32;
  id *v33;
  id *v34;
  id *v35;
  id *v36;
  id *v37;
  id *v38;
  id *v39;
  id *v40;
  id WeakRetained;
  NSObject *v42;
  id v43;
  id v44;
  NSObject *v45;
  void *v46;
  void *v47;
  id v48;
  id obj;
  id v50;
  _QWORD v51[5];
  id v52;
  id v53;
  id v54;
  _QWORD v55[4];
  id *v56;
  _QWORD v57[5];
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  char v61;
  uint8_t buf[4];
  ICSharedListeningQueue *v63;
  __int16 v64;
  id v65;
  __int16 v66;
  id v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v50 = a4;
  v48 = a5;
  v58 = 0;
  v59 = &v58;
  v60 = 0x2020000000;
  v61 = 0;
  v57[0] = MEMORY[0x1E0C809B0];
  v57[1] = 3221225472;
  v57[2] = __78__ICSharedListeningQueue_replaceTracklist_preferredStartIndexPath_completion___block_invoke;
  v57[3] = &unk_1E438BB48;
  v57[4] = &v58;
  -[ICSharedListeningQueue _detectTrackGenerationSourceForTracklist:detectedCompletion:](self, "_detectTrackGenerationSourceForTracklist:detectedCompletion:", v9, v57);
  if (objc_msgSend(v9, "totalItemCount") || *((_BYTE *)v59 + 24))
  {
    v10 = v50;
    if (v50)
    {
      v11 = objc_msgSend(v50, "msv_section");
      if (v11 >= objc_msgSend(v9, "numberOfSections"))
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ICLiveLink.m"), 1932, CFSTR("preferredStartIndexPath section out of bounds (%ld/%ld)"), objc_msgSend(v50, "msv_section"), objc_msgSend(v9, "numberOfSections"));

        v10 = v50;
      }
      v12 = objc_msgSend(v10, "msv_item");
      if (v12 >= objc_msgSend(v9, "numberOfItemsInSection:", objc_msgSend(v10, "msv_section")))
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ICLiveLink.m"), 1933, CFSTR("preferredStartIndexPath item out of bounds (%ld/%ld)"), objc_msgSend(v10, "msv_item"), objc_msgSend(v9, "numberOfItemsInSection:", objc_msgSend(v10, "msv_section")));

        v10 = v50;
      }
      objc_msgSend(v9, "itemAtIndexPath:", v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "identifier");
      obj = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      obj = 0;
    }
    v14 = objc_opt_new();
    v15 = (id *)v14;
    if (v14)
    {
      *(_BYTE *)(v14 + 52) |= 1u;
      *(_DWORD *)(v14 + 48) = 1;
    }
    v16 = (void *)objc_opt_new();
    -[_ICLLProtocolMessage setCommand:]((uint64_t)v15, v16);

    if (v15)
    {
      v17 = v15[2];
      if (v17)
      {
        v17[104] |= 1u;
        *((_DWORD *)v17 + 6) = 9;
      }
    }
    else
    {
      v17 = 0;
    }

    v18 = (void *)objc_opt_new();
    if (v15)
      v19 = v15[2];
    else
      v19 = 0;
    v20 = v19;
    v21 = v18;
    if (v20)
    {
      -[_ICLLCommandMessage clearOneofValuesForCommand]((uint64_t)v20);
      *((_BYTE *)v20 + 104) |= 1u;
      *((_DWORD *)v20 + 6) = 9;
      objc_storeStrong((id *)v20 + 12, v18);
    }

    if (v15 && (serverQueueContext = self->_serverQueueContext, (v23 = (id *)v15[2]) != 0))
    {
      v24 = v23;
      v25 = (id *)v23[12];
      v26 = v25;
      if (v25)
        objc_storeStrong(v25 + 4, serverQueueContext);

    }
    else if (!v15)
    {
      goto LABEL_45;
    }
    serverRevision = self->_serverRevision;
    v28 = (id *)v15[2];
    if (v28)
    {
      v29 = v28;
      v30 = v28[12];
      if (v30)
      {
        v30[56] |= 1u;
        *((_DWORD *)v30 + 12) = serverRevision;
      }
LABEL_27:

      -[ICSharedListeningQueue _playbackItemProtosForTracklist:withPreferredStartItemIndexPath:](self, "_playbackItemProtosForTracklist:withPreferredStartItemIndexPath:", v9, v50);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15 && (v32 = (id *)v15[2]) != 0)
      {
        v33 = v32;
        v34 = (id *)v32[12];
        v35 = v34;
        if (v34)
          objc_storeStrong(v34 + 2, v31);

      }
      else
      {

        if (!v15)
          goto LABEL_47;
      }
      v36 = (id *)v15[2];
      if (v36)
      {
        v37 = v36;
        v38 = (id *)v36[12];
        v39 = v38;
        if (v38)
          objc_storeStrong(v38 + 3, obj);
        goto LABEL_35;
      }
LABEL_47:
      v39 = 0;
      v37 = 0;
LABEL_35:

      v55[0] = MEMORY[0x1E0C809B0];
      v55[1] = 3221225472;
      v55[2] = __78__ICSharedListeningQueue_replaceTracklist_preferredStartIndexPath_completion___block_invoke_523;
      v55[3] = &unk_1E438BB70;
      v40 = v15;
      v56 = v40;
      -[ICSharedListeningQueue _detectTrackGenerationSourceForTracklist:detectedCompletion:](self, "_detectTrackGenerationSourceForTracklist:detectedCompletion:", v9, v55);
      WeakRetained = objc_loadWeakRetained((id *)&self->_liveLink);
      v42 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218498;
        v63 = self;
        v64 = 2114;
        v65 = obj;
        v66 = 2114;
        v67 = v9;
        _os_log_impl(&dword_1A03E3000, v42, OS_LOG_TYPE_DEFAULT, "ILL %p: [replaceTracklist] preferredStartItemID=%{public}@ tracklist=%{public}@", buf, 0x20u);
      }

      v51[0] = MEMORY[0x1E0C809B0];
      v51[1] = 3221225472;
      v51[2] = __78__ICSharedListeningQueue_replaceTracklist_preferredStartIndexPath_completion___block_invoke_524;
      v51[3] = &unk_1E438BB98;
      v51[4] = self;
      v43 = WeakRetained;
      v52 = v43;
      v54 = v48;
      v44 = obj;
      v53 = v44;
      objc_msgSend(v43, "sendMessage:completion:", v40, v51);

      goto LABEL_38;
    }
LABEL_45:
    v30 = 0;
    v29 = 0;
    goto LABEL_27;
  }
  v45 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v63 = self;
    _os_log_impl(&dword_1A03E3000, v45, OS_LOG_TYPE_DEFAULT, "ILL %p: replaceTracklist completing immediately [tracklist.totalItemCount = 0, hasRadioTrackGenerationSource = NO]", buf, 0xCu);
  }

  (*((void (**)(id, _QWORD))v48 + 2))(v48, 0);
LABEL_38:
  _Block_object_dispose(&v58, 8);

}

- (void)addMediaIdentifiers:(id)a3 afterItemIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  ICSharedListeningQueue *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    v8 = v6;
    if ((unint64_t)objc_msgSend(v8, "count") >= 0x7D1)
    {
      v9 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218496;
        v25 = self;
        v26 = 2048;
        v27 = objc_msgSend(v8, "count");
        v28 = 1024;
        v29 = 2000;
        _os_log_impl(&dword_1A03E3000, v9, OS_LOG_TYPE_DEFAULT, "ILL %p: addMediaIdentifiers:afterItemIdentifier: trimming from %ld to %d items.", buf, 0x1Cu);
      }

      objc_msgSend(v8, "subarrayWithRange:", 0, 2000);
      v10 = objc_claimAutoreleasedReturnValue();

      v8 = (id)v10;
    }
    v11 = objc_alloc_init(MEMORY[0x1E0D4D0A0]);
    +[ICSharedListeningContainer groupWithFeatureName:](ICSharedListeningContainer, "groupWithFeatureName:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "appendSection:", v12);

    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v13 = v8;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v20;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v20 != v16)
            objc_enumerationMutation(v13);
          +[ICSharedListeningItem itemWithMediaIdentifier:](ICSharedListeningItem, "itemWithMediaIdentifier:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v17), (_QWORD)v19);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "appendItem:", v18);

          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v15);
    }

    -[ICSharedListeningQueue insertTracklist:afterItemIdentifier:completion:](self, "insertTracklist:afterItemIdentifier:completion:", v11, v7, 0);
  }

}

- (void)insertTracklist:(id)a3 afterItemIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a3;
  +[ICSharedTracklistPosition specifiedPositionAfterItemIdentifier:](ICSharedTracklistPosition, "specifiedPositionAfterItemIdentifier:", a4);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[ICSharedListeningQueue insertTracklist:atPosition:completion:](self, "insertTracklist:atPosition:completion:", v9, v10, v8);

}

- (void)insertTracklist:(id)a3 atPosition:(id)a4 completion:(id)a5
{
  id *v5;
  id v10;
  id v11;
  id v12;
  void *v13;
  _QWORD *v14;
  void *v15;
  _QWORD v16[4];
  id v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v12;
  if (v11)
  {
    if (v12)
    {
LABEL_3:
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __64__ICSharedListeningQueue_insertTracklist_atPosition_completion___block_invoke;
      v16[3] = &unk_1E438D448;
      v14 = v16;
      v5 = &v17;
      v17 = v13;
      goto LABEL_6;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (id *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ICLiveLink.m"), 2046, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("position"));

    if (v13)
      goto LABEL_3;
  }
  v14 = 0;
LABEL_6:
  v15 = (void *)MEMORY[0x1A1AFA8D0](v14);
  -[ICSharedListeningQueue insertTracklist:atPosition:completionEx:](self, "insertTracklist:atPosition:completionEx:", v10, v11, v15);

  if (v13)
}

- (void)insertTracklist:(id)a3 atPosition:(id)a4 completionEx:(id)a5
{
  id v9;
  id v10;
  uint64_t v11;
  id *v12;
  void *v13;
  _BYTE *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  int v20;
  int v21;
  id *v22;
  id *v23;
  _BYTE *v24;
  void *v25;
  int v26;
  int v27;
  id *v28;
  id *v29;
  _BYTE *v30;
  NSString *serverQueueContext;
  id *v32;
  id *v33;
  id *v34;
  id *v35;
  int serverRevision;
  id *v37;
  id *v38;
  _BYTE *v39;
  void *v40;
  id *v41;
  id *v42;
  id *v43;
  id *v44;
  id *v45;
  id WeakRetained;
  id v47;
  NSObject *v48;
  void *v49;
  id v50;
  void *v51;
  _QWORD v52[5];
  id v53;
  id v54;
  _QWORD v55[4];
  id *v56;
  _QWORD v57[5];
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  char v61;
  uint8_t buf[4];
  ICSharedListeningQueue *v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v50 = a5;
  v51 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ICLiveLink.m"), 2054, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("position"));

  }
  v58 = 0;
  v59 = &v58;
  v60 = 0x2020000000;
  v61 = 0;
  v57[0] = MEMORY[0x1E0C809B0];
  v57[1] = 3221225472;
  v57[2] = __66__ICSharedListeningQueue_insertTracklist_atPosition_completionEx___block_invoke;
  v57[3] = &unk_1E438BB48;
  v57[4] = &v58;
  -[ICSharedListeningQueue _detectTrackGenerationSourceForTracklist:detectedCompletion:](self, "_detectTrackGenerationSourceForTracklist:detectedCompletion:", v9, v57);
  if (objc_msgSend(v9, "totalItemCount") || *((_BYTE *)v59 + 24))
  {
    v11 = objc_opt_new();
    v12 = (id *)v11;
    if (v11)
    {
      *(_BYTE *)(v11 + 52) |= 1u;
      *(_DWORD *)(v11 + 48) = 1;
    }
    v13 = (void *)objc_opt_new();
    -[_ICLLProtocolMessage setCommand:]((uint64_t)v12, v13);

    if (v12)
    {
      v14 = v12[2];
      if (v14)
      {
        v14[104] |= 1u;
        *((_DWORD *)v14 + 6) = 2;
      }
    }
    else
    {
      v14 = 0;
    }

    v15 = (void *)objc_opt_new();
    if (v12)
      v16 = v12[2];
    else
      v16 = 0;
    v17 = v16;
    v18 = v15;
    if (v17)
    {
      -[_ICLLCommandMessage clearOneofValuesForCommand]((uint64_t)v17);
      *((_BYTE *)v17 + 104) |= 1u;
      *((_DWORD *)v17 + 6) = 2;
      objc_storeStrong((id *)v17 + 1, v15);
    }

    v19 = objc_msgSend(v10, "type");
    if (v19 == 1)
      v20 = 2;
    else
      v20 = 1;
    if (v19 == 2)
      v21 = 3;
    else
      v21 = v20;
    if (v12 && (v22 = (id *)v12[2]) != 0)
    {
      v23 = v22;
      v24 = v22[1];
      if (v24)
      {
        v24[52] |= 1u;
        *((_DWORD *)v24 + 2) = v21;
      }
    }
    else
    {
      v24 = 0;
      v23 = 0;
    }

    objc_msgSend(v51, "afterItemIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[ICSharedListeningQueue _afterItemPositionForItemIdentifier:](self, "_afterItemPositionForItemIdentifier:", v25);
    if (v12 && (v27 = v26, (v28 = (id *)v12[2]) != 0))
    {
      v29 = v28;
      v30 = v28[1];
      if (v30)
      {
        v30[52] |= 2u;
        *((_DWORD *)v30 + 6) = v27;
      }
    }
    else
    {
      v30 = 0;
      v29 = 0;
    }

    if (v12 && (serverQueueContext = self->_serverQueueContext, (v32 = (id *)v12[2]) != 0))
    {
      v33 = v32;
      v34 = (id *)v32[1];
      v35 = v34;
      if (v34)
        objc_storeStrong(v34 + 4, serverQueueContext);

    }
    else if (!v12)
    {
      goto LABEL_50;
    }
    serverRevision = self->_serverRevision;
    v37 = (id *)v12[2];
    if (v37)
    {
      v38 = v37;
      v39 = v37[1];
      if (v39)
      {
        v39[52] |= 4u;
        *((_DWORD *)v39 + 12) = serverRevision;
      }
      goto LABEL_36;
    }
LABEL_50:
    v39 = 0;
    v38 = 0;
LABEL_36:

    -[ICSharedListeningQueue _playbackItemProtosForTracklist:withPreferredStartItemIndexPath:](self, "_playbackItemProtosForTracklist:withPreferredStartItemIndexPath:", v9, 0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12 && (v41 = (id *)v12[2]) != 0)
    {
      v42 = v41;
      v43 = (id *)v41[1];
      v44 = v43;
      if (v43)
        objc_storeStrong(v43 + 2, v40);
    }
    else
    {
      v44 = 0;
      v42 = 0;
    }

    v55[0] = MEMORY[0x1E0C809B0];
    v55[1] = 3221225472;
    v55[2] = __66__ICSharedListeningQueue_insertTracklist_atPosition_completionEx___block_invoke_538;
    v55[3] = &unk_1E438BB70;
    v45 = v12;
    v56 = v45;
    -[ICSharedListeningQueue _detectTrackGenerationSourceForTracklist:detectedCompletion:](self, "_detectTrackGenerationSourceForTracklist:detectedCompletion:", v9, v55);
    WeakRetained = objc_loadWeakRetained((id *)&self->_liveLink);
    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = __66__ICSharedListeningQueue_insertTracklist_atPosition_completionEx___block_invoke_2;
    v52[3] = &unk_1E438BBC0;
    v52[4] = self;
    v47 = WeakRetained;
    v53 = v47;
    v54 = v50;
    objc_msgSend(v47, "sendMessage:completion:", v45, v52);

    goto LABEL_41;
  }
  v48 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v63 = self;
    _os_log_impl(&dword_1A03E3000, v48, OS_LOG_TYPE_DEFAULT, "ILL %p: insertTracklist completing immediately [tracklist.totalItemCount = 0, hasRadioTrackGenerationSource = NO]", buf, 0xCu);
  }

  (*((void (**)(id, _QWORD, _QWORD))v50 + 2))(v50, 0, 0);
LABEL_41:
  _Block_object_dispose(&v58, 8);

}

- (void)insertTracklist:(id)a3 afterItemIdentifier:(id)a4 playNowWithPreferredStartIndexPath:(id)a5 completion:(id)a6
{
  id *v6;
  id v11;
  void *v12;
  _QWORD *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  _QWORD v18[4];
  id v19;

  v11 = a6;
  v12 = v11;
  if (v11)
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __108__ICSharedListeningQueue_insertTracklist_afterItemIdentifier_playNowWithPreferredStartIndexPath_completion___block_invoke;
    v18[3] = &unk_1E438D448;
    v13 = v18;
    v6 = &v19;
    v19 = v11;
  }
  else
  {
    v13 = 0;
  }
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = (void *)MEMORY[0x1A1AFA8D0](v13);
  -[ICSharedListeningQueue insertTracklist:afterItemIdentifier:playNowWithPreferredStartIndexPath:completionEx:](self, "insertTracklist:afterItemIdentifier:playNowWithPreferredStartIndexPath:completionEx:", v16, v15, v14, v17);

  if (v12)
}

- (void)insertTracklist:(id)a3 afterItemIdentifier:(id)a4 playNowWithPreferredStartIndexPath:(id)a5 completionEx:(id)a6
{
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id *v17;
  void *v18;
  _BYTE *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  int v24;
  int v25;
  id *v26;
  id *v27;
  _BYTE *v28;
  NSString *serverQueueContext;
  id *v30;
  id *v31;
  id *v32;
  id *v33;
  int serverRevision;
  id *v35;
  id *v36;
  _BYTE *v37;
  void *v38;
  id *v39;
  id *v40;
  id *v41;
  id *v42;
  id *v43;
  id *v44;
  id *v45;
  id *v46;
  id *v47;
  id WeakRetained;
  id v49;
  id v50;
  NSObject *v51;
  void *v52;
  void *v53;
  id obj;
  id v55;
  id v56;
  id v57;
  _QWORD v58[5];
  id v59;
  id v60;
  id v61;
  _QWORD v62[4];
  id *v63;
  _QWORD v64[5];
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  char v68;
  uint8_t buf[4];
  ICSharedListeningQueue *v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v55 = a4;
  v57 = a5;
  v56 = a6;
  v65 = 0;
  v66 = &v65;
  v67 = 0x2020000000;
  v68 = 0;
  v64[0] = MEMORY[0x1E0C809B0];
  v64[1] = 3221225472;
  v64[2] = __110__ICSharedListeningQueue_insertTracklist_afterItemIdentifier_playNowWithPreferredStartIndexPath_completionEx___block_invoke;
  v64[3] = &unk_1E438BB48;
  v64[4] = &v65;
  -[ICSharedListeningQueue _detectTrackGenerationSourceForTracklist:detectedCompletion:](self, "_detectTrackGenerationSourceForTracklist:detectedCompletion:", v11, v64);
  if (objc_msgSend(v11, "totalItemCount") || *((_BYTE *)v66 + 24))
  {
    v12 = v57;
    if (v57)
    {
      v13 = objc_msgSend(v57, "msv_section");
      if (v13 >= objc_msgSend(v11, "numberOfSections"))
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ICLiveLink.m"), 2160, CFSTR("preferredStartIndexPath section out of bounds (%ld/%ld)"), objc_msgSend(v57, "msv_section"), objc_msgSend(v11, "numberOfSections"));

        v12 = v57;
      }
      v14 = objc_msgSend(v12, "msv_item");
      if (v14 >= objc_msgSend(v11, "numberOfItemsInSection:", objc_msgSend(v12, "msv_section")))
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ICLiveLink.m"), 2161, CFSTR("preferredStartIndexPath item out of bounds (%ld/%ld)"), objc_msgSend(v12, "msv_item"), objc_msgSend(v11, "numberOfItemsInSection:", objc_msgSend(v12, "msv_section")));

        v12 = v57;
      }
      objc_msgSend(v11, "itemAtIndexPath:", v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "identifier");
      obj = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      obj = 0;
    }
    v16 = objc_opt_new();
    v17 = (id *)v16;
    if (v16)
    {
      *(_BYTE *)(v16 + 52) |= 1u;
      *(_DWORD *)(v16 + 48) = 1;
    }
    v18 = (void *)objc_opt_new();
    -[_ICLLProtocolMessage setCommand:]((uint64_t)v17, v18);

    if (v17)
    {
      v19 = v17[2];
      if (v19)
      {
        v19[104] |= 1u;
        *((_DWORD *)v19 + 6) = 10;
      }
    }
    else
    {
      v19 = 0;
    }

    v20 = (void *)objc_opt_new();
    if (v17)
      v21 = v17[2];
    else
      v21 = 0;
    v22 = v21;
    v23 = v20;
    if (v22)
    {
      -[_ICLLCommandMessage clearOneofValuesForCommand]((uint64_t)v22);
      *((_BYTE *)v22 + 104) |= 1u;
      *((_DWORD *)v22 + 6) = 10;
      objc_storeStrong((id *)v22 + 7, v20);
    }

    v24 = -[ICSharedListeningQueue _afterItemPositionForItemIdentifier:](self, "_afterItemPositionForItemIdentifier:", v55);
    if (v17 && (v25 = v24, (v26 = (id *)v17[2]) != 0))
    {
      v27 = v26;
      v28 = v26[7];
      if (v28)
      {
        v28[52] |= 1u;
        *((_DWORD *)v28 + 4) = v25;
      }

    }
    else if (!v17)
    {
      goto LABEL_47;
    }
    serverQueueContext = self->_serverQueueContext;
    v30 = (id *)v17[2];
    if (v30)
    {
      v31 = v30;
      v32 = (id *)v30[7];
      v33 = v32;
      if (v32)
        objc_storeStrong(v32 + 4, serverQueueContext);

LABEL_28:
      serverRevision = self->_serverRevision;
      v35 = (id *)v17[2];
      if (v35)
      {
        v36 = v35;
        v37 = v35[7];
        if (v37)
        {
          v37[52] |= 2u;
          *((_DWORD *)v37 + 12) = serverRevision;
        }
LABEL_31:

        -[ICSharedListeningQueue _playbackItemProtosForTracklist:withPreferredStartItemIndexPath:](self, "_playbackItemProtosForTracklist:withPreferredStartItemIndexPath:", v11, v57);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17 && (v39 = (id *)v17[2]) != 0)
        {
          v40 = v39;
          v41 = (id *)v39[7];
          v42 = v41;
          if (v41)
            objc_storeStrong(v41 + 1, v38);

        }
        else
        {

          if (!v17)
            goto LABEL_50;
        }
        v43 = (id *)v17[2];
        if (v43)
        {
          v44 = v43;
          v45 = (id *)v43[7];
          v46 = v45;
          if (v45)
            objc_storeStrong(v45 + 3, obj);
          goto LABEL_39;
        }
LABEL_50:
        v46 = 0;
        v44 = 0;
LABEL_39:

        v62[0] = MEMORY[0x1E0C809B0];
        v62[1] = 3221225472;
        v62[2] = __110__ICSharedListeningQueue_insertTracklist_afterItemIdentifier_playNowWithPreferredStartIndexPath_completionEx___block_invoke_546;
        v62[3] = &unk_1E438BB70;
        v47 = v17;
        v63 = v47;
        -[ICSharedListeningQueue _detectTrackGenerationSourceForTracklist:detectedCompletion:](self, "_detectTrackGenerationSourceForTracklist:detectedCompletion:", v11, v62);
        WeakRetained = objc_loadWeakRetained((id *)&self->_liveLink);
        v58[0] = MEMORY[0x1E0C809B0];
        v58[1] = 3221225472;
        v58[2] = __110__ICSharedListeningQueue_insertTracklist_afterItemIdentifier_playNowWithPreferredStartIndexPath_completionEx___block_invoke_2;
        v58[3] = &unk_1E438BB98;
        v58[4] = self;
        v49 = WeakRetained;
        v59 = v49;
        v61 = v56;
        v50 = obj;
        v60 = v50;
        objc_msgSend(v49, "sendMessage:completion:", v47, v58);

        goto LABEL_40;
      }
LABEL_48:
      v37 = 0;
      v36 = 0;
      goto LABEL_31;
    }
LABEL_47:
    if (!v17)
      goto LABEL_48;
    goto LABEL_28;
  }
  v51 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
  if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v70 = self;
    _os_log_impl(&dword_1A03E3000, v51, OS_LOG_TYPE_DEFAULT, "ILL %p: insertTracklistPlayNow completing immediately [tracklist.totalItemCount = 0, hasRadioTrackGenerationSource = NO]", buf, 0xCu);
  }

  (*((void (**)(id, _QWORD, _QWORD))v56 + 2))(v56, 0, 0);
LABEL_40:
  _Block_object_dispose(&v65, 8);

}

- (void)removeItemIdentifier:(id)a3
{
  id v4;
  uint64_t v5;
  id *v6;
  void *v7;
  _BYTE *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  NSString *serverQueueContext;
  id v16;
  void *v17;
  void *v18;
  id v19;
  int serverRevision;
  id *v21;
  id *v22;
  _BYTE *v23;
  id WeakRetained;
  id v25;
  void *v26;
  _QWORD v27[5];
  id v28;

  v4 = a3;
  v5 = objc_opt_new();
  v6 = (id *)v5;
  if (v5)
  {
    *(_BYTE *)(v5 + 52) |= 1u;
    *(_DWORD *)(v5 + 48) = 1;
    v7 = (void *)objc_opt_new();
    -[_ICLLProtocolMessage setCommand:]((uint64_t)v6, v7);

    v8 = v6[2];
    if (v8)
    {
      v8[104] |= 1u;
      *((_DWORD *)v8 + 6) = 3;
    }
  }
  else
  {
    v26 = (void *)objc_opt_new();
    -[_ICLLProtocolMessage setCommand:](0, v26);

    v8 = 0;
  }

  v9 = (void *)objc_opt_new();
  if (v6)
  {
    v10 = v6[2];
    -[_ICLLCommandMessage setRemoveItem:]((uint64_t)v10, v9);

    v11 = v6[2];
    v12 = v11;
    if (v11)
    {
      v13 = (void *)*((_QWORD *)v11 + 11);
      goto LABEL_7;
    }
  }
  else
  {
    -[_ICLLCommandMessage setRemoveItem:](0, v9);

    v12 = 0;
  }
  v13 = 0;
LABEL_7:
  v14 = v13;
  -[_ICLLRemoveQueueItemCommand setItemId:]((uint64_t)v14, v4);

  serverQueueContext = self->_serverQueueContext;
  if (!v6)
  {
    v17 = 0;
    goto LABEL_19;
  }
  v16 = v6[2];
  v17 = v16;
  if (!v16)
  {
LABEL_19:
    v18 = 0;
    goto LABEL_10;
  }
  v18 = (void *)*((_QWORD *)v16 + 11);
LABEL_10:
  v19 = v18;
  -[_ICLLRemoveQueueItemCommand setQueueContext:]((uint64_t)v19, serverQueueContext);

  if (v6 && (serverRevision = self->_serverRevision, (v21 = (id *)v6[2]) != 0))
  {
    v22 = v21;
    v23 = v21[11];
    if (v23)
    {
      v23[40] |= 2u;
      *((_DWORD *)v23 + 9) = serverRevision;
    }
  }
  else
  {
    v23 = 0;
    v22 = 0;
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_liveLink);
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __47__ICSharedListeningQueue_removeItemIdentifier___block_invoke;
  v27[3] = &unk_1E438BBE8;
  v27[4] = self;
  v28 = WeakRetained;
  v25 = WeakRetained;
  objc_msgSend(v25, "sendMessage:completion:", v6, v27);

}

- (void)removeItemIdentifiers:(id)a3
{
  id v4;
  uint64_t v5;
  id *v6;
  void *v7;
  _BYTE *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id *v13;
  id *v14;
  id *v15;
  id *v16;
  id *v17;
  id *v18;
  _BYTE *v19;
  NSString *serverQueueContext;
  id v21;
  void *v22;
  void *v23;
  id v24;
  int serverRevision;
  id *v26;
  id *v27;
  _BYTE *v28;
  id WeakRetained;
  id v30;
  void *v31;
  _QWORD v32[4];
  id v33;

  v4 = a3;
  v5 = objc_opt_new();
  v6 = (id *)v5;
  if (v5)
  {
    *(_BYTE *)(v5 + 52) |= 1u;
    *(_DWORD *)(v5 + 48) = 1;
    v7 = (void *)objc_opt_new();
    -[_ICLLProtocolMessage setCommand:]((uint64_t)v6, v7);

    v8 = v6[2];
    if (v8)
    {
      v8[104] |= 1u;
      *((_DWORD *)v8 + 6) = 3;
    }
  }
  else
  {
    v31 = (void *)objc_opt_new();
    -[_ICLLProtocolMessage setCommand:](0, v31);

    v8 = 0;
  }

  v9 = (void *)objc_opt_new();
  if (v6)
    v10 = v6[2];
  else
    v10 = 0;
  v11 = v10;
  -[_ICLLCommandMessage setRemoveItem:]((uint64_t)v11, v9);

  v12 = (void *)objc_msgSend(v4, "mutableCopy");
  if (v6 && (v13 = (id *)v6[2]) != 0)
  {
    v14 = v13;
    v15 = (id *)v13[11];
    v16 = v15;
    if (v15)
      objc_storeStrong(v15 + 2, v12);

  }
  else
  {

    if (!v6)
      goto LABEL_25;
  }
  v17 = (id *)v6[2];
  if (v17)
  {
    v18 = v17;
    v19 = v17[11];
    if (v19)
    {
      v19[40] |= 1u;
      *((_DWORD *)v19 + 8) = 4;
    }

    serverQueueContext = self->_serverQueueContext;
    goto LABEL_15;
  }
LABEL_25:
  serverQueueContext = self->_serverQueueContext;
  if (!v6)
  {
    v22 = 0;
    goto LABEL_27;
  }
LABEL_15:
  v21 = v6[2];
  v22 = v21;
  if (!v21)
  {
LABEL_27:
    v23 = 0;
    goto LABEL_17;
  }
  v23 = (void *)*((_QWORD *)v21 + 11);
LABEL_17:
  v24 = v23;
  -[_ICLLRemoveQueueItemCommand setQueueContext:]((uint64_t)v24, serverQueueContext);

  if (v6 && (serverRevision = self->_serverRevision, (v26 = (id *)v6[2]) != 0))
  {
    v27 = v26;
    v28 = v26[11];
    if (v28)
    {
      v28[40] |= 2u;
      *((_DWORD *)v28 + 9) = serverRevision;
    }
  }
  else
  {
    v28 = 0;
    v27 = 0;
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_liveLink);
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __48__ICSharedListeningQueue_removeItemIdentifiers___block_invoke;
  v32[3] = &unk_1E438BC10;
  v33 = WeakRetained;
  v30 = WeakRetained;
  objc_msgSend(v30, "sendMessage:completion:", v6, v32);

}

- (void)removeAllItemIdentifiersAfterItemIdentifier:(id)a3
{
  id v4;
  uint64_t v5;
  id *v6;
  void *v7;
  _BYTE *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id *v15;
  id *v16;
  _BYTE *v17;
  NSString *serverQueueContext;
  id v19;
  void *v20;
  void *v21;
  id v22;
  int serverRevision;
  id *v24;
  id *v25;
  _BYTE *v26;
  id WeakRetained;
  id v28;
  void *v29;
  _QWORD v30[4];
  id v31;

  v4 = a3;
  v5 = objc_opt_new();
  v6 = (id *)v5;
  if (v5)
  {
    *(_BYTE *)(v5 + 52) |= 1u;
    *(_DWORD *)(v5 + 48) = 1;
    v7 = (void *)objc_opt_new();
    -[_ICLLProtocolMessage setCommand:]((uint64_t)v6, v7);

    v8 = v6[2];
    if (v8)
    {
      v8[104] |= 1u;
      *((_DWORD *)v8 + 6) = 3;
    }
  }
  else
  {
    v29 = (void *)objc_opt_new();
    -[_ICLLProtocolMessage setCommand:](0, v29);

    v8 = 0;
  }

  v9 = (void *)objc_opt_new();
  if (!v6)
  {
    -[_ICLLCommandMessage setRemoveItem:](0, v9);

    v12 = 0;
    goto LABEL_21;
  }
  v10 = v6[2];
  -[_ICLLCommandMessage setRemoveItem:]((uint64_t)v10, v9);

  v11 = v6[2];
  v12 = v11;
  if (!v11)
  {
LABEL_21:
    v13 = 0;
    goto LABEL_7;
  }
  v13 = (void *)*((_QWORD *)v11 + 11);
LABEL_7:
  v14 = v13;
  -[_ICLLRemoveQueueItemCommand setItemId:]((uint64_t)v14, v4);

  if (v6 && (v15 = (id *)v6[2]) != 0)
  {
    v16 = v15;
    v17 = v15[11];
    if (v17)
    {
      v17[40] |= 1u;
      *((_DWORD *)v17 + 8) = 2;
    }

    serverQueueContext = self->_serverQueueContext;
  }
  else
  {
    serverQueueContext = self->_serverQueueContext;
    if (!v6)
    {
      v20 = 0;
      goto LABEL_24;
    }
  }
  v19 = v6[2];
  v20 = v19;
  if (!v19)
  {
LABEL_24:
    v21 = 0;
    goto LABEL_14;
  }
  v21 = (void *)*((_QWORD *)v19 + 11);
LABEL_14:
  v22 = v21;
  -[_ICLLRemoveQueueItemCommand setQueueContext:]((uint64_t)v22, serverQueueContext);

  if (v6 && (serverRevision = self->_serverRevision, (v24 = (id *)v6[2]) != 0))
  {
    v25 = v24;
    v26 = v24[11];
    if (v26)
    {
      v26[40] |= 2u;
      *((_DWORD *)v26 + 9) = serverRevision;
    }
  }
  else
  {
    v26 = 0;
    v25 = 0;
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_liveLink);
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __70__ICSharedListeningQueue_removeAllItemIdentifiersAfterItemIdentifier___block_invoke;
  v30[3] = &unk_1E438BC10;
  v31 = WeakRetained;
  v28 = WeakRetained;
  objc_msgSend(v28, "sendMessage:completion:", v6, v30);

}

- (void)moveItemIdentifier:(id)a3 beforeItemIdentifier:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  int v15;
  void *v16;
  uint64_t v17;
  id *v18;
  void *v19;
  _BYTE *v20;
  void *v21;
  id v22;
  id v23;
  NSString *serverQueueContext;
  id v25;
  void *v26;
  void *v27;
  id v28;
  int serverRevision;
  id *v30;
  id *v31;
  _BYTE *v32;
  id *v33;
  id *v34;
  _BYTE *v35;
  id v36;
  void *v37;
  void *v38;
  id v39;
  id WeakRetained;
  id v41;
  void *v42;
  void *v43;
  _QWORD v44[5];
  id v45;
  id v46;
  id v47;

  v7 = a3;
  v8 = a4;
  v47 = 0;
  v9 = -[ICSharedListeningQueue _itemForIdentifier:outIndexPath:](self, "_itemForIdentifier:outIndexPath:", v7, &v47);
  v10 = v47;
  v11 = -[MSVSectionedCollection globalIndexForIndexPath:](self->_tracklist, "globalIndexForIndexPath:", v10);
  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ICLiveLink.m"), 2337, CFSTR("Could not find item to move: %@"), v7);

    if (v8)
      goto LABEL_3;
LABEL_7:
    v15 = -[MSVSectionedCollection totalItemCount](self->_tracklist, "totalItemCount") - 1;
    goto LABEL_8;
  }
  if (!v8)
    goto LABEL_7;
LABEL_3:
  v46 = 0;
  v12 = -[ICSharedListeningQueue _itemForIdentifier:outIndexPath:](self, "_itemForIdentifier:outIndexPath:", v8, &v46);
  v13 = v46;
  v14 = -[MSVSectionedCollection globalIndexForIndexPath:](self->_tracklist, "globalIndexForIndexPath:", v13);
  if (v14 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ICLiveLink.m"), 2364, CFSTR("Could not find item to insert after: %@"), v8);

  }
  v15 = v14 - (v14 > v11);

LABEL_8:
  v17 = objc_opt_new();
  v18 = (id *)v17;
  if (v17)
  {
    *(_BYTE *)(v17 + 52) |= 1u;
    *(_DWORD *)(v17 + 48) = 1;
    v19 = (void *)objc_opt_new();
    -[_ICLLProtocolMessage setCommand:]((uint64_t)v18, v19);

    v20 = v18[2];
    if (v20)
    {
      v20[104] |= 1u;
      *((_DWORD *)v20 + 6) = 4;
    }
  }
  else
  {
    v43 = (void *)objc_opt_new();
    -[_ICLLProtocolMessage setCommand:](0, v43);

    v20 = 0;
  }

  v21 = (void *)objc_opt_new();
  if (v18)
    v22 = v18[2];
  else
    v22 = 0;
  v23 = v22;
  -[_ICLLCommandMessage setMoveItem:]((uint64_t)v23, v21);

  serverQueueContext = self->_serverQueueContext;
  if (!v18)
  {
    v26 = 0;
    goto LABEL_31;
  }
  v25 = v18[2];
  v26 = v25;
  if (!v25)
  {
LABEL_31:
    v27 = 0;
    goto LABEL_16;
  }
  v27 = (void *)*((_QWORD *)v25 + 6);
LABEL_16:
  v28 = v27;
  -[_ICLLMoveQueueItemCommand setQueueContext:]((uint64_t)v28, serverQueueContext);

  if (v18 && (serverRevision = self->_serverRevision, (v30 = (id *)v18[2]) != 0))
  {
    v31 = v30;
    v32 = v30[6];
    if (v32)
    {
      v32[36] |= 2u;
      *((_DWORD *)v32 + 8) = serverRevision;
    }

  }
  else if (!v18)
  {
    goto LABEL_33;
  }
  v33 = (id *)v18[2];
  if (v33)
  {
    v34 = v33;
    v35 = v33[6];
    if (v35)
    {
      v35[36] |= 1u;
      *((_DWORD *)v35 + 4) = v15;
    }

    goto LABEL_25;
  }
LABEL_33:
  if (!v18)
  {
    v37 = 0;
    goto LABEL_35;
  }
LABEL_25:
  v36 = v18[2];
  v37 = v36;
  if (!v36)
  {
LABEL_35:
    v38 = 0;
    goto LABEL_27;
  }
  v38 = (void *)*((_QWORD *)v36 + 6);
LABEL_27:
  v39 = v38;
  -[_ICLLMoveQueueItemCommand setItemId:]((uint64_t)v39, v7);

  WeakRetained = objc_loadWeakRetained((id *)&self->_liveLink);
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __66__ICSharedListeningQueue_moveItemIdentifier_beforeItemIdentifier___block_invoke;
  v44[3] = &unk_1E438BBE8;
  v44[4] = self;
  v45 = WeakRetained;
  v41 = WeakRetained;
  objc_msgSend(v41, "sendMessage:completion:", v18, v44);

}

- (void)moveItemIdentifier:(id)a3 afterItemIdentifier:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  int v15;
  void *v16;
  uint64_t v17;
  id *v18;
  void *v19;
  _BYTE *v20;
  void *v21;
  id v22;
  id v23;
  NSString *serverQueueContext;
  id v25;
  void *v26;
  void *v27;
  id v28;
  int serverRevision;
  id *v30;
  id *v31;
  _BYTE *v32;
  id *v33;
  id *v34;
  _BYTE *v35;
  id v36;
  void *v37;
  void *v38;
  id v39;
  id WeakRetained;
  id v41;
  void *v42;
  void *v43;
  _QWORD v44[5];
  id v45;
  id v46;
  id v47;

  v7 = a3;
  v8 = a4;
  v47 = 0;
  v9 = -[ICSharedListeningQueue _itemForIdentifier:outIndexPath:](self, "_itemForIdentifier:outIndexPath:", v7, &v47);
  v10 = v47;
  v11 = -[MSVSectionedCollection globalIndexForIndexPath:](self->_tracklist, "globalIndexForIndexPath:", v10);
  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ICLiveLink.m"), 2410, CFSTR("Could not find item to move: %@"), v7);

    if (v8)
      goto LABEL_3;
LABEL_10:
    v15 = 0;
    goto LABEL_11;
  }
  if (!v8)
    goto LABEL_10;
LABEL_3:
  v46 = 0;
  v12 = -[ICSharedListeningQueue _itemForIdentifier:outIndexPath:](self, "_itemForIdentifier:outIndexPath:", v8, &v46);
  v13 = v46;
  v14 = -[MSVSectionedCollection globalIndexForIndexPath:](self->_tracklist, "globalIndexForIndexPath:", v13);
  if (v14 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ICLiveLink.m"), 2437, CFSTR("Could not find item to insert after: %@"), v8);

  }
  if (v14 >= v11)
    v15 = v14;
  else
    v15 = v14 + 1;

LABEL_11:
  v17 = objc_opt_new();
  v18 = (id *)v17;
  if (v17)
  {
    *(_BYTE *)(v17 + 52) |= 1u;
    *(_DWORD *)(v17 + 48) = 1;
    v19 = (void *)objc_opt_new();
    -[_ICLLProtocolMessage setCommand:]((uint64_t)v18, v19);

    v20 = v18[2];
    if (v20)
    {
      v20[104] |= 1u;
      *((_DWORD *)v20 + 6) = 4;
    }
  }
  else
  {
    v43 = (void *)objc_opt_new();
    -[_ICLLProtocolMessage setCommand:](0, v43);

    v20 = 0;
  }

  v21 = (void *)objc_opt_new();
  if (v18)
    v22 = v18[2];
  else
    v22 = 0;
  v23 = v22;
  -[_ICLLCommandMessage setMoveItem:]((uint64_t)v23, v21);

  serverQueueContext = self->_serverQueueContext;
  if (!v18)
  {
    v26 = 0;
    goto LABEL_34;
  }
  v25 = v18[2];
  v26 = v25;
  if (!v25)
  {
LABEL_34:
    v27 = 0;
    goto LABEL_19;
  }
  v27 = (void *)*((_QWORD *)v25 + 6);
LABEL_19:
  v28 = v27;
  -[_ICLLMoveQueueItemCommand setQueueContext:]((uint64_t)v28, serverQueueContext);

  if (v18 && (serverRevision = self->_serverRevision, (v30 = (id *)v18[2]) != 0))
  {
    v31 = v30;
    v32 = v30[6];
    if (v32)
    {
      v32[36] |= 2u;
      *((_DWORD *)v32 + 8) = serverRevision;
    }

  }
  else if (!v18)
  {
    goto LABEL_36;
  }
  v33 = (id *)v18[2];
  if (v33)
  {
    v34 = v33;
    v35 = v33[6];
    if (v35)
    {
      v35[36] |= 1u;
      *((_DWORD *)v35 + 4) = v15;
    }

    goto LABEL_28;
  }
LABEL_36:
  if (!v18)
  {
    v37 = 0;
    goto LABEL_38;
  }
LABEL_28:
  v36 = v18[2];
  v37 = v36;
  if (!v36)
  {
LABEL_38:
    v38 = 0;
    goto LABEL_30;
  }
  v38 = (void *)*((_QWORD *)v36 + 6);
LABEL_30:
  v39 = v38;
  -[_ICLLMoveQueueItemCommand setItemId:]((uint64_t)v39, v7);

  WeakRetained = objc_loadWeakRetained((id *)&self->_liveLink);
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __65__ICSharedListeningQueue_moveItemIdentifier_afterItemIdentifier___block_invoke;
  v44[3] = &unk_1E438BBE8;
  v44[4] = self;
  v45 = WeakRetained;
  v41 = WeakRetained;
  objc_msgSend(v41, "sendMessage:completion:", v18, v44);

}

- (void)getExpectedCurrentItemWithCompletion:(id)a3
{
  id v4;
  id WeakRetained;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_liveLink);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__ICSharedListeningQueue_getExpectedCurrentItemWithCompletion___block_invoke;
  v7[3] = &unk_1E438BC38;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(WeakRetained, "fetchPlaybackSyncStateWithCompletion:", v7);

}

- (int64_t)_afterItemPositionForItemIdentifier:(id)a3
{
  id v5;
  id v6;
  id v7;
  void *v8;
  int64_t v9;
  void *v10;
  id v12;

  v5 = a3;
  if (v5)
  {
    v12 = 0;
    v6 = -[ICSharedListeningQueue _itemForIdentifier:outIndexPath:](self, "_itemForIdentifier:outIndexPath:", v5, &v12);
    v7 = v12;
    if (!v7
      || (v8 = v7,
          v9 = -[MSVSectionedCollection globalIndexForIndexPath:](self->_tracklist, "globalIndexForIndexPath:", v7) + 1,
          v8,
          v9 == 0x7FFFFFFFFFFFFFFFLL))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ICLiveLink.m"), 2517, CFSTR("Could not find item to insert after: %@"), v5);

      v9 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_itemForIdentifier:(id)a3 outIndexPath:(id *)a4
{
  id v6;
  MSVSectionedCollection *tracklist;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v6 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__11071;
  v25 = __Block_byref_object_dispose__11072;
  v26 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__11071;
  v19 = __Block_byref_object_dispose__11072;
  v20 = 0;
  tracklist = self->_tracklist;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __58__ICSharedListeningQueue__itemForIdentifier_outIndexPath___block_invoke;
  v11[3] = &unk_1E438BC60;
  v8 = v6;
  v12 = v8;
  v13 = &v21;
  v14 = &v15;
  -[MSVSectionedCollection enumerateItemsUsingBlock:](tracklist, "enumerateItemsUsingBlock:", v11);
  if (a4)
    *a4 = objc_retainAutorelease((id)v16[5]);
  v9 = (id)v22[5];

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v9;
}

- (id)_playbackItemProtosForTracklist:(id)a3 withPreferredStartItemIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, void *, uint64_t);
  void *v26;
  id v27;
  id v28;
  id v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD v33[4];
  uint8_t buf[4];
  ICSharedListeningQueue *v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  int v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  uint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "msv_section");
  v9 = objc_msgSend(v7, "msv_item");
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x2020000000;
  v33[3] = -1;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "totalItemCount"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = MEMORY[0x1E0C809B0];
  v24 = 3221225472;
  v25 = __90__ICSharedListeningQueue__playbackItemProtosForTracklist_withPreferredStartItemIndexPath___block_invoke;
  v26 = &unk_1E438BCB0;
  v11 = v6;
  v27 = v11;
  v12 = v7;
  v31 = v8;
  v32 = v9;
  v28 = v12;
  v30 = v33;
  v13 = v10;
  v29 = v13;
  objc_msgSend(v11, "enumerateSectionsUsingBlock:", &v23);
  v14 = v13;
  v15 = v14;
  if ((unint64_t)objc_msgSend(v14, "count", v23, v24, v25, v26) >= 0x7D1)
  {
    if (v9 > 99)
    {
      v18 = objc_msgSend(v14, "count") + ~v9;
      if (v18 >= 1900)
        v18 = 1900;
      v19 = 1999 - v18;
      if (v19 <= 99)
        v19 = 99;
      v17 = v9 - v19;
      objc_msgSend(v14, "subarrayWithRange:", v17, 2000);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v16, "mutableCopy");
    }
    else
    {
      objc_msgSend(v14, "subarrayWithRange:", 0, 2000);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v16, "mutableCopy");
      v17 = 0;
    }

    v20 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = objc_msgSend(v14, "count");
      *(_DWORD *)buf = 134219008;
      v35 = self;
      v36 = 2048;
      v37 = v21;
      v38 = 1024;
      v39 = 2000;
      v40 = 2048;
      v41 = v17;
      v42 = 2048;
      v43 = v17 + 2000;
      _os_log_impl(&dword_1A03E3000, v20, OS_LOG_TYPE_DEFAULT, "ILL %p: _playbackItemProtosForTracklist: trimming from %ld to %d items. Taking items from indices %ld to %ld.", buf, 0x30u);
    }

  }
  _Block_object_dispose(v33, 8);

  return v15;
}

- (void)_detectTrackGenerationSourceForTracklist:(id)a3 detectedCompletion:(id)a4
{
  id v5;
  void (**v6)(id, uint64_t, uint64_t);
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v5 = a3;
  v6 = (void (**)(id, uint64_t, uint64_t))a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__11071;
  v18 = __Block_byref_object_dispose__11072;
  v19 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__11071;
  v12 = __Block_byref_object_dispose__11072;
  v13 = 0;
  if (_os_feature_enabled_impl())
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __86__ICSharedListeningQueue__detectTrackGenerationSourceForTracklist_detectedCompletion___block_invoke;
    v7[3] = &unk_1E438BCD8;
    v7[4] = &v14;
    v7[5] = &v8;
    objc_msgSend(v5, "reverseEnumerateSectionsUsingBlock:", v7);
  }
  v6[2](v6, v15[5], v9[5]);
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
}

- (id)_tracklistForQueueProto:(id)a3
{
  _QWORD *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  ICSharedListeningItem *v11;
  id WeakRetained;
  void *v13;
  uint64_t v14;
  void *v15;
  ICSharedListeningItem *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  char v22;
  ICSharedListeningContainer *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v30;
  id obj;
  uint64_t v32;
  id *location;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0D4D0A0]);
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  if (v4)
    v6 = (void *)v4[6];
  else
    v6 = 0;
  obj = v6;
  v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  v30 = v4;
  v7 = 0;
  if (v34)
  {
    v32 = *(_QWORD *)v36;
    location = (id *)&self->_liveLink;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v36 != v32)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v8);
        v10 = (void *)MEMORY[0x1A1AFA708]();
        v11 = [ICSharedListeningItem alloc];
        WeakRetained = objc_loadWeakRetained(location);
        v13 = WeakRetained;
        if (v9)
          v14 = *(_QWORD *)(v9 + 8);
        else
          v14 = 0;
        objc_msgSend(WeakRetained, "_participantForParticipantID:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = -[ICSharedListeningItem initWithProtobuf:identity:](v11, "initWithProtobuf:identity:", v9, v15);

        objc_msgSend(v7, "identifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          v18 = *(id *)(v9 + 16);
          v19 = v18;
          if (v18)
          {
            v20 = (void *)*((_QWORD *)v18 + 1);
            goto LABEL_13;
          }
        }
        else
        {
          v19 = 0;
        }
        v20 = 0;
LABEL_13:
        v21 = v20;
        v22 = objc_msgSend(v17, "isEqual:", v21);

        if ((v22 & 1) == 0)
        {
          v23 = [ICSharedListeningContainer alloc];
          if (v9)
            v24 = *(void **)(v9 + 16);
          else
            v24 = 0;
          v25 = v24;
          v26 = -[ICSharedListeningContainer initWithProtobuf:](v23, "initWithProtobuf:", v25);

          objc_msgSend(v5, "appendSection:", v26);
          v7 = (void *)v26;
        }
        objc_msgSend(v5, "appendItem:", v16);

        objc_autoreleasePoolPop(v10);
        ++v8;
      }
      while (v34 != v8);
      v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      v34 = v27;
    }
    while (v27);
  }

  v28 = (void *)objc_msgSend(v5, "copy");
  return v28;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (int64_t)explicitContentState
{
  return self->_explicitContentState;
}

- (MSVSectionedCollection)tracklist
{
  return self->_tracklist;
}

- (ICLiveLink)liveLink
{
  return (ICLiveLink *)objc_loadWeakRetained((id *)&self->_liveLink);
}

- (void)setLiveLink:(id)a3
{
  objc_storeWeak((id *)&self->_liveLink, a3);
}

- (int64_t)serverRevision
{
  return self->_serverRevision;
}

- (NSString)serverQueueContext
{
  return self->_serverQueueContext;
}

- (_ICLLPlaybackControlSettings)playbackControlSettings
{
  return self->_playbackControlSettings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playbackControlSettings, 0);
  objc_storeStrong((id *)&self->_serverQueueContext, 0);
  objc_destroyWeak((id *)&self->_liveLink);
  objc_storeStrong((id *)&self->_tracklist, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

void __86__ICSharedListeningQueue__detectTrackGenerationSourceForTracklist_detectedCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  id *v21;
  id *v22;
  id v23;

  v23 = a2;
  if (objc_msgSend(v23, "kind") == 2)
  {
    v6 = objc_opt_new();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    objc_msgSend(v23, "featureName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    if (v10)
      objc_storeStrong((id *)(v10 + 8), v9);

    objc_msgSend(v23, "mediaIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v23, "mediaIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
      if (v13)
        objc_storeStrong((id *)(v13 + 24), v12);
    }
    else
    {
      objc_msgSend(v23, "seedItem");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v16)
      {
LABEL_17:
        *a4 = 1;
        goto LABEL_18;
      }
      v17 = (void *)objc_opt_new();
      v18 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
      if (v18)
        objc_storeStrong((id *)(v18 + 16), v17);

      objc_msgSend(v23, "seedItem");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "mediaIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
      if (v20)
      {
        v21 = (id *)*(id *)(v20 + 16);
        v22 = v21;
        if (v21)
          objc_storeStrong(v21 + 1, v19);
      }
      else
      {
        v22 = 0;
      }

    }
LABEL_16:

    goto LABEL_17;
  }
  if (objc_msgSend(v23, "kind") == 5)
  {
    v14 = objc_opt_new();
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v12 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v14;
    goto LABEL_16;
  }
LABEL_18:

}

void __90__ICSharedListeningQueue__playbackItemProtosForTracklist_withPreferredStartItemIndexPath___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  _ICLLPlaybackItemContainer *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _ICLLPlaybackItemContainer *v13;
  __int128 v14;
  id v15;
  _QWORD v16[4];
  _ICLLPlaybackItemContainer *v17;
  id v18;
  __int128 v19;
  uint64_t v20;
  __int128 v21;

  v15 = a2;
  v5 = objc_alloc_init(_ICLLPlaybackItemContainer);
  objc_msgSend(v15, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_storeStrong((id *)&v5->_containerId, v6);

  v7 = objc_msgSend(v15, "kind");
  if ((unint64_t)(v7 - 1) > 4)
    v8 = 0;
  else
    v8 = dword_1A06E7438[v7 - 1];
  if (v5)
  {
    *(_BYTE *)&v5->_has |= 1u;
    v5->_type = v8;
    objc_msgSend(v15, "mediaIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v5->_mediaId, v9);
  }
  else
  {
    objc_msgSend(v15, "mediaIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(v15, "featureName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_storeStrong((id *)&v5->_featureName, v10);

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __90__ICSharedListeningQueue__playbackItemProtosForTracklist_withPreferredStartItemIndexPath___block_invoke_2;
  v16[3] = &unk_1E438BC88;
  v17 = v5;
  v11 = *(void **)(a1 + 32);
  v18 = *(id *)(a1 + 40);
  v20 = a3;
  v14 = *(_OWORD *)(a1 + 48);
  v21 = *(_OWORD *)(a1 + 64);
  v12 = (id)v14;
  v19 = v14;
  v13 = v5;
  objc_msgSend(v11, "enumerateItemsInSectionAtIndex:usingBlock:", a3, v16);

}

void __90__ICSharedListeningQueue__playbackItemProtosForTracklist_withPreferredStartItemIndexPath___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *container;
  _ICLLPlaybackItemContainer *v7;
  void *v8;
  _ICLLPlaybackItem *v9;

  v5 = a2;
  v9 = objc_alloc_init(_ICLLPlaybackItem);
  objc_msgSend(v5, "identifier");
  container = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_storeStrong((id *)&v9->_itemId, container);

    v7 = (_ICLLPlaybackItemContainer *)*(id *)(a1 + 32);
    container = v9->_container;
    v9->_container = v7;
  }

  objc_msgSend(v5, "mediaIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    objc_storeStrong((id *)&v9->_mediaId, v8);

  if (*(_QWORD *)(a1 + 40) && *(_QWORD *)(a1 + 64) == *(_QWORD *)(a1 + 72) && *(_QWORD *)(a1 + 80) == a3)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(a1 + 48), "count");
  objc_msgSend(*(id *)(a1 + 48), "addObject:", v9);

}

void __58__ICSharedListeningQueue__itemForIdentifier_outIndexPath___block_invoke(_QWORD *a1, void *a2, void *a3, _BYTE *a4)
{
  id v8;
  void *v9;
  int v10;
  id v11;

  v11 = a2;
  v8 = a3;
  objc_msgSend(v11, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", a1[4]);

  if (v10)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a2);
    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a3);
    *a4 = 1;
  }

}

void __63__ICSharedListeningQueue_getExpectedCurrentItemWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void (*v8)(void);
  NSObject *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  NSObject *v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0);
    return;
  }
  if (a2)
    v4 = *(void **)(a2 + 8);
  else
    v4 = 0;
  v5 = v4;
  if (!objc_msgSend(v5, "length"))
  {
    v9 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v15 = 134217984;
      v16 = v10;
      _os_log_impl(&dword_1A03E3000, v9, OS_LOG_TYPE_DEFAULT, "ILL %p: getExpectedCurrentItemWithCompletion returning nil [currentItemID not in PlaybackSyncState]", (uint8_t *)&v15, 0xCu);
    }

    v11 = (void *)MEMORY[0x1E0CB35C8];
    v12 = CFSTR("received no currentItemID in response");
    goto LABEL_14;
  }
  objc_msgSend(*(id *)(a1 + 32), "itemForIdentifier:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v13 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = *(_QWORD *)(a1 + 32);
      v15 = 134217984;
      v16 = v14;
      _os_log_impl(&dword_1A03E3000, v13, OS_LOG_TYPE_DEFAULT, "ILL %p: getExpectedCurrentItemWithCompletion returning nil [currentItemID not in queue]", (uint8_t *)&v15, 0xCu);
    }

    v11 = (void *)MEMORY[0x1E0CB35C8];
    v12 = CFSTR("currentItemID from the response is not in queue");
LABEL_14:
    objc_msgSend(v11, "msv_errorWithDomain:code:debugDescription:", CFSTR("ICLiveLinkErrorDomain"), 5, v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    goto LABEL_15;
  }
  v7 = (void *)v6;
  v8 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
LABEL_15:
  v8();

}

void __65__ICSharedListeningQueue_moveItemIdentifier_afterItemIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  id *v11;
  id *v12;
  _QWORD *v13;
  uint64_t v14;
  id *v15;
  id *v16;
  id v17;
  void *v18;
  void *v19;
  id *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  int v26;
  uint64_t v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v26 = 134218242;
      v27 = v8;
      v28 = 2114;
      v29 = v6;
      _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_ERROR, "ILL %p: [moveItemAfter] Received requestError=%{public}@", (uint8_t *)&v26, 0x16u);
    }

    v9 = *(void **)(a1 + 40);
    v10 = CFSTR("UpdateAfterRequestError");
    goto LABEL_5;
  }
  if (!v5 || (v11 = (id *)v5[1]) == 0)
  {
    v12 = 0;
    goto LABEL_18;
  }
  v12 = v11;
  v13 = v11[8];
  if (!v13)
  {
LABEL_18:

    goto LABEL_19;
  }
  v14 = v13[3];

  if (!v14)
  {
LABEL_19:
    v9 = *(void **)(a1 + 40);
    v10 = CFSTR("UpdateAfterMoveItemAfter");
LABEL_5:
    objc_msgSend(v9, "_updateQueueWithReason:completion:", v10, 0);
    goto LABEL_16;
  }
  v15 = (id *)v5[1];
  v16 = v15;
  if (!v15)
  {
    v18 = 0;
    goto LABEL_21;
  }
  v17 = v15[8];
  v18 = v17;
  if (!v17)
  {
LABEL_21:
    v19 = 0;
    goto LABEL_13;
  }
  v19 = (void *)*((_QWORD *)v17 + 3);
LABEL_13:
  v20 = v19;

  v21 = *(void **)(a1 + 40);
  if (v20)
  {
    v22 = v20[2];
    v23 = v20[1];
    v24 = v20[3];
  }
  else
  {
    v23 = 0;
    v22 = 0;
    v24 = 0;
  }
  v25 = v24;
  objc_msgSend(v21, "_handleUpdatedQueue:playbackControlSettings:serverQueueContext:", v22, v23, v25);

LABEL_16:
}

void __66__ICSharedListeningQueue_moveItemIdentifier_beforeItemIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  id *v11;
  id *v12;
  _QWORD *v13;
  uint64_t v14;
  id *v15;
  id *v16;
  id v17;
  void *v18;
  void *v19;
  id *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  int v26;
  uint64_t v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v26 = 134218242;
      v27 = v8;
      v28 = 2114;
      v29 = v6;
      _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_ERROR, "ILL %p: [moveItemBefore] Received requestError=%{public}@", (uint8_t *)&v26, 0x16u);
    }

    v9 = *(void **)(a1 + 40);
    v10 = CFSTR("UpdateAfterRequestError");
    goto LABEL_5;
  }
  if (!v5 || (v11 = (id *)v5[1]) == 0)
  {
    v12 = 0;
    goto LABEL_18;
  }
  v12 = v11;
  v13 = v11[8];
  if (!v13)
  {
LABEL_18:

    goto LABEL_19;
  }
  v14 = v13[3];

  if (!v14)
  {
LABEL_19:
    v9 = *(void **)(a1 + 40);
    v10 = CFSTR("UpdateAfterMoveItemBefore");
LABEL_5:
    objc_msgSend(v9, "_updateQueueWithReason:completion:", v10, 0);
    goto LABEL_16;
  }
  v15 = (id *)v5[1];
  v16 = v15;
  if (!v15)
  {
    v18 = 0;
    goto LABEL_21;
  }
  v17 = v15[8];
  v18 = v17;
  if (!v17)
  {
LABEL_21:
    v19 = 0;
    goto LABEL_13;
  }
  v19 = (void *)*((_QWORD *)v17 + 3);
LABEL_13:
  v20 = v19;

  v21 = *(void **)(a1 + 40);
  if (v20)
  {
    v22 = v20[2];
    v23 = v20[1];
    v24 = v20[3];
  }
  else
  {
    v23 = 0;
    v22 = 0;
    v24 = 0;
  }
  v25 = v24;
  objc_msgSend(v21, "_handleUpdatedQueue:playbackControlSettings:serverQueueContext:", v22, v23, v25);

LABEL_16:
}

void __70__ICSharedListeningQueue_removeAllItemIdentifiersAfterItemIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id *v5;
  id *v6;
  id *v7;
  _QWORD *v8;
  uint64_t v9;
  id *v10;
  id *v11;
  id v12;
  void *v13;
  void *v14;
  id *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id *v21;

  v5 = a2;
  if (!a3)
  {
    v21 = v5;
    if (v5 && (v6 = (id *)v5[1]) != 0)
    {
      v7 = v6;
      v8 = v6[15];
      if (v8)
      {
        v9 = v8[2];

        if (v9)
        {
          v10 = (id *)v21[1];
          v11 = v10;
          if (v10)
          {
            v12 = v10[15];
            v13 = v12;
            if (v12)
            {
              v14 = (void *)*((_QWORD *)v12 + 2);
LABEL_9:
              v15 = v14;

              v16 = *(void **)(a1 + 32);
              if (v15)
              {
                v17 = v15[2];
                v18 = v15[1];
                v19 = v15[3];
              }
              else
              {
                v18 = 0;
                v17 = 0;
                v19 = 0;
              }
              v20 = v19;
              objc_msgSend(v16, "_handleUpdatedQueue:playbackControlSettings:serverQueueContext:", v17, v18, v20);

              goto LABEL_15;
            }
          }
          else
          {
            v13 = 0;
          }
          v14 = 0;
          goto LABEL_9;
        }
LABEL_14:
        objc_msgSend(*(id *)(a1 + 32), "_updateQueueWithReason:completion:", CFSTR("UpdateAfterRemoveAllItemsAfterItem"), 0);
LABEL_15:
        v5 = v21;
        goto LABEL_16;
      }
    }
    else
    {
      v7 = 0;
    }

    goto LABEL_14;
  }
LABEL_16:

}

void __48__ICSharedListeningQueue_removeItemIdentifiers___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id *v5;
  id *v6;
  id *v7;
  _QWORD *v8;
  uint64_t v9;
  id *v10;
  id *v11;
  id v12;
  void *v13;
  void *v14;
  id *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id *v21;

  v5 = a2;
  if (!a3)
  {
    v21 = v5;
    if (v5 && (v6 = (id *)v5[1]) != 0)
    {
      v7 = v6;
      v8 = v6[15];
      if (v8)
      {
        v9 = v8[2];

        if (v9)
        {
          v10 = (id *)v21[1];
          v11 = v10;
          if (v10)
          {
            v12 = v10[15];
            v13 = v12;
            if (v12)
            {
              v14 = (void *)*((_QWORD *)v12 + 2);
LABEL_9:
              v15 = v14;

              v16 = *(void **)(a1 + 32);
              if (v15)
              {
                v17 = v15[2];
                v18 = v15[1];
                v19 = v15[3];
              }
              else
              {
                v18 = 0;
                v17 = 0;
                v19 = 0;
              }
              v20 = v19;
              objc_msgSend(v16, "_handleUpdatedQueue:playbackControlSettings:serverQueueContext:", v17, v18, v20);

              goto LABEL_15;
            }
          }
          else
          {
            v13 = 0;
          }
          v14 = 0;
          goto LABEL_9;
        }
LABEL_14:
        objc_msgSend(*(id *)(a1 + 32), "_updateQueueWithReason:completion:", CFSTR("UpdateAfterRemoveItems [bulk]"), 0);
LABEL_15:
        v5 = v21;
        goto LABEL_16;
      }
    }
    else
    {
      v7 = 0;
    }

    goto LABEL_14;
  }
LABEL_16:

}

void __47__ICSharedListeningQueue_removeItemIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  id *v11;
  id *v12;
  _QWORD *v13;
  uint64_t v14;
  id *v15;
  id *v16;
  id v17;
  void *v18;
  void *v19;
  id *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  int v26;
  uint64_t v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v26 = 134218242;
      v27 = v8;
      v28 = 2114;
      v29 = v6;
      _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_ERROR, "ILL %p: [removeItem] Received requestError=%{public}@", (uint8_t *)&v26, 0x16u);
    }

    v9 = *(void **)(a1 + 40);
    v10 = CFSTR("UpdateAfterRequestError");
    goto LABEL_5;
  }
  if (!v5 || (v11 = (id *)v5[1]) == 0)
  {
    v12 = 0;
    goto LABEL_18;
  }
  v12 = v11;
  v13 = v11[15];
  if (!v13)
  {
LABEL_18:

    goto LABEL_19;
  }
  v14 = v13[2];

  if (!v14)
  {
LABEL_19:
    v9 = *(void **)(a1 + 40);
    v10 = CFSTR("UpdateAfterRemoveItem");
LABEL_5:
    objc_msgSend(v9, "_updateQueueWithReason:completion:", v10, 0);
    goto LABEL_16;
  }
  v15 = (id *)v5[1];
  v16 = v15;
  if (!v15)
  {
    v18 = 0;
    goto LABEL_21;
  }
  v17 = v15[15];
  v18 = v17;
  if (!v17)
  {
LABEL_21:
    v19 = 0;
    goto LABEL_13;
  }
  v19 = (void *)*((_QWORD *)v17 + 2);
LABEL_13:
  v20 = v19;

  v21 = *(void **)(a1 + 40);
  if (v20)
  {
    v22 = v20[2];
    v23 = v20[1];
    v24 = v20[3];
  }
  else
  {
    v23 = 0;
    v22 = 0;
    v24 = 0;
  }
  v25 = v24;
  objc_msgSend(v21, "_handleUpdatedQueue:playbackControlSettings:serverQueueContext:", v22, v23, v25);

LABEL_16:
}

uint64_t __110__ICSharedListeningQueue_insertTracklist_afterItemIdentifier_playNowWithPreferredStartIndexPath_completionEx___block_invoke(uint64_t result, uint64_t a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2 != 0;
  return result;
}

void __110__ICSharedListeningQueue_insertTracklist_afterItemIdentifier_playNowWithPreferredStartIndexPath_completionEx___block_invoke_546(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  id *v5;
  id *v6;
  id *v7;
  id *v8;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  if (v3 && (v5 = (id *)*(id *)(v3 + 16)) != 0)
  {
    v8 = v5;
    v6 = (id *)v5[7];
    v7 = v6;
    if (v6)
      objc_storeStrong(v6 + 5, a2);
  }
  else
  {
    v7 = 0;
    v8 = 0;
  }

}

void __110__ICSharedListeningQueue_insertTracklist_afterItemIdentifier_playNowWithPreferredStartIndexPath_completionEx___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id *v10;
  id *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  id *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  NSObject *v25;
  id *v26;
  id v27;
  id *v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  id *v36;
  id *v37;
  _QWORD *v38;
  uint64_t v39;
  id *v40;
  id *v41;
  id v42;
  void *v43;
  void *v44;
  id *v45;
  void *v46;
  id v47;
  id v48;
  id v49;
  id v50;
  void *v51;
  void *v52;
  void (**v53)(_QWORD, _QWORD);
  _QWORD v54[4];
  id *v55;
  _QWORD v56[4];
  id v57;
  id v58;
  NSObject *v59;
  _QWORD block[4];
  void *v61;
  id v62;
  _QWORD v63[4];
  id v64;
  id *v65;
  uint64_t v66;
  void *v67;
  uint8_t buf[4];
  uint64_t v69;
  __int16 v70;
  id v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    if (v5)
    {
      v11 = (id *)v5[3];
      if (v11)
      {
        v10 = v11;
        if (!*(_QWORD *)(a1 + 56))
          goto LABEL_47;
        v12 = (void *)MEMORY[0x1E0CB35C8];
        if (((_BYTE)v11[3] & 1) != 0)
          v13 = *((int *)v11 + 2);
        else
          v13 = 0;
        v66 = *MEMORY[0x1E0CB2D50];
        v20 = v11[2];
        v21 = v20;
        if (!v20)
        {
          if (((_BYTE)v10[3] & 1) != 0)
            v22 = *((int *)v10 + 2);
          else
            v22 = 0;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error [%ld]"), v22);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v67 = v21;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v67, &v66, 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "msv_errorWithDomain:code:userInfo:debugDescription:", CFSTR("ICLiveLinkServerErrorDomain"), v13, v23, CFSTR("Failed to insert tracklist after item"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v20)
        objc_msgSend(*(id *)(a1 + 40), "delegateQueue");
        v25 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __110__ICSharedListeningQueue_insertTracklist_afterItemIdentifier_playNowWithPreferredStartIndexPath_completionEx___block_invoke_2_550;
        block[3] = &unk_1E4390EF8;
        v26 = &v62;
        v27 = *(id *)(a1 + 56);
        v28 = &v61;
        v61 = v24;
        v62 = v27;
        v29 = v24;
        dispatch_async(v25, block);
LABEL_46:

        goto LABEL_47;
      }
      v14 = *(id *)(a1 + 48);
      if (v14)
      {
LABEL_30:
        v35 = MEMORY[0x1E0C809B0];
        v56[0] = MEMORY[0x1E0C809B0];
        v56[1] = 3221225472;
        v56[2] = __110__ICSharedListeningQueue_insertTracklist_afterItemIdentifier_playNowWithPreferredStartIndexPath_completionEx___block_invoke_3;
        v56[3] = &unk_1E438EF88;
        v57 = *(id *)(a1 + 40);
        v29 = v14;
        v58 = v29;
        v59 = *(id *)(a1 + 56);
        v53 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A1AFA8D0](v56);
        if (v5 && (v36 = (id *)v5[1]) != 0)
        {
          v37 = v36;
          v38 = v36[11];
          if (v38)
          {
            v39 = v38[4];

            if (v39)
            {
              v40 = (id *)v5[1];
              v41 = v40;
              if (v40)
              {
                v42 = v40[11];
                v43 = v42;
                if (v42)
                {
                  v44 = (void *)*((_QWORD *)v42 + 4);
LABEL_37:
                  v45 = v44;

                  v46 = *(void **)(a1 + 40);
                  v26 = &v57;
                  if (v45)
                  {
                    v47 = v45[2];
                    v48 = v45[1];
                    v49 = v45[3];
                  }
                  else
                  {
                    v48 = 0;
                    v47 = 0;
                    v49 = 0;
                  }
                  v50 = v49;
                  objc_msgSend(v46, "_handleUpdatedQueue:playbackControlSettings:serverQueueContext:", v47, v48, v50);

                  v51 = v53;
                  v53[2](v53, 0);
                  goto LABEL_45;
                }
              }
              else
              {
                v43 = 0;
              }
              v44 = 0;
              goto LABEL_37;
            }
LABEL_44:
            v52 = *(void **)(a1 + 40);
            v54[0] = v35;
            v54[1] = 3221225472;
            v54[2] = __110__ICSharedListeningQueue_insertTracklist_afterItemIdentifier_playNowWithPreferredStartIndexPath_completionEx___block_invoke_5;
            v54[3] = &unk_1E438E500;
            v51 = v53;
            v55 = v53;
            objc_msgSend(v52, "_updateQueueWithReason:completion:", CFSTR("UpdateAfterPlayNow"), v54);
            v45 = v55;
            v26 = &v57;
LABEL_45:

            v10 = 0;
            v25 = v59;
            v28 = &v58;
            goto LABEL_46;
          }
        }
        else
        {
          v37 = 0;
        }

        goto LABEL_44;
      }
      v15 = v5[1];
      v14 = v15;
      if (v15)
      {
        v16 = (void *)*((_QWORD *)v15 + 11);
        goto LABEL_13;
      }
    }
    else
    {
      v14 = *(id *)(a1 + 48);
      if (v14)
        goto LABEL_30;
    }
    v16 = 0;
LABEL_13:
    v17 = v16;

    if (v17)
    {
      v18 = v17[3];
      if (v18)
      {
        v19 = v18;
        v14 = v19;
LABEL_29:

        goto LABEL_30;
      }
      v30 = v17[1];
    }
    else
    {
      v30 = 0;
    }
    v31 = v30;
    objc_msgSend(v31, "firstObject");
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = (void *)v32;
    if (v32)
      v34 = *(void **)(v32 + 24);
    else
      v34 = 0;
    v14 = v34;

    v19 = 0;
    goto LABEL_29;
  }
  v7 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v8 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218242;
    v69 = v8;
    v70 = 2114;
    v71 = v6;
    _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_ERROR, "ILL %p: [insertTracklistAndPlayNow] Received requestError=%{public}@", buf, 0x16u);
  }

  v9 = *(void **)(a1 + 40);
  v63[0] = MEMORY[0x1E0C809B0];
  v63[1] = 3221225472;
  v63[2] = __110__ICSharedListeningQueue_insertTracklist_afterItemIdentifier_playNowWithPreferredStartIndexPath_completionEx___block_invoke_547;
  v63[3] = &unk_1E43915E8;
  v65 = (id *)*(id *)(a1 + 56);
  v64 = v6;
  objc_msgSend(v9, "_updateQueueWithReason:completion:", CFSTR("UpdateAfterRequestError"), v63);

  v10 = v65;
LABEL_47:

}

uint64_t __110__ICSharedListeningQueue_insertTracklist_afterItemIdentifier_playNowWithPreferredStartIndexPath_completionEx___block_invoke_547(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, *(_QWORD *)(a1 + 32));
  return result;
}

uint64_t __110__ICSharedListeningQueue_insertTracklist_afterItemIdentifier_playNowWithPreferredStartIndexPath_completionEx___block_invoke_2_550(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __110__ICSharedListeningQueue_insertTracklist_afterItemIdentifier_playNowWithPreferredStartIndexPath_completionEx___block_invoke_3(id *a1, void *a2)
{
  id v3;
  NSObject *v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;

  v3 = a2;
  if (!v3)
    objc_msgSend(a1[4], "receivedCurrentItemIdentifier:fromParticipant:", a1[5], 0);
  if (a1[6])
  {
    objc_msgSend(a1[4], "delegateQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __110__ICSharedListeningQueue_insertTracklist_afterItemIdentifier_playNowWithPreferredStartIndexPath_completionEx___block_invoke_4;
    block[3] = &unk_1E4390E58;
    v8 = a1[6];
    v6 = a1[5];
    v7 = v3;
    dispatch_async(v4, block);

  }
}

uint64_t __110__ICSharedListeningQueue_insertTracklist_afterItemIdentifier_playNowWithPreferredStartIndexPath_completionEx___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __110__ICSharedListeningQueue_insertTracklist_afterItemIdentifier_playNowWithPreferredStartIndexPath_completionEx___block_invoke_4(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __108__ICSharedListeningQueue_insertTracklist_afterItemIdentifier_playNowWithPreferredStartIndexPath_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __66__ICSharedListeningQueue_insertTracklist_atPosition_completionEx___block_invoke(uint64_t result, uint64_t a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2 != 0;
  return result;
}

void __66__ICSharedListeningQueue_insertTracklist_atPosition_completionEx___block_invoke_538(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  id *v5;
  id *v6;
  id *v7;
  id *v8;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  if (v3 && (v5 = (id *)*(id *)(v3 + 16)) != 0)
  {
    v8 = v5;
    v6 = (id *)v5[1];
    v7 = v6;
    if (v6)
      objc_storeStrong(v6 + 5, a2);
  }
  else
  {
    v7 = 0;
    v8 = 0;
  }

}

void __66__ICSharedListeningQueue_insertTracklist_atPosition_completionEx___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id *v10;
  id *v11;
  void *v12;
  uint64_t v13;
  id *v14;
  id *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void (**v25)(_QWORD, _QWORD);
  id *v26;
  id *v27;
  _QWORD *v28;
  uint64_t v29;
  id *v30;
  id *v31;
  id v32;
  void *v33;
  void *v34;
  id *v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  NSObject *v46;
  id *v47;
  id v48;
  id *v49;
  void *v50;
  _QWORD v51[4];
  id *v52;
  _QWORD v53[4];
  id v54;
  NSObject *v55;
  id v56;
  _QWORD block[4];
  void *v58;
  id v59;
  _QWORD v60[4];
  id v61;
  id *v62;
  uint64_t v63;
  void *v64;
  uint8_t buf[4];
  uint64_t v66;
  __int16 v67;
  id v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    if (!v5)
      goto LABEL_34;
    v11 = (id *)v5[3];
    if (v11)
    {
      v10 = v11;
      if (!*(_QWORD *)(a1 + 48))
        goto LABEL_42;
      v12 = (void *)MEMORY[0x1E0CB35C8];
      if (((_BYTE)v11[3] & 1) != 0)
        v13 = *((int *)v11 + 2);
      else
        v13 = 0;
      v63 = *MEMORY[0x1E0CB2D50];
      v41 = v11[2];
      v42 = v41;
      if (!v41)
      {
        if (((_BYTE)v10[3] & 1) != 0)
          v43 = *((int *)v10 + 2);
        else
          v43 = 0;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error [%ld]"), v43);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v64 = v42;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v64, &v63, 1);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "msv_errorWithDomain:code:userInfo:debugDescription:", CFSTR("ICLiveLinkServerErrorDomain"), v13, v44, CFSTR("Failed to insert tracklist at position"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v41)
      objc_msgSend(*(id *)(a1 + 40), "delegateQueue");
      v46 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __66__ICSharedListeningQueue_insertTracklist_atPosition_completionEx___block_invoke_2_542;
      block[3] = &unk_1E4390EF8;
      v47 = &v59;
      v48 = *(id *)(a1 + 48);
      v49 = &v58;
      v58 = v45;
      v59 = v48;
      v24 = v45;
      dispatch_async(v46, block);
LABEL_41:

      goto LABEL_42;
    }
    v14 = (id *)v5[1];
    if (v14)
    {
      v15 = v14;
      v16 = v14[3];
      v17 = v16;
      if (v16)
      {
        v18 = (void *)*((_QWORD *)v16 + 1);
        goto LABEL_13;
      }
    }
    else
    {
LABEL_34:
      v17 = 0;
      v15 = 0;
    }
    v18 = 0;
LABEL_13:
    v19 = v18;
    objc_msgSend(v19, "firstObject");
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)v20;
    if (v20)
      v22 = *(void **)(v20 + 24);
    else
      v22 = 0;
    v23 = v22;

    v53[0] = MEMORY[0x1E0C809B0];
    v53[1] = 3221225472;
    v53[2] = __66__ICSharedListeningQueue_insertTracklist_atPosition_completionEx___block_invoke_3;
    v53[3] = &unk_1E438EF88;
    v56 = *(id *)(a1 + 48);
    v54 = *(id *)(a1 + 40);
    v24 = v23;
    v55 = v24;
    v25 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A1AFA8D0](v53);
    if (v5 && (v26 = (id *)v5[1]) != 0)
    {
      v27 = v26;
      v28 = v26[3];
      if (v28)
      {
        v29 = v28[3];

        if (v29)
        {
          v30 = (id *)v5[1];
          v31 = v30;
          if (v30)
          {
            v32 = v30[3];
            v33 = v32;
            if (v32)
            {
              v34 = (void *)*((_QWORD *)v32 + 3);
LABEL_22:
              v35 = v34;

              v36 = *(void **)(a1 + 40);
              if (v35)
              {
                v37 = v35[2];
                v38 = v35[1];
                v39 = v35[3];
              }
              else
              {
                v38 = 0;
                v37 = 0;
                v39 = 0;
              }
              v40 = v39;
              objc_msgSend(v36, "_handleUpdatedQueue:playbackControlSettings:serverQueueContext:", v37, v38, v40);

              v25[2](v25, 0);
              goto LABEL_40;
            }
          }
          else
          {
            v33 = 0;
          }
          v34 = 0;
          goto LABEL_22;
        }
LABEL_39:
        v50 = *(void **)(a1 + 40);
        v51[0] = MEMORY[0x1E0C809B0];
        v51[1] = 3221225472;
        v51[2] = __66__ICSharedListeningQueue_insertTracklist_atPosition_completionEx___block_invoke_5;
        v51[3] = &unk_1E438E500;
        v52 = v25;
        objc_msgSend(v50, "_updateQueueWithReason:completion:", CFSTR("UpdateAfterAddItems"), v51);
        v35 = v52;
LABEL_40:

        v10 = 0;
        v46 = v55;
        v49 = &v54;
        v47 = &v56;
        goto LABEL_41;
      }
    }
    else
    {
      v27 = 0;
    }

    goto LABEL_39;
  }
  v7 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v8 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218242;
    v66 = v8;
    v67 = 2114;
    v68 = v6;
    _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_ERROR, "ILL %p: [insertTracklist] Received requestError=%{public}@", buf, 0x16u);
  }

  v60[0] = MEMORY[0x1E0C809B0];
  v60[1] = 3221225472;
  v60[2] = __66__ICSharedListeningQueue_insertTracklist_atPosition_completionEx___block_invoke_539;
  v60[3] = &unk_1E43915E8;
  v9 = *(void **)(a1 + 40);
  v62 = (id *)*(id *)(a1 + 48);
  v61 = v6;
  objc_msgSend(v9, "_updateQueueWithReason:completion:", CFSTR("UpdateAfterRequestError"), v60);

  v10 = v62;
LABEL_42:

}

uint64_t __66__ICSharedListeningQueue_insertTracklist_atPosition_completionEx___block_invoke_539(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, *(_QWORD *)(a1 + 32));
  return result;
}

uint64_t __66__ICSharedListeningQueue_insertTracklist_atPosition_completionEx___block_invoke_2_542(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __66__ICSharedListeningQueue_insertTracklist_atPosition_completionEx___block_invoke_3(id *a1, void *a2)
{
  id v3;
  NSObject *v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;

  v3 = a2;
  if (a1[6])
  {
    objc_msgSend(a1[4], "delegateQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __66__ICSharedListeningQueue_insertTracklist_atPosition_completionEx___block_invoke_4;
    block[3] = &unk_1E4390E58;
    v6 = v3;
    v7 = a1[5];
    v8 = a1[6];
    dispatch_async(v4, block);

  }
}

uint64_t __66__ICSharedListeningQueue_insertTracklist_atPosition_completionEx___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __66__ICSharedListeningQueue_insertTracklist_atPosition_completionEx___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t __64__ICSharedListeningQueue_insertTracklist_atPosition_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __78__ICSharedListeningQueue_replaceTracklist_preferredStartIndexPath_completion___block_invoke(uint64_t result, uint64_t a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2 != 0;
  return result;
}

void __78__ICSharedListeningQueue_replaceTracklist_preferredStartIndexPath_completion___block_invoke_523(uint64_t a1, void *a2, void *a3)
{
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;

  v19 = a2;
  v6 = a3;
  if (!v19)
    goto LABEL_8;
  v7 = *(_QWORD *)(a1 + 32);
  if (!v7)
  {
    v9 = 0;
    goto LABEL_17;
  }
  v8 = *(id *)(v7 + 16);
  v9 = v8;
  if (!v8)
  {
LABEL_17:
    v10 = 0;
    goto LABEL_5;
  }
  v10 = (void *)*((_QWORD *)v8 + 12);
LABEL_5:
  v11 = v10;
  v12 = v19;
  if (v11)
  {
    -[_ICLLReplaceQueueItemsCommand clearOneofValuesForTrackGenerationSource]((uint64_t)v11);
    *((_BYTE *)v11 + 56) |= 2u;
    *((_DWORD *)v11 + 13) = 2;
    objc_storeStrong((id *)v11 + 5, a2);
  }

LABEL_8:
  if (!v6)
    goto LABEL_15;
  v13 = *(_QWORD *)(a1 + 32);
  if (!v13)
  {
    v15 = 0;
    goto LABEL_19;
  }
  v14 = *(id *)(v13 + 16);
  v15 = v14;
  if (!v14)
  {
LABEL_19:
    v16 = 0;
    goto LABEL_12;
  }
  v16 = (void *)*((_QWORD *)v14 + 12);
LABEL_12:
  v17 = v16;
  v18 = v6;
  if (v17)
  {
    -[_ICLLReplaceQueueItemsCommand clearOneofValuesForTrackGenerationSource]((uint64_t)v17);
    *((_BYTE *)v17 + 56) |= 2u;
    *((_DWORD *)v17 + 13) = 1;
    objc_storeStrong((id *)v17 + 1, a3);
  }

LABEL_15:
}

void __78__ICSharedListeningQueue_replaceTracklist_preferredStartIndexPath_completion___block_invoke_524(uint64_t a1, void *a2, void *a3)
{
  id *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id *v10;
  id *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  id *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  NSObject *v25;
  id *v26;
  id v27;
  id *v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  id *v36;
  id *v37;
  _QWORD *v38;
  uint64_t v39;
  id *v40;
  id *v41;
  id v42;
  void *v43;
  void *v44;
  id *v45;
  void *v46;
  id v47;
  id v48;
  id v49;
  id v50;
  void *v51;
  void *v52;
  void (**v53)(_QWORD, _QWORD);
  _QWORD v54[4];
  id *v55;
  _QWORD v56[4];
  id v57;
  id v58;
  NSObject *v59;
  _QWORD block[4];
  void *v61;
  id v62;
  _QWORD v63[4];
  id v64;
  id *v65;
  uint64_t v66;
  void *v67;
  uint8_t buf[4];
  uint64_t v69;
  __int16 v70;
  id v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    if (v5)
    {
      v11 = (id *)v5[3];
      if (v11)
      {
        v10 = v11;
        if (!*(_QWORD *)(a1 + 56))
          goto LABEL_47;
        v12 = (void *)MEMORY[0x1E0CB35C8];
        if (((_BYTE)v11[3] & 1) != 0)
          v13 = *((int *)v11 + 2);
        else
          v13 = 0;
        v66 = *MEMORY[0x1E0CB2D50];
        v20 = v11[2];
        v21 = v20;
        if (!v20)
        {
          if (((_BYTE)v10[3] & 1) != 0)
            v22 = *((int *)v10 + 2);
          else
            v22 = 0;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error [%ld]"), v22);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v67 = v21;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v67, &v66, 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "msv_errorWithDomain:code:userInfo:debugDescription:", CFSTR("ICLiveLinkServerErrorDomain"), v13, v23, CFSTR("Failed to replace tracklist"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v20)
        objc_msgSend(*(id *)(a1 + 40), "delegateQueue");
        v25 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __78__ICSharedListeningQueue_replaceTracklist_preferredStartIndexPath_completion___block_invoke_2;
        block[3] = &unk_1E4390EF8;
        v26 = &v62;
        v27 = *(id *)(a1 + 56);
        v28 = &v61;
        v61 = v24;
        v62 = v27;
        v29 = v24;
        dispatch_async(v25, block);
LABEL_46:

        goto LABEL_47;
      }
      v14 = *(id *)(a1 + 48);
      if (v14)
      {
LABEL_30:
        v35 = MEMORY[0x1E0C809B0];
        v56[0] = MEMORY[0x1E0C809B0];
        v56[1] = 3221225472;
        v56[2] = __78__ICSharedListeningQueue_replaceTracklist_preferredStartIndexPath_completion___block_invoke_3;
        v56[3] = &unk_1E438EF88;
        v57 = *(id *)(a1 + 40);
        v29 = v14;
        v58 = v29;
        v59 = *(id *)(a1 + 56);
        v53 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A1AFA8D0](v56);
        if (v5 && (v36 = (id *)v5[1]) != 0)
        {
          v37 = v36;
          v38 = v36[16];
          if (v38)
          {
            v39 = v38[4];

            if (v39)
            {
              v40 = (id *)v5[1];
              v41 = v40;
              if (v40)
              {
                v42 = v40[16];
                v43 = v42;
                if (v42)
                {
                  v44 = (void *)*((_QWORD *)v42 + 4);
LABEL_37:
                  v45 = v44;

                  v46 = *(void **)(a1 + 40);
                  v26 = &v57;
                  if (v45)
                  {
                    v47 = v45[2];
                    v48 = v45[1];
                    v49 = v45[3];
                  }
                  else
                  {
                    v48 = 0;
                    v47 = 0;
                    v49 = 0;
                  }
                  v50 = v49;
                  objc_msgSend(v46, "_handleUpdatedQueue:playbackControlSettings:serverQueueContext:", v47, v48, v50);

                  v51 = v53;
                  v53[2](v53, 0);
                  goto LABEL_45;
                }
              }
              else
              {
                v43 = 0;
              }
              v44 = 0;
              goto LABEL_37;
            }
LABEL_44:
            v52 = *(void **)(a1 + 40);
            v54[0] = v35;
            v54[1] = 3221225472;
            v54[2] = __78__ICSharedListeningQueue_replaceTracklist_preferredStartIndexPath_completion___block_invoke_5;
            v54[3] = &unk_1E438E500;
            v51 = v53;
            v55 = v53;
            objc_msgSend(v52, "_updateQueueWithReason:completion:", CFSTR("UpdateAfterReplaceQueueItems"), v54);
            v45 = v55;
            v26 = &v57;
LABEL_45:

            v10 = 0;
            v25 = v59;
            v28 = &v58;
            goto LABEL_46;
          }
        }
        else
        {
          v37 = 0;
        }

        goto LABEL_44;
      }
      v15 = v5[1];
      v14 = v15;
      if (v15)
      {
        v16 = (void *)*((_QWORD *)v15 + 16);
        goto LABEL_13;
      }
    }
    else
    {
      v14 = *(id *)(a1 + 48);
      if (v14)
        goto LABEL_30;
    }
    v16 = 0;
LABEL_13:
    v17 = v16;

    if (v17)
    {
      v18 = v17[3];
      if (v18)
      {
        v19 = v18;
        v14 = v19;
LABEL_29:

        goto LABEL_30;
      }
      v30 = v17[2];
    }
    else
    {
      v30 = 0;
    }
    v31 = v30;
    objc_msgSend(v31, "firstObject");
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = (void *)v32;
    if (v32)
      v34 = *(void **)(v32 + 24);
    else
      v34 = 0;
    v14 = v34;

    v19 = 0;
    goto LABEL_29;
  }
  v7 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v8 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218242;
    v69 = v8;
    v70 = 2114;
    v71 = v6;
    _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_ERROR, "ILL %p: [replaceTracklist] Received requestError=%{public}@", buf, 0x16u);
  }

  v9 = *(void **)(a1 + 40);
  v63[0] = MEMORY[0x1E0C809B0];
  v63[1] = 3221225472;
  v63[2] = __78__ICSharedListeningQueue_replaceTracklist_preferredStartIndexPath_completion___block_invoke_527;
  v63[3] = &unk_1E43915E8;
  v65 = (id *)*(id *)(a1 + 56);
  v64 = v6;
  objc_msgSend(v9, "_updateQueueWithReason:completion:", CFSTR("UpdateAfterRequestError"), v63);

  v10 = v65;
LABEL_47:

}

uint64_t __78__ICSharedListeningQueue_replaceTracklist_preferredStartIndexPath_completion___block_invoke_527(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

uint64_t __78__ICSharedListeningQueue_replaceTracklist_preferredStartIndexPath_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __78__ICSharedListeningQueue_replaceTracklist_preferredStartIndexPath_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a2;
  if (!v3)
  {
    v4 = *(void **)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v4, "identity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "receivedCurrentItemIdentifier:fromParticipant:", v5, v6);

  }
  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "delegateQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __78__ICSharedListeningQueue_replaceTracklist_preferredStartIndexPath_completion___block_invoke_4;
    v8[3] = &unk_1E4390EF8;
    v10 = *(id *)(a1 + 48);
    v9 = v3;
    dispatch_async(v7, v8);

  }
}

uint64_t __78__ICSharedListeningQueue_replaceTracklist_preferredStartIndexPath_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __78__ICSharedListeningQueue_replaceTracklist_preferredStartIndexPath_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __56__ICSharedListeningQueue_setAutoPlayEnabled_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v5;
  id v6;
  NSObject *v7;
  id *v8;
  id *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  NSObject *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, void *);
  void *v28;
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  _QWORD block[4];
  id v35;
  id *v36;
  uint64_t v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    if (v5 && (v9 = (id *)v5[3]) != 0)
    {
      v8 = v9;
      if (!*(_QWORD *)(a1 + 40))
        goto LABEL_26;
      v10 = (void *)MEMORY[0x1E0CB35C8];
      if (((_BYTE)v9[3] & 1) != 0)
        v11 = *((int *)v9 + 2);
      else
        v11 = 0;
      v37 = *MEMORY[0x1E0CB2D50];
      v12 = v9[2];
      v13 = v12;
      if (!v12)
      {
        if (((_BYTE)v8[3] & 1) != 0)
          v14 = *((int *)v8 + 2);
        else
          v14 = 0;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error [%ld]"), v14);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v38[0] = v13;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, &v37, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (*(_BYTE *)(a1 + 48))
        v16 = CFSTR("ON");
      else
        v16 = CFSTR("OFF");
      objc_msgSend(v10, "msv_errorWithDomain:code:userInfo:debugDescription:", CFSTR("ICLiveLinkServerErrorDomain"), v11, v15, CFSTR("Failed to turn AutoPlay %@"), v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
      objc_msgSend(*(id *)(a1 + 32), "delegateQueue");
      v18 = objc_claimAutoreleasedReturnValue();
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __56__ICSharedListeningQueue_setAutoPlayEnabled_completion___block_invoke_3;
      v31[3] = &unk_1E4390EF8;
      v19 = *(id *)(a1 + 40);
      v32 = v17;
      v33 = v19;
      v20 = v17;
      dispatch_async(v18, v31);

    }
    else
    {
      v25 = MEMORY[0x1E0C809B0];
      v26 = 3221225472;
      v27 = __56__ICSharedListeningQueue_setAutoPlayEnabled_completion___block_invoke_4;
      v28 = &unk_1E43915E8;
      v30 = *(id *)(a1 + 40);
      v29 = *(id *)(a1 + 32);
      v21 = (void *)MEMORY[0x1A1AFA8D0](&v25);
      v22 = *(void **)(a1 + 32);
      if (*(_BYTE *)(a1 + 48))
        v23 = CFSTR("ON");
      else
        v23 = CFSTR("OFF");
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UpdateAfterAutoplayToggled%@"), v23, v25, v26, v27, v28);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "_updateQueueWithReason:completion:", v24, v21);

      v8 = 0;
      v20 = v30;
    }

    goto LABEL_26;
  }
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "delegateQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__ICSharedListeningQueue_setAutoPlayEnabled_completion___block_invoke_2;
    block[3] = &unk_1E4390EF8;
    v36 = (id *)*(id *)(a1 + 40);
    v35 = v6;
    dispatch_async(v7, block);

    v8 = v36;
LABEL_26:

  }
}

uint64_t __56__ICSharedListeningQueue_setAutoPlayEnabled_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __56__ICSharedListeningQueue_setAutoPlayEnabled_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __56__ICSharedListeningQueue_setAutoPlayEnabled_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "delegateQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __56__ICSharedListeningQueue_setAutoPlayEnabled_completion___block_invoke_5;
    v5[3] = &unk_1E4390EF8;
    v7 = *(id *)(a1 + 40);
    v6 = v3;
    dispatch_async(v4, v5);

  }
}

uint64_t __56__ICSharedListeningQueue_setAutoPlayEnabled_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __49__ICSharedListeningQueue_containerForIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

@end
