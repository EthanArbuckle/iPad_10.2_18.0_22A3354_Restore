@implementation TUJoinConversationRequest

- (TUJoinConversationRequest)initWithProvider:(id)a3 remoteMemberHandles:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  TUConversationMember *v16;
  TUConversationMember *v17;
  TUJoinConversationRequest *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v21;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v21 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v14);
        v16 = [TUConversationMember alloc];
        v17 = -[TUConversationMember initWithHandle:](v16, "initWithHandle:", v15, (_QWORD)v20);
        objc_msgSend(v9, "addObject:", v17);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v12);
  }

  v18 = -[TUJoinConversationRequest initWithProvider:remoteMembers:otherInvitedHandles:](self, "initWithProvider:remoteMembers:otherInvitedHandles:", v6, v9, v8);
  return v18;
}

- (TUJoinConversationRequest)initWithProvider:(id)a3 remoteMembers:(id)a4 otherInvitedHandles:(id)a5
{
  id v9;
  id v10;
  id v11;
  TUJoinConversationRequest *v12;
  void *v13;
  uint64_t v14;
  NSUUID *UUID;
  uint64_t v16;
  NSSet *remoteMembers;
  uint64_t v18;
  NSSet *otherInvitedHandles;
  uint64_t v20;
  unint64_t v21;
  unsigned int v22;
  objc_super v24;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v24.receiver = self;
  v24.super_class = (Class)TUJoinConversationRequest;
  v12 = -[TUJoinConversationRequest init](&v24, sel_init);
  if (v12)
  {
    objc_msgSend((id)objc_opt_class(), "sanitizedMembersFromMembers:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v14 = objc_claimAutoreleasedReturnValue();
    UUID = v12->_UUID;
    v12->_UUID = (NSUUID *)v14;

    v16 = objc_msgSend(v13, "copy");
    remoteMembers = v12->_remoteMembers;
    v12->_remoteMembers = (NSSet *)v16;

    v18 = objc_msgSend(v11, "copy");
    otherInvitedHandles = v12->_otherInvitedHandles;
    v12->_otherInvitedHandles = (NSSet *)v18;

    objc_storeStrong((id *)&v12->_provider, a3);
    *(_WORD *)&v12->_hostedOnCurrentDevice = 257;
    v20 = 2;
    if ((objc_msgSend(v9, "supportsAVMode:", 2) & 1) != 0)
    {
      v21 = 0;
    }
    else
    {
      v22 = objc_msgSend(v9, "supportsAVMode:", 1);
      v20 = v22;
      v21 = v22 ^ 1;
    }
    v12->_avMode = v20;
    v12->_presentationMode = v21;

  }
  return v12;
}

- (TUJoinConversationRequest)initWithRemoteMembers:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  TUJoinConversationRequest *v7;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  objc_msgSend(v4, "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[TUJoinConversationRequest initWithRemoteMembers:otherInvitedHandles:](self, "initWithRemoteMembers:otherInvitedHandles:", v5, v6);

  return v7;
}

- (TUJoinConversationRequest)initWithRemoteMembers:(id)a3 otherInvitedHandles:(id)a4
{
  id v6;
  id v7;
  void *v8;
  TUJoinConversationRequest *v9;

  v6 = a4;
  v7 = a3;
  +[TUConversationProvider faceTimeProvider](TUConversationProvider, "faceTimeProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[TUJoinConversationRequest initWithProvider:remoteMembers:otherInvitedHandles:](self, "initWithProvider:remoteMembers:otherInvitedHandles:", v8, v7, v6);

  return v9;
}

- (TUJoinConversationRequest)initWithConversation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  TUJoinConversationRequest *v7;
  void *v8;
  uint64_t v9;
  NSUUID *messagesGroupUUID;
  uint64_t v11;
  NSString *messagesGroupName;
  uint64_t v13;
  TUConversationProvider *provider;
  void *v15;
  uint64_t v16;
  TUConversationLink *conversationLink;

  v4 = a3;
  objc_msgSend(v4, "remoteMembers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "otherInvitedHandles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[TUJoinConversationRequest initWithRemoteMembers:otherInvitedHandles:](self, "initWithRemoteMembers:otherInvitedHandles:", v5, v6);

  if (v7)
  {
    v7->_avMode = objc_msgSend(v4, "avMode");
    objc_msgSend(v4, "presentationContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_presentationMode = objc_msgSend(v8, "mode");

    objc_msgSend(v4, "messagesGroupUUID");
    v9 = objc_claimAutoreleasedReturnValue();
    messagesGroupUUID = v7->_messagesGroupUUID;
    v7->_messagesGroupUUID = (NSUUID *)v9;

    objc_msgSend(v4, "messagesGroupName");
    v11 = objc_claimAutoreleasedReturnValue();
    messagesGroupName = v7->_messagesGroupName;
    v7->_messagesGroupName = (NSString *)v11;

    objc_msgSend(v4, "provider");
    v13 = objc_claimAutoreleasedReturnValue();
    provider = v7->_provider;
    v7->_provider = (TUConversationProvider *)v13;

    v7->_hostedOnCurrentDevice = objc_msgSend(v4, "hostedOnCurrentDevice");
    v7->_endpointOnCurrentDevice = objc_msgSend(v4, "endpointOnCurrentDevice");
    objc_msgSend(v4, "link");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v4, "link");
      v16 = objc_claimAutoreleasedReturnValue();
      conversationLink = v7->_conversationLink;
      v7->_conversationLink = (TUConversationLink *)v16;

      v7->_joiningConversationWithLink = 1;
    }
  }

  return v7;
}

- (TUJoinConversationRequest)initWithConversationLink:(id)a3 otherInvitedHandles:(id)a4 sendLetMeInRequest:(BOOL)a5
{
  id v9;
  void *v10;
  id v11;
  void *v12;
  TUJoinConversationRequest *v13;

  v9 = a3;
  v10 = (void *)MEMORY[0x1E0C99E60];
  v11 = a4;
  objc_msgSend(v10, "set");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[TUJoinConversationRequest initWithRemoteMembers:otherInvitedHandles:](self, "initWithRemoteMembers:otherInvitedHandles:", v12, v11);

  if (v13)
  {
    objc_storeStrong((id *)&v13->_conversationLink, a3);
    v13->_sendLetMeInRequest = a5;
    v13->_showUIPrompt = 0;
    v13->_wantsStagingArea = 1;
    v13->_originatingUIType = 15;
  }

  return v13;
}

- (TUJoinConversationRequest)initWithConversationLink:(id)a3 otherInvitedHandles:(id)a4 remoteMembers:(id)a5 sendLetMeInRequest:(BOOL)a6
{
  id v11;
  TUJoinConversationRequest *v12;
  TUJoinConversationRequest *v13;

  v11 = a3;
  v12 = -[TUJoinConversationRequest initWithRemoteMembers:otherInvitedHandles:](self, "initWithRemoteMembers:otherInvitedHandles:", a5, a4);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_conversationLink, a3);
    v13->_sendLetMeInRequest = a6;
    v13->_showUIPrompt = 0;
    v13->_originatingUIType = 15;
  }

  return v13;
}

