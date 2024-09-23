@implementation WPStorageAccessUserAgentStringQuirksData

- (WPStorageAccessUserAgentStringQuirksData)initWithQuirks:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  WPStorageAccessUserAgentStringQuirksData *v11;
  id v13;
  WPStorageAccessUserAgentStringQuirksData *v14;
  _QWORD v15[6];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  _QWORD v21[2];
  int v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  objc_super v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v29.receiver = self;
  v29.super_class = (Class)WPStorageAccessUserAgentStringQuirksData;
  v14 = -[WPStorageAccessUserAgentStringQuirksData init](&v29, sel_init);
  if (v14)
  {
    v23 = 0;
    v24 = &v23;
    v25 = 0x3032000000;
    v26 = __Block_byref_object_copy__1;
    v27 = __Block_byref_object_dispose__1;
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v13, "count"));
    v28 = (id)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    v21[0] = &v20;
    v21[1] = 0x2020000000;
    v22 = 0;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v4 = v13;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v30, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v17;
      v7 = MEMORY[0x24BDAC760];
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v17 != v6)
            objc_enumerationMutation(v4);
          v9 = *(id *)(*((_QWORD *)&v16 + 1) + 8 * v8);
          v15[0] = v7;
          v15[1] = 3221225472;
          v15[2] = __59__WPStorageAccessUserAgentStringQuirksData_initWithQuirks___block_invoke;
          v15[3] = &unk_251BCF1A0;
          v15[4] = &v20;
          v15[5] = &v23;
          objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v15);

          ++v8;
        }
        while (v5 != v8);
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v30, 16);
      }
      while (v5);
    }

    objc_storeStrong((id *)&v14->_quirks, (id)v24[5]);
    if (*(_DWORD *)(v21[0] + 24))
    {
      v10 = WPOSLogServer();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[WPStorageAccessUserAgentStringQuirksData initWithQuirks:].cold.1((uint64_t)v21, v10);
    }
    v11 = v14;
    _Block_object_dispose(&v20, 8);
    _Block_object_dispose(&v23, 8);

  }
  return v14;
}

void __59__WPStorageAccessUserAgentStringQuirksData_initWithQuirks___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  WPStorageAccessUserAgentStringQuirk *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = -[WPStorageAccessUserAgentStringQuirk initWithDomain:withUserAgentString:]([WPStorageAccessUserAgentStringQuirk alloc], "initWithDomain:withUserAgentString:", v7, v5);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v6);

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
  _os_log_error_impl(&dword_24A44A000, a2, OS_LOG_TYPE_ERROR, "WPStorageAccessUserAgentStringQuirksData initWithQuirks: skipped %d entries due to unexpected class types", (uint8_t *)v3, 8u);
}

@end
