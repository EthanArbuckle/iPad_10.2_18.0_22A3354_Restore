@implementation GKTurnBasedParticipantInternal

- (void)updateWithCacheObject:(id)a3
{
  dispatch_queue_t current_queue;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  current_queue = dispatch_get_current_queue();
  v5 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v5, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "-[GKTurnBasedParticipantInternal(Cache) updateWithCacheObject:]", v6));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/GKInternalRepresentation+Cache.m"));
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastPathComponent")));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v7, "-[GKTurnBasedParticipantInternal(Cache) updateWithCacheObject:]", objc_msgSend(v9, "UTF8String"), 386));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v10);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "session"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "sessionID"));
  -[GKTurnBasedParticipantInternal setSessionID:](self, "setSessionID:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "lastTurnDate"));
  -[GKTurnBasedParticipantInternal setLastTurnDate:](self, "setLastTurnDate:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "timeoutDate"));
  -[GKTurnBasedParticipantInternal setTimeoutDate:](self, "setTimeoutDate:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "inviteMessage"));
  -[GKTurnBasedParticipantInternal setInviteMessage:](self, "setInviteMessage:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "status"));
  -[GKTurnBasedParticipantInternal setStatus:](self, "setStatus:", v16);

  -[GKTurnBasedParticipantInternal setMatchOutcome:](self, "setMatchOutcome:", objc_msgSend(v17, "outcome"));
}

@end