- (TUJoinConversationRequest)initWithURL:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  TUJoinConversationRequest *v12;
  int v13;
  uint64_t v14;
  TUJoinConversationRequest *v15;
  uint64_t v16;
  TUHandle *callerID;
  uint64_t v18;
  NSUUID *messagesGroupUUID;
  uint64_t v20;
  NSString *messagesGroupName;
  uint64_t v22;
  TUConversationParticipantAssociation *participantAssociation;
  void *v24;
  uint64_t v25;
  NSString *audioSourceIdentifier;
  uint64_t v27;
  TUConversationProvider *provider;
  uint64_t v29;
  NSString *collaborationIdentifier;

  v4 = (objc_class *)MEMORY[0x1E0CB3998];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithURL:resolvingAgainstBaseURL:", v5, 0);

  if (v6)
  {
    objc_msgSend((id)objc_opt_class(), "remoteMembersFromURLComponents:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "otherInvitedHandlesFromURLComponents:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "conversationLinkFromURLComponents:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend((id)objc_opt_class(), "joiningConversationWithLinkFromURLComponents:", v6);
    objc_msgSend((id)objc_opt_class(), "invitationPreferencesFromURLComponents:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      if (!v10)
      {
        v12 = -[TUJoinConversationRequest initWithConversationLink:otherInvitedHandles:remoteMembers:sendLetMeInRequest:](self, "initWithConversationLink:otherInvitedHandles:remoteMembers:sendLetMeInRequest:", v9, v8, v7, objc_msgSend((id)objc_opt_class(), "sendLetMeInRequestFromURLComponents:", v6));
        v13 = objc_msgSend((id)objc_opt_class(), "videoFromURLComponents:", v6);
        v14 = 1;
        if (v13)
          v14 = 2;
        v12->_avMode = v14;
LABEL_12:
        objc_msgSend((id)objc_opt_class(), "uuidFromURLComponents:", v6);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (v24)
          objc_storeStrong((id *)&v12->_UUID, v24);
        v12->_originatingUIType = objc_msgSend((id)objc_opt_class(), "originatingUITypeFromURLComponents:", v6);
        objc_storeStrong((id *)&v12->_invitationPreferences, v11);
        objc_msgSend((id)objc_opt_class(), "audioSourceIdentifierFromURLComponents:", v6);
        v25 = objc_claimAutoreleasedReturnValue();
        audioSourceIdentifier = v12->_audioSourceIdentifier;
        v12->_audioSourceIdentifier = (NSString *)v25;

        v12->_uplinkMuted = objc_msgSend((id)objc_opt_class(), "uplinkMutedFromURLComponents:", v6);
        v12->_videoEnabled = objc_msgSend((id)objc_opt_class(), "videoEnabledFromURLComponents:", v6);
        objc_msgSend((id)objc_opt_class(), "providerFromURLComponents:", v6);
        v27 = objc_claimAutoreleasedReturnValue();
        provider = v12->_provider;
        v12->_provider = (TUConversationProvider *)v27;

        v12->_wantsStagingArea = objc_msgSend((id)objc_opt_class(), "wantsStagingAreaFromURLComponents:", v6);
        objc_msgSend((id)objc_opt_class(), "collaborationIdentifierFromURLComponents:", v6);
        v29 = objc_claimAutoreleasedReturnValue();
        collaborationIdentifier = v12->_collaborationIdentifier;
        v12->_collaborationIdentifier = (NSString *)v29;

        v12->_sendToScreening = objc_msgSend((id)objc_opt_class(), "sendToScreeningFromURLComponents:", v6);
        v12->_requestToShareScreen = objc_msgSend((id)objc_opt_class(), "requestToShareScreenFromURLComponents:", v6);
        v12->_requestToShareMyScreen = objc_msgSend((id)objc_opt_class(), "requestToShareMyScreenFromURLComponents:", v6);
        v12->_shouldSendLegacyScreenSharingInvite = objc_msgSend((id)objc_opt_class(), "shouldSendLegacyScreenSharingInviteFromURLComponents:", v6);
        self = v12;

        v15 = self;
        goto LABEL_15;
      }
    }
    else if (!objc_msgSend(v7, "count"))
    {
      v15 = 0;
LABEL_15:

      goto LABEL_16;
    }
    v12 = -[TUJoinConversationRequest initWithRemoteMembers:otherInvitedHandles:](self, "initWithRemoteMembers:otherInvitedHandles:", v7, v8);
    v12->_avMode = objc_msgSend((id)objc_opt_class(), "avModeFromURLComponents:", v6);
    v12->_presentationMode = objc_msgSend((id)objc_opt_class(), "presentationModeFromURLComponents:", v6);
    objc_msgSend((id)objc_opt_class(), "callerIDFromURLComponents:", v6);
    v16 = objc_claimAutoreleasedReturnValue();
    callerID = v12->_callerID;
    v12->_callerID = (TUHandle *)v16;

    v12->_shouldSuppressInCallUI = objc_msgSend((id)objc_opt_class(), "shouldSuppressInCallUIFromURLComponents:", v6);
    objc_msgSend((id)objc_opt_class(), "messagesGroupUUIDFromURLComponents:", v6);
    v18 = objc_claimAutoreleasedReturnValue();
    messagesGroupUUID = v12->_messagesGroupUUID;
    v12->_messagesGroupUUID = (NSUUID *)v18;

    objc_msgSend((id)objc_opt_class(), "messagesGroupNameFromURLComponents:", v6);
    v20 = objc_claimAutoreleasedReturnValue();
    messagesGroupName = v12->_messagesGroupName;
    v12->_messagesGroupName = (NSString *)v20;

    v12->_showUIPrompt = objc_msgSend((id)objc_opt_class(), "showUIPromptFromURLComponents:", v6);
    if (v9)
      objc_storeStrong((id *)&v12->_conversationLink, v9);
    v12->_joiningConversationWithLink = v10;
    +[TUConversationParticipantAssociation participantAssociationFromURLComponents:namePrefix:](TUConversationParticipantAssociation, "participantAssociationFromURLComponents:namePrefix:", v6, CFSTR("pA"));
    v22 = objc_claimAutoreleasedReturnValue();
    participantAssociation = v12->_participantAssociation;
    v12->_participantAssociation = (TUConversationParticipantAssociation *)v22;

    goto LABEL_12;
  }
  v15 = 0;
LABEL_16:

  return v15;
}

- (TUJoinConversationRequest)initWithGroupUUID:(id)a3 localParticipantHandle:(id)a4 remoteParticipantHandles:(id)a5
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  TUConversationMember *v14;
  TUConversationMember *v15;
  TUJoinConversationRequest *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v12);
        v14 = [TUConversationMember alloc];
        v15 = -[TUConversationMember initWithHandle:nickname:](v14, "initWithHandle:nickname:", v13, 0, (_QWORD)v18);
        objc_msgSend(v7, "addObject:", v15);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

  v16 = -[TUJoinConversationRequest initWithRemoteMembers:](self, "initWithRemoteMembers:", v7);
  return v16;
}

- (TUJoinConversationRequest)initWithUserActivity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  CUTWeakLinkClass();
  objc_msgSend(v4, "interaction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "intent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    objc_msgSend(v7, "contacts");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v8, "count") >= 2)
    {
      v9 = objc_msgSend(v7, "preferredCallProvider");

      if (v9 != 2)
      {
LABEL_7:

        goto LABEL_8;
      }
      -[TUJoinConversationRequest conversationMembersForIntent:](self, "conversationMembersForIntent:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      self = -[TUJoinConversationRequest initWithRemoteMembers:](self, "initWithRemoteMembers:", v8);
      if (objc_msgSend(v7, "callCapability") == 2)
        -[TUJoinConversationRequest setVideoEnabled:](self, "setVideoEnabled:", 1);
    }

    goto LABEL_7;
  }
LABEL_8:

  return self;
}

- (NSString)description
{
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

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUJoinConversationRequest UUID](self, "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" UUID=%@"), v4);

  NSStringFromSelector(sel_avMode);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" %@=%ld"), v5, -[TUJoinConversationRequest avMode](self, "avMode"));

  NSStringFromSelector(sel_presentationMode);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" %@=%ld"), v6, -[TUJoinConversationRequest presentationMode](self, "presentationMode"));

  -[TUJoinConversationRequest remoteMembers](self, "remoteMembers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" remoteMembers=%@"), v7);

  -[TUJoinConversationRequest otherInvitedHandles](self, "otherInvitedHandles");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" otherInvitedHandles=%@"), v8);

  -[TUJoinConversationRequest callerID](self, "callerID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[TUJoinConversationRequest callerID](self, "callerID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" callerID=%@"), v10);

  }
  objc_msgSend(v3, "appendFormat:", CFSTR(" isVideoEnabled=%d"), -[TUJoinConversationRequest isVideoEnabled](self, "isVideoEnabled"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" isUplinkMuted=%d"), -[TUJoinConversationRequest isUplinkMuted](self, "isUplinkMuted"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" shouldSuppressInCallUI=%d"), -[TUJoinConversationRequest shouldSuppressInCallUI](self, "shouldSuppressInCallUI"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" wantsStagingArea=%d"), -[TUJoinConversationRequest wantsStagingArea](self, "wantsStagingArea"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" showUIPrompt=%d"), -[TUJoinConversationRequest showUIPrompt](self, "showUIPrompt"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" sendLetMeInRequest=%d"), -[TUJoinConversationRequest sendLetMeInRequest](self, "sendLetMeInRequest"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" isJoiningConversationWithLink=%d"), -[TUJoinConversationRequest isJoiningConversationWithLink](self, "isJoiningConversationWithLink"));
  -[TUJoinConversationRequest messagesGroupUUID](self, "messagesGroupUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[TUJoinConversationRequest messagesGroupUUID](self, "messagesGroupUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" messagesGroupUUID=%@"), v12);

  }
  -[TUJoinConversationRequest messagesGroupName](self, "messagesGroupName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[TUJoinConversationRequest messagesGroupName](self, "messagesGroupName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" messagesGroupName=%@"), v14);

  }
  -[TUJoinConversationRequest conversationLink](self, "conversationLink");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[TUJoinConversationRequest conversationLink](self, "conversationLink");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" conversationLink=%@"), v16);

  }
  -[TUJoinConversationRequest activity](self, "activity");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[TUJoinConversationRequest activity](self, "activity");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" activity=%@"), v18);

  }
  -[TUJoinConversationRequest invitationPreferences](self, "invitationPreferences");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[TUJoinConversationRequest invitationPreferences](self, "invitationPreferences");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" invitationPreferences=%@"), v20);

  }
  -[TUJoinConversationRequest provider](self, "provider");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" provider=%@"), v21);

  -[TUJoinConversationRequest audioSourceIdentifier](self, "audioSourceIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[TUJoinConversationRequest audioSourceIdentifier](self, "audioSourceIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" audioSourceIdentifier=%@"), v23);

  }
  -[TUJoinConversationRequest participantAssociation](self, "participantAssociation");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[TUJoinConversationRequest participantAssociation](self, "participantAssociation");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" participantAssociation=%@"), v25);

  }
  objc_msgSend(v3, "appendFormat:", CFSTR(" originatingUIType=%d"), -[TUJoinConversationRequest originatingUIType](self, "originatingUIType"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" sendToScreening=%d"), -[TUJoinConversationRequest sendToScreening](self, "sendToScreening"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" requestToShareScreen=%d"), -[TUJoinConversationRequest requestToShareScreen](self, "requestToShareScreen"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" requestToShareMyScreen=%d"), -[TUJoinConversationRequest requestToShareMyScreen](self, "requestToShareMyScreen"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" shouldSendLegacyScreenSharingInvite=%d"), -[TUJoinConversationRequest shouldSendLegacyScreenSharingInvite](self, "shouldSendLegacyScreenSharingInvite"));
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  v26 = (void *)objc_msgSend(v3, "copy");

  return (NSString *)v26;
}

