@implementation STVersionVector

- (STVersionVector)init
{
  STVersionVector *v2;
  uint64_t v3;
  NSMutableDictionary *nodeByIdentifier;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)STVersionVector;
  v2 = -[STVersionVector init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    nodeByIdentifier = v2->_nodeByIdentifier;
    v2->_nodeByIdentifier = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (STVersionVector)initWithNode:(id)a3
{
  id v4;
  STVersionVector *v5;
  uint64_t v6;
  NSString *editorIdentifier;

  v4 = a3;
  v5 = -[STVersionVector init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "identifier");
    v6 = objc_claimAutoreleasedReturnValue();
    editorIdentifier = v5->_editorIdentifier;
    v5->_editorIdentifier = (NSString *)v6;

    -[NSMutableDictionary setObject:forKeyedSubscript:](v5->_nodeByIdentifier, "setObject:forKeyedSubscript:", v4, v5->_editorIdentifier);
  }

  return v5;
}

- (STVersionVector)initWithDataRepresentation:(id)a3
{
  id v4;
  STVersionVector *v5;
  STVersionVector *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSMutableDictionary *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  STVersionVectorNode *v19;
  void *v20;
  NSObject *v21;
  void *v23;
  NSObject *v24;
  id v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  id v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[STVersionVector init](self, "init");
  v6 = v5;
  if (v4 && v5)
  {
    v31 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v4, 0, &v31);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v31;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = v7;
      -[NSObject objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", CFSTR("e"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", CFSTR("n"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v24 = v9;
          v25 = v8;
          v26 = v7;
          v23 = v10;
          -[STVersionVector setEditorIdentifier:](v6, "setEditorIdentifier:", v10);
          v12 = v6->_nodeByIdentifier;
          v27 = 0u;
          v28 = 0u;
          v29 = 0u;
          v30 = 0u;
          v13 = v11;
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v28;
            do
            {
              for (i = 0; i != v15; ++i)
              {
                if (*(_QWORD *)v28 != v16)
                  objc_enumerationMutation(v13);
                v18 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v19 = -[STVersionVectorNode initWithDictionaryRepresentation:]([STVersionVectorNode alloc], "initWithDictionaryRepresentation:", v18);
                  -[STVersionVectorNode identifier](v19, "identifier");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v19, v20);

                }
              }
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
            }
            while (v15);
          }

          v7 = v26;
          v21 = v24;
          v8 = v25;
LABEL_19:

          goto LABEL_20;
        }
      }

    }
    +[STLog versionVector](STLog, "versionVector");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[STVersionVector initWithDataRepresentation:].cold.1((uint64_t)v7, (uint64_t)v8, v21);
    goto LABEL_19;
  }
LABEL_20:

  return v6;
}

- (NSData)dataRepresentation
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  -[STVersionVector nodes](self, "nodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKeyPath:", CFSTR("dictionaryRepresentation"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = CFSTR("e");
  -[STVersionVector editorIdentifier](self, "editorIdentifier");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = &stru_1E9372498;
  if (v5)
    v7 = (const __CFString *)v5;
  v16[1] = CFSTR("n");
  v17[0] = v7;
  v17[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v8, 0, &v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v15;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    +[STLog versionVector](STLog, "versionVector");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      -[STVersionVector dataRepresentation].cold.1((uint64_t)v10, v12);

    v11 = (id)objc_opt_new();
  }
  v13 = v11;

  return (NSData *)v13;
}

- (NSArray)nodes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("identifier"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[STVersionVector nodeByIdentifier](self, "nodeByIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortedArrayUsingDescriptors:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v7;
}

- (unint64_t)evaluateCausality:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  STVersionVectorNode *v21;
  STVersionVectorNode *v22;
  void *v23;
  void *v24;
  void *v25;
  STVersionVectorNode *v26;
  STVersionVectorNode *v27;
  unint64_t v28;
  unint64_t v29;
  _BOOL4 v30;
  unint64_t v31;
  _BOOL4 v32;
  id obj;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  -[STVersionVector nodeByIdentifier](self, "nodeByIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v7);

  v35 = v4;
  objc_msgSend(v4, "nodeByIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v9);

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v10 = v5;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v11)
  {
    v12 = v11;
    v13 = 0;
    v14 = 0;
    v15 = *(_QWORD *)v37;
    obj = v10;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v37 != v15)
          objc_enumerationMutation(obj);
        v17 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
        -[STVersionVector nodeByIdentifier](self, "nodeByIdentifier", obj);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectForKeyedSubscript:", v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v19;
        if (v19)
          v21 = v19;
        else
          v21 = -[STVersionVectorNode initWithIdentifier:]([STVersionVectorNode alloc], "initWithIdentifier:", v17);
        v22 = v21;

        objc_msgSend(v35, "nodeByIdentifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "objectForKeyedSubscript:", v17);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v24;
        if (v24)
          v26 = v24;
        else
          v26 = -[STVersionVectorNode initWithIdentifier:]([STVersionVectorNode alloc], "initWithIdentifier:", v17);
        v27 = v26;

        v28 = -[STVersionVectorNode count](v22, "count");
        if (v28 >= -[STVersionVectorNode count](v27, "count"))
        {
          v29 = -[STVersionVectorNode count](v22, "count");
          if (v29 > -[STVersionVectorNode count](v27, "count"))
            ++v13;
        }
        else
        {
          ++v14;
        }

      }
      v10 = obj;
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v12);

    v30 = v13 == 0;
    if (v14 && !v13)
    {
      v31 = 0;
      goto LABEL_28;
    }
    v32 = v14 == 0;
    if (v13 && !v14)
    {
      v31 = 1;
      goto LABEL_28;
    }
  }
  else
  {

    v32 = 1;
    v30 = 1;
  }
  if (v30 && v32)
    v31 = 3;
  else
    v31 = 2;
LABEL_28:

  return v31;
}

