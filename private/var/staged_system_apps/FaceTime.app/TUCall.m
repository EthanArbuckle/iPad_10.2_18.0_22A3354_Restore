@implementation TUCall

- (BOOL)disconnectedReasonRequiresCallBackUI
{
  unsigned int v3;
  unsigned int v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  unsigned int v9;
  id v10;
  NSObject *v11;
  _DWORD v13[2];
  __int16 v14;
  unsigned int v15;
  __int16 v16;
  unsigned int v17;
  __int16 v18;
  unsigned int v19;
  __int16 v20;
  unsigned int v21;
  __int16 v22;
  unsigned int v23;
  __int16 v24;
  unsigned int v25;
  __int16 v26;
  _BOOL4 v27;

  v3 = -[TUCall disconnectedReason](self, "disconnectedReason");
  LOBYTE(v4) = 0;
  if (v3 > 0x18 || ((1 << v3) & 0x1C2C020) == 0)
    return v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "activeConversationForCall:", self));

  if (v6)
  {
    v7 = objc_msgSend(v6, "isOneToOneModeEnabled");
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TUCall remoteParticipantHandles](self, "remoteParticipantHandles"));
    v7 = objc_msgSend(v8, "count") == (id)1;

  }
  v9 = +[PHInCallUIUtilities isSpringBoardPasscodeLocked](PHInCallUIUtilities, "isSpringBoardPasscodeLocked");
  if (!-[TUCall isIncoming](self, "isIncoming"))
  {
    if ((v9 & 1) != 0)
      goto LABEL_8;
LABEL_10:
    v4 = -[TUCall isConversation](self, "isConversation") ^ 1 | v7;
    goto LABEL_11;
  }
  if (((-[TUCall isConnecting](self, "isConnecting") ^ 1 | v9) & 1) == 0)
    goto LABEL_10;
LABEL_8:
  v4 = 0;
LABEL_11:
  v10 = sub_10000E6C4();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v13[0] = 67110912;
    v13[1] = v4;
    v14 = 1024;
    v15 = -[TUCall disconnectedReason](self, "disconnectedReason");
    v16 = 1024;
    v17 = -[TUCall isIncoming](self, "isIncoming");
    v18 = 1024;
    v19 = -[TUCall isConnecting](self, "isConnecting");
    v20 = 1024;
    v21 = v9;
    v22 = 1024;
    v23 = -[TUCall isConversation](self, "isConversation");
    v24 = 1024;
    v25 = v7;
    v26 = 1024;
    v27 = v6 == 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "disconnectedReasonRequiresCallBackUI = %d (disconnectedReason: %d, isIncoming: %d, isConnecting: %d, isSpringBoardPasscodeLocked: %d, isConversation: %d, isOneToOneModeEnabled: %d, conversationIsNil: %d)", (uint8_t *)v13, 0x32u);
  }

  return v4;
}

- (BOOL)disconnectedReasonRequiresCallFailureUI
{
  unsigned int v2;

  v2 = -[TUCall disconnectedReason](self, "disconnectedReason");
  return (v2 < 0x19) & (0x1C24000u >> v2);
}

- (BOOL)shouldShowFailureAlert
{
  void *v3;
  BOOL v4;
  void *v5;

  if (-[TUCall status](self, "status") != 6)
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUCall errorAlertTitle](self, "errorAlertTitle"));
  if (v3)
  {
    v4 = 1;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUCall errorAlertMessage](self, "errorAlertMessage"));
    v4 = v5 != 0;

  }
  return v4;
}

- (BOOL)shouldPlayInCallSounds
{
  unsigned int v3;

  v3 = -[TUCall needsManualInCallSounds](self, "needsManualInCallSounds");
  if (v3)
    LOBYTE(v3) = -[TUCall isEndpointOnCurrentDevice](self, "isEndpointOnCurrentDevice");
  return v3;
}

- (BOOL)hasSendMessageCapability
{
  void *v3;
  BOOL v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUCall provider](self, "provider"));
  if ((objc_msgSend(v3, "isSystemProvider") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUCall sendMessageIntentExtension](self, "sendMessageIntentExtension"));
    v4 = v5 != 0;

  }
  return v4;
}

- (BOOL)supportsSendMessageIntent
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  unsigned __int8 v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  void *v21;
  _BYTE v22[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TUCall provider](self, "provider"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "bundleIdentifier"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "applicationsForUserActivityType:", CFSTR("INSendMessageIntent")));

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v11 = sub_10000E6C4();
        v12 = objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v21 = v10;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "application %@", buf, 0xCu);
        }

        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bundleIdentifier"));
        v14 = objc_msgSend(v13, "isEqualToString:", v3);

        if ((v14 & 1) != 0)
        {
          LOBYTE(v7) = 1;
          goto LABEL_13;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_13:

  return (char)v7;
}

- (BOOL)hasSendCustomMessageCapability
{
  void *v3;
  BOOL v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUCall provider](self, "provider"));
  if ((objc_msgSend(v3, "isSystemProvider") & 1) != 0)
    v4 = 1;
  else
    v4 = -[TUCall supportsSendMessageIntent](self, "supportsSendMessageIntent");

  return v4;
}

- (id)sendMessageIntentExtension
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  dispatch_semaphore_t v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void **v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *, void *);
  void *v24;
  NSObject *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  TUCall *v36;
  const __CFString *v37;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUCall provider](self, "provider"));
  if (objc_msgSend(v3, "isSystemProvider"))
  {

LABEL_13:
    v19 = 0;
    return v19;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TUCall provider](self, "provider"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bundleURL"));

  if (!v5)
    goto LABEL_13;
  if (qword_1000A3730 != -1)
    dispatch_once(&qword_1000A3730, &stru_100089CA0);
  if ((objc_msgSend((id)qword_1000A3720, "containsObject:", self) & 1) == 0)
  {
    objc_msgSend((id)qword_1000A3720, "addObject:", self);
    v37 = CFSTR("INSendMessageIntent");
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v37, 1));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSExtension _intents_extensionMatchingAttributesForIntents:](NSExtension, "_intents_extensionMatchingAttributesForIntents:", v6));
    v8 = objc_msgSend(v7, "mutableCopy");

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TUCall provider](self, "provider"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bundleURL"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "path"));
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, NSExtensionContainingAppName);

    v27 = 0;
    v28 = &v27;
    v29 = 0x3032000000;
    v30 = sub_100023F34;
    v31 = sub_100023F44;
    v32 = 0;
    v12 = dispatch_semaphore_create(0);
    v13 = sub_10000E6C4();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v34 = v8;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Looking up send message intent extension using attributes: %@", buf, 0xCu);
    }

    v21 = _NSConcreteStackBlock;
    v22 = 3221225472;
    v23 = sub_100023F4C;
    v24 = &unk_100089CC8;
    v26 = &v27;
    v15 = v12;
    v25 = v15;
    +[NSExtension extensionsWithMatchingAttributes:completion:](NSExtension, "extensionsWithMatchingAttributes:completion:", v8, &v21);
    dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
    v16 = sub_10000E6C4();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = (void *)v28[5];
      *(_DWORD *)buf = 138412546;
      v34 = v18;
      v35 = 2112;
      v36 = self;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Found send message intent extension %@ for call %@", buf, 0x16u);
    }

    objc_msgSend((id)qword_1000A3728, "setObject:forKey:", v28[5], self, v21, v22, v23, v24);
    _Block_object_dispose(&v27, 8);

  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1000A3728, "objectForKey:", self));
  return v19;
}

@end
