@implementation TUConversationManagerXPCClient

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

void __71__TUConversationManagerXPCClient_conversationManagerClientXPCInterface__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE3D5A28);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)conversationManagerClientXPCInterface_conversationManagerClientXPCInterface;
  conversationManagerClientXPCInterface_conversationManagerClientXPCInterface = v2;

  v4 = (void *)conversationManagerClientXPCInterface_conversationManagerClientXPCInterface;
  objc_msgSend(*(id *)(a1 + 32), "conversationManagerAllowedClasses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_updateConversationsByGroupUUID_, 0, 0);

  v6 = (void *)conversationManagerClientXPCInterface_conversationManagerClientXPCInterface;
  objc_msgSend(*(id *)(a1 + 32), "conversationManagerAllowedClasses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_updateIncomingPendingConversationsByGroupUUID_, 0, 0);

  v8 = (void *)conversationManagerClientXPCInterface_conversationManagerClientXPCInterface;
  objc_msgSend(*(id *)(a1 + 32), "conversationManagerAllowedClasses");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_updateActivatedConversationLinks_, 0, 0);

  v10 = (void *)conversationManagerClientXPCInterface_conversationManagerClientXPCInterface;
  objc_msgSend(*(id *)(a1 + 32), "conversationManagerAllowedClasses");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_conversation_addedMembersLocally_, 0, 0);

  v12 = (void *)conversationManagerClientXPCInterface_conversationManagerClientXPCInterface;
  objc_msgSend(*(id *)(a1 + 32), "conversationManagerAllowedClasses");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setClasses:forSelector:argumentIndex:ofReply:", v13, sel_conversation_addedMembersLocally_, 1, 0);

  v14 = (void *)conversationManagerClientXPCInterface_conversationManagerClientXPCInterface;
  objc_msgSend(*(id *)(a1 + 32), "conversationManagerAllowedClasses");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setClasses:forSelector:argumentIndex:ofReply:", v15, sel_conversation_buzzedMember_, 0, 0);

  v16 = (void *)conversationManagerClientXPCInterface_conversationManagerClientXPCInterface;
  objc_msgSend(*(id *)(a1 + 32), "conversationManagerAllowedClasses");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setClasses:forSelector:argumentIndex:ofReply:", v17, sel_conversation_buzzedMember_, 1, 0);

  v18 = (void *)conversationManagerClientXPCInterface_conversationManagerClientXPCInterface;
  objc_msgSend(*(id *)(a1 + 32), "conversationManagerAllowedClasses");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setClasses:forSelector:argumentIndex:ofReply:", v19, sel_updateActivityAuthorizedBundleIdentifierState_, 0, 0);

  v20 = (void *)conversationManagerClientXPCInterface_conversationManagerClientXPCInterface;
  objc_msgSend(*(id *)(a1 + 32), "conversationManagerAllowedClasses");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setClasses:forSelector:argumentIndex:ofReply:", v21, sel_receivedTrackedPendingMember_forConversationLink_, 0, 0);

  v22 = (void *)conversationManagerClientXPCInterface_conversationManagerClientXPCInterface;
  objc_msgSend(*(id *)(a1 + 32), "conversationManagerAllowedClasses");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel_receivedTrackedPendingMember_forConversationLink_, 1, 0);

  v24 = (void *)conversationManagerClientXPCInterface_conversationManagerClientXPCInterface;
  objc_msgSend(*(id *)(a1 + 32), "conversationManagerAllowedClasses");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setClasses:forSelector:argumentIndex:ofReply:", v25, sel_remoteScreenShareAttributesChanged_isLocallySharing_, 0, 0);

  v26 = (void *)conversationManagerClientXPCInterface_conversationManagerClientXPCInterface;
  objc_msgSend(*(id *)(a1 + 32), "conversationManagerAllowedClasses");
  v27 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setClasses:forSelector:argumentIndex:ofReply:", v27, sel_remoteScreenShareEndedWithReason_, 0, 0);

}

void __71__TUConversationManagerXPCClient_conversationManagerServerXPCInterface__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE3E7340);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)conversationManagerServerXPCInterface_conversationManagerXPCInterface;
  conversationManagerServerXPCInterface_conversationManagerXPCInterface = v2;

  v4 = (void *)conversationManagerServerXPCInterface_conversationManagerXPCInterface;
  objc_msgSend(*(id *)(a1 + 32), "conversationManagerAllowedClasses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_conversationsByGroupUUID_, 0, 1);

  v6 = (void *)conversationManagerServerXPCInterface_conversationManagerXPCInterface;
  objc_msgSend(*(id *)(a1 + 32), "conversationManagerAllowedClasses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_incomingPendingConversationsByGroupUUID_, 0, 1);

  v8 = (void *)conversationManagerServerXPCInterface_conversationManagerXPCInterface;
  objc_msgSend(*(id *)(a1 + 32), "conversationManagerAllowedClasses");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_pseudonymsByCallUUID_, 0, 1);

  v10 = (void *)conversationManagerServerXPCInterface_conversationManagerXPCInterface;
  objc_msgSend(*(id *)(a1 + 32), "conversationManagerAllowedClasses");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_activatedConversationLinks_, 0, 1);

  v12 = (void *)conversationManagerServerXPCInterface_conversationManagerXPCInterface;
  objc_msgSend(*(id *)(a1 + 32), "conversationManagerAllowedClasses");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setClasses:forSelector:argumentIndex:ofReply:", v13, sel_activityAuthorizedBundleIdentifierState_, 0, 1);

  v14 = (void *)conversationManagerServerXPCInterface_conversationManagerXPCInterface;
  objc_msgSend(*(id *)(a1 + 32), "conversationManagerAllowedClasses");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setClasses:forSelector:argumentIndex:ofReply:", v15, sel_addRemoteMembers_otherInvitedHandles_toConversationWithUUID_, 0, 0);

  v16 = (void *)conversationManagerServerXPCInterface_conversationManagerXPCInterface;
  objc_msgSend(*(id *)(a1 + 32), "conversationManagerAllowedClasses");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setClasses:forSelector:argumentIndex:ofReply:", v17, sel_addRemoteMembers_otherInvitedHandles_toConversationWithUUID_, 1, 0);

  v18 = (void *)conversationManagerServerXPCInterface_conversationManagerXPCInterface;
  objc_msgSend(*(id *)(a1 + 32), "conversationManagerAllowedClasses");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setClasses:forSelector:argumentIndex:ofReply:", v19, sel_prepareConversationWithUUID_withHandoffContext_, 1, 0);

  v20 = (void *)conversationManagerServerXPCInterface_conversationManagerXPCInterface;
  objc_msgSend(*(id *)(a1 + 32), "conversationManagerAllowedClasses");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setClasses:forSelector:argumentIndex:ofReply:", v21, sel_setSharePlayHandedOff_onConversationWithUUID_, 1, 0);

  v22 = (void *)conversationManagerServerXPCInterface_conversationManagerXPCInterface;
  objc_msgSend(*(id *)(a1 + 32), "conversationManagerAllowedClasses");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel_updateConversationWithUUID_participantPresentationContexts_, 1, 0);

  v24 = (void *)conversationManagerServerXPCInterface_conversationManagerXPCInterface;
  objc_msgSend(*(id *)(a1 + 32), "conversationManagerAllowedClasses");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setClasses:forSelector:argumentIndex:ofReply:", v25, sel_getLatestRemoteScreenShareAttributesWithCompletionHandler_, 0, 1);

  v26 = (void *)conversationManagerServerXPCInterface_conversationManagerXPCInterface;
  objc_msgSend(*(id *)(a1 + 32), "conversationManagerAllowedClasses");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setClasses:forSelector:argumentIndex:ofReply:", v27, sel_getActiveLinksWithCreatedOnly_completionHandler_, 0, 1);

  v28 = (void *)conversationManagerServerXPCInterface_conversationManagerXPCInterface;
  objc_msgSend(*(id *)(a1 + 32), "conversationManagerAllowedClasses");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setClasses:forSelector:argumentIndex:ofReply:", v29, sel_generateLinkForConversationUUID_completionHandler_, 0, 1);

  v30 = (void *)conversationManagerServerXPCInterface_conversationManagerXPCInterface;
  objc_msgSend(*(id *)(a1 + 32), "conversationManagerAllowedClasses");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setClasses:forSelector:argumentIndex:ofReply:", v31, sel_requestParticipantToShareScreen_forConversationUUID_, 0, 0);

  v32 = (void *)conversationManagerServerXPCInterface_conversationManagerXPCInterface;
  objc_msgSend(*(id *)(a1 + 32), "conversationManagerAllowedClasses");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setClasses:forSelector:argumentIndex:ofReply:", v33, sel_cancelOrDenyScreenShareRequest_forConversationUUID_, 0, 0);

  v34 = (void *)conversationManagerServerXPCInterface_conversationManagerXPCInterface;
  objc_msgSend(*(id *)(a1 + 32), "conversationManagerAllowedClasses");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setClasses:forSelector:argumentIndex:ofReply:", v35, sel_setScreenEnabled_withScreenShareAttributes_forConversationWithUUID_, 0, 0);

  v36 = (void *)conversationManagerServerXPCInterface_conversationManagerXPCInterface;
  objc_msgSend(*(id *)(a1 + 32), "conversationManagerAllowedClasses");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setClasses:forSelector:argumentIndex:ofReply:", v37, sel_generateLinkWithInvitedMemberHandles_linkLifetimeScope_completionHandler_, 0, 0);

  v38 = (void *)conversationManagerServerXPCInterface_conversationManagerXPCInterface;
  objc_msgSend(*(id *)(a1 + 32), "conversationManagerAllowedClasses");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setClasses:forSelector:argumentIndex:ofReply:", v39, sel_generateLinkWithInvitedMemberHandles_linkLifetimeScope_completionHandler_, 0, 1);

  v40 = (void *)conversationManagerServerXPCInterface_conversationManagerXPCInterface;
  objc_msgSend(*(id *)(a1 + 32), "conversationManagerAllowedClasses");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setClasses:forSelector:argumentIndex:ofReply:", v41, sel_addInvitedMemberHandles_toConversationLink_completionHandler_, 0, 0);

  v42 = (void *)conversationManagerServerXPCInterface_conversationManagerXPCInterface;
  objc_msgSend(*(id *)(a1 + 32), "conversationManagerAllowedClasses");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setClasses:forSelector:argumentIndex:ofReply:", v43, sel_addInvitedMemberHandles_toConversationLink_completionHandler_, 1, 0);

  v44 = (void *)conversationManagerServerXPCInterface_conversationManagerXPCInterface;
  objc_msgSend(*(id *)(a1 + 32), "conversationManagerAllowedClasses");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setClasses:forSelector:argumentIndex:ofReply:", v45, sel_addInvitedMemberHandles_toConversationLink_completionHandler_, 0, 1);

  v46 = (void *)conversationManagerServerXPCInterface_conversationManagerXPCInterface;
  objc_msgSend(*(id *)(a1 + 32), "conversationManagerAllowedClasses");
  v47 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setClasses:forSelector:argumentIndex:ofReply:", v47, sel_fetchUpcomingNoticeWithCompletionHandler_, 0, 1);

}

+ (NSSet)conversationManagerAllowedClasses
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
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
  void *v24;

  v24 = (void *)MEMORY[0x1E0C99E60];
  v23 = objc_opt_class();
  v22 = objc_opt_class();
  v21 = objc_opt_class();
  v20 = objc_opt_class();
  v19 = objc_opt_class();
  v18 = objc_opt_class();
  v17 = objc_opt_class();
  v16 = objc_opt_class();
  v15 = objc_opt_class();
  v14 = objc_opt_class();
  v13 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  return (NSSet *)objc_msgSend(v24, "setWithObjects:", v23, v22, v21, v20, v19, v18, v17, v16, v15, v14, v13, v2, v3, v4, v5, v6, v7,
                    v8,
                    v9,
                    v10,
                    v11,
                    objc_opt_class(),
                    0);
}

- (NSDictionary)conversationsByGroupUUID
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__15;
  v11 = __Block_byref_object_dispose__15;
  v12 = 0;
  -[TUConversationManagerXPCClient queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __58__TUConversationManagerXPCClient_conversationsByGroupUUID__block_invoke;
  v6[3] = &unk_1E38A27F0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

uint64_t __64__TUConversationManagerXPCClient_registerWithCompletionHandler___block_invoke(uint64_t a1)
{
  char v2;
  void *v3;
  uint64_t v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "hasRequestedInitialState");
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  if ((v2 & 1) != 0)
    return objc_msgSend(v3, "_invokeCompletionHandler:", v4);
  else
    return objc_msgSend(v3, "_requestInitialStateWithCompletionHandler:", v4);
}

void __58__TUConversationManagerXPCClient_conversationsByGroupUUID__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_requestInitialStateIfNecessary");
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 64));
}

