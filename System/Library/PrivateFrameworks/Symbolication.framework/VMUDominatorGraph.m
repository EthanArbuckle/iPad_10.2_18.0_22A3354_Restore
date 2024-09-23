@implementation VMUDominatorGraph

- (VMUDominatorGraph)initWithDict:(id)a3
{
  id v4;
  NSData *v5;
  NSData *dominators_data;
  NSData *v7;
  NSData *firstDominates_data;
  NSData *v9;
  NSData *nextDominates_data;
  NSData *v11;
  VMUDominatorGraph *v12;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dominators"));
  v5 = (NSData *)objc_claimAutoreleasedReturnValue();
  dominators_data = self->_dominators_data;
  self->_dominators_data = v5;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("firstDominates"));
  v7 = (NSData *)objc_claimAutoreleasedReturnValue();
  firstDominates_data = self->_firstDominates_data;
  self->_firstDominates_data = v7;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("nextDominates"));
  v9 = (NSData *)objc_claimAutoreleasedReturnValue();

  nextDominates_data = self->_nextDominates_data;
  self->_nextDominates_data = v9;

  v11 = self->_dominators_data;
  if (v11 && self->_firstDominates_data && self->_nextDominates_data)
  {
    self->_dominators = (unsigned int *)-[NSData bytes](v11, "bytes");
    self->_firstDominates = (unsigned int *)-[NSData bytes](self->_firstDominates_data, "bytes");
    self->_nextDominates = (unsigned int *)-[NSData bytes](self->_nextDominates_data, "bytes");
    self->_nodeNamespaceSize = -[NSData length](self->_firstDominates_data, "length") >> 2;
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)copyDict
{
  __int128 v2;
  _QWORD v4[3];
  __int128 v5;
  NSData *nextDominates_data;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = *(_OWORD *)&self->_dominators_data;
  v4[0] = CFSTR("dominators");
  v4[1] = CFSTR("firstDominates");
  v5 = v2;
  v4[2] = CFSTR("nextDominates");
  nextDominates_data = self->_nextDominates_data;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v5, v4, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)consolidate:(id)a3
{
  id v3;
  char *v4;
  id v5;
  uint64_t v6;
  __CFString *v7;
  __CFString *v8;
  uint64_t v9;
  __CFString *v10;
  uint64_t v11;
  __CFString *v12;
  __CFString *v13;
  uint64_t v14;
  void *v15;
  __CFString *v16;
  __CFString *v17;
  uint64_t v18;
  void *v19;
  __CFString *v20;
  __CFString *v21;
  __CFString *v22;
  const __CFString *v23;
  __CFString *v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  id v29;
  id v30;
  uint64_t i;
  __CFString *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t j;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  char v46;
  void *v47;
  char v48;
  uint64_t k;
  uint64_t v50;
  char v51;
  char v52;
  void *v53;
  void *v54;
  void *v55;
  id obj;
  uint64_t v58;
  id v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  id v63;
  id v64;
  __CFString *v65;
  uint64_t v66;
  char *v67;
  id v68;
  void *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  _BYTE v93[128];
  _BYTE v94[128];
  _OWORD v95[4];
  _BYTE v96[128];
  _BYTE v97[128];
  uint64_t v98;

  v98 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v63 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v89 = 0u;
  v90 = 0u;
  v91 = 0u;
  v92 = 0u;
  obj = v3;
  v61 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v89, v97, 16);
  if (v61)
  {
    v59 = *(id *)v90;
    do
    {
      v4 = 0;
      do
      {
        if (*(id *)v90 != v59)
          objc_enumerationMutation(obj);
        v71 = (void *)MEMORY[0x1E0CB3940];
        v67 = v4;
        v5 = *(id *)(*((_QWORD *)&v89 + 1) + 8 * (_QWORD)v4);
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("className"));
        v6 = objc_claimAutoreleasedReturnValue();
        v75 = (void *)v6;
        if (v6)
          v7 = (__CFString *)v6;
        else
          v7 = &stru_1E4E04720;
        v8 = v7;
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("binary"));
        v9 = objc_claimAutoreleasedReturnValue();
        v73 = (void *)v9;
        if (v9)
          v10 = (__CFString *)v9;
        else
          v10 = &stru_1E4E04720;
        v65 = v10;
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("stackid"));
        v11 = objc_claimAutoreleasedReturnValue();
        v69 = (void *)v11;
        if (v11)
          v12 = (__CFString *)v11;
        else
          v12 = &stru_1E4E04720;
        v13 = v12;
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("region"));
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = (void *)v14;
        if (v14)
          v16 = (__CFString *)v14;
        else
          v16 = &stru_1E4E04720;
        v17 = v16;
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("path"));
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = (void *)v18;
        if (v18)
          v20 = (__CFString *)v18;
        else
          v20 = &stru_1E4E04720;
        v21 = v20;
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("description"));
        v22 = (__CFString *)objc_claimAutoreleasedReturnValue();

        if (v22)
          v23 = v22;
        else
          v23 = &stru_1E4E04720;
        v24 = v8;
        objc_msgSend(v71, "stringWithFormat:", CFSTR("%@\x00%@\x00%@\x00%@\x00%@\x00%@"), v8, v65, v13, v17, v21, v23);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v63, "objectForKeyedSubscript:", v25);
        v26 = (id)objc_claimAutoreleasedReturnValue();
        if (!v26)
        {
          v26 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          objc_msgSend(v63, "setObject:forKeyedSubscript:", v26, v25);
        }
        objc_msgSend(v26, "addObject:", v5);

        v4 = v67 + 1;
      }
      while ((char *)v61 != v67 + 1);
      v61 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v89, v97, 16);
    }
    while (v61);
  }

  v60 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v85 = 0u;
  v86 = 0u;
  v87 = 0u;
  v88 = 0u;
  v64 = v63;
  v62 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v85, v96, 16);
  if (v62)
  {
    v58 = *(_QWORD *)v86;
    do
    {
      v27 = 0;
      do
      {
        if (*(_QWORD *)v86 != v58)
          objc_enumerationMutation(v64);
        v66 = v27;
        objc_msgSend(v64, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v85 + 1) + 8 * v27));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v30 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        for (i = 0; i != 6; ++i)
        {
          v32 = name_keys[i];
          objc_msgSend(v28, "objectAtIndexedSubscript:", 0);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "objectForKeyedSubscript:", v32);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "setObject:forKeyedSubscript:", v34, v32);

        }
        v72 = v30;
        memset(v95, 0, sizeof(v95));
        v81 = 0u;
        v82 = 0u;
        v83 = 0u;
        v84 = 0u;
        v68 = v28;
        v74 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v81, v94, 16);
        if (v74)
        {
          v70 = *(_QWORD *)v82;
          do
          {
            v35 = 0;
            do
            {
              if (*(_QWORD *)v82 != v70)
                objc_enumerationMutation(v68);
              v76 = v35;
              v36 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * v35);
              objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("children"));
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              v38 = v37;
              if (v37)
              {
                v79 = 0u;
                v80 = 0u;
                v77 = 0u;
                v78 = 0u;
                v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v77, v93, 16);
                if (v39)
                {
                  v40 = v39;
                  v41 = *(_QWORD *)v78;
                  do
                  {
                    for (j = 0; j != v40; ++j)
                    {
                      if (*(_QWORD *)v78 != v41)
                        objc_enumerationMutation(v38);
                      objc_msgSend(v29, "addObject:", *(_QWORD *)(*((_QWORD *)&v77 + 1) + 8 * j));
                    }
                    v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v77, v93, 16);
                  }
                  while (v40);
                }
              }
              v43 = 0;
              v44 = 0;
              do
              {
                v45 = 0;
                v46 = 1;
                do
                {
                  v47 = v44;
                  v48 = v46;
                  objc_msgSend(v36, "objectForKeyedSubscript:", *(&stat_keys[2 * v43] + v45));
                  v44 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v44)
                    *((_QWORD *)&v95[v43] + v45) += objc_msgSend(v44, "unsignedLongLongValue");
                  v46 = 0;
                  v45 = 1;
                }
                while ((v48 & 1) != 0);
                ++v43;
              }
              while (v43 != 4);

              v35 = v76 + 1;
            }
            while (v76 + 1 != v74);
            v74 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v81, v94, 16);
          }
          while (v74);
        }

        for (k = 0; k != 4; ++k)
        {
          v50 = 0;
          v51 = 1;
          do
          {
            v52 = v51;
            if (*((_QWORD *)&v95[k] + v50))
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v72, "setObject:forKeyedSubscript:", v53, *(&stat_keys[2 * k] + v50));

            }
            v51 = 0;
            v50 = 1;
          }
          while ((v52 & 1) != 0);
        }
        +[VMUDominatorGraph consolidate:](VMUDominatorGraph, "consolidate:", v29);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = v54;
        if (v54 && objc_msgSend(v54, "count"))
          objc_msgSend(v72, "setObject:forKeyedSubscript:", v55, CFSTR("children"));
        objc_msgSend(v60, "addObject:", v72);

        v27 = v66 + 1;
      }
      while (v66 + 1 != v62);
      v62 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v85, v96, 16);
    }
    while (v62);
  }

  return v60;
}

