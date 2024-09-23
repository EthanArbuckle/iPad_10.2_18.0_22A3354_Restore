@implementation _WBTabCyclerTabGroupUpdateObserver

+ (id)observeTabGroupManager:(id)a3 waitForTabGroups:(BOOL)a4 handler:(id)a5
{
  id v7;
  id v8;
  _WBTabCyclerTabGroupUpdateObserver *v9;

  v7 = a5;
  v8 = a3;
  v9 = -[_WBTabCyclerTabGroupUpdateObserver initWithTabGroupManager:handler:]([_WBTabCyclerTabGroupUpdateObserver alloc], "initWithTabGroupManager:handler:", v8, v7);

  v9->_waitForTabGroups = a4;
  -[_WBTabCyclerTabGroupUpdateObserver startObserving](v9, "startObserving");
  return v9;
}

- (_WBTabCyclerTabGroupUpdateObserver)initWithTabGroupManager:(id)a3 handler:(id)a4
{
  id v7;
  void (**v8)(id, _QWORD);
  _WBTabCyclerTabGroupUpdateObserver *v9;
  _WBTabCyclerTabGroupUpdateObserver *v10;
  uint64_t v11;
  id handler;
  _WBTabCyclerTabGroupUpdateObserver *v13;
  objc_super v15;

  v7 = a3;
  v8 = (void (**)(id, _QWORD))a4;
  v15.receiver = self;
  v15.super_class = (Class)_WBTabCyclerTabGroupUpdateObserver;
  v9 = -[_WBTabCyclerTabGroupUpdateObserver init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_tabGroupManager, a3);
    v11 = MEMORY[0x212BD4C84](v8);
    handler = v10->_handler;
    v10->_handler = (id)v11;

    v13 = v10;
  }
  else
  {
    v8[2](v8, 0);
  }

  return v10;
}

- (void)startObserving
{
  _QWORD v2[4];
  id v3;
  id location;

  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __52___WBTabCyclerTabGroupUpdateObserver_startObserving__block_invoke;
  v2[3] = &unk_24CB318D0;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x24BDAC9B8], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

- (void)_timeout
{
  NSObject *v3;
  uint8_t v4[16];

  v3 = WBS_LOG_CHANNEL_PREFIXCycler();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_211022000, v3, OS_LOG_TYPE_INFO, "Timed out while waiting for Tab Group updates", v4, 2u);
  }
  -[WBTabGroupManager removeTabGroupObserver:](self->_tabGroupManager, "removeTabGroupObserver:", self);
  (*((void (**)(void))self->_handler + 2))();
}

- (void)tabGroupManagerDidUpdateTabGroups:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  uint8_t v9[16];
  uint8_t buf[16];

  v4 = a3;
  v5 = WBS_LOG_CHANNEL_PREFIXCycler();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_211022000, v5, OS_LOG_TYPE_INFO, "Received notification of Tab Group updates", buf, 2u);
  }
  if (self->_waitForTabGroups
    && (objc_msgSend(v4, "allNamedTabGroupsUnsorted"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "count"),
        v6,
        !v7))
  {
    v8 = WBS_LOG_CHANNEL_PREFIXCycler();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_211022000, v8, OS_LOG_TYPE_INFO, "Expected tab groups after update but none were found. Continuing to wait.", v9, 2u);
    }
  }
  else
  {
    -[NSTimer invalidate](self->_timeoutTimer, "invalidate");
    -[WBTabGroupManager removeTabGroupObserver:](self->_tabGroupManager, "removeTabGroupObserver:", self);
    (*((void (**)(void))self->_handler + 2))();
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_tabGroupManager, 0);
  objc_storeStrong(&self->_handler, 0);
}

@end