- (void)_requestInitialStateIfNecessary
{
  NSObject *v3;

  -[TUConversationManagerXPCClient queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (!-[TUConversationManagerXPCClient hasRequestedInitialState](self, "hasRequestedInitialState"))
    -[TUConversationManagerXPCClient _requestInitialStateWithCompletionHandler:](self, "_requestInitialStateWithCompletionHandler:", 0);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (BOOL)hasRequestedInitialState
{
  return self->_hasRequestedInitialState;
}

- (void)_requestInitialStateWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint8_t v13[16];
  _QWORD v14[5];
  _QWORD v15[5];
  _QWORD v16[5];
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD v19[5];
  _QWORD v20[5];
  _QWORD v21[5];

  v4 = a3;
  -[TUConversationManagerXPCClient queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[TUConversationManagerXPCClient setHasRequestedInitialState:](self, "setHasRequestedInitialState:", 1);
  if (!-[TUConversationManagerXPCClient shouldConnectToHost](self, "shouldConnectToHost"))
  {
    TUDefaultLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_19A50D000, v12, OS_LOG_TYPE_DEFAULT, "Host has no conversations", v13, 2u);
    }
    goto LABEL_8;
  }
  -[TUConversationManagerXPCClient setHasInitialState:](self, "setHasInitialState:", 1);
  v6 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __76__TUConversationManagerXPCClient__requestInitialStateWithCompletionHandler___block_invoke;
  v21[3] = &unk_1E38A2310;
  v21[4] = self;
  -[TUConversationManagerXPCClient synchronousServerWithErrorHandler:](self, "synchronousServerWithErrorHandler:", v21);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v6;
  v20[1] = 3221225472;
  v20[2] = __76__TUConversationManagerXPCClient__requestInitialStateWithCompletionHandler___block_invoke_43;
  v20[3] = &unk_1E38A4AF0;
  v20[4] = self;
  objc_msgSend(v7, "conversationsByGroupUUID:", v20);

  v19[0] = v6;
  v19[1] = 3221225472;
  v19[2] = __76__TUConversationManagerXPCClient__requestInitialStateWithCompletionHandler___block_invoke_2;
  v19[3] = &unk_1E38A2310;
  v19[4] = self;
  -[TUConversationManagerXPCClient synchronousServerWithErrorHandler:](self, "synchronousServerWithErrorHandler:", v19);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v6;
  v18[1] = 3221225472;
  v18[2] = __76__TUConversationManagerXPCClient__requestInitialStateWithCompletionHandler___block_invoke_44;
  v18[3] = &unk_1E38A4AF0;
  v18[4] = self;
  objc_msgSend(v8, "activityAuthorizedBundleIdentifierState:", v18);

  -[TUConversationManagerXPCClient sharePlayAvailable](self, "sharePlayAvailable");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v17[0] = v6;
    v17[1] = 3221225472;
    v17[2] = __76__TUConversationManagerXPCClient__requestInitialStateWithCompletionHandler___block_invoke_2_48;
    v17[3] = &unk_1E38A2310;
    v17[4] = self;
    -[TUConversationManagerXPCClient synchronousServerWithErrorHandler:](self, "synchronousServerWithErrorHandler:", v17);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v6;
    v16[1] = 3221225472;
    v16[2] = __76__TUConversationManagerXPCClient__requestInitialStateWithCompletionHandler___block_invoke_49;
    v16[3] = &unk_1E38A4708;
    v16[4] = self;
    objc_msgSend(v10, "getSharePlayAvailableWithCompletionHandler:", v16);

  }
  -[TUConversationManagerXPCClient screenSharingAvailable](self, "screenSharingAvailable");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v15[0] = v6;
    v15[1] = 3221225472;
    v15[2] = __76__TUConversationManagerXPCClient__requestInitialStateWithCompletionHandler___block_invoke_3;
    v15[3] = &unk_1E38A2310;
    v15[4] = self;
    -[TUConversationManagerXPCClient synchronousServerWithErrorHandler:](self, "synchronousServerWithErrorHandler:", v15);
    v12 = objc_claimAutoreleasedReturnValue();
    v14[0] = v6;
    v14[1] = 3221225472;
    v14[2] = __76__TUConversationManagerXPCClient__requestInitialStateWithCompletionHandler___block_invoke_51;
    v14[3] = &unk_1E38A4708;
    v14[4] = self;
    -[NSObject getScreenSharingAvailableWithCompletionHandler:](v12, "getScreenSharingAvailableWithCompletionHandler:", v14);
LABEL_8:

  }
  -[TUConversationManagerXPCClient _invokeCompletionHandler:](self, "_invokeCompletionHandler:", v4);

}

- (BOOL)shouldConnectToHost
{
  NSObject *v3;
  _BOOL4 v4;
  uint32_t state;
  uint32_t v6;
  NSObject *v7;
  uint64_t state64;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[TUConversationManagerXPCClient queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (self->_shouldConnectToHost)
  {
    return 1;
  }
  else
  {
    state64 = 0;
    state = notify_get_state(-[TUConversationManagerXPCClient shouldConnectToken](self, "shouldConnectToken"), &state64);
    if (state)
    {
      v6 = state;
      TUDefaultLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v11 = v6;
        _os_log_impl(&dword_19A50D000, v7, OS_LOG_TYPE_DEFAULT, "[WARN] Bad state received when trying to get host conversation status: %lu", buf, 0xCu);
      }

      return self->_shouldConnectToHost;
    }
    else
    {
      v4 = state64 != 0;
      self->_shouldConnectToHost = v4;
    }
  }
  return v4;
}

- (int)shouldConnectToken
{
  return self->_shouldConnectToken;
}

- (void)setHasRequestedInitialState:(BOOL)a3
{
  self->_hasRequestedInitialState = a3;
}

- (void)_invokeCompletionHandler:(id)a3
{
  NSObject *v4;

  if (a3)
  {
    dispatch_get_global_queue(21, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v4, a3);

  }
}

- (void)refreshActiveConversations
{
  id v2;

  -[TUConversationManagerXPCClient asynchronousServerWithErrorHandler:](self, "asynchronousServerWithErrorHandler:", &__block_literal_global_32_0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "refreshActiveConversations");

}

- (void)getActiveLinksWithCreatedOnly:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v6 = a4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __82__TUConversationManagerXPCClient_getActiveLinksWithCreatedOnly_completionHandler___block_invoke;
  v9[3] = &unk_1E38A1448;
  v10 = v6;
  v7 = v6;
  -[TUConversationManagerXPCClient asynchronousServerWithErrorHandler:](self, "asynchronousServerWithErrorHandler:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "getActiveLinksWithCreatedOnly:completionHandler:", v4, v7);

}

- (TUConversationManagerXPCClient)init
{
  TUConversationManagerXPCClient *v2;
  TUConversationManagerXPCClient *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  NSDictionary *conversationsByGroupUUID;
  NSObject *v7;
  TUConversationManagerXPCClient *v8;
  id WeakRetained;
  id v10;
  _QWORD handler[4];
  TUConversationManagerXPCClient *v13;
  id v14;
  id location;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)TUConversationManagerXPCClient;
  v2 = -[TUConversationManagerXPCClient init](&v16, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_accessorLock._os_unfair_lock_opaque = 0;
    v4 = dispatch_queue_create("com.apple.telephonyutilities.conversationmanagerxpcclient", 0);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v4;

    conversationsByGroupUUID = v3->_conversationsByGroupUUID;
    v3->_conversationsByGroupUUID = (NSDictionary *)MEMORY[0x1E0C9AA70];

    objc_initWeak(&location, v3);
    v7 = v3->_queue;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __38__TUConversationManagerXPCClient_init__block_invoke;
    handler[3] = &unk_1E38A4970;
    objc_copyWeak(&v14, &location);
    v8 = v3;
    v13 = v8;
    notify_register_dispatch("CSDConversationManagerClientsShouldConnectNotification", &v3->_shouldConnectToken, v7, handler);
    WeakRetained = objc_loadWeakRetained(&sAsynchronousServer_8);
    objc_msgSend(WeakRetained, "registerClient:", v8);

    v10 = objc_loadWeakRetained(&sSynchronousServer_8);
    objc_msgSend(v10, "registerClient:", v8);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  return v3;
}

- (id)asynchronousServerWithErrorHandler:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  id v7;
  void *v8;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained(&sAsynchronousServer_8);
  v6 = WeakRetained;
  if (WeakRetained)
  {
    v7 = WeakRetained;
  }
  else
  {
    -[TUConversationManagerXPCClient xpcConnection](self, "xpcConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (NSXPCConnection)xpcConnection
{
  os_unfair_lock_s *p_accessorLock;
  NSXPCConnection *xpcConnection;
  NSXPCConnection *v5;
  NSXPCConnection *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSXPCConnection *v10;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id location;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  xpcConnection = self->_xpcConnection;
  if (!xpcConnection)
  {
    v5 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.telephonyutilities.callservicesdaemon.conversationmanager"), 0);
    v6 = self->_xpcConnection;
    self->_xpcConnection = v5;

    objc_msgSend((id)objc_opt_class(), "conversationManagerServerXPCInterface");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](self->_xpcConnection, "setRemoteObjectInterface:", v7);

    objc_msgSend((id)objc_opt_class(), "conversationManagerClientXPCInterface");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](self->_xpcConnection, "setExportedInterface:", v8);

    -[NSXPCConnection setExportedObject:](self->_xpcConnection, "setExportedObject:", self);
    objc_initWeak(&location, self);
    v9 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __47__TUConversationManagerXPCClient_xpcConnection__block_invoke;
    v14[3] = &unk_1E38A13D0;
    objc_copyWeak(&v15, &location);
    -[NSXPCConnection setInvalidationHandler:](self->_xpcConnection, "setInvalidationHandler:", v14);
    v12[0] = v9;
    v12[1] = 3221225472;
    v12[2] = __47__TUConversationManagerXPCClient_xpcConnection__block_invoke_2;
    v12[3] = &unk_1E38A13D0;
    objc_copyWeak(&v13, &location);
    -[NSXPCConnection setInterruptionHandler:](self->_xpcConnection, "setInterruptionHandler:", v12);
    -[NSXPCConnection resume](self->_xpcConnection, "resume");
    objc_destroyWeak(&v13);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
    xpcConnection = self->_xpcConnection;
  }
  v10 = xpcConnection;
  os_unfair_lock_unlock(p_accessorLock);
  return v10;
}

+ (NSXPCInterface)conversationManagerServerXPCInterface
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__TUConversationManagerXPCClient_conversationManagerServerXPCInterface__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (conversationManagerServerXPCInterface_onceToken != -1)
    dispatch_once(&conversationManagerServerXPCInterface_onceToken, block);
  return (NSXPCInterface *)(id)conversationManagerServerXPCInterface_conversationManagerXPCInterface;
}

+ (NSXPCInterface)conversationManagerClientXPCInterface
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__TUConversationManagerXPCClient_conversationManagerClientXPCInterface__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (conversationManagerClientXPCInterface_onceToken != -1)
    dispatch_once(&conversationManagerClientXPCInterface_onceToken, block);
  return (NSXPCInterface *)(id)conversationManagerClientXPCInterface_conversationManagerClientXPCInterface;
}

- (void)registerWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[TUConversationManagerXPCClient queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__TUConversationManagerXPCClient_registerWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E38A1838;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

+ (TUConversationManagerXPCServer)asynchronousServer
{
  return (TUConversationManagerXPCServer *)objc_loadWeakRetained(&sAsynchronousServer_8);
}

+ (void)setAsynchronousServer:(id)a3
{
  objc_storeWeak(&sAsynchronousServer_8, a3);
}

+ (TUConversationManagerXPCServer)synchronousServer
{
  return (TUConversationManagerXPCServer *)objc_loadWeakRetained(&sSynchronousServer_8);
}

+ (void)setSynchronousServer:(id)a3
{
  objc_storeWeak(&sSynchronousServer_8, a3);
}

void __38__TUConversationManagerXPCClient_init__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained
    && objc_msgSend(WeakRetained, "hasRequestedInitialState")
    && (objc_msgSend(v3, "hasInitialState") & 1) == 0)
  {
    objc_msgSend(v3, "queue");
    v4 = objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __38__TUConversationManagerXPCClient_init__block_invoke_2;
    v5[3] = &unk_1E38A1388;
    v6 = v3;
    v7 = *(id *)(a1 + 32);
    dispatch_async(v4, v5);

  }
}

void __38__TUConversationManagerXPCClient_init__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v8 = "CSDConversationManagerClientsShouldConnectNotification";
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "Handling %s by setting up XPC connection", buf, 0xCu);
  }

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 11) = 1;
  v3 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __38__TUConversationManagerXPCClient_init__block_invoke_2;
  v4[3] = &unk_1E38A1388;
  v5 = v3;
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v5, "_requestInitialStateWithCompletionHandler:", v4);

}