- (id)export:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __28__VMUDominatorGraph_export___block_invoke;
  v9[3] = &unk_1E4E039D8;
  v10 = v4;
  v5 = v4;
  v6 = (void *)MEMORY[0x1A85A995C](v9);
  -[VMUDominatorGraph fastDFS:graph:](self, "fastDFS:graph:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __28__VMUDominatorGraph_export___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, void *a6, void *a7, uint64_t a8, void *a9)
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  int v25;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  __CFString **v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  uint64_t v38;
  void *v39;
  void *v40;
  __CFString **v41;
  void *v42;
  uint64_t v43;
  __CFString **v44;
  void *v45;
  void *v47;
  void *v48;
  void *v49;
  id obj;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  __int128 v56;
  __int128 v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v15 = a6;
  v16 = a7;
  v17 = a9;
  v56 = 0u;
  v57 = 0u;
  if (a5 == 5 || a5 == 2)
  {
    *((_QWORD *)&v57 + 1) = 1;
    if (v16)
    {
      objc_msgSend(v16, "path");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v23, "length"))
        v24 = v23;
      else
        v24 = 0;
      v21 = v24;

      v25 = *((_DWORD *)v16 + 13);
      if (v25 == 3 || v25 == 0)
        *((_QWORD *)&v56 + 1) = *((_QWORD *)v16 + 22) + *((_QWORD *)v16 + 23);
      v27 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(v16, "type");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setObject:forKeyedSubscript:", v28, CFSTR("region"));

      v19 = v27;
      if (!v21)
      {
LABEL_19:

        if (v19)
          goto LABEL_21;
        goto LABEL_20;
      }
      v22 = CFSTR("path");
LABEL_18:
      objc_msgSend(v19, "setObject:forKeyedSubscript:", v21, v22);
      goto LABEL_19;
    }
