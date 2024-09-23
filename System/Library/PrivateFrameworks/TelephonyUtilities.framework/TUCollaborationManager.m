@implementation TUCollaborationManager

- (TUCollaborationManager)initWithCollaborationProvider:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  TUFeatureFlags *v8;
  TUCollaborationManager *v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2050000000;
  v5 = (void *)getFTDeviceSupportClass_softClass;
  v15 = getFTDeviceSupportClass_softClass;
  if (!getFTDeviceSupportClass_softClass)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __getFTDeviceSupportClass_block_invoke;
    v11[3] = &unk_1E38A1710;
    v11[4] = &v12;
    __getFTDeviceSupportClass_block_invoke((uint64_t)v11);
    v5 = (void *)v13[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v12, 8);
  objc_msgSend(v6, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(TUFeatureFlags);
  v9 = -[TUCollaborationManager initWithCollaborationProvider:featureFlags:deviceSupport:](self, "initWithCollaborationProvider:featureFlags:deviceSupport:", v4, v8, v7);

  return v9;
}

- (TUCollaborationManager)initWithCollaborationProvider:(id)a3 featureFlags:(id)a4 deviceSupport:(id)a5
{
  id v9;
  id v10;
  id v11;
  TUCollaborationManager *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *queue;
  uint64_t v15;
  NSMutableSet *pendingHighlightIdentifiers;
  uint64_t v17;
  NSMutableDictionary *originatingParticipantByHighlightIdentifier;
  uint64_t v19;
  NSMutableDictionary *highlightsByIdentifier;
  uint64_t v21;
  NSMutableDictionary *conversationsByHighlightIdentifier;
  uint64_t v23;
  NSMutableDictionary *collaborationStateByIdentifier;
  objc_super v26;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v26.receiver = self;
  v26.super_class = (Class)TUCollaborationManager;
  v12 = -[TUCollaborationManager init](&v26, sel_init);
  if (v12)
  {
    v13 = dispatch_queue_create("com.apple.telephonyutilities.collaborationmanager", 0);
    queue = v12->_queue;
    v12->_queue = (OS_dispatch_queue *)v13;

    objc_storeStrong((id *)&v12->_featureFlags, a4);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v15 = objc_claimAutoreleasedReturnValue();
    pendingHighlightIdentifiers = v12->_pendingHighlightIdentifiers;
    v12->_pendingHighlightIdentifiers = (NSMutableSet *)v15;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v17 = objc_claimAutoreleasedReturnValue();
    originatingParticipantByHighlightIdentifier = v12->_originatingParticipantByHighlightIdentifier;
    v12->_originatingParticipantByHighlightIdentifier = (NSMutableDictionary *)v17;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v19 = objc_claimAutoreleasedReturnValue();
    highlightsByIdentifier = v12->_highlightsByIdentifier;
    v12->_highlightsByIdentifier = (NSMutableDictionary *)v19;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v21 = objc_claimAutoreleasedReturnValue();
    conversationsByHighlightIdentifier = v12->_conversationsByHighlightIdentifier;
    v12->_conversationsByHighlightIdentifier = (NSMutableDictionary *)v21;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v23 = objc_claimAutoreleasedReturnValue();
    collaborationStateByIdentifier = v12->_collaborationStateByIdentifier;
    v12->_collaborationStateByIdentifier = (NSMutableDictionary *)v23;

    objc_storeStrong((id *)&v12->_collaborationProvider, a3);
    v12->_isIpad = objc_msgSend(v11, "deviceType") == 4;
    objc_msgSend(v9, "setDelegate:", v12);
  }

  return v12;
}

- (void)queueCollaborationIdentifierForCollaboration:(id)a3 toConversation:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[TUCollaborationManager queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __86__TUCollaborationManager_queueCollaborationIdentifierForCollaboration_toConversation___block_invoke;
  block[3] = &unk_1E38A19B8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __86__TUCollaborationManager_queueCollaborationIdentifierForCollaboration_toConversation___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;

  objc_msgSend(*(id *)(a1 + 32), "featureFlags");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "gelatoEnabled");

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "setPendingCollaborationToAdd:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "setPendingConversationToAdd:", *(_QWORD *)(a1 + 48));
  }
}

- (BOOL)isCollaborationLocallyInitiatedForConversation:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  -[TUCollaborationManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__TUCollaborationManager_isCollaborationLocallyInitiatedForConversation___block_invoke;
  block[3] = &unk_1E38A1D60;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

void __73__TUCollaborationManager_isCollaborationLocallyInitiatedForConversation___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "originatingParticipantByHighlightIdentifier");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "highlightIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "anyObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "localMember");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v5, "isEquivalentToHandle:", v7);

}

