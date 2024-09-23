@implementation GKChallengeInvite

- (GKChallengeInvite)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  GKChallengeInvite *v6;
  id v7;
  uint64_t v8;
  GKPlayerInternal *receivingPlayer;
  uint64_t v10;
  id v11;
  uint64_t v12;
  GKPlayerInternal *issuingPlayer;
  uint64_t v14;
  id v15;
  uint64_t v16;
  GKChallengeInternal *challenge;
  uint64_t v18;
  id v19;
  uint64_t v20;
  NSString *goalText;
  uint64_t v22;
  id v23;
  uint64_t v24;
  NSString *gameTitle;
  uint64_t v26;
  id v27;
  uint64_t v28;
  NSString *resolvedBundleID;
  uint64_t v30;
  id v31;
  uint64_t v32;
  NSString *challengeID;
  objc_super v35;

  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)GKChallengeInvite;
  v6 = -[GKChallengeInvite init](&v35, "init");
  if (v6)
  {
    v7 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(GKPlayerInternal, v5), CFSTR("receivingPlayer"));
    v8 = objc_claimAutoreleasedReturnValue(v7);
    receivingPlayer = v6->_receivingPlayer;
    v6->_receivingPlayer = (GKPlayerInternal *)v8;

    v11 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(GKPlayerInternal, v10), CFSTR("issuingPlayer"));
    v12 = objc_claimAutoreleasedReturnValue(v11);
    issuingPlayer = v6->_issuingPlayer;
    v6->_issuingPlayer = (GKPlayerInternal *)v12;

    v15 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(GKChallengeInternal, v14), CFSTR("challenge"));
    v16 = objc_claimAutoreleasedReturnValue(v15);
    challenge = v6->_challenge;
    v6->_challenge = (GKChallengeInternal *)v16;

    v19 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v18), CFSTR("goalText"));
    v20 = objc_claimAutoreleasedReturnValue(v19);
    goalText = v6->_goalText;
    v6->_goalText = (NSString *)v20;

    v23 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v22), CFSTR("gameTitle"));
    v24 = objc_claimAutoreleasedReturnValue(v23);
    gameTitle = v6->_gameTitle;
    v6->_gameTitle = (NSString *)v24;

    v27 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v26), CFSTR("resolvedBundleID"));
    v28 = objc_claimAutoreleasedReturnValue(v27);
    resolvedBundleID = v6->_resolvedBundleID;
    v6->_resolvedBundleID = (NSString *)v28;

    v31 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v30), CFSTR("challengeID"));
    v32 = objc_claimAutoreleasedReturnValue(v31);
    challengeID = v6->_challengeID;
    v6->_challengeID = (NSString *)v32;

  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  GKPlayerInternal *receivingPlayer;
  id v5;

  receivingPlayer = self->_receivingPlayer;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", receivingPlayer, CFSTR("receivingPlayer"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_issuingPlayer, CFSTR("issuingPlayer"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_challenge, CFSTR("challenge"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_goalText, CFSTR("goalText"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_gameTitle, CFSTR("gameTitle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_resolvedBundleID, CFSTR("resolvedBundleID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_challengeID, CFSTR("challengeID"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeInvite pushDescriptor](self, "pushDescriptor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("GKChallengeInvite: %@"), v2));

  return v3;
}

- (id)challengeInternalObject
{
  return 0;
}

- (GKChallengeInvite)initWithChallenge:(id)a3
{
  id v5;
  GKChallengeInvite *v6;
  GKChallengeInvite *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GKChallengeInvite;
  v6 = -[GKChallengeInvite init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_challenge, a3);

  return v7;
}

