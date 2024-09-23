@implementation PUIFramebufferSizeChangeNotifier

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  return (id)sharedInstance_sharedInstance;
}

void __50__PUIFramebufferSizeChangeNotifier_sharedInstance__block_invoke()
{
  PUIFramebufferSizeChangeNotifier *v0;
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v0 = objc_alloc_init(PUIFramebufferSizeChangeNotifier);
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v0;

  if (sharedInstance_sharedInstance)
  {
    v2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v3 = *(void **)(sharedInstance_sharedInstance + 8);
    *(_QWORD *)(sharedInstance_sharedInstance + 8) = v2;

    v4 = objc_msgSend(objc_alloc(MEMORY[0x24BE38450]), "initWithInitializationCompletion:", &__block_literal_global_4);
    v5 = *(void **)(sharedInstance_sharedInstance + 16);
    *(_QWORD *)(sharedInstance_sharedInstance + 16) = v4;

    dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global_5);
  }
}

uint64_t __50__PUIFramebufferSizeChangeNotifier_sharedInstance__block_invoke_2()
{
  return objc_msgSend((id)sharedInstance_sharedInstance, "_onMainQueue_notifyListeners");
}

uint64_t __50__PUIFramebufferSizeChangeNotifier_sharedInstance__block_invoke_3()
{
  return objc_msgSend(*(id *)(sharedInstance_sharedInstance + 16), "addObserver:");
}

- (id)addListener:(id)a3
{
  id v4;
  NSMutableArray *v5;
  NSMutableArray *listeners;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = self->_listeners;
  objc_sync_enter(v5);
  listeners = self->_listeners;
  v7 = (void *)MEMORY[0x20BD38470](v4);
  v11[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](listeners, "addObject:", v8);

  -[NSMutableArray lastObject](self->_listeners, "lastObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("did add new framebuffer listener %p"), v9);
  objc_sync_exit(v5);

  return v9;
}

- (void)removeListener:(id)a3
{
  NSMutableArray *v4;
  id v5;

  v5 = a3;
  v4 = self->_listeners;
  objc_sync_enter(v4);
  NSLog(CFSTR("will remove framebuffer listener %p"), v5);
  -[NSMutableArray removeObject:](self->_listeners, "removeObject:", v5);
  objc_sync_exit(v4);

}

- (void)_onMainQueue_notifyListeners
{
  NSMutableArray *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void (**v18)(double, double);
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = self->_listeners;
  objc_sync_enter(v3);
  -[FBSDisplayMonitor mainConfiguration](self->_displayMonitor, "mainConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentMode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pixelSize");
  v7 = v6;
  v9 = v8;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("Will broadcast new framebuffer width %@ height %@"), v10, v11);

  v12 = (void *)-[NSMutableArray copy](self->_listeners, "copy");
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v13 = v12;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v13);
        v17 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (-[NSMutableArray containsObject:](self->_listeners, "containsObject:", v17))
        {
          objc_msgSend(v17, "firstObject");
          v18 = (void (**)(double, double))objc_claimAutoreleasedReturnValue();
          v18[2](v7, v9);

        }
        else
        {
          NSLog(CFSTR("skipping removed framebuffer listener %p"), v17);
        }
      }
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v14);
  }

  objc_sync_exit(v3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayMonitor, 0);
  objc_storeStrong((id *)&self->_listeners, 0);
}

@end
