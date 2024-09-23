@implementation SVTimeline

- (SVTimeline)init
{
  SVTimeline *v2;
  uint64_t v3;
  NSMutableArray *actions;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SVTimeline;
  v2 = -[SVTimeline init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    actions = v2->_actions;
    v2->_actions = (NSMutableArray *)v3;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  if (self)
    -[NSMutableArray removeAllObjects](self->_actions, "removeAllObjects");
  v3.receiver = self;
  v3.super_class = (Class)SVTimeline;
  -[SVTimeline dealloc](&v3, sel_dealloc);
}

- (uint64_t)cancelScheduledBlocks
{
  if (result)
    return objc_msgSend(*(id *)(result + 24), "removeAllObjects");
  return result;
}

- (uint64_t)resetTime
{
  if (result)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
  }
  return result;
}

- (void)setDuration:(uint64_t)a1
{
  if (a1)
  {
    if (*(double *)(a1 + 8) != a2)
    {
      *(double *)(a1 + 8) = a2;
      -[SVTimeline executeActionsForTime:withDuration:](a1, *(double *)(a1 + 16), a2);
    }
  }
}

- (void)executeActionsForTime:(double)a3 withDuration:
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  _BOOL4 v9;
  void *v10;
  double v11;
  _BOOL4 v12;
  double v13;
  _BOOL4 v14;
  void (**v16)(_QWORD, _QWORD);
  id v17;
  id location;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v5 = (void *)objc_msgSend(*(id *)(a1 + 24), "copy");
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v20 != v7)
            objc_enumerationMutation(v5);
          v9 = a3 > 0.0;
          v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          v11 = -[SVTimeBasedAction time]((uint64_t)v10);
          v12 = v11 < 0.0;
          v13 = v11 + a3;
          if (-v11 > a3)
            v12 = 0;
          if (!v9 || !v12)
            v13 = -1.79769313e308;
          v14 = v11 <= a3 && v11 >= 0.0;
          if (!v9 || !v14)
            v11 = v13;
          if (v11 <= a2 && v11 != -1.79769313e308)
          {
            objc_initWeak(&location, v10);
            -[SVTimeBasedAction block]((uint64_t)v10);
            v16 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
            v17 = objc_loadWeakRetained(&location);
            ((void (**)(_QWORD, id))v16)[2](v16, v17);

            objc_destroyWeak(&location);
          }
        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v6);
    }

  }
}

- (void)setTime:(uint64_t)a1
{
  if (a1)
  {
    if (*(double *)(a1 + 16) != a2)
    {
      *(double *)(a1 + 16) = a2;
      -[SVTimeline executeActionsForTime:withDuration:](a1, a2, *(double *)(a1 + 8));
    }
  }
}

- (_QWORD)performBlock:(double)a3 at:
{
  id v5;
  SVTimeBasedAction *v6;
  _QWORD *v7;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v5 = a2;
  if (a1)
  {
    objc_initWeak(&location, a1);
    v6 = [SVTimeBasedAction alloc];
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __30__SVTimeline_performBlock_at___block_invoke;
    v9[3] = &unk_24DBC2430;
    v10 = v5;
    objc_copyWeak(&v11, &location);
    v7 = -[SVTimeBasedAction initWithTime:block:](v6, v9, a3);
    if (v7)
      objc_msgSend(a1[3], "addObject:", v7);
    objc_destroyWeak(&v11);

    objc_destroyWeak(&location);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __30__SVTimeline_performBlock_at___block_invoke(uint64_t a1, void *a2)
{
  id *WeakRetained;
  id v4;

  v4 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (v4 && WeakRetained)
    objc_msgSend(WeakRetained[3], "removeObject:", v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actions, 0);
}

@end
