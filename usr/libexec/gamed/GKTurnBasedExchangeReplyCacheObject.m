@implementation GKTurnBasedExchangeReplyCacheObject

+ (id)entityName
{
  return CFSTR("TurnBasedExchangeReply");
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
  objc_super v19;

  v4 = a3;
  current_queue = dispatch_get_current_queue();
  v6 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v6, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "-[GKTurnBasedExchangeReplyCacheObject updateWithServerRepresentation:]", v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lastPathComponent")));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v8, "-[GKTurnBasedExchangeReplyCacheObject updateWithServerRepresentation:]", objc_msgSend(v10, "UTF8String"), 4179));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v11);
  }

  v19.receiver = self;
  v19.super_class = (Class)GKTurnBasedExchangeReplyCacheObject;
  -[GKCacheObject updateWithServerRepresentation:](&v19, "updateWithServerRepresentation:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("slot")));
  v13 = v12;
  if (v12)
    -[GKTurnBasedExchangeReplyCacheObject setRecipientIndex:](self, "setRecipientIndex:", objc_msgSend(v12, "integerValue"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("message")));
  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", v14, 100, 0, 0));
    -[GKTurnBasedExchangeReplyCacheObject setLocalizableMessage:](self, "setLocalizableMessage:", v15);

  }
  else
  {
    -[GKTurnBasedExchangeReplyCacheObject setLocalizableMessage:](self, "setLocalizableMessage:", 0);
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("data")));
  -[GKTurnBasedExchangeReplyCacheObject setData:](self, "setData:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sent-at")));
  if (v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate _gkDateFromServerTimestamp:](NSDate, "_gkDateFromServerTimestamp:", v17));
    -[GKTurnBasedExchangeReplyCacheObject setReplyDate:](self, "setReplyDate:", v18);

  }
}

- (id)internalRepresentation
{
  return 0;
}

@end
