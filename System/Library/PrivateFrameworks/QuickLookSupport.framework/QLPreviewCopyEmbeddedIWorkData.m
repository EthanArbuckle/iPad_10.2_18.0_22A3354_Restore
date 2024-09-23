@implementation QLPreviewCopyEmbeddedIWorkData

void __QLPreviewCopyEmbeddedIWorkData_block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = (void *)MEMORY[0x212BA2710]();
  if (v7)
  {
    objc_msgSend(v7, "url");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "relativePath");
    v11 = objc_claimAutoreleasedReturnValue();

    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v12 = *(id *)(a1 + 32);
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v13)
    {
      v14 = v13;
      v24 = v9;
      v25 = v7;
      v15 = *(_QWORD *)v28;
      while (2)
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v28 != v15)
            objc_enumerationMutation(v12);
          v17 = -[NSObject rangeOfString:options:](v11, "rangeOfString:options:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i), 12);
          if (v17 != 0x7FFFFFFFFFFFFFFFLL)
          {
            v18 = v17;
            if (!v17
              || -[NSObject characterAtIndex:](v11, "characterAtIndex:", v17 - 1) == 47
              && (v18 == 1
               || -[NSObject rangeOfString:options:range:](v11, "rangeOfString:options:range:", CFSTR("/"), 0, 0, v18 - 1) == 0x7FFFFFFFFFFFFFFFLL))
            {
              v26 = v8;
              v7 = v25;
              objc_msgSend(v25, "readDataWithError:", &v26);
              v20 = objc_claimAutoreleasedReturnValue();
              v19 = v26;

              v21 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
              v22 = *(void **)(v21 + 40);
              *(_QWORD *)(v21 + 40) = v20;

              v9 = v24;
              if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
              {
                generationLog();
                v23 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
                  __QLPreviewCopyEmbeddedIWorkData_block_invoke_cold_2(a1, (uint64_t)v19, v23);

              }
              *a4 = 1;
              goto LABEL_23;
            }
          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        if (v14)
          continue;
        break;
      }
      v19 = v8;
      v9 = v24;
      v7 = v25;
    }
    else
    {
      v19 = v8;
    }
LABEL_23:

    v8 = v19;
  }
  else
  {
    generationLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __QLPreviewCopyEmbeddedIWorkData_block_invoke_cold_1((uint64_t)v8, v11);
  }

  objc_autoreleasePoolPop(v9);
}

void __QLPreviewCopyEmbeddedIWorkData_block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_20D4C7000, a2, OS_LOG_TYPE_ERROR, "Error reading archive: %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_2();
}

void __QLPreviewCopyEmbeddedIWorkData_block_invoke_cold_2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = *(_QWORD *)(a1 + 40);
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_0(&dword_20D4C7000, a2, a3, "Error reading archive %@ : %@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_2();
}

@end
