@implementation GKTurnBasedExchangeInternal

- (void)updateWithCacheObject:(id)a3
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
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[4];
  id v32;

  v4 = a3;
  current_queue = dispatch_get_current_queue();
  v6 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v6, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "-[GKTurnBasedExchangeInternal(Cache) updateWithCacheObject:]", v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/GKInternalRepresentation+Cache.m"));
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lastPathComponent")));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v8, "-[GKTurnBasedExchangeInternal(Cache) updateWithCacheObject:]", objc_msgSend(v10, "UTF8String"), 406));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v11);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "session"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "participants"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "recipients"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "array"));
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_10011CE2C;
  v31[3] = &unk_1002C3EA8;
  v32 = v13;
  v16 = v13;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "_gkMapWithBlock:", v31));
  -[GKTurnBasedExchangeInternal setRecipientIndexes:](self, "setRecipientIndexes:", v17);

  -[GKTurnBasedExchangeInternal setSenderIndex:](self, "setSenderIndex:", objc_msgSend(v4, "senderIndex"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "exchangeID"));
  -[GKTurnBasedExchangeInternal setExchangeID:](self, "setExchangeID:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "statusString"));
  -[GKTurnBasedExchangeInternal setStatusString:](self, "setStatusString:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "data"));
  -[GKTurnBasedExchangeInternal setData:](self, "setData:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizableMessage"));
  v23 = +[NSPropertyListSerialization _gkTypesafePropertyListWithData:withClass:](NSPropertyListSerialization, "_gkTypesafePropertyListWithData:withClass:", v21, objc_opt_class(NSDictionary, v22));
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  -[GKTurnBasedExchangeInternal setLocalizableMessage:](self, "setLocalizableMessage:", v24);

  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sendDate"));
  -[GKTurnBasedExchangeInternal setSendDate:](self, "setSendDate:", v25);

  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "timeoutDate"));
  -[GKTurnBasedExchangeInternal setTimeoutDate:](self, "setTimeoutDate:", v26);

  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "completionDate"));
  -[GKTurnBasedExchangeInternal setCompletionDate:](self, "setCompletionDate:", v27);

  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "replies"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "array"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "_gkMapWithBlock:", &stru_1002C3F50));
  -[GKTurnBasedExchangeInternal setReplies:](self, "setReplies:", v30);

}

@end
