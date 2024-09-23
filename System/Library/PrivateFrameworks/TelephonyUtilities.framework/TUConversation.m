@implementation TUConversation

+ (id)emptyConversationWithGroupUUID:(id)a3
{
  id v3;
  TUConversation *v4;
  void *v5;
  TUConversation *v6;
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

  v3 = a3;
  v4 = [TUConversation alloc];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[TUConversation initWithUUID:groupUUID:](v4, "initWithUUID:groupUUID:", v5, v3);

  -[TUConversation setState:](v6, "setState:", 0);
  -[TUConversation setLetMeInRequestState:](v6, "setLetMeInRequestState:", 0);
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUConversation setParticipantHandles:](v6, "setParticipantHandles:", v7);

  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUConversation setRemoteMembers:](v6, "setRemoteMembers:", v8);

  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUConversation setPendingMembers:](v6, "setPendingMembers:", v9);

  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUConversation setKickedMembers:](v6, "setKickedMembers:", v10);

  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUConversation setRejectedMembers:](v6, "setRejectedMembers:", v11);

  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUConversation setOtherInvitedHandles:](v6, "setOtherInvitedHandles:", v12);

  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUConversation setLightweightMembers:](v6, "setLightweightMembers:", v13);

  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUConversation setActiveRemoteParticipants:](v6, "setActiveRemoteParticipants:", v14);

  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUConversation setActiveLightweightParticipants:](v6, "setActiveLightweightParticipants:", v15);

  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUConversation setActivitySessions:](v6, "setActivitySessions:", v16);

  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUConversation setVirtualParticipants:](v6, "setVirtualParticipants:", v17);

  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUConversation setInvitationPreferences:](v6, "setInvitationPreferences:", v18);

  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUConversation setSystemActivitySessions:](v6, "setSystemActivitySessions:", v19);

  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUConversation setHighlightIdentifiers:](v6, "setHighlightIdentifiers:", v20);

  -[TUConversation setHostedOnCurrentDevice:](v6, "setHostedOnCurrentDevice:", 1);
  -[TUConversation setEndpointOnCurrentDevice:](v6, "setEndpointOnCurrentDevice:", 1);
  return v6;
}

- (TUConversation)initWithUUID:(id)a3 groupUUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  TUConversation *v9;

  v6 = a4;
  v7 = a3;
  +[TUConversationProvider unknownProvider](TUConversationProvider, "unknownProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[TUConversation initWithUUID:groupUUID:provider:](self, "initWithUUID:groupUUID:provider:", v7, v6, v8);

  return v9;
}

- (TUConversation)initWithUUID:(id)a3 groupUUID:(id)a4 provider:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  TUConversation *v13;

  v8 = (void *)MEMORY[0x1E0C99E60];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "set");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[TUConversation initWithUUID:groupUUID:provider:screenSharingRequests:](self, "initWithUUID:groupUUID:provider:screenSharingRequests:", v11, v10, v9, v12);

  return v13;
}

- (TUConversation)initWithUUID:(id)a3 groupUUID:(id)a4 provider:(id)a5 screenSharingRequests:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  TUConversation *v15;
  TUConversation *v16;
  uint64_t v17;
  NSSet *highlightIdentifiers;
  uint64_t v19;
  NSArray *supportedMediaTypes;
  objc_super v22;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)TUConversation;
  v15 = -[TUConversation init](&v22, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_UUID, a3);
    objc_storeStrong((id *)&v16->_groupUUID, a4);
    v16->_backedByGroupSession = 1;
    objc_storeStrong((id *)&v16->_provider, a5);
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v17 = objc_claimAutoreleasedReturnValue();
    highlightIdentifiers = v16->_highlightIdentifiers;
    v16->_highlightIdentifiers = (NSSet *)v17;

    v16->_avMode = objc_msgSend(v13, "defaultAVMode");
    -[TUConversation updatePresentationModeIfNecessary](v16, "updatePresentationModeIfNecessary");
    objc_msgSend(v13, "supportedMediaTypes");
    v19 = objc_claimAutoreleasedReturnValue();
    supportedMediaTypes = v16->_supportedMediaTypes;
    v16->_supportedMediaTypes = (NSArray *)v19;

    -[TUConversation setEndpointOnCurrentDevice:](v16, "setEndpointOnCurrentDevice:", 1);
    -[TUConversation setHostedOnCurrentDevice:](v16, "setHostedOnCurrentDevice:", 1);
    -[TUConversation setScreenSharingRequests:](v16, "setScreenSharingRequests:", v14);
  }

  return v16;
}

- (TUConversation)initWithConversation:(id)a3
{
  id v4;
  TUConversation *v5;
  TUConversation *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TUConversation;
  v5 = -[TUConversation init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_activeRemoteParticipants, *((id *)v4 + 17));
    objc_storeStrong((id *)&v6->_activeLightweightParticipants, *((id *)v4 + 18));
    objc_storeStrong((id *)&v6->_activitySessions, *((id *)v4 + 20));
    v6->_avMode = *((_QWORD *)v4 + 4);
    v6->_presentationMode = *((_QWORD *)v4 + 25);
    objc_storeStrong((id *)&v6->_stagedActivitySession, *((id *)v4 + 21));
    v6->_audioEnabled = *((_BYTE *)v4 + 9);
    objc_storeStrong((id *)&v6->_avcSessionIdentifier, *((id *)v4 + 28));
    v6->_avcSessionToken = *((_QWORD *)v4 + 26);
    v6->_localCaptionToken = *((_QWORD *)v4 + 27);
    v6->_backedByGroupSession = *((_BYTE *)v4 + 22);
    objc_storeStrong((id *)&v6->_groupUUID, *((id *)v4 + 6));
    v6->_hasJoined = *((_BYTE *)v4 + 16);
    objc_storeStrong((id *)&v6->_initiator, *((id *)v4 + 34));
    objc_storeStrong((id *)&v6->_kickedMembers, *((id *)v4 + 13));
    objc_storeStrong((id *)&v6->_rejectedMembers, *((id *)v4 + 14));
    objc_storeStrong((id *)&v6->_otherInvitedHandles, *((id *)v4 + 16));
    v6->_hasReceivedLetMeInRequest = *((_BYTE *)v4 + 8);
    v6->_letMeInRequestState = *((_QWORD *)v4 + 9);
    objc_storeStrong((id *)&v6->_link, *((id *)v4 + 7));
    v6->_locallyCreated = *((_BYTE *)v4 + 12);
    objc_storeStrong((id *)&v6->_localMember, *((id *)v4 + 29));
    v6->_localParticipantIdentifier = *((_QWORD *)v4 + 30);
    objc_storeStrong((id *)&v6->_localParticipantAssociation, *((id *)v4 + 31));
    v6->_oneToOneHandoffOngoing = *((_BYTE *)v4 + 19);
    objc_storeStrong((id *)&v6->_handoffEligibility, *((id *)v4 + 32));
    v6->_maxVideoDecodesAllowed = *((_QWORD *)v4 + 36);
    objc_storeStrong((id *)&v6->_messagesGroupName, *((id *)v4 + 35));
    objc_storeStrong((id *)&v6->_messagesGroupUUID, *((id *)v4 + 33));
    v6->_oneToOneModeEnabled = *((_BYTE *)v4 + 21);
    objc_storeStrong((id *)&v6->_participantHandles, *((id *)v4 + 10));
    objc_storeStrong((id *)&v6->_pendingMembers, *((id *)v4 + 12));
    objc_storeStrong((id *)&v6->_provider, *((id *)v4 + 23));
    objc_storeStrong((id *)&v6->_remoteMembers, *((id *)v4 + 11));
    objc_storeStrong((id *)&v6->_report, *((id *)v4 + 19));
    v6->_screenEnabled = *((_BYTE *)v4 + 11);
    v6->_state = *((_QWORD *)v4 + 8);
    objc_storeStrong((id *)&v6->_UUID, *((id *)v4 + 5));
    v6->_videoEnabled = *((_BYTE *)v4 + 10);
    v6->_videoPaused = *((_BYTE *)v4 + 15);
    objc_storeStrong((id *)&v6->_virtualParticipants, *((id *)v4 + 40));
    objc_storeStrong((id *)&v6->_invitationPreferences, *((id *)v4 + 41));
    objc_storeStrong((id *)&v6->_lightweightMembers, *((id *)v4 + 15));
    v6->_fromStorage = *((_BYTE *)v4 + 23);
    v6->_ignoreLMIRequests = *((_BYTE *)v4 + 20);
    v6->_isAnyOtherAccountDeviceActive = *((_BYTE *)v4 + 17);
    objc_storeStrong((id *)&v6->_supportedMediaTypes, *((id *)v4 + 24));
    objc_storeStrong((id *)&v6->_systemActivitySessions, *((id *)v4 + 39));
    objc_storeStrong((id *)&v6->_selectiveSharingSessionUUID, *((id *)v4 + 42));
    v6->_pendingConversation = *((_BYTE *)v4 + 18);
    v6->_screening = *((_BYTE *)v4 + 24);
    v6->_hostedOnCurrentDevice = *((_BYTE *)v4 + 25);
    v6->_endpointOnCurrentDevice = *((_BYTE *)v4 + 26);
    objc_storeStrong((id *)&v6->_highlightIdentifiers, *((id *)v4 + 22));
    objc_storeStrong((id *)&v6->_reportingHierarchyToken, *((id *)v4 + 37));
    objc_storeStrong((id *)&v6->_reportingHierarchySubToken, *((id *)v4 + 38));
    v6->_spatialPersonaEnabled = *((_BYTE *)v4 + 13);
    v6->_cameraMixedWithScreen = *((_BYTE *)v4 + 14);
    objc_storeStrong((id *)&v6->_handoffContext, *((id *)v4 + 46));
    objc_storeStrong((id *)&v6->_screenSharingRequests, *((id *)v4 + 43));
    v6->_screenSharingType = *((_QWORD *)v4 + 44);
  }

  return v6;
}

- (id)displayName
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C972A0], "tu_contactStoreConfigurationForConversation:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97298]), "initWithConfiguration:", v3);
  -[TUConversation displayNameUsingContactsDataSource:](self, "displayNameUsingContactsDataSource:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)displayNameUsingContactsDataSource:(id)a3
{
  id v4;
  void *v5;
  TUContactsDataProvider *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  TUContactsDataProviderFetchRequest *v20;
  void *v21;
  TUContactsDataProviderFetchRequest *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  int v33;
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
  unint64_t v44;
  uint64_t v45;
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
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  TUContactsDataProvider *v71;
  id obj;
  void *v73;
  void *v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  _BYTE v83[128];
  _BYTE v84[128];
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[TUConversation messagesGroupName](self, "messagesGroupName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[TUContactsDataProvider initWithContactsDataSource:]([TUContactsDataProvider alloc], "initWithContactsDataSource:", v4);
  if (!objc_msgSend(v5, "length"))
  {
    -[TUConversation link](self, "link");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[TUConversation link](self, "link");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "displayName");
      v9 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v9;
    }
  }
  if (!objc_msgSend(v5, "length"))
  {
    v69 = v5;
    v70 = v4;
    v71 = v6;
    -[TUConversation mergedRemoteMembers](self, "mergedRemoteMembers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = 0u;
    v80 = 0u;
    v81 = 0u;
    v82 = 0u;
    v13 = v10;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v79, v84, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v80;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v80 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * i);
          if (objc_msgSend(v18, "needsContactLookupForDisplayName"))
          {
            objc_msgSend(v18, "handle");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "addObject:", v19);

            v20 = [TUContactsDataProviderFetchRequest alloc];
            objc_msgSend(v18, "handle");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = -[TUContactsDataProviderFetchRequest initWithHandle:](v20, "initWithHandle:", v21);
            objc_msgSend(v12, "addObject:", v22);

          }
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v79, v84, 16);
      }
      while (v15);
    }

    -[TUContactsDataProvider executeBatchFetchRequests:](v71, "executeBatchFetchRequests:", v12);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v13, "count"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = 0u;
    v76 = 0u;
    v77 = 0u;
    v78 = 0u;
    obj = v13;
    v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v83, 16);
    v74 = v23;
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v76;
      do
      {
        for (j = 0; j != v25; ++j)
        {
          if (*(_QWORD *)v76 != v26)
            objc_enumerationMutation(obj);
          v28 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * j);
          objc_msgSend(v28, "handle");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "siriDisplayName");
          v30 = objc_claimAutoreleasedReturnValue();
          if (v30)
          {
            v31 = (void *)v30;
            objc_msgSend(v28, "handle");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = objc_msgSend(v32, "shouldHideContact");

            if (v33)
            {
              objc_msgSend(v28, "handle");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "siriDisplayName");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = v74;
              objc_msgSend(v74, "addObject:", v35);

              continue;
            }
          }
          else
          {

          }
          objc_msgSend(v28, "handle");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v73, "objectForKeyedSubscript:", v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();

          if (v37)
          {
            objc_msgSend(v37, "localizedName");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = v74;
            objc_msgSend(v74, "addObject:", v38);
          }
          else
          {
            objc_msgSend(v28, "nickname");
            v39 = (void *)objc_claimAutoreleasedReturnValue();

            v23 = v74;
            if (!v39)
              goto LABEL_28;
            v40 = (void *)MEMORY[0x1E0CB3940];
            TUBundle();
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "localizedStringForKey:value:table:", CFSTR("MAYBE_NICKNAME_%@"), &stru_1E38A53C8, CFSTR("TelephonyUtilities"));
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "nickname");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "stringWithFormat:", v41, v42);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v74, "addObject:", v43);

            v23 = v74;
          }

LABEL_28:
          v44 = objc_msgSend(v23, "count");

          if (v44 > 3)
            goto LABEL_31;
        }
        v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v83, 16);
      }
      while (v25);
    }
LABEL_31:

    v5 = v69;
    if (objc_msgSend(v23, "count") == 1)
    {
      objc_msgSend(v23, "objectAtIndexedSubscript:", 0);
      v45 = objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(v23, "count") == 2)
    {
      v46 = (void *)MEMORY[0x1E0CB3940];
      TUBundle();
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "localizedStringForKey:value:table:", CFSTR("%@_AND_%@"), &stru_1E38A53C8, CFSTR("TelephonyUtilities"));
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectAtIndexedSubscript:", 0);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "objectAtIndexedSubscript:", 1);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "stringWithFormat:", v48, v49, v50);
      v45 = objc_claimAutoreleasedReturnValue();

      v23 = v74;
      v5 = v47;
    }
    else if (objc_msgSend(v23, "count") == 3)
    {
      v51 = (void *)MEMORY[0x1E0CB3940];
      TUBundle();
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "localizedStringForKey:value:table:", CFSTR("%@_%@_AND_%@"), &stru_1E38A53C8, CFSTR("TelephonyUtilities"));
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectAtIndexedSubscript:", 0);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectAtIndexedSubscript:", 1);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "objectAtIndexedSubscript:", 2);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "stringWithFormat:", v53, v54, v55, v56);
      v45 = objc_claimAutoreleasedReturnValue();

      v23 = v74;
      v5 = v52;
    }
    else
    {
      if ((unint64_t)objc_msgSend(v23, "count") < 4)
      {
LABEL_40:

        v4 = v70;
        v6 = v71;
        goto LABEL_41;
      }
      v57 = objc_msgSend(obj, "count") - 3;
      v67 = (void *)MEMORY[0x1E0CB3940];
      TUBundle();
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "localizedStringForKey:value:table:", CFSTR("%@_%@_%@_AND_%@_OTHER"), &stru_1E38A53C8, CFSTR("TelephonyUtilities"));
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectAtIndexedSubscript:", 0);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectAtIndexedSubscript:", 1);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectAtIndexedSubscript:", 2);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "numberFormatter");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v57);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "stringFromNumber:", v62);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "stringWithFormat:", v66, v58, v59, v60, v63);
      v45 = objc_claimAutoreleasedReturnValue();

      v23 = v74;
      v5 = v68;
    }

    v5 = (void *)v45;
    goto LABEL_40;
  }
