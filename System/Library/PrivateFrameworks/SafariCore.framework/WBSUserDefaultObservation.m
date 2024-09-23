@implementation WBSUserDefaultObservation

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  NSObject *queue;
  _QWORD v16[5];
  id v17;
  objc_super v18;

  v10 = a3;
  if ((void *)kvoContext == a6)
  {
    v12 = *MEMORY[0x1E0CB2CC8];
    v13 = a5;
    objc_msgSend(v13, "objectForKeyedSubscript:", v12);
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]);
    v14 = objc_claimAutoreleasedReturnValue();

    if (v11 | v14 && (objc_msgSend((id)v11, "isEqual:", v14) & 1) == 0)
    {
      queue = self->_queue;
      if (queue)
      {
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __76__WBSUserDefaultObservation_observeValueForKeyPath_ofObject_change_context___block_invoke;
        v16[3] = &unk_1E649B6D8;
        v16[4] = self;
        v17 = v10;
        dispatch_async(queue, v16);

      }
      else
      {
        (*((void (**)(void))self->_handler + 2))();
      }
    }

  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)WBSUserDefaultObservation;
    v11 = (uint64_t)a5;
    -[WBSUserDefaultObservation observeValueForKeyPath:ofObject:change:context:](&v18, sel_observeValueForKeyPath_ofObject_change_context_, v10, a4, v11, a6);
  }

}

uint64_t __76__WBSUserDefaultObservation_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 16))();
}

- (WBSUserDefaultObservation)initWithUserDefaults:(id)a3 keys:(id)a4 queue:(id)a5 notifyForInitialValue:(BOOL)a6 handler:(id)a7
{
  _BOOL4 v8;
  id v13;
  id v14;
  id v15;
  id v16;
  WBSUserDefaultObservation *v17;
  WBSUserDefaultObservation *v18;
  uint64_t v19;
  id handler;
  uint64_t v21;
  NSArray *keys;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  WBSUserDefaultObservation *v29;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  objc_super v36;
  _BYTE v37[128];
  uint64_t v38;

  v8 = a6;
  v38 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  v36.receiver = self;
  v36.super_class = (Class)WBSUserDefaultObservation;
  v17 = -[WBSUserDefaultObservation init](&v36, sel_init);
  v18 = v17;
  if (v17)
  {
    v31 = v15;
    objc_storeStrong((id *)&v17->_defaults, a3);
    v19 = objc_msgSend(v16, "copy");
    handler = v18->_handler;
    v18->_handler = (id)v19;

    v21 = objc_msgSend(v14, "copy");
    keys = v18->_keys;
    v18->_keys = (NSArray *)v21;

    objc_storeStrong((id *)&v18->_queue, a5);
    v34 = 0u;
    v35 = 0u;
    if (v8)
      v23 = 7;
    else
      v23 = 3;
    v32 = 0uLL;
    v33 = 0uLL;
    v24 = v14;
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v33 != v27)
            objc_enumerationMutation(v24);
          objc_msgSend(v13, "addObserver:forKeyPath:options:context:", v18, *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i), v23, kvoContext);
        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      }
      while (v26);
    }

    v29 = v18;
    v15 = v31;
  }

  return v18;
}

- (void)dealloc
{
  objc_super v3;

  -[WBSUserDefaultObservation invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)WBSUserDefaultObservation;
  -[WBSUserDefaultObservation dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id handler;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (self->_handler)
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v3 = self->_keys;
    v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v10;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v10 != v6)
            objc_enumerationMutation(v3);
          -[NSUserDefaults removeObserver:forKeyPath:context:](self->_defaults, "removeObserver:forKeyPath:context:", self, *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7++), kvoContext, (_QWORD)v9);
        }
        while (v5 != v7);
        v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v5);
    }

    handler = self->_handler;
    self->_handler = 0;

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_keys, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
}

@end