- (BOOL)isEqual:(id)a3
{
  TUJoinConversationRequest *v4;
  BOOL v5;

  v4 = (TUJoinConversationRequest *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[TUJoinConversationRequest isEqualToRequest:](self, "isEqualToRequest:", v4);
  }

  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
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
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;

  v3 = -[TUJoinConversationRequest avMode](self, "avMode");
  v4 = -[TUJoinConversationRequest presentationMode](self, "presentationMode") ^ v3;
  -[TUJoinConversationRequest UUID](self, "UUID");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 ^ objc_msgSend(v48, "hash");
  -[TUJoinConversationRequest remoteMembers](self, "remoteMembers");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v47, "hash");
  -[TUJoinConversationRequest otherInvitedHandles](self, "otherInvitedHandles");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ v6 ^ objc_msgSend(v46, "hash");
  if (-[TUJoinConversationRequest isVideoEnabled](self, "isVideoEnabled"))
    v8 = 1231;
  else
    v8 = 1237;
  if (-[TUJoinConversationRequest isUplinkMuted](self, "isUplinkMuted"))
    v9 = 1231;
  else
    v9 = 1237;
  v10 = v7 ^ v8 ^ v9;
  if (-[TUJoinConversationRequest shouldSuppressInCallUI](self, "shouldSuppressInCallUI"))
    v11 = 1231;
  else
    v11 = 1237;
  if (-[TUJoinConversationRequest wantsStagingArea](self, "wantsStagingArea"))
    v12 = 1231;
  else
    v12 = 1237;
  v13 = v11 ^ v12;
  -[TUJoinConversationRequest conversationLink](self, "conversationLink");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v10 ^ v13 ^ objc_msgSend(v45, "hash");
  -[TUJoinConversationRequest callerID](self, "callerID");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v44, "hash");
  -[TUJoinConversationRequest messagesGroupUUID](self, "messagesGroupUUID");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15 ^ objc_msgSend(v43, "hash");
  -[TUJoinConversationRequest messagesGroupName](self, "messagesGroupName");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16 ^ objc_msgSend(v42, "hash");
  if (-[TUJoinConversationRequest sendLetMeInRequest](self, "sendLetMeInRequest"))
    v18 = 1231;
  else
    v18 = 1237;
  v19 = v17 ^ v18;
  if (-[TUJoinConversationRequest isJoiningConversationWithLink](self, "isJoiningConversationWithLink"))
    v20 = 1231;
  else
    v20 = 1237;
  v21 = v14 ^ v19 ^ v20;
  -[TUJoinConversationRequest invitationPreferences](self, "invitationPreferences");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "hash");
  -[TUJoinConversationRequest provider](self, "provider");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v23 ^ objc_msgSend(v24, "hash");
  -[TUJoinConversationRequest audioSourceIdentifier](self, "audioSourceIdentifier");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v25 ^ objc_msgSend(v26, "hash");
  -[TUJoinConversationRequest participantAssociation](self, "participantAssociation");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v27 ^ objc_msgSend(v28, "hash");
  -[TUJoinConversationRequest activity](self, "activity");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v29 ^ objc_msgSend(v30, "hash");
  if (-[TUJoinConversationRequest shouldLaunchBackgroundInCallUI](self, "shouldLaunchBackgroundInCallUI"))
    v32 = 1231;
  else
    v32 = 1237;
  v33 = v21 ^ v31 ^ v32;
  if (-[TUJoinConversationRequest sendToScreening](self, "sendToScreening"))
    v34 = 1231;
  else
    v34 = 1237;
  if (-[TUJoinConversationRequest requestToShareScreen](self, "requestToShareScreen"))
    v35 = 1231;
  else
    v35 = 1237;
  v36 = v34 ^ v35;
  if (-[TUJoinConversationRequest requestToShareMyScreen](self, "requestToShareMyScreen"))
    v37 = 1231;
  else
    v37 = 1237;
  v38 = v36 ^ v37;
  if (-[TUJoinConversationRequest shouldSendLegacyScreenSharingInvite](self, "shouldSendLegacyScreenSharingInvite"))
    v39 = 1231;
  else
    v39 = 1237;
  v40 = v33 ^ v38 ^ v39;

  return v40;
}

- (BOOL)isEqualToRequest:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  void *v19;
  void *v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  int v24;
  int v25;
  unint64_t v26;
  void *v27;
  void *v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  void *v34;
  _BOOL4 v35;
  int v36;
  int v37;
  int v38;
  int v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;

  v4 = a3;
  v5 = -[TUJoinConversationRequest avMode](self, "avMode");
  if (v5 == objc_msgSend(v4, "avMode")
    && (v6 = -[TUJoinConversationRequest presentationMode](self, "presentationMode"),
        v6 == objc_msgSend(v4, "presentationMode")))
  {
    -[TUJoinConversationRequest UUID](self, "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqual:", v8))
    {
      -[TUJoinConversationRequest remoteMembers](self, "remoteMembers");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "remoteMembers");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isEqual:", v10))
      {
        -[TUJoinConversationRequest otherInvitedHandles](self, "otherInvitedHandles");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "otherInvitedHandles");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "isEqual:", v12)
          && (v13 = -[TUJoinConversationRequest isVideoEnabled](self, "isVideoEnabled"),
              v13 == objc_msgSend(v4, "isVideoEnabled"))
          && (v14 = -[TUJoinConversationRequest isUplinkMuted](self, "isUplinkMuted"),
              v14 == objc_msgSend(v4, "isUplinkMuted"))
          && (v15 = -[TUJoinConversationRequest shouldSuppressInCallUI](self, "shouldSuppressInCallUI"),
              v15 == objc_msgSend(v4, "shouldSuppressInCallUI"))
          && (v16 = -[TUJoinConversationRequest wantsStagingArea](self, "wantsStagingArea"),
              v16 == objc_msgSend(v4, "wantsStagingArea")))
        {
          -[TUJoinConversationRequest conversationLink](self, "conversationLink");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "conversationLink");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (TUObjectsAreEqualOrNil((unint64_t)v19, (uint64_t)v20))
          {
            v53 = v19;
            -[TUJoinConversationRequest callerID](self, "callerID");
            v21 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "callerID");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            v55 = (void *)v21;
            if (TUObjectsAreEqualOrNil(v21, (uint64_t)v54))
            {
              -[TUJoinConversationRequest messagesGroupUUID](self, "messagesGroupUUID");
              v22 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "messagesGroupUUID");
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = (void *)v22;
              if (TUObjectsAreEqualOrNil(v22, (uint64_t)v51))
              {
                v48 = v20;
                -[TUJoinConversationRequest messagesGroupName](self, "messagesGroupName");
                v23 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v4, "messagesGroupName");
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                v50 = (void *)v23;
                if (TUObjectsAreEqualOrNil(v23, (uint64_t)v49)
                  && (v24 = -[TUJoinConversationRequest sendLetMeInRequest](self, "sendLetMeInRequest"),
                      v24 == objc_msgSend(v4, "sendLetMeInRequest"))
                  && (v25 = -[TUJoinConversationRequest isJoiningConversationWithLink](self, "isJoiningConversationWithLink"), v25 == objc_msgSend(v4, "isJoiningConversationWithLink")))
                {
                  -[TUJoinConversationRequest invitationPreferences](self, "invitationPreferences");
                  v26 = objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v4, "invitationPreferences");
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  v47 = (void *)v26;
                  if (TUObjectsAreEqualOrNil(v26, (uint64_t)v27))
                  {
                    -[TUJoinConversationRequest provider](self, "provider");
                    v28 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v4, "provider");
                    v45 = (void *)objc_claimAutoreleasedReturnValue();
                    v46 = v28;
                    if (objc_msgSend(v28, "isEqual:"))
                    {
                      -[TUJoinConversationRequest audioSourceIdentifier](self, "audioSourceIdentifier");
                      v29 = objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v4, "audioSourceIdentifier");
                      v43 = (void *)objc_claimAutoreleasedReturnValue();
                      v44 = (void *)v29;
                      if (TUObjectsAreEqualOrNil(v29, (uint64_t)v43))
                      {
                        -[TUJoinConversationRequest participantAssociation](self, "participantAssociation");
                        v30 = objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v4, "participantAssociation");
                        v41 = (void *)objc_claimAutoreleasedReturnValue();
                        v42 = (void *)v30;
                        if (TUObjectsAreEqualOrNil(v30, (uint64_t)v41))
                        {
                          -[TUJoinConversationRequest activity](self, "activity");
                          v31 = objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v4, "activity");
                          v32 = objc_claimAutoreleasedReturnValue();
                          v40 = (void *)v31;
                          v33 = v31;
                          v34 = (void *)v32;
                          if (TUObjectsAreEqualOrNil(v33, v32)
                            && (v36 = -[TUJoinConversationRequest shouldLaunchBackgroundInCallUI](self, "shouldLaunchBackgroundInCallUI"), v36 == objc_msgSend(v4, "shouldLaunchBackgroundInCallUI"))&& (v37 = -[TUJoinConversationRequest sendToScreening](self, "sendToScreening"), v37 == objc_msgSend(v4, "sendToScreening"))&& (v38 = -[TUJoinConversationRequest requestToShareScreen](self, "requestToShareScreen"), v38 == objc_msgSend(v4, "requestToShareScreen"))&& (v39 = -[TUJoinConversationRequest requestToShareMyScreen](self, "requestToShareMyScreen"), v39 == objc_msgSend(v4, "requestToShareMyScreen")))
                          {
                            v35 = -[TUJoinConversationRequest shouldSendLegacyScreenSharingInvite](self, "shouldSendLegacyScreenSharingInvite");
                            v17 = v35 ^ objc_msgSend(v4, "shouldSendLegacyScreenSharingInvite") ^ 1;
                          }
                          else
                          {
                            LOBYTE(v17) = 0;
                          }

                        }
                        else
                        {
                          LOBYTE(v17) = 0;
                        }

                      }
                      else
                      {
                        LOBYTE(v17) = 0;
                      }

                    }
                    else
                    {
                      LOBYTE(v17) = 0;
                    }

                  }
                  else
                  {
                    LOBYTE(v17) = 0;
                  }

                }
                else
                {
                  LOBYTE(v17) = 0;
                }
                v19 = v53;
                v20 = v48;

              }
              else
              {
                LOBYTE(v17) = 0;
                v19 = v53;
              }

            }
            else
            {
              LOBYTE(v17) = 0;
              v19 = v53;
            }

          }
          else
          {
            LOBYTE(v17) = 0;
          }

        }
        else
        {
          LOBYTE(v17) = 0;
        }

      }
      else
      {
        LOBYTE(v17) = 0;
      }

    }
    else
    {
      LOBYTE(v17) = 0;
    }

  }
  else
  {
    LOBYTE(v17) = 0;
  }

  return v17;
}

- (id)sanitizedHandles
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99E20];
  -[TUJoinConversationRequest remoteMembers](self, "remoteMembers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[TUJoinConversationRequest remoteMembers](self, "remoteMembers");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v10, "handle");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "normalizedValue");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3500], "controlCharacterSet");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringByTrimmingCharactersInSet:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (!objc_msgSend(v14, "length"))
        {
          objc_msgSend(v10, "handle");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "value");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3500], "controlCharacterSet");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "stringByTrimmingCharactersInSet:", v17);
          v18 = objc_claimAutoreleasedReturnValue();

          v14 = (void *)v18;
        }
        if (objc_msgSend(v14, "length"))
          objc_msgSend(v5, "addObject:", v14);

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v7);
  }

  v19 = (void *)objc_msgSend(v5, "copy");
  return v19;
}