{
  NSObject *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __38__TUConversationManagerXPCClient_init__block_invoke_2_3;
  v3[3] = &unk_1E38A1388;
  v4 = *(id *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  dispatch_async(v2, v3);

}

void __38__TUConversationManagerXPCClient_init__block_invoke_2_3(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "conversationsChangedForDataSource:conversationsByGroupUUID:oldConversationsByGroupUUID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 64), MEMORY[0x1E0C9AA70]);

}

- (void)dealloc
{
  objc_super v3;

  notify_cancel(self->_shouldConnectToken);
  -[NSXPCConnection invalidate](self->_xpcConnection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)TUConversationManagerXPCClient;
  -[TUConversationManagerXPCClient dealloc](&v3, sel_dealloc);
}

- (NSDictionary)incomingPendingConversationsByGroupUUID
{
  uint64_t v2;
  void *v3;
  id v4;
  _QWORD v6[5];
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__15;
  v12 = __Block_byref_object_dispose__15;
  v2 = MEMORY[0x1E0C809B0];
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __73__TUConversationManagerXPCClient_incomingPendingConversationsByGroupUUID__block_invoke;
  v7[3] = &unk_1E38A13F8;
  v7[4] = &v8;
  -[TUConversationManagerXPCClient synchronousServerWithErrorHandler:](self, "synchronousServerWithErrorHandler:", v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  v6[1] = 3221225472;
  v6[2] = __73__TUConversationManagerXPCClient_incomingPendingConversationsByGroupUUID__block_invoke_9;
  v6[3] = &unk_1E38A31C0;
  v6[4] = &v8;
  objc_msgSend(v3, "incomingPendingConversationsByGroupUUID:", v6);

  v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSDictionary *)v4;
}

void __73__TUConversationManagerXPCClient_incomingPendingConversationsByGroupUUID__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __73__TUConversationManagerXPCClient_incomingPendingConversationsByGroupUUID__block_invoke_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = MEMORY[0x1E0C9AA70];

}

void __73__TUConversationManagerXPCClient_incomingPendingConversationsByGroupUUID__block_invoke_9(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (NSDictionary)pseudonymsByCallUUID
{
  uint64_t v2;
  void *v3;
  id v4;
  _QWORD v6[5];
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__15;
  v12 = __Block_byref_object_dispose__15;
  v2 = MEMORY[0x1E0C809B0];
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__TUConversationManagerXPCClient_pseudonymsByCallUUID__block_invoke;
  v7[3] = &unk_1E38A13F8;
  v7[4] = &v8;
  -[TUConversationManagerXPCClient synchronousServerWithErrorHandler:](self, "synchronousServerWithErrorHandler:", v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  v6[1] = 3221225472;
  v6[2] = __54__TUConversationManagerXPCClient_pseudonymsByCallUUID__block_invoke_11;
  v6[3] = &unk_1E38A31C0;
  v6[4] = &v8;
  objc_msgSend(v3, "pseudonymsByCallUUID:", v6);

  v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSDictionary *)v4;
}

void __54__TUConversationManagerXPCClient_pseudonymsByCallUUID__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __54__TUConversationManagerXPCClient_pseudonymsByCallUUID__block_invoke_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = MEMORY[0x1E0C9AA70];

}

void __54__TUConversationManagerXPCClient_pseudonymsByCallUUID__block_invoke_11(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (NSSet)activatedConversationLinks
{
  uint64_t v2;
  void *v3;
  id v4;
  _QWORD v6[5];
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__15;
  v12 = __Block_byref_object_dispose__15;
  v2 = MEMORY[0x1E0C809B0];
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__TUConversationManagerXPCClient_activatedConversationLinks__block_invoke;
  v7[3] = &unk_1E38A13F8;
  v7[4] = &v8;
  -[TUConversationManagerXPCClient synchronousServerWithErrorHandler:](self, "synchronousServerWithErrorHandler:", v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  v6[1] = 3221225472;
  v6[2] = __60__TUConversationManagerXPCClient_activatedConversationLinks__block_invoke_12;
  v6[3] = &unk_1E38A2760;
  v6[4] = &v8;
  objc_msgSend(v3, "activatedConversationLinks:", v6);

  v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSSet *)v4;
}

void __60__TUConversationManagerXPCClient_activatedConversationLinks__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = a2;
  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __60__TUConversationManagerXPCClient_activatedConversationLinks__block_invoke_cold_1();

  objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void __60__TUConversationManagerXPCClient_activatedConversationLinks__block_invoke_12(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (NSDictionary)activityAuthorizedBundleIdentifiers
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__15;
  v11 = __Block_byref_object_dispose__15;
  v12 = 0;
  -[TUConversationManagerXPCClient queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __69__TUConversationManagerXPCClient_activityAuthorizedBundleIdentifiers__block_invoke;
  v6[3] = &unk_1E38A27F0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

void __69__TUConversationManagerXPCClient_activityAuthorizedBundleIdentifiers__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_requestInitialStateIfNecessary");
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 72));
}

- (BOOL)autoSharePlayEnabled
{
  TUConversationManagerXPCClient *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[TUConversationManagerXPCClient queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__TUConversationManagerXPCClient_autoSharePlayEnabled__block_invoke;
  v5[3] = &unk_1E38A27F0;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __54__TUConversationManagerXPCClient_autoSharePlayEnabled__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_requestInitialStateIfNecessary");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8);
  return result;
}

- (BOOL)isSharePlayAvailable
{
  TUConversationManagerXPCClient *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[TUConversationManagerXPCClient queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__TUConversationManagerXPCClient_isSharePlayAvailable__block_invoke;
  v5[3] = &unk_1E38A27F0;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __54__TUConversationManagerXPCClient_isSharePlayAvailable__block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  _QWORD v11[5];

  v2 = objc_msgSend(*(id *)(a1 + 32), "shouldConnectToHost");
  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v3, "sharePlayAvailable");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      v5 = MEMORY[0x1E0C809B0];
      v6 = *(void **)(a1 + 32);
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __54__TUConversationManagerXPCClient_isSharePlayAvailable__block_invoke_2;
      v11[3] = &unk_1E38A2310;
      v11[4] = v6;
      objc_msgSend(v6, "synchronousServerWithErrorHandler:", v11);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = v5;
      v10[1] = 3221225472;
      v10[2] = __54__TUConversationManagerXPCClient_isSharePlayAvailable__block_invoke_14;
      v10[3] = &unk_1E38A4708;
      v10[4] = *(_QWORD *)(a1 + 32);
      objc_msgSend(v7, "getSharePlayAvailableWithCompletionHandler:", v10);

    }
  }
  else
  {
    objc_msgSend(v3, "setSharePlayAvailable:", MEMORY[0x1E0C9AAB0]);
  }
  objc_msgSend(*(id *)(a1 + 32), "sharePlayAvailable");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "sharePlayAvailable");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v9, "BOOLValue");

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }

}

void __54__TUConversationManagerXPCClient_isSharePlayAvailable__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __54__TUConversationManagerXPCClient_isSharePlayAvailable__block_invoke_2_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "setSharePlayAvailable:", 0);
}

void __54__TUConversationManagerXPCClient_isSharePlayAvailable__block_invoke_14(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setSharePlayAvailable:", v3);

}

- (BOOL)isScreenSharingAvailable
{
  TUConversationManagerXPCClient *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[TUConversationManagerXPCClient queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__TUConversationManagerXPCClient_isScreenSharingAvailable__block_invoke;
  v5[3] = &unk_1E38A27F0;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __58__TUConversationManagerXPCClient_isScreenSharingAvailable__block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  _QWORD v11[5];

  v2 = objc_msgSend(*(id *)(a1 + 32), "shouldConnectToHost");
  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v3, "screenSharingAvailable");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      v5 = MEMORY[0x1E0C809B0];
      v6 = *(void **)(a1 + 32);
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __58__TUConversationManagerXPCClient_isScreenSharingAvailable__block_invoke_2;
      v11[3] = &unk_1E38A2310;
      v11[4] = v6;
      objc_msgSend(v6, "synchronousServerWithErrorHandler:", v11);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = v5;
      v10[1] = 3221225472;
      v10[2] = __58__TUConversationManagerXPCClient_isScreenSharingAvailable__block_invoke_17;
      v10[3] = &unk_1E38A4708;
      v10[4] = *(_QWORD *)(a1 + 32);
      objc_msgSend(v7, "getScreenSharingAvailableWithCompletionHandler:", v10);

    }
  }
  else
  {
    objc_msgSend(v3, "setScreenSharingAvailable:", MEMORY[0x1E0C9AAB0]);
  }
  objc_msgSend(*(id *)(a1 + 32), "screenSharingAvailable");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "screenSharingAvailable");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v9, "BOOLValue");

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }

}

void __58__TUConversationManagerXPCClient_isScreenSharingAvailable__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __58__TUConversationManagerXPCClient_isScreenSharingAvailable__block_invoke_2_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "setScreenSharingAvailable:", 0);
}

void __58__TUConversationManagerXPCClient_isScreenSharingAvailable__block_invoke_17(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setScreenSharingAvailable:", v3);

}

- (void)addRemoteMembers:(id)a3 otherInvitedHandles:(id)a4 toConversation:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[TUConversationManagerXPCClient asynchronousServerWithErrorHandler:](self, "asynchronousServerWithErrorHandler:", &__block_literal_global_59);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "addRemoteMembers:otherInvitedHandles:toConversationWithUUID:", v10, v9, v11);
}

void __86__TUConversationManagerXPCClient_addRemoteMembers_otherInvitedHandles_toConversation___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __86__TUConversationManagerXPCClient_addRemoteMembers_otherInvitedHandles_toConversation___block_invoke_cold_1();

}

- (void)prepareConversationWithUUID:(id)a3 withHandoffContext:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[TUConversationManagerXPCClient asynchronousServerWithErrorHandler:](self, "asynchronousServerWithErrorHandler:", &__block_literal_global_18_0);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "prepareConversationWithUUID:withHandoffContext:", v7, v6);

}

void __81__TUConversationManagerXPCClient_prepareConversationWithUUID_withHandoffContext___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __81__TUConversationManagerXPCClient_prepareConversationWithUUID_withHandoffContext___block_invoke_cold_1();

}

- (void)setSharePlayHandedOff:(BOOL)a3 onConversationWithUUID:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)();
  void *v12;
  id v13;
  BOOL v14;

  v4 = a3;
  v6 = a4;
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __79__TUConversationManagerXPCClient_setSharePlayHandedOff_onConversationWithUUID___block_invoke;
  v12 = &unk_1E38A4998;
  v14 = v4;
  v13 = v6;
  v7 = v6;
  -[TUConversationManagerXPCClient asynchronousServerWithErrorHandler:](self, "asynchronousServerWithErrorHandler:", &v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSharePlayHandedOff:onConversationWithUUID:", v4, v7, v9, v10, v11, v12);

}

void __79__TUConversationManagerXPCClient_setSharePlayHandedOff_onConversationWithUUID___block_invoke()
{
  NSObject *v0;

  TUDefaultLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __79__TUConversationManagerXPCClient_setSharePlayHandedOff_onConversationWithUUID___block_invoke_cold_1();

}

- (void)updateMessagesGroupName:(id)a3 onConversation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[TUConversationManagerXPCClient asynchronousServerWithErrorHandler:](self, "asynchronousServerWithErrorHandler:", &__block_literal_global_19_1);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "updateMessagesGroupName:onConversationWithUUID:", v7, v8);
}

void __73__TUConversationManagerXPCClient_updateMessagesGroupName_onConversation___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __73__TUConversationManagerXPCClient_updateMessagesGroupName_onConversation___block_invoke_cold_1();

}

- (void)setGridDisplayMode:(unint64_t)a3 conversation:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  -[TUConversationManagerXPCClient asynchronousServerWithErrorHandler:](self, "asynchronousServerWithErrorHandler:", &__block_literal_global_20_1);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setGridDisplayMode:forConversationWithUUID:", a3, v7);
}

void __66__TUConversationManagerXPCClient_setGridDisplayMode_conversation___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __66__TUConversationManagerXPCClient_setGridDisplayMode_conversation___block_invoke_cold_1();

}

- (void)conversationUpdateMessagesGroupPhoto:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[TUConversationManagerXPCClient asynchronousServerWithErrorHandler:](self, "asynchronousServerWithErrorHandler:", &__block_literal_global_21_0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "updateMessagesGroupPhotoOnConversationWithUUID:", v5);
}

void __71__TUConversationManagerXPCClient_conversationUpdateMessagesGroupPhoto___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __71__TUConversationManagerXPCClient_conversationUpdateMessagesGroupPhoto___block_invoke_cold_1();

}

- (void)createActivitySession:(id)a3 onConversation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[TUConversationManagerXPCClient asynchronousServerWithErrorHandler:](self, "asynchronousServerWithErrorHandler:", &__block_literal_global_22_1);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "createActivitySession:onConversationWithUUID:", v7, v8);
}

