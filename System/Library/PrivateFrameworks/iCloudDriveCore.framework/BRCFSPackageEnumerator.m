@implementation BRCFSPackageEnumerator

- (id)initForURL:(id)a3 boundaryKey:(id)a4 error:(id *)a5
{
  id v9;
  BRCFSPackageEnumerator *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  BRCSQLBackedSet *packageItems;
  __int128 v17;
  char *v18;
  char *v19;
  void *v20;
  char *v21;
  NSObject *v22;
  BRCSQLBackedSet *v23;
  void *v24;
  id *v25;
  void *v26;
  id v27;
  void *v28;
  NSObject *v29;
  BRCFSPackageEnumerator *v30;
  uint64_t v31;
  NSData *boundaryKey;
  const char *v34;
  __int128 v35;
  id v36;
  id obj;
  _QWORD v38[5];
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  objc_super v45;
  uint8_t buf[4];
  const char *v47;
  __int16 v48;
  const char *v49;
  __int16 v50;
  id v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v36 = a4;
  v45.receiver = self;
  v45.super_class = (Class)BRCFSPackageEnumerator;
  v10 = -[BRCFSPackageEnumerator init](&v45, sel_init);
  if (!v10)
    goto LABEL_17;
  brc_bread_crumbs();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[BRCFSPackageEnumerator initForURL:boundaryKey:error:].cold.1((uint64_t)v9, (uint64_t)v11, v12);

  objc_storeStrong((id *)&v10->_rootURL, a3);
  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__8;
  v43 = __Block_byref_object_dispose__8;
  v44 = 0;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = MEMORY[0x24BDAC760];
  v38[1] = 3221225472;
  v38[2] = __55__BRCFSPackageEnumerator_initForURL_boundaryKey_error___block_invoke;
  v38[3] = &unk_24FE41898;
  v38[4] = &v39;
  objc_msgSend(v13, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v9, 0, 16, v38);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  +[BRCSQLBackedSet createStringsSetWithError:](BRCSQLBackedSet, "createStringsSetWithError:", a5);
  v15 = objc_claimAutoreleasedReturnValue();
  packageItems = v10->_packageItems;
  v10->_packageItems = (BRCSQLBackedSet *)v15;

  if (!v10->_packageItems)
    goto LABEL_15;
  v18 = 0;
  *(_QWORD *)&v17 = 138412546;
  v35 = v17;
  while (1)
  {
    objc_msgSend(v14, "nextObject", v35);
    v19 = (char *)objc_claimAutoreleasedReturnValue();

    if (!v19)
      break;
    v20 = (void *)MEMORY[0x2348B9F14]();
    brc_bread_crumbs();
    v21 = (char *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = v35;
      v47 = v19;
      v48 = 2112;
      v49 = v21;
      _os_log_debug_impl(&dword_230455000, v22, OS_LOG_TYPE_DEBUG, "[DEBUG] Enumerating %@%@", buf, 0x16u);
    }

    v23 = v10->_packageItems;
    objc_msgSend(v19, "relativePath");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (id *)(v40 + 5);
    obj = (id)v40[5];
    -[BRCSQLBackedSet addObject:error:](v23, "addObject:error:", v24, &obj);
    objc_storeStrong(v25, obj);

    objc_autoreleasePoolPop(v20);
    v18 = v19;
  }
  v26 = (void *)v40[5];
  if (!v26)
  {
    v31 = objc_msgSend(v36, "copy");
    boundaryKey = v10->_boundaryKey;
    v10->_boundaryKey = (NSData *)v31;

    _Block_object_dispose(&v39, 8);
LABEL_17:
    v30 = v10;
    goto LABEL_18;
  }
  v27 = v26;
  brc_bread_crumbs();
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, (os_log_type_t)0x90u))
  {
    v34 = "(passed to caller)";
    *(_DWORD *)buf = 136315906;
    v47 = "-[BRCFSPackageEnumerator initForURL:boundaryKey:error:]";
    v48 = 2080;
    if (!a5)
      v34 = "(ignored by caller)";
    v49 = v34;
    v50 = 2112;
    v51 = v27;
    v52 = 2112;
    v53 = v28;
    _os_log_error_impl(&dword_230455000, v29, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
  }

  if (a5)
    *a5 = objc_retainAutorelease(v27);

LABEL_15:
  _Block_object_dispose(&v39, 8);

  v30 = 0;
LABEL_18:

  return v30;
}

