@implementation SLDFaceTimeService

+ (id)remoteObjectProtocol
{
  return &unk_1EE3970F0;
}

+ (id)sharedService
{
  if (sharedService_onceToken_4 != -1)
    dispatch_once(&sharedService_onceToken_4, &__block_literal_global_11);
  return (id)sharedService_sService_4;
}

void __35__SLDFaceTimeService_sharedService__block_invoke()
{
  SLDFaceTimeService *v0;
  void *v1;

  v0 = objc_alloc_init(SLDFaceTimeService);
  v1 = (void *)sharedService_sService_4;
  sharedService_sService_4 = (uint64_t)v0;

}

- (SLDFaceTimeService)init
{
  SLDFaceTimeService *v2;
  SLDFaceTimeService *v3;
  SLDFaceTimeService *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SLDFaceTimeService;
  v2 = -[SLDFaceTimeService init](&v6, sel_init);
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

- (void)initiateTUConversationForAttributionIdentifier:(id)a3 videoEnabled:(BOOL)a4 completion:(id)a5
{
  void *v7;
  NSObject *v8;
  const __CFString *v9;
  void *v10;
  void (*IMSPIResetChatRegistrySymbolLoc)(void);
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  BOOL v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  NSObject *v44;
  id v45;
  SLInteractionHandler *v46;
  void *v47;
  id v48;
  _BOOL4 v49;
  void *v50;
  id v51;
  id v52;
  id obj;
  void *v54;
  _QWORD v55[4];
  id v56;
  id v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _QWORD block[4];
  id v63;
  _BYTE *v64;
  uint8_t v65[128];
  uint8_t v66[4];
  const char *v67;
  __int16 v68;
  id v69;
  __int16 v70;
  void *v71;
  _BYTE buf[24];
  uint64_t (*v73)(uint64_t, uint64_t);
  void (*v74)(uint64_t);
  id v75;
  uint64_t v76;

  v49 = a4;
  v76 = *MEMORY[0x1E0C80C00];
  v51 = a3;
  v52 = a5;
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  if (!IMCoreLibraryCore_frameworkLibrary_0)
  {
    *(_OWORD *)buf = xmmword_1E3795800;
    *(_QWORD *)&buf[16] = 0;
    IMCoreLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  if (!IMCoreLibraryCore_frameworkLibrary_0 || !getIMSPILastAddressedHandleForChatWithGUIDSymbolLoc())
    goto LABEL_18;
  if (!IMCoreLibraryCore_frameworkLibrary_0)
  {
    *(_OWORD *)buf = xmmword_1E3795800;
    *(_QWORD *)&buf[16] = 0;
    IMCoreLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  if (IMCoreLibraryCore_frameworkLibrary_0 && getIMSPIResetChatRegistrySymbolLoc())
  {
    -[SLDFaceTimeService _applicationIdentifierForConnection:](self, "_applicationIdentifierForConnection:", v50);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = -[SLInteractionHandler initWithAppIdentifier:]([SLInteractionHandler alloc], "initWithAppIdentifier:", v47);
    -[SLInteractionHandler fetchAttributionForAttributionIdentifier:](v46, "fetchAttributionForAttributionIdentifier:", v51);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    SLDaemonLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = CFSTR("NO");
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "-[SLDFaceTimeService initiateTUConversationForAttributionIdentifier:videoEnabled:completion:]";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v51;
      if (v49)
        v9 = CFSTR("YES");
      *(_WORD *)&buf[22] = 2112;
      v73 = (uint64_t (*)(uint64_t, uint64_t))v9;
      _os_log_impl(&dword_199EFF000, v8, OS_LOG_TYPE_DEFAULT, "%s: Initiating FaceTime conversation for attribution identifier %@ {videoEnabled: %@}", buf, 0x20u);
    }

    objc_msgSend(v7, "relatedPersons");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v73 = __Block_byref_object_copy__10;
    v74 = __Block_byref_object_dispose__10;
    v75 = 0;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __93__SLDFaceTimeService_initiateTUConversationForAttributionIdentifier_videoEnabled_completion___block_invoke;
    block[3] = &unk_1E37942E8;
    v64 = buf;
    v48 = v7;
    v63 = v48;
    dispatch_sync(MEMORY[0x1E0C80D38], block);
    IMSPIResetChatRegistrySymbolLoc = (void (*)(void))getIMSPIResetChatRegistrySymbolLoc();
    if (!IMSPIResetChatRegistrySymbolLoc)
    {
      dlerror();
      abort_report_np();
      __break(1u);
    }
    IMSPIResetChatRegistrySymbolLoc();
    if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
    {
      SLDaemonLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = *(void **)(*(_QWORD *)&buf[8] + 40);
        objc_msgSend(v48, "conversationIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v66 = 136315650;
        v67 = "-[SLDFaceTimeService initiateTUConversationForAttributionIdentifier:videoEnabled:completion:]";
        v68 = 2112;
        v69 = v13;
        v70 = 2112;
        v71 = v14;
        _os_log_impl(&dword_199EFF000, v12, OS_LOG_TYPE_DEFAULT, "%s: Using last addressed handle: %@ for chat GUID: %@", v66, 0x20u);

      }
      objc_msgSend(MEMORY[0x1E0DBD2F8], "normalizedHandleWithDestinationID:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      SLDaemonLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v66 = 136315394;
        v67 = "-[SLDFaceTimeService initiateTUConversationForAttributionIdentifier:videoEnabled:completion:]";
        v68 = 2112;
        v69 = v51;
        _os_log_impl(&dword_199EFF000, v18, OS_LOG_TYPE_DEFAULT, "%s: Did not receive a last addressed handle string from imagent. This may result in a FaceTime call including the local user. Attribution identifier: %@", v66, 0x16u);
      }

      v15 = 0;
    }
    v54 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v10, "count"));
    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    obj = v10;
    v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v65, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v59;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v59 != v20)
            objc_enumerationMutation(obj);
          v22 = (void *)MEMORY[0x1E0DBD2F8];
          objc_msgSend(*(id *)(*((_QWORD *)&v58 + 1) + 8 * i), "handle");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "normalizedHandleWithDestinationID:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15 && objc_msgSend(v24, "isEquivalentToHandle:", v15))
          {
            SLDaemonLogHandle();
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v66 = 136315394;
              v67 = "-[SLDFaceTimeService initiateTUConversationForAttributionIdentifier:videoEnabled:completion:]";
              v68 = 2112;
              v69 = v24;
              _os_log_impl(&dword_199EFF000, v25, OS_LOG_TYPE_DEFAULT, "%s: Skipping handle %@ when initiating FaceTime conversation because it matches my last addressed handle.", v66, 0x16u);
            }
          }
          else
          {
            v26 = objc_alloc(MEMORY[0x1E0DBD2A0]);
            objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v24);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v26, "initWithHandles:", v27);

            objc_msgSend(v54, "addObject:", v25);
          }

        }
        v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v65, 16);
      }
      while (v19);
    }

    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DBD308]), "initWithRemoteMembers:", v54);
    v29 = v28;
    if (v49)
      v30 = 2;
    else
      v30 = 1;
    objc_msgSend(v28, "setAvMode:", v30);
    objc_msgSend(v29, "setVideoEnabled:", v49);
    objc_msgSend(v29, "setShouldSuppressInCallUI:", 1);
    objc_msgSend(MEMORY[0x1E0DBD2C0], "expanseProvider");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setProvider:", v31);

    if (v49)
      objc_msgSend(v29, "setShouldLaunchBackgroundInCallUI:", 1);
    if (v15)
      objc_msgSend(v29, "setCallerID:", v15);
    if ((unint64_t)objc_msgSend(v54, "count") < 2
      || (objc_msgSend(v48, "groupID"),
          v32 = (void *)objc_claimAutoreleasedReturnValue(),
          v33 = v32 == 0,
          v32,
          v33))
    {
      SLDaemonLogHandle();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v66 = 136315138;
        v67 = "-[SLDFaceTimeService initiateTUConversationForAttributionIdentifier:videoEnabled:completion:]";
        _os_log_impl(&dword_199EFF000, v39, OS_LOG_TYPE_DEFAULT, "%s: FaceTime conversation being initiated is a 1:1.", v66, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0DBD288], "invitationPreferencesForAllHandlesWithStyles:", 4);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v48, "groupDisplayName");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      SLDaemonLogHandle();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v48, "groupID");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v66 = 136315650;
        v67 = "-[SLDFaceTimeService initiateTUConversationForAttributionIdentifier:videoEnabled:completion:]";
        v68 = 2112;
        v69 = v36;
        v70 = 2112;
        v71 = v34;
        _os_log_impl(&dword_199EFF000, v35, OS_LOG_TYPE_DEFAULT, "%s: FaceTime conversation being initiated is a group, setting group ID to %@ and messages group name to %@.", v66, 0x20u);

      }
      objc_msgSend(v48, "groupID");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setMessagesGroupUUID:", v37);

      objc_msgSend(v29, "setMessagesGroupName:", v34);
      objc_msgSend(MEMORY[0x1E0DBD288], "invitationPreferencesForAllHandlesWithStyles:", 2);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v29, "setInvitationPreferences:", v38);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v48, "collaborationMetadata");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "collaborationIdentifier");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setCollaborationIdentifier:", v41);

    }
    SLDaemonLogHandle();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v66 = 136315394;
      v67 = "-[SLDFaceTimeService initiateTUConversationForAttributionIdentifier:videoEnabled:completion:]";
      v68 = 2112;
      v69 = v29;
      _os_log_impl(&dword_199EFF000, v42, OS_LOG_TYPE_DEFAULT, "%s: FaceTime conversation being initiated using join request %@", v66, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0DBD1C0], "sharedInstance");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "queue");
    v44 = objc_claimAutoreleasedReturnValue();
    v55[0] = MEMORY[0x1E0C809B0];
    v55[1] = 3221225472;
    v55[2] = __93__SLDFaceTimeService_initiateTUConversationForAttributionIdentifier_videoEnabled_completion___block_invoke_116;
    v55[3] = &unk_1E3794DE8;
    v56 = v29;
    v57 = v52;
    v45 = v29;
    dispatch_async(v44, v55);

    _Block_object_dispose(buf, 8);
  }
  else
  {
LABEL_18:
    SLDaemonLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[SLDFaceTimeService initiateTUConversationForAttributionIdentifier:videoEnabled:completion:].cold.1((uint64_t)v51, v16, v17);

    (*((void (**)(id, _QWORD))v52 + 2))(v52, 0);
  }

}

