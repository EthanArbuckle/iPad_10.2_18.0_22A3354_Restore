@implementation REScriptProcessor

+ (id)processorWithSource:(id)a3
{
  id v4;
  REStringScriptBuffer *v5;
  void *v6;

  v4 = a3;
  v5 = -[REStringScriptBuffer initWithString:]([REStringScriptBuffer alloc], "initWithString:", v4);

  v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithScriptBuffer:path:", v5, 0);
  return v6;
}

+ (id)processorWithPath:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  REStringScriptBuffer *v16;
  void *v17;
  id v19;

  objc_msgSend(a3, "stringByExpandingTildeInPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByStandardizingPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_lock((os_unfair_lock_t)&REScriptProcessorLock);
  if (REScriptProcessorCache_onceToken != -1)
    dispatch_once(&REScriptProcessorCache_onceToken, &__block_literal_global_125_0);
  objc_msgSend((id)REScriptProcessorCache_Cache, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock((os_unfair_lock_t)&REScriptProcessorLock);
  if (v6)
  {
    v7 = v6;
  }
  else
  {
    v19 = 0;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithContentsOfFile:encoding:error:", v5, 4, &v19);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v19;
    if (v8)
    {
      v16 = -[REStringScriptBuffer initWithString:]([REStringScriptBuffer alloc], "initWithString:", v8);
      v17 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithScriptBuffer:path:", v16, v5);
      os_unfair_lock_lock((os_unfair_lock_t)&REScriptProcessorLock);
      if (REScriptProcessorCache_onceToken != -1)
        dispatch_once(&REScriptProcessorCache_onceToken, &__block_literal_global_125_0);
      objc_msgSend((id)REScriptProcessorCache_Cache, "setObject:forKeyedSubscript:", v17, v5);
      os_unfair_lock_unlock((os_unfair_lock_t)&REScriptProcessorLock);
      v7 = v17;

    }
    else
    {
      RERaiseInternalException((void *)*MEMORY[0x24BDBCAB8], CFSTR("Unable to load script at path: %@ Error: %@"), v9, v10, v11, v12, v13, v14, (uint64_t)v5);
      v7 = 0;
    }

  }
  return v7;
}

- (REScriptProcessor)initWithScriptBuffer:(id)a3 path:(id)a4
{
  id v7;
  id v8;
  REScriptProcessor *v9;
  REScriptProcessor *v10;
  REScriptTokenizer *v11;
  REScriptTokenizer *tokenizer;
  REStandardizedTokenBuffer *v13;
  RETokenStack *v14;
  REBacktrackingTokenBuffer *tokenStack;
  REScriptParser *v16;
  REScriptParser *parser;
  objc_super v19;

  v7 = a3;
  v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)REScriptProcessor;
  v9 = -[REScriptProcessor init](&v19, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_path, a4);
    objc_storeStrong((id *)&v10->_buffer, a3);
    v11 = -[REScriptTokenizer initWithScriptBuffer:]([REScriptTokenizer alloc], "initWithScriptBuffer:", v7);
    tokenizer = v10->_tokenizer;
    v10->_tokenizer = v11;

    -[REScriptTokenizer setDelegate:](v10->_tokenizer, "setDelegate:", v10);
    v13 = -[REStandardizedTokenBuffer initWithTokenBuffer:]([REStandardizedTokenBuffer alloc], "initWithTokenBuffer:", v10->_tokenizer);
    v14 = -[RETokenStack initWithTokenBuffer:]([RETokenStack alloc], "initWithTokenBuffer:", v13);
    tokenStack = v10->_tokenStack;
    v10->_tokenStack = (REBacktrackingTokenBuffer *)v14;

    v16 = -[REScriptParser initWithBacktrackingBuffer:]([REScriptParser alloc], "initWithBacktrackingBuffer:", v10->_tokenStack);
    parser = v10->_parser;
    v10->_parser = v16;

    -[REScriptParser setDelegate:](v10->_parser, "setDelegate:", v10);
    -[REScriptProcessor _process](v10, "_process");

  }
  return v10;
}

- (id)rulesWithNames:(id)a3
{
  return (id)MEMORY[0x24BDBD1A8];
}

- (id)featuresWithNames:(id)a3
{
  id v4;
  void *v5;
  REScriptSymbolTable *table;
  id v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  REScriptProcessor *v13;
  id v14;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  table = self->_table;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __39__REScriptProcessor_featuresWithNames___block_invoke;
  v11[3] = &unk_24CF8FCF0;
  v12 = v4;
  v13 = self;
  v14 = v5;
  v7 = v5;
  v8 = v4;
  -[REScriptSymbolTable enumerateFeatures:](table, "enumerateFeatures:", v11);
  v9 = (void *)objc_msgSend(v7, "copy");

  return v9;
}

