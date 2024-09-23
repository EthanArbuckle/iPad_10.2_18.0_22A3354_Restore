@implementation SVXTaskTrackingCenter

- (SVXTaskTrackingCenter)initWithPerformer:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  SVXTaskTrackingCenter *v9;
  SVXTaskTrackingCenter *v10;
  NSMutableSet *v11;
  NSMutableSet *contexts;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SVXTaskTrackingCenter;
  v9 = -[SVXTaskTrackingCenter init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_performer, a3);
    v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDD14E0]);
    contexts = v10->_contexts;
    v10->_contexts = v11;

    objc_storeWeak((id *)&v10->_delegate, v8);
  }

  return v10;
}

- (id)beginTrackingTaskWithContext:(id)a3 instrumentationContext:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  SVXTaskTracker *v9;
  SVXPerforming *performer;
  id v11;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "-[SVXTaskTrackingCenter beginTrackingTaskWithContext:instrumentationContext:]";
    v17 = 2112;
    v18 = v6;
    _os_log_impl(&dword_214934000, v8, OS_LOG_TYPE_INFO, "%s context = %@", buf, 0x16u);
  }
  v9 = -[SVXTaskTracker initWithContext:instrumentationContext:delegate:]([SVXTaskTracker alloc], "initWithContext:instrumentationContext:delegate:", v6, v7, self);
  performer = self->_performer;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __77__SVXTaskTrackingCenter_beginTrackingTaskWithContext_instrumentationContext___block_invoke;
  v13[3] = &unk_24D24F018;
  v13[4] = self;
  v14 = v6;
  v11 = v6;
  -[SVXPerforming performBlock:](performer, "performBlock:", v13);

  return v9;
}

- (void)endTrackingTaskWithContext:(id)a3
{
  id v4;
  NSObject *v5;
  SVXPerforming *performer;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[SVXTaskTrackingCenter endTrackingTaskWithContext:]";
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_214934000, v5, OS_LOG_TYPE_INFO, "%s context = %@", buf, 0x16u);
  }
  performer = self->_performer;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __52__SVXTaskTrackingCenter_endTrackingTaskWithContext___block_invoke;
  v8[3] = &unk_24D24F018;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  -[SVXPerforming performBlock:](performer, "performBlock:", v8);

}

- (void)endTrackingTasksPassingTest:(id)a3
{
  id v4;
  NSObject *v5;
  SVXPerforming *performer;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[SVXTaskTrackingCenter endTrackingTasksPassingTest:]";
    _os_log_impl(&dword_214934000, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  performer = self->_performer;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __53__SVXTaskTrackingCenter_endTrackingTasksPassingTest___block_invoke;
  v8[3] = &unk_24D24EF28;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  -[SVXPerforming performBlock:](performer, "performBlock:", v8);

}

- (void)endTrackingAllTasks
{
  NSObject *v3;
  SVXPerforming *performer;
  _QWORD v5[5];
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[SVXTaskTrackingCenter endTrackingAllTasks]";
    _os_log_impl(&dword_214934000, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  performer = self->_performer;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __44__SVXTaskTrackingCenter_endTrackingAllTasks__block_invoke;
  v5[3] = &unk_24D24EFF0;
  v5[4] = self;
  -[SVXPerforming performBlock:](performer, "performBlock:", v5);
}

- (void)getContextsOfAllTrackedTasksUsingBlock:(id)a3
{
  id v4;
  void *v5;
  SVXPerforming *performer;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    performer = self->_performer;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __64__SVXTaskTrackingCenter_getContextsOfAllTrackedTasksUsingBlock___block_invoke;
    v7[3] = &unk_24D24EF28;
    v7[4] = self;
    v8 = v4;
    -[SVXPerforming performBlock:](performer, "performBlock:", v7);

  }
}

- (void)getContextsOfAllTrackedTasksUsingSyncBlock:(id)a3
{
  id v4;
  void *v5;
  SVXPerforming *performer;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    performer = self->_performer;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __68__SVXTaskTrackingCenter_getContextsOfAllTrackedTasksUsingSyncBlock___block_invoke;
    v7[3] = &unk_24D24EF28;
    v7[4] = self;
    v8 = v4;
    -[SVXPerforming performBlockSync:](performer, "performBlockSync:", v7);

  }
}