void __71__TUConversationManagerXPCClient_createActivitySession_onConversation___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __71__TUConversationManagerXPCClient_createActivitySession_onConversation___block_invoke_cold_1();

}

- (void)leaveActivitySession:(id)a3 onConversation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[TUConversationManagerXPCClient asynchronousServerWithErrorHandler:](self, "asynchronousServerWithErrorHandler:", &__block_literal_global_23_0);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "leaveActivitySession:onConversationWithUUID:", v7, v8);
}

void __70__TUConversationManagerXPCClient_leaveActivitySession_onConversation___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __70__TUConversationManagerXPCClient_leaveActivitySession_onConversation___block_invoke_cold_1();

}

- (void)endActivitySession:(id)a3 onConversation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[TUConversationManagerXPCClient asynchronousServerWithErrorHandler:](self, "asynchronousServerWithErrorHandler:", &__block_literal_global_24);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "endActivitySession:onConversationWithUUID:", v7, v8);
}

void __68__TUConversationManagerXPCClient_endActivitySession_onConversation___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __68__TUConversationManagerXPCClient_endActivitySession_onConversation___block_invoke_cold_1();

}

- (void)setUsingAirplay:(BOOL)a3 onActivitySession:(id)a4 onConversationWithUUID:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  id v10;

  v6 = a3;
  v8 = a5;
  v9 = a4;
  -[TUConversationManagerXPCClient asynchronousServerWithErrorHandler:](self, "asynchronousServerWithErrorHandler:", &__block_literal_global_25);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setUsingAirplay:onActivitySession:onConversationWithUUID:", v6, v9, v8);

}

void __91__TUConversationManagerXPCClient_setUsingAirplay_onActivitySession_onConversationWithUUID___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __91__TUConversationManagerXPCClient_setUsingAirplay_onActivitySession_onConversationWithUUID___block_invoke_cold_1();

}

- (void)presentDismissalAlertForActivitySession:(id)a3 onConversation:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)();
  void *v16;
  id v17;
  id v18;

  v6 = a3;
  v7 = a4;
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __89__TUConversationManagerXPCClient_presentDismissalAlertForActivitySession_onConversation___block_invoke;
  v16 = &unk_1E38A49E0;
  v17 = v6;
  v18 = v7;
  v8 = v7;
  v9 = v6;
  -[TUConversationManagerXPCClient asynchronousServerWithErrorHandler:](self, "asynchronousServerWithErrorHandler:", &v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUID", v13, v14, v15, v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "presentDismissalAlertForActivitySessionWithUUID:onConversationWithUUID:", v11, v12);

}

void __89__TUConversationManagerXPCClient_presentDismissalAlertForActivitySession_onConversation___block_invoke()
{
  NSObject *v0;

  TUDefaultLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __89__TUConversationManagerXPCClient_presentDismissalAlertForActivitySession_onConversation___block_invoke_cold_1();

}

- (void)setActivityAuthorization:(BOOL)a3 forBundleIdentifier:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  id v13;
  BOOL v14;

  v4 = a3;
  v6 = a4;
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __79__TUConversationManagerXPCClient_setActivityAuthorization_forBundleIdentifier___block_invoke;
  v12 = &unk_1E38A4998;
  v14 = v4;
  v13 = v6;
  v7 = v6;
  -[TUConversationManagerXPCClient asynchronousServerWithErrorHandler:](self, "asynchronousServerWithErrorHandler:", &v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setActivityAuthorization:forBundleIdentifier:", v4, v7, v9, v10, v11, v12);

}

void __79__TUConversationManagerXPCClient_setActivityAuthorization_forBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __79__TUConversationManagerXPCClient_setActivityAuthorization_forBundleIdentifier___block_invoke_cold_1();

}

- (void)setAutoSharePlayEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[TUConversationManagerXPCClient asynchronousServerWithErrorHandler:](self, "asynchronousServerWithErrorHandler:", &__block_literal_global_26_0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAutoSharePlayEnabled:", v3);

}

void __58__TUConversationManagerXPCClient_setAutoSharePlayEnabled___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __58__TUConversationManagerXPCClient_setAutoSharePlayEnabled___block_invoke_cold_1();

}

- (void)joinConversationWithRequest:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TUConversationManagerXPCClient asynchronousServerWithErrorHandler:](self, "asynchronousServerWithErrorHandler:", &__block_literal_global_27);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "joinConversationWithRequest:", v4);

}

void __62__TUConversationManagerXPCClient_joinConversationWithRequest___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __62__TUConversationManagerXPCClient_joinConversationWithRequest___block_invoke_cold_1();

}

- (void)leaveConversationWithUUID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TUConversationManagerXPCClient asynchronousServerWithErrorHandler:](self, "asynchronousServerWithErrorHandler:", &__block_literal_global_28_0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "leaveConversationWithUUID:", v4);

}

void __60__TUConversationManagerXPCClient_leaveConversationWithUUID___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __60__TUConversationManagerXPCClient_leaveConversationWithUUID___block_invoke_cold_1();

}

- (void)launchApplicationForActivitySessionUUID:(id)a3 authorizedExternally:(BOOL)a4 forceBackground:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;

  v7 = a5;
  v8 = a4;
  v10 = a3;
  v11 = a6;
  v12 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __129__TUConversationManagerXPCClient_launchApplicationForActivitySessionUUID_authorizedExternally_forceBackground_completionHandler___block_invoke;
  v19[3] = &unk_1E38A30E0;
  v20 = v10;
  v13 = v11;
  v21 = v13;
  v14 = v10;
  -[TUConversationManagerXPCClient asynchronousServerWithErrorHandler:](self, "asynchronousServerWithErrorHandler:", v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v12;
  v17[1] = 3221225472;
  v17[2] = __129__TUConversationManagerXPCClient_launchApplicationForActivitySessionUUID_authorizedExternally_forceBackground_completionHandler___block_invoke_29;
  v17[3] = &unk_1E38A1448;
  v18 = v13;
  v16 = v13;
  objc_msgSend(v15, "launchApplicationForActivitySessionUUID:authorizedExternally:forceBackground:completionHandler:", v14, v8, v7, v17);

}

void __129__TUConversationManagerXPCClient_launchApplicationForActivitySessionUUID_authorizedExternally_forceBackground_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __129__TUConversationManagerXPCClient_launchApplicationForActivitySessionUUID_authorizedExternally_forceBackground_completionHandler___block_invoke_cold_1(a1, (uint64_t)v3, v4);

  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

void __129__TUConversationManagerXPCClient_launchApplicationForActivitySessionUUID_authorizedExternally_forceBackground_completionHandler___block_invoke_29(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_19A50D000, v4, OS_LOG_TYPE_DEFAULT, "LaunchApplication error: %@", (uint8_t *)&v6, 0xCu);
  }

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

- (void)buzzMember:(id)a3 conversation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[TUConversationManagerXPCClient asynchronousServerWithErrorHandler:](self, "asynchronousServerWithErrorHandler:", &__block_literal_global_30);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "buzzMember:conversationUUID:", v7, v8);
}

void __58__TUConversationManagerXPCClient_buzzMember_conversation___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_19A50D000, v3, OS_LOG_TYPE_DEFAULT, "Error buzzing member: %@", (uint8_t *)&v4, 0xCu);
  }

}

- (void)kickMember:(id)a3 conversation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[TUConversationManagerXPCClient asynchronousServerWithErrorHandler:](self, "asynchronousServerWithErrorHandler:", &__block_literal_global_31_1);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "kickMember:conversationUUID:", v7, v8);
}

void __58__TUConversationManagerXPCClient_kickMember_conversation___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_19A50D000, v3, OS_LOG_TYPE_DEFAULT, "Error kicking member: %@", (uint8_t *)&v4, 0xCu);
  }

}

- (void)setDownlinkMuted:(BOOL)a3 forRemoteParticipantsInConversation:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  id v14;
  BOOL v15;

  v4 = a3;
  v6 = a4;
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __87__TUConversationManagerXPCClient_setDownlinkMuted_forRemoteParticipantsInConversation___block_invoke;
  v13 = &unk_1E38A4998;
  v15 = v4;
  v14 = v6;
  v7 = v6;
  -[TUConversationManagerXPCClient asynchronousServerWithErrorHandler:](self, "asynchronousServerWithErrorHandler:", &v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUID", v10, v11, v12, v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDownlinkMuted:forRemoteParticipantsInConversationWithUUID:", v4, v9);

}

void __87__TUConversationManagerXPCClient_setDownlinkMuted_forRemoteParticipantsInConversation___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  _DWORD v7[2];
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(unsigned __int8 *)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 32);
    v7[0] = 67109634;
    v7[1] = v5;
    v8 = 2112;
    v9 = v6;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_19A50D000, v4, OS_LOG_TYPE_DEFAULT, "Error setting downlink muted: (%d) for remote participants in conversation: %@ with error: %@", (uint8_t *)v7, 0x1Cu);
  }

}

- (void)addScreenSharingType:(unint64_t)a3 forConversation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  id v14;
  unint64_t v15;

  v6 = a4;
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __71__TUConversationManagerXPCClient_addScreenSharingType_forConversation___block_invoke;
  v13 = &unk_1E38A4A28;
  v14 = v6;
  v15 = a3;
  v7 = v6;
  -[TUConversationManagerXPCClient asynchronousServerWithErrorHandler:](self, "asynchronousServerWithErrorHandler:", &v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUID", v10, v11, v12, v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addScreenSharingType:forConversationUUID:", a3, v9);

}

void __71__TUConversationManagerXPCClient_addScreenSharingType_forConversation___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __71__TUConversationManagerXPCClient_addScreenSharingType_forConversation___block_invoke_cold_1();

}

- (void)getLatestRemoteScreenShareAttributesWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __92__TUConversationManagerXPCClient_getLatestRemoteScreenShareAttributesWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E38A1448;
  v8 = v4;
  v5 = v4;
  -[TUConversationManagerXPCClient asynchronousServerWithErrorHandler:](self, "asynchronousServerWithErrorHandler:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getLatestRemoteScreenShareAttributesWithCompletionHandler:", v5);

}

void __92__TUConversationManagerXPCClient_getLatestRemoteScreenShareAttributesWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_19A50D000, v4, OS_LOG_TYPE_DEFAULT, "Failed to get latest remote screen share attributes with error: %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __60__TUConversationManagerXPCClient_refreshActiveConversations__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __60__TUConversationManagerXPCClient_refreshActiveConversations__block_invoke_cold_1();

}

void __82__TUConversationManagerXPCClient_getActiveLinksWithCreatedOnly_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_19A50D000, v4, OS_LOG_TYPE_DEFAULT, "Error in retrieving active links: %@", (uint8_t *)&v6, 0xCu);
  }

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

- (void)generateLinkForConversation:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __80__TUConversationManagerXPCClient_generateLinkForConversation_completionHandler___block_invoke;
  v11[3] = &unk_1E38A1448;
  v12 = v6;
  v7 = v6;
  v8 = a3;
  -[TUConversationManagerXPCClient asynchronousServerWithErrorHandler:](self, "asynchronousServerWithErrorHandler:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "generateLinkForConversationUUID:completionHandler:", v10, v7);
}

void __80__TUConversationManagerXPCClient_generateLinkForConversation_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_19A50D000, v4, OS_LOG_TYPE_DEFAULT, "Error in generating link (for conversation): %@", (uint8_t *)&v6, 0xCu);
  }

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

- (void)generateLinkWithInvitedMemberHandles:(id)a3 linkLifetimeScope:(int64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v8 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __107__TUConversationManagerXPCClient_generateLinkWithInvitedMemberHandles_linkLifetimeScope_completionHandler___block_invoke;
  v12[3] = &unk_1E38A1448;
  v13 = v8;
  v9 = v8;
  v10 = a3;
  -[TUConversationManagerXPCClient asynchronousServerWithErrorHandler:](self, "asynchronousServerWithErrorHandler:", v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "generateLinkWithInvitedMemberHandles:linkLifetimeScope:completionHandler:", v10, a4, v9);

}

void __107__TUConversationManagerXPCClient_generateLinkWithInvitedMemberHandles_linkLifetimeScope_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_19A50D000, v4, OS_LOG_TYPE_DEFAULT, "Error in generating link (with invited member handles): %@", (uint8_t *)&v6, 0xCu);
  }

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

- (void)addInvitedMemberHandles:(id)a3 toConversationLink:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v8 = a5;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __95__TUConversationManagerXPCClient_addInvitedMemberHandles_toConversationLink_completionHandler___block_invoke;
  v13[3] = &unk_1E38A1448;
  v14 = v8;
  v9 = v8;
  v10 = a4;
  v11 = a3;
  -[TUConversationManagerXPCClient asynchronousServerWithErrorHandler:](self, "asynchronousServerWithErrorHandler:", v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addInvitedMemberHandles:toConversationLink:completionHandler:", v11, v10, v9);

}

