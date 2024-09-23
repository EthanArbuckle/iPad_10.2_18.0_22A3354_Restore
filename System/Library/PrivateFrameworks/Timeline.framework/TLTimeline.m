@implementation TLTimeline

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TLTimeline)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  TLTimeline *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("nowWindow"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("paused"));

  v7 = -[TLTimeline initWithWindow:paused:](self, "initWithWindow:paused:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  TLTimeline *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  objc_msgSend(v5, "encodeObject:forKey:", v4->_nowWindow, CFSTR("nowWindow"));
  objc_msgSend(v5, "encodeBool:forKey:", v4->_paused, CFSTR("paused"));
  objc_sync_exit(v4);

}

- (id)copyWithZone:(_NSZone *)a3
{
  TLTimeline *v4;
  void *v5;

  v4 = self;
  objc_sync_enter(v4);
  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithWindow:paused:", v4->_nowWindow, v4->_paused);
  objc_sync_exit(v4);

  return v5;
}

- (TLTimeline)initWithWindow:(id)a3 paused:(BOOL)a4
{
  id v7;
  TLTimeline *v8;
  TLTimeline *v9;
  uint64_t v10;
  TLTimelineEntryNode *leftmostNode;
  uint64_t v12;
  TLTimelineEntryNode *rightmostNode;
  void *v14;
  objc_super v16;

  v7 = a3;
  v16.receiver = self;
  v16.super_class = (Class)TLTimeline;
  v8 = -[TLTimeline init](&v16, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_nowWindow, a3);
    objc_msgSend(v7, "leftmostNode");
    v10 = objc_claimAutoreleasedReturnValue();
    leftmostNode = v9->_leftmostNode;
    v9->_leftmostNode = (TLTimelineEntryNode *)v10;

    objc_msgSend(v7, "rightmostNode");
    v12 = objc_claimAutoreleasedReturnValue();
    rightmostNode = v9->_rightmostNode;
    v9->_rightmostNode = (TLTimelineEntryNode *)v12;

    v9->_paused = a4;
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", v9, sel__timerFired, *MEMORY[0x24BDBCA70], 0);

  }
  return v9;
}

- (TLTimeline)initWithEntry:(id)a3
{
  id v4;
  void *v5;
  TLTimelineWindow *v6;
  TLTimeline *v7;

  v4 = a3;
  _DequeueRecycledEntryNode();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEntry:", v4);

  v6 = -[TLTimelineWindow initWithFocalNode:maxNodes:]([TLTimelineWindow alloc], "initWithFocalNode:maxNodes:", v5, -[TLTimeline nodeCapacity](self, "nodeCapacity"));
  v7 = -[TLTimeline initWithWindow:paused:](self, "initWithWindow:paused:", v6, 0);

  return v7;
}

- (void)dealloc
{
  int notifyToken;
  void *v4;
  objc_super v5;

  -[TLTimeline _recycleAllNodes](self, "_recycleAllNodes");
  if (self->_updatesNowNodeOnSignificantTimeChange)
  {
    notifyToken = self->_notifyToken;
    if (notifyToken)
      notify_cancel(notifyToken);
  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)TLTimeline;
  -[TLTimeline dealloc](&v5, sel_dealloc);
}

- (void)setPaused:(BOOL)a3
{
  if (self->_paused != a3)
  {
    self->_paused = a3;
    if (!a3)
      -[TLTimeline _updateNowWindow](self, "_updateNowWindow");
    -[TLTimeline _updateTimer](self, "_updateTimer");
  }
}

- (BOOL)isEqual:(id)a3
{
  TLTimeline *v4;
  _BOOL4 v5;
  BOOL v6;
  void *v7;
  void *v8;

  v4 = (TLTimeline *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (v4 == self)
    {
      v6 = 1;
      goto LABEL_7;
    }
    v5 = -[TLTimeline paused](self, "paused");
    if (v5 == -[TLTimeline paused](v4, "paused"))
    {
      -[TLTimeline nowWindow](self, "nowWindow");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[TLTimeline nowWindow](v4, "nowWindow");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = +[TLTimelineUtilities object:isEqualToObject:](TLTimelineUtilities, "object:isEqualToObject:", v7, v8);

      goto LABEL_7;
    }
  }
  v6 = 0;
LABEL_7:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;

  v3 = +[TLTimeline hash](TLTimeline, "hash");
  -[TLTimeline nowWindow](self, "nowWindow");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  v6 = v5 ^ -[TLTimeline paused](self, "paused") ^ v3;

  return v6;
}