LABEL_20:
    v19 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(*(id *)(a1 + 32), "nodeDescription:", a2);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v29, CFSTR("description"));

    goto LABEL_21;
  }
  if (a5 != 1)
    goto LABEL_20;
  *(_QWORD *)&v56 = a4;
  *(_QWORD *)&v57 = 1;
  v18 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v19 = v18;
  if (v15)
  {
    objc_msgSend(v15, "className");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v20, CFSTR("className"));

    objc_msgSend(v15, "binaryName");
    v21 = (id)objc_claimAutoreleasedReturnValue();
    v22 = CFSTR("binary");
    goto LABEL_18;
  }
  objc_msgSend(v18, "setObject:forKeyedSubscript:", CFSTR("non-object"), CFSTR("className"));
  if (!v19)
    goto LABEL_20;
LABEL_21:
  v48 = v16;
  if (a8 != -1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a8);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v30, CFSTR("stackid"));

  }
  v31 = 0;
  v32 = stat_keys;
  do
  {
    if (*(_QWORD *)((char *)&v56 + v31))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setObject:forKeyedSubscript:", v33, *v32);

    }
    v31 += 8;
    v32 += 2;
  }
  while (v31 != 32);
  v47 = v19;
  v49 = v15;
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  obj = v17;
  v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v52;
    do
    {
      for (i = 0; i != v35; ++i)
      {
        if (*(_QWORD *)v52 != v36)
          objc_enumerationMutation(obj);
        v38 = 0;
        v39 = 0;
        v40 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
        v41 = off_1E4E03998;
        do
        {
          v42 = v39;
          objc_msgSend(v40, "objectForKeyedSubscript:", *v41, v47, v48);
          v39 = (void *)objc_claimAutoreleasedReturnValue();

          if (v39)
            *(_QWORD *)((char *)&v56 + v38) += objc_msgSend(v39, "unsignedLongLongValue");
          v41 += 2;
          v38 += 8;
        }
        while (v38 != 32);

      }
      v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
    }
    while (v35);
  }

  v43 = 0;
  v44 = off_1E4E03998;
  do
  {
    if (*(_QWORD *)((char *)&v56 + v43))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "setObject:forKeyedSubscript:", v45, *v44);

    }
    v43 += 8;
    v44 += 2;
  }
  while (v43 != 32);
  objc_msgSend(v47, "setObject:forKeyedSubscript:", obj, CFSTR("children"));

  return v47;
}

