@implementation CHFriendManager

- (CHFriendManager)initWithActivitySharingClient:(id)a3
{
  id v5;
  CHFriendManager *v6;
  CHFriendManager *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CHFriendManager;
  v6 = -[CHFriendManager init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_activitySharingClient, a3);

  return v7;
}

- (void)cloudKitAccountStatusWithCompletion:(id)a3
{
  id v4;
  ASActivitySharingClient *activitySharingClient;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  activitySharingClient = self->_activitySharingClient;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10004C4C4;
  v7[3] = &unk_100779F58;
  v8 = v4;
  v6 = v4;
  -[ASActivitySharingClient isCloudKitAccountActiveWithCompletion:](activitySharingClient, "isCloudKitAccountActiveWithCompletion:", v7);

}

- (void)sendInviteToRecipient:(id)a3 callerID:(id)a4 serviceIdentifier:(id)a5 withCompletion:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, _QWORD, id);
  void *v13;
  NSObject *v14;
  id v15;
  id v16;

  v10 = a4;
  v11 = a5;
  v12 = (void (**)(id, _QWORD, id))a6;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "address"));
  if (!v13)
  {
    ASLoggingInitialize(0);
    v14 = ASLogDefault;
    if (os_log_type_enabled(ASLogDefault, OS_LOG_TYPE_ERROR))
    {
      sub_1005F31A8(v14);
      if (!v12)
        goto LABEL_6;
    }
    else if (!v12)
    {
      goto LABEL_6;
    }
    v15 = objc_alloc((Class)NSError);
    v16 = objc_msgSend(v15, "initWithDomain:code:userInfo:", kASDomain, 0, 0);
    v12[2](v12, 0, v16);

    goto LABEL_6;
  }
  -[ASActivitySharingClient sendFriendInviteToDestination:callerID:serviceIdentifier:completion:](self->_activitySharingClient, "sendFriendInviteToDestination:callerID:serviceIdentifier:completion:", v13, v10, v11, v12);
LABEL_6:

}

- (void)setActivityDataVisible:(BOOL)a3 toFriend:(id)a4 completion:(id)a5
{
  _BOOL8 v6;
  ASActivitySharingClient *activitySharingClient;
  id v8;
  void *v9;
  id v10;

  v6 = a3;
  activitySharingClient = self->_activitySharingClient;
  v8 = a5;
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "UUID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "UUIDString"));
  -[ASActivitySharingClient setActivityDataVisible:friendUUID:completion:](activitySharingClient, "setActivityDataVisible:friendUUID:completion:", v6, v9, v8);

}

- (void)setMuteEnabled:(BOOL)a3 forFriend:(id)a4 completion:(id)a5
{
  _BOOL8 v6;
  ASActivitySharingClient *activitySharingClient;
  id v8;
  void *v9;
  id v10;

  v6 = a3;
  activitySharingClient = self->_activitySharingClient;
  v8 = a5;
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "UUID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "UUIDString"));
  -[ASActivitySharingClient setMuteEnabled:friendUUID:completion:](activitySharingClient, "setMuteEnabled:friendUUID:completion:", v6, v9, v8);

}

- (void)removeFriend:(id)a3 completion:(id)a4
{
  ASActivitySharingClient *activitySharingClient;
  id v6;
  void *v7;
  id v8;

  activitySharingClient = self->_activitySharingClient;
  v6 = a4;
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "UUID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "UUIDString"));
  -[ASActivitySharingClient removeFriendWithUUID:completion:](activitySharingClient, "removeFriendWithUUID:completion:", v7, v6);

}

- (void)acceptInvitationFromFriend:(id)a3 completion:(id)a4
{
  ASActivitySharingClient *activitySharingClient;
  id v6;
  void *v7;
  id v8;

  activitySharingClient = self->_activitySharingClient;
  v6 = a4;
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "UUID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "UUIDString"));
  -[ASActivitySharingClient acceptFriendInviteFromFriendUUID:completion:](activitySharingClient, "acceptFriendInviteFromFriendUUID:completion:", v7, v6);

}

- (void)ignoreInvitationFromFriend:(id)a3 completion:(id)a4
{
  ASActivitySharingClient *activitySharingClient;
  id v6;
  void *v7;
  id v8;

  activitySharingClient = self->_activitySharingClient;
  v6 = a4;
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "UUID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "UUIDString"));
  -[ASActivitySharingClient ignoreFriendInviteFromFriendUUID:completion:](activitySharingClient, "ignoreFriendInviteFromFriendUUID:completion:", v7, v6);

}

- (void)withdrawInvitationToFriend:(id)a3 completion:(id)a4
{
  ASActivitySharingClient *activitySharingClient;
  id v6;
  void *v7;
  id v8;

  activitySharingClient = self->_activitySharingClient;
  v6 = a4;
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "UUID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "UUIDString"));
  -[ASActivitySharingClient withdrawFriendInviteToFriendUUID:completion:](activitySharingClient, "withdrawFriendInviteToFriendUUID:completion:", v7, v6);

}

- (void)sendCompetitionRequestToFriend:(id)a3 completion:(id)a4
{
  ASActivitySharingClient *activitySharingClient;
  id v6;
  void *v7;
  void *v8;

  activitySharingClient = self->_activitySharingClient;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "UUID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "UUIDString"));
  -[ASActivitySharingClient sendCompetitionInviteToFriendUUID:completion:](activitySharingClient, "sendCompetitionInviteToFriendUUID:completion:", v8, v6);

  ASAnalyticsReportCompetitionRequestSendApp();
}

- (void)acceptCompetitionRequestFromFriend:(id)a3 completion:(id)a4
{
  ASActivitySharingClient *activitySharingClient;
  id v6;
  void *v7;
  void *v8;

  activitySharingClient = self->_activitySharingClient;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "UUID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "UUIDString"));
  -[ASActivitySharingClient acceptCompetitionInviteFromFriendUUID:completion:](activitySharingClient, "acceptCompetitionInviteFromFriendUUID:completion:", v8, v6);

  ASAnalyticsReportCompetitionRequestAccept(2);
}

- (void)ignoreCompetitionRequestFromFriend:(id)a3 completion:(id)a4
{
  ASActivitySharingClient *activitySharingClient;
  id v6;
  void *v7;
  void *v8;

  activitySharingClient = self->_activitySharingClient;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "UUID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "UUIDString"));
  -[ASActivitySharingClient ignoreCompetitionInviteFromFriendUUID:completion:](activitySharingClient, "ignoreCompetitionInviteFromFriendUUID:completion:", v8, v6);

  ASAnalyticsReportCompetitionRequestIgnore(2);
}

- (ASActivitySharingClient)activitySharingClient
{
  return self->_activitySharingClient;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activitySharingClient, 0);
}

@end