- (id)contactNamesByHandleWithContactsDataSource:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  void *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[TUJoinConversationRequest sanitizedHandles](self, "sanitizedHandles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v10);
        objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v12;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "contactForDestinationId:keysToFetch:", v11, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v14, "displayName");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v15, "length"))
          v16 = v15;
        else
          v16 = v11;
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v16, v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v8);
  }

  v17 = (void *)objc_msgSend(v6, "copy");
  return v17;
}

- (void)setAvMode:(unint64_t)a3
{
  unint64_t v4;
  void *v5;
  _BOOL4 v6;
  unint64_t v7;

  if (a3 == 2)
  {
    -[TUJoinConversationRequest remoteMembers](self, "remoteMembers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count") == 1)
    {
      v6 = -[TUJoinConversationRequest supportsAVMode:](self, "supportsAVMode:", 2);

      if (v6)
        v4 = 2;
      else
        v4 = 1;
    }
    else
    {

      v4 = 2;
    }
  }
  else
  {
    v4 = a3;
    if (a3 == 1)
      -[TUJoinConversationRequest setVideoEnabled:](self, "setVideoEnabled:", 0);
  }
  if (self->_avMode != v4 && -[TUJoinConversationRequest supportsAVMode:](self, "supportsAVMode:", v4))
  {
    self->_avMode = v4;
    if (v4)
    {
      v7 = 0;
LABEL_13:
      self->_presentationMode = v7;
      return;
    }
    if (!self->_presentationMode)
    {
      v7 = 1;
      goto LABEL_13;
    }
  }
}

- (void)setRemoteMembers:(id)a3
{
  NSUInteger v4;
  uint64_t v5;
  NSSet *v6;
  NSSet *remoteMembers;
  id v8;

  v8 = a3;
  if ((TUObjectsAreEqualOrNil((unint64_t)self->_remoteMembers, (uint64_t)v8) & 1) == 0)
  {
    v4 = -[NSSet count](self->_remoteMembers, "count");
    v5 = objc_msgSend(v8, "count");
    v6 = (NSSet *)objc_msgSend(v8, "copy");
    remoteMembers = self->_remoteMembers;
    self->_remoteMembers = v6;

    if (v4 != v5)
      -[TUJoinConversationRequest setAvMode:](self, "setAvMode:", self->_avMode);
  }

}

- (BOOL)supportsAVMode:(unint64_t)a3
{
  void *v4;
  void *v5;
  char v6;

  -[TUJoinConversationRequest provider](self, "provider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "supportsAVMode:", a3);
  else
    v6 = 1;

  return v6;
}

- (BOOL)isVideo
{
  return -[TUJoinConversationRequest avMode](self, "avMode") == 2;
}

- (void)setVideo:(BOOL)a3
{
  uint64_t v3;

  if (a3)
    v3 = 2;
  else
    v3 = 1;
  -[TUJoinConversationRequest setAvMode:](self, "setAvMode:", v3);
}

- (BOOL)isVideoEnabled
{
  return -[TUJoinConversationRequest avMode](self, "avMode") == 2 && self->_videoEnabled;
}

- (void)setVideoEnabled:(BOOL)a3
{
  self->_videoEnabled = a3;
  if (a3)
    -[TUJoinConversationRequest setVideo:](self, "setVideo:", 1);
}

- (NSURL)URL
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x1E0CB3998]);
  objc_msgSend(MEMORY[0x1E0C99E98], "faceTimeMultiwayScheme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setScheme:", v4);

  -[TUJoinConversationRequest queryItems](self, "queryItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setQueryItems:", v5);

  objc_msgSend(v3, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v6;
}

- (BOOL)isOneToOne
{
  void *v3;
  void *v4;
  BOOL v5;

  -[TUJoinConversationRequest remoteMembers](self, "remoteMembers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") == 1)
  {
    -[TUJoinConversationRequest otherInvitedHandles](self, "otherInvitedHandles");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count") == 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NSDictionary)notificationStylesByHandleType
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[TUJoinConversationRequest invitationPreferences](self, "invitationPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
    return (NSDictionary *)0;
  v5 = (void *)MEMORY[0x1E0C99E08];
  -[TUJoinConversationRequest invitationPreferences](self, "invitationPreferences");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[TUJoinConversationRequest invitationPreferences](self, "invitationPreferences", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v13, "notificationStyles"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v13, "handleType"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v14, v15);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

  v16 = (void *)objc_msgSend(v7, "copy");
  return (NSDictionary *)v16;
}

- (id)queryItems
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
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
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUJoinConversationRequest remoteMembersQueryItem](self, "remoteMembersQueryItem");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v3, "addObject:", v4);
  -[TUJoinConversationRequest otherInvitedHandlesQueryItem](self, "otherInvitedHandlesQueryItem");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v3, "addObject:", v5);
  -[TUJoinConversationRequest callerIDQueryItem](self, "callerIDQueryItem");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v3, "addObject:", v6);
  -[TUJoinConversationRequest videoEnabledQueryItem](self, "videoEnabledQueryItem");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v3, "addObject:", v7);
  -[TUJoinConversationRequest uplinkMutedQueryItem](self, "uplinkMutedQueryItem");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v3, "addObject:", v8);
  -[TUJoinConversationRequest shouldSuppressInCallUIQueryItem](self, "shouldSuppressInCallUIQueryItem");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
    objc_msgSend(v3, "addObject:", v9);
  -[TUJoinConversationRequest wantsStagingAreaQueryItem](self, "wantsStagingAreaQueryItem");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
    objc_msgSend(v3, "addObject:", v10);
  v53 = (void *)v4;
  -[TUJoinConversationRequest uuidQueryItem](self, "uuidQueryItem");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
    objc_msgSend(v3, "addObject:", v11);
  v49 = (void *)v8;
  -[TUJoinConversationRequest messagesGroupUUIDQueryItem](self, "messagesGroupUUIDQueryItem");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
    objc_msgSend(v3, "addObject:", v12);
  v13 = (void *)v5;
  v45 = (void *)v12;
  -[TUJoinConversationRequest messagesGroupNameQueryItem](self, "messagesGroupNameQueryItem");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
    objc_msgSend(v3, "addObject:", v14);
  v48 = (void *)v9;
  -[TUJoinConversationRequest showUIPromptQueryItem](self, "showUIPromptQueryItem");
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15)
    objc_msgSend(v3, "addObject:", v15);
  v16 = (void *)v6;
  v43 = (void *)v15;
  -[TUJoinConversationRequest sendLetMeInRequestQueryItem](self, "sendLetMeInRequestQueryItem");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
    objc_msgSend(v3, "addObject:", v17);
  v47 = (void *)v10;
  -[TUJoinConversationRequest joiningConversationWithLinkQueryItem](self, "joiningConversationWithLinkQueryItem");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
    objc_msgSend(v3, "addObject:", v18);
  v19 = (void *)v7;
  v41 = (void *)v18;
  -[TUJoinConversationRequest invitationPreferencesQueryItem](self, "invitationPreferencesQueryItem");
  v20 = objc_claimAutoreleasedReturnValue();
  if (v20)
    objc_msgSend(v3, "addObject:", v20);
  -[TUJoinConversationRequest videoQueryItem](self, "videoQueryItem");
  v21 = objc_claimAutoreleasedReturnValue();
  if (v21)
    objc_msgSend(v3, "addObject:", v21);
  v39 = (void *)v21;
  -[TUJoinConversationRequest providerQueryItem](self, "providerQueryItem");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
    objc_msgSend(v3, "addObject:", v22);
  v42 = (void *)v17;
  v52 = v13;
  -[TUJoinConversationRequest audioSourceIdentifierQueryItem](self, "audioSourceIdentifierQueryItem");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
    objc_msgSend(v3, "addObject:", v23);
  v37 = (void *)v23;
  v40 = (void *)v20;
  v51 = v16;
  -[TUJoinConversationRequest collaborationIdentifierQueryItem](self, "collaborationIdentifierQueryItem");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
    objc_msgSend(v3, "addObject:", v24);
  v38 = (void *)v22;
  v50 = v19;
  -[TUJoinConversationRequest originatingUIQueryItem](self, "originatingUIQueryItem");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
    objc_msgSend(v3, "addObject:", v25);
  -[TUJoinConversationRequest sendToScreeningQueryItem](self, "sendToScreeningQueryItem");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
    objc_msgSend(v3, "addObject:", v26);
  -[TUJoinConversationRequest requestToShareScreenQueryItem](self, "requestToShareScreenQueryItem");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
    objc_msgSend(v3, "addObject:", v27);
  -[TUJoinConversationRequest requestToShareMyScreenQueryItem](self, "requestToShareMyScreenQueryItem");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
    objc_msgSend(v3, "addObject:", v28);
  v46 = (void *)v11;
  -[TUJoinConversationRequest shouldSendLegacyScreenSharingInviteQueryItem](self, "shouldSendLegacyScreenSharingInviteQueryItem");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29)
    objc_msgSend(v3, "addObject:", v29);
  v44 = (void *)v14;
  -[TUJoinConversationRequest participantAssociation](self, "participantAssociation");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    -[TUJoinConversationRequest participantAssociation](self, "participantAssociation");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "queryItemsWithNamePrefix:", CFSTR("pA"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v32);

  }
  -[TUJoinConversationRequest avModeQueryItem](self, "avModeQueryItem");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v33);

  -[TUJoinConversationRequest presentationModeQueryItem](self, "presentationModeQueryItem");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v34);

  -[TUJoinConversationRequest conversationLinkQueryItem](self, "conversationLinkQueryItem");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (v35)
    objc_msgSend(v3, "addObject:", v35);

  return v3;
}

