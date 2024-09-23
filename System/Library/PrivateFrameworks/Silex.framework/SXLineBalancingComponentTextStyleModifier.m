@implementation SXLineBalancingComponentTextStyleModifier

- (SXLineBalancingComponentTextStyleModifier)initWithSettings:(id)a3
{
  id v5;
  SXLineBalancingComponentTextStyleModifier *v6;
  SXLineBalancingComponentTextStyleModifier *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SXLineBalancingComponentTextStyleModifier;
  v6 = -[SXLineBalancingComponentTextStyleModifier init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_settings, a3);

  return v7;
}

- (void)modifyDOM:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (-[SXLineBalancingSettings enableLineBalancing](self->_settings, "enableLineBalancing"))
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    objc_msgSend(v6, "componentTextStyles", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allKeys");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v15;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v15 != v12)
            objc_enumerationMutation(v9);
          -[SXLineBalancingComponentTextStyleModifier enableLineBalancingForComponentTextStyleWithIdentifier:DOM:context:](self, "enableLineBalancingForComponentTextStyleWithIdentifier:DOM:context:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v13++), v6, v7);
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v11);
    }

  }
}

- (void)enableLineBalancingForComponentTextStyleWithIdentifier:(id)a3 DOM:(id)a4 context:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  SXComponentTextStyle *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;

  v18 = a3;
  v7 = a4;
  v8 = a5;
  objc_msgSend(v7, "componentTextStyles");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v18);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "textAlignment") == 2)
  {
    objc_msgSend(v10, "JSONRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (!v11)
      v11 = (void *)MEMORY[0x24BDBD1B8];
    v13 = (void *)objc_msgSend(v11, "mutableCopy");

    objc_msgSend(v13, "setObject:forKey:", MEMORY[0x24BDBD1C8], CFSTR("lineBalancing"));
    v14 = [SXComponentTextStyle alloc];
    objc_msgSend(v8, "specVersion");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[SXJSONObject initWithJSONObject:andVersion:](v14, "initWithJSONObject:andVersion:", v13, v15);

    objc_msgSend(v7, "componentTextStyles");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKey:", v16, v18);

    v10 = (void *)v16;
  }

}

- (SXLineBalancingSettings)settings
{
  return self->_settings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settings, 0);
}

@end
