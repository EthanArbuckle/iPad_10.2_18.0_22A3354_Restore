@implementation PFJSONDebugDumpConverter

- (PFJSONDebugDumpConverter)initWithUnknownTypeHandler:(id)a3
{
  id v4;
  PFJSONDebugDumpConverter *v5;
  uint64_t v6;
  id unknownTypeHandler;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PFJSONDebugDumpConverter;
  v5 = -[PFJSONDebugDumpConverter init](&v9, sel_init);
  if (v5)
  {
    v6 = MEMORY[0x1A1B0CFA4](v4);
    unknownTypeHandler = v5->_unknownTypeHandler;
    v5->_unknownTypeHandler = (id)v6;

    v5->_enablePretty = 1;
  }

  return v5;
}

- (id)JSONForObject:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  char v8;
  void *v9;
  uint64_t v10;

  -[PFJSONDebugDumpConverter JSONCompatibleObjectForObject:](self, "JSONCompatibleObjectForObject:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6
    && (objc_msgSend(MEMORY[0x1E0C99E38], "null"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v6, "isEqual:", v7),
        v7,
        (v8 & 1) == 0))
  {
    if (-[PFJSONDebugDumpConverter enablePretty](self, "enablePretty"))
      v10 = 9;
    else
      v10 = 8;
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v6, v10, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)JSONCompatibleObjectForObject:(id)a3
{
  id v4;
  __CFString *v5;
  __CFString *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void (**unknownTypeHandler)(id, id);
  uint64_t v21;
  double v22;
  int v23;
  _QWORD v24[4];
  id v25;
  PFJSONDebugDumpConverter *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[2];
  _QWORD v32[2];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      v7 = v4;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v28;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v28 != v10)
              objc_enumerationMutation(v7);
            -[PFJSONDebugDumpConverter JSONCompatibleObjectForObject:](self, "JSONCompatibleObjectForObject:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v11));
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            -[__CFString addObject:](v6, "addObject:", v12);

            ++v11;
          }
          while (v9 != v11);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
        }
        while (v9);
      }
      goto LABEL_12;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __58__PFJSONDebugDumpConverter_JSONCompatibleObjectForObject___block_invoke;
      v24[3] = &unk_1E45A1DF0;
      v14 = v13;
      v25 = v14;
      v26 = self;
      objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v24);
      v6 = (__CFString *)v14;

      goto LABEL_21;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v31[0] = CFSTR("NSDataLength");
      v15 = (void *)MEMORY[0x1E0CB37E8];
      v16 = v4;
      objc_msgSend(v15, "numberWithUnsignedInteger:", objc_msgSend(v16, "length"));
      v17 = (id)objc_claimAutoreleasedReturnValue();
      v31[1] = CFSTR("NSData");
      v32[0] = v17;
      objc_msgSend(v16, "base64EncodedStringWithOptions:", 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v32[1] = v18;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 2);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v4)
        {
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
          goto LABEL_3;
        }
        unknownTypeHandler = (void (**)(id, id))self->_unknownTypeHandler;
        if (!unknownTypeHandler
          || (unknownTypeHandler[2](unknownTypeHandler, v4), (v21 = objc_claimAutoreleasedReturnValue()) == 0))
        {
          -[PFJSONDebugDumpConverter unknownObjectTypePlaceholderForObject:](self, "unknownObjectTypePlaceholderForObject:", v4);
          v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
          goto LABEL_3;
        }
        v7 = (id)v21;
        -[PFJSONDebugDumpConverter JSONCompatibleObjectForObject:](self, "JSONCompatibleObjectForObject:", v21);
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_12:

        goto LABEL_21;
      }
      v17 = objc_retainAutorelease(v4);
      if (strcmp((const char *)objc_msgSend(v17, "objCType"), "d"))
        goto LABEL_19;
      objc_msgSend(v17, "doubleValue");
      v23 = __fpclassifyd(v22);
      if (v23 == 2)
      {
        v6 = CFSTR("(Unable to JSON-serialize FP_INFINITE float)");
        goto LABEL_20;
      }
      if (v23 == 1)
        v6 = CFSTR("(Unable to JSON-serialize FP_NAN float)");
      else
LABEL_19:
        v6 = (__CFString *)v17;
    }
LABEL_20:

    goto LABEL_21;
  }
  v5 = (__CFString *)v4;
LABEL_3:
  v6 = v5;
LABEL_21:

  return v6;
}

- (id)unknownObjectTypePlaceholderForObject:(id)a3
{
  id v3;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("UnknownObjectDescription");
  v3 = a3;
  objc_msgSend(v3, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = CFSTR("ClassName");
  v10[0] = v4;
  v5 = (objc_class *)objc_opt_class();

  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)enablePretty
{
  return self->_enablePretty;
}

- (void)setEnablePretty:(BOOL)a3
{
  self->_enablePretty = a3;
}

- (id)unknownTypeHandler
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setUnknownTypeHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unknownTypeHandler, 0);
}

void __58__PFJSONDebugDumpConverter_JSONCompatibleObjectForObject___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = *(void **)(a1 + 40);
  v6 = a2;
  objc_msgSend(v5, "JSONCompatibleObjectForObject:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v6);

}

@end