- (id)fastDFS:(id)a3 graph:(id)a4
{
  VMUVMRegionIdentifier *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  id v14;
  id v15;
  VMUVMRegionIdentifier *v16;
  id v17;
  uint64_t nodeNamespaceSize;
  uint64_t j;
  void *v20;
  id v21;
  id v23;
  id v24;
  id v25[4];
  __int128 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v24 = a3;
  v23 = a4;
  v6 = -[VMUVMRegionIdentifier initWithGraph:options:]([VMUVMRegionIdentifier alloc], "initWithGraph:options:", v23, 0);
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  -[VMUVMRegionIdentifier regions](v6, "regions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v31 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        if ((objc_msgSend(v12, "isSubmap") & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v12, "address"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v12, v13);

        }
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v9);
  }

  v25[0] = (id)1;
  v14 = v7;
  v25[1] = v14;
  v15 = v23;
  v25[2] = v15;
  v16 = v6;
  v25[3] = v16;
  v26 = *(_OWORD *)&self->_firstDominates;
  v27 = MEMORY[0x1A85A995C](v24);
  v28 = objc_msgSend(v15, "methodForSelector:", sel_nodeDetails_);
  v29 = objc_msgSend(v15, "methodForSelector:", sel_stackIDForNode_);
  v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  nodeNamespaceSize = self->_nodeNamespaceSize;
  if ((int)nodeNamespaceSize >= 1)
  {
    for (j = 0; nodeNamespaceSize != j; ++j)
    {
      if (self->_dominators[j] == -1 && self->_firstDominates[j] != -1)
      {
        visit((uint64_t)v25, j);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v20)
        {
          v21 = 0;
          goto LABEL_18;
        }
        objc_msgSend(v17, "addObject:", v20);

      }
    }
  }
  v21 = v17;
LABEL_18:

  __destructor_8_s8_s16_s24_sb48(v25);
  return v21;
}

- (VMUDominatorGraph)initWithGraph:(id)a3
{
  return -[VMUDominatorGraph initWithGraph:debugTimer:](self, "initWithGraph:debugTimer:", a3, 0);
}

- (VMUDominatorGraph)initWithGraph:(id)a3 debugTimer:(id)a4
{
  id v6;
  id v7;
  VMUDominatorGraph *v8;
  void *v9;
  VMUReverseGraphEnumerator *v10;
  VMUGraphEnumerator *reverseGraphEnumerator;
  int v12;
  _DWORD *v13;
  VMUGraphEnumerator *v14;
  unsigned int *v15;
  void *v16;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)VMUDominatorGraph;
  v8 = -[VMUDominatorGraph init](&v18, sel_init);
  if (v8)
  {
    v9 = (void *)objc_msgSend(v6, "copy");

    v8->_nodeNamespaceSize = objc_msgSend(v9, "nodeNamespaceSize");
    v10 = -[VMUReverseGraphEnumerator initWithGraph:]([VMUReverseGraphEnumerator alloc], "initWithGraph:", v9);
    reverseGraphEnumerator = v8->_reverseGraphEnumerator;
    v8->_reverseGraphEnumerator = &v10->super;

    objc_msgSend(v9, "removeWeakEdges");
    v12 = objc_msgSend(v9, "nodeNamespaceSize");
    v13 = malloc_type_calloc(1uLL, ((v12 + 7) >> 3) + 4, 0xFF42C4F3uLL);
    *v13 = v12;
    objc_msgSend(v9, "markRootNodes:", v13);
    v14 = -[VMUGraphEnumerator initWithGraph:]([VMUGraphEnumerator alloc], "initWithGraph:", v9);
    v15 = -[VMUGraphEnumerator buildReversePostOrderWithRoots:](v14, "buildReversePostOrderWithRoots:", v13);

    -[VMUDominatorGraph _computeDominators:roots:reversePostOrder:debugTimer:](v8, "_computeDominators:roots:reversePostOrder:debugTimer:", v9, v13, v15, v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[VMUDominatorGraph setDominators_data:](v8, "setDominators_data:", v16);

    v8->_dominators = (unsigned int *)-[NSData bytes](v8->_dominators_data, "bytes");
    free(v15);
    free(v13);
    -[VMUDominatorGraph _computeDominees:](v8, "_computeDominees:", v9);
    v6 = v9;
  }

  return v8;
}