- (void)collaborationsDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[TUCollaborationManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__TUCollaborationManager_collaborationsDidChange___block_invoke;
  v7[3] = &unk_1E38A1388;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __50__TUCollaborationManager_collaborationsDidChange___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t j;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  BOOL v54;
  NSObject *v55;
  void *v56;
  void *v57;
  __int128 v58;
  id obj;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  uint8_t v68[128];
  uint8_t buf[4];
  void *v70;
  __int16 v71;
  void *v72;
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "featureFlags");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "gelatoEnabled");

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "pendingCollaborationToAdd");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 32), "collaborationProvider");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "pendingCollaborationToAdd");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "collaborationHighlightForIdentifier:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        TUDefaultLog();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v70 = v7;
          _os_log_impl(&dword_19A50D000, v8, OS_LOG_TYPE_DEFAULT, "Pending collaboration fulfilled: %@", buf, 0xCu);
        }

        objc_msgSend(*(id *)(a1 + 32), "delegate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "pendingConversationToAdd");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addCollaboration:forConversation:", v7, v10);

        objc_msgSend(*(id *)(a1 + 32), "setPendingCollaborationToAdd:", 0);
        objc_msgSend(*(id *)(a1 + 32), "setPendingConversationToAdd:", 0);
      }

    }
    objc_msgSend(*(id *)(a1 + 32), "highlightsByIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "copy");

    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    obj = v12;
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v73, 16);
    if (v13)
    {
      v15 = v13;
      v16 = *(_QWORD *)v65;
      *(_QWORD *)&v14 = 138412290;
      v58 = v14;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v65 != v16)
            objc_enumerationMutation(obj);
          v18 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
          objc_msgSend(*(id *)(a1 + 40), "collaborationHighlightForIdentifier:", v18, v58);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(obj, "objectForKeyedSubscript:", v18);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          TUDefaultLog();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v70 = v19;
            v71 = 2112;
            v72 = v20;
            _os_log_impl(&dword_19A50D000, v21, OS_LOG_TYPE_DEFAULT, "highlight: %@ oldHighlight: %@", buf, 0x16u);
          }

          objc_msgSend(*(id *)(a1 + 32), "conversationsByHighlightIdentifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "objectForKeyedSubscript:", v18);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(*(id *)(a1 + 32), "originatingParticipantByHighlightIdentifier");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "objectForKeyedSubscript:", v18);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v19)
          {
            TUDefaultLog();
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v58;
              v70 = v18;
              _os_log_impl(&dword_19A50D000, v29, OS_LOG_TYPE_DEFAULT, "highlight with identifier: %@ removed from SWY", buf, 0xCu);
            }

            objc_msgSend(*(id *)(a1 + 32), "originatingParticipantByHighlightIdentifier");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "setObject:forKeyedSubscript:", 0, v18);

            objc_msgSend(*(id *)(a1 + 32), "highlightsByIdentifier");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "setObject:forKeyedSubscript:", 0, v18);

            objc_msgSend(*(id *)(a1 + 32), "pendingHighlightIdentifiers");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "addObject:", v18);

            objc_msgSend(*(id *)(a1 + 32), "notifyDelegateOfHighlightChanged:onConversation:", 0, v23);
            v33 = *(void **)(a1 + 32);
            v34 = v20;
            v35 = v25;
            v36 = v23;
            v37 = 16;
            goto LABEL_27;
          }
          if (!v20)
          {
            TUDefaultLog();
            v38 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = v58;
              v70 = v18;
              _os_log_fault_impl(&dword_19A50D000, v38, OS_LOG_TYPE_FAULT, "highlight with identifier: %@ added to SWY - should not be possible to hit this case", buf, 0xCu);
            }

            objc_msgSend(*(id *)(a1 + 32), "highlightsByIdentifier");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "setObject:forKeyedSubscript:", v19, v18);

            objc_msgSend(*(id *)(a1 + 32), "pendingHighlightIdentifiers");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "removeObject:", v18);

            objc_msgSend(*(id *)(a1 + 32), "notifyDelegateOfHighlightChanged:onConversation:", v19, v23);
            v33 = *(void **)(a1 + 32);
            v34 = v19;
            v35 = v25;
            v36 = v23;
            v37 = 15;
LABEL_27:
            objc_msgSend(v33, "vendNoticeForCollaboration:participant:forConversation:type:", v34, v35, v36, v37);
            goto LABEL_28;
          }
          if ((objc_msgSend(v19, "isEqual:", v20) & 1) == 0)
          {
            TUDefaultLog();
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v70 = v19;
              v71 = 2112;
              v72 = v18;
              _os_log_impl(&dword_19A50D000, v26, OS_LOG_TYPE_DEFAULT, "highlight: %@ with identifier: %@ changed", buf, 0x16u);
            }

            objc_msgSend(*(id *)(a1 + 32), "highlightsByIdentifier");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "setObject:forKeyedSubscript:", v19, v18);

            objc_msgSend(*(id *)(a1 + 32), "pendingHighlightIdentifiers");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "removeObject:", v18);

          }
