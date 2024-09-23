@implementation FMFRespondToInviteCommand

- (FMFRespondToInviteCommand)initWithClientSession:(id)a3 friendRequestId:(id)a4 accepted:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  FMFRespondToInviteCommand *v9;
  FMFRespondToInviteCommand *v10;
  objc_super v12;

  v5 = a5;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FMFRespondToInviteCommand;
  v9 = -[FMFBaseCmd initWithClientSession:](&v12, "initWithClientSession:", a3);
  v10 = v9;
  if (v8 && v9)
  {
    -[FMFRespondToInviteCommand setFriendRequestId:](v9, "setFriendRequestId:", v8);
    -[FMFRespondToInviteCommand setAccepted:](v10, "setAccepted:", v5);
  }
  else
  {
    -[FMFBaseCmd initFailed](v9, "initFailed");

    v10 = 0;
  }

  return v10;
}

- (id)pathSuffix
{
  return CFSTR("inviteResponse");
}

- (id)jsonBodyDictionary
{
  id v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)FMFRespondToInviteCommand;
  v3 = -[FMFBaseCmd jsonBodyDictionary](&v8, "jsonBodyDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMFRespondToInviteCommand friendRequestId](self, "friendRequestId"));
  objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("id"));

  if (-[FMFRespondToInviteCommand accepted](self, "accepted"))
    v6 = CFSTR("true");
  else
    v6 = CFSTR("false");
  objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("accepted"));
  return v4;
}

- (BOOL)isUserAction
{
  return 1;
}

- (NSString)friendRequestId
{
  return self->_friendRequestId;
}

- (void)setFriendRequestId:(id)a3
{
  objc_storeStrong((id *)&self->_friendRequestId, a3);
}

- (BOOL)accepted
{
  return self->_accepted;
}

- (void)setAccepted:(BOOL)a3
{
  self->_accepted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_friendRequestId, 0);
}

@end