void __95__TUConversationManagerXPCClient_addInvitedMemberHandles_toConversationLink_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_19A50D000, v4, OS_LOG_TYPE_DEFAULT, "Error in adding invited members to link: %@", (uint8_t *)&v6, 0xCu);
  }

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

- (void)invalidateLink:(id)a3 deleteReason:(int64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v8 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __80__TUConversationManagerXPCClient_invalidateLink_deleteReason_completionHandler___block_invoke;
  v12[3] = &unk_1E38A1448;
  v13 = v8;
  v9 = v8;
  v10 = a3;
  -[TUConversationManagerXPCClient asynchronousServerWithErrorHandler:](self, "asynchronousServerWithErrorHandler:", v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "invalidateLink:deleteReason:completionHandler:", v10, a4, v9);

}

void __80__TUConversationManagerXPCClient_invalidateLink_deleteReason_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_19A50D000, v4, OS_LOG_TYPE_DEFAULT, "Error in invalidating link: %@", (uint8_t *)&v6, 0xCu);
  }

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

- (void)renewLink:(id)a3 expirationDate:(id)a4 reason:(unint64_t)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;

  v10 = a6;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __84__TUConversationManagerXPCClient_renewLink_expirationDate_reason_completionHandler___block_invoke;
  v15[3] = &unk_1E38A1448;
  v16 = v10;
  v11 = v10;
  v12 = a4;
  v13 = a3;
  -[TUConversationManagerXPCClient asynchronousServerWithErrorHandler:](self, "asynchronousServerWithErrorHandler:", v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "renewLink:expirationDate:reason:completionHandler:", v13, v12, a5, v11);

}

void __84__TUConversationManagerXPCClient_renewLink_expirationDate_reason_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_19A50D000, v4, OS_LOG_TYPE_DEFAULT, "Error in renewing link to new expiration date: %@", (uint8_t *)&v6, 0xCu);
  }

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

- (void)checkLinkValidity:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __70__TUConversationManagerXPCClient_checkLinkValidity_completionHandler___block_invoke;
  v10[3] = &unk_1E38A1448;
  v11 = v6;
  v7 = v6;
  v8 = a3;
  -[TUConversationManagerXPCClient asynchronousServerWithErrorHandler:](self, "asynchronousServerWithErrorHandler:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "checkLinkValidity:completionHandler:", v8, v7);

}

void __70__TUConversationManagerXPCClient_checkLinkValidity_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_19A50D000, v4, OS_LOG_TYPE_DEFAULT, "Error in checking the validity of the link: %@", (uint8_t *)&v6, 0xCu);
  }

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v5 + 16))(v5, 0, 0, v3);

}

- (void)getInactiveLinkWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __71__TUConversationManagerXPCClient_getInactiveLinkWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E38A1448;
  v8 = v4;
  v5 = v4;
  -[TUConversationManagerXPCClient asynchronousServerWithErrorHandler:](self, "asynchronousServerWithErrorHandler:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getInactiveLinkWithCompletionHandler:", v5);

}

void __71__TUConversationManagerXPCClient_getInactiveLinkWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_19A50D000, v4, OS_LOG_TYPE_DEFAULT, "Error in obtaining an inactive pre-prepared link: %@", (uint8_t *)&v6, 0xCu);
  }

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

- (void)activateLink:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __65__TUConversationManagerXPCClient_activateLink_completionHandler___block_invoke;
  v10[3] = &unk_1E38A1448;
  v11 = v6;
  v7 = v6;
  v8 = a3;
  -[TUConversationManagerXPCClient asynchronousServerWithErrorHandler:](self, "asynchronousServerWithErrorHandler:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "activateLink:completionHandler:", v8, v7);

}

void __65__TUConversationManagerXPCClient_activateLink_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_19A50D000, v4, OS_LOG_TYPE_DEFAULT, "Error in activating a pre-prepared link: %@", (uint8_t *)&v6, 0xCu);
  }

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

- (void)setLinkName:(id)a3 forConversationLink:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v8 = a5;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __84__TUConversationManagerXPCClient_setLinkName_forConversationLink_completionHandler___block_invoke;
  v13[3] = &unk_1E38A1448;
  v14 = v8;
  v9 = v8;
  v10 = a4;
  v11 = a3;
  -[TUConversationManagerXPCClient asynchronousServerWithErrorHandler:](self, "asynchronousServerWithErrorHandler:", v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setLinkName:forConversationLink:completionHandler:", v11, v10, v9);

}

void __84__TUConversationManagerXPCClient_setLinkName_forConversationLink_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_19A50D000, v4, OS_LOG_TYPE_DEFAULT, "Error in setting link name: %@", (uint8_t *)&v6, 0xCu);
  }

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

- (void)scheduleConversationLinkCheckInInitial:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[TUConversationManagerXPCClient asynchronousServerWithErrorHandler:](self, "asynchronousServerWithErrorHandler:", &__block_literal_global_33_0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scheduleConversationLinkCheckInInitial:", v3);

}

void __73__TUConversationManagerXPCClient_scheduleConversationLinkCheckInInitial___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_19A50D000, v3, OS_LOG_TYPE_DEFAULT, "Error in scheduling a sync for activated conversation links: %@", (uint8_t *)&v4, 0xCu);
  }

}

- (void)linkSyncStateIncludeLinks:(BOOL)a3 WithCompletion:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a3;
  v6 = a4;
  -[TUConversationManagerXPCClient synchronousServerWithErrorHandler:](self, "synchronousServerWithErrorHandler:", &__block_literal_global_34_2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "linkSyncStateIncludeLinks:WithCompletion:", v4, v6);

}

void __75__TUConversationManagerXPCClient_linkSyncStateIncludeLinks_WithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_19A50D000, v3, OS_LOG_TYPE_DEFAULT, "Error in getting link sync state: %@", (uint8_t *)&v4, 0xCu);
  }

}

- (void)approvePendingMember:(id)a3 forConversation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[TUConversationManagerXPCClient asynchronousServerWithErrorHandler:](self, "asynchronousServerWithErrorHandler:", &__block_literal_global_35_0);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "approvePendingMember:forConversationUUID:", v7, v8);
}

void __71__TUConversationManagerXPCClient_approvePendingMember_forConversation___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_19A50D000, v3, OS_LOG_TYPE_DEFAULT, "Error in approving pending member waiting to be let-in: %@", (uint8_t *)&v4, 0xCu);
  }

}

- (void)requestParticipantToShareScreen:(id)a3 forConversation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[TUConversationManagerXPCClient asynchronousServerWithErrorHandler:](self, "asynchronousServerWithErrorHandler:", &__block_literal_global_36_0);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "requestParticipantToShareScreen:forConversationUUID:", v7, v8);
}

void __82__TUConversationManagerXPCClient_requestParticipantToShareScreen_forConversation___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_19A50D000, v3, OS_LOG_TYPE_DEFAULT, "Error in generating screen share request with requested Participant: %@", (uint8_t *)&v4, 0xCu);
  }

}

- (void)cancelOrDenyScreenShareRequest:(id)a3 forConversation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[TUConversationManagerXPCClient asynchronousServerWithErrorHandler:](self, "asynchronousServerWithErrorHandler:", &__block_literal_global_37_0);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "cancelOrDenyScreenShareRequest:forConversationUUID:", v7, v8);
}

void __81__TUConversationManagerXPCClient_cancelOrDenyScreenShareRequest_forConversation___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_19A50D000, v3, OS_LOG_TYPE_DEFAULT, "cancelling screen share request failed with error %@", (uint8_t *)&v4, 0xCu);
  }

}

- (void)setScreenEnabled:(BOOL)a3 withScreenShareAttributes:(id)a4 forConversationWithUUID:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v6 = a3;
  v8 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __101__TUConversationManagerXPCClient_setScreenEnabled_withScreenShareAttributes_forConversationWithUUID___block_invoke;
  v12[3] = &unk_1E38A2310;
  v13 = v8;
  v9 = v8;
  v10 = a4;
  -[TUConversationManagerXPCClient asynchronousServerWithErrorHandler:](self, "asynchronousServerWithErrorHandler:", v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setScreenEnabled:withScreenShareAttributes:forConversationWithUUID:", v6, v10, v9);

}

void __101__TUConversationManagerXPCClient_setScreenEnabled_withScreenShareAttributes_forConversationWithUUID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138412546;
    v7 = v3;
    v8 = 2112;
    v9 = v5;
    _os_log_impl(&dword_19A50D000, v4, OS_LOG_TYPE_DEFAULT, "Error: %@ in setting screen enabled for conversationWithUUID: %@", (uint8_t *)&v6, 0x16u);
  }

}

- (void)rejectPendingMember:(id)a3 forConversation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[TUConversationManagerXPCClient asynchronousServerWithErrorHandler:](self, "asynchronousServerWithErrorHandler:", &__block_literal_global_38);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "rejectPendingMember:forConversationUUID:", v7, v8);
}

void __70__TUConversationManagerXPCClient_rejectPendingMember_forConversation___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_19A50D000, v3, OS_LOG_TYPE_DEFAULT, "Error in rejecting pending member waiting to be let-in: %@", (uint8_t *)&v4, 0xCu);
  }

}

- (void)setIgnoreLetMeInRequests:(BOOL)a3 forConversation:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;

  v4 = a3;
  v6 = a4;
  -[TUConversationManagerXPCClient asynchronousServerWithErrorHandler:](self, "asynchronousServerWithErrorHandler:", &__block_literal_global_39_0);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setIgnoreLetMeInRequests:forConversationUUID:", v4, v7);
}

void __75__TUConversationManagerXPCClient_setIgnoreLetMeInRequests_forConversation___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_19A50D000, v3, OS_LOG_TYPE_DEFAULT, "Error in setting ignore let me in requests: %@", (uint8_t *)&v4, 0xCu);
  }

}

- (void)fetchUpcomingNoticeWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __75__TUConversationManagerXPCClient_fetchUpcomingNoticeWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E38A1448;
  v8 = v4;
  v5 = v4;
  -[TUConversationManagerXPCClient asynchronousServerWithErrorHandler:](self, "asynchronousServerWithErrorHandler:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchUpcomingNoticeWithCompletionHandler:", v5);

}

void __75__TUConversationManagerXPCClient_fetchUpcomingNoticeWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __75__TUConversationManagerXPCClient_fetchUpcomingNoticeWithCompletionHandler___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

- (void)activateConversationNoticeWithActionURL:(id)a3 bundleIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)();
  void *v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __91__TUConversationManagerXPCClient_activateConversationNoticeWithActionURL_bundleIdentifier___block_invoke;
  v14 = &unk_1E38A49E0;
  v15 = v6;
  v16 = v7;
  v8 = v7;
  v9 = v6;
  -[TUConversationManagerXPCClient asynchronousServerWithErrorHandler:](self, "asynchronousServerWithErrorHandler:", &v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "activateConversationNoticeWithActionURL:bundleIdentifier:", v9, v8, v11, v12, v13, v14);

}

void __91__TUConversationManagerXPCClient_activateConversationNoticeWithActionURL_bundleIdentifier___block_invoke()
{
  NSObject *v0;

  TUDefaultLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __91__TUConversationManagerXPCClient_activateConversationNoticeWithActionURL_bundleIdentifier___block_invoke_cold_1();

}

- (void)removeConversationNoticeWithUUID:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__TUConversationManagerXPCClient_removeConversationNoticeWithUUID___block_invoke;
  v7[3] = &unk_1E38A2310;
  v8 = v4;
  v5 = v4;
  -[TUConversationManagerXPCClient asynchronousServerWithErrorHandler:](self, "asynchronousServerWithErrorHandler:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeConversationNoticeWithUUID:", v5);

}

void __67__TUConversationManagerXPCClient_removeConversationNoticeWithUUID___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  TUDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __67__TUConversationManagerXPCClient_removeConversationNoticeWithUUID___block_invoke_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);

}

- (void)invalidate
{
  os_unfair_lock_s *p_accessorLock;
  id WeakRetained;
  id v5;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  -[NSXPCConnection invalidate](self->_xpcConnection, "invalidate");
  WeakRetained = objc_loadWeakRetained(&sAsynchronousServer_8);
  objc_msgSend(WeakRetained, "unregisterClient:", self);

  v5 = objc_loadWeakRetained(&sSynchronousServer_8);
  objc_msgSend(v5, "unregisterClient:", self);

  os_unfair_lock_unlock(p_accessorLock);
}

- (void)updateConversationWithUUID:(id)a3 participantPresentationContexts:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[TUConversationManagerXPCClient asynchronousServerWithErrorHandler:](self, "asynchronousServerWithErrorHandler:", &__block_literal_global_40_1);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateConversationWithUUID:participantPresentationContexts:", v7, v6);

}

void __93__TUConversationManagerXPCClient_updateConversationWithUUID_participantPresentationContexts___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __93__TUConversationManagerXPCClient_updateConversationWithUUID_participantPresentationContexts___block_invoke_cold_1();

}