LABEL_41:
  v64 = (void *)objc_msgSend(v5, "copy");

  return v64;
}

- (id)messagesGroupPhotoData
{
  uint64_t v3;
  void *v4;
  uint64_t IMSPIGetGroupPhotosForChatsWithGroupIDsSymbolLoc;
  void *v6;
  void *v7;
  id v8;
  void (*v9)(id);
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[TUConversation messagesGroupUUID](self, "messagesGroupUUID");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    return 0;
  v4 = (void *)v3;
  if (!IMCoreLibraryCore_frameworkLibrary)
  {
    v15 = xmmword_1E38A2288;
    v16 = 0;
    IMCoreLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (IMCoreLibraryCore_frameworkLibrary)
  {
    IMSPIGetGroupPhotosForChatsWithGroupIDsSymbolLoc = getIMSPIGetGroupPhotosForChatsWithGroupIDsSymbolLoc();

    if (IMSPIGetGroupPhotosForChatsWithGroupIDsSymbolLoc)
    {
      -[TUConversation messagesGroupUUID](self, "messagesGroupUUID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "UUIDString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      v9 = (void (*)(id))getIMSPIGetGroupPhotosForChatsWithGroupIDsSymbolLoc();
      if (!v9)
        -[TUConversation messagesGroupPhotoData].cold.1();
      v9(v8);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      -[TUConversation messagesGroupUUID](self, "messagesGroupUUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "UUIDString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_10;
    }
    return 0;
  }
  v12 = 0;
LABEL_10:

  return v12;
}

- (TUFeatureFlags)featureFlags
{
  TUFeatureFlags *featureFlags;
  TUFeatureFlags *v4;
  TUFeatureFlags *v5;

  featureFlags = self->_featureFlags;
  if (!featureFlags)
  {
    v4 = objc_alloc_init(TUFeatureFlags);
    v5 = self->_featureFlags;
    self->_featureFlags = v4;

    featureFlags = self->_featureFlags;
  }
  return featureFlags;
}

- (unint64_t)resolvedAudioVideoMode
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[TUConversation activeRemoteParticipants](self, "activeRemoteParticipants", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    v7 = 2;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v12 != v6)
        objc_enumerationMutation(v3);
      v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
      if ((objc_msgSend(v9, "isVideoEnabled") & 1) != 0
        || !-[TUConversation avMode](self, "avMode") && objc_msgSend(v9, "audioVideoMode") == 2)
      {
        break;
      }
      if (v5 == ++v8)
      {
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v5)
          goto LABEL_3;
        goto LABEL_11;
      }
    }
  }
  else
  {
LABEL_11:
    v7 = 1;
  }

  if (-[TUConversation state](self, "state") == 1
    || -[TUConversation state](self, "state") == 2
    || -[TUConversation state](self, "state") == 3)
  {
    if (-[TUConversation isVideoEnabled](self, "isVideoEnabled"))
      return 2;
  }
  return v7;
}

- (void)setAvMode:(unint64_t)a3
{
  if (self->_avMode != a3)
  {
    if (-[TUConversation supportsAVMode:](self, "supportsAVMode:"))
    {
      self->_avMode = a3;
      -[TUConversation updatePresentationModeIfNecessary](self, "updatePresentationModeIfNecessary");
    }
  }
}

- (void)setSupportedMediaTypes:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  NSArray *v15;
  NSArray *supportedMediaTypes;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v10);
        -[TUConversation provider](self, "provider", (_QWORD)v17);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "supportsMediaType:", objc_msgSend(v11, "integerValue"));

        if (v13)
          objc_msgSend(v5, "addObject:", v11);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  objc_msgSend(v5, "allObjects");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "count") && !-[NSArray isEqualToArray:](self->_supportedMediaTypes, "isEqualToArray:", v14))
  {
    v15 = (NSArray *)objc_msgSend(v14, "copy");
    supportedMediaTypes = self->_supportedMediaTypes;
    self->_supportedMediaTypes = v15;

  }
}

- (BOOL)eligibleForDowngradeToAVModeNoneFromUI
{
  void *v3;
  char v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  BOOL v17;
  NSObject *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  uint8_t buf[4];
  TUConversation *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  -[TUConversation featureFlags](self, "featureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "avLessSharePlayEnabled");

  if ((v4 & 1) == 0)
  {
    TUDefaultLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      goto LABEL_21;
    *(_WORD *)buf = 0;
    v14 = "AVLess SharePlay isn't enabled. Please enable the AVLess SharePlay FeatureFlag.";
    v15 = v13;
    v16 = 2;
    goto LABEL_20;
  }
  if (-[TUConversation state](self, "state") == 3)
  {
    if (-[TUConversation supportsAVMode:](self, "supportsAVMode:", 0))
    {
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      -[TUConversation activitySessions](self, "activitySessions", 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v21;
LABEL_6:
        v9 = 0;
        while (1)
        {
          if (*(_QWORD *)v21 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v9);
          if (objc_msgSend(v10, "state") == 1 || objc_msgSend(v10, "state") == 4)
          {
            objc_msgSend(v10, "activity");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = objc_msgSend(v11, "isScreenSharingActivity");

            if (!v12)
              break;
          }
          if (v7 == ++v9)
          {
            v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
            if (v7)
              goto LABEL_6;
            goto LABEL_14;
          }
        }
        v13 = v10;

        if (!v13)
          goto LABEL_26;
        v17 = 1;
        goto LABEL_22;
      }
LABEL_14:

LABEL_26:
      TUDefaultLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19A50D000, v19, OS_LOG_TYPE_DEFAULT, "Conversation isn't eligible for downgrade since we couldn't find an activitySession in the joined or handedOff state", buf, 2u);
      }

      v13 = 0;
LABEL_21:
      v17 = 0;
LABEL_22:

      return v17;
    }
    TUDefaultLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      goto LABEL_21;
    *(_DWORD *)buf = 138412290;
    v26 = self;
    v14 = "Conversation %@ isn't eligible for downgrade since it doesn't support AVModeNone";
    v15 = v13;
    v16 = 12;
LABEL_20:
    _os_log_impl(&dword_19A50D000, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
    goto LABEL_21;
  }
  return 0;
}

- (TUConversationPresentationContext)presentationContext
{
  TUConversationPresentationContext *v3;

  v3 = objc_alloc_init(TUConversationPresentationContext);
  -[TUConversationPresentationContext setMode:](v3, "setMode:", self->_presentationMode);
  return v3;
}

- (id)joinedActivitySession
{
  void *v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[TUConversation activitySessions](self, "activitySessions", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v6, "state") == 1)
        {
          v3 = v6;
          goto LABEL_11;
        }
      }
      v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)hasJoinedActivitySession
{
  void *v2;
  BOOL v3;

  -[TUConversation joinedActivitySession](self, "joinedActivitySession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (NSSet)mergedActiveRemoteParticipants
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  _QWORD v24[4];
  id v25;
  id v26;
  TUConversation *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  -[TUConversation localMember](self, "localMember");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[TUConversation localMember](self, "localMember");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[TUConversation localMember](self, "localMember");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUConversation localMember](self, "localMember");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handle");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v8, v10);

    }
  }
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[TUConversation remoteMembers](self, "remoteMembers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v29 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v16, "handle");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKey:", v16, v17);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v13);
  }

  -[TUConversation localParticipantAssociation](self, "localParticipantAssociation");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUConversation activeRemoteParticipants](self, "activeRemoteParticipants");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __48__TUConversation_mergedActiveRemoteParticipants__block_invoke;
  v24[3] = &unk_1E38A2218;
  v25 = v18;
  v26 = v3;
  v27 = self;
  v20 = v3;
  v21 = v18;
  objc_msgSend(v19, "bs_filter:", v24);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v22;
}

BOOL __48__TUConversation_mergedActiveRemoteParticipants__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _BOOL8 v7;
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
  uint64_t v18;
  uint64_t v20;

  v3 = a2;
  v4 = v3;
  if (*(_QWORD *)(a1 + 32) && (v5 = objc_msgSend(v3, "identifier"), v5 == objc_msgSend(*(id *)(a1 + 32), "identifier"))
    || (objc_msgSend(v4, "association"), v6 = (void *)objc_claimAutoreleasedReturnValue(), v6, v6))
  {
    v7 = 0;
  }
  else
  {
    v8 = *(void **)(a1 + 40);
    objc_msgSend(v4, "handle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "association");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11 && objc_msgSend(v11, "type") == 2)
    {
      if ((objc_msgSend(v12, "isPrimary") & 1) != 0)
      {
        v13 = *(void **)(a1 + 40);
        objc_msgSend(v12, "handle");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKey:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v15, "association");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (v16 && objc_msgSend(v16, "type") == 2)
        {
          v18 = objc_msgSend(v17, "identifier");
          v7 = v18 != objc_msgSend(v4, "identifier");
        }
        else
        {
          v7 = 1;
        }

      }
      else
      {
        v20 = objc_msgSend(*(id *)(a1 + 48), "localParticipantIdentifier");
        v7 = v20 != objc_msgSend(v12, "identifier");
      }
    }
    else
    {
      v7 = 1;
    }

  }
  return v7;
}

- (BOOL)isContinuitySession
{
  void *v2;
  BOOL v3;

  -[TUConversation presentationContext](self, "presentationContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "mode") == 2;

  return v3;
}

- (BOOL)isRepresentedByRemoteMembers:(id)a3 andLink:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  int v24;
  void *v25;
  char v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "count");
  -[TUConversation remoteMembers](self, "remoteMembers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v8 == v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v12 = v6;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v37 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * i), "handle");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v17);

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      }
      while (v14);
    }

    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    -[TUConversation remoteMembers](self, "remoteMembers", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v33;
      while (2)
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v33 != v21)
            objc_enumerationMutation(v18);
          objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * j), "handle");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v11, "containsObject:", v23);

          if (!v24)
          {
            v26 = 0;
            goto LABEL_22;
          }
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
        if (v20)
          continue;
        break;
      }
    }

    -[TUConversation link](self, "link");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 || !v25)
    {
      -[TUConversation link](self, "link");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7 || v28)
      {
        -[TUConversation link](self, "link");
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        v26 = 1;
        if (v7 && v29)
        {
          -[TUConversation link](self, "link");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "pseudonym");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "pseudonym");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v30, "isEqualToString:", v31);

LABEL_22:
        }
      }
      else
      {
        v26 = 1;
      }
    }
    else
    {
      v26 = 0;
    }

  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (BOOL)isVideo
{
  return -[TUConversation avMode](self, "avMode") == 2;
}

- (void)setVideo:(BOOL)a3
{
  uint64_t v3;

  if (a3)
    v3 = 2;
  else
    v3 = 1;
  -[TUConversation setAvMode:](self, "setAvMode:", v3);
}

+ (id)numberFormatter
{
  if (numberFormatter_onceToken != -1)
    dispatch_once(&numberFormatter_onceToken, &__block_literal_global_16);
  return (id)numberFormatter_numberFormatter;
}

uint64_t __33__TUConversation_numberFormatter__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  v1 = (void *)numberFormatter_numberFormatter;
  numberFormatter_numberFormatter = (uint64_t)v0;

  return objc_msgSend((id)numberFormatter_numberFormatter, "setNumberStyle:", 1);
}

- (id)remoteParticipantForLightweightParticipantHandle:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  NSObject *v21;
  id v22;
  void *v23;
  NSObject *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint8_t v35[128];
  uint8_t buf[4];
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v37 = v4;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "Asked to find matching primary remote participant for lightweight handle: %@", buf, 0xCu);
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[TUConversation lightweightMembers](self, "lightweightMembers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v31;
LABEL_5:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v31 != v8)
        objc_enumerationMutation(v6);
      v10 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v9);
      objc_msgSend(v10, "handle");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEquivalentToHandle:", v4);

      if ((v12 & 1) != 0)
        break;
      if (v7 == (id)++v9)
      {
        v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
        if (v7)
          goto LABEL_5;
        goto LABEL_21;
      }
    }
    v7 = v10;

    if (!v7)
      goto LABEL_22;
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    -[TUConversation activeRemoteParticipants](self, "activeRemoteParticipants", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v27;
LABEL_15:
      v16 = 0;
      while (1)
      {
        if (*(_QWORD *)v27 != v15)
          objc_enumerationMutation(v6);
        v17 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v16);
        objc_msgSend(v17, "handle");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "lightweightPrimary");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v18, "isEquivalentToHandle:", v19);

        if (v20)
          break;
        if (v14 == ++v16)
        {
          v14 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
          if (v14)
            goto LABEL_15;
          goto LABEL_21;
        }
      }
      TUDefaultLog();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v37 = v17;
        _os_log_impl(&dword_19A50D000, v25, OS_LOG_TYPE_DEFAULT, "Found remote participant for lightweight participant: %@", buf, 0xCu);
      }

      v22 = v17;
      if (v22)
        goto LABEL_25;
      goto LABEL_22;
    }
  }
LABEL_21:

LABEL_22:
  TUDefaultLog();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v37 = v7;
    _os_log_impl(&dword_19A50D000, v21, OS_LOG_TYPE_DEFAULT, "[WARN] Did not find remote participant for lightweight member: %@", buf, 0xCu);
  }

  v22 = 0;
LABEL_25:
  v23 = (void *)objc_msgSend(v22, "copy");

  return v23;
}

- (BOOL)shouldShowInvitationOfStyles:(int64_t)a3 forHandle:(id)a4 defaultValue:(BOOL)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  if (v8)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[TUConversation invitationPreferences](self, "invitationPreferences", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          v15 = objc_msgSend(v14, "handleType");
          if (v15 == objc_msgSend(v8, "type") && objc_msgSend(v14, "notificationStyles"))
          {
            v16 = v14;

            if (v16)
              a5 = (objc_msgSend(v16, "notificationStyles") & 1) == 0
                && (a3 & ~objc_msgSend(v16, "notificationStyles")) == 0;
            goto LABEL_16;
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v11)
          continue;
        break;
      }
    }

    v16 = 0;
LABEL_16:

  }
  return a5;
}

- (BOOL)shouldShowInvitationUserNotificationForHandle:(id)a3
{
  return -[TUConversation shouldShowInvitationOfStyles:forHandle:defaultValue:](self, "shouldShowInvitationOfStyles:forHandle:defaultValue:", 2, a3, 1);
}

- (BOOL)shouldShowInvitationRingingUIForHandle:(id)a3
{
  return -[TUConversation shouldShowInvitationOfStyles:forHandle:defaultValue:](self, "shouldShowInvitationOfStyles:forHandle:defaultValue:", 4, a3, 1);
}

- (BOOL)shouldShowInvitationRingingUIForAnyHandleType
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[TUConversation invitationPreferences](self, "invitationPreferences", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "notificationStyles") & 4) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)supportsAVMode:(unint64_t)a3
{
  return a3 <= 2 && -[TUConversation supportsMediaType:](self, "supportsMediaType:", 3 - a3);
}

