@implementation SPIndexStorageUsageCollector

- (SPIndexStorageUsageCollector)init
{
  SPIndexStorageUsageCollector *v2;
  uint64_t v3;
  NSMutableDictionary *visitedInodes;
  uint64_t v5;
  NSMutableDictionary *storageUsage;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SPIndexStorageUsageCollector;
  v2 = -[SPIndexStorageUsageCollector init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    visitedInodes = v2->_visitedInodes;
    v2->_visitedInodes = (NSMutableDictionary *)v3;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    storageUsage = v2->_storageUsage;
    v2->_storageUsage = (NSMutableDictionary *)v5;

  }
  return v2;
}

- (void)collectAtPath:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSMutableDictionary *storageUsage;
  uint64_t v17;
  NSMutableDictionary *v18;
  id v19;
  void *v20;
  int v21;
  NSMutableDictionary *v22;
  __CFString *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  uint64_t v30;
  id v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  int v38;
  id v39;
  id v40;
  _BOOL4 v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  int v51;
  void *v52;
  int v53;
  uint64_t v54;
  void *v55;
  id v56;
  void *v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  uint64_t v63;
  NSObject *v64;
  NSMutableDictionary *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t i;
  uint64_t v70;
  NSObject *v71;
  void *v72;
  void *v73;
  NSMutableDictionary *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t j;
  void *v81;
  char v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  id v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  void *v91;
  uint64_t v92;
  void *v93;
  id v94;
  uint64_t v95;
  id obj;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  void *v106;
  uint64_t v107;
  id v108;
  void *v109;
  SPIndexStorageUsageCollector *v110;
  id v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  id v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  _BYTE v125[128];
  _BYTE v126[128];
  _BYTE buf[12];
  __int16 v128;
  void *v129;
  uint64_t v130;

  v130 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enumeratorAtPath:", v4);
  v117 = 0u;
  v118 = 0u;
  v119 = 0u;
  v120 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v117, v126, 16);
  v93 = v5;
  v94 = v4;
  obj = v6;
  v110 = self;
  if (!v7)
    goto LABEL_80;
  v8 = v7;
  v104 = *MEMORY[0x24BDD0D08];
  v105 = *(_QWORD *)v118;
  v103 = *MEMORY[0x24BDD0CD0];
  v101 = *MEMORY[0x24BDD0CE0];
  v102 = *MEMORY[0x24BDD0CD8];
  v99 = *MEMORY[0x24BDD0D00];
  v100 = *MEMORY[0x24BDD0CE8];
  v97 = *MEMORY[0x24BDD0D38];
  v98 = *MEMORY[0x24BDD0D30];
  v92 = *MEMORY[0x24BDBCC88];
  v88 = *MEMORY[0x24BDD0D20];
  v89 = *MEMORY[0x24BDD0D10];
  do
  {
    v9 = 0;
    v95 = v8;
    do
    {
      if (*(_QWORD *)v118 != v105)
        objc_enumerationMutation(obj);
      v10 = *(void **)(*((_QWORD *)&v117 + 1) + 8 * v9);
      if (-[SPIndexStorageUsageCollector canceled](self, "canceled"))
      {
        v61 = obj;
        v62 = obj;
        goto LABEL_108;
      }
      objc_msgSend(v4, "stringByAppendingPathComponent:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "attributesOfItemAtPath:error:", v11, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v12)
      {
        v109 = v11;
        objc_msgSend(v12, "objectForKeyedSubscript:", v104);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "unsignedLongLongValue");

        storageUsage = self->_storageUsage;
        v17 = v15;
        v18 = storageUsage;
        v19 = v10;
        if (objc_msgSend(v19, "hasPrefix:", CFSTR("Priority")))
          incrementIndexStorageSize(v18, CFSTR("priority"), v17);
        if (objc_msgSend(v19, "hasPrefix:", v103))
          incrementIndexStorageSize(v18, CFSTR("protectionClassA"), v17);
        if (objc_msgSend(v19, "hasPrefix:", v102))
          incrementIndexStorageSize(v18, CFSTR("protectionClassB"), v17);
        if (objc_msgSend(v19, "hasPrefix:", v101))
          incrementIndexStorageSize(v18, CFSTR("protectionClassC"), v17);
        if (objc_msgSend(v19, "hasPrefix:", v100))
          incrementIndexStorageSize(v18, CFSTR("protectionClassCX"), v17);
        objc_msgSend(v19, "lastPathComponent");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v20, "isEqualToString:", CFSTR(".store.db")))
        {

          goto LABEL_21;
        }
        v21 = objc_msgSend(v20, "hasPrefix:", CFSTR("dbStr-"));

        if (v21)
LABEL_21:
          incrementIndexStorageSize(v18, CFSTR("sdb"), v17);
        v107 = v17;
        if ((objc_msgSend(v19, "hasSuffix:", CFSTR(".indexBigDates")) & 1) != 0)
        {
          v22 = v18;
          v23 = CFSTR("bigDate");
          goto LABEL_24;
        }
        v25 = 1;
        do
        {
          objc_msgSend(v19, "lastPathComponent");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("dbStr-%u.map."), v25);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v26, "hasPrefix:", v27);

          if (v28)
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("dataMap%u"), v25);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            incrementIndexStorageSize(v18, v32, v107);

            v33 = 1;
            v8 = v95;
            goto LABEL_35;
          }
          v25 = (v25 + 1);
        }
        while ((_DWORD)v25 != 7);
        objc_msgSend(v19, "lastPathComponent");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "rangeOfString:", CFSTR(".ivf-"));

        v8 = v95;
        if (v30 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v31 = v19;
          v17 = v107;
          if (objc_msgSend(v31, "hasSuffix:", CFSTR(".directoryStoreFile")))
          {

LABEL_53:
            v22 = v18;
            v23 = CFSTR("forwardDirStore");
LABEL_24:
            v24 = v17;
LABEL_34:
            incrementIndexStorageSize(v22, v23, v24);
            v33 = 1;
LABEL_35:

            objc_msgSend(v13, "objectForKeyedSubscript:", v99);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "objectForKeyedSubscript:", v98);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = objc_msgSend(v35, "isEqualToString:", v97);

            if (v36)
            {
              self = v110;
              updateStorageUsageIgnoreLinks(v110->_storageUsage, v19, v107, 0, v33);
              goto LABEL_43;
            }
            objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v109);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            *(_QWORD *)buf = 0;
            *(_QWORD *)&v121 = 0;
            v38 = objc_msgSend(v37, "getResourceValue:forKey:error:", buf, v92, &v121);
            v39 = *(id *)buf;
            v40 = (id)v121;
            v41 = v38 && (objc_msgSend(v39, "BOOLValue") & 1) != 0;

            if (objc_msgSend(v34, "unsignedLongValue") == 1)
            {
              self = v110;
              updateStorageUsageIgnoreLinks(v110->_storageUsage, v19, v107, v41, v33);
              v5 = v93;
              v4 = v94;
LABEL_43:
              v11 = v109;
            }
            else
            {
              objc_msgSend(v13, "objectForKeyedSubscript:", v89);
              v42 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "objectForKeyedSubscript:", v88);
              v90 = (void *)objc_claimAutoreleasedReturnValue();
              v91 = (void *)v42;
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v90, v42);
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableDictionary objectForKeyedSubscript:](v110->_visitedInodes, "objectForKeyedSubscript:", v43);
              v44 = (void *)objc_claimAutoreleasedReturnValue();

              v45 = (void *)MEMORY[0x24BDD16E0];
              if (v44)
              {
                -[NSMutableDictionary objectForKeyedSubscript:](v110->_visitedInodes, "objectForKeyedSubscript:", v43);
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v45, "numberWithUnsignedLong:", objc_msgSend(v46, "unsignedLongValue") - 1);
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSMutableDictionary setObject:forKeyedSubscript:](v110->_visitedInodes, "setObject:forKeyedSubscript:", v47, v43);

                -[NSMutableDictionary objectForKeyedSubscript:](v110->_visitedInodes, "objectForKeyedSubscript:", v43);
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                v49 = objc_msgSend(v48, "unsignedLongValue");

                v5 = v93;
                v4 = v94;
                v11 = v109;
                if (!v49)
                  -[NSMutableDictionary removeObjectForKey:](v110->_visitedInodes, "removeObjectForKey:", v43);
              }
              else
              {
                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", objc_msgSend(v34, "unsignedLongValue") - 1);
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSMutableDictionary setObject:forKeyedSubscript:](v110->_visitedInodes, "setObject:forKeyedSubscript:", v50, v43);

                updateStorageUsageIgnoreLinks(v110->_storageUsage, v19, v107, v41, v33);
                v5 = v93;
                v4 = v94;
                v11 = v109;
              }

              self = v110;
              v8 = v95;
            }

            goto LABEL_50;
          }
          v51 = objc_msgSend(v31, "hasSuffix:", CFSTR(".directoryStoreFile.shadow"));

          if (v51)
            goto LABEL_53;
          objc_msgSend(v31, "lastPathComponent");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v52, "isEqualToString:", CFSTR("reverseDirectoryStore")) & 1) != 0
            || objc_msgSend(v52, "isEqualToString:", CFSTR("reverseDirectoryStore.shadow")))
          {

            goto LABEL_57;
          }
          v53 = objc_msgSend(v52, "isEqualToString:", CFSTR("reverseStore.updates"));

          if (v53)
          {
LABEL_57:
            v22 = v18;
            v23 = CFSTR("reverseDirStore");
          }
          else
          {
            if (!objc_msgSend(v31, "hasSuffix:", CFSTR(".indexIds")))
            {
              if (objc_msgSend(v31, "hasSuffix:", CFSTR(".indexTermIds")))
              {
                v22 = v18;
                v23 = CFSTR("indexTermId");
              }
              else if (objc_msgSend(v31, "hasSuffix:", CFSTR(".indexPositions")))
              {
                v22 = v18;
                v23 = CFSTR("position");
              }
              else if (objc_msgSend(v31, "hasSuffix:", CFSTR(".indexPositionTable")))
              {
                v22 = v18;
                v23 = CFSTR("positionTable");
              }
              else if (objc_msgSend(v31, "hasSuffix:", CFSTR(".indexPostings")))
              {
                v22 = v18;
                v23 = CFSTR("posting");
              }
              else if (objc_msgSend(v31, "hasSuffix:", CFSTR(".indexScores")))
              {
                v22 = v18;
                v23 = CFSTR("score");
              }
              else if (objc_msgSend(v31, "hasSuffix:", CFSTR(".indexGroups")))
              {
                v22 = v18;
                v23 = CFSTR("group");
              }
              else if (isTermIndex(v31))
              {
                v22 = v18;
                v23 = CFSTR("termIndex");
              }
              else
              {
                if (!isJournal(v31))
                {
                  v33 = 0;
                  goto LABEL_35;
                }
                v22 = v18;
                v23 = CFSTR("journal");
              }
              v24 = v107;
              goto LABEL_34;
            }
            v22 = v18;
            v23 = CFSTR("indexId");
          }
        }
        else
        {
          v22 = v18;
          v23 = CFSTR("embedding");
        }
        v24 = v107;
        goto LABEL_34;
      }
