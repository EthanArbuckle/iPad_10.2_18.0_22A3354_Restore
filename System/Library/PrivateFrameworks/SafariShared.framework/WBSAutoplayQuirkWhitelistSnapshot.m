@implementation WBSAutoplayQuirkWhitelistSnapshot

- (WBSAutoplayQuirkWhitelistSnapshot)init
{

  return 0;
}

- (WBSAutoplayQuirkWhitelistSnapshot)initWithSnapshotData:(id)a3 error:(id *)a4
{
  id v6;
  WBSAutoplayQuirkWhitelistSnapshot *v7;
  void *v8;
  void *v9;
  void *v10;
  WBSAutoplayQuirkWhitelistSnapshot *v11;
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  objc_super v24;

  v6 = a3;
  v24.receiver = self;
  v24.super_class = (Class)WBSAutoplayQuirkWhitelistSnapshot;
  v7 = -[WBSAutoplayQuirkWhitelistSnapshot init](&v24, sel_init);
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "safari_dictionaryWithPropertyListData:options:", v6, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v20 = 0;
      v21 = &v20;
      v22 = 0x2020000000;
      v23 = 1;
      v14 = 0;
      v15 = &v14;
      v16 = 0x3032000000;
      v17 = __Block_byref_object_copy_;
      v18 = __Block_byref_object_dispose_;
      v19 = 0;
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __64__WBSAutoplayQuirkWhitelistSnapshot_initWithSnapshotData_error___block_invoke;
      v13[3] = &unk_1E4B29FE8;
      v13[4] = &v14;
      v13[5] = &v20;
      objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v13);
      if (a4)
      {
        v10 = (void *)v15[5];
        if (v10)
          *a4 = objc_retainAutorelease(v10);
      }
      if (*((_BYTE *)v21 + 24))
      {
        objc_storeStrong((id *)&v7->_domainsToQuirkTypes, v9);
        v11 = v7;
      }
      else
      {
        v11 = 0;
      }
      _Block_object_dispose(&v14, 8);

      _Block_object_dispose(&v20, 8);
    }
    else if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 259, 0);
      v11 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void __64__WBSAutoplayQuirkWhitelistSnapshot_initWithSnapshotData_error___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || (unint64_t)objc_msgSend(v9, "unsignedIntegerValue") >= 8)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 259, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }

}

- (unint64_t)quirkTypeForDomain:(id)a3
{
  void *v3;
  unint64_t v4;

  -[NSDictionary objectForKeyedSubscript:](self->_domainsToQuirkTypes, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  WBSAutoplayQuirkWhitelistSnapshot *v4;
  BOOL v5;

  v4 = (WBSAutoplayQuirkWhitelistSnapshot *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[NSDictionary isEqualToDictionary:](self->_domainsToQuirkTypes, "isEqualToDictionary:", v4->_domainsToQuirkTypes);
  }

  return v5;
}

- (unint64_t)hash
{
  return -[NSDictionary hash](self->_domainsToQuirkTypes, "hash");
}

- (id)snapshotData
{
  return (id)objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", self->_domainsToQuirkTypes, 200, 0, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainsToQuirkTypes, 0);
}

@end