- (BOOL)supportsMediaType:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  char v8;

  -[TUConversation supportedMediaTypes](self, "supportedMediaTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "containsObject:", v6))
  {
    -[TUConversation provider](self, "provider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "supportsMediaType:", a3);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)updateParticipantMediaPrioritiesWithConversation:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  TUConversation *v19;
  id obj;
  id v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v21 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v19 = self;
  -[TUConversation activeRemoteParticipants](self, "activeRemoteParticipants");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v28 != v6)
          objc_enumerationMutation(obj);
        v8 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "mutableCopy");
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        objc_msgSend(v21, "activeRemoteParticipants");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v24;
          while (2)
          {
            for (j = 0; j != v11; ++j)
            {
              if (*(_QWORD *)v24 != v12)
                objc_enumerationMutation(v9);
              v14 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * j);
              v15 = objc_msgSend(v8, "identifier");
              if (v15 == objc_msgSend(v14, "identifier"))
              {
                objc_msgSend(v8, "setAudioPriority:", objc_msgSend(v14, "audioPriority"));
                objc_msgSend(v8, "setVideoPriority:", objc_msgSend(v14, "videoPriority"));
                goto LABEL_16;
              }
            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
            if (v11)
              continue;
            break;
          }
        }
LABEL_16:

        v16 = (void *)objc_msgSend(v8, "copy");
        objc_msgSend(v22, "addObject:", v16);

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v5);
  }

  TUDefaultLog();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    -[TUConversation updateParticipantMediaPrioritiesWithConversation:].cold.1((uint64_t)v22, v17);

  v18 = (void *)objc_msgSend(v22, "copy");
  -[TUConversation setActiveRemoteParticipants:](v19, "setActiveRemoteParticipants:", v18);

}

- (void)updatePresentationModeIfNecessary
{
  unint64_t v2;

  if (self->_avMode)
  {
    v2 = 0;
LABEL_3:
    self->_presentationMode = v2;
    return;
  }
  if (!self->_presentationMode)
  {
    v2 = 1;
    goto LABEL_3;
  }
}

- (id)localScreenSharingRequest
{
  void *v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[TUConversation screenSharingRequests](self, "screenSharingRequests", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v6, "isLocallyOriginated")
          && (objc_msgSend(v6, "type") == 2 || objc_msgSend(v6, "type") == 1))
        {
          v3 = v6;
          goto LABEL_13;
        }
      }
      v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_13:

  return v3;
}

- (id)bundleIdentifier
{
  void *v2;
  void *v3;

  -[TUConversation provider](self, "provider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)sanitizedHandles
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99E20];
  -[TUConversation activeRemoteParticipants](self, "activeRemoteParticipants");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[TUConversation activeRemoteParticipants](self, "activeRemoteParticipants");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v27;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v27 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v10), "handle");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "value");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v12, "length"))
          objc_msgSend(v5, "addObject:", v12);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v8);
  }

  if (!objc_msgSend(v5, "count"))
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    -[TUConversation remoteMembers](self, "remoteMembers", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v23;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v23 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v17), "handle");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "value");
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v19, "length"))
            objc_msgSend(v5, "addObject:", v19);

          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
      }
      while (v15);
    }

  }
  v20 = (void *)objc_msgSend(v5, "copy");

  return v20;
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
  -[TUConversation sanitizedHandles](self, "sanitizedHandles");
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

- (NSSet)mergedRemoteMembers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_opt_class();
  -[TUConversation remoteMembers](self, "remoteMembers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUConversation localMember](self, "localMember");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mergedRemoteMembers:withLocalMember:removingLocallyAssociatedMember:", v4, v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v6;
}

+ (id)mergedRemoteMemberHandlesFromRemoteMembers:(id)a3 withLocalMember:(id)a4 removingLocallyAssociatedMember:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  id v23;
  void *v24;
  void *v26;
  id obj;
  id v28;
  _QWORD v29[4];
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v5 = a5;
  v36 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v28 = a4;
  v26 = (void *)objc_opt_new();
  if (v5)
  {
    objc_msgSend(v28, "association");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      objc_msgSend(v26, "addObject:", v9);

  }
  v10 = (void *)objc_opt_new();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = v7;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v32 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(v15, "handle", v26);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v16);

        objc_msgSend(v15, "association");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          objc_msgSend(v28, "association");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "handle");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "handle");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v19, "isEquivalentToHandle:", v20);

          if ((v21 & 1) == 0 && objc_msgSend(v17, "type") == 2 && (objc_msgSend(v17, "isPrimary") & 1) == 0)
          {
            objc_msgSend(v15, "handle");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "addObject:", v22);

          }
        }

      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v12);
  }

  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __109__TUConversation_mergedRemoteMemberHandlesFromRemoteMembers_withLocalMember_removingLocallyAssociatedMember___block_invoke;
  v29[3] = &unk_1E38A2240;
  v30 = v26;
  v23 = v26;
  objc_msgSend(v10, "bs_filter:", v29);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

uint64_t __109__TUConversation_mergedRemoteMemberHandlesFromRemoteMembers_withLocalMember_removingLocallyAssociatedMember___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2) ^ 1;
}