uint64_t __55__BRCFSPackageEnumerator_initForURL_boundaryKey_error___block_invoke(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
  return 0;
}

- (BOOL)enumeratePackageItemsWithSortOrder:(unint64_t)a3 error:(id *)a4 usingBlock:(id)a5
{
  id v7;
  BRCSQLBackedSet *packageItems;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  const char *v14;
  _QWORD v15[5];
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v7 = a5;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__8;
  v22 = __Block_byref_object_dispose__8;
  v23 = 0;
  packageItems = self->_packageItems;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __78__BRCFSPackageEnumerator_enumeratePackageItemsWithSortOrder_error_usingBlock___block_invoke;
  v15[3] = &unk_24FE418C0;
  v15[4] = self;
  v17 = &v18;
  v9 = v7;
  v16 = v9;
  -[BRCSQLBackedSet enumerateObjectsWithSortOrder:usingBlock:](packageItems, "enumerateObjectsWithSortOrder:usingBlock:", 2, v15);
  v10 = (id)v19[5];
  if (v10)
  {
    brc_bread_crumbs();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, (os_log_type_t)0x90u))
    {
      v14 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      v25 = "-[BRCFSPackageEnumerator enumeratePackageItemsWithSortOrder:error:usingBlock:]";
      v26 = 2080;
      if (!a4)
        v14 = "(ignored by caller)";
      v27 = v14;
      v28 = 2112;
      v29 = v10;
      v30 = 2112;
      v31 = v11;
      _os_log_error_impl(&dword_230455000, v12, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    }

  }
  if (a4)
    *a4 = objc_retainAutorelease(v10);

  _Block_object_dispose(&v18, 8);
  return v10 == 0;
}

void __78__BRCFSPackageEnumerator_enumeratePackageItemsWithSortOrder_error_usingBlock___block_invoke(_QWORD *a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  id obj;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = (void *)MEMORY[0x2348B9F14]();
  objc_msgSend(*(id *)(a1[4] + 8), "URLByAppendingPathComponent:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = a1[4];
  v9 = *(_QWORD *)(v8 + 8);
  v10 = *(_QWORD *)(v8 + 24);
  v11 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v11 + 40);
  v12 = +[BRCPackageItem newItemForSignatureCalculationWithURL:inPackage:boundaryKey:error:](BRCPackageItem, "newItemForSignatureCalculationWithURL:inPackage:boundaryKey:error:", v7, v9, v10, &obj);
  objc_storeStrong((id *)(v11 + 40), obj);
  if (v12)
  {
    (*(void (**)(void))(a1[5] + 16))();
  }
  else if (objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "br_isCloudDocsErrorCode:", 43))
  {
    brc_bread_crumbs();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "path");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "fp_obfuscatedPath");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v26 = v16;
      v27 = 2112;
      v28 = v13;
      _os_log_impl(&dword_230455000, v14, OS_LOG_TYPE_DEFAULT, "[WARNING] Ignoring excluded package item from sync %@%@", buf, 0x16u);

    }
    v17 = *(_QWORD *)(a1[6] + 8);
    v18 = *(void **)(v17 + 40);
    *(_QWORD *)(v17 + 40) = 0;

  }
  else
  {
    brc_bread_crumbs();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, (os_log_type_t)0x90u))
    {
      objc_msgSend(v7, "path");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "fp_obfuscatedPath");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
      *(_DWORD *)buf = 138412802;
      v26 = v22;
      v27 = 2112;
      v28 = v23;
      v29 = 2112;
      v30 = v19;
      _os_log_error_impl(&dword_230455000, v20, (os_log_type_t)0x90u, "[ERROR] Couldn't create import item for %@ - %@%@", buf, 0x20u);

    }
    *a3 = 1;
  }

  objc_autoreleasePoolPop(v6);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_boundaryKey, 0);
  objc_storeStrong((id *)&self->_packageItems, 0);
  objc_storeStrong((id *)&self->_rootURL, 0);
}

- (void)initForURL:(uint64_t)a1 boundaryKey:(uint64_t)a2 error:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_debug_impl(&dword_230455000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] Creating BRCFSPackageEnumerator for %@%@", (uint8_t *)&v3, 0x16u);
}

@end
