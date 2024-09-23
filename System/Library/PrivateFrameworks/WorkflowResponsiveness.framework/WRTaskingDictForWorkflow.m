@implementation WRTaskingDictForWorkflow

void __WRTaskingDictForWorkflow_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t i;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  char v20;
  id v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  int v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t k;
  void *v37;
  char v38;
  id v39;
  int v40;
  NSObject *v41;
  id v42;
  void *v43;
  id v44;
  void *v45;
  const __CFString *v46;
  uint64_t v47;
  void *v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  id obj;
  id v57;
  id v58;
  void *v59;
  uint64_t v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  char v65;
  _BYTE v66[15];
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _QWORD v71[5];
  id v72;
  _QWORD v73[4];
  id v74;
  id v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  char v80;
  _BYTE v81[15];
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  _BYTE v86[128];
  _BYTE v87[128];
  _BYTE v88[128];
  _BYTE v89[128];
  uint64_t v90;

  v90 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("signposts")))
  {
    v46 = CFSTR("signposts");
    v47 = a1;
    v49 = v6;
    v50 = v5;
    v8 = *(void **)(a1 + 48);
    v9 = v6;
    v48 = v7;
    v52 = v7;
    v51 = v8;
    v53 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v82 = 0u;
    v83 = 0u;
    v84 = 0u;
    v85 = 0u;
    obj = v9;
    v55 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v89, 16);
    if (v55)
    {
      v54 = *(_QWORD *)v83;
      do
      {
        for (i = 0; i != v55; ++i)
        {
          if (*(_QWORD *)v83 != v54)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * i);
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("name"), v46);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            v59 = v11;
            v57 = objc_alloc_init(MEMORY[0x24BDBCED8]);
            v76 = 0u;
            v77 = 0u;
            v78 = 0u;
            v79 = 0u;
            v13 = v52;
            v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v76, v88, 16);
            if (v14)
            {
              v15 = v14;
              v16 = *(_QWORD *)v77;
LABEL_10:
              v17 = 0;
              while (1)
              {
                if (*(_QWORD *)v77 != v16)
                  objc_enumerationMutation(v13);
                v18 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * v17);
                objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("name"));
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                v20 = objc_msgSend(v19, "isEqualToString:", v12);

                if ((v20 & 1) != 0)
                  break;
                if (v15 == ++v17)
                {
                  v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v76, v88, 16);
                  if (v15)
                    goto LABEL_10;
                  goto LABEL_16;
                }
              }
              v21 = v18;

              if (v21)
                goto LABEL_19;
            }
            else
            {
LABEL_16:

            }
            objc_msgSend(v51, "addObject:", v12);
            v21 = 0;
LABEL_19:
            v22 = MEMORY[0x24BDAC760];
            v73[0] = MEMORY[0x24BDAC760];
            v73[1] = 3221225472;
            v73[2] = ___WRTaskingFilteredSignposts_block_invoke;
            v73[3] = &unk_251BE45D0;
            v23 = v21;
            v74 = v23;
            v24 = v57;
            v75 = v24;
            objc_msgSend(v59, "enumerateKeysAndObjectsUsingBlock:", v73);
            v71[0] = v22;
            v71[1] = 3221225472;
            v71[2] = ___WRTaskingFilteredSignposts_block_invoke_2;
            v71[3] = &unk_251BE45D0;
            v71[4] = v59;
            v25 = v24;
            v72 = v25;
            objc_msgSend(v23, "enumerateKeysAndObjectsUsingBlock:", v71);
            if (objc_msgSend(v25, "count"))
            {
              objc_msgSend(v25, "setObject:forKeyedSubscript:", v12, CFSTR("name"));
              objc_msgSend(v53, "addObject:", v25);
            }

          }
          else
          {
            v26 = *__error();
            _wrlog();
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
              __WRTaskingDictForWorkflow_block_invoke_cold_1(&v80, v81);

            *__error() = v26;
          }

        }
        v55 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v89, 16);
      }
      while (v55);
    }

    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    v58 = v52;
    v28 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v67, v87, 16);
    if (v28)
    {
      v29 = v28;
      v60 = *(_QWORD *)v68;
      do
      {
        for (j = 0; j != v29; ++j)
        {
          if (*(_QWORD *)v68 != v60)
            objc_enumerationMutation(v58);
          objc_msgSend(*(id *)(*((_QWORD *)&v67 + 1) + 8 * j), "objectForKeyedSubscript:", CFSTR("name"), v46);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          if (v31)
          {
            v63 = 0u;
            v64 = 0u;
            v61 = 0u;
            v62 = 0u;
            v32 = obj;
            v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v61, v86, 16);
            if (v33)
            {
              v34 = v33;
              v35 = *(_QWORD *)v62;
              while (2)
              {
                for (k = 0; k != v34; ++k)
                {
                  if (*(_QWORD *)v62 != v35)
                    objc_enumerationMutation(v32);
                  objc_msgSend(*(id *)(*((_QWORD *)&v61 + 1) + 8 * k), "objectForKeyedSubscript:", CFSTR("name"));
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  v38 = objc_msgSend(v37, "isEqualToString:", v31);

                  if ((v38 & 1) != 0)
                  {

                    goto LABEL_46;
                  }
                }
                v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v61, v86, 16);
                if (v34)
                  continue;
                break;
              }
            }

            v39 = objc_alloc_init(MEMORY[0x24BDBCED8]);
            objc_msgSend(v39, "setObject:forKeyedSubscript:", v31, CFSTR("name"));
            objc_msgSend(v39, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], 0x251BE5AE8);
            objc_msgSend(v53, "addObject:", v39);

          }
          else
          {
            v40 = *__error();
            _wrlog();
            v41 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT))
              __WRTaskingDictForWorkflow_block_invoke_cold_1(&v65, v66);

            *__error() = v40;
          }