LABEL_28:

        }
        v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v73, 16);
      }
      while (v15);
    }

    objc_msgSend(*(id *)(a1 + 32), "pendingHighlightIdentifiers");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = (void *)objc_msgSend(v41, "copy");

    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    v43 = v42;
    v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v60, v68, 16);
    if (v44)
    {
      v45 = v44;
      v46 = *(_QWORD *)v61;
      do
      {
        for (j = 0; j != v45; ++j)
        {
          if (*(_QWORD *)v61 != v46)
            objc_enumerationMutation(v43);
          v48 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * j);
          objc_msgSend(*(id *)(a1 + 40), "collaborationHighlightForIdentifier:", v48);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "conversationsByHighlightIdentifier");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "objectForKeyedSubscript:", v48);
          v51 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(*(id *)(a1 + 32), "originatingParticipantByHighlightIdentifier");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "objectForKeyedSubscript:", v48);
          v53 = (void *)objc_claimAutoreleasedReturnValue();

          if (v49)
            v54 = v51 == 0;
          else
            v54 = 1;
          if (!v54)
          {
            TUDefaultLog();
            v55 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v70 = v49;
              v71 = 2112;
              v72 = v48;
              _os_log_impl(&dword_19A50D000, v55, OS_LOG_TYPE_DEFAULT, "highlight: %@ with identifier: %@ added to SWY from pending", buf, 0x16u);
            }

            objc_msgSend(*(id *)(a1 + 32), "highlightsByIdentifier");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "setObject:forKeyedSubscript:", v49, v48);

            objc_msgSend(*(id *)(a1 + 32), "pendingHighlightIdentifiers");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "removeObject:", v48);

            objc_msgSend(*(id *)(a1 + 32), "startTrackingCollaborationIfNecessaryAndNotifyDelegate:forConversation:", v49, v51);
            objc_msgSend(*(id *)(a1 + 32), "vendNoticeForCollaboration:participant:forConversation:type:", v49, v53, v51, 15);
          }

        }
        v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v60, v68, 16);
      }
      while (v45);
    }

  }
}

- (void)vendNoticeForCollaboration:(id)a3 participant:(id)a4 forConversation:(id)a5 type:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  int v15;
  NSObject *v16;
  NSObject *v17;
  TUCollaborationNotice *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  int v22;
  NSObject *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  -[TUCollaborationManager queue](self, "queue");
  v13 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v13);

  -[TUCollaborationManager featureFlags](self, "featureFlags");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "gelatoEnabled");

  if (v15)
  {
    if (objc_msgSend(v12, "avMode") == 1)
    {
      TUDefaultLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
LABEL_9:

        goto LABEL_10;
      }
      objc_msgSend(v10, "identifier");
      v17 = objc_claimAutoreleasedReturnValue();
      v22 = 138412290;
      v23 = v17;
      _os_log_impl(&dword_19A50D000, v16, OS_LOG_TYPE_DEFAULT, "Not posting a notice for collaboration: %@ since the conversation is avModeAudio", (uint8_t *)&v22, 0xCu);
    }
    else
    {
      v18 = [TUCollaborationNotice alloc];
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[TUCollaborationNotice initWithUUID:](v18, "initWithUUID:", v19);

      -[NSObject setSessionEventType:](v16, "setSessionEventType:", a6);
      -[NSObject setCollaboration:](v16, "setCollaboration:", v10);
      TUDefaultLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v10, "collaborationIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138412802;
        v23 = v16;
        v24 = 2112;
        v25 = v21;
        v26 = 2112;
        v27 = v11;
        _os_log_impl(&dword_19A50D000, v20, OS_LOG_TYPE_DEFAULT, "Vending notice: %@ for collaboration: %@, for participant: %@", (uint8_t *)&v22, 0x20u);

      }
      -[TUCollaborationManager delegate](self, "delegate");
      v17 = objc_claimAutoreleasedReturnValue();
      -[NSObject conversation:participant:addedCollaborationNotice:](v17, "conversation:participant:addedCollaborationNotice:", v12, v11, v16);
    }

    goto LABEL_9;
  }
LABEL_10:

}

- (void)notifyDelegateOfHighlightChanged:(id)a3 onConversation:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  -[TUCollaborationManager queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[TUCollaborationManager featureFlags](self, "featureFlags");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "gelatoEnabled");

  if (v9)
  {
    -[TUCollaborationManager delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "collaborationChanged:forConversation:collaborationState:", v11, v6, -1);

  }
}