+ (id)mergedRemoteMembers:(id)a3 withLocalMember:(id)a4 removingLocallyAssociatedMember:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;

  v5 = a5;
  v7 = a4;
  v8 = a3;
  objc_msgSend((id)objc_opt_class(), "mergedRemoteMemberHandlesFromRemoteMembers:withLocalMember:removingLocallyAssociatedMember:", v8, v7, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __86__TUConversation_mergedRemoteMembers_withLocalMember_removingLocallyAssociatedMember___block_invoke;
  v13[3] = &unk_1E38A2268;
  v14 = v9;
  v10 = v9;
  objc_msgSend(v8, "bs_filter:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

uint64_t __86__TUConversation_mergedRemoteMembers_withLocalMember_removingLocallyAssociatedMember___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "handle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUConversation)initWithCoder:(id)a3
{
  id v4;
  TUConversation *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSSet *activeRemoteParticipants;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSSet *activitySessions;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  TUConversationActivitySession *stagedActivitySession;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  NSString *avcSessionIdentifier;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  NSUUID *groupUUID;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  TUHandle *initiator;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  NSSet *kickedMembers;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  uint64_t v51;
  NSSet *rejectedMembers;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  uint64_t v57;
  NSSet *otherInvitedHandles;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  TUConversationLink *link;
  void *v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  TUConversationMember *localMember;
  void *v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  TUConversationParticipantAssociation *localParticipantAssociation;
  void *v76;
  uint64_t v77;
  void *v78;
  uint64_t v79;
  TUConversationHandoffEligibility *handoffEligibility;
  void *v81;
  uint64_t v82;
  void *v83;
  uint64_t v84;
  NSString *messagesGroupName;
  uint64_t v86;
  void *v87;
  uint64_t v88;
  NSUUID *messagesGroupUUID;
  void *v90;
  void *v91;
  uint64_t v92;
  void *v93;
  void *v94;
  uint64_t v95;
  NSSet *participantHandles;
  void *v97;
  uint64_t v98;
  void *v99;
  void *v100;
  uint64_t v101;
  NSSet *pendingMembers;
  uint64_t v103;
  void *v104;
  uint64_t v105;
  TUConversationProvider *provider;
  void *v107;
  uint64_t v108;
  void *v109;
  void *v110;
  uint64_t v111;
  NSSet *remoteMembers;
  uint64_t v113;
  void *v114;
  uint64_t v115;
  TUConversationReport *report;
  void *v117;
  void *v118;
  uint64_t v119;
  void *v120;
  uint64_t v121;
  NSUUID *UUID;
  void *v123;
  void *v124;
  void *v125;
  uint64_t v126;
  void *v127;
  void *v128;
  uint64_t v129;
  NSSet *virtualParticipants;
  void *v131;
  uint64_t v132;
  void *v133;
  void *v134;
  uint64_t v135;
  NSSet *invitationPreferences;
  void *v137;
  uint64_t v138;
  void *v139;
  void *v140;
  uint64_t v141;
  NSSet *lightweightMembers;
  void *v143;
  uint64_t v144;
  void *v145;
  void *v146;
  uint64_t v147;
  NSSet *activeLightweightParticipants;
  void *v149;
  void *v150;
  uint64_t v151;
  void *v152;
  uint64_t v153;
  NSArray *supportedMediaTypes;
  void *v155;
  uint64_t v156;
  void *v157;
  void *v158;
  uint64_t v159;
  NSSet *systemActivitySessions;
  void *v161;
  uint64_t v162;
  void *v163;
  uint64_t v164;
  NSUUID *selectiveSharingSessionUUID;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  uint64_t v172;
  void *v173;
  void *v174;
  uint64_t v175;
  NSSet *highlightIdentifiers;
  void *v177;
  uint64_t v178;
  void *v179;
  void *v180;
  uint64_t v181;
  NSSet *screenSharingRequests;
  void *v183;
  objc_super v185;

  v4 = a3;
  v185.receiver = self;
  v185.super_class = (Class)TUConversation;
  v5 = -[TUConversation init](&v185, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_activeRemoteParticipants);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    activeRemoteParticipants = v5->_activeRemoteParticipants;
    v5->_activeRemoteParticipants = (NSSet *)v10;

    v12 = (void *)MEMORY[0x1E0C99E60];
    v13 = objc_opt_class();
    objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_activitySessions);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, v15);
    v16 = objc_claimAutoreleasedReturnValue();
    activitySessions = v5->_activitySessions;
    v5->_activitySessions = (NSSet *)v16;

    NSStringFromSelector(sel_avMode);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_avMode = objc_msgSend(v4, "decodeIntegerForKey:", v18);

    NSStringFromSelector(sel_presentationMode);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_presentationMode = objc_msgSend(v4, "decodeIntegerForKey:", v19);

    v20 = objc_opt_class();
    NSStringFromSelector(sel_stagedActivitySession);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v20, v21);
    v22 = objc_claimAutoreleasedReturnValue();
    stagedActivitySession = v5->_stagedActivitySession;
    v5->_stagedActivitySession = (TUConversationActivitySession *)v22;

    NSStringFromSelector(sel_isAudioEnabled);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_audioEnabled = objc_msgSend(v4, "decodeBoolForKey:", v24);

    v25 = objc_opt_class();
    NSStringFromSelector(sel_avcSessionIdentifier);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v25, v26);
    v27 = objc_claimAutoreleasedReturnValue();
    avcSessionIdentifier = v5->_avcSessionIdentifier;
    v5->_avcSessionIdentifier = (NSString *)v27;

    NSStringFromSelector(sel_avcSessionToken);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_avcSessionToken = objc_msgSend(v4, "decodeIntegerForKey:", v29);

    NSStringFromSelector(sel_localCaptionToken);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_localCaptionToken = objc_msgSend(v4, "decodeIntegerForKey:", v30);

    NSStringFromSelector(sel_isBackedByGroupSession);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_backedByGroupSession = objc_msgSend(v4, "decodeBoolForKey:", v31);

    v32 = objc_opt_class();
    NSStringFromSelector(sel_groupUUID);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v32, v33);
    v34 = objc_claimAutoreleasedReturnValue();
    groupUUID = v5->_groupUUID;
    v5->_groupUUID = (NSUUID *)v34;

    NSStringFromSelector(sel_hasJoined);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_hasJoined = objc_msgSend(v4, "decodeBoolForKey:", v36);

    v37 = objc_opt_class();
    NSStringFromSelector(sel_initiator);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v37, v38);
    v39 = objc_claimAutoreleasedReturnValue();
    initiator = v5->_initiator;
    v5->_initiator = (TUHandle *)v39;

    v41 = (void *)MEMORY[0x1E0C99E60];
    v42 = objc_opt_class();
    objc_msgSend(v41, "setWithObjects:", v42, objc_opt_class(), 0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_kickedMembers);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v43, v44);
    v45 = objc_claimAutoreleasedReturnValue();
    kickedMembers = v5->_kickedMembers;
    v5->_kickedMembers = (NSSet *)v45;

    v47 = (void *)MEMORY[0x1E0C99E60];
    v48 = objc_opt_class();
    objc_msgSend(v47, "setWithObjects:", v48, objc_opt_class(), 0);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_rejectedMembers);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v49, v50);
    v51 = objc_claimAutoreleasedReturnValue();
    rejectedMembers = v5->_rejectedMembers;
    v5->_rejectedMembers = (NSSet *)v51;

    v53 = (void *)MEMORY[0x1E0C99E60];
    v54 = objc_opt_class();
    objc_msgSend(v53, "setWithObjects:", v54, objc_opt_class(), 0);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_otherInvitedHandles);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v55, v56);
    v57 = objc_claimAutoreleasedReturnValue();
    otherInvitedHandles = v5->_otherInvitedHandles;
    v5->_otherInvitedHandles = (NSSet *)v57;

    NSStringFromSelector(sel_hasReceivedLetMeInRequest);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_hasReceivedLetMeInRequest = objc_msgSend(v4, "decodeBoolForKey:", v59);

    NSStringFromSelector(sel_letMeInRequestState);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_letMeInRequestState = objc_msgSend(v4, "decodeIntegerForKey:", v60);

    NSStringFromSelector(sel_ignoreLMIRequests);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_ignoreLMIRequests = objc_msgSend(v4, "decodeBoolForKey:", v61);

    v62 = objc_opt_class();
    NSStringFromSelector(sel_link);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v62, v63);
    v64 = objc_claimAutoreleasedReturnValue();
    link = v5->_link;
    v5->_link = (TUConversationLink *)v64;

    NSStringFromSelector(sel_isLocallyCreated);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_locallyCreated = objc_msgSend(v4, "decodeBoolForKey:", v66);

    v67 = objc_opt_class();
    NSStringFromSelector(sel_localMember);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v67, v68);
    v69 = objc_claimAutoreleasedReturnValue();
    localMember = v5->_localMember;
    v5->_localMember = (TUConversationMember *)v69;

    NSStringFromSelector(sel_localParticipantIdentifier);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_localParticipantIdentifier = objc_msgSend(v4, "decodeInt64ForKey:", v71);

    v72 = objc_opt_class();
    NSStringFromSelector(sel_localParticipantAssociation);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v72, v73);
    v74 = objc_claimAutoreleasedReturnValue();
    localParticipantAssociation = v5->_localParticipantAssociation;
    v5->_localParticipantAssociation = (TUConversationParticipantAssociation *)v74;

    NSStringFromSelector(sel_isOneToOneHandoffOngoing);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_oneToOneHandoffOngoing = objc_msgSend(v4, "decodeBoolForKey:", v76);

    v77 = objc_opt_class();
    NSStringFromSelector(sel_handoffEligibility);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v77, v78);
    v79 = objc_claimAutoreleasedReturnValue();
    handoffEligibility = v5->_handoffEligibility;
    v5->_handoffEligibility = (TUConversationHandoffEligibility *)v79;

    NSStringFromSelector(sel_maxVideoDecodesAllowed);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_maxVideoDecodesAllowed = objc_msgSend(v4, "decodeIntegerForKey:", v81);

    v82 = objc_opt_class();
    NSStringFromSelector(sel_messagesGroupName);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v82, v83);
    v84 = objc_claimAutoreleasedReturnValue();
    messagesGroupName = v5->_messagesGroupName;
    v5->_messagesGroupName = (NSString *)v84;

    v86 = objc_opt_class();
    NSStringFromSelector(sel_messagesGroupUUID);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v86, v87);
    v88 = objc_claimAutoreleasedReturnValue();
    messagesGroupUUID = v5->_messagesGroupUUID;
    v5->_messagesGroupUUID = (NSUUID *)v88;

    NSStringFromSelector(sel_isOneToOneModeEnabled);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_oneToOneModeEnabled = objc_msgSend(v4, "decodeBoolForKey:", v90);

    v91 = (void *)MEMORY[0x1E0C99E60];
    v92 = objc_opt_class();
    objc_msgSend(v91, "setWithObjects:", v92, objc_opt_class(), 0);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_participantHandles);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v93, v94);
    v95 = objc_claimAutoreleasedReturnValue();
    participantHandles = v5->_participantHandles;
    v5->_participantHandles = (NSSet *)v95;

    v97 = (void *)MEMORY[0x1E0C99E60];
    v98 = objc_opt_class();
    objc_msgSend(v97, "setWithObjects:", v98, objc_opt_class(), 0);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_pendingMembers);
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v99, v100);
    v101 = objc_claimAutoreleasedReturnValue();
    pendingMembers = v5->_pendingMembers;
    v5->_pendingMembers = (NSSet *)v101;

    v103 = objc_opt_class();
    NSStringFromSelector(sel_provider);
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v103, v104);
    v105 = objc_claimAutoreleasedReturnValue();
    provider = v5->_provider;
    v5->_provider = (TUConversationProvider *)v105;

    v107 = (void *)MEMORY[0x1E0C99E60];
    v108 = objc_opt_class();
    objc_msgSend(v107, "setWithObjects:", v108, objc_opt_class(), 0);
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_remoteMembers);
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v109, v110);
    v111 = objc_claimAutoreleasedReturnValue();
    remoteMembers = v5->_remoteMembers;
    v5->_remoteMembers = (NSSet *)v111;

    v113 = objc_opt_class();
    NSStringFromSelector(sel_report);
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v113, v114);
    v115 = objc_claimAutoreleasedReturnValue();
    report = v5->_report;
    v5->_report = (TUConversationReport *)v115;

    NSStringFromSelector(sel_isScreenEnabled);
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_screenEnabled = objc_msgSend(v4, "decodeBoolForKey:", v117);

    NSStringFromSelector(sel_state);
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_state = objc_msgSend(v4, "decodeIntegerForKey:", v118);

    v119 = objc_opt_class();
    NSStringFromSelector(sel_UUID);
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v119, v120);
    v121 = objc_claimAutoreleasedReturnValue();
    UUID = v5->_UUID;
    v5->_UUID = (NSUUID *)v121;

    NSStringFromSelector(sel_isVideoEnabled);
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_videoEnabled = objc_msgSend(v4, "decodeBoolForKey:", v123);

    NSStringFromSelector(sel_isVideoPaused);
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_videoPaused = objc_msgSend(v4, "decodeBoolForKey:", v124);

    v125 = (void *)MEMORY[0x1E0C99E60];
    v126 = objc_opt_class();
    objc_msgSend(v125, "setWithObjects:", v126, objc_opt_class(), 0);
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_virtualParticipants);
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v127, v128);
    v129 = objc_claimAutoreleasedReturnValue();
    virtualParticipants = v5->_virtualParticipants;
    v5->_virtualParticipants = (NSSet *)v129;

    v131 = (void *)MEMORY[0x1E0C99E60];
    v132 = objc_opt_class();
    objc_msgSend(v131, "setWithObjects:", v132, objc_opt_class(), 0);
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_invitationPreferences);
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v133, v134);
    v135 = objc_claimAutoreleasedReturnValue();
    invitationPreferences = v5->_invitationPreferences;
    v5->_invitationPreferences = (NSSet *)v135;

    v137 = (void *)MEMORY[0x1E0C99E60];
    v138 = objc_opt_class();
    objc_msgSend(v137, "setWithObjects:", v138, objc_opt_class(), 0);
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_lightweightMembers);
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v139, v140);
    v141 = objc_claimAutoreleasedReturnValue();
    lightweightMembers = v5->_lightweightMembers;
    v5->_lightweightMembers = (NSSet *)v141;

    v143 = (void *)MEMORY[0x1E0C99E60];
    v144 = objc_opt_class();
    objc_msgSend(v143, "setWithObjects:", v144, objc_opt_class(), 0);
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_activeLightweightParticipants);
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v145, v146);
    v147 = objc_claimAutoreleasedReturnValue();
    activeLightweightParticipants = v5->_activeLightweightParticipants;
    v5->_activeLightweightParticipants = (NSSet *)v147;

    NSStringFromSelector(sel_isFromStorage);
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_fromStorage = objc_msgSend(v4, "decodeBoolForKey:", v149);

    NSStringFromSelector(sel_isAnyOtherAccountDeviceActive);
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isAnyOtherAccountDeviceActive = objc_msgSend(v4, "decodeBoolForKey:", v150);

    v151 = objc_opt_class();
    NSStringFromSelector(sel_supportedMediaTypes);
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", v151, v152);
    v153 = objc_claimAutoreleasedReturnValue();
    supportedMediaTypes = v5->_supportedMediaTypes;
    v5->_supportedMediaTypes = (NSArray *)v153;

    v155 = (void *)MEMORY[0x1E0C99E60];
    v156 = objc_opt_class();
    objc_msgSend(v155, "setWithObjects:", v156, objc_opt_class(), 0);
    v157 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_systemActivitySessions);
    v158 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v157, v158);
    v159 = objc_claimAutoreleasedReturnValue();
    systemActivitySessions = v5->_systemActivitySessions;
    v5->_systemActivitySessions = (NSSet *)v159;

    NSStringFromSelector(sel_isPendingConversation);
    v161 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_pendingConversation = objc_msgSend(v4, "decodeBoolForKey:", v161);

    v162 = objc_opt_class();
    NSStringFromSelector(sel_selectiveSharingSessionUUID);
    v163 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v162, v163);
    v164 = objc_claimAutoreleasedReturnValue();
    selectiveSharingSessionUUID = v5->_selectiveSharingSessionUUID;
    v5->_selectiveSharingSessionUUID = (NSUUID *)v164;

    NSStringFromSelector(sel_isScreening);
    v166 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_screening = objc_msgSend(v4, "decodeBoolForKey:", v166);

    NSStringFromSelector(sel_endpointOnCurrentDevice);
    v167 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_endpointOnCurrentDevice = objc_msgSend(v4, "decodeBoolForKey:", v167);

    NSStringFromSelector(sel_hostedOnCurrentDevice);
    v168 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_hostedOnCurrentDevice = objc_msgSend(v4, "decodeBoolForKey:", v168);

    NSStringFromSelector(sel_isSpatialPersonaEnabled);
    v169 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_spatialPersonaEnabled = objc_msgSend(v4, "decodeBoolForKey:", v169);

    NSStringFromSelector(sel_isCameraMixedWithScreen);
    v170 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_cameraMixedWithScreen = objc_msgSend(v4, "decodeBoolForKey:", v170);

    v171 = (void *)MEMORY[0x1E0C99E60];
    v172 = objc_opt_class();
    objc_msgSend(v171, "setWithObjects:", v172, objc_opt_class(), 0);
    v173 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_highlightIdentifiers);
    v174 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v173, v174);
    v175 = objc_claimAutoreleasedReturnValue();
    highlightIdentifiers = v5->_highlightIdentifiers;
    v5->_highlightIdentifiers = (NSSet *)v175;

    v177 = (void *)MEMORY[0x1E0C99E60];
    v178 = objc_opt_class();
    objc_msgSend(v177, "setWithObjects:", v178, objc_opt_class(), 0);
    v179 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_screenSharingRequests);
    v180 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v179, v180);
    v181 = objc_claimAutoreleasedReturnValue();
    screenSharingRequests = v5->_screenSharingRequests;
    v5->_screenSharingRequests = (NSSet *)v181;

    NSStringFromSelector(sel_screenSharingType);
    v183 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_screenSharingType = objc_msgSend(v4, "decodeIntegerForKey:", v183);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t avMode;
  void *v10;
  unint64_t presentationMode;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int64_t v17;
  void *v18;
  int64_t v19;
  void *v20;
  _BOOL8 v21;
  void *v22;
  _BOOL8 v23;
  void *v24;
  _BOOL8 v25;
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
  _BOOL8 v37;
  void *v38;
  int64_t v39;
  void *v40;
  _BOOL8 v41;
  void *v42;
  void *v43;
  void *v44;
  _BOOL8 v45;
  void *v46;
  void *v47;
  void *v48;
  unint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  _BOOL8 v53;
  void *v54;
  void *v55;
  void *v56;
  int64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  _BOOL8 v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  _BOOL8 v75;
  void *v76;
  int64_t v77;
  void *v78;
  void *v79;
  void *v80;
  _BOOL8 v81;
  void *v82;
  _BOOL8 v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  _BOOL8 v93;
  void *v94;
  _BOOL8 v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  _BOOL8 v101;
  void *v102;
  void *v103;
  void *v104;
  _BOOL8 v105;
  void *v106;
  _BOOL8 v107;
  void *v108;
  _BOOL8 v109;
  void *v110;
  _BOOL8 v111;
  void *v112;
  _BOOL8 v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  unint64_t v119;
  id v120;

  v4 = a3;
  -[TUConversation activeRemoteParticipants](self, "activeRemoteParticipants");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_activeRemoteParticipants);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  -[TUConversation activitySessions](self, "activitySessions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_activitySessions);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, v8);

  avMode = self->_avMode;
  NSStringFromSelector(sel_avMode);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", avMode, v10);

  presentationMode = self->_presentationMode;
  NSStringFromSelector(sel_presentationMode);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", presentationMode, v12);

  -[TUConversation stagedActivitySession](self, "stagedActivitySession");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_stagedActivitySession);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, v14);

  -[TUConversation avcSessionIdentifier](self, "avcSessionIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_avcSessionIdentifier);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, v16);

  v17 = -[TUConversation avcSessionToken](self, "avcSessionToken");
  NSStringFromSelector(sel_avcSessionToken);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v17, v18);

  v19 = -[TUConversation localCaptionToken](self, "localCaptionToken");
  NSStringFromSelector(sel_localCaptionToken);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v19, v20);

  v21 = -[TUConversation isAudioEnabled](self, "isAudioEnabled");
  NSStringFromSelector(sel_isAudioEnabled);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v21, v22);

  v23 = -[TUConversation isBackedByGroupSession](self, "isBackedByGroupSession");
  NSStringFromSelector(sel_isBackedByGroupSession);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v23, v24);

  v25 = -[TUConversation hasJoined](self, "hasJoined");
  NSStringFromSelector(sel_hasJoined);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v25, v26);

  -[TUConversation groupUUID](self, "groupUUID");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_groupUUID);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v27, v28);

  -[TUConversation initiator](self, "initiator");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initiator);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v29, v30);

  -[TUConversation kickedMembers](self, "kickedMembers");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_kickedMembers);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v31, v32);

  -[TUConversation rejectedMembers](self, "rejectedMembers");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_rejectedMembers);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v33, v34);

  -[TUConversation otherInvitedHandles](self, "otherInvitedHandles");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_otherInvitedHandles);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v35, v36);

  v37 = -[TUConversation hasReceivedLetMeInRequest](self, "hasReceivedLetMeInRequest");
  NSStringFromSelector(sel_hasReceivedLetMeInRequest);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v37, v38);

  v39 = -[TUConversation letMeInRequestState](self, "letMeInRequestState");
  NSStringFromSelector(sel_letMeInRequestState);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v39, v40);

  v41 = -[TUConversation ignoreLMIRequests](self, "ignoreLMIRequests");
  NSStringFromSelector(sel_ignoreLMIRequests);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v41, v42);

  -[TUConversation link](self, "link");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_link);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v43, v44);

  v45 = -[TUConversation isLocallyCreated](self, "isLocallyCreated");
  NSStringFromSelector(sel_isLocallyCreated);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v45, v46);

  -[TUConversation localMember](self, "localMember");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_localMember);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v47, v48);

  v49 = -[TUConversation localParticipantIdentifier](self, "localParticipantIdentifier");
  NSStringFromSelector(sel_localParticipantIdentifier);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInt64:forKey:", v49, v50);

  -[TUConversation localParticipantAssociation](self, "localParticipantAssociation");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_localParticipantAssociation);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v51, v52);

  v53 = -[TUConversation isOneToOneHandoffOngoing](self, "isOneToOneHandoffOngoing");
  NSStringFromSelector(sel_isOneToOneHandoffOngoing);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v53, v54);

  -[TUConversation handoffEligibility](self, "handoffEligibility");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_handoffEligibility);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v55, v56);

  v57 = -[TUConversation maxVideoDecodesAllowed](self, "maxVideoDecodesAllowed");
  NSStringFromSelector(sel_maxVideoDecodesAllowed);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v57, v58);

  -[TUConversation messagesGroupName](self, "messagesGroupName");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_messagesGroupName);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v59, v60);

  -[TUConversation messagesGroupUUID](self, "messagesGroupUUID");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_messagesGroupUUID);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v61, v62);

  -[TUConversation participantHandles](self, "participantHandles");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_participantHandles);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v63, v64);

  -[TUConversation pendingMembers](self, "pendingMembers");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_pendingMembers);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v65, v66);

  -[TUConversation provider](self, "provider");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_provider);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v67, v68);

  v69 = -[TUConversation isOneToOneModeEnabled](self, "isOneToOneModeEnabled");
  NSStringFromSelector(sel_isOneToOneModeEnabled);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v69, v70);

  -[TUConversation remoteMembers](self, "remoteMembers");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_remoteMembers);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v71, v72);

  -[TUConversation report](self, "report");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_report);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v73, v74);

  v75 = -[TUConversation isScreenEnabled](self, "isScreenEnabled");
  NSStringFromSelector(sel_isScreenEnabled);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v75, v76);

  v77 = -[TUConversation state](self, "state");
  NSStringFromSelector(sel_state);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v77, v78);

  -[TUConversation UUID](self, "UUID");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_UUID);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v79, v80);

  v81 = -[TUConversation isVideoEnabled](self, "isVideoEnabled");
  NSStringFromSelector(sel_isVideoEnabled);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v81, v82);

  v83 = -[TUConversation isVideoPaused](self, "isVideoPaused");
  NSStringFromSelector(sel_isVideoPaused);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v83, v84);

  -[TUConversation virtualParticipants](self, "virtualParticipants");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_virtualParticipants);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v85, v86);

  -[TUConversation invitationPreferences](self, "invitationPreferences");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_invitationPreferences);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v87, v88);

  -[TUConversation lightweightMembers](self, "lightweightMembers");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_lightweightMembers);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v89, v90);

  -[TUConversation activeLightweightParticipants](self, "activeLightweightParticipants");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_activeLightweightParticipants);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v91, v92);

  v93 = -[TUConversation isFromStorage](self, "isFromStorage");
  NSStringFromSelector(sel_isFromStorage);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v93, v94);

  v95 = -[TUConversation isAnyOtherAccountDeviceActive](self, "isAnyOtherAccountDeviceActive");
  NSStringFromSelector(sel_isAnyOtherAccountDeviceActive);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v95, v96);

  -[TUConversation supportedMediaTypes](self, "supportedMediaTypes");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_supportedMediaTypes);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v97, v98);

  -[TUConversation systemActivitySessions](self, "systemActivitySessions");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_systemActivitySessions);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v99, v100);

  v101 = -[TUConversation isPendingConversation](self, "isPendingConversation");
  NSStringFromSelector(sel_isPendingConversation);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v101, v102);

  -[TUConversation selectiveSharingSessionUUID](self, "selectiveSharingSessionUUID");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_selectiveSharingSessionUUID);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v103, v104);

  v105 = -[TUConversation isScreening](self, "isScreening");
  NSStringFromSelector(sel_isScreening);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v105, v106);

  v107 = -[TUConversation hostedOnCurrentDevice](self, "hostedOnCurrentDevice");
  NSStringFromSelector(sel_hostedOnCurrentDevice);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v107, v108);

  v109 = -[TUConversation endpointOnCurrentDevice](self, "endpointOnCurrentDevice");
  NSStringFromSelector(sel_endpointOnCurrentDevice);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v109, v110);

  v111 = -[TUConversation isSpatialPersonaEnabled](self, "isSpatialPersonaEnabled");
  NSStringFromSelector(sel_isSpatialPersonaEnabled);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v111, v112);

  v113 = -[TUConversation isCameraMixedWithScreen](self, "isCameraMixedWithScreen");
  NSStringFromSelector(sel_isCameraMixedWithScreen);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v113, v114);

  -[TUConversation highlightIdentifiers](self, "highlightIdentifiers");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_highlightIdentifiers);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v115, v116);

  -[TUConversation screenSharingRequests](self, "screenSharingRequests");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_screenSharingRequests);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v117, v118);

  v119 = -[TUConversation screenSharingType](self, "screenSharingType");
  NSStringFromSelector(sel_screenSharingType);
  v120 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v119, v120);

}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[TUConversation initWithConversation:](+[TUConversation allocWithZone:](TUConversation, "allocWithZone:", a3), "initWithConversation:", self);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[TUConversation initWithConversation:](+[TUMutableConversation allocWithZone:](TUMutableConversation, "allocWithZone:", a3), "initWithConversation:", self);
}

