@implementation TUIFeedBaseLayoutCondition

- (TUIFeedBaseLayoutCondition)initWithCompletion:(id)a3
{
  id v4;
  TUIFeedBaseLayoutCondition *v5;
  TUIFeedBaseLayoutCondition *v6;
  id v7;
  id completion;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TUIFeedBaseLayoutCondition;
  v5 = -[TUIFeedBaseLayoutCondition init](&v10, "init");
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    *(_BYTE *)&v5->_state &= ~1u;
    v7 = objc_msgSend(v4, "copy");
    completion = v6->_completion;
    v6->_completion = v7;

  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[TUIFeedBaseLayoutCondition invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)TUIFeedBaseLayoutCondition;
  -[TUIFeedBaseLayoutCondition dealloc](&v3, "dealloc");
}

- (void)onInvalidate:(id)a3
{
  void (**v4)(void);
  os_unfair_lock_s *p_lock;
  NSMutableArray *onInvalidateBlocks;
  NSMutableArray *v7;
  NSMutableArray *v8;
  void (**v9)(void);
  void (**v10)(void);

  v4 = (void (**)(void))a3;
  if (v4)
  {
    v10 = v4;
    p_lock = &self->_lock;
    os_unfair_lock_lock_with_options(&self->_lock, 0x10000);
    if ((*(_BYTE *)&self->_state & 1) != 0)
    {
      os_unfair_lock_unlock(&self->_lock);
      v10[2]();
    }
    else
    {
      onInvalidateBlocks = self->_onInvalidateBlocks;
      if (!onInvalidateBlocks)
      {
        v7 = objc_opt_new(NSMutableArray);
        v8 = self->_onInvalidateBlocks;
        self->_onInvalidateBlocks = v7;

        onInvalidateBlocks = self->_onInvalidateBlocks;
      }
      v9 = objc_retainBlock(v10);
      -[NSMutableArray addObject:](onInvalidateBlocks, "addObject:", v9);

      os_unfair_lock_unlock(p_lock);
    }
    v4 = v10;
  }

}

- (void)invalidate
{
  os_unfair_lock_s *p_lock;
  NSMutableArray *v4;
  NSMutableArray *onInvalidateBlocks;
  NSMutableArray *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options(&self->_lock, 0x10000);
  if ((*(_BYTE *)&self->_state & 1) != 0)
  {
    os_unfair_lock_unlock(p_lock);
    goto LABEL_12;
  }
  v4 = self->_onInvalidateBlocks;
  onInvalidateBlocks = self->_onInvalidateBlocks;
  self->_onInvalidateBlocks = 0;

  *(_BYTE *)&self->_state |= 1u;
  os_unfair_lock_unlock(p_lock);
  if (!v4)
  {
LABEL_12:
    v6 = 0;
    goto LABEL_13;
  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = v4;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v10) + 16))(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v10));
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

LABEL_13:
  -[TUIFeedBaseLayoutCondition completed](self, "completed", (_QWORD)v11);

}

- (void)completed
{
  os_unfair_lock_s *p_lock;
  id completion;
  void *v5;
  id v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options(&self->_lock, 0x10000);
  v6 = objc_retainBlock(self->_completion);
  completion = self->_completion;
  self->_completion = 0;

  os_unfair_lock_unlock(p_lock);
  v5 = v6;
  if (v6)
  {
    (*((void (**)(id))v6 + 2))(v6);
    v5 = v6;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_onInvalidateBlocks, 0);
  objc_storeStrong(&self->_completion, 0);
}

@end
