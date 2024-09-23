@implementation FMFStatusCommand

- (FMFStatusCommand)initWithClientSession:(id)a3 handles:(id)a4 groupId:(id)a5
{
  id v8;
  id v9;
  FMFStatusCommand *v10;
  FMFStatusCommand *v11;
  objc_super v13;

  v8 = a4;
  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)FMFStatusCommand;
  v10 = -[FMFBaseCmd initWithClientSession:](&v13, "initWithClientSession:", a3);
  v11 = v10;
  if (v8 && v10)
  {
    -[FMFStatusCommand setHandles:](v10, "setHandles:", v8);
    -[FMFBaseCmd setGroupId:](v11, "setGroupId:", v9);
  }
  else
  {
    -[FMFBaseCmd initFailed](v10, "initFailed");

    v11 = 0;
  }

  return v11;
}

- (id)pathSuffix
{
  return CFSTR("status");
}

- (id)jsonBodyDictionary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  objc_super v18;
  _BYTE v19[128];

  v18.receiver = self;
  v18.super_class = (Class)FMFStatusCommand;
  v3 = -[FMFBaseCmd jsonBodyDictionary](&v18, "jsonBodyDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMFStatusCommand handles](self, "handles", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v10), "identifier"));
        objc_msgSend(v5, "addObject:", v11);

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    }
    while (v8);
  }

  objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("handles"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[FMFBaseCmd groupId](self, "groupId"));
  objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("groupId"));

  return v4;
}

- (void)processCommandResponse:(id)a3
{
  id v4;
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
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)FMFStatusCommand;
  v4 = a3;
  -[FMFBaseCmd processCommandResponse:](&v18, "processCommandResponse:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("commandResponse"), v18.receiver, v18.super_class));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("follower")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  if (v6 == v7)
  {
    -[FMFStatusCommand setFollower:](self, "setFollower:", 0);
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("follower")));
    -[FMFStatusCommand setFollower:](self, "setFollower:", v8);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("following")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  if (v9 == v10)
  {
    -[FMFStatusCommand setFollowing:](self, "setFollowing:", 0);
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("following")));
    -[FMFStatusCommand setFollowing:](self, "setFollowing:", v11);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("offerPending")));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  if (v12 == v13)
  {
    -[FMFStatusCommand setOfferPending:](self, "setOfferPending:", 0);
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("offerPending")));
    -[FMFStatusCommand setOfferPending:](self, "setOfferPending:", v14);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("invitePending")));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  if (v15 == v16)
  {
    -[FMFStatusCommand setInvitePending:](self, "setInvitePending:", 0);
  }
  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("invitePending")));
    -[FMFStatusCommand setInvitePending:](self, "setInvitePending:", v17);

  }
}

- (NSDictionary)following
{
  return self->_following;
}

- (void)setFollowing:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSDictionary)follower
{
  return self->_follower;
}

- (void)setFollower:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSArray)offerPending
{
  return self->_offerPending;
}

- (void)setOfferPending:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSArray)invitePending
{
  return self->_invitePending;
}

- (void)setInvitePending:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSSet)handles
{
  return self->_handles;
}

- (void)setHandles:(id)a3
{
  objc_storeStrong((id *)&self->_handles, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handles, 0);
  objc_storeStrong((id *)&self->_invitePending, 0);
  objc_storeStrong((id *)&self->_offerPending, 0);
  objc_storeStrong((id *)&self->_follower, 0);
  objc_storeStrong((id *)&self->_following, 0);
}

@end