- (id)description
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
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
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
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUConversation UUID](self, "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" UUID=%@"), v4);

  -[TUConversation groupUUID](self, "groupUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" groupUUID=%@"), v5);

  -[TUConversation link](self, "link");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[TUConversation link](self, "link");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" link=%@"), v7);

  }
  -[TUConversation messagesGroupUUID](self, "messagesGroupUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[TUConversation messagesGroupUUID](self, "messagesGroupUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" messagesGroupUUID=%@"), v9);

  }
  -[TUConversation messagesGroupName](self, "messagesGroupName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[TUConversation messagesGroupName](self, "messagesGroupName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" messagesGroupName=%@"), v11);

  }
  objc_msgSend(v3, "appendFormat:", CFSTR(" state=%ld"), -[TUConversation state](self, "state"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" hasReceivedLetMeInRequest=%ld"), -[TUConversation hasReceivedLetMeInRequest](self, "hasReceivedLetMeInRequest"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" letMeInRequestState=%ld"), -[TUConversation letMeInRequestState](self, "letMeInRequestState"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" ignoreLMIRequests=%d"), -[TUConversation ignoreLMIRequests](self, "ignoreLMIRequests"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" isAudioEnabled=%d"), -[TUConversation isAudioEnabled](self, "isAudioEnabled"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" isVideoEnabled=%d"), -[TUConversation isVideoEnabled](self, "isVideoEnabled"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" isVideoPaused=%d"), -[TUConversation isVideoPaused](self, "isVideoPaused"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" isScreenEnabled=%d"), -[TUConversation isScreenEnabled](self, "isScreenEnabled"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" isLocallyCreated=%d"), -[TUConversation isLocallyCreated](self, "isLocallyCreated"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" hasJoined=%d"), -[TUConversation hasJoined](self, "hasJoined"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" mode=%ld"), -[TUConversation avMode](self, "avMode"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" presentationMode=%ld"), -[TUConversation presentationMode](self, "presentationMode"));
  -[TUConversation remoteMembers](self, "remoteMembers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" remoteMembers=%@"), v12);

  -[TUConversation pendingMembers](self, "pendingMembers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (v14)
  {
    -[TUConversation pendingMembers](self, "pendingMembers");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "allObjects");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "componentsJoinedByString:", CFSTR(", "));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" pendingMembers=%@"), v17);

  }
  -[TUConversation kickedMembers](self, "kickedMembers");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "count");

  if (v19)
  {
    -[TUConversation kickedMembers](self, "kickedMembers");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "allObjects");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "componentsJoinedByString:", CFSTR(", "));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" kickedMembers=%@"), v22);

  }
  -[TUConversation rejectedMembers](self, "rejectedMembers");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "count");

  if (v24)
  {
    -[TUConversation rejectedMembers](self, "rejectedMembers");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "allObjects");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "componentsJoinedByString:", CFSTR(", "));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" rejectedMembers=%@"), v27);

  }
  -[TUConversation otherInvitedHandles](self, "otherInvitedHandles");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "count");

  if (v29)
  {
    -[TUConversation otherInvitedHandles](self, "otherInvitedHandles");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "allObjects");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "componentsJoinedByString:", CFSTR(", "));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" otherInvitedHandles=%@"), v32);

  }
  -[TUConversation lightweightMembers](self, "lightweightMembers");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "count");

  if (v34)
  {
    -[TUConversation lightweightMembers](self, "lightweightMembers");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "allObjects");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "componentsJoinedByString:", CFSTR(", "));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" lightweightMembers=%@"), v37);

  }
  -[TUConversation activeRemoteParticipants](self, "activeRemoteParticipants");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" activeRemoteParticipants=%@"), v38);

  -[TUConversation activeLightweightParticipants](self, "activeLightweightParticipants");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v39, "count");

  if (v40)
  {
    -[TUConversation activeLightweightParticipants](self, "activeLightweightParticipants");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "allObjects");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "componentsJoinedByString:", CFSTR(", "));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" activeLightweightParticipants=%@"), v43);

  }
  -[TUConversation report](self, "report");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" report=%@"), v44);

  -[TUConversation screenSharingRequests](self, "screenSharingRequests");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" screenSharingRequests=%@"), v45);

  -[TUConversation activitySessions](self, "activitySessions");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" activities=%@"), v46);

  -[TUConversation stagedActivitySession](self, "stagedActivitySession");
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  if (v47)
  {
    -[TUConversation stagedActivitySession](self, "stagedActivitySession");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" stagedActivitySession=%@"), v48);

  }
  objc_msgSend(v3, "appendFormat:", CFSTR(" oneToOneModeEnabled=%d"), -[TUConversation isOneToOneModeEnabled](self, "isOneToOneModeEnabled"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" backedByGroupSession=%d"), -[TUConversation isBackedByGroupSession](self, "isBackedByGroupSession"));
  -[TUConversation provider](self, "provider");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "identifier");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" provider=%@"), v50);

  -[TUConversation virtualParticipants](self, "virtualParticipants");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" virtualParticipants=%@"), v51);

  -[TUConversation invitationPreferences](self, "invitationPreferences");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" invitationPreferences=%@"), v52);

  -[TUConversation localMember](self, "localMember");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" localMember=%@"), v53);

  objc_msgSend(v3, "appendFormat:", CFSTR(" localParticipantIdentifier=%llu"), -[TUConversation localParticipantIdentifier](self, "localParticipantIdentifier"));
  -[TUConversation localParticipantAssociation](self, "localParticipantAssociation");
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  if (v54)
  {
    -[TUConversation localParticipantAssociation](self, "localParticipantAssociation");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" localParticipantAssociation=%@"), v55);

  }
  if (-[TUConversation isOneToOneHandoffOngoing](self, "isOneToOneHandoffOngoing"))
    objc_msgSend(v3, "appendFormat:", CFSTR(" isOneToOneHandoffOngoing=%d"), -[TUConversation isOneToOneHandoffOngoing](self, "isOneToOneHandoffOngoing"));
  -[TUConversation handoffEligibility](self, "handoffEligibility");
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  if (v56)
  {
    -[TUConversation handoffEligibility](self, "handoffEligibility");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" handoffEligibility=%@"), v57);

  }
  objc_msgSend(v3, "appendFormat:", CFSTR(" isFromStorage=%d"), -[TUConversation isFromStorage](self, "isFromStorage"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" isAnyOtherAccountDeviceActive=%d"), -[TUConversation isAnyOtherAccountDeviceActive](self, "isAnyOtherAccountDeviceActive"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" screening=%d"), -[TUConversation isScreening](self, "isScreening"));
  -[TUConversation supportedMediaTypes](self, "supportedMediaTypes");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = objc_msgSend(v58, "count");

  if (v59)
  {
    -[TUConversation supportedMediaTypes](self, "supportedMediaTypes");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "componentsJoinedByString:", CFSTR(", "));
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" supportedMediaTypes=%@"), v61);

  }
  -[TUConversation systemActivitySessions](self, "systemActivitySessions");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = objc_msgSend(v62, "count");

  if (v63)
  {
    -[TUConversation systemActivitySessions](self, "systemActivitySessions");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "allObjects");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "componentsJoinedByString:", CFSTR(", "));
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" systemActivitySessions=%@"), v66);

  }
  objc_msgSend(v3, "appendFormat:", CFSTR(" host=%d"), -[TUConversation hostedOnCurrentDevice](self, "hostedOnCurrentDevice"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" endpt=%d"), -[TUConversation endpointOnCurrentDevice](self, "endpointOnCurrentDevice"));
  if (-[TUConversation isSpatialPersonaEnabled](self, "isSpatialPersonaEnabled"))
    objc_msgSend(v3, "appendFormat:", CFSTR(" isSpatialPersonaEnabled=%d"), -[TUConversation isSpatialPersonaEnabled](self, "isSpatialPersonaEnabled"));
  if (-[TUConversation isCameraMixedWithScreen](self, "isCameraMixedWithScreen"))
    objc_msgSend(v3, "appendFormat:", CFSTR(" isCameraMixedWithScreen=%d"), -[TUConversation isCameraMixedWithScreen](self, "isCameraMixedWithScreen"));
  -[TUConversation handoffContext](self, "handoffContext");
  v67 = (void *)objc_claimAutoreleasedReturnValue();

  if (v67)
  {
    -[TUConversation handoffContext](self, "handoffContext");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" handoffContext=%@"), v68);

  }
  -[TUConversation highlightIdentifiers](self, "highlightIdentifiers");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = objc_msgSend(v69, "count");

  if (v70)
  {
    -[TUConversation highlightIdentifiers](self, "highlightIdentifiers");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "allObjects");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "componentsJoinedByString:", CFSTR(", "));
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" highlightIdentifiers=%@"), v73);

  }
  objc_msgSend(v3, "appendFormat:", CFSTR(" screenSharingType=%ld"), -[TUConversation screenSharingType](self, "screenSharingType"));
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  v74 = (void *)objc_msgSend(v3, "copy");

  return v74;
}

- (BOOL)isEqual:(id)a3
{
  TUConversation *v4;
  BOOL v5;

  v4 = (TUConversation *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[TUConversation isEqualToConversation:](self, "isEqualToConversation:", v4);
  }

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int64_t v19;
  uint64_t v20;
  int64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  int64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  unint64_t v71;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;

  -[TUConversation activeRemoteParticipants](self, "activeRemoteParticipants");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v93, "hash");
  -[TUConversation activitySessions](self, "activitySessions");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v92, "hash") ^ v3;
  -[TUConversation stagedActivitySession](self, "stagedActivitySession");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 ^ objc_msgSend(v91, "hash");
  if (-[TUConversation isAudioEnabled](self, "isAudioEnabled"))
    v6 = 1231;
  else
    v6 = 1237;
  -[TUConversation avcSessionIdentifier](self, "avcSessionIdentifier");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ v6 ^ objc_msgSend(v90, "hash");
  v8 = -[TUConversation avcSessionToken](self, "avcSessionToken");
  v9 = v8 ^ -[TUConversation localCaptionToken](self, "localCaptionToken");
  if (-[TUConversation isBackedByGroupSession](self, "isBackedByGroupSession"))
    v10 = 1231;
  else
    v10 = 1237;
  v11 = v9 ^ v10;
  -[TUConversation groupUUID](self, "groupUUID");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v7 ^ v11 ^ objc_msgSend(v89, "hash");
  if (-[TUConversation hasJoined](self, "hasJoined"))
    v13 = 1231;
  else
    v13 = 1237;
  -[TUConversation initiator](self, "initiator");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13 ^ objc_msgSend(v88, "hash");
  -[TUConversation kickedMembers](self, "kickedMembers");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14 ^ objc_msgSend(v87, "hash");
  -[TUConversation rejectedMembers](self, "rejectedMembers");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v12 ^ v15 ^ objc_msgSend(v86, "hash");
  -[TUConversation otherInvitedHandles](self, "otherInvitedHandles");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v85, "hash");
  v18 = v17 ^ -[TUConversation hasReceivedLetMeInRequest](self, "hasReceivedLetMeInRequest");
  v19 = v18 ^ -[TUConversation letMeInRequestState](self, "letMeInRequestState");
  if (-[TUConversation ignoreLMIRequests](self, "ignoreLMIRequests"))
    v20 = 1231;
  else
    v20 = 1237;
  v21 = v19 ^ v20;
  -[TUConversation link](self, "link");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v16 ^ v21 ^ objc_msgSend(v84, "hash");
  if (-[TUConversation isLocallyCreated](self, "isLocallyCreated"))
    v23 = 1231;
  else
    v23 = 1237;
  v24 = v23 ^ -[TUConversation localParticipantIdentifier](self, "localParticipantIdentifier");
  -[TUConversation localParticipantAssociation](self, "localParticipantAssociation");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24 ^ objc_msgSend(v83, "hash");
  if (-[TUConversation isOneToOneHandoffOngoing](self, "isOneToOneHandoffOngoing"))
    v26 = 1231;
  else
    v26 = 1237;
  v27 = v25 ^ v26;
  -[TUConversation handoffEligibility](self, "handoffEligibility");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27 ^ objc_msgSend(v82, "hash");
  -[TUConversation messagesGroupUUID](self, "messagesGroupUUID");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v22 ^ v28 ^ objc_msgSend(v81, "hash");
  if (-[TUConversation isOneToOneModeEnabled](self, "isOneToOneModeEnabled"))
    v30 = 1231;
  else
    v30 = 1237;
  -[TUConversation participantHandles](self, "participantHandles");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v30 ^ objc_msgSend(v80, "hash");
  -[TUConversation pendingMembers](self, "pendingMembers");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v31 ^ objc_msgSend(v79, "hash");
  -[TUConversation provider](self, "provider");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v32 ^ objc_msgSend(v78, "hash");
  -[TUConversation remoteMembers](self, "remoteMembers");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v33 ^ objc_msgSend(v77, "hash");
  -[TUConversation lightweightMembers](self, "lightweightMembers");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v34 ^ objc_msgSend(v76, "hash");
  -[TUConversation report](self, "report");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v29 ^ v35 ^ objc_msgSend(v75, "hash");
  if (-[TUConversation isScreenEnabled](self, "isScreenEnabled"))
    v37 = 1231;
  else
    v37 = 1237;
  v38 = v37 ^ -[TUConversation state](self, "state");
  -[TUConversation UUID](self, "UUID");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v38 ^ objc_msgSend(v74, "hash");
  if (-[TUConversation isVideoEnabled](self, "isVideoEnabled"))
    v40 = 1231;
  else
    v40 = 1237;
  v41 = v39 ^ v40;
  if (-[TUConversation isVideoPaused](self, "isVideoPaused"))
    v42 = 1231;
  else
    v42 = 1237;
  v43 = v41 ^ v42;
  -[TUConversation virtualParticipants](self, "virtualParticipants");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v43 ^ objc_msgSend(v73, "hash");
  -[TUConversation invitationPreferences](self, "invitationPreferences");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = v44 ^ objc_msgSend(v45, "hash");
  -[TUConversation activeLightweightParticipants](self, "activeLightweightParticipants");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v36 ^ v46 ^ objc_msgSend(v47, "hash");
  if (-[TUConversation isFromStorage](self, "isFromStorage"))
    v49 = 1231;
  else
    v49 = 1237;
  if (-[TUConversation isAnyOtherAccountDeviceActive](self, "isAnyOtherAccountDeviceActive"))
    v50 = 1231;
  else
    v50 = 1237;
  v51 = v49 ^ v50;
  -[TUConversation supportedMediaTypes](self, "supportedMediaTypes");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = v51 ^ objc_msgSend(v52, "hash");
  -[TUConversation systemActivitySessions](self, "systemActivitySessions");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = v53 ^ objc_msgSend(v54, "hash");
  -[TUConversation selectiveSharingSessionUUID](self, "selectiveSharingSessionUUID");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = v55 ^ objc_msgSend(v56, "hash");
  if (-[TUConversation isPendingConversation](self, "isPendingConversation"))
    v58 = 1231;
  else
    v58 = 1237;
  v59 = v57 ^ v58 ^ -[TUConversation isScreening](self, "isScreening");
  if (-[TUConversation endpointOnCurrentDevice](self, "endpointOnCurrentDevice"))
    v60 = 1231;
  else
    v60 = 1237;
  v61 = v59 ^ v60;
  if (-[TUConversation hostedOnCurrentDevice](self, "hostedOnCurrentDevice"))
    v62 = 1231;
  else
    v62 = 1237;
  v63 = v48 ^ v61 ^ v62;
  if (-[TUConversation isSpatialPersonaEnabled](self, "isSpatialPersonaEnabled"))
    v64 = 1231;
  else
    v64 = 1237;
  if (-[TUConversation isCameraMixedWithScreen](self, "isCameraMixedWithScreen"))
    v65 = 1231;
  else
    v65 = 1237;
  v66 = v64 ^ v65;
  -[TUConversation highlightIdentifiers](self, "highlightIdentifiers");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = v66 ^ objc_msgSend(v67, "hash");
  -[TUConversation screenSharingRequests](self, "screenSharingRequests");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = v68 ^ objc_msgSend(v69, "hash");
  v71 = v63 ^ v70 ^ -[TUConversation screenSharingType](self, "screenSharingType");

  return v71;
}

