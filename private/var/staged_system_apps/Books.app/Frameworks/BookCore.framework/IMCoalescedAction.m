@implementation IMCoalescedAction

- (IMCoalescedAction)initWithAction:(id)a3
{
  id v4;
  IMCoalescedAction *v5;
  IMCoalescedAction *v6;

  v4 = a3;
  v5 = -[IMCoalescedAction init](self, "init");
  v6 = v5;
  if (v5)
    -[IMCoalescedAction addAction:](v5, "addAction:", v4);

  return v6;
}

- (IMCoalescedAction)init
{
  char *v2;
  IMCoalescedAction *v3;
  NSMutableArray *v4;
  NSMutableArray *actions;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)IMCoalescedAction;
  v2 = -[IMCoalescedAction init](&v7, "init");
  v3 = (IMCoalescedAction *)v2;
  if (v2)
  {
    *(_OWORD *)(v2 + 8) = xmmword_269D50;
    v4 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    actions = v3->_actions;
    v3->_actions = v4;

  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[IMCoalescedAction _performActions](self, "_performActions");
  v3.receiver = self;
  v3.super_class = (Class)IMCoalescedAction;
  -[IMCoalescedAction dealloc](&v3, "dealloc");
}

- (void)increaseCount
{
  uint64_t v3;

  -[IMCoalescedAction setCount:](self, "setCount:", (char *)-[IMCoalescedAction count](self, "count") + 1);
  v3 = -[IMCoalescedAction count](self, "count");
  if (v3 >= -[IMCoalescedAction maxCount](self, "maxCount"))
  {
    -[IMCoalescedAction _performActions](self, "_performActions");
    -[IMCoalescedAction _reset](self, "_reset");
  }
}

- (void)addAction:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v6 = objc_msgSend(a3, "copy");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IMCoalescedAction actions](self, "actions"));
  v5 = objc_retainBlock(v6);
  objc_msgSend(v4, "addObject:", v5);

}

- (void)_performActions
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  if (-[IMCoalescedAction count](self, "count"))
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[IMCoalescedAction actions](self, "actions", 0));
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v9;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v9 != v6)
            objc_enumerationMutation(v3);
          (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v7) + 16))();
          v7 = (char *)v7 + 1;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v5);
    }

  }
}

- (void)_reset
{
  -[IMCoalescedAction setCount:](self, "setCount:", 0);
}

- (int64_t)count
{
  return self->_count;
}

- (void)setCount:(int64_t)a3
{
  self->_count = a3;
}

- (int64_t)maxCount
{
  return self->_maxCount;
}

- (void)setMaxCount:(int64_t)a3
{
  self->_maxCount = a3;
}

- (NSMutableArray)actions
{
  return self->_actions;
}

- (void)setActions:(id)a3
{
  objc_storeStrong((id *)&self->_actions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actions, 0);
}

@end
