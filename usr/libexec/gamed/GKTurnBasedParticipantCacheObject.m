@implementation GKTurnBasedParticipantCacheObject

+ (id)entityName
{
  return CFSTR("TurnBasedParticipant");
}

- (void)updateWithServerRepresentation:(id)a3
{
  id v4;
  dispatch_queue_t current_queue;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
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
  objc_super v24;

  v4 = a3;
  current_queue = dispatch_get_current_queue();
  v6 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v6, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "-[GKTurnBasedParticipantCacheObject updateWithServerRepresentation:]", v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lastPathComponent")));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v8, "-[GKTurnBasedParticipantCacheObject updateWithServerRepresentation:]", objc_msgSend(v10, "UTF8String"), 4064));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v11);
  }

  v24.receiver = self;
  v24.super_class = (Class)GKTurnBasedParticipantCacheObject;
  -[GKCacheObject updateWithServerRepresentation:](&v24, "updateWithServerRepresentation:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("player-id")));
  if (objc_msgSend(v12, "length"))
    v13 = v12;
  else
    v13 = 0;
  -[GKTurnBasedParticipantCacheObject setPlayerID:](self, "setPlayerID:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("invited-by")));

  if (objc_msgSend(v14, "length"))
    v15 = v14;
  else
    v15 = 0;
  -[GKTurnBasedParticipantCacheObject setInvitedBy:](self, "setInvitedBy:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("invite-message")));
  -[GKTurnBasedParticipantCacheObject setInviteMessage:](self, "setInviteMessage:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("player-status-code")));
  -[GKTurnBasedParticipantCacheObject setOutcome:](self, "setOutcome:", objc_msgSend(v17, "integerValue"));

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("player-status")));
  -[GKTurnBasedParticipantCacheObject setStatus:](self, "setStatus:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("guest-id")));
  -[GKTurnBasedParticipantCacheObject setGuestID:](self, "setGuestID:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("player-last-turn-at")));
  if (v20)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate _gkDateFromServerTimestamp:](NSDate, "_gkDateFromServerTimestamp:", v20));
    -[GKTurnBasedParticipantCacheObject setLastTurnDate:](self, "setLastTurnDate:", v21);

  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("player-timeout-at")));
  if (v22)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate _gkDateFromServerTimestamp:](NSDate, "_gkDateFromServerTimestamp:", v22));
    -[GKTurnBasedParticipantCacheObject setTimeoutDate:](self, "setTimeoutDate:", v23);

  }
}

- (id)internalRepresentation
{
  return 0;
}

@end