void __39__REScriptProcessor_featuresWithNames___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v7 = a3;
  v8 = a4;
  v9 = *(void **)(a1 + 32);
  if (!v9 || objc_msgSend(v9, "containsObject:", v11))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "objectValueForDefinition:", v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(*(id *)(a1 + 48), "addObject:", v10);

  }
}

- (id)rules
{
  return -[REScriptProcessor rulesWithNames:](self, "rulesWithNames:", 0);
}

- (id)features
{
  return -[REScriptProcessor featuresWithNames:](self, "featuresWithNames:", 0);
}

+ (id)_sharedSystemTable
{
  if (_sharedSystemTable_onceToken != -1)
    dispatch_once(&_sharedSystemTable_onceToken, &__block_literal_global_59);
  return (id)_sharedSystemTable_Table;
}

void __39__REScriptProcessor__sharedSystemTable__block_invoke()
{
  REScriptSymbolTable *v0;
  void *v1;
  id v2;
  REScriptToken *v3;
  void *v4;
  void *v5;
  id v6;
  REScriptToken *v7;
  void *v8;
  void *v9;
  id v10;
  REScriptToken *v11;
  void *v12;
  void *v13;
  id v14;
  REScriptToken *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  REScriptToken *v25;
  objc_class *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  NSString *v33;
  const char *v34;
  objc_method *ClassMethod;
  objc_method *v36;
  void *v37;
  REScriptToken *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  unsigned __int16 dst[8];
  _BYTE v48[128];
  _BYTE v49[128];
  _QWORD v50[3];

  v50[1] = *MEMORY[0x24BDAC8D0];
  v0 = -[REScriptSymbolTable initWithParentScope:]([REScriptSymbolTable alloc], "initWithParentScope:", 0);
  v1 = (void *)_sharedSystemTable_Table;
  _sharedSystemTable_Table = (uint64_t)v0;

  v2 = (id)_sharedSystemTable_Table;
  v3 = -[REScriptToken initWithValue:type:line:column:]([REScriptToken alloc], "initWithValue:type:line:column:", CFSTR("float"), 6, -1, -1);
  v50[0] = CFSTR("REScriptSymbolValueTypeKey");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)dst = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", dst, v50, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "define:type:options:error:", v3, 2, v5, 0);

  v6 = (id)_sharedSystemTable_Table;
  v7 = -[REScriptToken initWithValue:type:line:column:]([REScriptToken alloc], "initWithValue:type:line:column:", CFSTR("int"), 6, -1, -1);
  v50[0] = CFSTR("REScriptSymbolValueTypeKey");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)dst = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", dst, v50, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "define:type:options:error:", v7, 2, v9, 0);

  v10 = (id)_sharedSystemTable_Table;
  v11 = -[REScriptToken initWithValue:type:line:column:]([REScriptToken alloc], "initWithValue:type:line:column:", CFSTR("string"), 6, -1, -1);
  v50[0] = CFSTR("REScriptSymbolValueTypeKey");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)dst = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", dst, v50, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "define:type:options:error:", v11, 2, v13, 0);

  v14 = (id)_sharedSystemTable_Table;
  v15 = -[REScriptToken initWithValue:type:line:column:]([REScriptToken alloc], "initWithValue:type:line:column:", CFSTR("BOOL"), 6, -1, -1);
  v50[0] = CFSTR("REScriptSymbolValueTypeKey");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)dst = v16;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", dst, v50, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "define:type:options:error:", v15, 2, v17, 0);

  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  +[REFeatureTransformer featureTransformerClasses](REFeatureTransformer, "featureTransformerClasses");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v44 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
        objc_msgSend(v23, "functionName");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (v24)
        {
          v25 = -[REScriptToken initWithValue:type:line:column:]([REScriptToken alloc], "initWithValue:type:line:column:", v24, 6, -1, -1);
          objc_msgSend((id)_sharedSystemTable_Table, "define:type:options:error:", v25, 4, 0, 0);
          objc_msgSend((id)_sharedSystemTable_Table, "setObjectValue:forDefinition:error:", v23, v24, 0);

        }
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
    }
    while (v20);
  }

  v26 = (objc_class *)objc_opt_class();
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  +[REFeature systemFeatureNames](REFeature, "systemFeatureNames", 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v40;
    do
    {
      for (j = 0; j != v29; ++j)
      {
        if (*(_QWORD *)v40 != v30)
          objc_enumerationMutation(v27);
        v32 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * j);
        objc_msgSend(v32, "stringByAppendingString:", CFSTR("Feature"));
        v33 = (NSString *)objc_claimAutoreleasedReturnValue();
        v34 = NSSelectorFromString(v33);
        ClassMethod = class_getClassMethod(v26, v34);
        if (ClassMethod)
        {
          v36 = ClassMethod;
          if (method_getNumberOfArguments(ClassMethod) == 2)
          {
            method_getReturnType(v36, (char *)dst, 0xAuLL);
            if (dst[0] == 64)
            {
              ((void (*)(objc_class *, const char *))-[objc_class methodForSelector:](v26, "methodForSelector:", v34))(v26, v34);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              if (v37 && (objc_opt_isKindOfClass() & 1) != 0)
              {
                v38 = -[REScriptToken initWithValue:type:line:column:]([REScriptToken alloc], "initWithValue:type:line:column:", v32, 6, -1, -1);
                objc_msgSend((id)_sharedSystemTable_Table, "define:type:options:error:", v38, 0, 0, 0);
                objc_msgSend((id)_sharedSystemTable_Table, "setObjectValue:forDefinition:error:", v37, v32, 0);

              }
            }
          }
        }

      }
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
    }
    while (v29);
  }

}