- (id)remoteMembersQueryItem
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[TUJoinConversationRequest remoteMembers](self, "remoteMembers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
    return 0;
  v5 = (void *)MEMORY[0x1E0C99DE8];
  -[TUJoinConversationRequest remoteMembers](self, "remoteMembers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[TUJoinConversationRequest remoteMembers](self, "remoteMembers", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "handle");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "value");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v14);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v10);
  }

  objc_msgSend(v7, "componentsJoinedByString:", CFSTR(";"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_alloc(MEMORY[0x1E0CB39D8]);
  NSStringFromSelector(sel_remoteMembers);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v16, "initWithName:value:", v17, v15);

  return v18;
}

- (id)otherInvitedHandlesQueryItem
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[TUJoinConversationRequest otherInvitedHandles](self, "otherInvitedHandles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
    return 0;
  v5 = (void *)MEMORY[0x1E0C99DE8];
  -[TUJoinConversationRequest otherInvitedHandles](self, "otherInvitedHandles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[TUJoinConversationRequest otherInvitedHandles](self, "otherInvitedHandles", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "value");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v13);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v10);
  }

  objc_msgSend(v7, "componentsJoinedByString:", CFSTR(";"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_alloc(MEMORY[0x1E0CB39D8]);
  NSStringFromSelector(sel_otherInvitedHandles);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "initWithName:value:", v16, v14);

  return v17;
}

- (id)videoEnabledQueryItem
{
  id v2;
  void *v3;
  void *v4;

  if (-[TUJoinConversationRequest isVideoEnabled](self, "isVideoEnabled"))
  {
    v2 = objc_alloc(MEMORY[0x1E0CB39D8]);
    NSStringFromSelector(sel_isVideoEnabled);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v2, "initWithName:value:", v3, CFSTR("1"));

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)uplinkMutedQueryItem
{
  id v2;
  void *v3;
  void *v4;

  if (-[TUJoinConversationRequest isUplinkMuted](self, "isUplinkMuted"))
  {
    v2 = objc_alloc(MEMORY[0x1E0CB39D8]);
    NSStringFromSelector(sel_isUplinkMuted);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v2, "initWithName:value:", v3, CFSTR("1"));

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)videoQueryItem
{
  id v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB39D8]);
  NSStringFromSelector(sel_isVideo);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[TUJoinConversationRequest avMode](self, "avMode") == 2)
    v5 = CFSTR("1");
  else
    v5 = CFSTR("0");
  v6 = (void *)objc_msgSend(v3, "initWithName:value:", v4, v5);

  return v6;
}

- (id)shouldSuppressInCallUIQueryItem
{
  id v2;
  void *v3;
  void *v4;

  if (-[TUJoinConversationRequest shouldSuppressInCallUI](self, "shouldSuppressInCallUI"))
  {
    v2 = objc_alloc(MEMORY[0x1E0CB39D8]);
    NSStringFromSelector(sel_shouldSuppressInCallUI);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v2, "initWithName:value:", v3, CFSTR("1"));

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)wantsStagingAreaQueryItem
{
  id v2;
  void *v3;
  void *v4;

  if (-[TUJoinConversationRequest wantsStagingArea](self, "wantsStagingArea"))
  {
    v2 = objc_alloc(MEMORY[0x1E0CB39D8]);
    NSStringFromSelector(sel_wantsStagingArea);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v2, "initWithName:value:", v3, CFSTR("1"));

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)conversationLinkQueryItem
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[TUJoinConversationRequest conversationLink](self, "conversationLink");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CB39D8]);
    NSStringFromSelector(sel_conversationLink);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUJoinConversationRequest conversationLink](self, "conversationLink");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "absoluteString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v4, "initWithName:value:", v5, v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)callerIDQueryItem
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[TUJoinConversationRequest callerID](self, "callerID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CB39D8]);
    NSStringFromSelector(sel_callerID);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUJoinConversationRequest callerID](self, "callerID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v4, "initWithName:value:", v5, v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)messagesGroupUUIDQueryItem
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[TUJoinConversationRequest messagesGroupUUID](self, "messagesGroupUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CB39D8]);
    NSStringFromSelector(sel_messagesGroupUUID);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUJoinConversationRequest messagesGroupUUID](self, "messagesGroupUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v4, "initWithName:value:", v5, v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)uuidQueryItem
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB39D8]);
  NSStringFromSelector(sel_UUID);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUJoinConversationRequest UUID](self, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithName:value:", v4, v6);

  return v7;
}

- (id)messagesGroupNameQueryItem
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  -[TUJoinConversationRequest messagesGroupName](self, "messagesGroupName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CB39D8]);
    NSStringFromSelector(sel_messagesGroupName);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUJoinConversationRequest messagesGroupName](self, "messagesGroupName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v4, "initWithName:value:", v5, v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)showUIPromptQueryItem
{
  id v2;
  void *v3;
  void *v4;

  if (-[TUJoinConversationRequest showUIPrompt](self, "showUIPrompt"))
  {
    v2 = objc_alloc(MEMORY[0x1E0CB39D8]);
    NSStringFromSelector(sel_showUIPrompt);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v2, "initWithName:value:", v3, CFSTR("1"));

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)sendLetMeInRequestQueryItem
{
  id v2;
  void *v3;
  void *v4;

  if (-[TUJoinConversationRequest sendLetMeInRequest](self, "sendLetMeInRequest"))
  {
    v2 = objc_alloc(MEMORY[0x1E0CB39D8]);
    NSStringFromSelector(sel_sendLetMeInRequest);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v2, "initWithName:value:", v3, CFSTR("1"));

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)joiningConversationWithLinkQueryItem
{
  id v2;
  void *v3;
  void *v4;

  if (-[TUJoinConversationRequest isJoiningConversationWithLink](self, "isJoiningConversationWithLink"))
  {
    v2 = objc_alloc(MEMORY[0x1E0CB39D8]);
    NSStringFromSelector(sel_isJoiningConversationWithLink);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v2, "initWithName:value:", v3, CFSTR("1"));

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)audioSourceIdentifierQueryItem
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  -[TUJoinConversationRequest audioSourceIdentifier](self, "audioSourceIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CB39D8]);
    NSStringFromSelector(sel_audioSourceIdentifier);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUJoinConversationRequest audioSourceIdentifier](self, "audioSourceIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v4, "initWithName:value:", v5, v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)collaborationIdentifierQueryItem
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  -[TUJoinConversationRequest collaborationIdentifier](self, "collaborationIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CB39D8]);
    NSStringFromSelector(sel_collaborationIdentifier);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUJoinConversationRequest collaborationIdentifier](self, "collaborationIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v4, "initWithName:value:", v5, v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)invitationPreferencesQueryItem
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[TUJoinConversationRequest invitationPreferences](self, "invitationPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
    return 0;
  v5 = (void *)MEMORY[0x1E0C99DE8];
  -[TUJoinConversationRequest invitationPreferences](self, "invitationPreferences");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[TUJoinConversationRequest invitationPreferences](self, "invitationPreferences");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld,%ld"), objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "handleType"), objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "notificationStyles"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v13);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v10);
  }

  objc_msgSend(v7, "componentsJoinedByString:", CFSTR(";"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_alloc(MEMORY[0x1E0CB39D8]);
  NSStringFromSelector(sel_invitationPreferences);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "initWithName:value:", v16, v14);

  return v17;
}

- (id)providerQueryItem
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB39D8]);
  NSStringFromSelector(sel_provider);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUJoinConversationRequest provider](self, "provider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithName:value:", v4, v6);

  return v7;
}

- (id)avModeQueryItem
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB39D8]);
  NSStringFromSelector(sel_avMode);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[TUJoinConversationRequest avMode](self, "avMode"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithName:value:", v4, v6);

  return v7;
}

- (id)presentationModeQueryItem
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB39D8]);
  NSStringFromSelector(sel_presentationMode);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[TUJoinConversationRequest presentationMode](self, "presentationMode"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithName:value:", v4, v6);

  return v7;
}

- (id)originatingUIQueryItem
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB39D8]);
  NSStringFromSelector(sel_originatingUIType);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[TUJoinConversationRequest originatingUIType](self, "originatingUIType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithName:value:", v4, v6);

  return v7;
}

- (id)sendToScreeningQueryItem
{
  id v2;
  void *v3;
  void *v4;

  if (-[TUJoinConversationRequest sendToScreening](self, "sendToScreening"))
  {
    v2 = objc_alloc(MEMORY[0x1E0CB39D8]);
    NSStringFromSelector(sel_sendToScreening);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v2, "initWithName:value:", v3, CFSTR("1"));

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)requestToShareScreenQueryItem
{
  id v2;
  void *v3;
  void *v4;

  if (-[TUJoinConversationRequest requestToShareScreen](self, "requestToShareScreen"))
  {
    v2 = objc_alloc(MEMORY[0x1E0CB39D8]);
    NSStringFromSelector(sel_requestToShareScreen);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v2, "initWithName:value:", v3, CFSTR("1"));

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)requestToShareMyScreenQueryItem
{
  id v2;
  void *v3;
  void *v4;

  if (-[TUJoinConversationRequest requestToShareMyScreen](self, "requestToShareMyScreen"))
  {
    v2 = objc_alloc(MEMORY[0x1E0CB39D8]);
    NSStringFromSelector(sel_requestToShareMyScreen);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v2, "initWithName:value:", v3, CFSTR("1"));

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)shouldSendLegacyScreenSharingInviteQueryItem
{
  id v2;
  void *v3;
  void *v4;

  if (-[TUJoinConversationRequest shouldSendLegacyScreenSharingInvite](self, "shouldSendLegacyScreenSharingInvite"))
  {
    v2 = objc_alloc(MEMORY[0x1E0CB39D8]);
    NSStringFromSelector(sel_shouldSendLegacyScreenSharingInvite);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v2, "initWithName:value:", v3, CFSTR("1"));

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (BOOL)hasAnySiriDisplayNames
{
  NSSet *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = self->_remoteMembers;
  v3 = -[NSSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v11 != v4)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "handle", (_QWORD)v10);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "siriDisplayName");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "length");

        if (v8)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = -[NSSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

+ (id)remoteMembersFromURLComponents:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  TUConversationMember *v15;
  TUConversationMember *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_remoteMembers);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstQueryItemWithName:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "componentsSeparatedByString:", CFSTR(";"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v20;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v20 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v13);
          v15 = [TUConversationMember alloc];
          v16 = -[TUConversationMember initWithDestination:](v15, "initWithDestination:", v14, (_QWORD)v19);
          objc_msgSend(v4, "addObject:", v16);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v11);
    }

  }
  v17 = (void *)objc_msgSend(v4, "copy", (_QWORD)v19);

  return v17;
}

