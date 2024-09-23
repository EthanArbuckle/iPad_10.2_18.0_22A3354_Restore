@implementation KmlTestClientReporter

- (KmlTestClientReporter)init
{
  KmlTestClientReporter *v2;
  uint64_t v3;
  NSMutableSet *callbackInfoSet;
  id friendCompletionHandler;
  id friendInvitationHandler;
  id ownerInvitationRequestHandler;
  id friendInvitationUnusableHandler;
  id crossPlatformSendMessageHandler;
  id friendPasscodeRetryRequestHandler;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)KmlTestClientReporter;
  v2 = -[KmlTestClientReporter init](&v12, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    callbackInfoSet = v2->_callbackInfoSet;
    v2->_callbackInfoSet = (NSMutableSet *)v3;

    friendCompletionHandler = v2->_friendCompletionHandler;
    v2->_friendCompletionHandler = 0;

    friendInvitationHandler = v2->_friendInvitationHandler;
    v2->_friendInvitationHandler = 0;

    ownerInvitationRequestHandler = v2->_ownerInvitationRequestHandler;
    v2->_ownerInvitationRequestHandler = 0;

    friendInvitationUnusableHandler = v2->_friendInvitationUnusableHandler;
    v2->_friendInvitationUnusableHandler = 0;

    crossPlatformSendMessageHandler = v2->_crossPlatformSendMessageHandler;
    v2->_crossPlatformSendMessageHandler = 0;

    friendPasscodeRetryRequestHandler = v2->_friendPasscodeRetryRequestHandler;
    v2->_friendPasscodeRetryRequestHandler = 0;

    *(_QWORD *)&v2->_cleanUpCount = 0;
  }
  return v2;
}

- (void)cleanup
{
  NSMutableSet *callbackInfoSet;
  id friendCompletionHandler;
  id friendInvitationHandler;
  id ownerInvitationRequestHandler;
  id friendInvitationUnusableHandler;
  id crossPlatformSendMessageHandler;
  id friendPasscodeRetryRequestHandler;

  -[NSMutableSet removeAllObjects](self->_callbackInfoSet, "removeAllObjects");
  callbackInfoSet = self->_callbackInfoSet;
  self->_callbackInfoSet = 0;

  *(_QWORD *)&self->_cleanUpCount = 0;
  friendCompletionHandler = self->_friendCompletionHandler;
  self->_friendCompletionHandler = 0;

  friendInvitationHandler = self->_friendInvitationHandler;
  self->_friendInvitationHandler = 0;

  ownerInvitationRequestHandler = self->_ownerInvitationRequestHandler;
  self->_ownerInvitationRequestHandler = 0;

  friendInvitationUnusableHandler = self->_friendInvitationUnusableHandler;
  self->_friendInvitationUnusableHandler = 0;

  crossPlatformSendMessageHandler = self->_crossPlatformSendMessageHandler;
  self->_crossPlatformSendMessageHandler = 0;

  friendPasscodeRetryRequestHandler = self->_friendPasscodeRetryRequestHandler;
  self->_friendPasscodeRetryRequestHandler = 0;

}

- (void)registerFriendSideSharingTestInvitationUUIDHandler:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id friendInvitationHandler;
  uint64_t v11;

  v4 = a3;
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlTestClientReporter registerFriendSideSharingTestInvitationUUIDHandler:]", 162, &stru_100316BD0, v5, v6, v7, v8, v11);
  v9 = objc_retainBlock(v4);

  friendInvitationHandler = self->_friendInvitationHandler;
  self->_friendInvitationHandler = v9;

}

- (void)registerFriendSideSharingTestCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id friendCompletionHandler;
  uint64_t v11;

  v4 = a3;
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlTestClientReporter registerFriendSideSharingTestCompletion:]", 168, &stru_100316BD0, v5, v6, v7, v8, v11);
  v9 = objc_retainBlock(v4);

  friendCompletionHandler = self->_friendCompletionHandler;
  self->_friendCompletionHandler = v9;

}

- (void)registerOwnerSideSharingTestInvitations:(id)a3 callback:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  KmlTestClientCallbackInfo *v14;

  v6 = a4;
  v7 = a3;
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlTestClientReporter registerOwnerSideSharingTestInvitations:callback:]", 174, &stru_100316BD0, v8, v9, v10, v11, v13);
  v14 = objc_alloc_init(KmlTestClientCallbackInfo);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[KmlTestClientCallbackInfo invitationSet](v14, "invitationSet"));
  objc_msgSend(v12, "addObjectsFromArray:", v7);

  -[KmlTestClientCallbackInfo setOwnerCompletionHandler:](v14, "setOwnerCompletionHandler:", v6);
  -[NSMutableSet addObject:](self->_callbackInfoSet, "addObject:", v14);
  ++self->_totalCallbacks;

}

