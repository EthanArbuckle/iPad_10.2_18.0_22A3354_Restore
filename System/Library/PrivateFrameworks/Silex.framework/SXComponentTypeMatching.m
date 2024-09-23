@implementation SXComponentTypeMatching

- (SXComponentTypeMatching)init
{
  SXComponentTypeMatching *v2;
  uint64_t v3;
  NSMutableArray *descriptions;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SXComponentTypeMatching;
  v2 = -[SXComponentTypeMatching init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    descriptions = v2->_descriptions;
    v2->_descriptions = (NSMutableArray *)v3;

  }
  return v2;
}

- (id)match:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  int v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[SXComponentTypeMatching descriptions](self, "descriptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (!v6)
  {
    v22 = 0;
    v8 = 0;
    goto LABEL_16;
  }
  v7 = v6;
  v22 = 0;
  v8 = 0;
  v9 = *(_QWORD *)v24;
  do
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v24 != v9)
        objc_enumerationMutation(v5);
      v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
      objc_msgSend(v4, "type");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "type");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "isEqualToString:", v13);

      if (v14)
      {
        if (!objc_msgSend(v11, "role"))
        {
          v16 = v22;
          v22 = v11;
          v17 = v8;
LABEL_11:
          v18 = v11;

          v8 = v17;
          continue;
        }
        v15 = objc_msgSend(v11, "role");
        v16 = v8;
        v17 = v11;
        if (v15 == objc_msgSend(v4, "role"))
          goto LABEL_11;
      }
    }
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  }
  while (v7);
LABEL_16:

  if (v8)
    v19 = v8;
  else
    v19 = v22;
  v20 = v19;

  return v20;
}

- (void)addDescription:(id)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    -[SXComponentTypeMatching descriptions](self, "descriptions");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v4);

  }
}

- (void)removeDescription:(id)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    -[SXComponentTypeMatching descriptions](self, "descriptions");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObject:", v4);

  }
}

- (NSMutableArray)descriptions
{
  return self->_descriptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptions, 0);
}

@end
