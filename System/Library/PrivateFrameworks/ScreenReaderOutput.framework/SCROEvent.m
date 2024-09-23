@implementation SCROEvent

+ (id)brailleEvent
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initForHandlerType:", 1);
}

- (id)initForHandlerType:(int)a3
{
  id result;

  result = -[SCROEvent init](self, "init");
  if (result)
    *((_DWORD *)result + 2) = a3;
  return result;
}

- (int)handlerType
{
  return self->_handlerType;
}

- (void)requestRegisterCallbackForKey:(int)a3
{
  uint64_t v3;
  NSMutableArray *callbacks;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  if (self->_readOnly)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("SCROEventException"), CFSTR("Error trying to register callbacks in a readonly SCROEvent"));
  }
  else
  {
    v3 = *(_QWORD *)&a3;
    callbacks = self->_callbacks;
    if (!callbacks)
    {
      v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v7 = self->_callbacks;
      self->_callbacks = v6;

      callbacks = self->_callbacks;
    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v3);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](callbacks, "addObject:", v8);

  }
}

- (void)requestSetValue:(id)a3 forKey:(int)a4
{
  uint64_t v4;
  uint64_t v6;
  void *v7;
  NSMutableDictionary *setDictionary;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = *(_QWORD *)&a4;
  v13 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = objc_msgSend(v13, "copy");

    v13 = (id)v6;
  }
  if (self->_readOnly)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("SCROEventException"), CFSTR("Error trying to request values to be set in a readonly SCROEvent"));
LABEL_5:
    v7 = v13;
    goto LABEL_11;
  }
  setDictionary = self->_setDictionary;
  if (!setDictionary)
  {
    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v10 = self->_setDictionary;
    self->_setDictionary = v9;

    setDictionary = self->_setDictionary;
  }
  v11 = v13;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](setDictionary, "setObject:forKey:", v11, v12);

  v7 = v13;
  if (!v13)
  {

    goto LABEL_5;
  }
LABEL_11:

}

- (void)requestValueForKey:(int)a3
{
  uint64_t v3;
  NSMutableDictionary *getDictionary;
  NSMutableDictionary *v6;
  NSMutableDictionary *v7;
  void *v8;
  id v9;

  if (self->_readOnly)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("SCROEventException"), CFSTR("Error trying to request values in a readonly SCROEvent"));
  }
  else
  {
    v3 = *(_QWORD *)&a3;
    getDictionary = self->_getDictionary;
    if (!getDictionary)
    {
      v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
      v7 = self->_getDictionary;
      self->_getDictionary = v6;

      getDictionary = self->_getDictionary;
    }
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](getDictionary, "setObject:forKey:", v9, v8);

  }
}

- (void)requestPerformActionForKey:(int)a3
{
  uint64_t v3;
  NSMutableArray *actions;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  if (self->_readOnly)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("SCROEventException"), CFSTR("Error trying to request perform action in a readonly SCROEvent"));
  }
  else
  {
    v3 = *(_QWORD *)&a3;
    actions = self->_actions;
    if (!actions)
    {
      v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v7 = self->_actions;
      self->_actions = v6;

      actions = self->_actions;
    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v3);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](actions, "addObject:", v8);

  }
}

- (id)claimValueForKey:(int)a3
{
  NSMutableDictionary *getDictionary;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  getDictionary = self->_getDictionary;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](getDictionary, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 == v6)
      v7 = 0;
    else
      v7 = v5;
    v8 = v7;

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (void)setMainDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  self->_readOnly = 1;
  v9 = v4;
  objc_msgSend(v4, "objectForKey:", &unk_24CC30E50);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_storeStrong((id *)&self->_callbacks, v5);
  objc_msgSend(v9, "objectForKey:", &unk_24CC30E68);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    objc_storeStrong((id *)&self->_setDictionary, v6);
  objc_msgSend(v9, "objectForKey:", &unk_24CC30E80);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    objc_storeStrong((id *)&self->_getDictionary, v7);
  objc_msgSend(v9, "objectForKey:", &unk_24CC30E98);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_storeStrong((id *)&self->_actions, v8);

}