+ (id)otherInvitedHandlesFromURLComponents:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_otherInvitedHandles);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstQueryItemWithName:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "componentsSeparatedByString:", CFSTR(";"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v18;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v18 != v12)
            objc_enumerationMutation(v9);
          +[TUHandle normalizedHandleWithDestinationID:](TUHandle, "normalizedHandleWithDestinationID:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v13), (_QWORD)v17);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v14);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v11);
    }

  }
  v15 = (void *)objc_msgSend(v4, "copy", (_QWORD)v17);

  return v15;
}

+ (BOOL)videoEnabledFromURLComponents:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  NSStringFromSelector(sel_isVideoEnabled);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstQueryItemWithName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v6, "isEqualToString:", CFSTR("1"));

  return (char)v3;
}

+ (BOOL)uplinkMutedFromURLComponents:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  NSStringFromSelector(sel_isUplinkMuted);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstQueryItemWithName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v6, "isEqualToString:", CFSTR("1"));

  return (char)v3;
}

+ (BOOL)videoFromURLComponents:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  v3 = a3;
  NSStringFromSelector(sel_isVideo);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstQueryItemWithName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("1"));

  }
  else
  {
    v7 = 1;
  }

  return v7;
}

+ (BOOL)shouldSuppressInCallUIFromURLComponents:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  NSStringFromSelector(sel_shouldSuppressInCallUI);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstQueryItemWithName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v6, "isEqualToString:", CFSTR("1"));

  return (char)v3;
}

+ (BOOL)wantsStagingAreaFromURLComponents:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  NSStringFromSelector(sel_wantsStagingArea);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstQueryItemWithName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v6, "isEqualToString:", CFSTR("1"));

  return (char)v3;
}

+ (BOOL)sendToScreeningFromURLComponents:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  NSStringFromSelector(sel_sendToScreening);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstQueryItemWithName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v6, "isEqualToString:", CFSTR("1"));

  return (char)v3;
}

+ (BOOL)requestToShareScreenFromURLComponents:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  NSStringFromSelector(sel_requestToShareScreen);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstQueryItemWithName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v6, "isEqualToString:", CFSTR("1"));

  return (char)v3;
}

+ (BOOL)requestToShareMyScreenFromURLComponents:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  NSStringFromSelector(sel_requestToShareMyScreen);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstQueryItemWithName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v6, "isEqualToString:", CFSTR("1"));

  return (char)v3;
}

+ (BOOL)shouldSendLegacyScreenSharingInviteFromURLComponents:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  NSStringFromSelector(sel_shouldSendLegacyScreenSharingInvite);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstQueryItemWithName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v6, "isEqualToString:", CFSTR("1"));

  return (char)v3;
}

+ (id)conversationLinkFromURLComponents:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  NSStringFromSelector(sel_conversationLink);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstQueryItemWithName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6
    && (v7 = (void *)MEMORY[0x1E0C99E98],
        objc_msgSend(v5, "value"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v7, "URLWithString:", v8),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    +[TUConversationLink conversationLinkForURL:](TUConversationLink, "conversationLinkForURL:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)callerIDFromURLComponents:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  NSStringFromSelector(sel_callerID);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstQueryItemWithName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v5, "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[TUHandle handleWithDestinationID:](TUHandle, "handleWithDestinationID:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)messagesGroupUUIDFromURLComponents:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v3 = a3;
  NSStringFromSelector(sel_messagesGroupUUID);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstQueryItemWithName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = objc_alloc(MEMORY[0x1E0CB3A28]);
    objc_msgSend(v5, "value");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithUUIDString:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)uuidFromURLComponents:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v3 = a3;
  NSStringFromSelector(sel_UUID);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstQueryItemWithName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = objc_alloc(MEMORY[0x1E0CB3A28]);
    objc_msgSend(v5, "value");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithUUIDString:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)messagesGroupNameFromURLComponents:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  NSStringFromSelector(sel_messagesGroupName);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstQueryItemWithName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)showUIPromptFromURLComponents:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(a3, "firstQueryItemWithName:", CFSTR("showUIPrompt"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("1"));

  return v5;
}

+ (BOOL)sendLetMeInRequestFromURLComponents:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  NSStringFromSelector(sel_sendLetMeInRequest);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstQueryItemWithName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v6, "isEqualToString:", CFSTR("1"));

  return (char)v3;
}

+ (BOOL)joiningConversationWithLinkFromURLComponents:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  NSStringFromSelector(sel_isJoiningConversationWithLink);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstQueryItemWithName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v6, "isEqualToString:", CFSTR("1"));

  return (char)v3;
}

+ (id)audioSourceIdentifierFromURLComponents:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  NSStringFromSelector(sel_audioSourceIdentifier);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstQueryItemWithName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (int)originatingUITypeFromURLComponents:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  NSStringFromSelector(sel_originatingUIType);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstQueryItemWithName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  TUDefaultLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412290;
    v12 = v7;
    _os_log_impl(&dword_19A50D000, v6, OS_LOG_TYPE_DEFAULT, "originating ui type from URL: %@", (uint8_t *)&v11, 0xCu);

  }
  objc_msgSend(v5, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v5, "value");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v8) = objc_msgSend(v9, "intValue");

  }
  return (int)v8;
}

+ (id)collaborationIdentifierFromURLComponents:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  NSStringFromSelector(sel_collaborationIdentifier);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstQueryItemWithName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)invitationPreferencesFromURLComponents:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  TUConversationInvitationPreference *v18;
  void *v19;
  id v21;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_invitationPreferences);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstQueryItemWithName:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v21 = v3;
    objc_msgSend(v6, "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "componentsSeparatedByString:", CFSTR(";"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    obj = v8;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v24 != v11)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "componentsSeparatedByString:", CFSTR(","));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = (int)objc_msgSend(v14, "intValue");

          objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = (int)objc_msgSend(v16, "intValue");

          v18 = -[TUConversationInvitationPreference initWithHandleType:notificationStyles:]([TUConversationInvitationPreference alloc], "initWithHandleType:notificationStyles:", v15, v17);
          objc_msgSend(v4, "addObject:", v18);

        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v10);
    }

    v3 = v21;
  }
  v19 = (void *)objc_msgSend(v4, "copy");

  return v19;
}

+ (id)providerFromURLComponents:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  NSStringFromSelector(sel_provider);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstQueryItemWithName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v5, "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[TUConversationProvider providerForIdentifier:](TUConversationProvider, "providerForIdentifier:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[TUConversationProvider unknownProvider](TUConversationProvider, "unknownProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

+ (unint64_t)avModeFromURLComponents:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  TUFeatureFlags *v6;
  uint64_t v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  unint64_t v11;

  v3 = a3;
  NSStringFromSelector(sel_avMode);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstQueryItemWithName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc_init(TUFeatureFlags);
  objc_msgSend(v5, "value");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7
    && (v8 = (void *)v7,
        v9 = -[TUFeatureFlags avLessSharePlayEnabled](v6, "avLessSharePlayEnabled"),
        v8,
        v9))
  {
    objc_msgSend(v5, "value");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "integerValue");

  }
  else if (objc_msgSend((id)objc_opt_class(), "videoFromURLComponents:", v3))
  {
    v11 = 2;
  }
  else
  {
    v11 = 1;
  }

  return v11;
}

+ (unint64_t)presentationModeFromURLComponents:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  TUFeatureFlags *v6;
  void *v7;
  _BOOL4 v8;
  void *v9;

  v3 = a3;
  NSStringFromSelector(sel_presentationMode);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstQueryItemWithName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc_init(TUFeatureFlags);
  objc_msgSend(v5, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = -[TUFeatureFlags avLessSharePlayEnabled](v6, "avLessSharePlayEnabled");

    if (v8)
    {
      objc_msgSend(v5, "value");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(v9, "integerValue");

    }
    else
    {
      v7 = 0;
    }
  }

  return (unint64_t)v7;
}

+ (id)sanitizedMembersFromMembers:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v10, "handle", (_QWORD)v16);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "value");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "length");

        if (v13)
        {
          v14 = (void *)objc_msgSend(v10, "copy");
          objc_msgSend(v4, "addObject:", v14);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)conversationMembersForIntent:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  TUConversationMember *v17;
  void *v18;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "contacts");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v27 = v5;
    _os_log_impl(&dword_19A50D000, v4, OS_LOG_TYPE_DEFAULT, "creating conversation members from intent contacts: %@", buf, 0xCu);

  }
  v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v20 = v3;
  objc_msgSend(v3, "contacts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v12, "personHandle");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "value");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "length");

        if (v15)
        {
          +[TUHandle handleWithPerson:](TUHandle, "handleWithPerson:", v12);
          v16 = objc_claimAutoreleasedReturnValue();
          v17 = -[TUConversationMember initWithHandle:nickname:]([TUConversationMember alloc], "initWithHandle:nickname:", v16, 0);
          objc_msgSend(v6, "addObject:", v17);

        }
        else
        {
          TUDefaultLog();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v27 = v12;
            _os_log_impl(&dword_19A50D000, v16, OS_LOG_TYPE_DEFAULT, "personHandle was empty: %@", buf, 0xCu);
          }
        }

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v9);
  }

  v18 = (void *)objc_msgSend(v6, "copy");
  return v18;
}