- (id)_computeDominators:(id)a3 roots:(void *)a4 reversePostOrder:(unsigned int *)a5 debugTimer:(id)a6
{
  void *v8;
  unsigned int v9;
  size_t v10;
  _DWORD *v11;
  void *v12;
  _DWORD *v13;
  int v14;
  uint64_t v15;
  unsigned int *v16;
  uint64_t v17;
  unsigned int v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  unsigned int *v22;
  uint64_t v23;
  uint64_t v24;
  unsigned int v25;
  uint64_t *p_pattern4;
  int v27;
  VMUGraphEnumerator *reverseGraphEnumerator;
  VMUGraphEnumerator *v29;
  int v30;
  int v31;
  BOOL v32;
  int v33;
  uint64_t v34;
  id v36;
  id v38;
  id v39;
  void *v40;
  uint64_t v41;
  VMUGraphEnumerator *v42;
  uint64_t v43;
  _DWORD *v44;
  _QWORD v45[4];
  id v46;
  uint64_t *v47;
  void *v48;
  _DWORD *v49;
  _QWORD v50[7];
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  int v54;
  _QWORD v55[5];
  uint64_t __pattern4;
  uint64_t *v57;
  uint64_t v58;
  int v59;

  v38 = a3;
  v39 = a6;
  objc_msgSend(v38, "invertedGraph");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "nodeNamespaceSize");
  v10 = 4 * (v9 + 1);
  v11 = malloc_type_malloc(v10, 0x100004052888210uLL);
  LODWORD(__pattern4) = -1;
  memset_pattern4(v11, &__pattern4, v10);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v11, v10, 1);
  v36 = (id)objc_claimAutoreleasedReturnValue();
  v12 = malloc_type_malloc(v10, 0x100004052888210uLL);
  LODWORD(__pattern4) = -1;
  memset_pattern4(v12, &__pattern4, v10);
  v13 = malloc_type_malloc(v10, 0x100004052888210uLL);
  LODWORD(__pattern4) = -1;
  v44 = v13;
  memset_pattern4(v13, &__pattern4, v10);
  v40 = v8;
  v14 = objc_msgSend(v8, "nodeNamespaceSize");
  if (v14 >= 1)
  {
    v15 = v14;
    v16 = a5;
    do
    {
      v18 = *v16++;
      v17 = v18;
      if (v18 == -1)
        break;
      *((_DWORD *)v12 + v17) = v15--;
    }
    while (v15);
  }
  v11[v9] = v9;
  v41 = 0;
  *((_DWORD *)v12 + v9) = objc_msgSend(v8, "nodeNamespaceSize") + 100;
  do
  {
    while (1)
    {
      v19 = objc_msgSend(v40, "nodeNamespaceSize");
      if (v19 >= 1)
      {
        v20 = 0;
        v43 = 0;
        v21 = -1;
        v22 = a5;
        v23 = v19;
        while (1)
        {
          v25 = *v22++;
          v24 = v25;
          if (v25 == -1)
            goto LABEL_33;
          if (v11[v24] != v9)
            break;
          ++v20;
LABEL_30:
          if (!--v23)
            goto LABEL_33;
        }
        p_pattern4 = &__pattern4;
        __pattern4 = 0;
        v57 = &__pattern4;
        v58 = 0x2020000000;
        v27 = v44[v24];
        v59 = v27;
        switch(v27)
        {
          case -1:
            v59 = 0;
            reverseGraphEnumerator = self->_reverseGraphEnumerator;
            v55[0] = MEMORY[0x1E0C809B0];
            v55[1] = 3221225472;
            v55[2] = __74__VMUDominatorGraph__computeDominators_roots_reversePostOrder_debugTimer___block_invoke;
            v55[3] = &unk_1E4E03268;
            v55[4] = &__pattern4;
            -[VMUGraphEnumerator enumerateEdgesOfNode:withBlock:](reverseGraphEnumerator, "enumerateEdgesOfNode:withBlock:", v24, v55);
            p_pattern4 = v57;
            v44[v24] = *((_DWORD *)v57 + 6);
            break;
          case 1:
LABEL_15:
            ++v20;
LABEL_29:
            _Block_object_dispose(&__pattern4, 8);
            goto LABEL_30;
          case 0:
            v11[v24] = v9;
            goto LABEL_15;
        }
        v51 = 0;
        v52 = &v51;
        v53 = 0x2020000000;
        v54 = -1;
        if (*((_DWORD *)p_pattern4 + 6))
        {
          v29 = self->_reverseGraphEnumerator;
          v50[0] = MEMORY[0x1E0C809B0];
          v50[1] = 3221225472;
          v50[2] = __74__VMUDominatorGraph__computeDominators_roots_reversePostOrder_debugTimer___block_invoke_2;
          v50[3] = &unk_1E4E03A00;
          v50[5] = v12;
          v50[6] = v11;
          v50[4] = &v51;
          -[VMUGraphEnumerator enumerateEdgesOfNode:withBlock:](v29, "enumerateEdgesOfNode:withBlock:", v24, v50);
          if (*((_DWORD *)v57 + 6) >= 2u)
          {
            v42 = self->_reverseGraphEnumerator;
            v45[0] = MEMORY[0x1E0C809B0];
            v45[1] = 3221225472;
            v45[2] = __74__VMUDominatorGraph__computeDominators_roots_reversePostOrder_debugTimer___block_invoke_3;
            v45[3] = &unk_1E4E03A28;
            v47 = &v51;
            v48 = v12;
            v49 = v11;
            v46 = v38;
            -[VMUGraphEnumerator enumerateEdgesOfNode:withBlock:](v42, "enumerateEdgesOfNode:withBlock:", v24, v45);

          }
        }
        else
        {
          v54 = v9;
        }
        v30 = *((_DWORD *)v52 + 6);
        if (v30 == -1 || ((v31 = v11[v24], v31 != -1) ? (v32 = v30 == v31) : (v32 = 0), v32))
        {
          v24 = v21;
        }
        else
        {
          v11[v24] = v30;
          ++v43;
        }
        _Block_object_dispose(&v51, 8);
        v21 = v24;
        goto LABEL_29;
      }
      v43 = 0;
      v20 = 0;
      v21 = -1;
LABEL_33:
      if (!v39)
        break;
      NSLog(CFSTR("compute dominators (%lu): changeCount = %lu, skipCount = %lu, lastChangedIndex = %ld"), v41++, v43, v20, v21, v36);
      if (!v43)
        goto LABEL_37;
    }
  }
  while (v43);