- (void)setSupportsMessagesGroupProviding:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[TUConversationManagerXPCClient asynchronousServerWithErrorHandler:](self, "asynchronousServerWithErrorHandler:", &__block_literal_global_41_1);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSupportsMessagesGroupProviding:", v3);

}

void __68__TUConversationManagerXPCClient_setSupportsMessagesGroupProviding___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __68__TUConversationManagerXPCClient_setSupportsMessagesGroupProviding___block_invoke_cold_1();

}

- (void)getMessagesGroupDetailsForConversationUUID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[TUConversationManagerXPCClient asynchronousServerWithErrorHandler:](self, "asynchronousServerWithErrorHandler:", &__block_literal_global_42);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "getMessagesGroupDetailsForConversationUUID:completionHandler:", v7, v6);

}

void __95__TUConversationManagerXPCClient_getMessagesGroupDetailsForConversationUUID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __95__TUConversationManagerXPCClient_getMessagesGroupDetailsForConversationUUID_completionHandler___block_invoke_cold_1();

}

void __76__TUConversationManagerXPCClient__requestInitialStateWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __76__TUConversationManagerXPCClient__requestInitialStateWithCompletionHandler___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = MEMORY[0x1E0C9AA70];

  objc_msgSend(*(id *)(a1 + 32), "setHasInitialState:", 0);
}

void __76__TUConversationManagerXPCClient__requestInitialStateWithCompletionHandler___block_invoke_43(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 64), a2);
}

void __76__TUConversationManagerXPCClient__requestInitialStateWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __76__TUConversationManagerXPCClient__requestInitialStateWithCompletionHandler___block_invoke_2_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = MEMORY[0x1E0C9AA70];

  objc_msgSend(*(id *)(a1 + 32), "setHasInitialState:", 0);
}

void __76__TUConversationManagerXPCClient__requestInitialStateWithCompletionHandler___block_invoke_44(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("bk"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v4;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("gk"));
  v7 = (id)objc_claimAutoreleasedReturnValue();

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = objc_msgSend(v7, "BOOLValue");
}

void __76__TUConversationManagerXPCClient__requestInitialStateWithCompletionHandler___block_invoke_2_48(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __76__TUConversationManagerXPCClient__requestInitialStateWithCompletionHandler___block_invoke_2_48_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "setSharePlayAvailable:", 0);
}

void __76__TUConversationManagerXPCClient__requestInitialStateWithCompletionHandler___block_invoke_49(uint64_t a1, uint64_t a2)
{
  char v2;
  void *v4;
  NSObject *v5;
  _QWORD v6[5];
  char v7;

  v2 = a2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setSharePlayAvailable:", v4);

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __76__TUConversationManagerXPCClient__requestInitialStateWithCompletionHandler___block_invoke_2_50;
  v6[3] = &unk_1E38A19E0;
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v2;
  dispatch_async(v5, v6);

}

void __76__TUConversationManagerXPCClient__requestInitialStateWithCompletionHandler___block_invoke_2_50(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sharePlayAvailableChanged:", *(unsigned __int8 *)(a1 + 40));

}

void __76__TUConversationManagerXPCClient__requestInitialStateWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __76__TUConversationManagerXPCClient__requestInitialStateWithCompletionHandler___block_invoke_3_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "setScreenSharingAvailable:", 0);
}

void __76__TUConversationManagerXPCClient__requestInitialStateWithCompletionHandler___block_invoke_51(uint64_t a1, uint64_t a2)
{
  char v2;
  void *v4;
  NSObject *v5;
  _QWORD v6[5];
  char v7;

  v2 = a2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setScreenSharingAvailable:", v4);

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __76__TUConversationManagerXPCClient__requestInitialStateWithCompletionHandler___block_invoke_2_52;
  v6[3] = &unk_1E38A19E0;
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v2;
  dispatch_async(v5, v6);

}

void __76__TUConversationManagerXPCClient__requestInitialStateWithCompletionHandler___block_invoke_2_52(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "screenSharingAvailableChanged:", *(unsigned __int8 *)(a1 + 40));

}

- (void)handleServerDisconnect
{
  NSObject *v3;
  NSObject *v4;
  NSDictionary *conversationsByGroupUUID;
  NSDictionary *v6;
  NSNumber *sharePlayAvailable;
  NSNumber *screenSharingAvailable;
  void *v9;
  uint8_t v10[16];

  -[TUConversationManagerXPCClient queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_19A50D000, v4, OS_LOG_TYPE_DEFAULT, "Server did disconnect", v10, 2u);
  }

  conversationsByGroupUUID = self->_conversationsByGroupUUID;
  self->_conversationsByGroupUUID = (NSDictionary *)MEMORY[0x1E0C9AA70];
  v6 = conversationsByGroupUUID;

  self->_hasInitialState = 0;
  sharePlayAvailable = self->_sharePlayAvailable;
  self->_sharePlayAvailable = 0;

  screenSharingAvailable = self->_screenSharingAvailable;
  self->_screenSharingAvailable = 0;

  -[TUConversationManagerXPCClient delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "serverDisconnectedForDataSource:oldConversationsByGroupUUID:", self, v6);

}

void __47__TUConversationManagerXPCClient_xpcConnection__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  NSObject *v3;
  _QWORD block[5];
  uint8_t buf[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    TUDefaultLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "XPC connection invalidated.", buf, 2u);
    }

    objc_msgSend(WeakRetained, "setXpcConnection:", 0);
    objc_msgSend(WeakRetained, "queue");
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__TUConversationManagerXPCClient_xpcConnection__block_invoke_56;
    block[3] = &unk_1E38A1360;
    block[4] = WeakRetained;
    dispatch_async(v3, block);

  }
}

uint64_t __47__TUConversationManagerXPCClient_xpcConnection__block_invoke_56(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleServerDisconnect");
}

void __47__TUConversationManagerXPCClient_xpcConnection__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  NSObject *v3;
  _QWORD block[5];
  uint8_t buf[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    TUDefaultLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "XPC connection interrupted.", buf, 2u);
    }

    objc_msgSend(WeakRetained, "queue");
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__TUConversationManagerXPCClient_xpcConnection__block_invoke_57;
    block[3] = &unk_1E38A1360;
    block[4] = WeakRetained;
    dispatch_async(v3, block);

  }
}

uint64_t __47__TUConversationManagerXPCClient_xpcConnection__block_invoke_57(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleServerDisconnect");
}

- (void)setXpcConnection:(id)a3
{
  os_unfair_lock_s *p_accessorLock;
  NSXPCConnection **p_xpcConnection;
  NSXPCConnection *xpcConnection;
  NSXPCConnection *v8;

  v8 = (NSXPCConnection *)a3;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  xpcConnection = self->_xpcConnection;
  p_xpcConnection = &self->_xpcConnection;
  if (xpcConnection != v8)
    objc_storeStrong((id *)p_xpcConnection, a3);
  os_unfair_lock_unlock(p_accessorLock);

}

- (id)synchronousServerWithErrorHandler:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  id v7;
  void *v8;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained(&sSynchronousServer_8);
  v6 = WeakRetained;
  if (WeakRetained)
  {
    v7 = WeakRetained;
  }
  else
  {
    -[TUConversationManagerXPCClient xpcConnection](self, "xpcConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (void)updateConversationsByGroupUUID:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  TUConversationManagerXPCClient *v9;

  v4 = a3;
  -[TUConversationManagerXPCClient queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__TUConversationManagerXPCClient_updateConversationsByGroupUUID___block_invoke;
  v7[3] = &unk_1E38A1388;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __65__TUConversationManagerXPCClient_updateConversationsByGroupUUID___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "allKeys");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412290;
    v11 = v3;
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "conversationsByGroupUUID keys: %@", (uint8_t *)&v10, 0xCu);

  }
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(v4 + 64);
  v6 = *(id *)(a1 + 32);
  v7 = *(void **)(v4 + 64);
  *(_QWORD *)(v4 + 64) = v6;
  v8 = v5;

  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "conversationsChangedForDataSource:conversationsByGroupUUID:oldConversationsByGroupUUID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), v8);

}

- (void)updateIncomingPendingConversationsByGroupUUID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TUConversationManagerXPCClient delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "conversationsChangedForDataSource:updatedIncomingPendingConversationsByGroupUUID:", self, v4);

}

- (void)activeParticipant:(id)a3 addedHighlightToConversation:(id)a4 highlightIdentifier:(id)a5 oldHighlightIdentifier:(id)a6 isFirstAdd:(BOOL)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v7 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  -[TUConversationManagerXPCClient delegate](self, "delegate");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "activeParticipant:addedHighlightToConversation:highlightIdentifier:oldHighlightIdentifier:isFirstAdd:", v15, v14, v13, v12, v7);

}

- (void)activeParticipant:(id)a3 removedHighlightFromConversation:(id)a4 highlightIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[TUConversationManagerXPCClient delegate](self, "delegate");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "activeParticipant:removedHighlightFromConversation:highlightIdentifier:", v10, v9, v8);

}

- (void)conversation:(id)a3 collaborationStateChanged:(int64_t)a4 highlightIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a3;
  -[TUConversationManagerXPCClient delegate](self, "delegate");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "conversation:collaborationStateChanged:highlightIdentifier:", v9, a4, v8);

}

- (void)addedCollaborationDictionary:(id)a3 forConversation:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[TUConversationManagerXPCClient delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addedCollaborationDictionary:forConversation:", v7, v6);

}

- (void)conversationUpdatedMessagesGroupPhoto:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  TUConversationManagerXPCClient *v9;

  v4 = a3;
  -[TUConversationManagerXPCClient queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72__TUConversationManagerXPCClient_conversationUpdatedMessagesGroupPhoto___block_invoke;
  v7[3] = &unk_1E38A1388;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __72__TUConversationManagerXPCClient_conversationUpdatedMessagesGroupPhoto___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "UUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "conversationUpdatedMessagesGroupPhoto: %@", (uint8_t *)&v5, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "conversationUpdatedMessagesGroupPhoto:", *(_QWORD *)(a1 + 32));

}

- (void)updateActivatedConversationLinks:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  TUConversationManagerXPCClient *v9;

  v4 = a3;
  -[TUConversationManagerXPCClient queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__TUConversationManagerXPCClient_updateActivatedConversationLinks___block_invoke;
  v7[3] = &unk_1E38A1388;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __67__TUConversationManagerXPCClient_updateActivatedConversationLinks___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "updateActivatedConversationLinks: %@", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "conversationManagerDataSource:didChangeActivatedConversationLinks:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));

}

- (void)receivedTrackedPendingMember:(id)a3 forConversationLink:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  TUConversationManagerXPCClient *v14;

  v6 = a3;
  v7 = a4;
  -[TUConversationManagerXPCClient queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83__TUConversationManagerXPCClient_receivedTrackedPendingMember_forConversationLink___block_invoke;
  block[3] = &unk_1E38A19B8;
  v12 = v6;
  v13 = v7;
  v14 = self;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __83__TUConversationManagerXPCClient_receivedTrackedPendingMember_forConversationLink___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v6 = 138412546;
    v7 = v3;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "receivedTrackedPendingMember: %@ forConversationLink: %@", (uint8_t *)&v6, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 48), "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "receivedTrackedPendingMember:forConversationLink:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)conversation:(id)a3 screenSharingChangedForParticipant:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  TUConversationManagerXPCClient *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[TUConversationManagerXPCClient queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__TUConversationManagerXPCClient_conversation_screenSharingChangedForParticipant___block_invoke;
  block[3] = &unk_1E38A19B8;
  v12 = v7;
  v13 = self;
  v14 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

void __82__TUConversationManagerXPCClient_conversation_screenSharingChangedForParticipant___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "identifier");
    v5 = 134217984;
    v6 = v3;
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "screenSharingChangedForParticipant: %llu", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "conversation:screenSharingChangedForParticipant:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));

}

- (void)remoteScreenShareAttributesChanged:(id)a3 isLocallySharing:(BOOL)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  TUConversationManagerXPCClient *v11;
  BOOL v12;

  v6 = a3;
  -[TUConversationManagerXPCClient queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __86__TUConversationManagerXPCClient_remoteScreenShareAttributesChanged_isLocallySharing___block_invoke;
  block[3] = &unk_1E38A26F0;
  v12 = a4;
  v10 = v6;
  v11 = self;
  v8 = v6;
  dispatch_async(v7, block);

}

void __86__TUConversationManagerXPCClient_remoteScreenShareAttributesChanged_isLocallySharing___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  const __CFString *v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = CFSTR("YES");
    if (!*(_BYTE *)(a1 + 48))
      v4 = CFSTR("NO");
    v6 = 138412546;
    v7 = v3;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "remoteScreenShareAttributesChanged: %@ isLocallySharing: %@", (uint8_t *)&v6, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteScreenShareAttributesChanged:isLocallySharing:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48));

}