- (void)loadDetailsWithHandler:(id)a3
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
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  GKChallengeInvite *v31;
  _QWORD v32[2];

  v23 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKChallengeInvite.m", 101, "-[GKChallengeInvite loadDetailsWithHandler:]"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy gameCenterClient](GKClientProxy, "gameCenterClient"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeInvite challenge](self, "challenge"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "receivingPlayer"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "playerID"));
  v32[0] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeInvite challenge](self, "challenge"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "issuingPlayer"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "playerID"));
  v32[1] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v32, 2));

  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1000F7AF0;
  v28[3] = &unk_1002BB4A0;
  v14 = v6;
  v29 = v14;
  v30 = v13;
  v31 = self;
  v15 = v13;
  objc_msgSend(v5, "perform:", v28);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeInternal bundleID](self->_challenge, "bundleID"));
  -[GKChallengeInvite setResolvedBundleID:](self, "setResolvedBundleID:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeInternal game](self->_challenge, "game"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "name"));
  -[GKChallengeInvite setGameTitle:](self, "setGameTitle:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "replyQueue"));
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1000F7C30;
  v24[3] = &unk_1002BFCC0;
  v24[4] = self;
  v25 = v17;
  v26 = v14;
  v27 = v23;
  v20 = v14;
  v21 = v23;
  v22 = v17;
  objc_msgSend(v5, "notifyOnQueue:block:", v19, v24);

}

- (void)loadGoalTextForGameDescriptor:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  GKChallengeInternal *challenge;
  uint64_t v11;
  uint64_t v12;
  char isKindOfClass;
  uint64_t v14;
  GKChallengeInternal *v15;
  GKChallengeInternal *v16;
  void *v17;
  GKChallengeInternal *v18;
  id *v19;
  id *v20;
  uint64_t v21;
  GKChallengeInternal *v22;
  GKPlayerInternal *receivingPlayer;
  NSObject *v24;
  id v25;
  _QWORD block[4];
  id v27;
  _QWORD *v28;
  _QWORD v29[4];
  GKChallengeInternal *v30;
  _QWORD v31[2];
  _QWORD v32[4];
  GKChallengeInternal *v33;
  _QWORD v34[2];
  _QWORD v35[5];
  id v36;

  v6 = a3;
  v7 = a4;
  v8 = dispatch_group_create();
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x3032000000;
  v35[3] = sub_1000F819C;
  v35[4] = sub_1000F81AC;
  v36 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy gameCenterClient](GKClientProxy, "gameCenterClient"));
  challenge = self->_challenge;
  v12 = objc_opt_class(GKAchievementChallengeInternal, v11);
  isKindOfClass = objc_opt_isKindOfClass(challenge, v12);
  v15 = self->_challenge;
  if ((isKindOfClass & 1) != 0)
  {
    v16 = v15;
    dispatch_group_enter(v8);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[GKService serviceWithTransport:forClient:localPlayer:](GKGameStatService, "serviceWithTransport:forClient:localPlayer:", 0, v9, 0));
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_1000F81B4;
    v32[3] = &unk_1002C2C38;
    v18 = v16;
    v33 = v18;
    v34[1] = v35;
    v34[0] = v8;
    objc_msgSend(v17, "getAchievementDescriptionsForGameDescriptor:handler:", v6, v32);
    v19 = (id *)&v33;
    v20 = (id *)v34;
LABEL_5:

    goto LABEL_6;
  }
  v21 = objc_opt_class(GKScoreChallengeInternal, v14);
  if ((objc_opt_isKindOfClass(v15, v21) & 1) != 0)
  {
    v22 = self->_challenge;
    dispatch_group_enter(v8);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[GKService serviceWithTransport:forClient:localPlayer:](GKGameStatService, "serviceWithTransport:forClient:localPlayer:", 0, v9, 0));
    receivingPlayer = self->_receivingPlayer;
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_1000F8374;
    v29[3] = &unk_1002C2C38;
    v18 = v22;
    v30 = v18;
    v31[1] = v35;
    v31[0] = v8;
    objc_msgSend(v17, "getLeaderboardsForGameDescriptor:player:setIdentifier:handler:", v6, receivingPlayer, 0, v29);
    v19 = (id *)&v30;
    v20 = (id *)v31;
    goto LABEL_5;
  }
LABEL_6:
  v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "replyQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F8594;
  block[3] = &unk_1002C2C60;
  v27 = v7;
  v28 = v35;
  v25 = v7;
  dispatch_group_notify(v8, v24, block);

  _Block_object_dispose(v35, 8);
}

- (GKChallengeInternal)challenge
{
  return self->_challenge;
}

- (void)setChallenge:(id)a3
{
  objc_storeStrong((id *)&self->_challenge, a3);
}

- (GKPlayerInternal)receivingPlayer
{
  return self->_receivingPlayer;
}

- (void)setReceivingPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_receivingPlayer, a3);
}

- (GKPlayerInternal)issuingPlayer
{
  return self->_issuingPlayer;
}

- (void)setIssuingPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_issuingPlayer, a3);
}

- (NSString)goalText
{
  return self->_goalText;
}

- (void)setGoalText:(id)a3
{
  objc_storeStrong((id *)&self->_goalText, a3);
}

- (NSString)gameTitle
{
  return self->_gameTitle;
}

- (void)setGameTitle:(id)a3
{
  objc_storeStrong((id *)&self->_gameTitle, a3);
}

- (NSString)resolvedBundleID
{
  return self->_resolvedBundleID;
}

- (void)setResolvedBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_resolvedBundleID, a3);
}

- (NSString)challengeID
{
  return self->_challengeID;
}

- (void)setChallengeID:(id)a3
{
  objc_storeStrong((id *)&self->_challengeID, a3);
}

- (NSDictionary)pushDescriptor
{
  return self->_pushDescriptor;
}

- (void)setPushDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_pushDescriptor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resolvedBundleID, 0);
  objc_storeStrong((id *)&self->_gameTitle, 0);
  objc_storeStrong((id *)&self->_pushDescriptor, 0);
  objc_storeStrong((id *)&self->_goalText, 0);
  objc_storeStrong((id *)&self->_issuingPlayer, 0);
  objc_storeStrong((id *)&self->_receivingPlayer, 0);
  objc_storeStrong((id *)&self->_challenge, 0);
  objc_storeStrong((id *)&self->_challengeID, 0);
}

@end