- (id)mainDictionary
{
  void *v3;
  void *v4;
  NSMutableArray *callbacks;
  NSMutableDictionary *setDictionary;
  NSMutableDictionary *getDictionary;
  NSMutableArray *actions;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  callbacks = self->_callbacks;
  if (callbacks)
    objc_msgSend(v3, "setObject:forKey:", callbacks, &unk_24CC30E50);
  setDictionary = self->_setDictionary;
  if (setDictionary)
    objc_msgSend(v4, "setObject:forKey:", setDictionary, &unk_24CC30E68);
  getDictionary = self->_getDictionary;
  if (getDictionary)
    objc_msgSend(v4, "setObject:forKey:", getDictionary, &unk_24CC30E80);
  actions = self->_actions;
  if (actions)
    objc_msgSend(v4, "setObject:forKey:", actions, &unk_24CC30E98);
  return v4;
}

- (void)setClaimDictionary:(id)a3
{
  self->_readOnly = 1;
  objc_storeStrong((id *)&self->_getDictionary, a3);
}

- (id)claimDictionary
{
  return self->_getDictionary;
}

- (void)performWithHandler:(id)a3 trusted:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSMutableArray *callbacks;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  NSMutableDictionary *setDictionary;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSMutableDictionary *getDictionary;
  NSMutableDictionary *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t k;
  void *v28;
  int v29;
  id v30;
  void *v31;
  NSMutableDictionary *v32;
  void *v33;
  NSMutableArray *actions;
  NSMutableArray *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t m;
  NSMutableDictionary *obj;
  SCROEvent *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v4 = a4;
  v63 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(v6, "handlePerformActionForKey:trusted:", 1, v4);
  v41 = self;
  callbacks = self->_callbacks;
  if (callbacks)
  {
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    v8 = callbacks;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v55, v62, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v56;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v56 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(v6, "handleRegisterCallbackForKey:trusted:", objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * i), "intValue"), v4);
        }
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v55, v62, 16);
      }
      while (v10);
    }

  }
  setDictionary = v41->_setDictionary;
  if (setDictionary)
  {
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    obj = setDictionary;
    v14 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v52;
      do
      {
        for (j = 0; j != v15; ++j)
        {
          if (*(_QWORD *)v52 != v16)
            objc_enumerationMutation(obj);
          v18 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * j);
          -[NSMutableDictionary objectForKey:](v41->_setDictionary, "objectForKey:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDBCEF8], "null");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19 == v20)
            v21 = 0;
          else
            v21 = v19;
          objc_msgSend(v6, "handleSetValue:forKey:trusted:", v21, objc_msgSend(v18, "intValue"), v4);

        }
        v15 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
      }
      while (v15);
    }

  }
  getDictionary = v41->_getDictionary;
  if (getDictionary)
  {
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v23 = getDictionary;
    v24 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v47, v60, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v48;
      do
      {
        for (k = 0; k != v25; ++k)
        {
          if (*(_QWORD *)v48 != v26)
            objc_enumerationMutation(v23);
          v28 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * k);
          v46 = 0;
          v29 = objc_msgSend(v6, "handleGetValue:forKey:trusted:", &v46, objc_msgSend(v28, "intValue"), v4);
          v30 = v46;
          v31 = v30;
          if (!v29)
          {
            v32 = v41->_getDictionary;
            if (v30)
            {
              -[NSMutableDictionary setObject:forKey:](v41->_getDictionary, "setObject:forKey:", v30, v28);
            }
            else
            {
              objc_msgSend(MEMORY[0x24BDBCEF8], "null");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableDictionary setObject:forKey:](v32, "setObject:forKey:", v33, v28);

            }
          }

        }
        v25 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v47, v60, 16);
      }
      while (v25);
    }

  }
  actions = v41->_actions;
  if (actions)
  {
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v35 = actions;
    v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v42, v59, 16);
    if (v36)
    {
      v37 = v36;
      v38 = *(_QWORD *)v43;
      do
      {
        for (m = 0; m != v37; ++m)
        {
          if (*(_QWORD *)v43 != v38)
            objc_enumerationMutation(v35);
          objc_msgSend(v6, "handlePerformActionForKey:trusted:", objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * m), "intValue"), v4);
        }
        v37 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v42, v59, 16);
      }
      while (v37);
    }

  }
  objc_msgSend(v6, "handlePerformActionForKey:trusted:", 2, v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_getDictionary, 0);
  objc_storeStrong((id *)&self->_setDictionary, 0);
  objc_storeStrong((id *)&self->_callbacks, 0);
}

@end