- (void)registerOwnerSideInvitationRequestHandler:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id ownerInvitationRequestHandler;
  uint64_t v11;

  v4 = a3;
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlTestClientReporter registerOwnerSideInvitationRequestHandler:]", 184, &stru_100316BD0, v5, v6, v7, v8, v11);
  v9 = objc_retainBlock(v4);

  ownerInvitationRequestHandler = self->_ownerInvitationRequestHandler;
  self->_ownerInvitationRequestHandler = v9;

}

- (void)registerFriendSideInvitationUnusableHandler:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id friendInvitationUnusableHandler;
  uint64_t v11;

  v4 = a3;
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlTestClientReporter registerFriendSideInvitationUnusableHandler:]", 190, &stru_100316BD0, v5, v6, v7, v8, v11);
  v9 = objc_retainBlock(v4);

  friendInvitationUnusableHandler = self->_friendInvitationUnusableHandler;
  self->_friendInvitationUnusableHandler = v9;

}

- (void)registerFriendSidePasscodeRetryRequestHandler:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id friendPasscodeRetryRequestHandler;
  uint64_t v11;

  v4 = a3;
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlTestClientReporter registerFriendSidePasscodeRetryRequestHandler:]", 196, &stru_100316BD0, v5, v6, v7, v8, v11);
  v9 = objc_retainBlock(v4);

  friendPasscodeRetryRequestHandler = self->_friendPasscodeRetryRequestHandler;
  self->_friendPasscodeRetryRequestHandler = v9;

}

- (void)registerCrossPlatformMessageSendHandler:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id crossPlatformSendMessageHandler;
  uint64_t v11;

  v4 = a3;
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlTestClientReporter registerCrossPlatformMessageSendHandler:]", 202, &stru_100316BD0, v5, v6, v7, v8, v11);
  v9 = objc_retainBlock(v4);

  crossPlatformSendMessageHandler = self->_crossPlatformSendMessageHandler;
  self->_crossPlatformSendMessageHandler = v9;

}

- (void)didReceiveSharingInvitationWithIdentifier:(id)a3 uuid:(id)a4 metadata:(id)a5 ownerIdsId:(id)a6
{
  uint64_t v6;
  uint64_t v7;
  void (**friendInvitationHandler)(id, id, id, id);
  uint64_t v9;

  friendInvitationHandler = (void (**)(id, id, id, id))self->_friendInvitationHandler;
  if (friendInvitationHandler)
    friendInvitationHandler[2](friendInvitationHandler, a3, a4, a5);
  else
    KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlTestClientReporter didReceiveSharingInvitationWithIdentifier:uuid:metadata:ownerIdsId:]", 209, CFSTR("A callback is not registered. Can't report to test client"), (uint64_t)a5, (uint64_t)a6, v6, v7, v9);
}

- (void)finishedSharingForKey:(id)a3 result:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (**friendCompletionHandler)(id, id, id);
  uint64_t v9;

  friendCompletionHandler = (void (**)(id, id, id))self->_friendCompletionHandler;
  if (friendCompletionHandler)
    friendCompletionHandler[2](friendCompletionHandler, a3, a4);
  else
    KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlTestClientReporter finishedSharingForKey:result:]", 219, CFSTR("A callback is not registered. Can't report to test client"), v4, v5, v6, v7, v9);
}

- (void)reportUnusableInvitation:(id)a3 reason:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (**friendInvitationUnusableHandler)(id, id, id);
  uint64_t v9;

  friendInvitationUnusableHandler = (void (**)(id, id, id))self->_friendInvitationUnusableHandler;
  if (friendInvitationUnusableHandler)
    friendInvitationUnusableHandler[2](friendInvitationUnusableHandler, a3, a4);
  else
    KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlTestClientReporter reportUnusableInvitation:reason:]", 230, CFSTR("A callback is not registered. Can't report to test client"), v4, v5, v6, v7, v9);
}

- (void)requestAuthorizationForSharingInvitationIdentifier:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlTestClientReporter requestAuthorizationForSharingInvitationIdentifier:]", 239, CFSTR("Not implemented"), v3, v4, v5, v6, v7);
}