LABEL_37:
  v33 = objc_msgSend(v40, "nodeNamespaceSize");
  if (v33 >= 1)
  {
    v34 = v33;
    do
    {
      if (*v11 == v9)
        *v11 = -1;
      ++v11;
      --v34;
    }
    while (v34);
  }
  free(v44);
  free(v12);

  return v36;
}

uint64_t __74__VMUDominatorGraph__computeDominators_roots_reversePostOrder_debugTimer___block_invoke(uint64_t result)
{
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

_QWORD *__74__VMUDominatorGraph__computeDominators_roots_reversePostOrder_debugTimer___block_invoke_2(_QWORD *result, uint64_t a2, uint64_t a3, unsigned int a4, _BYTE *a5)
{
  if (*(_DWORD *)(result[5] + 4 * a4) != -1 && *(_DWORD *)(result[6] + 4 * a4) != -1)
  {
    *(_DWORD *)(*(_QWORD *)(result[4] + 8) + 24) = a4;
    *a5 = 1;
  }
  return result;
}

_QWORD *__74__VMUDominatorGraph__computeDominators_roots_reversePostOrder_debugTimer___block_invoke_3(_QWORD *result, uint64_t a2, uint64_t a3, unsigned int a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  unsigned int v10;

  v4 = result[6];
  if (*(_DWORD *)(v4 + 4 * a4) != -1)
  {
    v5 = a4;
    v6 = *(_QWORD *)(result[5] + 8);
    v7 = *(unsigned int *)(v6 + 24);
    if (v7 != a4)
    {
      v8 = result[7];
      if (*(_DWORD *)(v8 + 4 * a4) != -1)
      {
        do
        {
          v9 = *(_DWORD *)(v4 + 4 * v7);
          while (1)
          {
            v10 = *(_DWORD *)(v4 + 4 * v5);
            if (v10 >= v9)
              break;
            v5 = *(unsigned int *)(v8 + 4 * v5);
          }
          while (v9 < v10)
          {
            v7 = *(unsigned int *)(v8 + 4 * v7);
            v9 = *(_DWORD *)(v4 + 4 * v7);
          }
        }
        while (v5 != v7);
        *(_DWORD *)(v6 + 24) = v5;
      }
    }
  }
  return result;
}

- (void)_computeDominees:(id)a3
{
  size_t v4;
  void *v5;
  size_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  unsigned int *dominators;
  uint64_t v13;
  unsigned int *v14;
  uint64_t v15;
  unsigned int *nextDominates;
  id v17;
  int v18;
  int __pattern4;

  v17 = a3;
  v4 = 4 * objc_msgSend(v17, "nodeNamespaceSize");
  v5 = malloc_type_malloc(v4, 0x100004052888210uLL);
  __pattern4 = -1;
  memset_pattern4(v5, &__pattern4, v4);
  self->_firstDominates = (unsigned int *)v5;
  v6 = 4 * objc_msgSend(v17, "nodeNamespaceSize");
  v7 = malloc_type_malloc(v6, 0x100004052888210uLL);
  v18 = -1;
  memset_pattern4(v7, &v18, v6);
  self->_nextDominates = (unsigned int *)v7;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", self->_firstDominates, 4 * objc_msgSend(v17, "nodeNamespaceSize"), 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VMUDominatorGraph setFirstDominates_data:](self, "setFirstDominates_data:", v8);

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", self->_nextDominates, 4 * objc_msgSend(v17, "nodeNamespaceSize"), 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[VMUDominatorGraph setNextDominates_data:](self, "setNextDominates_data:", v9);

  v10 = objc_msgSend(v17, "nodeNamespaceSize");
  if (v10 >= 1)
  {
    v11 = 0;
    dominators = self->_dominators;
    do
    {
      v13 = dominators[v11];
      if ((_DWORD)v13 != -1)
      {
        v14 = &self->_firstDominates[v13];
        v15 = *v14;
        if ((_DWORD)v15 != -1)
        {
          nextDominates = self->_nextDominates;
          v14 = &nextDominates[v15];
          nextDominates[v11] = *v14;
        }
        *v14 = v11;
      }
      ++v11;
    }
    while (v10 != v11);
  }

}

- (unsigned)dominator:(unsigned int)a3
{
  return self->_dominators[a3];
}

- (void)enumerateDomineesForNodeName:(unsigned int)a3 withBlock:(id)a4
{
  _DWORD *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int *nextDominates;
  void (**v12)(id, _QWORD);

  v12 = (void (**)(id, _QWORD))a4;
  v6 = malloc_type_malloc(0x80uLL, 0x100004052888210uLL);
  *v6 = self->_firstDominates[a3];
  v7 = 32;
  v8 = 1;
  do
  {
    v9 = v8 - 1;
    v10 = v6[v8 - 1];
    if ((_DWORD)v10 != -1)
    {
      v12[2](v12, v6[v8 - 1]);
      if (v8 + 1 >= v7)
      {
        v6 = malloc_type_realloc(v6, 8 * v7, 0x100004052888210uLL);
        v7 *= 2;
      }
      nextDominates = self->_nextDominates;
      v6[v9] = self->_firstDominates[v10];
      v6[v8] = nextDominates[v10];
      v9 = v8 + 1;
    }
    v8 = v9;
  }
  while (v9);
  free(v6);

}

- (BOOL)hasAnyDirectDomineesForNodeName:(unsigned int)a3
{
  return self->_firstDominates[a3] != -1;
}

- (void)enumerateDirectDomineesForNodeName:(unsigned int)a3 withBlock:(id)a4
{
  uint64_t i;

  for (i = self->_firstDominates[a3]; (_DWORD)i != -1; i = self->_nextDominates[i])
    (*((void (**)(id, uint64_t))a4 + 2))(a4, i);
}

- (void)enumerateDominatorRootsWithBlock:(id)a3
{
  uint64_t nodeNamespaceSize;
  uint64_t i;
  void (**v6)(id, _QWORD);

  v6 = (void (**)(id, _QWORD))a3;
  nodeNamespaceSize = self->_nodeNamespaceSize;
  if ((int)nodeNamespaceSize >= 1)
  {
    for (i = 0; i != nodeNamespaceSize; ++i)
    {
      if (self->_dominators[i] == -1 && self->_firstDominates[i] != -1)
        v6[2](v6, i);
    }
  }

}

- (id)iterDominatorRoots
{
  return -[VMUDominatorRoots initWithDominatorGraph:]([VMUDominatorRoots alloc], "initWithDominatorGraph:", self);
}

- (id)iterDirectDomineesForNodeName:(unsigned int)a3
{
  return -[VMUDirectDominees initWithDominatorGraph:rootNode:]([VMUDirectDominees alloc], "initWithDominatorGraph:rootNode:", self, *(_QWORD *)&a3);
}

+ (id)callTreeWithGraph:(id)a3 groupByType:(BOOL)a4 showRegionVirtualSize:(BOOL)a5 desiredAddress:(id)a6 debugTimer:(id)a7
{
  _BOOL8 v8;
  _BOOL8 v9;
  id v11;
  id v12;
  id v13;
  VMUDominatorCallTreeCreator *v14;
  void *v15;

  v8 = a5;
  v9 = a4;
  v11 = a7;
  v12 = a6;
  v13 = a3;
  v14 = objc_alloc_init(VMUDominatorCallTreeCreator);
  -[VMUDominatorCallTreeCreator setDesiredAddress:](v14, "setDesiredAddress:", v12);

  -[VMUDominatorCallTreeCreator callTreeWithGraph:groupByType:showRegionVirtualSize:debugTimer:](v14, "callTreeWithGraph:groupByType:showRegionVirtualSize:debugTimer:", v13, v9, v8, v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)callTreeWithGraph:(id)a3 groupByType:(BOOL)a4 showRegionVirtualSize:(BOOL)a5 desiredClassesPattern:(id)a6 debugTimer:(id)a7
{
  _BOOL8 v8;
  _BOOL8 v9;
  id v11;
  id v12;
  id v13;
  VMUDominatorCallTreeCreator *v14;
  void *v15;

  v8 = a5;
  v9 = a4;
  v11 = a7;
  v12 = a6;
  v13 = a3;
  v14 = objc_alloc_init(VMUDominatorCallTreeCreator);
  -[VMUDominatorCallTreeCreator setDesiredClassesPattern:](v14, "setDesiredClassesPattern:", v12);

  -[VMUDominatorCallTreeCreator callTreeWithGraph:groupByType:showRegionVirtualSize:debugTimer:](v14, "callTreeWithGraph:groupByType:showRegionVirtualSize:debugTimer:", v13, v9, v8, v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (NSData)dominators_data
{
  return self->_dominators_data;
}

- (void)setDominators_data:(id)a3
{
  objc_storeStrong((id *)&self->_dominators_data, a3);
}

- (NSData)firstDominates_data
{
  return self->_firstDominates_data;
}

- (void)setFirstDominates_data:(id)a3
{
  objc_storeStrong((id *)&self->_firstDominates_data, a3);
}

- (NSData)nextDominates_data
{
  return self->_nextDominates_data;
}

- (void)setNextDominates_data:(id)a3
{
  objc_storeStrong((id *)&self->_nextDominates_data, a3);
}

- (unsigned)nodeNamespaceSize
{
  return self->_nodeNamespaceSize;
}

- (void)setNodeNamespaceSize:(unsigned int)a3
{
  self->_nodeNamespaceSize = a3;
}

- (unsigned)dominators
{
  return self->_dominators;
}

- (void)setDominators:(unsigned int *)a3
{
  self->_dominators = a3;
}

- (unsigned)firstDominates
{
  return self->_firstDominates;
}

- (void)setFirstDominates:(unsigned int *)a3
{
  self->_firstDominates = a3;
}

- (unsigned)nextDominates
{
  return self->_nextDominates;
}

- (void)setNextDominates:(unsigned int *)a3
{
  self->_nextDominates = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextDominates_data, 0);
  objc_storeStrong((id *)&self->_firstDominates_data, 0);
  objc_storeStrong((id *)&self->_dominators_data, 0);
  objc_storeStrong((id *)&self->_reverseGraphEnumerator, 0);
}

@end