void __93__SLDFaceTimeService_initiateTUConversationForAttributionIdentifier_videoEnabled_completion___block_invoke(uint64_t a1)
{
  void (*IMSPILastAddressedHandleForChatWithGUIDSymbolLoc)(id);
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "conversationIdentifier");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  IMSPILastAddressedHandleForChatWithGUIDSymbolLoc = (void (*)(id))getIMSPILastAddressedHandleForChatWithGUIDSymbolLoc();
  if (IMSPILastAddressedHandleForChatWithGUIDSymbolLoc)
  {
    IMSPILastAddressedHandleForChatWithGUIDSymbolLoc(v7);
    v3 = objc_claimAutoreleasedReturnValue();

    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
  else
  {
    v6 = SLDCreateGroupPhotoImageWithGroupID_cold_1();
    __93__SLDFaceTimeService_initiateTUConversationForAttributionIdentifier_videoEnabled_completion___block_invoke_116(v6);
  }
}

uint64_t __93__SLDFaceTimeService_initiateTUConversationForAttributionIdentifier_videoEnabled_completion___block_invoke_116(uint64_t a1)
{
  void *v2;
  int v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t (*v6)(void);
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DBD1C0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "launchAppForJoinRequest:", *(_QWORD *)(a1 + 32));

  SLDaemonLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315138;
      v9 = "-[SLDFaceTimeService initiateTUConversationForAttributionIdentifier:videoEnabled:completion:]_block_invoke";
      _os_log_impl(&dword_199EFF000, v5, OS_LOG_TYPE_DEFAULT, "%s: FaceTime conversation successfully initiated", (uint8_t *)&v8, 0xCu);
    }

    v6 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __93__SLDFaceTimeService_initiateTUConversationForAttributionIdentifier_videoEnabled_completion___block_invoke_116_cold_1();

    v6 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  return v6();
}