- (void)_process
{
  REScriptSymbolTable *v3;
  void *v4;
  REScriptSymbolTable *v5;
  REScriptSymbolTable *table;
  void *v7;
  REScriptASTNodeEnumerator *v8;
  BOOL v9;
  REScriptASTFeatureBuilder *v10;
  REScriptSymbolTable *v11;
  REScriptASTFeatureBuilder *v12;
  _QWORD v13[4];
  REScriptASTFeatureBuilder *v14;
  REScriptProcessor *v15;
  uint64_t *v16;
  id obj;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v3 = [REScriptSymbolTable alloc];
  objc_msgSend((id)objc_opt_class(), "_sharedSystemTable");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[REScriptSymbolTable initWithParentScope:](v3, "initWithParentScope:", v4);
  table = self->_table;
  self->_table = v5;

  -[REScriptParser parse](self->_parser, "parse");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[REScriptASTNodeEnumerator initWithRootNodes:symbolTable:]([REScriptASTNodeEnumerator alloc], "initWithRootNodes:symbolTable:", v7, self->_table);
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__25;
  v22 = __Block_byref_object_dispose__25;
  v23 = 0;
  obj = 0;
  v9 = -[REScriptASTNodeEnumerator buildSymbolTableWithError:](v8, "buildSymbolTableWithError:", &obj);
  objc_storeStrong(&v23, obj);
  if (v9)
  {
    v10 = -[REScriptASTObjectBuilder initWithTable:]([REScriptASTFeatureBuilder alloc], "initWithTable:", self->_table);
    v11 = self->_table;
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __29__REScriptProcessor__process__block_invoke;
    v13[3] = &unk_24CF8FD38;
    v12 = v10;
    v15 = self;
    v16 = &v18;
    v14 = v12;
    -[REScriptSymbolTable enumerateFeatures:](v11, "enumerateFeatures:", v13);

  }
  else
  {
    -[REScriptProcessor _encounteredError:](self, "_encounteredError:", v19[5]);
  }
  _Block_object_dispose(&v18, 8);

}

void __29__REScriptProcessor__process__block_invoke(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  _QWORD *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  char v23;
  id v24;
  id obj;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    v10 = a1 + 6;
    v11 = (void *)a1[4];
    v12 = *(_QWORD *)(a1[6] + 8);
    obj = *(id *)(v12 + 40);
    objc_msgSend(v11, "buildObjectWithNode:error:", v9, &obj);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v12 + 40), obj);
    if (!v13)
    {
      v14 = a1 + 5;
LABEL_8:
      objc_msgSend((id)*v14, "_encounteredError:", *(_QWORD *)(*(_QWORD *)(*v10 + 8) + 40));
      goto LABEL_9;
    }
  }
  else
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("REScriptSymbolFeatureTypeKey"));
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    v17 = &unk_24CFC1378;
    if (v15)
      v17 = (void *)v15;
    v18 = v17;

    v19 = objc_msgSend(v18, "unsignedIntegerValue");
    +[REFeature featureWithName:featureType:](REFeature, "featureWithName:featureType:", v7, v19);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v20 = a1[5];
  v14 = a1 + 5;
  v21 = *(void **)(v20 + 48);
  v10 = v14 + 1;
  v22 = *(_QWORD *)(v14[1] + 8);
  v24 = *(id *)(v22 + 40);
  v23 = objc_msgSend(v21, "setObjectValue:forDefinition:error:", v13, v7, &v24);
  objc_storeStrong((id *)(v22 + 40), v24);
  if ((v23 & 1) == 0)
    goto LABEL_8;