- (BOOL)isEqualToConversation:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  id v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  uint64_t v35;
  uint64_t v36;
  int64_t v37;
  int64_t v38;
  int v39;
  void *v40;
  int v41;
  unint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  int64_t v47;
  int v48;
  unint64_t v49;
  int v50;
  unint64_t v51;
  unint64_t v52;
  int v53;
  unint64_t v54;
  unint64_t v55;
  int v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  int v63;
  int64_t v64;
  void *v65;
  int v66;
  int v67;
  void *v68;
  unint64_t v69;
  void *v70;
  int v71;
  int v72;
  uint64_t v73;
  unint64_t v74;
  unint64_t v75;
  int v76;
  int v77;
  void *v78;
  int v79;
  int v80;
  int v81;
  int v82;
  void *v83;
  unint64_t v84;
  uint64_t v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  int v139;
  void *v140;
  void *v141;
  void *v142;
  uint64_t v143;
  _BYTE v144[12];
  _BYTE v145[24];
  _BYTE v146[24];
  int v147;
  id v148;
  id v149;

  v4 = a3;
  -[TUConversation activeRemoteParticipants](self, "activeRemoteParticipants");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeRemoteParticipants");
  v148 = (id)objc_claimAutoreleasedReturnValue();
  v149 = v5;
  v147 = objc_msgSend(v5, "isEqualToSet:", v148);
  if (!v147)
  {
    v19 = 0;
    memset(v146, 0, 21);
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    memset(v145, 0, sizeof(v145));
    v143 = 0;
    memset(v144, 0, sizeof(v144));
    v16 = 0;
    v17 = 0;
    v18 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    goto LABEL_10;
  }
  -[TUConversation activitySessions](self, "activitySessions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activitySessions");
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  v142 = v7;
  if (!objc_msgSend(v7, "isEqualToSet:")
    || (v8 = -[TUConversation avMode](self, "avMode"), v8 != objc_msgSend(v4, "avMode")))
  {
    memset(v146, 0, 21);
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    memset(v145, 0, sizeof(v145));
    v143 = 0;
    memset(v144, 0, sizeof(v144));
    v16 = 0;
    v17 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    goto LABEL_10;
  }
  -[TUConversation presentationContext](self, "presentationContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentationContext");
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  v138 = v9;
  if (!objc_msgSend(v9, "isEqual:"))
  {
    *(_QWORD *)&v146[8] = 0;
    *(_QWORD *)v146 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    memset(v145, 0, sizeof(v145));
    v143 = 0;
    memset(v144, 0, sizeof(v144));
    v16 = 0;
    v17 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    *(_QWORD *)&v146[16] = 1;
    goto LABEL_10;
  }
  -[TUConversation stagedActivitySession](self, "stagedActivitySession");
  v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stagedActivitySession");
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  v136 = (void *)v10;
  if (!TUObjectsAreEqualOrNil(v10, (uint64_t)v135)
    || (v11 = -[TUConversation isAudioEnabled](self, "isAudioEnabled"),
        v11 != objc_msgSend(v4, "isAudioEnabled")))
  {
    *(_QWORD *)v146 = 0;
    *(_QWORD *)&v146[8] = 0x100000000;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    memset(v145, 0, sizeof(v145));
    v143 = 0;
    memset(v144, 0, sizeof(v144));
    v16 = 0;
    v17 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    *(_DWORD *)&v146[16] = 1;
    v146[20] = 0;
    goto LABEL_10;
  }
  -[TUConversation avcSessionIdentifier](self, "avcSessionIdentifier");
  v35 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "avcSessionIdentifier");
  v36 = objc_claimAutoreleasedReturnValue();
  v134 = (void *)v35;
  if (v35 != v36)
  {
    v133 = (void *)v36;
    *(_QWORD *)&v146[4] = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    memset(v145, 0, sizeof(v145));
    v143 = 0;
    memset(v144, 0, sizeof(v144));
    v16 = 0;
    v17 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    *(_QWORD *)&v146[16] = 1;
    *(_DWORD *)&v146[12] = 1;
LABEL_76:
    *(_DWORD *)v146 = 1;
    goto LABEL_10;
  }
  v37 = -[TUConversation avcSessionToken](self, "avcSessionToken");
  if (v37 != objc_msgSend(v4, "avcSessionToken")
    || (v38 = -[TUConversation localCaptionToken](self, "localCaptionToken"),
        v38 != objc_msgSend(v4, "localCaptionToken"))
    || (v39 = -[TUConversation isBackedByGroupSession](self, "isBackedByGroupSession"),
        v39 != objc_msgSend(v4, "isBackedByGroupSession")))
  {
    *(_QWORD *)&v146[4] = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    memset(v145, 0, sizeof(v145));
    v143 = 0;
    memset(v144, 0, sizeof(v144));
    v16 = 0;
    v17 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    *(_DWORD *)&v146[16] = 1;
    v146[20] = 0;
    *(_DWORD *)&v146[12] = 1;
    v133 = v134;
    goto LABEL_76;
  }
  -[TUConversation groupUUID](self, "groupUUID");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "groupUUID");
  v132 = v40;
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v40, "isEqual:")
    || (v41 = -[TUConversation hasJoined](self, "hasJoined"), v41 != objc_msgSend(v4, "hasJoined")))
  {
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    memset(v145, 0, sizeof(v145));
    v143 = 0;
    memset(v144, 0, sizeof(v144));
    v16 = 0;
    v17 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    *(_DWORD *)&v146[16] = 1;
    v146[20] = 0;
    v133 = v134;
    *(_QWORD *)v146 = 1;
    *(_QWORD *)&v146[8] = 0x100000001;
    goto LABEL_10;
  }
  -[TUConversation initiator](self, "initiator");
  v42 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "initiator");
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  v130 = (void *)v42;
  if (!TUObjectsAreEqualOrNil(v42, (uint64_t)v129))
  {
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    memset(v145, 0, sizeof(v145));
    v143 = 0;
    memset(v144, 0, sizeof(v144));
    v16 = 0;
    v17 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v6 = 1;
    *(_QWORD *)&v146[16] = 1;
    v133 = v134;
    *(_QWORD *)v146 = 0x100000001;
    *(_QWORD *)&v146[8] = 0x100000001;
    goto LABEL_10;
  }
  -[TUConversation kickedMembers](self, "kickedMembers");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "kickedMembers");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  v128 = v43;
  if (!objc_msgSend(v43, "isEqualToSet:"))
  {
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v143 = 0;
    memset(v144, 0, sizeof(v144));
    v16 = 0;
    v17 = 0;
    memset(v145, 0, 20);
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v6 = 1;
    *(_QWORD *)&v146[16] = 1;
    v133 = v134;
    *(_QWORD *)v146 = 0x100000001;
    *(_QWORD *)&v146[8] = 0x100000001;
    *(_DWORD *)&v145[20] = 1;
    goto LABEL_10;
  }
  -[TUConversation rejectedMembers](self, "rejectedMembers");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v140 = v4;
  objc_msgSend(v4, "rejectedMembers");
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  v126 = v44;
  if (!objc_msgSend(v44, "isEqualToSet:"))
  {
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    *(_QWORD *)&v145[8] = 0;
    *(_QWORD *)v145 = 0;
    v143 = 0;
    memset(v144, 0, sizeof(v144));
    v16 = 0;
    v17 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v6 = 1;
    *(_QWORD *)&v146[16] = 1;
    v133 = v134;
    *(_QWORD *)v146 = 0x100000001;
    *(_QWORD *)&v146[8] = 0x100000001;
    *(_QWORD *)&v145[16] = 0x100000001;
    goto LABEL_91;
  }
  -[TUConversation otherInvitedHandles](self, "otherInvitedHandles");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "otherInvitedHandles");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  v124 = v45;
  if (!objc_msgSend(v45, "isEqualToSet:")
    || (v46 = -[TUConversation hasReceivedLetMeInRequest](self, "hasReceivedLetMeInRequest"),
        v46 != objc_msgSend(v4, "hasReceivedLetMeInRequest"))
    || (v47 = -[TUConversation letMeInRequestState](self, "letMeInRequestState"),
        v47 != objc_msgSend(v4, "letMeInRequestState"))
    || (v48 = -[TUConversation ignoreLMIRequests](self, "ignoreLMIRequests"),
        v48 != objc_msgSend(v4, "ignoreLMIRequests")))
  {
    v13 = 0;
    v14 = 0;
    v15 = 0;
    *(_OWORD *)v145 = 0uLL;
    v143 = 0;
    memset(v144, 0, sizeof(v144));
    v16 = 0;
    v17 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v6 = 1;
    *(_QWORD *)&v146[16] = 1;
    v133 = v134;
    *(_QWORD *)v146 = 0x100000001;
    *(_QWORD *)&v146[8] = 0x100000001;
    *(_QWORD *)&v145[16] = 0x100000001;
    v12 = 1;
LABEL_91:
    v4 = v140;
    goto LABEL_10;
  }
  -[TUConversation link](self, "link");
  v49 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "link");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  v122 = (void *)v49;
  if (!TUObjectsAreEqualOrNil(v49, (uint64_t)v121)
    || (v50 = -[TUConversation isLocallyCreated](self, "isLocallyCreated"),
        v50 != objc_msgSend(v4, "isLocallyCreated"))
    || (v51 = -[TUConversation localParticipantIdentifier](self, "localParticipantIdentifier"),
        v51 != objc_msgSend(v4, "localParticipantIdentifier")))
  {
    v14 = 0;
    v15 = 0;
    *(_QWORD *)&v145[8] = 0;
    *(_QWORD *)v145 = 0;
    v143 = 0;
    memset(v144, 0, sizeof(v144));
    v16 = 0;
    v17 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v6 = 1;
    *(_QWORD *)&v146[16] = 1;
    v133 = v134;
    *(_QWORD *)v146 = 0x100000001;
    *(_QWORD *)&v146[8] = 0x100000001;
    *(_QWORD *)&v145[16] = 0x100000001;
    v12 = 1;
    v13 = 1;
    goto LABEL_91;
  }
  -[TUConversation localParticipantAssociation](self, "localParticipantAssociation");
  v52 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localParticipantAssociation");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  v120 = (void *)v52;
  if (!TUObjectsAreEqualOrNil(v52, (uint64_t)v119)
    || (v53 = -[TUConversation isOneToOneHandoffOngoing](self, "isOneToOneHandoffOngoing"),
        v53 != objc_msgSend(v4, "isOneToOneHandoffOngoing")))
  {
    v15 = 0;
    *(_QWORD *)&v145[8] = 0;
    *(_QWORD *)v145 = 0;
    v143 = 0;
    memset(v144, 0, sizeof(v144));
    v16 = 0;
    v17 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v6 = 1;
    *(_QWORD *)&v146[16] = 1;
    v133 = v134;
    *(_QWORD *)v146 = 0x100000001;
    *(_QWORD *)&v146[8] = 0x100000001;
    *(_QWORD *)&v145[16] = 0x100000001;
    v12 = 1;
    v13 = 1;
    v14 = 1;
    goto LABEL_91;
  }
  -[TUConversation handoffEligibility](self, "handoffEligibility");
  v54 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handoffEligibility");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  v118 = (void *)v54;
  if (!TUObjectsAreEqualOrNil(v54, (uint64_t)v117))
  {
    *(_QWORD *)&v145[8] = 0;
    *(_QWORD *)v145 = 0;
    v143 = 0;
    memset(v144, 0, sizeof(v144));
    v16 = 0;
    v17 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v6 = 1;
    *(_QWORD *)&v146[16] = 1;
    v133 = v134;
    *(_QWORD *)v146 = 0x100000001;
    *(_QWORD *)&v146[8] = 0x100000001;
    *(_QWORD *)&v145[16] = 0x100000001;
    v12 = 1;
    v13 = 1;
    v14 = 1;
    v15 = 1;
    goto LABEL_91;
  }
  -[TUConversation messagesGroupUUID](self, "messagesGroupUUID");
  v55 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "messagesGroupUUID");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v116 = (void *)v55;
  if (!TUObjectsAreEqualOrNil(v55, (uint64_t)v115)
    || (v56 = -[TUConversation isOneToOneModeEnabled](self, "isOneToOneModeEnabled"),
        v56 != objc_msgSend(v4, "isOneToOneModeEnabled")))
  {
    *(_QWORD *)v145 = 0;
    v143 = 0;
    memset(v144, 0, sizeof(v144));
    v16 = 0;
    v17 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v6 = 1;
    *(_QWORD *)&v146[16] = 1;
    v133 = v134;
    *(_QWORD *)v146 = 0x100000001;
    *(_QWORD *)&v146[8] = 0x100000001;
    *(_QWORD *)&v145[16] = 0x100000001;
    v12 = 1;
    v13 = 1;
    v14 = 1;
    v15 = 1;
    *(_QWORD *)&v145[8] = 1;
    goto LABEL_91;
  }
  -[TUConversation participantHandles](self, "participantHandles");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "participantHandles");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  v114 = v57;
  if (!objc_msgSend(v57, "isEqualToSet:"))
  {
    *(_QWORD *)v145 = 0;
    v143 = 0;
    memset(v144, 0, sizeof(v144));
    v16 = 0;
    v17 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v6 = 1;
    *(_QWORD *)&v146[16] = 1;
    v133 = v134;
    *(_QWORD *)v146 = 0x100000001;
    *(_QWORD *)&v146[8] = 0x100000001;
    *(_QWORD *)&v145[16] = 0x100000001;
    v12 = 1;
    v13 = 1;
    v14 = 1;
    v15 = 1;
    *(_QWORD *)&v145[8] = 0x100000001;
    goto LABEL_91;
  }
  -[TUConversation pendingMembers](self, "pendingMembers");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pendingMembers");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v112 = v58;
  if (!objc_msgSend(v58, "isEqualToSet:"))
  {
    v143 = 0;
    memset(v144, 0, sizeof(v144));
    v16 = 0;
    v17 = 0;
    *(_QWORD *)v145 = 0x100000000;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v6 = 1;
    *(_QWORD *)&v146[16] = 1;
    v133 = v134;
    *(_QWORD *)v146 = 0x100000001;
    *(_QWORD *)&v146[8] = 0x100000001;
    *(_QWORD *)&v145[16] = 0x100000001;
    v12 = 1;
    v13 = 1;
    v14 = 1;
    v15 = 1;
    *(_QWORD *)&v145[8] = 0x100000001;
    goto LABEL_91;
  }
  -[TUConversation provider](self, "provider");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "provider");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v110 = v59;
  if (!objc_msgSend(v59, "isEqual:"))
  {
    v143 = 0;
    *(_QWORD *)v144 = 0;
    v16 = 0;
    v17 = 0;
    *(_DWORD *)v145 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v6 = 1;
    *(_QWORD *)&v146[16] = 1;
    v133 = v134;
    *(_DWORD *)v146 = 1;
    *(_DWORD *)&v146[4] = 1;
    *(_DWORD *)&v146[8] = 1;
    *(_DWORD *)&v146[12] = 1;
    *(_DWORD *)&v145[16] = 1;
    *(_DWORD *)&v145[20] = 1;
    v12 = 1;
    v13 = 1;
    v14 = 1;
    v15 = 1;
    *(_DWORD *)&v145[8] = 1;
    *(_DWORD *)&v145[12] = 1;
    *(_DWORD *)&v145[4] = 1;
    *(_DWORD *)&v144[8] = 1;
    goto LABEL_91;
  }
  -[TUConversation remoteMembers](self, "remoteMembers");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteMembers");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v108 = v60;
  if (!objc_msgSend(v60, "isEqualToSet:"))
  {
    v143 = 0;
    *(_DWORD *)v144 = 0;
    v16 = 0;
    v17 = 0;
    *(_DWORD *)v145 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v6 = 1;
    *(_QWORD *)&v146[16] = 1;
    v133 = v134;
    *(_DWORD *)v146 = 1;
    *(_DWORD *)&v146[4] = 1;
    *(_DWORD *)&v146[8] = 1;
    *(_DWORD *)&v146[12] = 1;
    *(_DWORD *)&v145[16] = 1;
    *(_DWORD *)&v145[20] = 1;
    v12 = 1;
    v13 = 1;
    v14 = 1;
    v15 = 1;
    *(_DWORD *)&v145[8] = 1;
    *(_DWORD *)&v145[12] = 1;
    *(_DWORD *)&v145[4] = 1;
    *(_DWORD *)&v144[8] = 1;
    *(_DWORD *)&v144[4] = 1;
    goto LABEL_91;
  }
  -[TUConversation lightweightMembers](self, "lightweightMembers");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lightweightMembers");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v106 = v61;
  if (!objc_msgSend(v61, "isEqualToSet:"))
  {
    v143 = 0x100000000;
    *(_QWORD *)v144 = 0x100000000;
    v16 = 0;
    v17 = 0;
    *(_QWORD *)v145 = 0x100000000;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v6 = 1;
    *(_QWORD *)&v146[16] = 1;
    v133 = v134;
    *(_QWORD *)v146 = 0x100000001;
    *(_QWORD *)&v146[8] = 0x100000001;
    *(_QWORD *)&v145[16] = 0x100000001;
    v12 = 1;
    v13 = 1;
    v14 = 1;
    v15 = 1;
    *(_QWORD *)&v145[8] = 0x100000001;
    *(_DWORD *)&v144[8] = 1;
    goto LABEL_91;
  }
  -[TUConversation report](self, "report");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v140, "report");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v104 = v62;
  if (!objc_msgSend(v62, "isEqual:")
    || (v63 = -[TUConversation isScreenEnabled](self, "isScreenEnabled"),
        v63 != objc_msgSend(v140, "isScreenEnabled"))
    || (v64 = -[TUConversation state](self, "state"), v64 != objc_msgSend(v140, "state")))
  {
    *(_QWORD *)v144 = 0x100000000;
    v16 = 0;
    v17 = 0;
    *(_QWORD *)v145 = 0x100000000;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v6 = 1;
    *(_QWORD *)&v146[16] = 1;
    v133 = v134;
    *(_QWORD *)v146 = 0x100000001;
    *(_QWORD *)&v146[8] = 0x100000001;
    *(_QWORD *)&v145[16] = 0x100000001;
    v12 = 1;
    v13 = 1;
    v14 = 1;
    v15 = 1;
    *(_QWORD *)&v145[8] = 0x100000001;
    *(_DWORD *)&v144[8] = 1;
    v143 = 0x100000001;
    goto LABEL_91;
  }
  -[TUConversation UUID](self, "UUID");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v140, "UUID");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v102 = v65;
  if (!objc_msgSend(v65, "isEqual:")
    || (v66 = -[TUConversation isVideoEnabled](self, "isVideoEnabled"),
        v66 != objc_msgSend(v140, "isVideoEnabled"))
    || (v67 = -[TUConversation isVideoPaused](self, "isVideoPaused"),
        v67 != objc_msgSend(v140, "isVideoPaused")))
  {
    v16 = 0;
    v17 = 0;
    *(_QWORD *)v145 = 0x100000000;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v6 = 1;
    *(_QWORD *)&v146[16] = 1;
    v133 = v134;
    *(_QWORD *)v146 = 0x100000001;
    *(_QWORD *)&v146[8] = 0x100000001;
    *(_QWORD *)&v145[16] = 0x100000001;
    v12 = 1;
    v13 = 1;
    v14 = 1;
    v15 = 1;
    *(_QWORD *)&v145[8] = 0x100000001;
    *(_DWORD *)&v144[8] = 1;
    v143 = 0x100000001;
    *(_QWORD *)v144 = 0x100000001;
    goto LABEL_91;
  }
  -[TUConversation virtualParticipants](self, "virtualParticipants");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v140, "virtualParticipants");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v100 = v68;
  if (!objc_msgSend(v68, "isEqualToSet:"))
  {
    v17 = 0;
    *(_QWORD *)v145 = 0x100000000;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v6 = 1;
    *(_QWORD *)&v146[16] = 1;
    v133 = v134;
    *(_QWORD *)v146 = 0x100000001;
    *(_QWORD *)&v146[8] = 0x100000001;
    *(_QWORD *)&v145[16] = 0x100000001;
    v12 = 1;
    v13 = 1;
    v14 = 1;
    v15 = 1;
    *(_QWORD *)&v145[8] = 0x100000001;
    *(_DWORD *)&v144[8] = 1;
    v143 = 0x100000001;
    *(_QWORD *)v144 = 0x100000001;
    v16 = 1;
    goto LABEL_91;
  }
  -[TUConversation invitationPreferences](self, "invitationPreferences");
  v69 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v140, "invitationPreferences");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = (void *)v69;
  if (!TUObjectsAreEqualOrNil(v69, (uint64_t)v97))
  {
    *(_QWORD *)v145 = 0x100000000;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v6 = 1;
    *(_QWORD *)&v146[16] = 1;
    v133 = v134;
    *(_QWORD *)v146 = 0x100000001;
    *(_QWORD *)&v146[8] = 0x100000001;
    *(_QWORD *)&v145[16] = 0x100000001;
    v12 = 1;
    v13 = 1;
    v14 = 1;
    v15 = 1;
    *(_QWORD *)&v145[8] = 0x100000001;
    *(_DWORD *)&v144[8] = 1;
    v143 = 0x100000001;
    *(_QWORD *)v144 = 0x100000001;
    v16 = 1;
    v17 = 1;
    goto LABEL_91;
  }
  -[TUConversation activeLightweightParticipants](self, "activeLightweightParticipants");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v140, "activeLightweightParticipants");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v96 = v70;
  if (!objc_msgSend(v70, "isEqual:")
    || (v71 = -[TUConversation isFromStorage](self, "isFromStorage"),
        v71 != objc_msgSend(v140, "isFromStorage"))
    || (v72 = -[TUConversation isAnyOtherAccountDeviceActive](self, "isAnyOtherAccountDeviceActive"),
        v72 != objc_msgSend(v140, "isAnyOtherAccountDeviceActive")))
  {
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v6 = 1;
    *(_QWORD *)&v146[16] = 1;
    v133 = v134;
    *(_QWORD *)v146 = 0x100000001;
    *(_QWORD *)&v146[8] = 0x100000001;
    *(_QWORD *)&v145[16] = 0x100000001;
    v12 = 1;
    v13 = 1;
    v14 = 1;
    v15 = 1;
    *(_QWORD *)&v145[8] = 0x100000001;
    *(_DWORD *)&v144[8] = 1;
    v143 = 0x100000001;
    *(_QWORD *)v144 = 0x100000001;
    v16 = 1;
    v17 = 1;
    *(_QWORD *)v145 = 0x100000001;
    goto LABEL_91;
  }
  -[TUConversation selectiveSharingSessionUUID](self, "selectiveSharingSessionUUID");
  v73 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v140, "selectiveSharingSessionUUID");
  v94 = (void *)v73;
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  if ((void *)v73 != v87)
  {
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v6 = 1;
    *(_QWORD *)&v146[16] = 1;
    v133 = v134;
    *(_QWORD *)v146 = 0x100000001;
    *(_QWORD *)&v146[8] = 0x100000001;
    *(_QWORD *)&v145[16] = 0x100000001;
    v12 = 1;
    v13 = 1;
    v14 = 1;
    v15 = 1;
    *(_QWORD *)&v145[8] = 0x100000001;
    *(_QWORD *)v145 = 0x100000001;
    *(_DWORD *)&v144[8] = 1;
    v143 = 0x100000001;
    *(_QWORD *)v144 = 0x100000001;
    v16 = 1;
    v17 = 1;
    v18 = 1;
    goto LABEL_91;
  }
  -[TUConversation supportedMediaTypes](self, "supportedMediaTypes");
  v74 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v140, "supportedMediaTypes");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v93 = (void *)v74;
  if (!TUObjectsAreEqualOrNil(v74, (uint64_t)v92))
  {
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v6 = 1;
    *(_QWORD *)&v146[16] = 1;
    v133 = v134;
    *(_QWORD *)v146 = 0x100000001;
    *(_QWORD *)&v146[8] = 0x100000001;
    *(_QWORD *)&v145[16] = 0x100000001;
    v12 = 1;
    v13 = 1;
    v14 = 1;
    v15 = 1;
    *(_QWORD *)&v145[8] = 0x100000001;
    *(_QWORD *)v145 = 0x100000001;
    *(_DWORD *)&v144[8] = 1;
    v143 = 0x100000001;
    *(_QWORD *)v144 = 0x100000001;
    v16 = 1;
    v17 = 1;
    v87 = v94;
    v18 = 1;
    v19 = 1;
    goto LABEL_91;
  }
  -[TUConversation systemActivitySessions](self, "systemActivitySessions");
  v75 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v140, "systemActivitySessions");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = (void *)v75;
  if (!TUObjectsAreEqualOrNil(v75, (uint64_t)v90)
    || (v76 = -[TUConversation isPendingConversation](self, "isPendingConversation"),
        v76 != objc_msgSend(v140, "isPendingConversation"))
    || (v77 = -[TUConversation isScreening](self, "isScreening"), v77 != objc_msgSend(v140, "isScreening")))
  {
    v21 = 0;
    v22 = 0;
    v6 = 1;
    *(_QWORD *)&v146[16] = 1;
    v133 = v134;
    *(_QWORD *)v146 = 0x100000001;
    *(_QWORD *)&v146[8] = 0x100000001;
    *(_QWORD *)&v145[16] = 0x100000001;
    v12 = 1;
    v13 = 1;
    v14 = 1;
    v15 = 1;
    *(_QWORD *)&v145[8] = 0x100000001;
    *(_QWORD *)v145 = 0x100000001;
    *(_DWORD *)&v144[8] = 1;
    v143 = 0x100000001;
    *(_QWORD *)v144 = 0x100000001;
    v16 = 1;
    v17 = 1;
    v87 = v94;
    v18 = 1;
    v19 = 1;
    v20 = 1;
    goto LABEL_91;
  }
  -[TUConversation highlightIdentifiers](self, "highlightIdentifiers");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v140, "highlightIdentifiers");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = v78;
  if (!objc_msgSend(v78, "isEqualToSet:")
    || (v79 = -[TUConversation endpointOnCurrentDevice](self, "endpointOnCurrentDevice"),
        v79 != objc_msgSend(v140, "endpointOnCurrentDevice"))
    || (v80 = -[TUConversation hostedOnCurrentDevice](self, "hostedOnCurrentDevice"),
        v80 != objc_msgSend(v140, "hostedOnCurrentDevice"))
    || (v81 = -[TUConversation isSpatialPersonaEnabled](self, "isSpatialPersonaEnabled"),
        v81 != objc_msgSend(v140, "isSpatialPersonaEnabled"))
    || (v82 = -[TUConversation isCameraMixedWithScreen](self, "isCameraMixedWithScreen"),
        v82 != objc_msgSend(v140, "isCameraMixedWithScreen")))
  {
    v22 = 0;
    *(_DWORD *)&v146[16] = 1;
    v146[20] = 0;
    v133 = v134;
    *(_QWORD *)v146 = 0x100000001;
    *(_QWORD *)&v146[8] = 0x100000001;
    *(_QWORD *)&v145[16] = 0x100000001;
    v12 = 1;
    v13 = 1;
    v14 = 1;
    v15 = 1;
    *(_QWORD *)&v145[8] = 0x100000001;
    *(_QWORD *)v145 = 0x100000001;
    *(_DWORD *)&v144[8] = 1;
    v143 = 0x100000001;
    *(_QWORD *)v144 = 0x100000001;
    v16 = 1;
    v17 = 1;
    v87 = v94;
    v18 = 1;
    v19 = 1;
    v20 = 1;
    v21 = 1;
    goto LABEL_91;
  }
  -[TUConversation screenSharingRequests](self, "screenSharingRequests");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v140, "screenSharingRequests");
  v85 = objc_claimAutoreleasedReturnValue();
  v86 = v83;
  if (objc_msgSend(v83, "isEqualToSet:"))
  {
    v84 = -[TUConversation screenSharingType](self, "screenSharingType");
    v4 = v140;
    *(_DWORD *)&v146[16] = 1;
    v146[20] = v84 == objc_msgSend(v140, "screenSharingType");
    v133 = v134;
    *(_QWORD *)v146 = 0x100000001;
    *(_QWORD *)&v146[8] = 0x100000001;
    *(_QWORD *)&v145[16] = 0x100000001;
    v12 = 1;
    v13 = 1;
    v14 = 1;
    v15 = 1;
    *(_QWORD *)&v145[8] = 0x100000001;
    *(_QWORD *)v145 = 0x100000001;
    *(_DWORD *)&v144[8] = 1;
    v143 = 0x100000001;
    *(_QWORD *)v144 = 0x100000001;
    v16 = 1;
    v17 = 1;
    v87 = v94;
    v18 = 1;
    v19 = 1;
    v20 = 1;
    v21 = 1;
    v22 = 1;
  }
  else
  {
    *(_QWORD *)&v146[16] = 1;
    v133 = v134;
    *(_QWORD *)v146 = 0x100000001;
    *(_QWORD *)&v146[8] = 0x100000001;
    *(_QWORD *)&v145[16] = 0x100000001;
    v12 = 1;
    v13 = 1;
    v14 = 1;
    v15 = 1;
    *(_QWORD *)&v145[8] = 0x100000001;
    *(_QWORD *)v145 = 0x100000001;
    *(_DWORD *)&v144[8] = 1;
    v143 = 0x100000001;
    *(_QWORD *)v144 = 0x100000001;
    v16 = 1;
    v17 = 1;
    v87 = v94;
    v18 = 1;
    v19 = 1;
    v20 = 1;
    v21 = 1;
    v22 = 1;
    v4 = v140;
  }
  v6 = v85;