- (void)taskTracker:(id)a3 childWillBegin:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  SVXPerforming *performer;
  id v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v15 = "-[SVXTaskTrackingCenter taskTracker:childWillBegin:]";
    v16 = 2112;
    v17 = v6;
    v18 = 2112;
    v19 = v7;
    _os_log_impl(&dword_214934000, v8, OS_LOG_TYPE_INFO, "%s taskTracker = %@, childTaskTracker = %@", buf, 0x20u);
  }
  objc_msgSend(v7, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  performer = self->_performer;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __52__SVXTaskTrackingCenter_taskTracker_childWillBegin___block_invoke;
  v12[3] = &unk_24D24F018;
  v12[4] = self;
  v13 = v9;
  v11 = v9;
  -[SVXPerforming performBlock:](performer, "performBlock:", v12);

}

- (void)taskTrackerDidEnd:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  SVXPerforming *performer;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v12 = "-[SVXTaskTrackingCenter taskTrackerDidEnd:]";
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_214934000, v5, OS_LOG_TYPE_INFO, "%s taskTracker = %@", buf, 0x16u);
  }
  objc_msgSend(v4, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  performer = self->_performer;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __43__SVXTaskTrackingCenter_taskTrackerDidEnd___block_invoke;
  v9[3] = &unk_24D24F018;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  -[SVXPerforming performBlock:](performer, "performBlock:", v9);

}

- (void)_beginContext:(id)a3
{
  SVXTaskTrackingCenter *v4;
  uint64_t v5;
  os_log_t *v6;
  NSObject *v7;
  id WeakRetained;
  NSObject *v9;
  id v10;
  NSObject *v11;
  NSMutableSet *contexts;
  NSObject *v13;
  uint64_t v14;
  int v15;
  const char *v16;
  __int16 v17;
  SVXTaskTrackingCenter *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = (SVXTaskTrackingCenter *)a3;
  if (v4 && (-[NSMutableSet containsObject:](self->_contexts, "containsObject:", v4) & 1) == 0)
  {
    v5 = -[NSMutableSet count](self->_contexts, "count");
    v6 = (os_log_t *)MEMORY[0x24BE08FB0];
    if (!v5)
    {
      v7 = *MEMORY[0x24BE08FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
      {
        v15 = 136315394;
        v16 = "-[SVXTaskTrackingCenter _beginContext:]";
        v17 = 2112;
        v18 = self;
        _os_log_impl(&dword_214934000, v7, OS_LOG_TYPE_INFO, "%s %@ will become busy.", (uint8_t *)&v15, 0x16u);
      }
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "taskTrackingCenterWillBecomeBusy:", self);

    }
    v9 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_INFO))
    {
      v15 = 136315394;
      v16 = "-[SVXTaskTrackingCenter _beginContext:]";
      v17 = 2112;
      v18 = v4;
      _os_log_impl(&dword_214934000, v9, OS_LOG_TYPE_INFO, "%s Adding %@.", (uint8_t *)&v15, 0x16u);
    }
    -[NSMutableSet addObject:](self->_contexts, "addObject:", v4);
    v10 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v10, "taskTrackingCenter:didBeginTrackingTaskWithContext:", self, v4);

    v11 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_INFO))
    {
      v15 = 136315394;
      v16 = "-[SVXTaskTrackingCenter _beginContext:]";
      v17 = 2112;
      v18 = v4;
      _os_log_impl(&dword_214934000, v11, OS_LOG_TYPE_INFO, "%s Added %@.", (uint8_t *)&v15, 0x16u);
      v11 = *v6;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      contexts = self->_contexts;
      v13 = v11;
      v14 = -[NSMutableSet count](contexts, "count");
      v15 = 136315394;
      v16 = "-[SVXTaskTrackingCenter _beginContext:]";
      v17 = 2048;
      v18 = (SVXTaskTrackingCenter *)v14;
      _os_log_impl(&dword_214934000, v13, OS_LOG_TYPE_INFO, "%s numberOfContexts = %tu", (uint8_t *)&v15, 0x16u);

    }
  }

}

