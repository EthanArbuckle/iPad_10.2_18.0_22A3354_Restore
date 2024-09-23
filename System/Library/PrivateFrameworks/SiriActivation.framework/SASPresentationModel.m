@implementation SASPresentationModel

- (SASPresentationModel)initWithPresentationServer:(id)a3
{
  id v5;
  SASPresentationModel *v6;
  SASPresentationModel *v7;
  NSMutableArray *v8;
  NSMutableArray *enqueuedButtonEventCompletions;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SASPresentationModel;
  v6 = -[SASPresentationModel init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_presentationServer, a3);
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    enqueuedButtonEventCompletions = v7->_enqueuedButtonEventCompletions;
    v7->_enqueuedButtonEventCompletions = v8;

  }
  return v7;
}

- (void)flushEnqueuedButtonEventCompletions
{
  void *v3;
  NSMutableArray *enqueuedButtonEventCompletions;
  NSObject *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[128];
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (-[NSMutableArray count](self->_enqueuedButtonEventCompletions, "count"))
  {
    v3 = (void *)*MEMORY[0x1E0CFE6A0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
    {
      enqueuedButtonEventCompletions = self->_enqueuedButtonEventCompletions;
      v5 = v3;
      *(_DWORD *)buf = 136315394;
      v19 = "-[SASPresentationModel flushEnqueuedButtonEventCompletions]";
      v20 = 2048;
      v21 = -[NSMutableArray count](enqueuedButtonEventCompletions, "count");
      _os_log_impl(&dword_1D132F000, v5, OS_LOG_TYPE_DEFAULT, "%s #activation sending completions for %lu cached event(s)", buf, 0x16u);

    }
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = self->_enqueuedButtonEventCompletions;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10);
          -[SASPresentationModel presentationServer](self, "presentationServer", (_QWORD)v13);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);

          ++v10;
        }
        while (v8 != v10);
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

    -[NSMutableArray removeAllObjects](self->_enqueuedButtonEventCompletions, "removeAllObjects");
  }
}

- (SASPresentationServer)presentationServer
{
  return self->_presentationServer;
}

- (int64_t)requestState
{
  return self->_requestState;
}

- (void)setRequestState:(int64_t)a3
{
  self->_requestState = a3;
}

- (NSMutableArray)enqueuedButtonEventCompletions
{
  return self->_enqueuedButtonEventCompletions;
}

- (void)setEnqueuedButtonEventCompletions:(id)a3
{
  objc_storeStrong((id *)&self->_enqueuedButtonEventCompletions, a3);
}

- (NSTimer)pingTimer
{
  return self->_pingTimer;
}

- (void)setPingTimer:(id)a3
{
  objc_storeStrong((id *)&self->_pingTimer, a3);
}

- (SASPresentationState)presentationState
{
  return self->_presentationState;
}

- (void)setPresentationState:(id)a3
{
  objc_storeStrong((id *)&self->_presentationState, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentationState, 0);
  objc_storeStrong((id *)&self->_pingTimer, 0);
  objc_storeStrong((id *)&self->_enqueuedButtonEventCompletions, 0);
  objc_storeStrong((id *)&self->_presentationServer, 0);
}

@end
