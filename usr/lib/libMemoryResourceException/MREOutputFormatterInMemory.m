@implementation MREOutputFormatterInMemory

- (MREOutputFormatterInMemory)init
{
  MREOutputFormatterInMemory *v2;
  uint64_t v3;
  NSMutableArray *processes;
  uint64_t v5;
  NSMutableSet *addedProcessGroups;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSMutableDictionary *data;
  objc_super v15;
  _QWORD v16[10];
  _QWORD v17[11];

  v17[10] = *MEMORY[0x24BDAC8D0];
  v15.receiver = self;
  v15.super_class = (Class)MREOutputFormatterInMemory;
  v2 = -[MREOutputFormatterInMemory init](&v15, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    processes = v2->_processes;
    v2->_processes = (NSMutableArray *)v3;

    v5 = objc_opt_new();
    addedProcessGroups = v2->_addedProcessGroups;
    v2->_addedProcessGroups = (NSMutableSet *)v5;

    v2->_isPageSizeSet = 0;
    v7 = (void *)MEMORY[0x24BDBCED8];
    v8 = MEMORY[0x24BDBD1B8];
    v16[0] = CFSTR("total footprint");
    v16[1] = CFSTR("summary");
    v17[0] = &unk_24CFD0090;
    v17[1] = MEMORY[0x24BDBD1B8];
    v17[2] = v2->_processes;
    v16[2] = CFSTR("processes");
    v16[3] = CFSTR("shared");
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17[3] = v9;
    v17[4] = v8;
    v16[4] = CFSTR("auxiliary");
    v16[5] = CFSTR("unit");
    v17[5] = CFSTR("byte");
    v17[6] = &unk_24CFD00A8;
    v16[6] = CFSTR("bytes per unit");
    v16[7] = CFSTR("page size");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", *MEMORY[0x24BDB03A8]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17[7] = v10;
    v17[8] = MEMORY[0x24BDBD1A8];
    v16[8] = CFSTR("errors");
    v16[9] = CFSTR("warnings");
    v17[9] = MEMORY[0x24BDBD1A8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryWithDictionary:", v11);
    v12 = objc_claimAutoreleasedReturnValue();
    data = v2->_data;
    v2->_data = (NSMutableDictionary *)v12;

  }
  return v2;
}

- (void)printVmmapLikeOutputForProcess:(id)a3 regions:(id)a4
{
  self->_verbose = 1;
}

- (void)printProcessHeader:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t i;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSMutableArray *processes;
  char v38;
  void *v39;
  NSMutableDictionary *data;
  void *v41;
  id v42;
  MREOutputFormatterInMemory *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _QWORD v51[4];
  _QWORD v52[4];
  _BYTE v53[128];
  _QWORD v54[5];
  _QWORD v55[7];

  v55[5] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x24BDBCED8];
  v54[0] = CFSTR("name");
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v55[0] = v6;
  v54[1] = CFSTR("pid");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v4, "pid"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v55[1] = v7;
  v55[2] = &unk_24CFD0090;
  v54[2] = CFSTR("footprint");
  v54[3] = CFSTR("categories");
  v54[4] = CFSTR("auxiliary");
  v55[3] = MEMORY[0x24BDBD1B8];
  v55[4] = MEMORY[0x24BDBD1B8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v55, v54, 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dictionaryWithDictionary:", v8);
  v9 = objc_claimAutoreleasedReturnValue();

  v10 = (void *)v9;
  objc_msgSend(v4, "errors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v12)
  {
    objc_msgSend(v4, "errors");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v13, CFSTR("errors"));

  }
  objc_msgSend(v4, "warnings");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  if (v15)
  {
    objc_msgSend(v4, "warnings");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v16, CFSTR("warnings"));

  }
  if (self->_verbose)
  {
    v43 = self;
    v17 = (void *)MEMORY[0x24BDBCEB8];
    objc_msgSend(v4, "memoryRegions");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "arrayWithCapacity:", objc_msgSend(v18, "count"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setObject:forKeyedSubscript:", v19, CFSTR("regions"));
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    objc_msgSend(v4, "memoryRegions");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
    if (v46)
    {
      v41 = v10;
      v42 = v4;
      v44 = *(_QWORD *)v48;
      v45 = v20;
      do
      {
        for (i = 0; i != v46; ++i)
        {
          if (*(_QWORD *)v48 != v44)
            objc_enumerationMutation(v20);
          v22 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
          v23 = objc_alloc(MEMORY[0x24BDBCED8]);
          v51[0] = CFSTR("id");
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v22, "object_id"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v52[0] = v24;
          v51[1] = CFSTR("name");
          objc_msgSend(v22, "name");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v52[1] = v25;
          v51[2] = CFSTR("addr");
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v22, "start"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v52[2] = v26;
          v51[3] = CFSTR("vsize");
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v22, "size"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v52[3] = v27;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v52, v51, 4);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = (void *)objc_msgSend(v23, "initWithDictionary:", v28);

          if (objc_msgSend(v22, "offset"))
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v22, "offset"));
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "setObject:forKeyedSubscript:", v30, CFSTR("offset"));

          }
          if (objc_msgSend(v22, "dirtySize", v41, v42))
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v22, "dirtySize"));
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "setObject:forKeyedSubscript:", v31, CFSTR("dirty"));

          }
          if (objc_msgSend(v22, "swappedSize"))
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v22, "swappedSize"));
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "setObject:forKeyedSubscript:", v32, CFSTR("swapped"));

          }
          if (objc_msgSend(v22, "cleanSize"))
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v22, "cleanSize"));
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "setObject:forKeyedSubscript:", v33, CFSTR("clean"));

          }
          if (objc_msgSend(v22, "reclaimableSize"))
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v22, "reclaimableSize"));
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "setObject:forKeyedSubscript:", v34, CFSTR("reclaimable"));

          }
          if (objc_msgSend(v22, "wiredSize"))
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v22, "wiredSize"));
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "setObject:forKeyedSubscript:", v35, CFSTR("wired"));

          }
          v36 = (void *)objc_msgSend(v29, "copy");
          objc_msgSend(v19, "addObject:", v36);

          v20 = v45;
        }
        v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
      }
      while (v46);

      v4 = v42;
      self = v43;
      v10 = v41;
      if (!v43)
      {
        processes = 0;
        v38 = 1;
        goto LABEL_29;
      }
    }
    else
    {

      self = v43;
    }
  }
  v38 = 0;
  processes = self->_processes;