- (id)userActivityUsingStartCallIntents
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  void *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[TUJoinConversationRequest remoteMembers](self, "remoteMembers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v22;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v8), "handle");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "personHandle");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        v11 = (void *)objc_msgSend(objc_alloc((Class)CUTWeakLinkClass()), "initWithPersonHandle:nameComponents:displayName:image:contactIdentifier:customIdentifier:", v10, 0, 0, 0, 0, 0);
        objc_msgSend(v3, "addObject:", v11);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    }
    while (v6);
  }

  if (-[TUJoinConversationRequest isVideoEnabled](self, "isVideoEnabled"))
    v12 = 2;
  else
    v12 = 1;
  v13 = (void *)objc_msgSend(objc_alloc((Class)CUTWeakLinkClass()), "initWithCallRecordFilter:callRecordToCallBack:audioRoute:destinationType:preferredCallProvider:contacts:ttyType:callCapability:", 0, 0, 0, 1, 2, v3, 1, v12);
  v14 = CFSTR("INStartCallIntent");
  v15 = (void *)objc_msgSend(objc_alloc((Class)CUTWeakLinkClass()), "initWithIntent:response:", v13, 0);
  objc_msgSend(v15, "setDirection:", 1);
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5920]), "initWithActivityType:", v14);
  objc_msgSend(v16, "_setInteraction:donate:", v15, 0);
  TUDefaultLog();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v16, "interaction");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "intent");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v26 = v19;
    _os_log_impl(&dword_19A50D000, v17, OS_LOG_TYPE_DEFAULT, "userActivity with intent: %@", buf, 0xCu);

  }
  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
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

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[TUJoinConversationRequest remoteMembers](self, "remoteMembers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUJoinConversationRequest otherInvitedHandles](self, "otherInvitedHandles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithRemoteMembers:otherInvitedHandles:", v5, v6);

  objc_msgSend(v7, "setAvMode:", -[TUJoinConversationRequest avMode](self, "avMode"));
  objc_msgSend(v7, "setPresentationMode:", -[TUJoinConversationRequest presentationMode](self, "presentationMode"));
  -[TUJoinConversationRequest UUID](self, "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUUID:", v8);

  objc_msgSend(v7, "setVideoEnabled:", -[TUJoinConversationRequest isVideoEnabled](self, "isVideoEnabled"));
  objc_msgSend(v7, "setUplinkMuted:", -[TUJoinConversationRequest isUplinkMuted](self, "isUplinkMuted"));
  objc_msgSend(v7, "setShouldSuppressInCallUI:", -[TUJoinConversationRequest shouldSuppressInCallUI](self, "shouldSuppressInCallUI"));
  objc_msgSend(v7, "setWantsStagingArea:", -[TUJoinConversationRequest wantsStagingArea](self, "wantsStagingArea"));
  -[TUJoinConversationRequest conversationLink](self, "conversationLink");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setConversationLink:", v9);

  -[TUJoinConversationRequest callerID](self, "callerID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCallerID:", v10);

  -[TUJoinConversationRequest messagesGroupUUID](self, "messagesGroupUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMessagesGroupUUID:", v11);

  -[TUJoinConversationRequest messagesGroupName](self, "messagesGroupName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMessagesGroupName:", v12);

  objc_msgSend(v7, "setSendLetMeInRequest:", -[TUJoinConversationRequest sendLetMeInRequest](self, "sendLetMeInRequest"));
  objc_msgSend(v7, "setJoiningConversationWithLink:", -[TUJoinConversationRequest isJoiningConversationWithLink](self, "isJoiningConversationWithLink"));
  -[TUJoinConversationRequest invitationPreferences](self, "invitationPreferences");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setInvitationPreferences:", v13);

  -[TUJoinConversationRequest audioSourceIdentifier](self, "audioSourceIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAudioSourceIdentifier:", v14);

  -[TUJoinConversationRequest participantAssociation](self, "participantAssociation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setParticipantAssociation:", v15);

  objc_msgSend(v7, "setSendToScreening:", -[TUJoinConversationRequest sendToScreening](self, "sendToScreening"));
  objc_msgSend(v7, "setRequestToShareScreen:", -[TUJoinConversationRequest requestToShareScreen](self, "requestToShareScreen"));
  objc_msgSend(v7, "setRequestToShareMyScreen:", -[TUJoinConversationRequest requestToShareMyScreen](self, "requestToShareMyScreen"));
  objc_msgSend(v7, "setShouldSendLegacyScreenSharingInvite:", -[TUJoinConversationRequest shouldSendLegacyScreenSharingInvite](self, "shouldSendLegacyScreenSharingInvite"));
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUJoinConversationRequest)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  TUJoinConversationRequest *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  NSUUID *UUID;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  TUConversationLink *conversationLink;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  TUHandle *callerID;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  NSUUID *messagesGroupUUID;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  NSString *messagesGroupName;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
  NSSet *invitationPreferences;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  TUConversationProvider *provider;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  NSString *audioSourceIdentifier;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  NSString *collaborationIdentifier;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  TUConversationParticipantAssociation *participantAssociation;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  TUConversationActivity *activity;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_remoteMembers);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0C99E60];
  v11 = objc_opt_class();
  objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_otherInvitedHandles);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[TUJoinConversationRequest initWithRemoteMembers:otherInvitedHandles:](self, "initWithRemoteMembers:otherInvitedHandles:", v9, v14);
  if (v15)
  {
    NSStringFromSelector(sel_avMode);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v15->_avMode = objc_msgSend(v4, "decodeIntegerForKey:", v16);

    NSStringFromSelector(sel_presentationMode);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v15->_presentationMode = objc_msgSend(v4, "decodeIntegerForKey:", v17);

    NSStringFromSelector(sel_originatingUIType);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v15->_originatingUIType = objc_msgSend(v4, "decodeIntegerForKey:", v18);

    v19 = objc_opt_class();
    NSStringFromSelector(sel_UUID);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v19, v20);
    v21 = objc_claimAutoreleasedReturnValue();
    UUID = v15->_UUID;
    v15->_UUID = (NSUUID *)v21;

    NSStringFromSelector(sel_isVideoEnabled);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v15->_videoEnabled = objc_msgSend(v4, "decodeBoolForKey:", v23);

    NSStringFromSelector(sel_isUplinkMuted);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v15->_uplinkMuted = objc_msgSend(v4, "decodeBoolForKey:", v24);

    NSStringFromSelector(sel_shouldSuppressInCallUI);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v15->_shouldSuppressInCallUI = objc_msgSend(v4, "decodeBoolForKey:", v25);

    NSStringFromSelector(sel_wantsStagingArea);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v15->_wantsStagingArea = objc_msgSend(v4, "decodeBoolForKey:", v26);

    v27 = objc_opt_class();
    NSStringFromSelector(sel_conversationLink);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v27, v28);
    v29 = objc_claimAutoreleasedReturnValue();
    conversationLink = v15->_conversationLink;
    v15->_conversationLink = (TUConversationLink *)v29;

    v31 = objc_opt_class();
    NSStringFromSelector(sel_callerID);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v31, v32);
    v33 = objc_claimAutoreleasedReturnValue();
    callerID = v15->_callerID;
    v15->_callerID = (TUHandle *)v33;

    v35 = objc_opt_class();
    NSStringFromSelector(sel_messagesGroupUUID);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v35, v36);
    v37 = objc_claimAutoreleasedReturnValue();
    messagesGroupUUID = v15->_messagesGroupUUID;
    v15->_messagesGroupUUID = (NSUUID *)v37;

    v39 = objc_opt_class();
    NSStringFromSelector(sel_messagesGroupName);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v39, v40);
    v41 = objc_claimAutoreleasedReturnValue();
    messagesGroupName = v15->_messagesGroupName;
    v15->_messagesGroupName = (NSString *)v41;

    NSStringFromSelector(sel_sendLetMeInRequest);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v15->_sendLetMeInRequest = objc_msgSend(v4, "decodeBoolForKey:", v43);

    NSStringFromSelector(sel_isJoiningConversationWithLink);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v15->_joiningConversationWithLink = objc_msgSend(v4, "decodeBoolForKey:", v44);

    v45 = (void *)MEMORY[0x1E0C99E60];
    v46 = objc_opt_class();
    objc_msgSend(v45, "setWithObjects:", v46, objc_opt_class(), 0);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_invitationPreferences);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v47, v48);
    v49 = objc_claimAutoreleasedReturnValue();
    invitationPreferences = v15->_invitationPreferences;
    v15->_invitationPreferences = (NSSet *)v49;

    v51 = objc_opt_class();
    NSStringFromSelector(sel_provider);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v51, v52);
    v53 = objc_claimAutoreleasedReturnValue();
    provider = v15->_provider;
    v15->_provider = (TUConversationProvider *)v53;

    v55 = objc_opt_class();
    NSStringFromSelector(sel_audioSourceIdentifier);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v55, v56);
    v57 = objc_claimAutoreleasedReturnValue();
    audioSourceIdentifier = v15->_audioSourceIdentifier;
    v15->_audioSourceIdentifier = (NSString *)v57;

    v59 = objc_opt_class();
    NSStringFromSelector(sel_collaborationIdentifier);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v59, v60);
    v61 = objc_claimAutoreleasedReturnValue();
    collaborationIdentifier = v15->_collaborationIdentifier;
    v15->_collaborationIdentifier = (NSString *)v61;

    v63 = objc_opt_class();
    NSStringFromSelector(sel_participantAssociation);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v63, v64);
    v65 = objc_claimAutoreleasedReturnValue();
    participantAssociation = v15->_participantAssociation;
    v15->_participantAssociation = (TUConversationParticipantAssociation *)v65;

    v67 = objc_opt_class();
    NSStringFromSelector(sel_activity);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v67, v68);
    v69 = objc_claimAutoreleasedReturnValue();
    activity = v15->_activity;
    v15->_activity = (TUConversationActivity *)v69;

    NSStringFromSelector(sel_shouldLaunchBackgroundInCallUI);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v15->_shouldLaunchBackgroundInCallUI = objc_msgSend(v4, "decodeBoolForKey:", v71);

    NSStringFromSelector(sel_sendToScreening);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v15->_sendToScreening = objc_msgSend(v4, "decodeBoolForKey:", v72);

    NSStringFromSelector(sel_requestToShareScreen);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v15->_requestToShareScreen = objc_msgSend(v4, "decodeBoolForKey:", v73);

    NSStringFromSelector(sel_requestToShareMyScreen);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v15->_requestToShareMyScreen = objc_msgSend(v4, "decodeBoolForKey:", v74);

    NSStringFromSelector(sel_shouldSendLegacyScreenSharingInvite);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v15->_shouldSendLegacyScreenSharingInvite = objc_msgSend(v4, "decodeBoolForKey:", v75);

  }
  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL8 v15;
  void *v16;
  _BOOL8 v17;
  void *v18;
  _BOOL8 v19;
  void *v20;
  _BOOL8 v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _BOOL8 v31;
  void *v32;
  _BOOL8 v33;
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
  _BOOL8 v47;
  void *v48;
  uint64_t v49;
  void *v50;
  _BOOL8 v51;
  void *v52;
  _BOOL8 v53;
  void *v54;
  _BOOL8 v55;
  void *v56;
  _BOOL8 v57;
  id v58;

  v4 = a3;
  v5 = -[TUJoinConversationRequest avMode](self, "avMode");
  NSStringFromSelector(sel_avMode);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v5, v6);

  v7 = -[TUJoinConversationRequest presentationMode](self, "presentationMode");
  NSStringFromSelector(sel_presentationMode);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v7, v8);

  -[TUJoinConversationRequest remoteMembers](self, "remoteMembers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_remoteMembers);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, v10);

  -[TUJoinConversationRequest otherInvitedHandles](self, "otherInvitedHandles");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_otherInvitedHandles);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, v12);

  -[TUJoinConversationRequest UUID](self, "UUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_UUID);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, v14);

  v15 = -[TUJoinConversationRequest isVideoEnabled](self, "isVideoEnabled");
  NSStringFromSelector(sel_isVideoEnabled);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v15, v16);

  v17 = -[TUJoinConversationRequest isUplinkMuted](self, "isUplinkMuted");
  NSStringFromSelector(sel_isUplinkMuted);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v17, v18);

  v19 = -[TUJoinConversationRequest shouldSuppressInCallUI](self, "shouldSuppressInCallUI");
  NSStringFromSelector(sel_shouldSuppressInCallUI);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v19, v20);

  v21 = -[TUJoinConversationRequest wantsStagingArea](self, "wantsStagingArea");
  NSStringFromSelector(sel_wantsStagingArea);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v21, v22);

  -[TUJoinConversationRequest conversationLink](self, "conversationLink");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_conversationLink);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v23, v24);

  -[TUJoinConversationRequest callerID](self, "callerID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_callerID);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v25, v26);

  -[TUJoinConversationRequest messagesGroupUUID](self, "messagesGroupUUID");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_messagesGroupUUID);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v27, v28);

  -[TUJoinConversationRequest messagesGroupName](self, "messagesGroupName");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_messagesGroupName);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v29, v30);

  v31 = -[TUJoinConversationRequest sendLetMeInRequest](self, "sendLetMeInRequest");
  NSStringFromSelector(sel_sendLetMeInRequest);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v31, v32);

  v33 = -[TUJoinConversationRequest isJoiningConversationWithLink](self, "isJoiningConversationWithLink");
  NSStringFromSelector(sel_isJoiningConversationWithLink);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v33, v34);

  -[TUJoinConversationRequest invitationPreferences](self, "invitationPreferences");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_invitationPreferences);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v35, v36);

  -[TUJoinConversationRequest provider](self, "provider");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_provider);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v37, v38);

  -[TUJoinConversationRequest audioSourceIdentifier](self, "audioSourceIdentifier");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_audioSourceIdentifier);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v39, v40);

  -[TUJoinConversationRequest collaborationIdentifier](self, "collaborationIdentifier");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_collaborationIdentifier);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v41, v42);

  -[TUJoinConversationRequest participantAssociation](self, "participantAssociation");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_participantAssociation);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v43, v44);

  -[TUJoinConversationRequest activity](self, "activity");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_activity);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v45, v46);

  v47 = -[TUJoinConversationRequest shouldLaunchBackgroundInCallUI](self, "shouldLaunchBackgroundInCallUI");
  NSStringFromSelector(sel_shouldLaunchBackgroundInCallUI);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v47, v48);

  v49 = -[TUJoinConversationRequest originatingUIType](self, "originatingUIType");
  NSStringFromSelector(sel_originatingUIType);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v49, v50);

  v51 = -[TUJoinConversationRequest sendToScreening](self, "sendToScreening");
  NSStringFromSelector(sel_sendToScreening);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v51, v52);

  v53 = -[TUJoinConversationRequest requestToShareScreen](self, "requestToShareScreen");
  NSStringFromSelector(sel_requestToShareScreen);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v53, v54);

  v55 = -[TUJoinConversationRequest requestToShareMyScreen](self, "requestToShareMyScreen");
  NSStringFromSelector(sel_requestToShareMyScreen);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v55, v56);

  v57 = -[TUJoinConversationRequest shouldSendLegacyScreenSharingInvite](self, "shouldSendLegacyScreenSharingInvite");
  NSStringFromSelector(sel_shouldSendLegacyScreenSharingInvite);
  v58 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v57, v58);

}