- (void)sharingCompleteForInvitationIdentifier:(id)a3 friendKeyIdentifier:(id)a4 status:(id)a5
{
  id v8;
  __CFString *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSMutableSet *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  unsigned __int8 v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const __CFString *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void (**v37)(_QWORD, _QWORD);
  void *v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];

  v8 = a3;
  v9 = (__CFString *)a4;
  v10 = a5;
  if (-[NSMutableSet count](self->_callbackInfoSet, "count"))
  {
    v41 = v10;
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v15 = self->_callbackInfoSet;
    v16 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v43;
LABEL_4:
      v19 = 0;
      while (1)
      {
        if (*(_QWORD *)v43 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v19);
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "invitationSet"));
        v22 = objc_msgSend(v21, "containsObject:", v8);

        if ((v22 & 1) != 0)
          break;
        if (v17 == (id)++v19)
        {
          v17 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
          if (v17)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
      v23 = v20;

      if (!v23)
        goto LABEL_17;
      v10 = v41;
      KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlTestClientReporter sharingCompleteForInvitationIdentifier:friendKeyIdentifier:status:]", 257, CFSTR("Sharing completed for Invitation ID: %@, friend key Id : %@, error: %@"), v24, v25, v26, v27, (uint64_t)v8);
      if (v9)
        v28 = v9;
      else
        v28 = CFSTR("null");
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "results"));
      objc_msgSend(v29, "setObject:forKeyedSubscript:", v28, v8);

      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "invitationSet"));
      objc_msgSend(v30, "removeObject:", v8);

      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "invitationSet"));
      v32 = objc_msgSend(v31, "count");

      if (!v32)
      {
        KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlTestClientReporter sharingCompleteForInvitationIdentifier:friendKeyIdentifier:status:]", 261, CFSTR("Heard from all invitiations. Reporting back"), v33, v34, v35, v36, v40);
        v37 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "ownerCompletionHandler"));
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "results"));
        ((void (**)(_QWORD, void *))v37)[2](v37, v38);

        -[NSMutableSet removeObject:](self->_callbackInfoSet, "removeObject:", v23);
      }
    }
    else
    {
LABEL_10:

      v23 = 0;
LABEL_17:
      v10 = v41;
    }

  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlTestClientReporter sharingCompleteForInvitationIdentifier:friendKeyIdentifier:status:]", 245, CFSTR("A callback is not registered. Can't report to test client"), v11, v12, v13, v14, v39);
  }

}

- (BOOL)didReceiveInvitationRequestWithUuid:(id)a3 ownerKeyIdentifier:(id)a4 friendKeyIdentifier:(id)a5 targetType:(int64_t)a6
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (**ownerInvitationRequestHandler)(id, id, id, id);
  uint64_t v22;
  uint64_t v23;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlTestClientReporter didReceiveInvitationRequestWithUuid:ownerKeyIdentifier:friendKeyIdentifier:targetType:]", 270, &stru_100316BD0, v12, v13, v14, v15, v22);
  ownerInvitationRequestHandler = (void (**)(id, id, id, id))self->_ownerInvitationRequestHandler;
  if (ownerInvitationRequestHandler)
    ownerInvitationRequestHandler[2](ownerInvitationRequestHandler, v9, v10, v11);
  else
    KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlTestClientReporter didReceiveInvitationRequestWithUuid:ownerKeyIdentifier:friendKeyIdentifier:targetType:]", 272, CFSTR("A callback is not registered. Can't report to test client"), v16, v17, v18, v19, v23);

  return ownerInvitationRequestHandler != 0;
}

- (void)sendCrossPlatformSharingMessage:(id)a3 toMailboxIdentifier:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  id v22;

  v6 = a4;
  v7 = a3;
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlTestClientReporter sendCrossPlatformSharingMessage:toMailboxIdentifier:]", 282, CFSTR("Message to send: %@"), v8, v9, v10, v11, (uint64_t)v7);
  v22 = 0;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "encodeWithError:", &v22));

  v13 = v22;
  v18 = v13;
  if (v13)
  {
    KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlTestClientReporter sendCrossPlatformSharingMessage:toMailboxIdentifier:]", 294, CFSTR("Failed to encode message with - %@"), v14, v15, v16, v17, (uint64_t)v13);
  }
  else if (self->_crossPlatformSendMessageHandler)
  {
    KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlTestClientReporter sendCrossPlatformSharingMessage:toMailboxIdentifier:]", 287, CFSTR("Cross platform send handler available"), v14, v15, v16, v17, v21);
    (*((void (**)(void))self->_crossPlatformSendMessageHandler + 2))();
  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlTestClientReporter sendCrossPlatformSharingMessage:toMailboxIdentifier:]", 290, CFSTR("Use Mock Cross platform channel over IDS"), v14, v15, v16, v17, v21);
    v19 = sub_1002342C4((uint64_t)KmlSharingTransport);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    sub_10023506C((uint64_t)v20, v12, v6);

  }
}

- (void)passcodeRetryRequestedFor:(id)a3 retriesLeft:(unint64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (**friendPasscodeRetryRequestHandler)(id, id, unint64_t);
  uint64_t v9;

  friendPasscodeRetryRequestHandler = (void (**)(id, id, unint64_t))self->_friendPasscodeRetryRequestHandler;
  if (friendPasscodeRetryRequestHandler)
    friendPasscodeRetryRequestHandler[2](friendPasscodeRetryRequestHandler, a3, a4);
  else
    KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlTestClientReporter passcodeRetryRequestedFor:retriesLeft:]", 301, CFSTR("A callback is not registered. Can't report to test client"), v4, v5, v6, v7, v9);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_friendPasscodeRetryRequestHandler, 0);
  objc_storeStrong(&self->_crossPlatformSendMessageHandler, 0);
  objc_storeStrong(&self->_friendInvitationUnusableHandler, 0);
  objc_storeStrong(&self->_ownerInvitationRequestHandler, 0);
  objc_storeStrong(&self->_friendInvitationHandler, 0);
  objc_storeStrong(&self->_friendCompletionHandler, 0);
  objc_storeStrong((id *)&self->_callbackInfoSet, 0);
}

@end