- (void)refreshShareableContentMetadataInJoinedConversation
{
  OUTLINED_FUNCTION_4(&dword_199EFF000, a1, a3, "%s: Failed to find bundle identifier for current connection.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void __73__SLDFaceTimeService_refreshShareableContentMetadataInJoinedConversation__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0DBD1C0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __73__SLDFaceTimeService_refreshShareableContentMetadataInJoinedConversation__block_invoke_2;
  v5[3] = &unk_1E37942C0;
  v6 = v2;
  v7 = *(id *)(a1 + 32);
  v4 = v2;
  dispatch_async(v3, v5);

}

void __73__SLDFaceTimeService_refreshShareableContentMetadataInJoinedConversation__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  NSObject *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "conversationManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeConversations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectsPassingTest:", &__block_literal_global_118);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "anyObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "faceTimeRefreshShareableContentURLForBundleIdentifier:", *(_QWORD *)(a1 + 40));
      v6 = objc_claimAutoreleasedReturnValue();
      SLDaemonLogHandle();
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v6)
      {
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v28 = "-[SLDFaceTimeService refreshShareableContentMetadataInJoinedConversation]_block_invoke";
          v29 = 2112;
          v30 = v6;
          _os_log_impl(&dword_199EFF000, v8, OS_LOG_TYPE_DEFAULT, "%s: Opening URL %@.", buf, 0x16u);
        }

        v8 = objc_alloc_init(MEMORY[0x1E0CA5938]);
        v25 = *MEMORY[0x1E0D22D00];
        v26 = MEMORY[0x1E0C9AAB0];
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setFrontBoardOptions:](v8, "setFrontBoardOptions:", v9);

        objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "openURL:configuration:completionHandler:", v6, v8, 0);

      }
      else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        __73__SLDFaceTimeService_refreshShareableContentMetadataInJoinedConversation__block_invoke_2_cold_2();
      }

    }
    else
    {
      SLDaemonLogHandle();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        __73__SLDFaceTimeService_refreshShareableContentMetadataInJoinedConversation__block_invoke_2_cold_3(v6, v18, v19, v20, v21, v22, v23, v24);
    }
  }
  else
  {
    SLDaemonLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __73__SLDFaceTimeService_refreshShareableContentMetadataInJoinedConversation__block_invoke_2_cold_1(v6, v11, v12, v13, v14, v15, v16, v17);
  }

}

