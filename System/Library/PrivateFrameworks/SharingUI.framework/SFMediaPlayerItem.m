@implementation SFMediaPlayerItem

- (SFMediaPlayerItem)initWithURL:(id)a3
{
  id v5;
  SFMediaPlayerItem *v6;
  SFMediaPlayerItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SFMediaPlayerItem;
  v6 = -[SFMediaPlayerItem init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_url, a3);

  return v7;
}

- (void)setPlaybackNotificationTimeRanges:(id)a3 withTimeRangeHandler:(id)a4
{
  id v6;
  NSArray *v7;
  NSArray *playbackNotificationTimeRanges;
  void *v9;
  id timeRangeHandler;

  v6 = a4;
  v7 = (NSArray *)objc_msgSend(a3, "copy");
  playbackNotificationTimeRanges = self->_playbackNotificationTimeRanges;
  self->_playbackNotificationTimeRanges = v7;

  v9 = (void *)objc_msgSend(v6, "copy");
  timeRangeHandler = self->_timeRangeHandler;
  self->_timeRangeHandler = v9;

}

- (void)setPlayerItem:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  -[SFMediaPlayerItem playerItems](self, "playerItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

  -[SFMediaPlayerItem playerItems](self, "playerItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = (void *)objc_opt_new();
    -[SFMediaPlayerItem setPlayerItems:](self, "setPlayerItems:", v6);

  }
  -[SFMediaPlayerItem playerItems](self, "playerItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v12);

  if (-[SFMediaPlayerItem shouldLoop](self, "shouldLoop"))
  {
    -[SFMediaPlayerItem playerItems](self, "playerItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v12, "copy");
    objc_msgSend(v8, "addObject:", v9);

    -[SFMediaPlayerItem playerItems](self, "playerItems");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v12, "copy");
    objc_msgSend(v10, "addObject:", v11);

  }
}

- (void)invalidate
{
  id timeRangeHandler;
  id startedHandler;
  id completedHandler;

  timeRangeHandler = self->_timeRangeHandler;
  self->_timeRangeHandler = 0;

  startedHandler = self->_startedHandler;
  self->_startedHandler = 0;

  completedHandler = self->_completedHandler;
  self->_completedHandler = 0;

}

- (id)description
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  v11 = objc_opt_class();
  NSAppendPrintF();
  v14 = 0;
  -[NSURL path](self->_url, "path", v11, self);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  NSAppendPrintF();
  v3 = v14;

  if (-[NSMutableArray count](self->_playerItems, "count", v12))
  {
    -[NSMutableArray firstObject](self->_playerItems, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF();
    v4 = v3;

    v3 = v4;
  }
  if (self->_shouldLoop)
  {
    NSAppendPrintF();
    v5 = v3;

    v3 = v5;
  }
  if (-[NSArray count](self->_playbackNotificationTimeRanges, "count", v13))
  {
    -[NSArray count](self->_playbackNotificationTimeRanges, "count");
    NSAppendPrintF();
    v6 = v3;

    v3 = v6;
  }
  if (self->_startedHandler)
  {
    NSAppendPrintF();
    v7 = v3;

    v3 = v7;
  }
  if (self->_completedHandler)
  {
    NSAppendPrintF();
    v8 = v3;

    v3 = v8;
  }
  NSAppendPrintF();
  v9 = v3;

  return v9;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[SFMediaPlayerItem url](self, "url");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  SFMediaPlayerItem *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;

  if (self == a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v4 = self;
      -[SFMediaPlayerItem url](v4, "url");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFMediaPlayerItem url](v4, "url");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v5;
      v8 = v6;
      v9 = v8;
      if (v7 != v8 && (v7 == 0) != (v8 != 0))
        objc_msgSend(v7, "isEqual:", v8);

      -[SFMediaPlayerItem shouldLoop](v4, "shouldLoop");
      -[SFMediaPlayerItem shouldLoop](v4, "shouldLoop");

    }
  }
  return 0;
}

- (NSURL)url
{
  return self->_url;
}

- (BOOL)shouldLoop
{
  return self->_shouldLoop;
}

- (void)setShouldLoop:(BOOL)a3
{
  self->_shouldLoop = a3;
}

- (NSArray)playbackNotificationTimeRanges
{
  return self->_playbackNotificationTimeRanges;
}

- (id)timeRangeHandler
{
  return self->_timeRangeHandler;
}

- (id)startedHandler
{
  return self->_startedHandler;
}

- (void)setStartedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)completedHandler
{
  return self->_completedHandler;
}

- (void)setCompletedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSMutableArray)playerItems
{
  return self->_playerItems;
}

- (void)setPlayerItems:(id)a3
{
  objc_storeStrong((id *)&self->_playerItems, a3);
}

- (id)observerToken
{
  return self->_observerToken;
}

- (void)setObserverToken:(id)a3
{
  objc_storeStrong(&self->_observerToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_observerToken, 0);
  objc_storeStrong((id *)&self->_playerItems, 0);
  objc_storeStrong(&self->_completedHandler, 0);
  objc_storeStrong(&self->_startedHandler, 0);
  objc_storeStrong(&self->_timeRangeHandler, 0);
  objc_storeStrong((id *)&self->_playbackNotificationTimeRanges, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
