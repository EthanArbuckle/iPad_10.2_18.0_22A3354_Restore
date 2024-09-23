@implementation SSKNullDisplaySource

- (SSKNullDisplaySource)initWithMainDisplay:(id)a3
{
  id v5;
  SSKNullDisplaySource *v6;
  uint64_t v7;
  NSMutableSet *displayObservers;
  uint64_t v9;
  NSMutableDictionary *connectedIdentityToConfiguration;
  NSMutableDictionary *v11;
  void *v12;
  uint64_t v13;
  FBSDisplayIdentity *mainIdentity;
  id transformScheduler;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SSKNullDisplaySource;
  v6 = -[SSKNullDisplaySource init](&v17, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v7 = objc_claimAutoreleasedReturnValue();
    displayObservers = v6->_displayObservers;
    v6->_displayObservers = (NSMutableSet *)v7;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v9 = objc_claimAutoreleasedReturnValue();
    connectedIdentityToConfiguration = v6->_connectedIdentityToConfiguration;
    v6->_connectedIdentityToConfiguration = (NSMutableDictionary *)v9;

    v11 = v6->_connectedIdentityToConfiguration;
    objc_msgSend(v5, "identity");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v11, "setObject:forKey:", v5, v12);

    objc_storeStrong((id *)&v6->_mainConfiguration, a3);
    objc_msgSend(v5, "identity");
    v13 = objc_claimAutoreleasedReturnValue();
    mainIdentity = v6->_mainIdentity;
    v6->_mainIdentity = (FBSDisplayIdentity *)v13;

    transformScheduler = v6->_transformScheduler;
    v6->_transformScheduler = &__block_literal_global;

  }
  return v6;
}

uint64_t __44__SSKNullDisplaySource_initWithMainDisplay___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

- (NSSet)connectedIdentities
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCF20];
  -[NSMutableDictionary allKeys](self->_connectedIdentityToConfiguration, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

- (id)configurationForIdentity:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_connectedIdentityToConfiguration, "objectForKey:", a3);
}

- (void)addObserver:(id)a3
{
  -[NSMutableSet addObject:](self->_displayObservers, "addObject:", a3);
}

- (void)removeObserver:(id)a3
{
  -[NSMutableSet removeObject:](self->_displayObservers, "removeObject:", a3);
}

- (void)updateTransformsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v5 = v4;
  if (self->_displayTransformer)
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __55__SSKNullDisplaySource_updateTransformsWithCompletion___block_invoke;
    v6[3] = &unk_25171C208;
    v6[4] = self;
    v7 = v4;
    dispatch_async(MEMORY[0x24BDAC9B8], v6);

  }
  else if (v4)
  {
    dispatch_async(MEMORY[0x24BDAC9B8], v4);
  }

}

void __55__SSKNullDisplaySource_updateTransformsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  _QWORD v4[5];
  id v5;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = *(_QWORD *)(v1 + 24);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __55__SSKNullDisplaySource_updateTransformsWithCompletion___block_invoke_2;
  v4[3] = &unk_25171C208;
  v4[4] = v1;
  v5 = v2;
  (*(void (**)(uint64_t, _QWORD *))(v3 + 16))(v3, v4);

}

