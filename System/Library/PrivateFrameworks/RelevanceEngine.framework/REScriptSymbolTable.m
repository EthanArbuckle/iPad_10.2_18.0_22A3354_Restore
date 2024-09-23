@implementation REScriptSymbolTable

- (REScriptSymbolTable)initWithParentScope:(id)a3
{
  id v4;
  REScriptSymbolTable *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id *p_isa;
  REScriptSymbolTable *v14;
  uint64_t v15;
  NSMutableDictionary *definitions;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)REScriptSymbolTable;
  v5 = -[REScriptSymbolTable init](&v18, sel_init);
  if (v5)
  {
    v6 = v4;
    v4 = v6;
    if (v6)
    {
      p_isa = (id *)v6;
      while (p_isa != (id *)v5)
      {
        v14 = (REScriptSymbolTable *)p_isa[1];

        p_isa = (id *)&v14->super.isa;
        if (!v14)
          goto LABEL_9;
      }
      RERaiseInternalException((void *)*MEMORY[0x24BDBCAB8], CFSTR("Table cannot be it's own parent"), v7, v8, v9, v10, v11, v12, (uint64_t)v18.receiver);

      v4 = 0;
      v14 = v5;
    }
    else
    {
      v14 = 0;
    }
LABEL_9:
    objc_storeStrong((id *)&v5->_parentTable, v4);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v15 = objc_claimAutoreleasedReturnValue();
    definitions = v5->_definitions;
    v5->_definitions = (NSMutableDictionary *)v15;

  }
  return v5;
}

- (BOOL)define:(id)a3 type:(unint64_t)a4 options:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  _RESymbolDefinition *v14;
  _RESymbolDefinition *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _RESymbolDefinition *v21;
  const __CFString *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = (id)MEMORY[0x24BDBD1B8];
  if (a5)
    v11 = a5;
  v12 = v11;
  objc_msgSend(v10, "value");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_definitions, "objectForKeyedSubscript:", v13);
  v14 = (_RESymbolDefinition *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    if (a6)
    {
      v16 = (void *)MEMORY[0x24BDD17C8];
      -[_RESymbolDefinition name](v14, "name");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringWithFormat:", CFSTR("Symbol \"%@\" already defined."), v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = CFSTR("REErrorTokenKey");
      -[_RESymbolDefinition token](v15, "token");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = v19;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      RECreateErrorWithCodeMessageAndUseInfo(206, v18, v20);
      *a6 = (id)objc_claimAutoreleasedReturnValue();

    }
    v21 = v15;
  }
  else
  {
    v21 = -[_RESymbolDefinition initWithToken:type:options:]([_RESymbolDefinition alloc], "initWithToken:type:options:", v10, a4, v12);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_definitions, "setObject:forKeyedSubscript:", v21, v13);
  }

  return v15 == 0;
}

- (BOOL)setNodeValue:(id)a3 forDefinition:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_definitions, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "value");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      objc_msgSend(v11, "setValue:", v8);
      LOBYTE(a5) = 1;
      goto LABEL_9;
    }
    if (a5)
    {
      v17 = CFSTR("REErrorTokenKey");
      objc_msgSend(v11, "value");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "token");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = v14;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      RECreateErrorWithCodeAndUseInfo(208, v15);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

LABEL_7:
      LOBYTE(a5) = 0;
    }
  }
  else if (a5)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Symbol \"%@\" not defined."), v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    RECreateErrorWithCodeAndMessage(207, v13);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
LABEL_9:

  return (char)a5;
}

- (BOOL)setObjectValue:(id)a3 forDefinition:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_definitions, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "objectValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      objc_msgSend(v11, "setObjectValue:", v8);
      LOBYTE(a5) = 1;
      goto LABEL_9;
    }
    if (a5)
    {
      v17 = CFSTR("REErrorTokenKey");
      objc_msgSend(v11, "value");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "token");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = v14;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      RECreateErrorWithCodeAndUseInfo(208, v15);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

LABEL_7:
      LOBYTE(a5) = 0;
    }
  }
  else if (a5)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Symbol \"%@\" not defined."), v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    RECreateErrorWithCodeAndMessage(207, v13);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
