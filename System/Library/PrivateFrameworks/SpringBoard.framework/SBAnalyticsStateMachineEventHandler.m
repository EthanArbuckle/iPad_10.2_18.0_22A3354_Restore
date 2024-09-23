@implementation SBAnalyticsStateMachineEventHandler

- (void)addEdge:(id)a3
{
  -[NSMutableArray addObject:](self->_edges, "addObject:", a3);
}

- (SBAnalyticsStateMachineEventHandler)init
{
  SBAnalyticsStateMachineEventHandler *v2;
  SBAnalyticsStateMachineEventHandler *v3;
  NSMutableArray *v4;
  NSMutableArray *edges;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBAnalyticsStateMachineEventHandler;
  v2 = -[SBAnalyticsStateMachineEventHandler init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_currentState = 0;
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    edges = v3->_edges;
    v3->_edges = v4;

  }
  return v3;
}

- (unint64_t)currentState
{
  return self->_currentState;
}

- (BOOL)handleEvent:(unint64_t)a3 withContext:(id)a4
{
  id v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  unint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = self->_edges;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v12, "fromState", (_QWORD)v15) == self->_currentState)
        {
          v13 = objc_msgSend(v12, "handleEvent:withContext:", a3, v6);
          if (self->_currentState != v13)
          {
            self->_currentState = v13;
            goto LABEL_12;
          }
        }
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_12:

  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_edges, 0);
}

@end