LABEL_50:

      ++v9;
    }
    while (v9 != v8);
    v6 = obj;
    v54 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v117, v126, 16);
    v8 = v54;
  }
  while (v54);
LABEL_80:

  v116 = 0;
  objc_msgSend(v5, "attributesOfFileSystemForPath:error:", v4, &v116);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = v116;
  v106 = v55;
  v108 = v56;
  if (v55)
  {
    objc_msgSend(v55, "objectForKeyedSubscript:", *MEMORY[0x24BDD0D28]);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = objc_msgSend(v57, "unsignedLongLongValue");

    objc_msgSend(v55, "objectForKeyedSubscript:", *MEMORY[0x24BDD0D18]);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = objc_msgSend(v59, "unsignedLongLongValue");

    incrementIndexStorageSize(self->_storageUsage, CFSTR("diskSpace"), v58);
    incrementIndexStorageSize(self->_storageUsage, CFSTR("spaceLeft"), v60);
  }
  else
  {
    v63 = (uint64_t)v56;
    logForCSLogCategoryIndex();
    v64 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
      -[SPIndexStorageUsageCollector collectAtPath:].cold.1(v63, v64);

  }
  v114 = 0u;
  v115 = 0u;
  v112 = 0u;
  v113 = 0u;
  v65 = self->_storageUsage;
  v66 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v65, "countByEnumeratingWithState:objects:count:", &v112, v125, 16);
  if (v66)
  {
    v67 = v66;
    v68 = *(_QWORD *)v113;
    do
    {
      for (i = 0; i != v67; ++i)
      {
        if (*(_QWORD *)v113 != v68)
          objc_enumerationMutation(v65);
        v70 = *(_QWORD *)(*((_QWORD *)&v112 + 1) + 8 * i);
        logForCSLogCategoryIndex();
        v71 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
        {
          -[NSMutableDictionary objectForKeyedSubscript:](self->_storageUsage, "objectForKeyedSubscript:", v70);
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "unsignedLongLongValue");
          buf[4] = 0;
          *(_DWORD *)buf = 0;
          humanize_number();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", buf);
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v70;
          v128 = 2112;
          v129 = v73;
          _os_log_impl(&dword_213CF1000, v71, OS_LOG_TYPE_DEFAULT, "Index type %@ size %@", buf, 0x16u);

          self = v110;
        }

      }
      v67 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v65, "countByEnumeratingWithState:objects:count:", &v112, v125, 16);
    }
    while (v67);
  }

  v74 = self->_storageUsage;
  v75 = (void *)objc_opt_new();
  -[NSMutableDictionary allKeys](v74, "allKeys");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v121 = 0u;
  v122 = 0u;
  v123 = 0u;
  v124 = 0u;
  v111 = v76;
  v77 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v121, buf, 16);
  if (v77)
  {
    v78 = v77;
    v79 = *(_QWORD *)v122;
    do
    {
      for (j = 0; j != v78; ++j)
      {
        if (*(_QWORD *)v122 != v79)
          objc_enumerationMutation(v111);
        v81 = *(void **)(*((_QWORD *)&v121 + 1) + 8 * j);
        if ((objc_msgSend(v81, "isEqualToString:", CFSTR("spaceLeft")) & 1) != 0)
        {
          v82 = 30;
        }
        else if (objc_msgSend(v81, "isEqualToString:", CFSTR("diskSpace")))
        {
          v82 = 30;
        }
        else
        {
          v82 = 10;
        }
        v83 = (void *)MEMORY[0x24BDD16E0];
        -[NSMutableDictionary objectForKeyedSubscript:](v74, "objectForKeyedSubscript:", v81);
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v83, "numberWithUnsignedLongLong:", (unint64_t)objc_msgSend(v84, "unsignedLongLongValue") >> v82);
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "setObject:forKeyedSubscript:", v85, v81);

      }
      v78 = objc_msgSend(v111, "countByEnumeratingWithState:objects:count:", &v121, buf, 16);
    }
    while (v78);
  }
  v86 = (void *)objc_msgSend(v75, "copy");

  v87 = v86;
  AnalyticsSendEventLazy();

  v5 = v93;
  v4 = v94;
  v61 = obj;
  v62 = v108;
LABEL_108:

}

id __46__SPIndexStorageUsageCollector_collectAtPath___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (BOOL)canceled
{
  return self->_canceled;
}

- (void)setCanceled:(BOOL)a3
{
  self->_canceled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storageUsage, 0);
  objc_storeStrong((id *)&self->_visitedInodes, 0);
}

- (void)collectAtPath:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_213CF1000, a2, OS_LOG_TYPE_ERROR, "Failed to retrieve file system attributes: %@", (uint8_t *)&v2, 0xCu);
}

@end
