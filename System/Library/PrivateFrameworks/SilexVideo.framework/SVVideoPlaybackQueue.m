@implementation SVVideoPlaybackQueue

- (SVVideoPlaybackQueue)init
{
  SVVideoPlaybackQueue *v2;
  uint64_t v3;
  NSMutableArray *queue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SVVideoPlaybackQueue;
  v2 = -[SVVideoPlaybackQueue init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    queue = v2->_queue;
    v2->_queue = (NSMutableArray *)v3;

  }
  return v2;
}

- (void)appendItem:(id)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    -[SVVideoPlaybackQueue queue](self, "queue");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v4);

  }
}

- (void)prependItem:(id)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    -[SVVideoPlaybackQueue queue](self, "queue");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "insertObject:atIndex:", v4, 0);

  }
}

- (void)insertItem:(id)a3 afterItem:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  -[SVVideoPlaybackQueue queue](self, "queue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "indexOfObject:", v6);

  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = v8 + 1;
    if (-[SVVideoPlaybackQueue count](self, "count") <= v9)
    {
      -[SVVideoPlaybackQueue appendItem:](self, "appendItem:", v11);
    }
    else
    {
      -[SVVideoPlaybackQueue queue](self, "queue");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "insertObject:atIndex:", v11, v9);

    }
  }

}

- (id)advance
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[SVVideoPlaybackQueue queue](self, "queue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[SVVideoPlaybackQueue queue](self, "queue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

  if (objc_msgSend(v4, "state") == 5)
  {
    -[SVVideoPlaybackQueue advance](self, "advance");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (-[SVVideoPlaybackQueue count](self, "count"))
      objc_msgSend(v4, "addPlaybackObserver:", self);
    v6 = v4;
  }
  v7 = v6;

  return v7;
}

- (unint64_t)count
{
  void *v2;
  unint64_t v3;

  -[SVVideoPlaybackQueue queue](self, "queue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (void)playbackCoordinator:(id)a3 playbackFailedWithError:(id)a4
{
  void *v5;
  id v6;

  v6 = a3;
  -[SVVideoPlaybackQueue queue](self, "queue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v6);

  -[SVVideoPlaybackQueue prefetchItemAfterCoordinatorIfPossible:](self, "prefetchItemAfterCoordinatorIfPossible:", v6);
}

- (void)prefetchItemAfterCoordinatorIfPossible:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double Seconds;
  double v9;
  double v10;
  uint64_t v11;
  _BOOL4 v12;
  void *v13;
  int v14;
  double v15;
  int v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  _BOOL4 v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  CMTimeRange v29;
  CMTime v30;
  CMTimeRange v31;

  v4 = a3;
  memset(&v31, 0, sizeof(v31));
  objc_msgSend(v4, "loadedTimeRanges");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    objc_msgSend(v6, "CMTimeRangeValue");
  else
    memset(&v31, 0, sizeof(v31));

  memset(&v30, 0, sizeof(v30));
  v29 = v31;
  CMTimeRangeGetEnd(&v30, &v29);
  v29.start = v30;
  Seconds = CMTimeGetSeconds(&v29.start);
  objc_msgSend(v4, "duration");
  v10 = v9;
  v11 = objc_msgSend(v4, "state");
  v12 = objc_msgSend(v4, "state") != 3 && objc_msgSend(v4, "state") != 4;
  -[SVVideoPlaybackQueue queue](self, "queue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "containsObject:", v4);

  objc_msgSend(v4, "duration");
  v16 = 1;
  if (v15 > 0.0)
  {
    v15 = v10 - Seconds;
    if (v10 - Seconds <= 2.0 && v15 >= 0.0 && objc_msgSend(v4, "playbackLikelyToKeepUp"))
      v16 = objc_msgSend(v4, "playbackBufferFull");
  }
  objc_msgSend(v4, "duration", v15);
  if (v17 <= 0.0 || (objc_msgSend(v4, "time"), v18 <= 0.0))
  {
    v22 = 1;
  }
  else
  {
    objc_msgSend(v4, "duration");
    v20 = v19;
    objc_msgSend(v4, "time");
    v22 = v20 - v21 >= 10.0;
  }
  objc_msgSend(v4, "video");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "conformsToProtocol:", &unk_2550CA060);

  if (v11 == 5 || ((v14 | v16 | (v12 || v22)) ^ 1 | v24) == 1)
  {
    objc_msgSend(v4, "removePlaybackObserver:", self);
    -[SVVideoPlaybackQueue queue](self, "queue");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "firstObject");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addPlaybackObserver:", self);

    -[SVVideoPlaybackQueue queue](self, "queue");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "firstObject");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "load");

  }
}

- (NSMutableArray)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