LABEL_10:
  if (v22)
  {
    v139 = v12;
    v23 = v17;
    v24 = v4;
    v25 = v16;
    v26 = v13;
    v27 = v14;
    v28 = v15;
    v29 = v18;
    v30 = v19;
    v31 = v20;
    v32 = v21;

    v33 = v32;
    v20 = v31;
    v19 = v30;
    v18 = v29;
    v15 = v28;
    v14 = v27;
    v13 = v26;
    v16 = v25;
    v4 = v24;
    v17 = v23;
    v12 = v139;
    if (!v33)
      goto LABEL_12;
  }
  else if (!v21)
  {
LABEL_12:
    if (v20)
      goto LABEL_13;
    goto LABEL_61;
  }

  if (v20)
  {
LABEL_13:

    if (!v19)
      goto LABEL_14;
    goto LABEL_62;
  }
LABEL_61:
  if (!v19)
  {
LABEL_14:
    if (!v18)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_62:

  if (v18)
  {
LABEL_15:

  }
LABEL_16:
  if (*(_DWORD *)v145)
  {

  }
  if (v17)
  {

  }
  if (v16)
  {

  }
  if (*(_DWORD *)v144)
  {

  }
  if ((_DWORD)v143)
  {

  }
  if (HIDWORD(v143))
  {

  }
  if (*(_DWORD *)&v144[4])
  {

  }
  if (*(_DWORD *)&v144[8])
  {

  }
  if (*(_DWORD *)&v145[4])
  {

  }
  if (*(_DWORD *)&v145[12])
  {

  }
  if (*(_DWORD *)&v145[8])
  {

    if (!v15)
      goto LABEL_38;
  }
  else if (!v15)
  {
LABEL_38:
    if (v14)
      goto LABEL_39;
    goto LABEL_66;
  }

  if (v14)
  {
LABEL_39:

    if (!v13)
      goto LABEL_40;
    goto LABEL_67;
  }
LABEL_66:
  if (!v13)
  {
LABEL_40:
    if (!v12)
      goto LABEL_42;
    goto LABEL_41;
  }
LABEL_67:

  if (v12)
  {
LABEL_41:

  }
LABEL_42:
  if (*(_DWORD *)&v145[16])
  {

  }
  if (*(_DWORD *)&v145[20])
  {

  }
  if (*(_DWORD *)&v146[4])
  {

  }
  if (*(_DWORD *)&v146[8])
  {

  }
  if (*(_DWORD *)v146)
  {

  }
  if (*(_DWORD *)&v146[12])
  {

  }
  if (*(_DWORD *)&v146[16])
  {

  }
  if (v147)
  {

  }
  return v146[20];
}