- (void)stopTrackingHighlightForConversation:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[TUCollaborationManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(v4, "highlightIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "anyObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  TUDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138412290;
    v15 = v7;
    _os_log_impl(&dword_19A50D000, v8, OS_LOG_TYPE_DEFAULT, "Asked to stop tracking highlight for conversation with collaboration Identifier: %@", (uint8_t *)&v14, 0xCu);
  }

  if (v7)
  {
    -[TUCollaborationManager pendingHighlightIdentifiers](self, "pendingHighlightIdentifiers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObject:", v7);

    -[TUCollaborationManager originatingParticipantByHighlightIdentifier](self, "originatingParticipantByHighlightIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObjectForKey:", v7);

    -[TUCollaborationManager highlightsByIdentifier](self, "highlightsByIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeObjectForKey:", v7);

    -[TUCollaborationManager conversationsByHighlightIdentifier](self, "conversationsByHighlightIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeObjectForKey:", v7);

    -[TUCollaborationManager collaborationStateByIdentifier](self, "collaborationStateByIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeObjectForKey:", v7);

  }
}

- (id)collaborationForConversation:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v11;
  TUCollaborationManager *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  -[TUCollaborationManager featureFlags](self, "featureFlags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "gelatoEnabled");

  if (v6)
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x3032000000;
    v17 = __Block_byref_object_copy__8;
    v18 = __Block_byref_object_dispose__8;
    v19 = 0;
    -[TUCollaborationManager queue](self, "queue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __55__TUCollaborationManager_collaborationForConversation___block_invoke;
    block[3] = &unk_1E38A2F38;
    v12 = self;
    v13 = &v14;
    v11 = v4;
    dispatch_sync(v7, block);

    v8 = (id)v15[5];
    _Block_object_dispose(&v14, 8);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __55__TUCollaborationManager_collaborationForConversation___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "highlightIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "highlightIdentifiers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "anyObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "pendingHighlightIdentifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "containsObject:", v5);

    if (v7)
    {
      TUDefaultLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = *(_QWORD *)(a1 + 32);
        v18 = 138412546;
        v19 = v5;
        v20 = 2112;
        v21 = v9;
        _os_log_impl(&dword_19A50D000, v8, OS_LOG_TYPE_DEFAULT, "Highlight identifier: %@ is currently pending for conversation: %@", (uint8_t *)&v18, 0x16u);
      }

      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v11 = *(void **)(v10 + 40);
      *(_QWORD *)(v10 + 40) = 0;

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "collaborationProvider");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "collaborationHighlightForIdentifier:", v5);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v17 = *(void **)(v16 + 40);
      *(_QWORD *)(v16 + 40) = v15;

    }
  }
  else
  {
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = 0;

  }
}

- (int64_t)collaborationStateForConversation:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  int64_t v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = -1;
  -[TUCollaborationManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__TUCollaborationManager_collaborationStateForConversation___block_invoke;
  block[3] = &unk_1E38A2F60;
  block[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = v13[3];
  _Block_object_dispose(&v12, 8);
  return v7;
}

void __60__TUCollaborationManager_collaborationStateForConversation___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "featureFlags");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "gelatoEnabled");

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "highlightIdentifiers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "anyObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "collaborationStateByIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        objc_msgSend(*(id *)(a1 + 32), "collaborationStateByIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", v5);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = (int)objc_msgSend(v9, "intValue");

      }
    }
    TUDefaultLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      v12 = 134217984;
      v13 = v11;
      _os_log_impl(&dword_19A50D000, v10, OS_LOG_TYPE_DEFAULT, "Collaboration state for conversation is %ld", (uint8_t *)&v12, 0xCu);
    }

  }
}

- (void)associateCollaborationWithNewConversation:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  TUCollaborationManager *v9;

  v4 = a3;
  -[TUCollaborationManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __68__TUCollaborationManager_associateCollaborationWithNewConversation___block_invoke;
  v7[3] = &unk_1E38A1388;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __68__TUCollaborationManager_associateCollaborationWithNewConversation___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *i;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t v33[128];
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "highlightIdentifiers");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "anyObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    v35 = v4;
    v36 = 2112;
    v37 = v5;
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "Conversation created with collaboration identifier: %@ conversation: %@", buf, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 40), "featureFlags");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "gelatoEnabled");

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "highlightIdentifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "anyObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "collaborationProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "collaborationHighlightForIdentifier:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      TUDefaultLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v35 = v9;
        _os_log_impl(&dword_19A50D000, v12, OS_LOG_TYPE_DEFAULT, "collaboration found: %@ ", buf, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 40), "highlightsByIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v11, v9);

      v14 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "conversationsByHighlightIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, v9);

      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      objc_msgSend(*(id *)(a1 + 32), "activeRemoteParticipants");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      if (v17)
      {
        v28 = v9;
        v18 = *(_QWORD *)v30;
        while (2)
        {
          for (i = 0; i != v17; i = ((char *)i + 1))
          {
            if (*(_QWORD *)v30 != v18)
              objc_enumerationMutation(v16);
            v20 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i);
            objc_msgSend(v20, "handle");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 32), "initiator");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v21, "isEqualToHandle:", v22);

            if (v23)
            {
              v17 = v20;
              goto LABEL_17;
            }
          }
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
          if (v17)
            continue;
          break;
        }