- (void)_endContext:(id)a3
{
  SVXTaskTrackingCenter *v4;
  os_log_t *v5;
  NSObject *v6;
  id WeakRetained;
  NSObject *v8;
  NSMutableSet *contexts;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  int v14;
  const char *v15;
  __int16 v16;
  SVXTaskTrackingCenter *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = (SVXTaskTrackingCenter *)a3;
  if (v4 && -[NSMutableSet containsObject:](self->_contexts, "containsObject:", v4))
  {
    v5 = (os_log_t *)MEMORY[0x24BE08FB0];
    v6 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
    {
      v14 = 136315394;
      v15 = "-[SVXTaskTrackingCenter _endContext:]";
      v16 = 2112;
      v17 = v4;
      _os_log_impl(&dword_214934000, v6, OS_LOG_TYPE_INFO, "%s Removing %@.", (uint8_t *)&v14, 0x16u);
    }
    -[NSMutableSet removeObject:](self->_contexts, "removeObject:", v4);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "taskTrackingCenter:didEndTrackingTaskWithContext:", self, v4);

    v8 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_INFO))
    {
      v14 = 136315394;
      v15 = "-[SVXTaskTrackingCenter _endContext:]";
      v16 = 2112;
      v17 = v4;
      _os_log_impl(&dword_214934000, v8, OS_LOG_TYPE_INFO, "%s Removed %@.", (uint8_t *)&v14, 0x16u);
      v8 = *v5;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      contexts = self->_contexts;
      v10 = v8;
      v11 = -[NSMutableSet count](contexts, "count");
      v14 = 136315394;
      v15 = "-[SVXTaskTrackingCenter _endContext:]";
      v16 = 2048;
      v17 = (SVXTaskTrackingCenter *)v11;
      _os_log_impl(&dword_214934000, v10, OS_LOG_TYPE_INFO, "%s numberOfContexts = %tu", (uint8_t *)&v14, 0x16u);

    }
    if (!-[NSMutableSet count](self->_contexts, "count"))
    {
      v12 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_INFO))
      {
        v14 = 136315394;
        v15 = "-[SVXTaskTrackingCenter _endContext:]";
        v16 = 2112;
        v17 = self;
        _os_log_impl(&dword_214934000, v12, OS_LOG_TYPE_INFO, "%s %@ did become idle.", (uint8_t *)&v14, 0x16u);
      }
      v13 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v13, "taskTrackingCenterDidBecomeIdle:", self);

    }
  }

}

- (void)_endContextsPassingTest:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject **v6;
  NSObject *v7;
  NSMutableSet *contexts;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[NSMutableSet count](self->_contexts, "count");
  v6 = (NSObject **)MEMORY[0x24BE08FB0];
  v7 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v24 = "-[SVXTaskTrackingCenter _endContextsPassingTest:]";
    v25 = 2048;
    v26 = v5;
    _os_log_impl(&dword_214934000, v7, OS_LOG_TYPE_INFO, "%s numberOfContexts = %tu", buf, 0x16u);
  }
  if (v5)
  {
    contexts = self->_contexts;
    if (v4)
    {
      -[NSMutableSet objectsPassingTest:](contexts, "objectsPassingTest:", v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = (void *)-[NSMutableSet copy](contexts, "copy");
    }
    v10 = v9;
    v11 = objc_msgSend(v9, "count");
    v12 = *v6;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v24 = "-[SVXTaskTrackingCenter _endContextsPassingTest:]";
      v25 = 2048;
      v26 = v11;
      _os_log_impl(&dword_214934000, v12, OS_LOG_TYPE_INFO, "%s numberOfContextsToEnd = %tu", buf, 0x16u);
    }
    if (v11)
    {
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v13 = v10;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v19;
        do
        {
          v17 = 0;
          do
          {
            if (*(_QWORD *)v19 != v16)
              objc_enumerationMutation(v13);
            -[SVXTaskTrackingCenter _endContext:](self, "_endContext:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v17++), (_QWORD)v18);
          }
          while (v15 != v17);
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        }
        while (v15);
      }

    }
  }

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_contexts, 0);
  objc_storeStrong((id *)&self->_performer, 0);
}

uint64_t __43__SVXTaskTrackingCenter_taskTrackerDidEnd___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_endContext:", *(_QWORD *)(a1 + 40));
}

uint64_t __52__SVXTaskTrackingCenter_taskTracker_childWillBegin___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_beginContext:", *(_QWORD *)(a1 + 40));
}

void __68__SVXTaskTrackingCenter_getContextsOfAllTrackedTasksUsingSyncBlock___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "copy");
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __64__SVXTaskTrackingCenter_getContextsOfAllTrackedTasksUsingBlock___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "copy");
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

uint64_t __44__SVXTaskTrackingCenter_endTrackingAllTasks__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_endContextsPassingTest:", 0);
}

uint64_t __53__SVXTaskTrackingCenter_endTrackingTasksPassingTest___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_endContextsPassingTest:", *(_QWORD *)(a1 + 40));
}

uint64_t __52__SVXTaskTrackingCenter_endTrackingTaskWithContext___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_endContext:", *(_QWORD *)(a1 + 40));
}

uint64_t __77__SVXTaskTrackingCenter_beginTrackingTaskWithContext_instrumentationContext___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_beginContext:", *(_QWORD *)(a1 + 40));
}

@end
