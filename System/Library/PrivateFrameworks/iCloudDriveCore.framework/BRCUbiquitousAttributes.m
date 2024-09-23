@implementation BRCUbiquitousAttributes

+ (void)brc_getterForAttribute:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;

  v3 = brc_getterForAttribute__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&brc_getterForAttribute__onceToken, &__block_literal_global_21);
  objc_msgSend((id)brc_getterForAttribute__ubiquitousAttributeToFunction, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(v5, "pointerValue");
  return v6;
}

void __50__BRCUbiquitousAttributes_brc_getterForAttribute___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[22];
  _QWORD v25[24];

  v25[22] = *MEMORY[0x24BDAC8D0];
  v24[0] = *MEMORY[0x24BDBCD28];
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:", ubiquitousItemHasUnresolvedConflicts);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v23;
  v24[1] = *MEMORY[0x24BDBCD30];
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:", ubiquitousItemIsDownloading);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v22;
  v24[2] = *MEMORY[0x24BDBD180];
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:", ubiquitousItemIsDownloadRequested);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v21;
  v24[3] = *MEMORY[0x24BDBCD00];
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:", ubiquitousItemIsDownloadRequested);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v25[3] = v20;
  v24[4] = *MEMORY[0x24BDBCD58];
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:", ubiquitousItemUploadingError);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25[4] = v19;
  v24[5] = *MEMORY[0x24BDBCD08];
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:", ubiquitousItemDownloadingError);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v25[5] = v18;
  v24[6] = *MEMORY[0x24BDBCD40];
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:", ubiquitousItemIsShared);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v25[6] = v17;
  v24[7] = *MEMORY[0x24BDBCDA0];
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:", ubiquitousSharedItemRole);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v25[7] = v16;
  v24[8] = *MEMORY[0x24BDBCD68];
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:", ubiquitousSharedItemRole);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v25[8] = v15;
  v24[9] = *MEMORY[0x24BDBCD80];
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:", ubiquitousSharedItemOwnerName);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v25[9] = v14;
  v24[10] = *MEMORY[0x24BDBCD78];
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:", ubiquitousSharedItemOwnerNameComponents);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v25[10] = v13;
  v24[11] = *MEMORY[0x24BDBCD70];
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:", ubiquitousItemLastEditorNameComponents);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v25[11] = v12;
  v24[12] = *MEMORY[0x24BDBCD88];
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:", ubiquitousSharedItemOldPermissions);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v25[12] = v0;
  v24[13] = *MEMORY[0x24BDBCD60];
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:", ubiquitousSharedItemCurrentUserPermissions);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v25[13] = v1;
  v24[14] = *MEMORY[0x24BDBCD50];
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:", ubiquitousItemIsUploading);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v25[14] = v2;
  v24[15] = *MEMORY[0x24BE17520];
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:", ubiquitousItemLastEditorDeviceName);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v25[15] = v3;
  v24[16] = *MEMORY[0x24BE17528];
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:", ubiquitousItemLastEditorName);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v25[16] = v4;
  v24[17] = *MEMORY[0x24BE17518];
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:", ubiquitousItemIsConflicted);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v25[17] = v5;
  v24[18] = *MEMORY[0x24BE17510];
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:", ubiquitousItemIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v25[18] = v6;
  v24[19] = *MEMORY[0x24BE17500];
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:", ubiquitousDocumentRecordID);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v25[19] = v7;
  v24[20] = *MEMORY[0x24BE17478];
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:", ubiquitousEditedSinceShared);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v25[20] = v8;
  v24[21] = *MEMORY[0x24BE17508];
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:", ubiquitousIsTopLevelSharedItem);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v25[21] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, v24, 22);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)brc_getterForAttribute__ubiquitousAttributeToFunction;
  brc_getterForAttribute__ubiquitousAttributeToFunction = v10;

}

+ (id)brc_attributesValues:(id)a3 localItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(id, void *);
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  __int128 v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  void *v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  brc_bread_crumbs();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    +[BRCUbiquitousAttributes brc_attributesValues:localItem:].cold.2();

  v28 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", objc_msgSend(v6, "count"));
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v10 = v6;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v11)
  {
    v13 = v11;
    v14 = *(_QWORD *)v30;
    *(_QWORD *)&v12 = 138412546;
    v27 = v12;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v30 != v14)
          objc_enumerationMutation(v10);
        v16 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
        v17 = objc_msgSend(a1, "brc_getterForAttribute:", v16, v27);
        if (v17)
        {
          v18 = (void (*)(id, void *))v17;
          objc_msgSend(v7, "db");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v18(v7, v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (v20)
          {
            objc_msgSend(v28, "setObject:forKeyedSubscript:", v20, v16);
          }
          else
          {
            brc_bread_crumbs();
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v27;
              v34 = v16;
              v35 = 2112;
              v36 = v22;
              _os_log_debug_impl(&dword_230455000, v23, OS_LOG_TYPE_DEBUG, "[DEBUG] No value for attribute: %@%@", buf, 0x16u);
            }

          }
        }
        else
        {
          brc_bread_crumbs();
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v27;
            v34 = v16;
            v35 = 2112;
            v36 = v20;
            _os_log_debug_impl(&dword_230455000, v21, OS_LOG_TYPE_DEBUG, "[DEBUG] unsupported attribute: %@%@", buf, 0x16u);
          }

        }
      }
      v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    }
    while (v13);
  }

  brc_bread_crumbs();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    +[BRCUbiquitousAttributes brc_attributesValues:localItem:].cold.1();

  return v28;
}

+ (void)brc_attributesValues:localItem:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] returning %@%@");
  OUTLINED_FUNCTION_0();
}

+ (void)brc_attributesValues:localItem:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] localItem: %@%@");
  OUTLINED_FUNCTION_0();
}

@end
