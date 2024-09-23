@implementation SWDatastoreManager

- (SWDatastoreManager)initWithLogger:(id)a3 documentStateProvider:(id)a4 datastoreSynchronizationManager:(id)a5
{
  id v9;
  id v10;
  id v11;
  SWDatastoreManager *v12;
  SWDatastoreManager *v13;
  uint64_t v14;
  NSHashTable *observers;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)SWDatastoreManager;
  v12 = -[SWDatastoreManager init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_logger, a3);
    objc_storeStrong((id *)&v13->_documentStateProvider, a4);
    objc_storeStrong((id *)&v13->_datastoreSynchronizationManager, a5);
    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v14 = objc_claimAutoreleasedReturnValue();
    observers = v13->_observers;
    v13->_observers = (NSHashTable *)v14;

  }
  return v13;
}

- (SWDatastore)datastore
{
  SWDatastore *privateDatastore;

  privateDatastore = self->_privateDatastore;
  if (privateDatastore)
    return privateDatastore;
  +[SWDatastore emptyDatastore](SWDatastore, "emptyDatastore");
  return (SWDatastore *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)updateDatastore:(id)a3 originatingSession:(id)a4 completion:(id)a5
{
  -[SWDatastoreManager updateDatastore:originatingSession:forceUpdate:completion:](self, "updateDatastore:originatingSession:forceUpdate:completion:", a3, a4, 0, a5);
}

- (void)updateDatastore:(id)a3 originatingSession:(id)a4 forceUpdate:(BOOL)a5 completion:(id)a6
{
  id v11;
  id v12;
  void (**v13)(_QWORD);
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = (void (**)(_QWORD))a6;
  if (a5 || v11 && !-[SWDatastore isEqual:](self->_privateDatastore, "isEqual:", v11))
  {
    -[SWDatastoreManager logger](self, "logger");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v12, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", CFSTR("Processing datastore update message from session: %@"), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "log:", v17);

    -[SWDatastoreManager datastore](self, "datastore");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&self->_privateDatastore, a3);
    -[SWDatastoreManager logger](self, "logger");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Notifying observers and updating datastore to store"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "log:", v20);

    -[SWDatastoreManager datastoreSynchronizationManager](self, "datastoreSynchronizationManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "synchronizeDatastore:from:previousDatastore:originatingSession:completion:", v11, self, v18, v12, v13);

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    -[SWDatastoreManager observers](self, "observers");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "allObjects");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v29;
      do
      {
        v27 = 0;
        do
        {
          if (*(_QWORD *)v29 != v26)
            objc_enumerationMutation(v23);
          objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v27++), "datastoreManager:didChangeFromDatastore:toDatastore:originatingSession:", self, v18, v11, v12);
        }
        while (v25 != v27);
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v25);
    }

  }
  else if (v13)
  {
    v13[2](v13);
  }

}

- (void)addObserver:(id)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    -[SWDatastoreManager observers](self, "observers");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v4);

  }
}

- (void)removeObserver:(id)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    -[SWDatastoreManager observers](self, "observers");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObject:", v4);

  }
}

- (SWDatastore)privateDatastore
{
  return self->_privateDatastore;
}

- (void)setPrivateDatastore:(id)a3
{
  objc_storeStrong((id *)&self->_privateDatastore, a3);
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (SWLogger)logger
{
  return self->_logger;
}

- (SWDocumentStateProviding)documentStateProvider
{
  return self->_documentStateProvider;
}

- (SWDatastoreSynchronizationManager)datastoreSynchronizationManager
{
  return self->_datastoreSynchronizationManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_datastoreSynchronizationManager, 0);
  objc_storeStrong((id *)&self->_documentStateProvider, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_privateDatastore, 0);
}

@end