LABEL_9:

  return (char)a5;
}

- (BOOL)typeForDefinition:(id)a3 type:(unint64_t *)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  REScriptSymbolTable *parentTable;

  v6 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_definitions, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    if (a4)
      *a4 = objc_msgSend(v7, "type");
    v9 = 1;
  }
  else
  {
    parentTable = self->_parentTable;
    if (parentTable)
      v9 = -[REScriptSymbolTable typeForDefinition:type:](parentTable, "typeForDefinition:type:", v6, a4);
    else
      v9 = 0;
  }

  return v9;
}

- (id)objectValueForDefinition:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  REScriptSymbolTable *parentTable;
  void *v9;

  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_definitions, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectValue");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    parentTable = self->_parentTable;
    if (!parentTable)
    {
      v9 = 0;
      goto LABEL_6;
    }
    -[REScriptSymbolTable objectValueForDefinition:](parentTable, "objectValueForDefinition:", v4);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v7;
LABEL_6:

  return v9;
}

- (id)nodeValueForDefinition:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  REScriptSymbolTable *parentTable;
  void *v9;

  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_definitions, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "value");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    parentTable = self->_parentTable;
    if (!parentTable)
    {
      v9 = 0;
      goto LABEL_6;
    }
    -[REScriptSymbolTable nodeValueForDefinition:](parentTable, "nodeValueForDefinition:", v4);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v7;
LABEL_6:

  return v9;
}

- (void)_enumerateObjectsOfType:(unint64_t)a3 usingBlock:(id)a4
{
  void (**v6)(id, void *, void *, void *);
  REDependencyGraph *v7;
  NSMutableDictionary *definitions;
  uint64_t v9;
  REDependencyGraph *v10;
  NSMutableDictionary *v11;
  REDependencyGraph *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[5];
  REDependencyGraph *v27;
  _QWORD v28[4];
  REDependencyGraph *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, void *, void *, void *))a4;
  if (v6)
  {
    v7 = objc_alloc_init(REDependencyGraph);
    definitions = self->_definitions;
    v9 = MEMORY[0x24BDAC760];
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __58__REScriptSymbolTable__enumerateObjectsOfType_usingBlock___block_invoke;
    v28[3] = &unk_24CF8D080;
    v10 = v7;
    v29 = v10;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](definitions, "enumerateKeysAndObjectsUsingBlock:", v28);
    v11 = self->_definitions;
    v26[0] = v9;
    v26[1] = 3221225472;
    v26[2] = __58__REScriptSymbolTable__enumerateObjectsOfType_usingBlock___block_invoke_2;
    v26[3] = &unk_24CF8D0A8;
    v26[4] = self;
    v12 = v10;
    v27 = v12;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v11, "enumerateKeysAndObjectsUsingBlock:", v26);
    -[REDependencyGraph topologicalSortedItems](v12, "topologicalSortedItems");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v23 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          if (objc_msgSend(v18, "type") == a3)
          {
            objc_msgSend(v18, "name");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "options");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "value");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v6[2](v6, v19, v20, v21);

          }
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
      }
      while (v15);
    }

  }
}

uint64_t __58__REScriptSymbolTable__enumerateObjectsOfType_usingBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addItem:");
}

void __58__REScriptSymbolTable__enumerateObjectsOfType_usingBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v6, "value", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dependencies");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        if ((objc_msgSend(v5, "isEqualToString:", v13) & 1) == 0)
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKeyedSubscript:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
            objc_msgSend(*(id *)(a1 + 40), "markItem:dependentOnItem:", v6, v14);

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

}

- (void)enumerateFeatures:(id)a3
{
  -[REScriptSymbolTable _enumerateObjectsOfType:usingBlock:](self, "_enumerateObjectsOfType:usingBlock:", 0, a3);
}

- (void)enumerateRules:(id)a3
{
  -[REScriptSymbolTable _enumerateObjectsOfType:usingBlock:](self, "_enumerateObjectsOfType:usingBlock:", 1, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_definitions, 0);
  objc_storeStrong((id *)&self->_parentTable, 0);
}

@end