LABEL_29:
  -[NSMutableArray addObject:](processes, "addObject:", v10);
  if (!self->_isPageSizeSet)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", objc_msgSend(v4, "pageSize"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v38 & 1) != 0)
      data = 0;
    else
      data = self->_data;
    -[NSMutableDictionary setObject:forKeyedSubscript:](data, "setObject:forKeyedSubscript:", v39, CFSTR("page size"));

    self->_isPageSizeSet = 1;
  }

}

- (void)printProcessTotal:(id)a3 forProcess:(id)a4
{
  NSMutableArray *processes;
  id v5;
  id v6;

  if (self)
    processes = self->_processes;
  else
    processes = 0;
  v5 = a3;
  -[NSMutableArray lastObject](processes, "lastObject");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, CFSTR("footprint"));

}

- (void)printProcessCategories:(id)a3 total:(id *)a4 forProcess:(id)a5
{
  NSMutableArray *processes;
  void *v7;
  id v8;

  sub_21345DA74((uint64_t)self, a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (self)
    processes = self->_processes;
  else
    processes = 0;
  -[NSMutableArray lastObject](processes, "lastObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("categories"));

}

- (void)printSharedCategories:(id)a3 sharedWith:(id)a4 forProcess:(id)a5 hasProcessView:(BOOL)a6 total:(id *)a7
{
  _BOOL4 v7;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[2];
  _QWORD v35[2];
  _BYTE v36[128];
  uint64_t v37;

  v7 = a6;
  v37 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (!v7)
  {
    if ((-[NSMutableSet containsObject:](self->_addedProcessGroups, "containsObject:", v12) & 1) != 0)
      goto LABEL_14;
    -[NSMutableSet addObject:](self->_addedProcessGroups, "addObject:", v12);
  }
  v29 = v13;
  v14 = (void *)MEMORY[0x24BDBCEB8];
  objc_msgSend(v12, "processes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "arrayWithCapacity:", objc_msgSend(v15, "count"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  objc_msgSend(v12, "processes");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v31;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v31 != v20)
          objc_enumerationMutation(v17);
        objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v21), "asNumber");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addObject:", v22);

        ++v21;
      }
      while (v19 != v21);
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    }
    while (v19);
  }

  v23 = objc_alloc(MEMORY[0x24BDBCED8]);
  v34[0] = CFSTR("pids");
  v34[1] = CFSTR("categories");
  v35[0] = v16;
  sub_21345DA74((uint64_t)self, v11);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v35[1] = v24;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v23, "initWithDictionary:", v25);

  v13 = v29;
  if (v7)
  {
    objc_msgSend(v29, "asNumber");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setObject:forKeyedSubscript:", v27, CFSTR("specific_to_pid"));

  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_data, "objectForKeyedSubscript:", CFSTR("shared"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "addObject:", v26);

LABEL_14:
}