- (void)setUpdatesNowNodeOnSignificantTimeChange:(BOOL)a3
{
  _BOOL4 v3;
  TLTimeline *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id location;

  v3 = a3;
  v4 = self;
  objc_sync_enter(v4);
  if (v4->_updatesNowNodeOnSignificantTimeChange != v3)
  {
    v4->_updatesNowNodeOnSignificantTimeChange = v3;
    if (v3)
    {
      objc_initWeak(&location, v4);
      v5 = MEMORY[0x24BDAC9B8];
      v6 = MEMORY[0x24BDAC9B8];
      v7[0] = MEMORY[0x24BDAC760];
      v7[1] = 3221225472;
      v7[2] = __55__TLTimeline_setUpdatesNowNodeOnSignificantTimeChange___block_invoke;
      v7[3] = &unk_24CE30FC0;
      objc_copyWeak(&v8, &location);
      notify_register_dispatch("SignificantTimeChangeNotification", &v4->_notifyToken, v5, v7);

      objc_destroyWeak(&v8);
      objc_destroyWeak(&location);
    }
    else
    {
      notify_cancel(v4->_notifyToken);
      v4->_notifyToken = 0;
    }
  }
  objc_sync_exit(v4);

}

void __55__TLTimeline_setUpdatesNowNodeOnSignificantTimeChange___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_timerFired");

}

- (BOOL)updatesNowNodeOnSignificantTimeChange
{
  TLTimeline *v2;
  BOOL updatesNowNodeOnSignificantTimeChange;

  v2 = self;
  objc_sync_enter(v2);
  updatesNowNodeOnSignificantTimeChange = v2->_updatesNowNodeOnSignificantTimeChange;
  objc_sync_exit(v2);

  return updatesNowNodeOnSignificantTimeChange;
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    self->_delegateRespondsToTimerFired = objc_opt_respondsToSelector() & 1;
  }

}

- (void)resetWithEntry:(id)a3
{
  TLTimelineWindow *nowWindow;
  id v5;
  id v6;

  nowWindow = self->_nowWindow;
  self->_nowWindow = 0;
  v5 = a3;

  -[TLTimeline _recycleAllNodes](self, "_recycleAllNodes");
  -[TLTimeline _setupWithEntry:](self, "_setupWithEntry:", v5);

  -[TLTimeline delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "entriesDidChangeInTimeline:", self);

}