LABEL_9:

}

- (void)_encounteredError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  const __CFString *v21;
  unint64_t v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("REErrorTokenKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(MEMORY[0x24BDD16A8], "string");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "appendString:", CFSTR("Encountered error while parsing source\n"));
      if (self->_path)
      {
        objc_msgSend(v8, "appendString:");
        objc_msgSend(v8, "appendString:", CFSTR("\n"));
      }
      objc_msgSend(v8, "appendString:", CFSTR("\n"));
      v9 = objc_msgSend(v7, "line");
      v10 = 2;
      if (v9 > 2)
        v10 = v9;
      v11 = v10 - 2;
      v12 = objc_msgSend(v7, "line");
      if (v11 > v12)
        goto LABEL_25;
      v34 = v5;
      v13 = 0;
      v14 = v12 + 1;
      do
      {
        -[REScriptBuffer contentForLine:](self->_buffer, "contentForLine:", v11);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          v16 = v11 + 1;
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu: "), v11 + 1);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "appendFormat:", CFSTR("%@%@\n"), v17, v15);
          if (v11 == objc_msgSend(v7, "line"))
          {
            v18 = objc_msgSend(v17, "length");
            if (objc_msgSend(v7, "column") + v18)
            {
              v19 = 0;
              do
              {
                objc_msgSend(v8, "appendString:", CFSTR(" "));
                ++v19;
                v20 = objc_msgSend(v17, "length");
              }
              while (v19 < objc_msgSend(v7, "column") + v20);
            }
            if ((unint64_t)objc_msgSend(v7, "length") <= 1)
              v21 = CFSTR("^");
            else
              v21 = CFSTR("~");
            if (objc_msgSend(v7, "length"))
            {
              v22 = 0;
              do
              {
                objc_msgSend(v8, "appendString:", v21);
                ++v22;
              }
              while (v22 < objc_msgSend(v7, "length"));
            }
            objc_msgSend(v8, "appendString:", CFSTR("\n"));
            objc_msgSend(v34, "localizedDescription");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "appendString:", v23);

            objc_msgSend(v8, "appendString:", CFSTR("\n\n"));
            v13 = 1;
          }

          v11 = v16;
        }
        else
        {
          ++v11;
        }

      }
      while (v11 != v14);
      v5 = v34;
      if ((v13 & 1) == 0)
      {
LABEL_25:
        objc_msgSend(v8, "appendString:", CFSTR("\n"));
        objc_msgSend(v5, "localizedDescription");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "appendString:", v24);

        objc_msgSend(v8, "appendString:", CFSTR("\n"));
      }
      if (_fetchedInternalBuildOnceToken_7 != -1)
        dispatch_once(&_fetchedInternalBuildOnceToken_7, &__block_literal_global_44_3);
      if (_isInternalDevice_7)
      {
        RELogForDomain(0);
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          -[REScriptProcessor _encounteredError:].cold.1((uint64_t)v8, v25);

        REStoreLogFileForTask(v8, CFSTR("Script"));
      }

    }
    v26 = (void *)*MEMORY[0x24BDBCAB0];
    objc_msgSend(v5, "localizedDescription");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    RERaiseInternalException(v26, CFSTR("%@"), v28, v29, v30, v31, v32, v33, (uint64_t)v27);

  }
}

uint64_t __39__REScriptProcessor__encounteredError___block_invoke()
{
  uint64_t result;

  result = _REGetIsInternalBuild();
  _isInternalDevice_7 = result;
  return result;
}

- (void)tokenizer:(id)a3 didEncouterTokenError:(id)a4
{
  -[REScriptProcessor _encounteredError:](self, "_encounteredError:", a4);
}

- (void)parser:(id)a3 didEncouterParserError:(id)a4
{
  -[REScriptProcessor _encounteredError:](self, "_encounteredError:", a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_table, 0);
  objc_storeStrong((id *)&self->_parser, 0);
  objc_storeStrong((id *)&self->_tokenStack, 0);
  objc_storeStrong((id *)&self->_tokenizer, 0);
  objc_storeStrong((id *)&self->_buffer, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

- (void)_encounteredError:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_2132F7000, a2, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v2, 0xCu);
}

@end