- (void)incrementNodeWithIdentifier:(id)a3
{
  void *v4;
  void *v5;
  STVersionVectorNode *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = (void *)objc_msgSend(v8, "copy");
  -[STVersionVector setEditorIdentifier:](self, "setEditorIdentifier:", v4);

  -[STVersionVector nodeByIdentifier](self, "nodeByIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v8);
  v6 = (STVersionVectorNode *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v6 = -[STVersionVectorNode initWithIdentifier:]([STVersionVectorNode alloc], "initWithIdentifier:", v8);
    -[STVersionVector nodeByIdentifier](self, "nodeByIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, v8);

  }
  -[STVersionVectorNode increment](v6, "increment");

}

- (void)join:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  STVersionVectorNode *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "editorIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[STVersionVector setEditorIdentifier:](self, "setEditorIdentifier:", v5);

  v6 = (void *)objc_opt_new();
  -[STVersionVector nodeByIdentifier](self, "nodeByIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v8);

  objc_msgSend(v4, "nodeByIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v10);

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v11 = v6;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v23;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v23 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v15);
        -[STVersionVector nodeByIdentifier](self, "nodeByIdentifier", (_QWORD)v22);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectForKeyedSubscript:", v16);
        v18 = (STVersionVectorNode *)objc_claimAutoreleasedReturnValue();

        if (!v18)
        {
          v18 = -[STVersionVectorNode initWithIdentifier:]([STVersionVectorNode alloc], "initWithIdentifier:", v16);
          -[STVersionVector nodeByIdentifier](self, "nodeByIdentifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setObject:forKeyedSubscript:", v18, v16);

        }
        objc_msgSend(v4, "nodeByIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectForKeyedSubscript:", v16);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
          -[STVersionVectorNode join:](v18, "join:", v21);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v13);
  }

}

- (BOOL)precedesVersionVector:(id)a3
{
  return -[STVersionVector evaluateCausality:](self, "evaluateCausality:", a3) == 0;
}

- (BOOL)isConcurrentWithVersionVector:(id)a3
{
  return -[STVersionVector evaluateCausality:](self, "evaluateCausality:", a3) == 2;
}

- (BOOL)isEqualToVersionVector:(id)a3
{
  return -[STVersionVector evaluateCausality:](self, "evaluateCausality:", a3) == 3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("identifier"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[STVersionVector nodes](self, "nodes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedArrayUsingDescriptors:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("identifier"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[STVersionVector nodes](self, "nodes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedArrayUsingDescriptors:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0CB3940];
  v8 = objc_opt_class();
  -[STVersionVector editorIdentifier](self, "editorIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("<%@: %p { editorIdentifier = %@, nodes = %@ }>"), v8, self, v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;

  objc_opt_class();
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "nodeByIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[STVersionVector nodeByIdentifier](self, "nodeByIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __32__STVersionVector_copyWithZone___block_invoke;
  v9[3] = &unk_1E9371F30;
  v10 = v5;
  v7 = v5;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v9);

  return v4;
}

void __32__STVersionVector_copyWithZone___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a2;
  v6 = (id)objc_msgSend(a3, "copy");
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v5);

}

- (NSMutableDictionary)nodeByIdentifier
{
  return self->_nodeByIdentifier;
}

- (void)setNodeByIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_nodeByIdentifier, a3);
}

- (NSString)editorIdentifier
{
  return self->_editorIdentifier;
}

- (void)setEditorIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editorIdentifier, 0);
  objc_storeStrong((id *)&self->_nodeByIdentifier, 0);
}

- (void)initWithDataRepresentation:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl(&dword_1D22E7000, log, OS_LOG_TYPE_ERROR, "Malformed version vector: %{public}@ %{public}@", (uint8_t *)&v3, 0x16u);
}

- (void)dataRepresentation
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_fault_impl(&dword_1D22E7000, a2, OS_LOG_TYPE_FAULT, "Failed to serialize version vector: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