- (id)entriesWithinDateInterval:(id)a3
{
  id v4;
  TLTimelineWindow *v5;
  void *v6;
  TLTimelineWindow *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;

  v4 = a3;
  v5 = [TLTimelineWindow alloc];
  -[TLTimeline _nowNode](self, "_nowNode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[TLTimelineWindow initWithFocalNode:maxNodes:](v5, "initWithFocalNode:maxNodes:", v6, -[TLTimeline nodeCapacity](self, "nodeCapacity"));

  objc_msgSend(v4, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLTimelineWindow updateFocalNodeWithDate:](v7, "updateFocalNodeWithDate:", v8);

  v9 = (void *)objc_opt_new();
  -[TLTimelineWindow focalNode](v7, "focalNode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  do
  {
    objc_msgSend(v10, "entry");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      objc_msgSend(v9, "addObject:", v11);
    objc_msgSend(v10, "rightEntryNode");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
      break;
    objc_msgSend(v12, "entry");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!v13)
      break;
    v14 = (void *)v13;
    objc_msgSend(v12, "entry");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "tl_entryDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v4, "containsDate:", v16);

    v10 = v12;
  }
  while ((v17 & 1) != 0);
  v18 = (void *)objc_msgSend(v9, "copy");

  return v18;
}

- (void)extendRightFromDate:(id)a3 withEntries:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  NSObject *v11;
  TLTimelineEntryNode *rightmostNode;
  void *v13;
  TLTimelineEntryNode *v14;
  TLTimelineEntryNode *v15;
  void *v16;
  int v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[TLTimeline _sortedEntries:](self, "_sortedEntries:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLTimeline dateOfLastEntryInTimeline](self, "dateOfLastEntryInTimeline");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "isEqualToDate:", v8);

  if (v9)
  {
    -[TLTimeline dateOfLastEntryInTimeline](self, "dateOfLastEntryInTimeline");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[TLTimeline TLTimelineSegmentFromSortedEntries:withLowerBound:upperBound:](TLTimeline, "TLTimelineSegmentFromSortedEntries:withLowerBound:upperBound:", v7, v10, 0);
    v11 = objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      rightmostNode = self->_rightmostNode;
      -[NSObject leftmostNode](v11, "leftmostNode");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      _AttachNodes(rightmostNode, v13);

      -[NSObject rightmostNode](v11, "rightmostNode");
      v14 = (TLTimelineEntryNode *)objc_claimAutoreleasedReturnValue();
      v15 = self->_rightmostNode;
      self->_rightmostNode = v14;

    }
  }
  else
  {
    TLLoggingObjectForDomain(1);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138412290;
      v18 = v6;
      _os_log_impl(&dword_212829000, v11, OS_LOG_TYPE_DEFAULT, "Boundary date is not equal to last date. Cannot extend timeline forward from date %@", (uint8_t *)&v17, 0xCu);
    }
  }

  -[TLTimeline _updateNowWindow](self, "_updateNowWindow");
  -[TLTimeline _trimTimeline](self, "_trimTimeline");
  -[TLTimeline _updateTimer](self, "_updateTimer");
  -[TLTimeline delegate](self, "delegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "entriesDidChangeInTimeline:", self);

}

- (TLTimelineEntry)nowEntry
{
  TLTimelineWindow *nowWindow;
  void *v4;

  if (!self->_timer)
  {
    nowWindow = self->_nowWindow;
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[TLTimelineWindow updateFocalNodeWithDate:](nowWindow, "updateFocalNodeWithDate:", v4);

    -[TLTimelineWindow rebalance](self->_nowWindow, "rebalance");
  }
  return (TLTimelineEntry *)-[TLTimeline _nowEntry](self, "_nowEntry");
}

- (id)nowWindow
{
  return self->_nowWindow;
}

- (unint64_t)nodeCapacity
{
  return 200;
}

- (NSDate)endOfVisibilityForNowEntry
{
  void *v2;
  void *v3;
  void *v4;

  -[TLTimeline _nowNode](self, "_nowNode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rightEntryNode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[TLTimeline _nowNode](self, "_nowNode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLTimeline _nowNode](self, "_nowNode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rightEntryNode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "entry");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<TLTimeline-%p: currentEntry: %@, nextEntry: %@>"), self, v5, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)_updateTimer
{
  TLTimeline *v2;
  NSTimer *timer;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSTimer *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint8_t buf[4];
  TLTimeline *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v2 = self;
  -[NSTimer invalidate](v2->_timer, "invalidate");
  timer = v2->_timer;
  v2->_timer = 0;

  if (!v2->_paused)
  {
    -[TLTimeline _nowNode](v2, "_nowNode");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rightEntryNode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      TLLoggingObjectForDomain(1);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        -[TLTimeline _nowNode](v2, "_nowNode");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "entry");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[TLTimeline _nowNode](v2, "_nowNode");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "date");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[TLTimeline _nowNode](v2, "_nowNode");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "rightEntryNode");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "entry");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[TLTimeline _nowNode](v2, "_nowNode");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "rightEntryNode");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "date");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v6, "timeIntervalSinceNow");
        objc_msgSend(v14, "numberWithDouble:");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134219266;
        v25 = v2;
        v26 = 2112;
        v27 = v8;
        v28 = 2112;
        v29 = v9;
        v30 = 2112;
        v31 = v10;
        v32 = 2112;
        v33 = v13;
        v34 = 2112;
        v35 = v15;
        _os_log_impl(&dword_212829000, v7, OS_LOG_TYPE_DEFAULT, "<TLTimeline-%p> current entry %@ (%@) - next entry %@ (%@) - firing next event in: %@ seconds", buf, 0x3Eu);

      }
      v16 = (void *)MEMORY[0x24BDBCF40];
      objc_msgSend(v6, "timeIntervalSinceNow");
      objc_msgSend(v16, "timerWithTimeInterval:target:selector:userInfo:repeats:", v2, sel__timerFired, 0, 0);
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = v2->_timer;
      v2->_timer = (NSTimer *)v17;

      -[NSTimer setTolerance:](v2->_timer, "setTolerance:", 2.0);
      objc_msgSend(MEMORY[0x24BDBCF18], "mainRunLoop");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addTimer:forMode:", v2->_timer, *MEMORY[0x24BDBCB80]);

    }
  }

}