- (void)remoteScreenShareEndedWithReason:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  TUConversationManagerXPCClient *v9;

  v4 = a3;
  -[TUConversationManagerXPCClient queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__TUConversationManagerXPCClient_remoteScreenShareEndedWithReason___block_invoke;
  v7[3] = &unk_1E38A1388;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __67__TUConversationManagerXPCClient_remoteScreenShareEndedWithReason___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "remoteScreenShareEndedWithReason: %@", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteScreenShareEndedWithReason:", *(_QWORD *)(a1 + 32));

}

- (void)sharePlayAvailableChanged:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  -[TUConversationManagerXPCClient queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60__TUConversationManagerXPCClient_sharePlayAvailableChanged___block_invoke;
  v6[3] = &unk_1E38A19E0;
  v6[4] = self;
  v7 = a3;
  dispatch_async(v5, v6);

}

void __60__TUConversationManagerXPCClient_sharePlayAvailableChanged___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  int v5;
  int v6;
  NSObject *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  _DWORD v12[2];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "sharePlayAvailable");
  v2 = objc_claimAutoreleasedReturnValue();
  if (!v2
    || (v3 = (void *)v2,
        objc_msgSend(*(id *)(a1 + 32), "sharePlayAvailable"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "BOOLValue"),
        v6 = *(unsigned __int8 *)(a1 + 40),
        v4,
        v3,
        v6 != v5))
  {
    TUDefaultLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(unsigned __int8 *)(a1 + 40);
      v12[0] = 67109120;
      v12[1] = v8;
      _os_log_impl(&dword_19A50D000, v7, OS_LOG_TYPE_DEFAULT, "sharePlayAvailable changed to: %d", (uint8_t *)v12, 8u);
    }

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setSharePlayAvailable:", v9);

    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "sharePlayAvailable");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sharePlayAvailableChanged:", objc_msgSend(v11, "BOOLValue"));

  }
}

- (void)screenSharingAvailableChanged:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  -[TUConversationManagerXPCClient queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __64__TUConversationManagerXPCClient_screenSharingAvailableChanged___block_invoke;
  v6[3] = &unk_1E38A19E0;
  v6[4] = self;
  v7 = a3;
  dispatch_async(v5, v6);

}

void __64__TUConversationManagerXPCClient_screenSharingAvailableChanged___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  int v5;
  int v6;
  NSObject *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  _DWORD v12[2];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "screenSharingAvailable");
  v2 = objc_claimAutoreleasedReturnValue();
  if (!v2
    || (v3 = (void *)v2,
        objc_msgSend(*(id *)(a1 + 32), "screenSharingAvailable"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "BOOLValue"),
        v6 = *(unsigned __int8 *)(a1 + 40),
        v4,
        v3,
        v6 != v5))
  {
    TUDefaultLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(unsigned __int8 *)(a1 + 40);
      v12[0] = 67109120;
      v12[1] = v8;
      _os_log_impl(&dword_19A50D000, v7, OS_LOG_TYPE_DEFAULT, "screenSharingAvailable changed to: %d", (uint8_t *)v12, 8u);
    }

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setScreenSharingAvailable:", v9);

    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "screenSharingAvailable");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "screenSharingAvailableChanged:", objc_msgSend(v11, "BOOLValue"));

  }
}

- (void)mediaPrioritiesChangedForConversation:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[TUConversationManagerXPCClient queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72__TUConversationManagerXPCClient_mediaPrioritiesChangedForConversation___block_invoke;
  v7[3] = &unk_1E38A1388;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __72__TUConversationManagerXPCClient_mediaPrioritiesChangedForConversation___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "mutableCopy");
  objc_msgSend(*(id *)(a1 + 40), "groupUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  objc_msgSend(v4, "updateParticipantMediaPrioritiesWithConversation:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 40), "groupUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v4, v5);

  v6 = objc_msgSend(v14, "copy");
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 64);
  *(_QWORD *)(v7 + 64) = v6;

  objc_msgSend(*(id *)(a1 + 32), "mediaDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(void **)(a1 + 40);
  v11 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
  objc_msgSend(v10, "groupUUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "mediaPrioritiesChangeForConversation:", v13);

}

- (void)conversation:(id)a3 participant:(id)a4 didReact:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[TUConversationManagerXPCClient queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __68__TUConversationManagerXPCClient_conversation_participant_didReact___block_invoke;
  v15[3] = &unk_1E38A1B38;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

void __68__TUConversationManagerXPCClient_conversation_participant_didReact___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v8 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "mutableCopy");
  v2 = *(void **)(a1 + 40);
  objc_msgSend(v2, "groupUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v2, v3);

  v4 = objc_msgSend(v8, "copy");
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v4;

  objc_msgSend(*(id *)(a1 + 32), "reactionsDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "conversation:participant:didReact:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

- (void)conversation:(id)a3 participantDidStopReacting:(id)a4
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
  -[TUConversationManagerXPCClient queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__TUConversationManagerXPCClient_conversation_participantDidStopReacting___block_invoke;
  block[3] = &unk_1E38A19B8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __74__TUConversationManagerXPCClient_conversation_participantDidStopReacting___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v8 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "mutableCopy");
  v2 = *(void **)(a1 + 40);
  objc_msgSend(v2, "groupUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v2, v3);

  v4 = objc_msgSend(v8, "copy");
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v4;

  objc_msgSend(*(id *)(a1 + 32), "reactionsDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "conversation:participantDidStopReacting:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)conversation:(id)a3 participant:(id)a4 addedNotice:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[TUConversationManagerXPCClient queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __71__TUConversationManagerXPCClient_conversation_participant_addedNotice___block_invoke;
  v15[3] = &unk_1E38A1B38;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

void __71__TUConversationManagerXPCClient_conversation_participant_addedNotice___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "conversation:participant:addedNotice:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

- (void)conversation:(id)a3 didChangeStateForActivitySession:(id)a4
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
  -[TUConversationManagerXPCClient queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__TUConversationManagerXPCClient_conversation_didChangeStateForActivitySession___block_invoke;
  block[3] = &unk_1E38A19B8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __80__TUConversationManagerXPCClient_conversation_didChangeStateForActivitySession___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "conversation:didChangeStateForActivitySession:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)conversation:(id)a3 didChangeSceneAssociationForActivitySession:(id)a4
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
  -[TUConversationManagerXPCClient queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __91__TUConversationManagerXPCClient_conversation_didChangeSceneAssociationForActivitySession___block_invoke;
  block[3] = &unk_1E38A19B8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __91__TUConversationManagerXPCClient_conversation_didChangeSceneAssociationForActivitySession___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "conversation:didChangeSceneAssociationForActivitySession:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)conversation:(id)a3 receivedActivitySessionEvent:(id)a4
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
  -[TUConversationManagerXPCClient queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__TUConversationManagerXPCClient_conversation_receivedActivitySessionEvent___block_invoke;
  block[3] = &unk_1E38A19B8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __76__TUConversationManagerXPCClient_conversation_receivedActivitySessionEvent___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "conversation:receivedActivitySessionEvent:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)getMessagesGroupDetailsForMessagesGroupUUID:(id)a3 completionHandler:(id)a4
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
  -[TUConversationManagerXPCClient queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __96__TUConversationManagerXPCClient_getMessagesGroupDetailsForMessagesGroupUUID_completionHandler___block_invoke;
  block[3] = &unk_1E38A3068;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __96__TUConversationManagerXPCClient_getMessagesGroupDetailsForMessagesGroupUUID_completionHandler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "conversationManagerDataSource:messagesGroupDetailsForMessagesGroupId:completionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)conversation:(id)a3 addedMembersLocally:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  TUConversationManagerXPCClient *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[TUConversationManagerXPCClient queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__TUConversationManagerXPCClient_conversation_addedMembersLocally___block_invoke;
  block[3] = &unk_1E38A19B8;
  v12 = v7;
  v13 = self;
  v14 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

void __67__TUConversationManagerXPCClient_conversation_addedMembersLocally___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "addedMembersLocally: %@", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "conversation:addedMembersLocally:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));

}

- (void)conversation:(id)a3 buzzedMember:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  TUConversationManagerXPCClient *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[TUConversationManagerXPCClient queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__TUConversationManagerXPCClient_conversation_buzzedMember___block_invoke;
  block[3] = &unk_1E38A19B8;
  v12 = v7;
  v13 = self;
  v14 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

void __60__TUConversationManagerXPCClient_conversation_buzzedMember___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "buzzedMember: %@", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "conversation:buzzedMember:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));

}

- (void)conversation:(id)a3 appLaunchState:(unint64_t)a4 forActivitySession:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  unint64_t v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  TUDefaultLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v20 = v11;
    v21 = 2112;
    v22 = v9;
    _os_log_impl(&dword_19A50D000, v10, OS_LOG_TYPE_DEFAULT, "App launch state %@ for %@", buf, 0x16u);

  }
  -[TUConversationManagerXPCClient queue](self, "queue");
  v12 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __81__TUConversationManagerXPCClient_conversation_appLaunchState_forActivitySession___block_invoke;
  v15[3] = &unk_1E38A1768;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = a4;
  v13 = v9;
  v14 = v8;
  dispatch_async(v12, v15);

}

void __81__TUConversationManagerXPCClient_conversation_appLaunchState_forActivitySession___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "conversationManagerDataSource:conversation:appLaunchState:forActivitySession:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));

}

- (void)updateActivityAuthorizedBundleIdentifierState:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  TUConversationManagerXPCClient *v9;

  v4 = a3;
  -[TUConversationManagerXPCClient queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __80__TUConversationManagerXPCClient_updateActivityAuthorizedBundleIdentifierState___block_invoke;
  v7[3] = &unk_1E38A1388;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __80__TUConversationManagerXPCClient_updateActivityAuthorizedBundleIdentifierState___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v11 = 138412290;
    v12 = v3;
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "updateActivityAuthorizedBundleIdentifiers: %@", (uint8_t *)&v11, 0xCu);
  }

  v4 = *(void **)(a1 + 32);
  v5 = *(id *)(*(_QWORD *)(a1 + 40) + 72);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("bk"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 40);
  v8 = *(void **)(v7 + 72);
  *(_QWORD *)(v7 + 72) = v6;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("gk"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 8) = objc_msgSend(v9, "BOOLValue");

  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "activityAuthorizationsChangedForDataSource:oldActivityAuthorizedBundleIdentifiers:", *(_QWORD *)(a1 + 40), v5);

}

- (void)updateLocalParticipantToAVLessWithPresentationMode:(unint64_t)a3 forConversationUUID:(id)a4
{
  id v6;
  void *v7;
  _QWORD v8[5];

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __105__TUConversationManagerXPCClient_updateLocalParticipantToAVLessWithPresentationMode_forConversationUUID___block_invoke;
  v8[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v8[4] = a3;
  v6 = a4;
  -[TUConversationManagerXPCClient asynchronousServerWithErrorHandler:](self, "asynchronousServerWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateLocalParticipantToAVLessWithPresentationMode:forConversationUUID:", a3, v6);

}

void __105__TUConversationManagerXPCClient_updateLocalParticipantToAVLessWithPresentationMode_forConversationUUID___block_invoke(uint64_t a1, void *a2)
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
  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 134218242;
    v7 = v5;
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_19A50D000, v4, OS_LOG_TYPE_DEFAULT, "Downgrading local participant for presentationMode: %zu failed with error %@", (uint8_t *)&v6, 0x16u);
  }

}

- (void)setLocalParticipantAudioVideoMode:(unint64_t)a3 forConversationUUID:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[TUConversationManagerXPCClient asynchronousServerWithErrorHandler:](self, "asynchronousServerWithErrorHandler:", &__block_literal_global_62);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLocalParticipantAudioVideoMode:forConversationUUID:", a3, v6);

}

void __88__TUConversationManagerXPCClient_setLocalParticipantAudioVideoMode_forConversationUUID___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_19A50D000, v3, OS_LOG_TYPE_DEFAULT, "Setting audio/video mode failed with error %@", (uint8_t *)&v4, 0xCu);
  }

}

- (void)registerMessagesGroupUUIDForConversationUUID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TUConversationManagerXPCClient asynchronousServerWithErrorHandler:](self, "asynchronousServerWithErrorHandler:", &__block_literal_global_63_1);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerMessagesGroupUUIDForConversationUUID:", v4);

}

void __79__TUConversationManagerXPCClient_registerMessagesGroupUUIDForConversationUUID___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_19A50D000, v3, OS_LOG_TYPE_DEFAULT, "Registering messagesGroupUUID failed with error %@", (uint8_t *)&v4, 0xCu);
  }

}

- (void)addCollaborationIdentifier:(id)a3 collaborationURL:(id)a4 cloudKitAppBundleIDs:(id)a5 forConversationUUID:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[TUConversationManagerXPCClient asynchronousServerWithErrorHandler:](self, "asynchronousServerWithErrorHandler:", &__block_literal_global_64_1);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addCollaborationIdentifier:collaborationURL:cloudKitAppBundleIDs:forConversationUUID:", v13, v12, v11, v10);

}

