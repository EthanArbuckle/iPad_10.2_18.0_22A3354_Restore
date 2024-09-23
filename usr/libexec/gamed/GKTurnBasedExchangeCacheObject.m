@implementation GKTurnBasedExchangeCacheObject

+ (id)entityName
{
  return CFSTR("TurnBasedExchange");
}

- (void)updateWithServerRepresentation:(id)a3 participants:(id)a4
{
  id v6;
  dispatch_queue_t current_queue;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  uint64_t v35;
  void *i;
  int64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  id v44;
  id v45;
  uint64_t v46;
  void *j;
  uint64_t v48;
  GKTurnBasedExchangeReplyCacheObject *v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  objc_super v67;
  _BYTE v68[128];
  _BYTE v69[128];

  v6 = a3;
  v58 = a4;
  current_queue = dispatch_get_current_queue();
  v8 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v8, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "-[GKTurnBasedExchangeCacheObject updateWithServerRepresentation:participants:]", v9));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastPathComponent")));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v10, "-[GKTurnBasedExchangeCacheObject updateWithServerRepresentation:participants:]", objc_msgSend(v12, "UTF8String"), 4102));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v13);
  }

  v67.receiver = self;
  v67.super_class = (Class)GKTurnBasedExchangeCacheObject;
  -[GKCacheObject updateWithServerRepresentation:](&v67, "updateWithServerRepresentation:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("request-id")));
  v57 = v14;
  if (objc_msgSend(v14, "length"))
    v15 = v14;
  else
    v15 = 0;
  -[GKTurnBasedExchangeCacheObject setExchangeID:](self, "setExchangeID:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("status")));
  -[GKTurnBasedExchangeCacheObject setStatusString:](self, "setStatusString:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("data")));
  -[GKTurnBasedExchangeCacheObject setData:](self, "setData:", v17);

  v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("message")));
  v56 = (void *)v18;
  if (v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", v18, 100, 0, 0));
    -[GKTurnBasedExchangeCacheObject setLocalizableMessage:](self, "setLocalizableMessage:", v19);

  }
  else
  {
    -[GKTurnBasedExchangeCacheObject setLocalizableMessage:](self, "setLocalizableMessage:", 0);
  }
  v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("sent-at")));
  if (v20)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate _gkDateFromServerTimestamp:](NSDate, "_gkDateFromServerTimestamp:", v20));
    -[GKTurnBasedExchangeCacheObject setSendDate:](self, "setSendDate:", v21);

  }
  v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("timeout-at")));
  if (v22)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate _gkDateFromServerTimestamp:](NSDate, "_gkDateFromServerTimestamp:", v22));
    -[GKTurnBasedExchangeCacheObject setTimeoutDate:](self, "setTimeoutDate:", v23);

  }
  v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("completed-at")));
  if (v24)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate _gkDateFromServerTimestamp:](NSDate, "_gkDateFromServerTimestamp:", v24));
    -[GKTurnBasedExchangeCacheObject setCompletionDate:](self, "setCompletionDate:", v25);

  }
  v53 = (void *)v24;
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("from-slot")));
  v27 = v26;
  if (v26)
    -[GKTurnBasedExchangeCacheObject setSenderIndex:](self, "setSenderIndex:", objc_msgSend(v26, "integerValue"));
  v52 = v27;
  v54 = (void *)v22;
  v55 = (void *)v20;
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("to-slots")));
  if (v28)
  {
    v29 = objc_msgSend(v58, "count");
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableOrderedSet orderedSet](NSMutableOrderedSet, "orderedSet"));
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    v31 = v28;
    v32 = v28;
    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v63, v69, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v64;
      do
      {
        for (i = 0; i != v34; i = (char *)i + 1)
        {
          if (*(_QWORD *)v64 != v35)
            objc_enumerationMutation(v32);
          v37 = (int64_t)objc_msgSend(*(id *)(*((_QWORD *)&v63 + 1) + 8 * (_QWORD)i), "integerValue");
          if ((v37 & 0x8000000000000000) == 0 || v37 < (uint64_t)v29)
          {
            v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "objectAtIndexedSubscript:", v37));
            objc_msgSend(v30, "addObject:", v38);

          }
        }
        v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v63, v69, 16);
      }
      while (v34);
    }

    -[GKTurnBasedExchangeCacheObject setRecipients:](self, "setRecipients:", v30);
    v28 = v31;
  }
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[GKTurnBasedExchangeCacheObject managedObjectContext](self, "managedObjectContext"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[GKTurnBasedExchangeCacheObject replies](self, "replies"));
  objc_msgSend(v39, "_gkDeleteObjects:", v40);

  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("replies")));
  if (objc_msgSend(v41, "count"))
  {
    v50 = v28;
    v51 = v6;
    v42 = objc_msgSend(objc_alloc((Class)NSMutableOrderedSet), "initWithCapacity:", objc_msgSend(v41, "count"));
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v43 = v41;
    v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v59, v68, 16);
    if (v44)
    {
      v45 = v44;
      v46 = *(_QWORD *)v60;
      do
      {
        for (j = 0; j != v45; j = (char *)j + 1)
        {
          if (*(_QWORD *)v60 != v46)
            objc_enumerationMutation(v43);
          v48 = *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * (_QWORD)j);
          v49 = -[GKCacheObject initWithManagedObjectContext:]([GKTurnBasedExchangeReplyCacheObject alloc], "initWithManagedObjectContext:", v39);
          -[GKTurnBasedExchangeReplyCacheObject updateWithServerRepresentation:](v49, "updateWithServerRepresentation:", v48);
          -[GKTurnBasedExchangeReplyCacheObject setExchange:](v49, "setExchange:", self);
          objc_msgSend(v42, "addObject:", v49);

        }
        v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v59, v68, 16);
      }
      while (v45);
    }

    -[GKTurnBasedExchangeCacheObject setReplies:](self, "setReplies:", v42);
    v28 = v50;
    v6 = v51;
  }

}

- (id)internalRepresentation
{
  return 0;
}

@end