- (void)_timerFired
{
  void *v3;

  -[TLTimeline _updateNowWindow](self, "_updateNowWindow");
  if (self->_delegateRespondsToTimerFired)
  {
    -[TLTimeline delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "timelineTimerDidFire:", self);

  }
  -[TLTimeline _updateTimer](self, "_updateTimer");
}

- (id)_nowEntry
{
  void *v2;
  void *v3;

  -[TLTimeline _nowNode](self, "_nowNode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "entry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSDate)dateOfLastEntryInTimeline
{
  return -[TLTimelineEntryNode date](self->_rightmostNode, "date");
}

- (TLTimelineEntry)lastEntry
{
  return -[TLTimelineEntryNode entry](self->_rightmostNode, "entry");
}

- (void)_setupWithEntry:(id)a3
{
  id v4;
  TLTimelineEntryNode *v5;
  TLTimelineEntryNode *leftmostNode;
  TLTimelineWindow *v7;
  TLTimelineWindow *nowWindow;
  TLTimelineEntryNode *v9;

  v4 = a3;
  _DequeueRecycledEntryNode();
  v5 = (TLTimelineEntryNode *)objc_claimAutoreleasedReturnValue();
  -[TLTimelineEntryNode setEntry:](v5, "setEntry:", v4);

  objc_storeStrong((id *)&self->_rightmostNode, v5);
  leftmostNode = self->_leftmostNode;
  self->_leftmostNode = v5;
  v9 = v5;

  v7 = -[TLTimelineWindow initWithFocalNode:maxNodes:]([TLTimelineWindow alloc], "initWithFocalNode:maxNodes:", v9, -[TLTimeline nodeCapacity](self, "nodeCapacity"));
  nowWindow = self->_nowWindow;
  self->_nowWindow = v7;

}

+ (id)TLTimelineSegmentFromSortedEntries:(id)a3 withLowerBound:(id)a4 upperBound:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  TLTimelineSegment *v13;
  void *v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  _BOOL4 v22;
  void *v23;
  _BOOL4 v24;
  void *v25;
  id v26;
  void *v27;
  void *v29;
  id v30;
  id obj;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v11)
  {
    v12 = v11;
    v30 = v9;
    obj = v10;
    v13 = 0;
    v14 = 0;
    v29 = 0;
    v15 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v33 != v15)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        if (v8)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "tl_entryDate");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = +[TLTimelineUtilities date:isOrderedAscendingToDate:](TLTimelineUtilities, "date:isOrderedAscendingToDate:", v8, v18);

          if (!v19)
            continue;
        }
        if (v14)
        {
          objc_msgSend(v14, "date");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "tl_entryDate");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = +[TLTimelineUtilities date:isOrderedAscendingToDate:](TLTimelineUtilities, "date:isOrderedAscendingToDate:", v20, v21);

          if (!v22)
            continue;
        }
        if (v30)
        {
          objc_msgSend(v17, "tl_entryDate");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = +[TLTimelineUtilities date:isOrderedAscendingToDate:](TLTimelineUtilities, "date:isOrderedAscendingToDate:", v23, v30);

          if (!v24)
            goto LABEL_18;
        }
        _DequeueRecycledEntryNode();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setEntry:", v17);
        if (v14)
        {
          _AttachNodes(v14, v25);
        }
        else
        {
          v26 = v25;

          v29 = v26;
        }
        v13 = (TLTimelineSegment *)((char *)v13 + 1);

        v14 = v25;
      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v12);
LABEL_18:
    v10 = obj;

    v27 = v29;
    if (v13)
      v13 = -[TLTimelineSegment initWithLeftmostNode:rightmostNode:count:]([TLTimelineSegment alloc], "initWithLeftmostNode:rightmostNode:count:", v29, v14, v13);
    v9 = v30;
  }
  else
  {

    v13 = 0;
    v14 = 0;
    v27 = 0;
  }

  return v13;
}

