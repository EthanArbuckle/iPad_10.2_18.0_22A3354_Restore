@implementation SVXServiceCommandHandlerRegistry

- (SVXServiceCommandHandlerRegistry)initWithHandlers:(id)a3
{
  id v4;
  SVXServiceCommandHandlerRegistry *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  objc_class *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSDictionary *handlersByServiceCommandClassName;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  objc_super v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)SVXServiceCommandHandlerRegistry;
  v5 = -[SVXServiceCommandHandlerRegistry init](&v36, sel_init);
  if (v5)
  {
    v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v27 = v4;
    v7 = v4;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v33 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
          v13 = (objc_class *)objc_msgSend((id)objc_opt_class(), "supportedCommandClass");
          NSStringFromClass(v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "objectForKey:", v14);
          v15 = (id)objc_claimAutoreleasedReturnValue();
          if (!v15)
          {
            v15 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
            objc_msgSend(v6, "setObject:forKey:", v15, v14);
          }
          objc_msgSend(v15, "addObject:", v12);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
      }
      while (v9);
    }

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    objc_msgSend(v6, "allKeys");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v29;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v29 != v19)
            objc_enumerationMutation(v16);
          v21 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * j);
          objc_msgSend(v6, "objectForKey:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = (void *)objc_msgSend(v22, "copy");
          objc_msgSend(v6, "setObject:forKey:", v23, v21);

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
      }
      while (v18);
    }

    v24 = objc_msgSend(v6, "copy");
    handlersByServiceCommandClassName = v5->_handlersByServiceCommandClassName;
    v5->_handlersByServiceCommandClassName = (NSDictionary *)v24;

    v4 = v27;
  }

  return v5;
}

- (id)handlersForCommand:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  objc_class *v7;
  NSDictionary *handlersByServiceCommandClassName;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v6 = objc_opt_class();
  if (v6)
  {
    v7 = (objc_class *)v6;
    while (1)
    {
      handlersByServiceCommandClassName = self->_handlersByServiceCommandClassName;
      NSStringFromClass(v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDictionary objectForKey:](handlersByServiceCommandClassName, "objectForKey:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v10, "count"))
        objc_msgSend(v5, "addObjectsFromArray:", v10);
      if (v7 == (objc_class *)objc_opt_class())
        break;
      v7 = (objc_class *)-[objc_class superclass](v7, "superclass");

      if (!v7)
        goto LABEL_9;
    }

  }
LABEL_9:
  v11 = (void *)objc_msgSend(v5, "copy");

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handlersByServiceCommandClassName, 0);
}

@end