LABEL_17:
        v9 = v28;
      }

      if (objc_msgSend(*(id *)(a1 + 32), "state") == 3)
      {
        if (objc_msgSend(*(id *)(a1 + 40), "isIpad"))
          objc_msgSend(*(id *)(a1 + 40), "vendNoticeForCollaboration:participant:forConversation:type:", v11, v17, *(_QWORD *)(a1 + 32), 15);
      }
      objc_msgSend(*(id *)(a1 + 40), "notifyDelegateOfHighlightChanged:onConversation:", v11, *(_QWORD *)(a1 + 32));
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "pendingHighlightIdentifiers");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "addObject:", v9);

      v25 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "conversationsByHighlightIdentifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setObject:forKeyedSubscript:", v25, v9);

      TUDefaultLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 40), "pendingHighlightIdentifiers");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v35 = v27;
        _os_log_impl(&dword_19A50D000, v17, OS_LOG_TYPE_DEFAULT, "Highlight not found: %@ ", buf, 0xCu);

      }
    }

    objc_msgSend(*(id *)(a1 + 40), "startTrackingCollaborationIfNecessaryAndNotifyDelegate:forConversation:", v11, *(_QWORD *)(a1 + 32));
  }
}

- (void)participant:(id)a3 addedHighlightToConversation:(id)a4 highlightIdentifier:(id)a5 oldHighlightIdentifier:(id)a6 isFirstAdd:(BOOL)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  TUCollaborationManager *v25;
  id v26;
  BOOL v27;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  -[TUCollaborationManager queue](self, "queue");
  v16 = objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __121__TUCollaborationManager_participant_addedHighlightToConversation_highlightIdentifier_oldHighlightIdentifier_isFirstAdd___block_invoke;
  v21[3] = &unk_1E38A2F88;
  v22 = v12;
  v23 = v14;
  v24 = v13;
  v25 = self;
  v27 = a7;
  v26 = v15;
  v17 = v15;
  v18 = v13;
  v19 = v14;
  v20 = v12;
  dispatch_async(v16, v21);

}