void __55__SSKNullDisplaySource_updateTransformsWithCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t k;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t m;
  void *v33;
  void *v34;
  void *v35;
  _QWORD block[4];
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v50, v57, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v51;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v51 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
        objc_msgSend(v10, "identity", v35);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isRootIdentity");

        if (v12)
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "transformDisplayConfiguration:", v10);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "unionSet:", v13);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v50, v57, 16);
    }
    while (v7);
  }

  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithSet:", v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v35;
  objc_msgSend(v14, "minusSet:", v35);
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v16 = v14;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v47;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v47 != v19)
          objc_enumerationMutation(v16);
        objc_msgSend(*(id *)(a1 + 32), "connectDisplay:", *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * j), v35);
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
    }
    while (v18);
  }

  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithSet:", v4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "intersectSet:", v15);
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v22 = v21;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v42, v55, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v43;
    do
    {
      for (k = 0; k != v24; ++k)
      {
        if (*(_QWORD *)v43 != v25)
          objc_enumerationMutation(v22);
        objc_msgSend(*(id *)(a1 + 32), "updateDisplay:", *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * k), v35);
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v42, v55, 16);
    }
    while (v24);
  }

  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithSet:", v15);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "minusSet:", v4);
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v28 = v27;
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v38, v54, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v39;
    do
    {
      for (m = 0; m != v30; ++m)
      {
        if (*(_QWORD *)v39 != v31)
          objc_enumerationMutation(v28);
        v33 = *(void **)(a1 + 32);
        objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * m), "identity", v35);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "disconnectDisplay:", v34);

      }
      v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v38, v54, 16);
    }
    while (v30);
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__SSKNullDisplaySource_updateTransformsWithCompletion___block_invoke_3;
  block[3] = &unk_25171C1E0;
  v37 = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __55__SSKNullDisplaySource_updateTransformsWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)connectDisplay:(id)a3
{
  id v4;
  NSMutableDictionary *connectedIdentityToConfiguration;
  void *v6;
  void *v7;
  NSMutableDictionary *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  connectedIdentityToConfiguration = self->_connectedIdentityToConfiguration;
  objc_msgSend(v4, "identity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](connectedIdentityToConfiguration, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = self->_connectedIdentityToConfiguration;
    objc_msgSend(v4, "identity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v4, v9);

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v10 = (void *)-[NSMutableSet copy](self->_displayObservers, "copy", 0);
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v18;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v18 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v14);
          objc_msgSend(v4, "identity");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "displaySource:didConnectIdentity:withConfiguration:", self, v16, v4);

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v12);
    }

  }
}

- (void)updateDisplay:(id)a3
{
  id v4;
  NSMutableDictionary *connectedIdentityToConfiguration;
  void *v6;
  void *v7;
  NSMutableDictionary *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  connectedIdentityToConfiguration = self->_connectedIdentityToConfiguration;
  objc_msgSend(v4, "identity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](connectedIdentityToConfiguration, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = self->_connectedIdentityToConfiguration;
    objc_msgSend(v4, "identity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v4, v9);

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v10 = (void *)-[NSMutableSet copy](self->_displayObservers, "copy", 0);
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v18;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v18 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v14);
          objc_msgSend(v4, "identity");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "displaySource:didUpdateIdentity:withConfiguration:", self, v16, v4);

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v12);
    }

  }
}

- (void)disconnectDisplay:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[NSMutableDictionary objectForKey:](self->_connectedIdentityToConfiguration, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = (void *)-[NSMutableSet copy](self->_displayObservers, "copy", 0);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "displaySource:willDisconnectIdentity:", self, v4);
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

    -[NSMutableDictionary removeObjectForKey:](self->_connectedIdentityToConfiguration, "removeObjectForKey:", v4);
  }

}

- (FBSDisplayTransformer)displayTransformer
{
  return self->_displayTransformer;
}

- (void)setDisplayTransformer:(id)a3
{
  objc_storeStrong((id *)&self->_displayTransformer, a3);
}

- (id)transformScheduler
{
  return self->_transformScheduler;
}

- (void)setTransformScheduler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (FBSDisplayIdentity)mainIdentity
{
  return self->_mainIdentity;
}

- (FBSDisplayConfiguration)mainConfiguration
{
  return self->_mainConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mainConfiguration, 0);
  objc_storeStrong((id *)&self->_mainIdentity, 0);
  objc_storeStrong((id *)&self->_displayTransformer, 0);
  objc_storeStrong(&self->_transformScheduler, 0);
  objc_storeStrong((id *)&self->_connectedIdentityToConfiguration, 0);
  objc_storeStrong((id *)&self->_displayObservers, 0);
}

@end
