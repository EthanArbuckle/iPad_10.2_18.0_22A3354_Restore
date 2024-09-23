@implementation GKFriendCodeDetailInternal

- (id)initWithFriendCodeDetail:(id)a3
{
  id v4;
  GKFriendCodeDetailInternal *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)GKFriendCodeDetailInternal;
  v5 = -[GKFriendCodeDetailInternal init](&v16, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "creatorPlayerId"));
    -[GKFriendCodeDetailInternal setCreatorPlayerID:](v5, "setCreatorPlayerID:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "friendCodeState"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&off_1002DC400, "objectForKeyedSubscript:", v7));

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&off_1002DC400, "objectForKeyedSubscript:", v7));
      -[GKFriendCodeDetailInternal setFriendCodeState:](v5, "setFriendCodeState:", objc_msgSend(v9, "integerValue"));

    }
    else
    {
      -[GKFriendCodeDetailInternal setFriendCodeState:](v5, "setFriendCodeState:", 5);
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "numUses"));
    -[GKFriendCodeDetailInternal setFriendCodeUsageCount:](v5, "setFriendCodeUsageCount:", objc_msgSend(v10, "integerValue"));

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "friendCode"));
    -[GKFriendCodeDetailInternal setFriendCode:](v5, "setFriendCode:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "alreadyUsedPlayerIds"));
    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "alreadyUsedPlayerIds"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "componentsSeparatedByString:", CFSTR(",")));
      -[GKFriendCodeDetailInternal setAlreadyUsedPlayerIDs:](v5, "setAlreadyUsedPlayerIDs:", v14);

    }
  }

  return v5;
}

@end