void __121__TUCollaborationManager_participant_addedHighlightToConversation_highlightIdentifier_oldHighlightIdentifier_isFirstAdd___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 48);
    v39 = 138412802;
    v40 = v3;
    v41 = 2112;
    v42 = v4;
    v43 = 2112;
    v44 = v5;
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "Participant: %@ added highlightIdentifier: %@ to conversation: %@", (uint8_t *)&v39, 0x20u);
  }

  objc_msgSend(*(id *)(a1 + 56), "featureFlags");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "gelatoEnabled");

  if (v7)
  {
    if (!*(_BYTE *)(a1 + 72))
    {
      objc_msgSend(*(id *)(a1 + 56), "participant:reAddedHighlightToConversation:highlightIdentifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
      return;
    }
    v8 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 56), "originatingParticipantByHighlightIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, *(_QWORD *)(a1 + 40));

    if (*(_QWORD *)(a1 + 64))
    {
      if ((objc_msgSend(*(id *)(a1 + 40), "isEqualToString:") & 1) != 0)
        return;
      TUDefaultLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = *(void **)(a1 + 64);
        v12 = *(_QWORD *)(a1 + 40);
        v39 = 138412546;
        v40 = v11;
        v41 = 2112;
        v42 = v12;
        _os_log_impl(&dword_19A50D000, v10, OS_LOG_TYPE_DEFAULT, "Changed collaborations from oldIdentifier: %@ to %@", (uint8_t *)&v39, 0x16u);
      }

      objc_msgSend(*(id *)(a1 + 56), "originatingParticipantByHighlightIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "removeObjectForKey:", *(_QWORD *)(a1 + 64));

      objc_msgSend(*(id *)(a1 + 56), "conversationsByHighlightIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "removeObjectForKey:", *(_QWORD *)(a1 + 64));

      objc_msgSend(*(id *)(a1 + 56), "highlightsByIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "removeObjectForKey:", *(_QWORD *)(a1 + 64));

      objc_msgSend(*(id *)(a1 + 56), "pendingHighlightIdentifiers");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "removeObject:", *(_QWORD *)(a1 + 64));

      v17 = *(_QWORD *)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 56), "conversationsByHighlightIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v17, *(_QWORD *)(a1 + 40));

      objc_msgSend(*(id *)(a1 + 56), "collaborationProvider");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "collaborationHighlightForIdentifier:", *(_QWORD *)(a1 + 40));
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v21 = *(void **)(a1 + 56);
      if (v20)
      {
        objc_msgSend(v21, "highlightsByIdentifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setObject:forKeyedSubscript:", v20, *(_QWORD *)(a1 + 40));

        v23 = *(void **)(a1 + 56);
        objc_msgSend(v23, "originatingParticipantByHighlightIdentifier");
        v24 = objc_claimAutoreleasedReturnValue();
        -[NSObject objectForKeyedSubscript:](v24, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "vendNoticeForCollaboration:participant:forConversation:type:", v20, v25, *(_QWORD *)(a1 + 48), 15);

      }
      else
      {
        objc_msgSend(v21, "pendingHighlightIdentifiers");
        v24 = objc_claimAutoreleasedReturnValue();
        -[NSObject addObject:](v24, "addObject:", *(_QWORD *)(a1 + 40));
      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 56), "collaborationProvider");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "collaborationHighlightForIdentifier:", *(_QWORD *)(a1 + 40));
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        TUDefaultLog();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          v28 = *(void **)(a1 + 40);
          v39 = 138412290;
          v40 = v28;
          _os_log_impl(&dword_19A50D000, v27, OS_LOG_TYPE_DEFAULT, "Highlight found: %@ ", (uint8_t *)&v39, 0xCu);
        }

        objc_msgSend(*(id *)(a1 + 56), "highlightsByIdentifier");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setObject:forKeyedSubscript:", v20, *(_QWORD *)(a1 + 40));

        v30 = *(_QWORD *)(a1 + 48);
        objc_msgSend(*(id *)(a1 + 56), "conversationsByHighlightIdentifier");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "setObject:forKeyedSubscript:", v30, *(_QWORD *)(a1 + 40));

        v32 = *(void **)(a1 + 56);
        objc_msgSend(v32, "originatingParticipantByHighlightIdentifier");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "vendNoticeForCollaboration:participant:forConversation:type:", v20, v34, *(_QWORD *)(a1 + 48), 15);

        objc_msgSend(*(id *)(a1 + 56), "notifyDelegateOfHighlightChanged:onConversation:", v20, *(_QWORD *)(a1 + 48));
        goto LABEL_20;
      }
      objc_msgSend(*(id *)(a1 + 56), "pendingHighlightIdentifiers");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "addObject:", *(_QWORD *)(a1 + 40));

      v36 = *(_QWORD *)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 56), "conversationsByHighlightIdentifier");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setObject:forKeyedSubscript:", v36, *(_QWORD *)(a1 + 40));

      TUDefaultLog();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 56), "pendingHighlightIdentifiers");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = 138412290;
        v40 = v38;
        _os_log_impl(&dword_19A50D000, v24, OS_LOG_TYPE_DEFAULT, "Highlight not found: %@ ", (uint8_t *)&v39, 0xCu);

      }
    }

LABEL_20:
    objc_msgSend(*(id *)(a1 + 56), "startTrackingCollaborationIfNecessaryAndNotifyDelegate:forConversation:", v20, *(_QWORD *)(a1 + 48));

  }
}

- (void)participant:(id)a3 reAddedHighlightToConversation:(id)a4 highlightIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  TUCollaborationManager *v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[TUCollaborationManager queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __89__TUCollaborationManager_participant_reAddedHighlightToConversation_highlightIdentifier___block_invoke;
  v15[3] = &unk_1E38A1B38;
  v16 = v8;
  v17 = v10;
  v18 = v9;
  v19 = self;
  v12 = v9;
  v13 = v10;
  v14 = v8;
  dispatch_async(v11, v15);

}

void __89__TUCollaborationManager_participant_reAddedHighlightToConversation_highlightIdentifier___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 48);
    v15 = 138412802;
    v16 = v3;
    v17 = 2112;
    v18 = v4;
    v19 = 2112;
    v20 = v5;
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "Participant: %@ readded highlightIdentifier: %@ to conversation: %@", (uint8_t *)&v15, 0x20u);
  }

  objc_msgSend(*(id *)(a1 + 56), "featureFlags");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "gelatoEnabled");

  if (v7)
  {
    v8 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 56), "originatingParticipantByHighlightIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, *(_QWORD *)(a1 + 40));

    objc_msgSend(*(id *)(a1 + 56), "collaborationProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "collaborationHighlightForIdentifier:", *(_QWORD *)(a1 + 40));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = *(void **)(a1 + 56);
    objc_msgSend(v12, "originatingParticipantByHighlightIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "vendNoticeForCollaboration:participant:forConversation:type:", v11, v14, *(_QWORD *)(a1 + 48), 15);

  }
}

