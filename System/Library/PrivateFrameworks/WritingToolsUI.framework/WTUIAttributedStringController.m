@implementation WTUIAttributedStringController

- (WTUIAttributedStringController)initWithContexts:(id)a3
{
  id v4;
  WTUIAttributedStringController *v5;
  uint64_t v6;
  NSMutableDictionary *contextsToDigests;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  NSMutableDictionary *v18;
  void *v19;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  objc_super v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)WTUIAttributedStringController;
  v5 = -[WTUIAttributedStringController init](&v26, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v6 = objc_claimAutoreleasedReturnValue();
    contextsToDigests = v5->_contextsToDigests;
    v5->_contextsToDigests = (NSMutableDictionary *)v6;

    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v21 = v4;
    v8 = v4;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v23;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v23 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v12);
          v14 = objc_alloc(MEMORY[0x24BEB4BC8]);
          objc_msgSend(v13, "attributedText");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "attributedText");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = (void *)objc_msgSend(v14, "initWithAttributedString:range:", v15, 0, objc_msgSend(v16, "length"));

          v18 = v5->_contextsToDigests;
          objc_msgSend(v13, "uuid");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v17, v19);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v10);
    }

    v4 = v21;
  }

  return v5;
}

- (id)digestedAttributedStringForContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[WTUIAttributedStringController contextsToDigests](self, "contextsToDigests");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "digestedAttributedString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)reconstitutedAttributedStringForContext:(id)a3 digestedAttributedString:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a4;
  v7 = a3;
  -[WTUIAttributedStringController contextsToDigests](self, "contextsToDigests");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "reconstituteAttributedString:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)reconstitutedAttributedStringForStitchedContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[WTUIAttributedStringController contextsToDigests](self, "contextsToDigests", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  v8 = v4;
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v15;
    v8 = v4;
    do
    {
      v11 = 0;
      v12 = v8;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11), "reconstituteAttributedString:", v12);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        ++v11;
        v12 = v8;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  return v8;
}

- (NSMutableDictionary)contextsToDigests
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setContextsToDigests:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextsToDigests, 0);
}

@end