void __119__TUConversationManagerXPCClient_addCollaborationIdentifier_collaborationURL_cloudKitAppBundleIDs_forConversationUUID___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_19A50D000, v3, OS_LOG_TYPE_DEFAULT, "Setting collaboration identifier failed with error %@", (uint8_t *)&v4, 0xCu);
  }

}

- (void)startTrackingCollaborationWithIdentifier:(id)a3 collaborationURL:(id)a4 cloudKitAppBundleIDs:(id)a5 forConversationUUID:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  -[TUConversationManagerXPCClient asynchronousServerWithErrorHandler:](self, "asynchronousServerWithErrorHandler:", &__block_literal_global_65_2);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "startTrackingCollaborationWithIdentifier:collaborationURL:cloudKitAppBundleIDs:forConversationUUID:completionHandler:", v16, v15, v14, v13, v12);

}

void __151__TUConversationManagerXPCClient_startTrackingCollaborationWithIdentifier_collaborationURL_cloudKitAppBundleIDs_forConversationUUID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_19A50D000, v3, OS_LOG_TYPE_DEFAULT, "Tracking collaboration identifier failed with error %@", (uint8_t *)&v4, 0xCu);
  }

}

- (void)removeCollaborationIdentifier:(id)a3 forConversationUUID:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[TUConversationManagerXPCClient asynchronousServerWithErrorHandler:](self, "asynchronousServerWithErrorHandler:", &__block_literal_global_66_0);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeCollaborationIdentifier:forConversationUUID:", v7, v6);

}

void __84__TUConversationManagerXPCClient_removeCollaborationIdentifier_forConversationUUID___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_19A50D000, v3, OS_LOG_TYPE_DEFAULT, "removing collaboration identifier failed with error %@", (uint8_t *)&v4, 0xCu);
  }

}

- (void)markCollaborationWithIdentifierOpened:(id)a3 forConversationUUID:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[TUConversationManagerXPCClient asynchronousServerWithErrorHandler:](self, "asynchronousServerWithErrorHandler:", &__block_literal_global_67_1);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "markCollaborationWithIdentifierOpened:forConversationUUID:", v7, v6);

}

void __92__TUConversationManagerXPCClient_markCollaborationWithIdentifierOpened_forConversationUUID___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_19A50D000, v3, OS_LOG_TYPE_DEFAULT, "Sending opened collaboration identifier failed with error %@", (uint8_t *)&v4, 0xCu);
  }

}

- (void)addCollaborationDictionary:(id)a3 forConversationWithUUID:(id)a4 fromMe:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  id v10;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  -[TUConversationManagerXPCClient asynchronousServerWithErrorHandler:](self, "asynchronousServerWithErrorHandler:", &__block_literal_global_68_0);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addCollaborationDictionary:forConversationWithUUID:fromMe:", v9, v8, v5);

}

void __92__TUConversationManagerXPCClient_addCollaborationDictionary_forConversationWithUUID_fromMe___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_19A50D000, v3, OS_LOG_TYPE_DEFAULT, "Adding collaboration dictionary failed with error %@", (uint8_t *)&v4, 0xCu);
  }

}

- (void)getNeedsDisclosureOfCollaborationInitiator:(id)a3 forConversationUUID:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v8 = a5;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __115__TUConversationManagerXPCClient_getNeedsDisclosureOfCollaborationInitiator_forConversationUUID_completionHandler___block_invoke;
  v13[3] = &unk_1E38A1448;
  v14 = v8;
  v9 = v8;
  v10 = a4;
  v11 = a3;
  -[TUConversationManagerXPCClient asynchronousServerWithErrorHandler:](self, "asynchronousServerWithErrorHandler:", v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "getNeedsDisclosureOfCollaborationInitiator:forConversationUUID:completionHandler:", v11, v10, v9);

}

void __115__TUConversationManagerXPCClient_getNeedsDisclosureOfCollaborationInitiator_forConversationUUID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_19A50D000, v4, OS_LOG_TYPE_DEFAULT, "Checking disclosure of collaboration initiator failed with error %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)addDisclosedCollaborationInitiator:(id)a3 toConversationUUID:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[TUConversationManagerXPCClient asynchronousServerWithErrorHandler:](self, "asynchronousServerWithErrorHandler:", &__block_literal_global_69);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addDisclosedCollaborationInitiator:toConversationUUID:", v7, v6);

}

void __88__TUConversationManagerXPCClient_addDisclosedCollaborationInitiator_toConversationUUID___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_19A50D000, v3, OS_LOG_TYPE_DEFAULT, "Adding disclosed collaboration initiator failed with error %@", (uint8_t *)&v4, 0xCu);
  }

}

- (TUConversationManagerDataSourceDelegate)delegate
{
  return (TUConversationManagerDataSourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (TUConversationMediaControllerDataSourceDelegate)mediaDelegate
{
  return (TUConversationMediaControllerDataSourceDelegate *)objc_loadWeakRetained((id *)&self->_mediaDelegate);
}

- (void)setMediaDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_mediaDelegate, a3);
}

- (TUConversationReactionsControllerDataSourceDelegate)reactionsDelegate
{
  return (TUConversationReactionsControllerDataSourceDelegate *)objc_loadWeakRetained((id *)&self->_reactionsDelegate);
}

- (void)setReactionsDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_reactionsDelegate, a3);
}

- (os_unfair_lock_s)accessorLock
{
  return self->_accessorLock;
}

- (BOOL)hasInitialState
{
  return self->_hasInitialState;
}

- (void)setHasInitialState:(BOOL)a3
{
  self->_hasInitialState = a3;
}

- (void)setShouldConnectToken:(int)a3
{
  self->_shouldConnectToken = a3;
}

- (void)setShouldConnectToHost:(BOOL)a3
{
  self->_shouldConnectToHost = a3;
}

- (void)setConversationsByGroupUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void)setActivityAuthorizedBundleIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSNumber)sharePlayAvailable
{
  return self->_sharePlayAvailable;
}

- (void)setSharePlayAvailable:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSNumber)screenSharingAvailable
{
  return self->_screenSharingAvailable;
}

- (void)setScreenSharingAvailable:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_screenSharingAvailable, 0);
  objc_storeStrong((id *)&self->_sharePlayAvailable, 0);
  objc_storeStrong((id *)&self->_activityAuthorizedBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_conversationsByGroupUUID, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_destroyWeak((id *)&self->_reactionsDelegate);
  objc_destroyWeak((id *)&self->_mediaDelegate);
  objc_destroyWeak((id *)&self->_delegate);
}

void __73__TUConversationManagerXPCClient_incomingPendingConversationsByGroupUUID__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_19A50D000, v0, v1, "Retrieving incoming pending conversations failed with error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __54__TUConversationManagerXPCClient_pseudonymsByCallUUID__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_19A50D000, v0, v1, "Retrieving pseudonyms failed with error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __60__TUConversationManagerXPCClient_activatedConversationLinks__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_19A50D000, v0, v1, "Retrieving activated conversation links failed with error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __54__TUConversationManagerXPCClient_isSharePlayAvailable__block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_19A50D000, v0, v1, "Failed to fetch sharePlayAvailable error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __58__TUConversationManagerXPCClient_isScreenSharingAvailable__block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_19A50D000, v0, v1, "Failed to fetch screenSharingAvailable error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __86__TUConversationManagerXPCClient_addRemoteMembers_otherInvitedHandles_toConversation___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_19A50D000, v0, v1, "Error updating remote members: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __81__TUConversationManagerXPCClient_prepareConversationWithUUID_withHandoffContext___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_19A50D000, v0, v1, "Error while preparing conversation with handoff: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __79__TUConversationManagerXPCClient_setSharePlayHandedOff_onConversationWithUUID___block_invoke_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5_1();
  _os_log_error_impl(&dword_19A50D000, v0, OS_LOG_TYPE_ERROR, "Error while setting handedoff: %d on conversation with UUID: %@", v1, 0x12u);
  OUTLINED_FUNCTION_1();
}

void __73__TUConversationManagerXPCClient_updateMessagesGroupName_onConversation___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_19A50D000, v0, v1, "Error updating messages group name: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __66__TUConversationManagerXPCClient_setGridDisplayMode_conversation___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_19A50D000, v0, v1, "Error setting grid display mode: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __71__TUConversationManagerXPCClient_conversationUpdateMessagesGroupPhoto___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_19A50D000, v0, v1, "Error updating messages group photo: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __71__TUConversationManagerXPCClient_createActivitySession_onConversation___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_19A50D000, v0, v1, "Error updating activity: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __70__TUConversationManagerXPCClient_leaveActivitySession_onConversation___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_19A50D000, v0, v1, "Error leaving activity: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __68__TUConversationManagerXPCClient_endActivitySession_onConversation___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_19A50D000, v0, v1, "Error ending activity: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __91__TUConversationManagerXPCClient_setUsingAirplay_onActivitySession_onConversationWithUUID___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_19A50D000, v0, v1, "Error letting CSD know airplay state for activity session: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __89__TUConversationManagerXPCClient_presentDismissalAlertForActivitySession_onConversation___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_4_2(&dword_19A50D000, v0, v1, "Error presenting dismissal alert for activitySession: %@ on conversation: %@", v2);
  OUTLINED_FUNCTION_1();
}

void __79__TUConversationManagerXPCClient_setActivityAuthorization_forBundleIdentifier___block_invoke_cold_1()
{
  __int16 v0;
  uint64_t v1;
  os_log_t v2;
  uint8_t v3[18];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5_1();
  v4 = v0;
  v5 = v1;
  _os_log_error_impl(&dword_19A50D000, v2, OS_LOG_TYPE_ERROR, "Error setting activity authorization: (%d) for bundle identifier %@ with error: %@", v3, 0x1Cu);
}

void __58__TUConversationManagerXPCClient_setAutoSharePlayEnabled___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_19A50D000, v0, v1, "Error setting auto expanse enabled with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __62__TUConversationManagerXPCClient_joinConversationWithRequest___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_19A50D000, v0, v1, "joinConversationWithRequest error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __60__TUConversationManagerXPCClient_leaveConversationWithUUID___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_19A50D000, v0, v1, "leaveConversationWithUUID error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __129__TUConversationManagerXPCClient_launchApplicationForActivitySessionUUID_authorizedExternally_forceBackground_completionHandler___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  OUTLINED_FUNCTION_4_2(&dword_19A50D000, a3, (uint64_t)a3, "Error launching application for activitySession UUID: %@ with error: %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1();
}

void __71__TUConversationManagerXPCClient_addScreenSharingType_forConversation___block_invoke_cold_1()
{
  __int16 v0;
  uint64_t v1;
  os_log_t v2;
  uint8_t v3[22];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_3();
  v4 = v0;
  v5 = v1;
  _os_log_error_impl(&dword_19A50D000, v2, OS_LOG_TYPE_ERROR, "Error in setting screenSharingType: (%lu) for conversation: %@ with error: %@", v3, 0x20u);
}

void __60__TUConversationManagerXPCClient_refreshActiveConversations__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_19A50D000, v0, v1, "Error requesting refreshActiveConversations: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __75__TUConversationManagerXPCClient_fetchUpcomingNoticeWithCompletionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_19A50D000, v0, v1, "Error fetching upcoming notice: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __91__TUConversationManagerXPCClient_activateConversationNoticeWithActionURL_bundleIdentifier___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_4_2(&dword_19A50D000, v0, v1, "Error in activating notice with actionURL %@ bundleIdentifier %@", v2);
  OUTLINED_FUNCTION_1();
}

void __67__TUConversationManagerXPCClient_removeConversationNoticeWithUUID___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_19A50D000, a2, a3, "Error in dismissing notice with UUID %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __93__TUConversationManagerXPCClient_updateConversationWithUUID_participantPresentationContexts___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_19A50D000, v0, v1, "Error setting presentation context: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __68__TUConversationManagerXPCClient_setSupportsMessagesGroupProviding___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_19A50D000, v0, v1, "Error setting messages group providing support: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __95__TUConversationManagerXPCClient_getMessagesGroupDetailsForConversationUUID_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_19A50D000, v0, v1, "Error getting messages group details: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __76__TUConversationManagerXPCClient__requestInitialStateWithCompletionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_19A50D000, v0, v1, "Error requesting initial state: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __76__TUConversationManagerXPCClient__requestInitialStateWithCompletionHandler___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_19A50D000, v0, v1, "Error requesting initial activityAuthorizedBundleIdentifiers: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __76__TUConversationManagerXPCClient__requestInitialStateWithCompletionHandler___block_invoke_2_48_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_19A50D000, v0, v1, "Failed to fetch sharePlayAvailable error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __76__TUConversationManagerXPCClient__requestInitialStateWithCompletionHandler___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_19A50D000, v0, v1, "Failed to fetch screenSharingAvailable error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
