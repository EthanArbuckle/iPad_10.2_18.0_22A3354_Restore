@implementation SXMutableComponents

- (id)description
{
  void *v2;
  void *v3;

  -[SXComponents components](self, "components");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)debugDescription
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x24BDD16A8]);
  v4 = objc_opt_class();
  -[SXMutableComponents debugDescriptionForComponents:depth:](self, "debugDescriptionForComponents:depth:", self, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %p>\n%@"), v4, self, v5);

  return v6;
}

- (id)debugDescriptionForComponents:(id)a3 depth:(unint64_t)a4
{
  void *v5;
  unint64_t i;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t j;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v19;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v19 = a3;
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 2 * a4; i; --i)
    objc_msgSend(v5, "appendString:", CFSTR(" "));
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(v19, "components");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    v11 = a4 + 1;
    do
    {
      for (j = 0; j != v9; ++j)
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * j);
        objc_msgSend(v7, "appendFormat:", CFSTR("%@%@\n"), v5, v13);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v13, "identifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "componentsForContainerComponentWithIdentifier:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          -[SXMutableComponents debugDescriptionForComponents:depth:](self, "debugDescriptionForComponents:depth:", v15, v11);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "appendString:", v16);

        }
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v9);
  }

  return v7;
}

@end