- (unint64_t)avMode
{
  return self->_avMode;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (void)setUUID:(id)a3
{
  objc_storeStrong((id *)&self->_UUID, a3);
}

- (NSUUID)groupUUID
{
  return self->_groupUUID;
}

- (void)setGroupUUID:(id)a3
{
  objc_storeStrong((id *)&self->_groupUUID, a3);
}

- (TUConversationLink)link
{
  return self->_link;
}

- (void)setLink:(id)a3
{
  objc_storeStrong((id *)&self->_link, a3);
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (BOOL)hasReceivedLetMeInRequest
{
  return self->_hasReceivedLetMeInRequest;
}

- (void)setHasReceivedLetMeInRequest:(BOOL)a3
{
  self->_hasReceivedLetMeInRequest = a3;
}

- (int64_t)letMeInRequestState
{
  return self->_letMeInRequestState;
}

- (void)setLetMeInRequestState:(int64_t)a3
{
  self->_letMeInRequestState = a3;
}

- (BOOL)isAudioEnabled
{
  return self->_audioEnabled;
}

- (void)setAudioEnabled:(BOOL)a3
{
  self->_audioEnabled = a3;
}

- (BOOL)isVideoEnabled
{
  return self->_videoEnabled;
}

- (void)setVideoEnabled:(BOOL)a3
{
  self->_videoEnabled = a3;
}

- (BOOL)isScreenEnabled
{
  return self->_screenEnabled;
}

- (void)setScreenEnabled:(BOOL)a3
{
  self->_screenEnabled = a3;
}

- (BOOL)isLocallyCreated
{
  return self->_locallyCreated;
}

- (void)setLocallyCreated:(BOOL)a3
{
  self->_locallyCreated = a3;
}

- (NSSet)participantHandles
{
  return self->_participantHandles;
}

- (void)setParticipantHandles:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSSet)remoteMembers
{
  return self->_remoteMembers;
}

- (void)setRemoteMembers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSSet)pendingMembers
{
  return self->_pendingMembers;
}

- (void)setPendingMembers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSSet)kickedMembers
{
  return self->_kickedMembers;
}

- (void)setKickedMembers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSSet)rejectedMembers
{
  return self->_rejectedMembers;
}

- (void)setRejectedMembers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSSet)lightweightMembers
{
  return self->_lightweightMembers;
}

- (void)setLightweightMembers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSSet)otherInvitedHandles
{
  return self->_otherInvitedHandles;
}

- (void)setOtherInvitedHandles:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSSet)activeRemoteParticipants
{
  return self->_activeRemoteParticipants;
}

- (void)setActiveRemoteParticipants:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSSet)activeLightweightParticipants
{
  return self->_activeLightweightParticipants;
}

- (void)setActiveLightweightParticipants:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (TUConversationReport)report
{
  return self->_report;
}

- (void)setReport:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSSet)activitySessions
{
  return self->_activitySessions;
}

- (void)setActivitySessions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (TUConversationActivitySession)stagedActivitySession
{
  return self->_stagedActivitySession;
}

- (void)setStagedActivitySession:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSSet)highlightIdentifiers
{
  return self->_highlightIdentifiers;
}

- (void)setHighlightIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (TUConversationProvider)provider
{
  return self->_provider;
}

- (void)setProvider:(id)a3
{
  objc_storeStrong((id *)&self->_provider, a3);
}

- (BOOL)isSpatialPersonaEnabled
{
  return self->_spatialPersonaEnabled;
}

- (void)setSpatialPersonaEnabled:(BOOL)a3
{
  self->_spatialPersonaEnabled = a3;
}

- (BOOL)isCameraMixedWithScreen
{
  return self->_cameraMixedWithScreen;
}

- (void)setCameraMixedWithScreen:(BOOL)a3
{
  self->_cameraMixedWithScreen = a3;
}

- (NSArray)supportedMediaTypes
{
  return self->_supportedMediaTypes;
}

- (unint64_t)presentationMode
{
  return self->_presentationMode;
}

- (void)setPresentationMode:(unint64_t)a3
{
  self->_presentationMode = a3;
}

- (int64_t)avcSessionToken
{
  return self->_avcSessionToken;
}

- (void)setAvcSessionToken:(int64_t)a3
{
  self->_avcSessionToken = a3;
}

- (int64_t)localCaptionToken
{
  return self->_localCaptionToken;
}

- (void)setLocalCaptionToken:(int64_t)a3
{
  self->_localCaptionToken = a3;
}

- (NSString)avcSessionIdentifier
{
  return self->_avcSessionIdentifier;
}

- (void)setAvcSessionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (BOOL)isVideoPaused
{
  return self->_videoPaused;
}

- (void)setVideoPaused:(BOOL)a3
{
  self->_videoPaused = a3;
}

- (BOOL)hasJoined
{
  return self->_hasJoined;
}

- (void)setHasJoined:(BOOL)a3
{
  self->_hasJoined = a3;
}

- (BOOL)isAnyOtherAccountDeviceActive
{
  return self->_isAnyOtherAccountDeviceActive;
}

- (void)setIsAnyOtherAccountDeviceActive:(BOOL)a3
{
  self->_isAnyOtherAccountDeviceActive = a3;
}

- (BOOL)isPendingConversation
{
  return self->_pendingConversation;
}

- (void)setPendingConversation:(BOOL)a3
{
  self->_pendingConversation = a3;
}

- (TUConversationMember)localMember
{
  return self->_localMember;
}

- (void)setLocalMember:(id)a3
{
  objc_storeStrong((id *)&self->_localMember, a3);
}

- (unint64_t)localParticipantIdentifier
{
  return self->_localParticipantIdentifier;
}

- (void)setLocalParticipantIdentifier:(unint64_t)a3
{
  self->_localParticipantIdentifier = a3;
}

- (TUConversationParticipantAssociation)localParticipantAssociation
{
  return self->_localParticipantAssociation;
}

- (void)setLocalParticipantAssociation:(id)a3
{
  objc_storeStrong((id *)&self->_localParticipantAssociation, a3);
}

- (BOOL)isOneToOneHandoffOngoing
{
  return self->_oneToOneHandoffOngoing;
}

- (void)setOneToOneHandoffOngoing:(BOOL)a3
{
  self->_oneToOneHandoffOngoing = a3;
}

- (TUConversationHandoffEligibility)handoffEligibility
{
  return self->_handoffEligibility;
}

- (void)setHandoffEligibility:(id)a3
{
  objc_storeStrong((id *)&self->_handoffEligibility, a3);
}

- (BOOL)ignoreLMIRequests
{
  return self->_ignoreLMIRequests;
}

- (void)setIgnoreLMIRequests:(BOOL)a3
{
  self->_ignoreLMIRequests = a3;
}

- (NSUUID)messagesGroupUUID
{
  return self->_messagesGroupUUID;
}

- (void)setMessagesGroupUUID:(id)a3
{
  objc_storeStrong((id *)&self->_messagesGroupUUID, a3);
}

- (TUHandle)initiator
{
  return self->_initiator;
}

- (void)setInitiator:(id)a3
{
  objc_storeStrong((id *)&self->_initiator, a3);
}

- (NSString)messagesGroupName
{
  return self->_messagesGroupName;
}

- (void)setMessagesGroupName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (int64_t)maxVideoDecodesAllowed
{
  return self->_maxVideoDecodesAllowed;
}

- (void)setMaxVideoDecodesAllowed:(int64_t)a3
{
  self->_maxVideoDecodesAllowed = a3;
}

- (NSObject)reportingHierarchyToken
{
  return self->_reportingHierarchyToken;
}

- (void)setReportingHierarchyToken:(id)a3
{
  objc_storeStrong((id *)&self->_reportingHierarchyToken, a3);
}

- (NSObject)reportingHierarchySubToken
{
  return self->_reportingHierarchySubToken;
}

- (void)setReportingHierarchySubToken:(id)a3
{
  objc_storeStrong((id *)&self->_reportingHierarchySubToken, a3);
}

- (BOOL)isOneToOneModeEnabled
{
  return self->_oneToOneModeEnabled;
}

- (void)setOneToOneModeEnabled:(BOOL)a3
{
  self->_oneToOneModeEnabled = a3;
}

- (BOOL)isBackedByGroupSession
{
  return self->_backedByGroupSession;
}

- (void)setBackedByGroupSession:(BOOL)a3
{
  self->_backedByGroupSession = a3;
}

- (NSSet)systemActivitySessions
{
  return self->_systemActivitySessions;
}

- (void)setSystemActivitySessions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 312);
}

- (NSSet)virtualParticipants
{
  return self->_virtualParticipants;
}

- (void)setVirtualParticipants:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 320);
}

- (NSSet)invitationPreferences
{
  return self->_invitationPreferences;
}

- (void)setInvitationPreferences:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 328);
}

- (BOOL)isFromStorage
{
  return self->_fromStorage;
}

- (void)setFromStorage:(BOOL)a3
{
  self->_fromStorage = a3;
}

- (NSUUID)selectiveSharingSessionUUID
{
  return self->_selectiveSharingSessionUUID;
}

- (void)setSelectiveSharingSessionUUID:(id)a3
{
  objc_storeStrong((id *)&self->_selectiveSharingSessionUUID, a3);
}

- (BOOL)isScreening
{
  return self->_screening;
}

- (void)setScreening:(BOOL)a3
{
  self->_screening = a3;
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

- (NSSet)screenSharingRequests
{
  return self->_screenSharingRequests;
}

- (void)setScreenSharingRequests:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 344);
}

- (unint64_t)screenSharingType
{
  return self->_screenSharingType;
}

- (void)setScreenSharingType:(unint64_t)a3
{
  self->_screenSharingType = a3;
}

- (id)conversationFailureContext
{
  return self->_conversationFailureContext;
}

- (void)setConversationFailureContext:(id)a3
{
  objc_storeStrong(&self->_conversationFailureContext, a3);
}

- (TUConversationHandoffContext)handoffContext
{
  return self->_handoffContext;
}

- (void)setHandoffContext:(id)a3
{
  objc_storeStrong((id *)&self->_handoffContext, a3);
}

- (void)setFeatureFlags:(id)a3
{
  objc_storeStrong((id *)&self->_featureFlags, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong((id *)&self->_handoffContext, 0);
  objc_storeStrong(&self->_conversationFailureContext, 0);
  objc_storeStrong((id *)&self->_screenSharingRequests, 0);
  objc_storeStrong((id *)&self->_selectiveSharingSessionUUID, 0);
  objc_storeStrong((id *)&self->_invitationPreferences, 0);
  objc_storeStrong((id *)&self->_virtualParticipants, 0);
  objc_storeStrong((id *)&self->_systemActivitySessions, 0);
  objc_storeStrong((id *)&self->_reportingHierarchySubToken, 0);
  objc_storeStrong((id *)&self->_reportingHierarchyToken, 0);
  objc_storeStrong((id *)&self->_messagesGroupName, 0);
  objc_storeStrong((id *)&self->_initiator, 0);
  objc_storeStrong((id *)&self->_messagesGroupUUID, 0);
  objc_storeStrong((id *)&self->_handoffEligibility, 0);
  objc_storeStrong((id *)&self->_localParticipantAssociation, 0);
  objc_storeStrong((id *)&self->_localMember, 0);
  objc_storeStrong((id *)&self->_avcSessionIdentifier, 0);
  objc_storeStrong((id *)&self->_supportedMediaTypes, 0);
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_highlightIdentifiers, 0);
  objc_storeStrong((id *)&self->_stagedActivitySession, 0);
  objc_storeStrong((id *)&self->_activitySessions, 0);
  objc_storeStrong((id *)&self->_report, 0);
  objc_storeStrong((id *)&self->_activeLightweightParticipants, 0);
  objc_storeStrong((id *)&self->_activeRemoteParticipants, 0);
  objc_storeStrong((id *)&self->_otherInvitedHandles, 0);
  objc_storeStrong((id *)&self->_lightweightMembers, 0);
  objc_storeStrong((id *)&self->_rejectedMembers, 0);
  objc_storeStrong((id *)&self->_kickedMembers, 0);
  objc_storeStrong((id *)&self->_pendingMembers, 0);
  objc_storeStrong((id *)&self->_remoteMembers, 0);
  objc_storeStrong((id *)&self->_participantHandles, 0);
  objc_storeStrong((id *)&self->_link, 0);
  objc_storeStrong((id *)&self->_groupUUID, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

- (void)messagesGroupPhotoData
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSDictionary *LocalIMSPIGetGroupPhotosForChatsWithGroupIDs(NSArray *__strong)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("TUConversation.m"), 42, CFSTR("%s"), dlerror());

  __break(1u);
}

- (void)updateParticipantMediaPrioritiesWithConversation:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_19A50D000, a2, OS_LOG_TYPE_DEBUG, "updateParticipantMediaPrioritiesWithConversation: updatedPriorityParticipants: %@", (uint8_t *)&v2, 0xCu);
}

@end