BOOL __73__SLDFaceTimeService_refreshShareableContentMetadataInJoinedConversation__block_invoke_3(uint64_t a1, void *a2, _BYTE *a3)
{
  _BOOL8 result;

  result = objc_msgSend(a2, "state") == 3;
  *a3 = result;
  return result;
}

- (id)_applicationIdentifierForConnection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v13;
  _OWORD v14[2];

  v4 = a3;
  v5 = v4;
  v6 = (void *)MEMORY[0x1E0CA5898];
  if (v4)
    objc_msgSend(v4, "auditToken");
  else
    memset(v14, 0, sizeof(v14));
  v13 = 0;
  objc_msgSend(v6, "bundleRecordForAuditToken:error:", v14, &v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v13;
  objc_msgSend(v7, "applicationIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    SLDaemonLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[SLDFaceTimeService _applicationIdentifierForConnection:].cold.1((uint64_t)self, (uint64_t)v8, v10);

  }
  objc_msgSend(v7, "applicationIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_bundleIdentifierForConnection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v13;
  _OWORD v14[2];

  v4 = a3;
  v5 = v4;
  v6 = (void *)MEMORY[0x1E0CA5898];
  if (v4)
    objc_msgSend(v4, "auditToken");
  else
    memset(v14, 0, sizeof(v14));
  v13 = 0;
  objc_msgSend(v6, "bundleRecordForAuditToken:error:", v14, &v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v13;
  objc_msgSend(v7, "bundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    SLDaemonLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[SLDFaceTimeService _bundleIdentifierForConnection:].cold.1((uint64_t)self, (uint64_t)v8, v10);

  }
  objc_msgSend(v7, "bundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)initiateTUConversationForAttributionIdentifier:(uint64_t)a1 videoEnabled:(NSObject *)a2 completion:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 136315394;
  v4 = "-[SLDFaceTimeService initiateTUConversationForAttributionIdentifier:videoEnabled:completion:]";
  v5 = 2112;
  v6 = a1;
  OUTLINED_FUNCTION_15(&dword_199EFF000, a2, a3, "%s: Could not initiate TUConversation for attribution identifier %@. IMCoreIMSPILastAddressedHandleForChatWithGUID or isIMCoreIMSPIResetChatRegistry is unavailable.", (uint8_t *)&v3);
  OUTLINED_FUNCTION_5();
}

void __93__SLDFaceTimeService_initiateTUConversationForAttributionIdentifier_videoEnabled_completion___block_invoke_116_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_15(&dword_199EFF000, v0, v1, "%s: Failed to initiate FaceTime conversation using join request %@", (uint8_t *)v2);
  OUTLINED_FUNCTION_5();
}

void __73__SLDFaceTimeService_refreshShareableContentMetadataInJoinedConversation__block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_199EFF000, a1, a3, "%s: Failed to find joined conversation.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void __73__SLDFaceTimeService_refreshShareableContentMetadataInJoinedConversation__block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_15(&dword_199EFF000, v0, v1, "%s: Failed to create URL with bundle identifier %@.", (uint8_t *)v2);
  OUTLINED_FUNCTION_5();
}

void __73__SLDFaceTimeService_refreshShareableContentMetadataInJoinedConversation__block_invoke_2_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_199EFF000, a1, a3, "%s: NSURL does not respond to +faceTimeRefreshShareableContentURLForBundleIdentifier:.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

- (void)_applicationIdentifierForConnection:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 134218242;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  OUTLINED_FUNCTION_15(&dword_199EFF000, a3, (uint64_t)a3, "[SLDCollaborationAttributionViewService: %p] Failed to generate a bundle record, or the record's app ID is nil. This is required to look up attribution data. Error: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_5();
}

- (void)_bundleIdentifierForConnection:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412802;
  v9 = v7;
  v10 = 2048;
  v11 = a1;
  v12 = 2112;
  v13 = a2;
  _os_log_error_impl(&dword_199EFF000, a3, OS_LOG_TYPE_ERROR, "[%@: %p] Failed to generate a bundle record, or the record's bundle ID is nil. This is required to look up attribution data. Error: %@", (uint8_t *)&v8, 0x20u);

}

@end