- (void)participant:(id)a3 removedHighlightFromConversation:(id)a4 highlightIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  TUCollaborationManager *v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[TUCollaborationManager queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __91__TUCollaborationManager_participant_removedHighlightFromConversation_highlightIdentifier___block_invoke;
  v15[3] = &unk_1E38A1B38;
  v16 = v8;
  v17 = v10;
  v18 = v9;
  v19 = self;
  v12 = v9;
  v13 = v10;
  v14 = v8;
  dispatch_async(v11, v15);

}

void __91__TUCollaborationManager_participant_removedHighlightFromConversation_highlightIdentifier___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 48);
    v16 = 138412802;
    v17 = v3;
    v18 = 2112;
    v19 = v4;
    v20 = 2112;
    v21 = v5;
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "Participant: %@ removed highlightIdentifier: %@ from conversation: %@", (uint8_t *)&v16, 0x20u);
  }

  objc_msgSend(*(id *)(a1 + 56), "featureFlags");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "gelatoEnabled");

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 56), "highlightsByIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 56), "originatingParticipantByHighlightIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

    objc_msgSend(*(id *)(a1 + 56), "pendingHighlightIdentifiers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeObject:", *(_QWORD *)(a1 + 40));

    objc_msgSend(*(id *)(a1 + 56), "highlightsByIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

    objc_msgSend(*(id *)(a1 + 56), "conversationsByHighlightIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

    objc_msgSend(*(id *)(a1 + 56), "collaborationStateByIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

    objc_msgSend(*(id *)(a1 + 56), "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "collaborationChanged:forConversation:collaborationState:", 0, *(_QWORD *)(a1 + 48), 0);

    if (v9)
      objc_msgSend(*(id *)(a1 + 56), "vendNoticeForCollaboration:participant:forConversation:type:", v9, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), 16);

  }
}

- (void)setCollaborationState:(int64_t)a3 forCollaborationIdentifier:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  int64_t v11;

  v6 = a4;
  -[TUCollaborationManager queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__TUCollaborationManager_setCollaborationState_forCollaborationIdentifier___block_invoke;
  block[3] = &unk_1E38A2150;
  v10 = v6;
  v11 = a3;
  block[4] = self;
  v8 = v6;
  dispatch_async(v7, block);

}

void __75__TUCollaborationManager_setCollaborationState_forCollaborationIdentifier___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  objc_msgSend(*(id *)(a1 + 32), "featureFlags");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "gelatoEnabled");

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 48));
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "collaborationStateByIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7
      || (objc_msgSend(*(id *)(a1 + 32), "collaborationStateByIdentifier"),
          v1 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v1, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40)),
          v2 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v18, "isEqualToNumber:", v2)))
    {
      objc_msgSend(*(id *)(a1 + 32), "collaborationStateByIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {

      }
      if (v9)
        goto LABEL_11;
    }
    else
    {

    }
    objc_msgSend(*(id *)(a1 + 32), "collaborationStateByIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v18, *(_QWORD *)(a1 + 40));

    objc_msgSend(*(id *)(a1 + 32), "conversationsByHighlightIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "highlightsByIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "conversationsByHighlightIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "collaborationChanged:forConversation:collaborationState:", v15, v17, *(_QWORD *)(a1 + 48));

    }
LABEL_11:

  }
}

- (void)conversationManager:(id)a3 stateChangedForConversation:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  -[TUCollaborationManager queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __74__TUCollaborationManager_conversationManager_stateChangedForConversation___block_invoke;
  v8[3] = &unk_1E38A1388;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, v8);

}

void __74__TUCollaborationManager_conversationManager_stateChangedForConversation___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "featureFlags");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "gelatoEnabled");

  if (v3 && objc_msgSend(*(id *)(a1 + 32), "isIpad") && objc_msgSend(*(id *)(a1 + 40), "state") == 3)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    objc_msgSend(*(id *)(a1 + 40), "activeRemoteParticipants", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(_QWORD *)v17 != v6)
            objc_enumerationMutation(v4);
          v8 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v8, "handle");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 40), "initiator");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v9, "isEqualToHandle:", v10);

          if (v11)
          {
            v5 = v8;
            goto LABEL_14;
          }
        }
        v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v5)
          continue;
        break;
      }
    }
