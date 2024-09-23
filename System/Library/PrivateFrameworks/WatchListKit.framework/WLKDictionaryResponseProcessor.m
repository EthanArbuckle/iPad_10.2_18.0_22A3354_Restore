@implementation WLKDictionaryResponseProcessor

- (id)processResponseData:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  char isKindOfClass;
  objc_class *v20;
  void *v21;
  objc_class *v22;
  objc_class *v23;
  id v24;
  void *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v8, a4, a5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  -[WLKDictionaryResponseProcessor dictionaryKeyPath](self, "dictionaryKeyPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "componentsSeparatedByString:", CFSTR("."));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v20 = -[WLKDictionaryResponseProcessor objectClass](self, "objectClass");
    v12 = 0;
    v21 = 0;
    if (v20)
      goto LABEL_25;
LABEL_23:
    v24 = v12;
    v12 = v24;
    goto LABEL_24;
  }
  v27 = v8;
  v12 = v9;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v26 = v11;
  v13 = v11;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v29;
    while (2)
    {
      v17 = 0;
      v18 = v12;
      do
      {
        if (*(_QWORD *)v29 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(v18, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v17), v26);
        v12 = (id)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0)
        {

          v12 = 0;
          goto LABEL_17;
        }
        ++v17;
        v18 = v12;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      if (v15)
        continue;
      break;
    }
  }
LABEL_17:

  v22 = -[WLKDictionaryResponseProcessor objectClass](self, "objectClass");
  if (!v22)
  {
    v11 = v26;
    v8 = v27;
    goto LABEL_23;
  }
  v11 = v26;
  v8 = v27;
  if (v12)
  {
    v23 = v22;
    if (-[objc_class instancesRespondToSelector:](v22, "instancesRespondToSelector:", sel_initWithDictionary_))
    {
      v24 = (id)objc_msgSend([v23 alloc], "initWithDictionary:", v12);
LABEL_24:
      v21 = v24;
      goto LABEL_25;
    }
  }
  v21 = 0;
LABEL_25:

  return v21;
}

- (id)processResponseData:(id)a3 error:(id *)a4
{
  return -[WLKDictionaryResponseProcessor processResponseData:options:error:](self, "processResponseData:options:error:", a3, 0, a4);
}

- (Class)objectClass
{
  return self->_objectClass;
}

- (NSString)dictionaryKeyPath
{
  return self->_dictionaryKeyPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectClass, 0);
  objc_storeStrong((id *)&self->_dictionaryKeyPath, 0);
}

- (void)setDictionaryKeyPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setObjectClass:(Class)a3
{
  objc_storeStrong((id *)&self->_objectClass, a3);
}

@end
