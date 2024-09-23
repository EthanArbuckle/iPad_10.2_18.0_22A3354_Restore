@implementation TUIFeedAutoScrollController

- (TUIFeedAutoScrollController)initWithDelegate:(id)a3
{
  id v4;
  TUIFeedAutoScrollController *v5;
  TUIFeedAutoScrollController *v6;
  uint64_t v7;
  NSHashTable *pendingQueries;
  uint64_t v9;
  NSMapTable *animated;
  uint64_t v11;
  NSMapTable *skipVoiceOverFocus;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)TUIFeedAutoScrollController;
  v5 = -[TUIFeedAutoScrollController init](&v14, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = objc_claimAutoreleasedReturnValue(+[NSHashTable hashTableWithOptions:](NSHashTable, "hashTableWithOptions:", 512));
    pendingQueries = v6->_pendingQueries;
    v6->_pendingQueries = (NSHashTable *)v7;

    v9 = objc_claimAutoreleasedReturnValue(+[NSMapTable mapTableWithKeyOptions:valueOptions:](NSMapTable, "mapTableWithKeyOptions:valueOptions:", 512, 5));
    animated = v6->_animated;
    v6->_animated = (NSMapTable *)v9;

    v11 = objc_claimAutoreleasedReturnValue(+[NSMapTable mapTableWithKeyOptions:valueOptions:](NSMapTable, "mapTableWithKeyOptions:valueOptions:", 0, 5));
    skipVoiceOverFocus = v6->_skipVoiceOverFocus;
    v6->_skipVoiceOverFocus = (NSMapTable *)v11;

  }
  return v6;
}

- (void)addScrollQuery:(id)a3 animated:(BOOL)a4 skipVoiceOverFocus:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  NSHashTable *pendingQueries;
  id v9;
  NSMapTable *animated;
  void *v11;
  NSMapTable *skipVoiceOverFocus;
  id v13;

  v5 = a5;
  v6 = a4;
  pendingQueries = self->_pendingQueries;
  v9 = a3;
  -[NSHashTable addObject:](pendingQueries, "addObject:", v9);
  animated = self->_animated;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v6));
  -[NSMapTable setObject:forKey:](animated, "setObject:forKey:", v11, v9);

  skipVoiceOverFocus = self->_skipVoiceOverFocus;
  v13 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v5));
  -[NSMapTable setObject:forKey:](skipVoiceOverFocus, "setObject:forKey:", v13, v9);

}

- (void)invalidateQuery:(id)a3
{
  NSHashTable *pendingQueries;
  id v5;

  pendingQueries = self->_pendingQueries;
  v5 = a3;
  -[NSHashTable removeObject:](pendingQueries, "removeObject:", v5);
  -[NSMapTable removeObjectForKey:](self->_animated, "removeObjectForKey:", v5);
  -[NSMapTable removeObjectForKey:](self->_skipVoiceOverFocus, "removeObjectForKey:", v5);

}

- (void)attemptPendingScrolls
{
  id v3;
  _QWORD v4[5];

  v3 = (id)objc_claimAutoreleasedReturnValue(-[NSHashTable allObjects](self->_pendingQueries, "allObjects"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_79844;
  v4[3] = &unk_23FEB8;
  v4[4] = self;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v4);

}

- (void)invalidatePendingScrolls
{
  -[NSHashTable removeAllObjects](self->_pendingQueries, "removeAllObjects");
  -[NSMapTable removeAllObjects](self->_animated, "removeAllObjects");
}

- (TUIFeedAutoScrollDelegate)delegate
{
  return (TUIFeedAutoScrollDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSHashTable)pendingQueries
{
  return self->_pendingQueries;
}

- (void)setPendingQueries:(id)a3
{
  objc_storeStrong((id *)&self->_pendingQueries, a3);
}

- (NSMapTable)animated
{
  return self->_animated;
}

- (void)setAnimated:(id)a3
{
  objc_storeStrong((id *)&self->_animated, a3);
}

- (NSMapTable)skipVoiceOverFocus
{
  return self->_skipVoiceOverFocus;
}

- (void)setSkipVoiceOverFocus:(id)a3
{
  objc_storeStrong((id *)&self->_skipVoiceOverFocus, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_skipVoiceOverFocus, 0);
  objc_storeStrong((id *)&self->_animated, 0);
  objc_storeStrong((id *)&self->_pendingQueries, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
