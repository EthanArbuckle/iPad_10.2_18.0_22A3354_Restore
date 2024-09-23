@implementation WPStorageAccessPromptQuirksData

- (WPStorageAccessPromptQuirksData)initWithQuirks:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  id v8;
  NSObject *v9;
  WPStorageAccessPromptQuirksData *v10;
  void *v12;
  id v13;
  WPStorageAccessPromptQuirksData *v14;
  _QWORD v15[6];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  _QWORD v27[2];
  int v28;
  objc_super v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)WPStorageAccessPromptQuirksData;
  v14 = -[WPStorageAccessPromptQuirksData init](&v29, sel_init);
  if (v14)
  {
    v12 = v4;
    v26 = 0;
    v27[0] = &v26;
    v27[1] = 0x2020000000;
    v28 = 0;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      *(_DWORD *)(v27[0] + 24) = 0x7FFFFFFF;
      objc_msgSend(MEMORY[0x24BDBCE30], "array");
      v4 = (id)objc_claimAutoreleasedReturnValue();

    }
    v20 = 0;
    v21 = &v20;
    v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__0;
    v24 = __Block_byref_object_dispose__0;
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v4, "count", v4));
    v25 = (id)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v4 = v13;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v30, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v17 != v6)
            objc_enumerationMutation(v4);
          v8 = *(id *)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v15[0] = MEMORY[0x24BDAC760];
            v15[1] = 3221225472;
            v15[2] = __50__WPStorageAccessPromptQuirksData_initWithQuirks___block_invoke;
            v15[3] = &unk_251BCF178;
            v15[4] = &v26;
            v15[5] = &v20;
            objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v15);
          }
          else
          {
            ++*(_DWORD *)(v27[0] + 24);
          }

        }
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v30, 16);
      }
      while (v5);
    }

    objc_storeStrong((id *)&v14->_quirks, (id)v21[5]);
    if (*(_DWORD *)(v27[0] + 24))
    {
      v9 = WPOSLogServer();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[WPStorageAccessPromptQuirksData initWithQuirks:].cold.1((uint64_t)v27, v9);
    }
    v10 = v14;
    _Block_object_dispose(&v20, 8);

    _Block_object_dispose(&v26, 8);
  }

  return v14;
}

void __50__WPStorageAccessPromptQuirksData_initWithQuirks___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  WPStorageAccessPromptQuirk *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = -[WPStorageAccessPromptQuirk initWithName:withDomainData:]([WPStorageAccessPromptQuirk alloc], "initWithName:withDomainData:", v7, v5);
    if (-[WPStorageAccessPromptQuirk isValid](v6, "isValid"))
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v6);
    else
      ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);

  }
  else
  {
    ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }

}

- (id)description
{
  return -[NSArray description](self->_quirks, "description");
}

- (NSArray)quirks
{
  return self->_quirks;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quirks, 0);
}

- (void)initWithQuirks:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = *(_DWORD *)(*(_QWORD *)a1 + 24);
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_24A44A000, a2, OS_LOG_TYPE_ERROR, "WPStorageAccessPromptQuirksData initWithQuirks: skipped %d entries due to malformed entries", (uint8_t *)v3, 8u);
}

@end