- (NSSet)remoteMembers
{
  return self->_remoteMembers;
}

- (NSSet)otherInvitedHandles
{
  return self->_otherInvitedHandles;
}

- (NSString)audioSourceIdentifier
{
  return self->_audioSourceIdentifier;
}

- (void)setAudioSourceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (void)setUUID:(id)a3
{
  objc_storeStrong((id *)&self->_UUID, a3);
}

- (BOOL)shouldSuppressInCallUI
{
  return self->_shouldSuppressInCallUI;
}

- (void)setShouldSuppressInCallUI:(BOOL)a3
{
  self->_shouldSuppressInCallUI = a3;
}

- (BOOL)wantsStagingArea
{
  return self->_wantsStagingArea;
}

- (void)setWantsStagingArea:(BOOL)a3
{
  self->_wantsStagingArea = a3;
}

- (TUConversationLink)conversationLink
{
  return self->_conversationLink;
}

- (void)setConversationLink:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (TUConversationActivity)activity
{
  return self->_activity;
}

- (void)setActivity:(id)a3
{
  objc_storeStrong((id *)&self->_activity, a3);
}

- (BOOL)shouldLaunchBackgroundInCallUI
{
  return self->_shouldLaunchBackgroundInCallUI;
}

- (void)setShouldLaunchBackgroundInCallUI:(BOOL)a3
{
  self->_shouldLaunchBackgroundInCallUI = a3;
}

- (BOOL)sendToScreening
{
  return self->_sendToScreening;
}

- (void)setSendToScreening:(BOOL)a3
{
  self->_sendToScreening = a3;
}

- (BOOL)requestToShareMyScreen
{
  return self->_requestToShareMyScreen;
}

- (void)setRequestToShareMyScreen:(BOOL)a3
{
  self->_requestToShareMyScreen = a3;
}

- (BOOL)requestToShareScreen
{
  return self->_requestToShareScreen;
}

- (void)setRequestToShareScreen:(BOOL)a3
{
  self->_requestToShareScreen = a3;
}

- (BOOL)shouldSendLegacyScreenSharingInvite
{
  return self->_shouldSendLegacyScreenSharingInvite;
}

- (void)setShouldSendLegacyScreenSharingInvite:(BOOL)a3
{
  self->_shouldSendLegacyScreenSharingInvite = a3;
}

- (TUConversationProvider)provider
{
  return self->_provider;
}

- (void)setProvider:(id)a3
{
  objc_storeStrong((id *)&self->_provider, a3);
}

- (int)originatingUIType
{
  return self->_originatingUIType;
}

- (void)setOriginatingUIType:(int)a3
{
  self->_originatingUIType = a3;
}

- (TUHandle)callerID
{
  return self->_callerID;
}

- (void)setCallerID:(id)a3
{
  objc_storeStrong((id *)&self->_callerID, a3);
}

- (NSUUID)messagesGroupUUID
{
  return self->_messagesGroupUUID;
}

- (void)setMessagesGroupUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)messagesGroupName
{
  return self->_messagesGroupName;
}

- (void)setMessagesGroupName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (BOOL)showUIPrompt
{
  return self->_showUIPrompt;
}

- (void)setShowUIPrompt:(BOOL)a3
{
  self->_showUIPrompt = a3;
}

- (BOOL)isUplinkMuted
{
  return self->_uplinkMuted;
}

- (void)setUplinkMuted:(BOOL)a3
{
  self->_uplinkMuted = a3;
}

- (unint64_t)avMode
{
  return self->_avMode;
}

- (unint64_t)presentationMode
{
  return self->_presentationMode;
}

- (void)setPresentationMode:(unint64_t)a3
{
  self->_presentationMode = a3;
}

- (NSString)collaborationIdentifier
{
  return self->_collaborationIdentifier;
}

- (void)setCollaborationIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_collaborationIdentifier, a3);
}

- (BOOL)sendLetMeInRequest
{
  return self->_sendLetMeInRequest;
}

- (void)setSendLetMeInRequest:(BOOL)a3
{
  self->_sendLetMeInRequest = a3;
}

- (BOOL)isJoiningConversationWithLink
{
  return self->_joiningConversationWithLink;
}

- (void)setJoiningConversationWithLink:(BOOL)a3
{
  self->_joiningConversationWithLink = a3;
}

- (NSSet)invitationPreferences
{
  return self->_invitationPreferences;
}

- (void)setInvitationPreferences:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (TUConversationParticipantAssociation)participantAssociation
{
  return self->_participantAssociation;
}

- (void)setParticipantAssociation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (BOOL)hostedOnCurrentDevice
{
  return self->_hostedOnCurrentDevice;
}

- (void)setHostedOnCurrentDevice:(BOOL)a3
{
  self->_hostedOnCurrentDevice = a3;
}

- (BOOL)endpointOnCurrentDevice
{
  return self->_endpointOnCurrentDevice;
}

- (void)setEndpointOnCurrentDevice:(BOOL)a3
{
  self->_endpointOnCurrentDevice = a3;
}

- (BOOL)prefersAddingRemoteMembersAfterHandoff
{
  return self->_prefersAddingRemoteMembersAfterHandoff;
}

- (void)setPrefersAddingRemoteMembersAfterHandoff:(BOOL)a3
{
  self->_prefersAddingRemoteMembersAfterHandoff = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_participantAssociation, 0);
  objc_storeStrong((id *)&self->_invitationPreferences, 0);
  objc_storeStrong((id *)&self->_collaborationIdentifier, 0);
  objc_storeStrong((id *)&self->_messagesGroupName, 0);
  objc_storeStrong((id *)&self->_messagesGroupUUID, 0);
  objc_storeStrong((id *)&self->_callerID, 0);
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_conversationLink, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_audioSourceIdentifier, 0);
  objc_storeStrong((id *)&self->_otherInvitedHandles, 0);
  objc_storeStrong((id *)&self->_remoteMembers, 0);
}

@end
