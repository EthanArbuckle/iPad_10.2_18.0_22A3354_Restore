@implementation SBSceneDataStore

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_archivedObjectCache, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (id)safeObjectForKey:(id)a3 ofType:(Class)a4
{
  id v6;
  void *v7;

  v6 = a3;
  BSDispatchQueueAssertMain();
  -[NSMutableDictionary bs_safeObjectForKey:ofType:](self->_data, "bs_safeObjectForKey:ofType:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_initWithIdentifier:(id)a3 data:(id)a4 changeHandler:(id)a5
{
  id v10;
  id v11;
  id v12;
  SBSceneDataStore *v13;
  SBSceneDataStore *v14;
  uint64_t v15;
  id handler;
  NSMutableDictionary *v17;
  NSMutableDictionary *archivedObjectCache;
  void *v20;
  void *v21;
  void *v22;
  objc_super v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneDataStore.m"), 46, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("data"));

    if (v12)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneDataStore.m"), 45, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

  if (!v11)
    goto LABEL_8;
LABEL_3:
  if (v12)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneDataStore.m"), 47, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("changeHandler"));

LABEL_4:
  v23.receiver = self;
  v23.super_class = (Class)SBSceneDataStore;
  v13 = -[SBSceneDataStore init](&v23, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_identifier, a3);
    objc_storeStrong((id *)&v14->_data, a4);
    v15 = MEMORY[0x1D17E5550](v12);
    handler = v14->_handler;
    v14->_handler = (id)v15;

    v14->_invalidated = 0;
    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    archivedObjectCache = v14->_archivedObjectCache;
    v14->_archivedObjectCache = v17;

  }
  return v14;
}

- (id)objectForKey:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  BSDispatchQueueAssertMain();
  -[NSMutableDictionary objectForKey:](self->_data, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSDictionary)_data
{
  return &self->_data->super;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  BSDispatchQueueAssertMain();
  -[NSMutableDictionary objectForKey:](self->_data, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7 || (objc_msgSend(v7, "isEqual:", v9) & 1) == 0)
  {
    -[NSMutableDictionary setObject:forKey:](self->_data, "setObject:forKey:", v9, v6);
    -[SBSceneDataStore _invokeChangeHandler](self, "_invokeChangeHandler");
  }

}

- (void)_invokeChangeHandler
{
  void (**handler)(id, SBSceneDataStore *);
  void *v5;

  BSDispatchQueueAssertMain();
  if (self->_invalidated)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneDataStore.m"), 161, CFSTR("Cannot modify a scene data store that has been invalidated."));

  }
  handler = (void (**)(id, SBSceneDataStore *))self->_handler;
  if (handler)
    handler[2](handler, self);
}

- (void)setArchivedObject:(id)a3 forKey:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;

  v7 = a3;
  v8 = a4;
  BSDispatchQueueAssertMain();
  -[NSMutableDictionary objectForKey:](self->_archivedObjectCache, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9 || (objc_msgSend(v9, "isEqual:", v7) & 1) == 0)
  {
    if (v7)
    {
      v14 = 0;
      objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v7, 1, &v14);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v14;
      if (!v11)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneDataStore.m"), 100, CFSTR("%@ (key: %@)"), v12, v8);

      }
      -[NSMutableDictionary setObject:forKey:](self->_archivedObjectCache, "setObject:forKey:", v7, v8);
    }
    else
    {
      v11 = 0;
    }
    -[SBSceneDataStore setObject:forKey:](self, "setObject:forKey:", v11, v8);

  }
}

- (id)unarchivedObjectOfClass:(Class)a3 forKey:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v12;
  id v13;

  v7 = a4;
  BSDispatchQueueAssertMain();
  -[NSMutableDictionary objectForKey:](self->_archivedObjectCache, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    -[NSMutableDictionary objectForKey:](self->_data, "objectForKey:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v13 = 0;
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", a3, v9, &v13);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v13;
      if (!v8)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneDataStore.m"), 121, CFSTR("%@ (key: %@)"), v10, v7);

      }
      -[NSMutableDictionary setObject:forKey:](self->_archivedObjectCache, "setObject:forKey:", v8, v7);

    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

- (void)removeObjectForKey:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  BSDispatchQueueAssertMain();
  -[NSMutableDictionary objectForKey:](self->_data, "objectForKey:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_data, "removeObjectForKey:", v5);
    -[SBSceneDataStore _invokeChangeHandler](self, "_invokeChangeHandler");
  }

}

- (void)removeAllObjects
{
  BSDispatchQueueAssertMain();
  if (-[NSMutableDictionary count](self->_data, "count"))
  {
    -[NSMutableDictionary removeAllObjects](self->_data, "removeAllObjects");
    -[SBSceneDataStore _invokeChangeHandler](self, "_invokeChangeHandler");
  }
}

- (void)_invalidate
{
  id handler;

  self->_invalidated = 1;
  handler = self->_handler;
  self->_handler = 0;

}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)_isInvalidated
{
  return self->_invalidated;
}

@end