LABEL_14:

    objc_msgSend(*(id *)(a1 + 32), "collaborationProvider");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "highlightIdentifiers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "anyObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "collaborationHighlightForIdentifier:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "vendNoticeForCollaboration:participant:forConversation:type:", v15, v5, *(_QWORD *)(a1 + 40), 15);
  }
}

- (void)startTrackingCollaborationIfNecessaryAndNotifyDelegate:(id)a3 forConversation:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t, uint64_t);
  void *v20;
  TUCollaborationManager *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id location;

  v6 = a3;
  v7 = a4;
  -[TUCollaborationManager queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[TUCollaborationManager featureFlags](self, "featureFlags");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "gelatoEnabled");

  if (v10)
  {
    -[TUCollaborationManager delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v6)
    {
      objc_initWeak(&location, self);
      v17 = MEMORY[0x1E0C809B0];
      v18 = 3221225472;
      v19 = __97__TUCollaborationManager_startTrackingCollaborationIfNecessaryAndNotifyDelegate_forConversation___block_invoke;
      v20 = &unk_1E38A2FB0;
      objc_copyWeak(&v25, &location);
      v21 = self;
      v13 = v6;
      v22 = v13;
      v14 = v12;
      v23 = v14;
      v15 = v7;
      v24 = v15;
      v16 = _Block_copy(&v17);
      objc_msgSend(v14, "startTrackingCollaboration:forConversation:completionHandler:", v13, v15, v16, v17, v18, v19, v20, v21);

      objc_destroyWeak(&v25);
      objc_destroyWeak(&location);
    }
    else
    {
      objc_msgSend(v11, "collaborationChanged:forConversation:collaborationState:", 0, v7, -1);
    }

  }
}

void __97__TUCollaborationManager_startTrackingCollaborationIfNecessaryAndNotifyDelegate_forConversation___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v6;
  id WeakRetained;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 134217984;
    v11 = a2;
    _os_log_impl(&dword_19A50D000, v6, OS_LOG_TYPE_DEFAULT, "Collaboration state for conversation document state %ld", (uint8_t *)&v10, 0xCu);
  }

  if (!a3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    if (WeakRetained)
    {
      v8 = *(void **)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "collaborationIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setCollaborationState:forCollaborationIdentifier:", a2, v9);

      objc_msgSend(*(id *)(a1 + 48), "collaborationChanged:forConversation:collaborationState:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), a2);
    }

  }
}

- (TUCollaborationProvider)collaborationProvider
{
  return self->_collaborationProvider;
}

- (TUCollaborationManagerDelegate)delegate
{
  return (TUCollaborationManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSMutableSet)pendingHighlightIdentifiers
{
  return self->_pendingHighlightIdentifiers;
}

- (void)setPendingHighlightIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_pendingHighlightIdentifiers, a3);
}

- (NSMutableDictionary)originatingParticipantByHighlightIdentifier
{
  return self->_originatingParticipantByHighlightIdentifier;
}

- (void)setOriginatingParticipantByHighlightIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_originatingParticipantByHighlightIdentifier, a3);
}

- (NSMutableDictionary)highlightsByIdentifier
{
  return self->_highlightsByIdentifier;
}

- (void)setHighlightsByIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_highlightsByIdentifier, a3);
}

- (NSMutableDictionary)conversationsByHighlightIdentifier
{
  return self->_conversationsByHighlightIdentifier;
}

- (void)setConversationsByHighlightIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_conversationsByHighlightIdentifier, a3);
}

- (TUFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (BOOL)isIpad
{
  return self->_isIpad;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSMutableDictionary)collaborationStateByIdentifier
{
  return self->_collaborationStateByIdentifier;
}

- (NSString)pendingCollaborationToAdd
{
  return self->_pendingCollaborationToAdd;
}

- (void)setPendingCollaborationToAdd:(id)a3
{
  objc_storeStrong((id *)&self->_pendingCollaborationToAdd, a3);
}

- (TUConversation)pendingConversationToAdd
{
  return self->_pendingConversationToAdd;
}

- (void)setPendingConversationToAdd:(id)a3
{
  objc_storeStrong((id *)&self->_pendingConversationToAdd, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingConversationToAdd, 0);
  objc_storeStrong((id *)&self->_pendingCollaborationToAdd, 0);
  objc_storeStrong((id *)&self->_collaborationStateByIdentifier, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong((id *)&self->_conversationsByHighlightIdentifier, 0);
  objc_storeStrong((id *)&self->_highlightsByIdentifier, 0);
  objc_storeStrong((id *)&self->_originatingParticipantByHighlightIdentifier, 0);
  objc_storeStrong((id *)&self->_pendingHighlightIdentifiers, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_collaborationProvider, 0);
}

@end
