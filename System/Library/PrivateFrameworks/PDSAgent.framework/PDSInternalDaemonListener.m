@implementation PDSInternalDaemonListener

- (PDSInternalDaemonListener)initWithKVStore:(id)a3
{
  id v6;
  PDSInternalDaemonListener *v7;
  PDSInternalDaemonListener *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PDSInternalDaemonListener.m"), 22, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("kvStore"));

  }
  v11.receiver = self;
  v11.super_class = (Class)PDSInternalDaemonListener;
  v7 = -[PDSInternalDaemonListener init](&v11, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_kvStore, a3);

  return v8;
}

- (void)setStringValue:(id)a3 forKey:(id)a4 withCompletion:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD);
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;

  v14 = a3;
  v8 = a4;
  if (v8)
  {
    v9 = (void (**)(id, _QWORD))a5;
    -[PDSInternalDaemonListener kvStore](self, "kvStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setString:forKey:", v14, v8);

    v9[2](v9, 0);
  }
  else
  {
    v11 = (void *)MEMORY[0x24BDD1540];
    v12 = *MEMORY[0x24BE6E558];
    v13 = a5;
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, -305, 0);
    v9 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, id))a5 + 2))(v13, v9);

  }
}

- (void)setNumberValue:(id)a3 forKey:(id)a4 withCompletion:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD);
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;

  v14 = a3;
  v8 = a4;
  if (v8)
  {
    v9 = (void (**)(id, _QWORD))a5;
    -[PDSInternalDaemonListener kvStore](self, "kvStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setNumber:forKey:", v14, v8);

    v9[2](v9, 0);
  }
  else
  {
    v11 = (void *)MEMORY[0x24BDD1540];
    v12 = *MEMORY[0x24BE6E558];
    v13 = a5;
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, -305, 0);
    v9 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, id))a5 + 2))(v13, v9);

  }
}

- (void)setDataValue:(id)a3 forKey:(id)a4 withCompletion:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD);
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;

  v14 = a3;
  v8 = a4;
  if (v8)
  {
    v9 = (void (**)(id, _QWORD))a5;
    -[PDSInternalDaemonListener kvStore](self, "kvStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setData:forKey:", v14, v8);

    v9[2](v9, 0);
  }
  else
  {
    v11 = (void *)MEMORY[0x24BDD1540];
    v12 = *MEMORY[0x24BE6E558];
    v13 = a5;
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, -305, 0);
    v9 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, id))a5 + 2))(v13, v9);

  }
}

- (void)stringRepresentationForKey:(id)a3 withCompletion:(id)a4
{
  void (**v6)(id, void *, _QWORD);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v6 = (void (**)(id, void *, _QWORD))a4;
  if (v14)
  {
    -[PDSInternalDaemonListener kvStore](self, "kvStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringForKey:", v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v6[2](v6, v8, 0);
    }
    else
    {
      -[PDSInternalDaemonListener kvStore](self, "kvStore");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "dataForKey:", v14);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        objc_msgSend(v10, "__imHexString");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v6[2](v6, v11, 0);
      }
      else
      {
        -[PDSInternalDaemonListener kvStore](self, "kvStore");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "numberForKey:", v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          objc_msgSend(v11, "stringValue");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v6[2](v6, v13, 0);

        }
        else
        {
          v6[2](v6, 0, 0);
        }
      }

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE6E558], -305, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, void *))v6)[2](v6, 0, v8);
  }

}

- (void)kvStateDumpWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void (**v16)(id, id, _QWORD);
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v16 = (void (**)(id, id, _QWORD))a3;
  -[PDSInternalDaemonListener kvStore](self, "kvStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allStoredValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v7, "objectForKeyedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, v12);
          goto LABEL_13;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v13, "stringValue");
          v14 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            goto LABEL_13;
          objc_msgSend(v13, "__imHexString");
          v14 = objc_claimAutoreleasedReturnValue();
        }
        v15 = (void *)v14;
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, v12);

LABEL_13:
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

  v16[2](v16, v6, 0);
}

- (PDSKVStore)kvStore
{
  return self->_kvStore;
}

- (void)setKvStore:(id)a3
{
  objc_storeStrong((id *)&self->_kvStore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kvStore, 0);
}

@end
