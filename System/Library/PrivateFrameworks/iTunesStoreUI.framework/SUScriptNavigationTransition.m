@implementation SUScriptNavigationTransition

- (SUScriptNavigationTransition)initWithContainer:(id)a3 finishBlock:(id)a4
{
  id v7;
  id v8;
  SUScriptNavigationTransition *v9;
  NSMutableArray *v10;
  NSMutableArray *finishBlocks;
  NSMutableArray *v12;
  void *v13;
  NSLock *v14;
  NSLock *lock;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)SUScriptNavigationTransition;
  v9 = -[SUScriptObject init](&v17, sel_init);
  if (v9)
  {
    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    finishBlocks = v9->_finishBlocks;
    v9->_finishBlocks = v10;

    v12 = v9->_finishBlocks;
    v13 = (void *)objc_msgSend(v8, "copy");
    -[NSMutableArray addObject:](v12, "addObject:", v13);

    v9->_status = 0;
    v14 = (NSLock *)objc_alloc_init(MEMORY[0x24BDD1648]);
    lock = v9->super._lock;
    v9->super._lock = v14;

    objc_storeStrong((id *)&v9->_container, a3);
  }

  return v9;
}

- (void)addFinishBlock:(id)a3
{
  id v4;
  NSMutableArray *finishBlocks;
  void *v6;

  v4 = a3;
  -[SUScriptObject lock](self, "lock");
  finishBlocks = self->_finishBlocks;
  v6 = (void *)objc_msgSend(v4, "copy");

  -[NSMutableArray addObject:](finishBlocks, "addObject:", v6);
  -[SUScriptObject unlock](self, "unlock");
}

- (int64_t)status
{
  int64_t status;

  -[SUScriptObject lock](self, "lock");
  status = self->_status;
  -[SUScriptObject unlock](self, "unlock");
  return status;
}

- (void)setStatus:(int64_t)a3
{
  -[SUScriptObject lock](self, "lock");
  self->_status = a3;
  -[SUScriptObject unlock](self, "unlock");
}

- (int64_t)fromIndex
{
  return self->_fromIndex;
}

- (void)setFromIndex:(int64_t)a3
{
  self->_fromIndex = a3;
}

- (void)setToIndex:(int64_t)a3
{
  self->_toIndex = a3;
}

- (void)setTopNavigationItem:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)MEMORY[0x24BDFA950];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ is readonly"), CFSTR("topNavigationItem"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "throwException:", v4);

}

- (int64_t)toIndex
{
  return self->_toIndex;
}

- (SUScriptNavigationItem)topNavigationItem
{
  SUScriptNavigationItem *v3;
  void *v4;
  SUScriptNavigationItem *v5;

  if (self->_container)
  {
    v3 = [SUScriptNavigationItem alloc];
    -[SUViewController navigationItem](self->_container, "navigationItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[SUScriptNavigationItem initWithNativeNavigationItem:](v3, "initWithNativeNavigationItem:", v4);

    -[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v5);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)finishedLoading
{
  void *v3;
  SUNavigationContainerViewController *v4;
  SUNavigationContainerViewController *container;
  NSMutableArray *finishBlocks;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[SUScriptObject lock](self, "lock");
  if (self->_status == 2)
  {
    v3 = 0;
    v4 = 0;
  }
  else
  {
    v3 = (void *)-[NSMutableArray copy](self->_finishBlocks, "copy");
    v4 = self->_container;
    container = self->_container;
    self->_container = 0;

    finishBlocks = self->_finishBlocks;
    self->_finishBlocks = 0;

    self->_status = 2;
  }
  -[SUScriptObject unlock](self, "unlock");
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = v3;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i) + 16))(*(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (id)_className
{
  return CFSTR("iTunesNavigationTransition");
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v4 = a3;
  objc_msgSend((id)__KeyMapping_19, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___SUScriptNavigationTransition;
    objc_msgSendSuper2(&v7, sel_webScriptNameForKeyName_, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  void *v5;
  objc_super v7;

  SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_14, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___SUScriptNavigationTransition;
    objc_msgSendSuper2(&v7, sel_webScriptNameForSelector_, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)scriptAttributeKeys
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUScriptNavigationTransition;
  -[SUScriptObject scriptAttributeKeys](&v5, sel_scriptAttributeKeys);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)__KeyMapping_19, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

  return v2;
}

+ (void)initialize
{
  uint64_t v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_14 = (uint64_t)sel_finishedLoading;
    *(_QWORD *)algn_255186308 = CFSTR("finishedLoading");
    v2 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", CFSTR("fromIndex"), CFSTR("toIndex"), CFSTR("toIndex"), CFSTR("topNavigationItem"), CFSTR("topNavigationItem"), 0);
    v3 = (void *)__KeyMapping_19;
    __KeyMapping_19 = v2;

  }
}

- (NSString)rightBarButton
{
  return self->_rightBarButton;
}

- (void)setRightBarButton:(id)a3
{
  objc_storeStrong((id *)&self->_rightBarButton, a3);
}

- (NSMutableArray)finishBlocks
{
  return self->_finishBlocks;
}

- (void)setFinishBlocks:(id)a3
{
  objc_storeStrong((id *)&self->_finishBlocks, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finishBlocks, 0);
  objc_storeStrong((id *)&self->_rightBarButton, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
