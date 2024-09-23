@implementation SASRequestTrigger

- (SASRequestTrigger)initWithRequestOptions:(id)a3 updateHandle:(id *)a4
{
  id v6;
  SASRequestTrigger *v7;
  SASRequestTrigger *v8;
  uint64_t v9;
  SASRequestOptions *options;
  void *v11;
  id v12;
  _QWORD v14[4];
  SASRequestTrigger *v15;
  objc_super v16;

  v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SASRequestTrigger;
  v7 = -[SASRequestTrigger init](&v16, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_state = a4 != 0;
    v9 = objc_msgSend(v6, "copy");
    options = v8->_options;
    v8->_options = (SASRequestOptions *)v9;

    if (v8->_state == 1)
      -[SASRequestOptions setUseAutomaticEndpointing:](v8->_options, "setUseAutomaticEndpointing:", 0);
    if (a4)
    {
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __57__SASRequestTrigger_initWithRequestOptions_updateHandle___block_invoke;
      v14[3] = &unk_1E91FCF28;
      v15 = v8;
      v11 = (void *)objc_msgSend(v14, "copy");
      v12 = *a4;
      *a4 = v11;

    }
  }

  return v8;
}

uint64_t __57__SASRequestTrigger_initWithRequestOptions_updateHandle___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateState:", a2);
}

- (void)_updateState:(int64_t)a3
{
  void *v4;
  NSMapTable *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  self->_state = a3;
  v4 = (void *)-[NSMapTable copy](self->_observers, "copy");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v4;
  v6 = -[NSMapTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        v11 = NSMapGet(v5, v10);
        objc_msgSend(v10, "performSelector:withObject:", v11, self, (_QWORD)v12);
      }
      v7 = -[NSMapTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

- (void)addTriggerTarget:(id)a3 action:(SEL)a4
{
  id v6;
  NSMapTable *observers;
  NSMapTable *v8;
  NSMapTable *v9;
  void *key;

  v6 = a3;
  observers = self->_observers;
  key = v6;
  if (!observers)
  {
    v8 = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 5, 2, 1);
    v9 = self->_observers;
    self->_observers = v8;

    v6 = key;
    observers = self->_observers;
  }
  NSMapInsert(observers, v6, a4);

}

- (void)removeTriggerTarget:(id)a3
{
  -[NSMapTable removeObjectForKey:](self->_observers, "removeObjectForKey:", a3);
}

- (SASRequestOptions)options
{
  return self->_options;
}

- (int64_t)state
{
  return self->_state;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_options, 0);
}

@end