- (id)_sortedEntries:(id)a3
{
  return (id)objc_msgSend(a3, "sortedArrayUsingComparator:", &__block_literal_global_2);
}

uint64_t __29__TLTimeline__sortedEntries___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "tl_entryDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tl_entryDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (id)_nowNode
{
  return -[TLTimelineWindow focalNode](self->_nowWindow, "focalNode");
}

- (void)_updateNowWindow
{
  TLTimelineWindow *nowWindow;
  void *v4;
  id v5;
  TLTimelineDelegate **p_delegate;
  id WeakRetained;
  char v8;
  id v9;
  id v10;
  char v11;
  id v12;

  -[TLTimeline _nowEntry](self, "_nowEntry");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  nowWindow = self->_nowWindow;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLTimelineWindow updateFocalNodeWithDate:](nowWindow, "updateFocalNodeWithDate:", v4);

  -[TLTimelineWindow rebalance](self->_nowWindow, "rebalance");
  -[TLTimeline _nowEntry](self, "_nowEntry");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v12 != v5)
  {
    p_delegate = &self->_delegate;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v8 = objc_opt_respondsToSelector();

    v9 = objc_loadWeakRetained((id *)&self->_delegate);
    v10 = v9;
    if ((v8 & 1) != 0)
    {
      objc_msgSend(v9, "timeline:didChangeNowEntryFrom:to:", self, v12, v5);
LABEL_6:

      goto LABEL_7;
    }
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      v10 = objc_loadWeakRetained((id *)p_delegate);
      objc_msgSend(v10, "nowEntryDidChangeFrom:to:", v12, v5);
      goto LABEL_6;
    }
  }
LABEL_7:

}

- (void)_trimTimeline
{
  void *v3;
  TLTimelineEntryNode *v4;
  TLTimelineEntryNode *leftmostNode;
  TLTimelineEntryNode *v6;
  TLTimelineEntryNode *rightmostNode;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  while (self->_leftmostNode && !-[TLTimelineWindow containsNode:](self->_nowWindow, "containsNode:"))
  {
    objc_msgSend(v3, "addObject:", self->_leftmostNode);
    -[TLTimelineEntryNode rightEntryNode](self->_leftmostNode, "rightEntryNode");
    v4 = (TLTimelineEntryNode *)objc_claimAutoreleasedReturnValue();
    leftmostNode = self->_leftmostNode;
    self->_leftmostNode = v4;

  }
  while (self->_rightmostNode && !-[TLTimelineWindow containsNode:](self->_nowWindow, "containsNode:"))
  {
    objc_msgSend(v3, "addObject:", self->_rightmostNode);
    -[TLTimelineEntryNode leftEntryNode](self->_rightmostNode, "leftEntryNode");
    v6 = (TLTimelineEntryNode *)objc_claimAutoreleasedReturnValue();
    rightmostNode = self->_rightmostNode;
    self->_rightmostNode = v6;

  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = v3;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        _RecycleNode(*(void **)(*((_QWORD *)&v13 + 1) + 8 * v12++));
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (void)_recycleAllNodes
{
  TLTimelineEntryNode *v3;
  void *v4;
  uint64_t v5;
  TLTimelineEntryNode *leftmostNode;
  TLTimelineEntryNode *rightmostNode;

  v3 = self->_leftmostNode;
  if (v3)
  {
    v4 = v3;
    do
    {
      objc_msgSend(v4, "rightNode");
      v5 = objc_claimAutoreleasedReturnValue();
      _RecycleNode(v4);

      v4 = (void *)v5;
    }
    while (v5);
  }
  leftmostNode = self->_leftmostNode;
  self->_leftmostNode = 0;

  rightmostNode = self->_rightmostNode;
  self->_rightmostNode = 0;

}

- (TLTimelineDelegate)delegate
{
  return (TLTimelineDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)paused
{
  return self->_paused;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_nowWindow, 0);
  objc_storeStrong((id *)&self->_rightmostNode, 0);
  objc_storeStrong((id *)&self->_leftmostNode, 0);
}

@end