LABEL_46:

        }
        v29 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v67, v87, 16);
      }
      while (v29);
    }

    if (objc_msgSend(v53, "count"))
    {
      v42 = v53;
      v43 = v53;
      v44 = v42;
    }
    else
    {
      v43 = v53;
      v44 = 0;
    }
    v6 = v49;
    v5 = v50;
    v7 = v48;

    objc_msgSend(*(id *)(v47 + 40), "setObject:forKeyedSubscript:", v44, v46);
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("diagnostics")))
  {
    _WRTaskingFilteredDiagnostics(v6, v7);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v45, CFSTR("diagnostics"));

  }
  else if (!v7 || (objc_msgSend(v6, "isEqual:", v7) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v6, v5);
  }

}

void __WRTaskingDictForWorkflow_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  const __CFString *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (const __CFString *)&unk_251BE8BC0;
LABEL_8:
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v7, v8);
      goto LABEL_9;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = &stru_251BE5608;
      goto LABEL_8;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (const __CFString *)MEMORY[0x24BDBD1A8];
      goto LABEL_8;
    }
  }
LABEL_9:

}

void __WRTaskingDictForWorkflow_block_invoke_25(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  id obj;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("signposts")))
  {
    v22 = v5;
    v7 = *(void **)(a1 + 40);
    v8 = *(id *)(a1 + 32);
    v21 = v6;
    v9 = v6;
    v10 = v7;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    obj = v9;
    v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v30 != v13)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("name"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          WRTaskingKeyBaseForSignpost(v10, v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v24[0] = MEMORY[0x24BDAC760];
          v24[1] = 3221225472;
          v24[2] = ___WRTaskingDictAddSignposts_block_invoke;
          v24[3] = &unk_251BE4AF8;
          v25 = v8;
          v26 = v10;
          v27 = v16;
          v28 = v17;
          v18 = v17;
          v19 = v16;
          objc_msgSend(v15, "enumerateKeysAndObjectsUsingBlock:", v24);

        }
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v12);
    }

    v6 = v21;
    v5 = v22;
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("diagnostics")))
  {
    _WRTaskingDictAddDiagnostics(*(void **)(a1 + 32), v6, *(void **)(a1 + 40), 0);
  }
  else if (!objc_msgSend(v5, "isEqualToString:", CFSTR("name"))
         || (objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%@%@"), *(_QWORD *)(a1 + 48), v5);
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v20);

  }
}

void __WRTaskingDictForWorkflow_block_invoke_cold_1(_BYTE *a1, _BYTE *a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_1_0(a1, a2);
  OUTLINED_FUNCTION_0_1(&dword_24A5B4000, v2, v3, "nil signpost name", v4);
}

@end