- (void)printProcessAuxData:(id)a3 forProcess:(id)a4
{
  NSMutableArray *processes;
  void *v6;
  id v7;

  objc_msgSend(a3, "fp_jsonRepresentation");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (self)
    processes = self->_processes;
  else
    processes = 0;
  -[NSMutableArray lastObject](processes, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("auxiliary"));

}

- (void)printProcessesWithWarnings:(id)a3 processesWithErrors:(id)a4 globalErrors:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  NSMutableDictionary *data;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_opt_new();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v12 = v8;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v30;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v30 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v16), "warnings");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObjectsFromArray:", v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v14);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v18 = v9;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v26;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v26 != v21)
          objc_enumerationMutation(v18);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v22), "errors", (_QWORD)v25);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObjectsFromArray:", v23);

        ++v22;
      }
      while (v20 != v22);
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v20);
  }

  if (self)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_data, "setObject:forKeyedSubscript:", v10, CFSTR("errors"));
    data = self->_data;
  }
  else
  {
    objc_msgSend(0, "setObject:forKeyedSubscript:", v10, CFSTR("errors"));
    data = 0;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](data, "setObject:forKeyedSubscript:", v11, CFSTR("warnings"), (_QWORD)v25);

}

- (void)printSummaryCategories:(id)a3 total:(id *)a4 hadErrors:(BOOL)a5
{
  id v7;
  void *v8;
  NSMutableDictionary *data;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSMutableDictionary *v16;
  void *v17;
  void *v18;
  NSMutableDictionary *v19;
  void *v20;
  void *v21;
  _QWORD v22[6];
  _QWORD v23[7];

  v23[6] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  if (v7)
  {
    sub_21345DA74((uint64_t)self, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (self)
      data = self->_data;
    else
      data = 0;
    -[NSMutableDictionary setObject:forKeyedSubscript:](data, "setObject:forKeyedSubscript:", v8, CFSTR("summary"));

  }
  v22[0] = CFSTR("dirty");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a4->var1 + a4->var0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v20;
  v22[1] = CFSTR("swapped");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a4->var1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v10;
  v22[2] = CFSTR("clean");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a4->var2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v11;
  v22[3] = CFSTR("reclaimable");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a4->var3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = v12;
  v22[4] = CFSTR("wired");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a4->var4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23[4] = v13;
  v22[5] = CFSTR("regions");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a4->var5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23[5] = v14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, v22, 6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v7;
  if (self)
    v16 = self->_data;
  else
    v16 = 0;
  -[NSMutableDictionary objectForKeyedSubscript:](v16, "objectForKeyedSubscript:", CFSTR("summary"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v15, CFSTR("total"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a4->var1 + a4->var0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    v19 = self->_data;
  else
    v19 = 0;
  -[NSMutableDictionary setObject:forKeyedSubscript:](v19, "setObject:forKeyedSubscript:", v18, CFSTR("total footprint"));

}

- (void)printGlobalAuxData:(id)a3
{
  uint64_t v4;
  NSMutableDictionary *data;
  id v6;

  objc_msgSend(a3, "fp_jsonRepresentation");
  v4 = objc_claimAutoreleasedReturnValue();
  if (self)
    data = self->_data;
  else
    data = 0;
  v6 = (id)v4;
  -[NSMutableDictionary setObject:forKeyedSubscript:](data, "setObject:forKeyedSubscript:", v4, CFSTR("auxiliary"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addedProcessGroups, 0);
  objc_storeStrong((id *)&self->_processes, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
