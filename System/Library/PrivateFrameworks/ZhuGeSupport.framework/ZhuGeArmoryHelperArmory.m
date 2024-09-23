@implementation ZhuGeArmoryHelperArmory

- (id)unionizeRawConfig:(id)a3 withError:(id *)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  unint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t i;
  uint64_t v43;
  void *v44;
  char v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v50;
  void *v51;
  id *v52;
  id v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v9 = v5;
  if (!a4)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[ZhuGeArmoryHelperArmory unionizeRawConfig:withError:]", 32, CFSTR("error p-pointer is nil!"), v6, v7, v8, v50);
    v10 = 0;
    v15 = 0;
    goto LABEL_34;
  }
  *a4 = 0;
  if (!v5)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[ZhuGeArmoryHelperArmory unionizeRawConfig:withError:]", 38, CFSTR("rawConfig pointer is nil!"), v6, v7, v8, v50);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 45, 0);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    goto LABEL_7;
  }
  getZhuGeOS();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("UNKNOWN_OS")))
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[ZhuGeArmoryHelperArmory unionizeRawConfig:withError:]", 45, CFSTR("ZhuGe is runing on an unknown OS!"), v11, v12, v13, v50);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 39, 0);
    v14 = (id)objc_claimAutoreleasedReturnValue();
LABEL_7:
    v15 = 0;
    *a4 = v14;
    goto LABEL_34;
  }
  v52 = a4;
  v16 = 0x24BDBC000uLL;
  v15 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v17 = v9;
  v56 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
  if (!v56)
    goto LABEL_33;
  v54 = v10;
  v55 = *(_QWORD *)v62;
  v51 = v9;
  v53 = v17;
  while (2)
  {
    v18 = 0;
    v19 = v55;
    do
    {
      if (*(_QWORD *)v62 != v19)
        objc_enumerationMutation(v17);
      v20 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * v18);
      objc_msgSend(v17, "objectForKeyedSubscript:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectForKeyedSubscript:", v10);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v22)
      {
        ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[ZhuGeArmoryHelperArmory unionizeRawConfig:withError:]", 55, CFSTR("Key \"%@\" isn't supported in %@!"), v23, v24, v25, v20);
        v48 = 40;
LABEL_32:
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", v48, 0);
        v9 = v51;
        *v52 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_33;
      }
      objc_msgSend(v15, "objectForKeyedSubscript:", v20);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v26)
      {
        ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[ZhuGeArmoryHelperArmory unionizeRawConfig:withError:]", 61, CFSTR("Key \"%@\" is repeated in %@!"), v27, v28, v29, v20);
        v48 = 28;
        goto LABEL_32;
      }
      v30 = *(void **)(v16 + 3800);
      objc_msgSend(v17, "objectForKeyedSubscript:", v20);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "objectForKeyedSubscript:", v10);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "dictionaryWithDictionary:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v33, v20);

      if (isZhuGeInRestoreOS())
      {
        objc_msgSend(v17, "objectForKeyedSubscript:", v20);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("RESTOREOS"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        if (v35)
        {
          objc_msgSend(v17, "objectForKeyedSubscript:", v20);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("RESTOREOS"));
          v37 = (void *)objc_claimAutoreleasedReturnValue();

          v59 = 0u;
          v60 = 0u;
          v57 = 0u;
          v58 = 0u;
          v38 = v37;
          v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
          if (v39)
          {
            v40 = v39;
            v41 = *(_QWORD *)v58;
            do
            {
              for (i = 0; i != v40; ++i)
              {
                if (*(_QWORD *)v58 != v41)
                  objc_enumerationMutation(v38);
                v43 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * i);
                objc_msgSend(v38, "objectForKeyedSubscript:", v43);
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                v45 = isObjectNSStringAndZhuGeNull(v44);

                if ((v45 & 1) == 0)
                {
                  objc_msgSend(v38, "objectForKeyedSubscript:", v43);
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v15, "objectForKeyedSubscript:", v20);
                  v47 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v47, "setObject:forKeyedSubscript:", v46, v43);

                }
              }
              v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
            }
            while (v40);
          }

          v17 = v53;
          v10 = v54;
          v16 = 0x24BDBC000;
          v19 = v55;
        }
      }
      ++v18;
    }
    while (v18 != v56);
    v9 = v51;
    v56 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
    if (v56)
      continue;
    break;
  }
LABEL_33:

LABEL_34:
  return v15;
}

- (id)sortAliasFromUnionizedConfig:(id)a3 withError:(id *)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  char isKindOfClass;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  id *v51;
  void *v52;
  uint64_t v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v9 = v5;
  if (!a4)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[ZhuGeArmoryHelperArmory sortAliasFromUnionizedConfig:withError:]", 100, CFSTR("error p-pointer is nil!"), v6, v7, v8, v48);
    v10 = 0;
LABEL_33:
    v42 = 0;
    goto LABEL_34;
  }
  *a4 = 0;
  if (!v5)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[ZhuGeArmoryHelperArmory sortAliasFromUnionizedConfig:withError:]", 106, CFSTR("unionizedConfig pointer is nil!"), v6, v7, v8, v48);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 45, 0);
    v10 = 0;
    v42 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_34;
  }
  v10 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v11 = v9;
  v53 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
  if (!v53)
    goto LABEL_24;
  v12 = *(_QWORD *)v59;
  v51 = a4;
  v52 = v9;
  do
  {
    v13 = 0;
    v14 = v53;
    do
    {
      if (*(_QWORD *)v59 != v12)
        objc_enumerationMutation(v11);
      v15 = *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * v13);
      objc_msgSend(v11, "objectForKeyedSubscript:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("ALIAS"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v17)
        goto LABEL_22;
      objc_msgSend(v11, "objectForKeyedSubscript:", v15);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("ALIAS"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = isObjectNSStringAndZhuGeNull(v19);

      if ((v20 & 1) != 0)
        goto LABEL_22;
      objc_msgSend(v11, "objectForKeyedSubscript:", v15);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("ALIAS"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
        ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[ZhuGeArmoryHelperArmory sortAliasFromUnionizedConfig:withError:]", 123, CFSTR("Alias of key \"%@\" is not an array"), v24, v25, v26, v15);
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 9, 0);
        *v51 = (id)objc_claimAutoreleasedReturnValue();
LABEL_32:
        v9 = v52;

        goto LABEL_33;
      }
      v56 = 0u;
      v57 = 0u;
      v54 = 0u;
      v55 = 0u;
      objc_msgSend(v11, "objectForKeyedSubscript:", v15);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("ALIAS"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
      if (!v29)
        goto LABEL_21;
      v30 = v29;
      v31 = *(_QWORD *)v55;
      v50 = v12;
      while (2)
      {
        for (i = 0; i != v30; ++i)
        {
          if (*(_QWORD *)v55 != v31)
            objc_enumerationMutation(v28);
          v33 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[ZhuGeArmoryHelperArmory sortAliasFromUnionizedConfig:withError:]", 131, CFSTR("Key \"%@\" contains non-string alias"), v34, v35, v36, v15);
            v43 = 9;
LABEL_31:
            objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", v43, 0);
            *v51 = (id)objc_claimAutoreleasedReturnValue();

            goto LABEL_32;
          }
          objc_msgSend(v11, "objectForKeyedSubscript:", v33);
          v37 = (void *)objc_claimAutoreleasedReturnValue();

          if (v37)
          {
            ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[ZhuGeArmoryHelperArmory sortAliasFromUnionizedConfig:withError:]", 137, CFSTR("Alias \"%@\" is duplicated with keys!"), v38, v39, v40, v33);
LABEL_30:
            v43 = 28;
            goto LABEL_31;
          }
          objc_msgSend(v10, "objectForKeyedSubscript:", v33);
          v41 = (void *)objc_claimAutoreleasedReturnValue();

          if (v41)
          {
            objc_msgSend(v10, "objectForKeyedSubscript:", v33);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[ZhuGeArmoryHelperArmory sortAliasFromUnionizedConfig:withError:]", 143, CFSTR("Alias \"%@\" is duplicated in keys of \"%@\" and \"%@\"!"), v44, v45, v46, v33);

            goto LABEL_30;
          }
          objc_msgSend(v10, "setObject:forKeyedSubscript:", v15, v33);
        }
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
        v12 = v50;
        if (v30)
          continue;
        break;
      }
LABEL_21:

      v14 = v53;
LABEL_22:
      ++v13;
    }
    while (v13 != v14);
    v9 = v52;
    v53 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
  }
  while (v53);
LABEL_24:

  v10 = v10;
  v42 = v10;
LABEL_34:

  return v42;
}

- (id)pickFlexibleFromUnionizedConfig:(id)a3 withError:(id *)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  char isKindOfClass;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v28;
  id *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v9 = v5;
  if (a4)
  {
    *a4 = 0;
    if (v5)
    {
      v29 = a4;
      v10 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v31 = 0u;
      v32 = 0u;
      v33 = 0u;
      v34 = 0u;
      v30 = v9;
      v11 = v9;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v32;
        while (2)
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v32 != v14)
              objc_enumerationMutation(v11);
            v16 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
            objc_msgSend(v11, "objectForKeyedSubscript:", v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("FLEXIBLE_PATTERN"));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = isObjectNilOrZhuGeNull(v18);

            if ((v19 & 1) == 0)
            {
              objc_msgSend(v11, "objectForKeyedSubscript:", v16);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("FLEXIBLE_PATTERN"));
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              isKindOfClass = objc_opt_isKindOfClass();

              if ((isKindOfClass & 1) == 0)
              {
                ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[ZhuGeArmoryHelperArmory pickFlexibleFromUnionizedConfig:withError:]", 185, CFSTR("Alias of key \"%@\" is not an string!"), v23, v24, v25, v16);
                objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 9, 0);
                *v29 = (id)objc_claimAutoreleasedReturnValue();

                v26 = 0;
                goto LABEL_17;
              }
              objc_msgSend(v10, "addObject:", v16);
            }
          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
          if (v13)
            continue;
          break;
        }
      }

      v26 = v10;
      v10 = v26;
LABEL_17:
      v9 = v30;
    }
    else
    {
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[ZhuGeArmoryHelperArmory pickFlexibleFromUnionizedConfig:withError:]", 171, CFSTR("unionizedConfig pointer is nil!"), v6, v7, v8, v28);
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 45, 0);
      v26 = 0;
      v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[ZhuGeArmoryHelperArmory pickFlexibleFromUnionizedConfig:withError:]", 165, CFSTR("error p-pointer is nil!"), v6, v7, v8, v28);
    v26 = 0;
    v10 = 0;
  }

  return v26;
}

- (id)propertiesOfKey:(id)a3 withError:(id *)a4
{
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t i;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  int v64;
  id v65;
  unint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  id *v77;
  id obj;
  void *v79;
  ZhuGeArmoryHelperArmory *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  id v84;
  uint64_t v85;
  void *v86;
  void *v87;
  void *v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  void *v92;
  void *v93;
  id v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  _QWORD v107[4];
  _QWORD v108[4];
  _BYTE v109[128];
  _QWORD v110[2];
  _BYTE v111[128];
  _QWORD v112[2];
  _BYTE v113[128];
  _QWORD v114[4];
  _QWORD v115[4];
  _QWORD v116[4];
  _QWORD v117[7];

  v117[4] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v10 = v6;
  if (a4)
  {
    *a4 = 0;
    if (v6)
    {
      -[ZhuGeArmoryHelperArmory keysConfig](self, "keysConfig");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        v117[0] = v10;
        v116[0] = CFSTR("p_primarykey");
        v116[1] = CFSTR("p_config");
        -[ZhuGeArmoryHelperArmory keysConfig](self, "keysConfig");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", v10);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v117[1] = v14;
        v117[2] = MEMORY[0x24BDBD1C0];
        v116[2] = CFSTR("p_is_alias");
        v116[3] = CFSTR("p_subkey");
        v117[3] = CFSTR("ZHUGE_NULL");
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v117, v116, 4);
        v15 = objc_claimAutoreleasedReturnValue();

        v16 = (void *)v15;
LABEL_9:
        v17 = 0;
        v18 = 0;
        v19 = 0;
        v20 = 0;
        goto LABEL_10;
      }
      -[ZhuGeArmoryHelperArmory aliasesMap](self, "aliasesMap");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "objectForKeyedSubscript:", v10);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        v114[0] = CFSTR("p_primarykey");
        -[ZhuGeArmoryHelperArmory aliasesMap](self, "aliasesMap");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "objectForKeyedSubscript:", v10);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v115[0] = v25;
        v114[1] = CFSTR("p_config");
        -[ZhuGeArmoryHelperArmory keysConfig](self, "keysConfig");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[ZhuGeArmoryHelperArmory aliasesMap](self, "aliasesMap");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "objectForKeyedSubscript:", v10);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "objectForKeyedSubscript:", v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v115[1] = v29;
        v115[2] = MEMORY[0x24BDBD1C8];
        v114[2] = CFSTR("p_is_alias");
        v114[3] = CFSTR("p_subkey");
        v115[3] = CFSTR("ZHUGE_NULL");
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v115, v114, 4);
        v30 = objc_claimAutoreleasedReturnValue();

        v16 = (void *)v30;
        goto LABEL_9;
      }
      v77 = a4;
      v105 = 0u;
      v106 = 0u;
      v103 = 0u;
      v104 = 0u;
      -[ZhuGeArmoryHelperArmory flexibleList](self, "flexibleList");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v82 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v103, v113, 16);
      if (v82)
      {
        v84 = 0;
        v18 = 0;
        v19 = 0;
        v20 = 0;
        v79 = 0;
        v80 = self;
        v81 = *(_QWORD *)v104;
        v88 = v10;
        while (2)
        {
          v33 = 0;
          do
          {
            v86 = v18;
            v92 = v19;
            if (*(_QWORD *)v104 != v81)
              objc_enumerationMutation(obj);
            v85 = v33;
            v34 = *(_QWORD *)(*((_QWORD *)&v103 + 1) + 8 * v33);
            -[ZhuGeArmoryHelperArmory keysConfig](self, "keysConfig");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "objectForKeyedSubscript:", v34);
            v36 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("FLEXIBLE_PATTERN"));
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = objc_alloc_init(MEMORY[0x24BDBCED8]);

            v112[0] = MEMORY[0x24BDBD1C0];
            objc_msgSend(MEMORY[0x24BDD1798], "escapedPatternForString:", v34);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "stringByReplacingOccurrencesOfString:withString:", CFSTR("$superkey"), v39);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v112[1] = v40;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v112, 2);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v83 = v34;
            objc_msgSend(v38, "setObject:forKeyedSubscript:", v41, v34);

            v87 = v36;
            objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("ALIAS"));
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v99 = 0u;
            v100 = 0u;
            v101 = 0u;
            v102 = 0u;
            v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v99, v111, 16);
            if (v43)
            {
              v44 = v43;
              v45 = *(_QWORD *)v100;
              do
              {
                for (i = 0; i != v44; ++i)
                {
                  if (*(_QWORD *)v100 != v45)
                    objc_enumerationMutation(v42);
                  v47 = *(_QWORD *)(*((_QWORD *)&v99 + 1) + 8 * i);
                  v110[0] = MEMORY[0x24BDBD1C8];
                  objc_msgSend(MEMORY[0x24BDD1798], "escapedPatternForString:", v47);
                  v48 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v37, "stringByReplacingOccurrencesOfString:withString:", CFSTR("$superkey"), v48);
                  v49 = (void *)objc_claimAutoreleasedReturnValue();
                  v110[1] = v49;
                  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v110, 2);
                  v50 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v38, "setObject:forKeyedSubscript:", v50, v47);

                }
                v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v99, v111, 16);
              }
              while (v44);
            }
            v97 = 0u;
            v98 = 0u;
            v95 = 0u;
            v96 = 0u;
            v20 = v38;
            v90 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v95, v109, 16);
            if (v90)
            {
              v89 = *(_QWORD *)v96;
              v51 = v86;
              v19 = v92;
              v91 = v20;
LABEL_25:
              v52 = 0;
              v53 = v84;
              v54 = v19;
              while (1)
              {
                v93 = v51;
                if (*(_QWORD *)v96 != v89)
                  objc_enumerationMutation(v20);
                v55 = *(_QWORD *)(*((_QWORD *)&v95 + 1) + 8 * v52);
                v56 = (void *)MEMORY[0x24BDD1798];
                objc_msgSend(v20, "objectForKeyedSubscript:", v55);
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v57, "objectAtIndexedSubscript:", 1);
                v58 = (void *)objc_claimAutoreleasedReturnValue();
                v94 = v53;
                objc_msgSend(v56, "regularExpressionWithPattern:options:error:", v58, 0, &v94);
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                v59 = v94;

                if (!v19)
                {
                  ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[ZhuGeArmoryHelperArmory propertiesOfKey:withError:]", 281, CFSTR("Creating regEx failed for checking flexible key \"%@\"!"), v60, v61, v62, v55);
                  v84 = v59;
                  objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 4, v59);
                  v64 = 0;
                  *v77 = (id)objc_claimAutoreleasedReturnValue();
                  v20 = v91;
                  v18 = v93;
LABEL_35:
                  v10 = v88;
                  goto LABEL_40;
                }
                v10 = v88;
                objc_msgSend(v19, "firstMatchInString:options:range:", v88, 0, 0, objc_msgSend(v88, "length"));
                v18 = (void *)objc_claimAutoreleasedReturnValue();

                if (v18)
                  break;
                v51 = 0;
                ++v52;
                v53 = v59;
                v54 = v19;
                v20 = v91;
                if (v90 == v52)
                {
                  v84 = v59;
                  v63 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v95, v109, 16);
                  v51 = 0;
                  v64 = 1;
                  v90 = v63;
                  if (v63)
                    goto LABEL_25;
                  v18 = 0;
                  goto LABEL_35;
                }
              }
              v84 = v59;
              v65 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
              if ((unint64_t)objc_msgSend(v18, "numberOfRanges") >= 2)
              {
                v66 = 1;
                do
                {
                  v67 = objc_msgSend(v18, "rangeAtIndex:", v66);
                  objc_msgSend(v88, "substringWithRange:", v67, v68);
                  v69 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v65, "addObject:", v69);

                  ++v66;
                }
                while (objc_msgSend(v18, "numberOfRanges") > v66);
              }
              v107[0] = CFSTR("p_primarykey");
              v107[1] = CFSTR("p_config");
              v108[0] = v83;
              v108[1] = v87;
              v107[2] = CFSTR("p_is_alias");
              objc_msgSend(v91, "objectForKeyedSubscript:", v55);
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v70, "objectAtIndexedSubscript:", 0);
              v71 = (void *)objc_claimAutoreleasedReturnValue();
              v107[3] = CFSTR("p_subkey");
              v108[2] = v71;
              v108[3] = v65;
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v108, v107, 4);
              v72 = objc_claimAutoreleasedReturnValue();

              v64 = 0;
              v79 = (void *)v72;
              v20 = v91;
            }
            else
            {
              v64 = 1;
              v10 = v88;
              v19 = v92;
              v18 = v86;
            }
LABEL_40:

            if (!v64)
            {

              goto LABEL_47;
            }
            v33 = v85 + 1;
            self = v80;
          }
          while (v85 + 1 != v82);
          v82 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v103, v113, 16);
          if (v82)
            continue;
          break;
        }
      }
      else
      {
        v84 = 0;
        v18 = 0;
        v19 = 0;
        v20 = 0;
        v79 = 0;
      }

      ZhuGeLog(262656, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[ZhuGeArmoryHelperArmory propertiesOfKey:withError:]", 304, CFSTR("Key \"%@\" may need further check"), v73, v74, v75, (uint64_t)v10);
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 73, 0);
      *v77 = (id)objc_claimAutoreleasedReturnValue();
LABEL_47:
      v16 = v79;
      v17 = v84;
    }
    else
    {
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[ZhuGeArmoryHelperArmory propertiesOfKey:withError:]", 223, CFSTR("key pointer is nil!"), v7, v8, v9, v76);
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 45, 0);
      v21 = (id)objc_claimAutoreleasedReturnValue();
      v17 = 0;
      v18 = 0;
      v19 = 0;
      v20 = 0;
      v16 = 0;
      *a4 = v21;
    }
  }
  else
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[ZhuGeArmoryHelperArmory propertiesOfKey:withError:]", 217, CFSTR("error p-pointer is nil!"), v7, v8, v9, v76);
    v17 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v16 = 0;
  }
LABEL_10:
  v31 = v16;

  return v31;
}

- (id)propertiesByKey:(id)a3 andSuperKeyRange:(_NSRange)a4 withError:(id *)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  id v42;
  id v43;

  length = a4.length;
  location = a4.location;
  v9 = a3;
  v13 = v9;
  if (a5)
  {
    *a5 = 0;
    if (v9)
    {
      if (objc_msgSend(v9, "length") >= location + length)
      {
        objc_msgSend(v13, "substringWithRange:", location, length);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = 0;
        getObfuscatedString(v24, &v43);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v43;
        if (v25)
        {
          objc_msgSend(v13, "stringByReplacingOccurrencesOfString:withString:options:range:", v24, v25, 0, location, length);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = v33;
          -[ZhuGeArmoryHelperArmory propertiesOfKey:withError:](self, "propertiesOfKey:withError:", v25, &v42);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = v42;

          if (v23)
          {
            objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v23);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "setObject:forKeyedSubscript:", v26, CFSTR("p_obfuscated_key"));
            ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[ZhuGeArmoryHelperArmory propertiesByKey:andSuperKeyRange:withError:]", 365, CFSTR("Got properties after obfuscating \"%@\" for key \"%@\"), v37, v38, v39, (uint64_t)v24);
            goto LABEL_10;
          }
          ZhuGeLog(262656, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[ZhuGeArmoryHelperArmory propertiesByKey:andSuperKeyRange:withError:]", 358, CFSTR("Didn't get properties after obfuscating \"%@\" for key \"%@\"), v34, v35, v36, (uint64_t)v24);
          v27 = objc_retainAutorelease(v22);
          v22 = v27;
          v21 = 0;
          goto LABEL_9;
        }
        ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[ZhuGeArmoryHelperArmory propertiesByKey:andSuperKeyRange:withError:]", 345, CFSTR("Failed to obfuacate super key of \"%@\" in range<%zu, %zu>!"), v30, v31, v32, (uint64_t)v13);
        v27 = objc_retainAutorelease(v33);
        v22 = v27;
        v21 = 0;
        v23 = 0;
LABEL_8:
        v26 = 0;
LABEL_9:
        *a5 = v27;
        goto LABEL_10;
      }
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v13, "length"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", location);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", length);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[ZhuGeArmoryHelperArmory propertiesByKey:andSuperKeyRange:withError:]", 335, CFSTR("key length is %@, but super key range is {%@, %@}!"), v16, v17, v18, (uint64_t)v14);

      v19 = (void *)MEMORY[0x24BDD1540];
      v20 = 65;
    }
    else
    {
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[ZhuGeArmoryHelperArmory propertiesByKey:andSuperKeyRange:withError:]", 329, CFSTR("key pointer is nil!"), v10, v11, v12, v40);
      v19 = (void *)MEMORY[0x24BDD1540];
      v20 = 45;
    }
    objc_msgSend(v19, "errorWithZhuGeErrorCode:underlyingError:", v20, 0);
    v27 = (id)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    v22 = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    goto LABEL_8;
  }
  ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[ZhuGeArmoryHelperArmory propertiesByKey:andSuperKeyRange:withError:]", 323, CFSTR("error p-pointer is nil!"), v10, v11, v12, v40);
  v21 = 0;
  v22 = 0;
  v23 = 0;
  v24 = 0;
  v25 = 0;
  v26 = 0;
LABEL_10:
  v28 = v21;

  return v28;
}

- (id)getPropertiesOfKey:(id)a3 withError:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  ZhuGeCacheArmory *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const __CFString *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  const __CFString *v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t i;
  void *v58;
  void *v59;
  uint64_t j;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  void *v71;
  uint64_t v72;
  id v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  id v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  id *v88;
  void *v89;
  void *v90;
  id v91;
  void *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  id obj;
  id obja;
  ZhuGeArmoryHelperArmory *v98;
  id v99;
  id v100;
  id v101;
  id v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  id v115;
  id v116;
  _BYTE v117[128];
  _BYTE v118[128];
  _BYTE v119[128];
  uint64_t v120;

  v120 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v10 = v6;
  if (!a4)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[ZhuGeArmoryHelperArmory getPropertiesOfKey:withError:]", 380, CFSTR("error p-pointer is nil!"), v7, v8, v9, v87);
    v18 = 0;
    v19 = 0;
    v20 = 0;
LABEL_8:
    v14 = 0;
    goto LABEL_11;
  }
  *a4 = 0;
  if (!v6)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[ZhuGeArmoryHelperArmory getPropertiesOfKey:withError:]", 386, CFSTR("key pointer is nil!"), v7, v8, v9, v87);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 45, 0);
    v21 = (id)objc_claimAutoreleasedReturnValue();
    v18 = 0;
LABEL_10:
    v19 = 0;
    v20 = 0;
    v14 = 0;
    *a4 = v21;
    goto LABEL_11;
  }
  -[ZhuGeArmoryHelperArmory propertiesCache](self, "propertiesCache");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v12 = -[ZhuGeCacheArmory initWithName:andCapacity:andCacheType:]([ZhuGeCacheArmory alloc], "initWithName:andCapacity:andCacheType:", CFSTR("gPOK"), &unk_251C47BD8, objc_opt_class());
    -[ZhuGeArmoryHelperArmory setPropertiesCache:](self, "setPropertiesCache:", v12);

  }
  -[ZhuGeArmoryHelperArmory propertiesCache](self, "propertiesCache");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "getCacheForKey:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[ZhuGeArmoryHelperArmory getPropertiesOfKey:withError:]", 400, CFSTR("Hit cached properties for real key: \"%@\"), v15, v16, v17, (uint64_t)v10);
    v18 = 0;
    v19 = 0;
    v20 = 0;
    goto LABEL_11;
  }
  v116 = 0;
  -[ZhuGeArmoryHelperArmory propertiesOfKey:withError:](self, "propertiesOfKey:withError:", v10, &v116);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v116;
  v28 = v24;
  v98 = self;
  if (v14)
  {
    v19 = 0;
    v20 = 0;
LABEL_14:
    ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[ZhuGeArmoryHelperArmory getPropertiesOfKey:withError:]", 535, CFSTR("Caching properties for key: \"%@\"), v25, v26, v27, (uint64_t)v10);
    -[ZhuGeArmoryHelperArmory propertiesCache](v98, "propertiesCache");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v99 = v28;
    v30 = objc_msgSend(v29, "setCache:forKey:withError:", v14, v10, &v99);
    v18 = v99;

    if ((v30 & 1) != 0)
      goto LABEL_11;
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[ZhuGeArmoryHelperArmory getPropertiesOfKey:withError:]", 538, CFSTR("Failed to cache properties for key \"%@\"!"), v31, v32, v33, (uint64_t)v10);
    v18 = objc_retainAutorelease(v18);
    *a4 = v18;

    goto LABEL_8;
  }
  if (objc_msgSend(v24, "code") != 73)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[ZhuGeArmoryHelperArmory getPropertiesOfKey:withError:]", 410, CFSTR("Failed to get properties for key \"%@\" itself!"), v34, v35, v36, (uint64_t)v10);
    v38 = v28;
LABEL_20:
    v21 = objc_retainAutorelease(v38);
    v18 = v21;
    goto LABEL_10;
  }
  v115 = v28;
  -[ZhuGeArmoryHelperArmory propertiesByKey:andSuperKeyRange:withError:](self, "propertiesByKey:andSuperKeyRange:withError:", v10, 0, objc_msgSend(v10, "length"), &v115);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v115;

  if (v14)
  {
    v19 = 0;
    v20 = 0;
    v28 = v37;
    goto LABEL_14;
  }
  if (objc_msgSend(v37, "code") != 73)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[ZhuGeArmoryHelperArmory getPropertiesOfKey:withError:]", 423, CFSTR("Failed to get properties for key \"%@\" in overall range!"), v39, v40, v41, (uint64_t)v10);
    v38 = v37;
    goto LABEL_20;
  }
  v91 = v37;
  v88 = a4;
  v89 = v10;
  v20 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v111 = 0u;
  v112 = 0u;
  v113 = 0u;
  v114 = 0u;
  -[ZhuGeArmoryHelperArmory flexibleList](self, "flexibleList");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v111, v119, 16);
  if (v42)
  {
    v43 = v42;
    v44 = *(_QWORD *)v112;
    v45 = CFSTR("ALIAS");
    do
    {
      v46 = 0;
      v94 = v43;
      do
      {
        if (*(_QWORD *)v112 != v44)
          objc_enumerationMutation(obj);
        v47 = *(_QWORD *)(*((_QWORD *)&v111 + 1) + 8 * v46);
        -[ZhuGeArmoryHelperArmory keysConfig](self, "keysConfig");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "objectForKeyedSubscript:", v47);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "objectForKeyedSubscript:", v45);
        v50 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v20, "setObject:forKeyedSubscript:", v47, v47);
        if ((isObjectNilOrZhuGeNull(v50) & 1) == 0)
        {
          v51 = v44;
          v52 = v45;
          v109 = 0u;
          v110 = 0u;
          v107 = 0u;
          v108 = 0u;
          v53 = v50;
          v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v107, v118, 16);
          if (v54)
          {
            v55 = v54;
            v56 = *(_QWORD *)v108;
            do
            {
              for (i = 0; i != v55; ++i)
              {
                if (*(_QWORD *)v108 != v56)
                  objc_enumerationMutation(v53);
                objc_msgSend(v20, "setObject:forKeyedSubscript:", v47, *(_QWORD *)(*((_QWORD *)&v107 + 1) + 8 * i));
              }
              v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v107, v118, 16);
            }
            while (v55);
          }

          self = v98;
          v45 = v52;
          v44 = v51;
          v43 = v94;
        }

        ++v46;
      }
      while (v46 != v43);
      v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v111, v119, 16);
    }
    while (v43);
  }

  objc_msgSend(v20, "allKeys");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "sortedArrayUsingComparator:", &__block_literal_global_1);
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  v105 = 0u;
  v106 = 0u;
  v103 = 0u;
  v104 = 0u;
  v19 = v59;
  v95 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v103, v117, 16);
  if (!v95)
  {
    v10 = v89;
    v18 = v91;
    goto LABEL_60;
  }
  v93 = *(_QWORD *)v104;
  v10 = v89;
  v18 = v91;
  while (2)
  {
    for (j = 0; j != v95; ++j)
    {
      v61 = v18;
      if (*(_QWORD *)v104 != v93)
        objc_enumerationMutation(v19);
      v62 = *(void **)(*((_QWORD *)&v103 + 1) + 8 * j);
      objc_msgSend(v20, "objectForKeyedSubscript:", v62);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      -[ZhuGeArmoryHelperArmory keysConfig](v98, "keysConfig");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "objectForKeyedSubscript:", v63);
      obja = (id)objc_claimAutoreleasedReturnValue();

      v102 = v61;
      getElucidatedStringLen(v62, &v102);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = v102;

      if (!v65)
      {
        ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[ZhuGeArmoryHelperArmory getPropertiesOfKey:withError:]", 484, CFSTR("Failed to get length of flexible key \"%@\"!"), v67, v68, v69, (uint64_t)v62);
        v18 = objc_retainAutorelease(v66);
        *v88 = v18;
        goto LABEL_62;
      }
      v70 = objc_msgSend(v89, "length");
      if (v70 <= objc_msgSend(v65, "unsignedIntegerValue"))
      {
        v71 = 0;
LABEL_54:
        v18 = v66;
        goto LABEL_55;
      }
      objc_msgSend(obja, "objectForKeyedSubscript:", CFSTR("FLEXIBLE_PATTERN"));
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v71, "isEqualToString:", CFSTR("^(?:$superkey)(.+)$")))
      {
        v92 = v63;
        v72 = objc_msgSend(v65, "unsignedIntegerValue");
        v101 = v66;
        -[ZhuGeArmoryHelperArmory propertiesByKey:andSuperKeyRange:withError:](v98, "propertiesByKey:andSuperKeyRange:withError:", v89, 0, v72, &v101);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v73 = v101;

        if (!v14)
        {
          if (objc_msgSend(v73, "code") == 73)
          {
            v18 = v73;
            v63 = v92;
            goto LABEL_55;
          }
          ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[ZhuGeArmoryHelperArmory getPropertiesOfKey:withError:]", 503, CFSTR("Failed to get properties for key \"%@\" in MERMAID!"), v74, v75, v76, (uint64_t)v62);
          v18 = objc_retainAutorelease(v73);
          *v88 = v18;

          v63 = v92;
LABEL_62:

          goto LABEL_8;
        }
        v28 = v73;
LABEL_66:

        a4 = v88;
        goto LABEL_14;
      }
      if (!objc_msgSend(v71, "isEqualToString:", CFSTR("^(.+)(?:$superkey)$")))
        goto LABEL_54;
      v90 = v71;
      v92 = v63;
      v77 = objc_msgSend(v89, "length");
      v78 = v77 - objc_msgSend(v65, "unsignedIntegerValue");
      v79 = objc_msgSend(v65, "unsignedIntegerValue");
      v100 = v66;
      -[ZhuGeArmoryHelperArmory propertiesByKey:andSuperKeyRange:withError:](v98, "propertiesByKey:andSuperKeyRange:withError:", v89, v78, v79, &v100);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v80 = v100;

      if (v14)
      {
        v28 = v80;
        v71 = v90;
        goto LABEL_66;
      }
      v63 = v92;
      if (objc_msgSend(v80, "code") != 73)
      {
        ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[ZhuGeArmoryHelperArmory getPropertiesOfKey:withError:]", 519, CFSTR("Failed to get properties for key \"%@\" in TAUREN!"), v81, v82, v83, (uint64_t)v62);
        v18 = objc_retainAutorelease(v80);
        *v88 = v18;

        goto LABEL_62;
      }
      v18 = v80;
      v71 = v90;
LABEL_55:

    }
    v95 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v103, v117, 16);
    if (v95)
      continue;
    break;
  }
LABEL_60:

  ZhuGeLog(524800, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[ZhuGeArmoryHelperArmory getPropertiesOfKey:withError:]", 528, CFSTR("Key \"%@\" does not match any definition!"), v84, v85, v86, (uint64_t)v10);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 74, 0);
  v14 = 0;
  *v88 = (id)objc_claimAutoreleasedReturnValue();
LABEL_11:
  v22 = v14;

  return v22;
}

uint64_t __56__ZhuGeArmoryHelperArmory_getPropertiesOfKey_withError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  id v21;
  id v22;

  v4 = a2;
  v5 = a3;
  v22 = 0;
  getElucidatedStringLen(v4, &v22);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v22;
  v11 = v7;
  if (v6)
  {
    v21 = v7;
    getElucidatedStringLen(v5, &v21);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v21;

    if (v12)
    {
      v17 = objc_msgSend(v6, "unsignedIntegerValue");
      if (v17 <= objc_msgSend(v12, "unsignedIntegerValue"))
      {
        v19 = objc_msgSend(v6, "unsignedIntegerValue");
        v18 = v19 < objc_msgSend(v12, "unsignedIntegerValue");
      }
      else
      {
        v18 = -1;
      }
    }
    else
    {
      ZhuGeLog(262656, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[ZhuGeArmoryHelperArmory getPropertiesOfKey:withError:]_block_invoke", 458, CFSTR("Failed to get length for str2: %@, error: %@"), v14, v15, v16, (uint64_t)v5);
      v18 = 0;
    }
    v11 = v13;
  }
  else
  {
    ZhuGeLog(262656, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[ZhuGeArmoryHelperArmory getPropertiesOfKey:withError:]_block_invoke", 452, CFSTR("Failed to get length for str1: %@, error: %@"), v8, v9, v10, (uint64_t)v4);
    v18 = 0;
    v12 = 0;
  }

  return v18;
}

- (ZhuGeArmoryHelperArmory)initWithRawConfig:(id)a3
{
  id v4;
  ZhuGeArmoryHelperArmory *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  ZhuGeArmoryHelperArmory *v9;
  uint64_t v10;
  id v11;
  NSDictionary *keysConfig;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSDictionary *v16;
  uint64_t v17;
  id v18;
  NSDictionary *aliasesMap;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSDictionary *v23;
  uint64_t v24;
  NSArray *flexibleList;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v30;
  id v31;
  id v32;
  id v33;
  objc_super v34;

  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)ZhuGeArmoryHelperArmory;
  v5 = -[ZhuGeArmoryHelperArmory init](&v34, sel_init);
  v9 = v5;
  if (v5)
  {
    ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[ZhuGeArmoryHelperArmory initWithRawConfig:]", 562, CFSTR("Initialize config for ZhuGeArmoryHelper instance \"%@\"), v6, v7, v8, (uint64_t)v5);
    v33 = 0;
    -[ZhuGeArmoryHelperArmory unionizeRawConfig:withError:](v9, "unionizeRawConfig:withError:", v4, &v33);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v33;
    keysConfig = v9->_keysConfig;
    v9->_keysConfig = (NSDictionary *)v10;

    v16 = v9->_keysConfig;
    if (v16)
    {
      v32 = v11;
      -[ZhuGeArmoryHelperArmory sortAliasFromUnionizedConfig:withError:](v9, "sortAliasFromUnionizedConfig:withError:", v16, &v32);
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = v32;

      aliasesMap = v9->_aliasesMap;
      v9->_aliasesMap = (NSDictionary *)v17;

      if (v9->_aliasesMap)
      {
        v23 = v9->_keysConfig;
        v31 = v18;
        -[ZhuGeArmoryHelperArmory pickFlexibleFromUnionizedConfig:withError:](v9, "pickFlexibleFromUnionizedConfig:withError:", v23, &v31);
        v24 = objc_claimAutoreleasedReturnValue();
        v11 = v31;

        flexibleList = v9->_flexibleList;
        v9->_flexibleList = (NSArray *)v24;

        if (!v9->_flexibleList)
          ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[ZhuGeArmoryHelperArmory initWithRawConfig:]", 579, CFSTR("Failed to get flexible list from keys config, error %@"), v26, v27, v28, (uint64_t)v11);
      }
      else
      {
        ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[ZhuGeArmoryHelperArmory initWithRawConfig:]", 573, CFSTR("Failed to get aliases map from keys config, error %@"), v20, v21, v22, (uint64_t)v18);
        v11 = v18;
      }
    }
    else
    {
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[ZhuGeArmoryHelperArmory initWithRawConfig:]", 567, CFSTR("Failed to get keys config from raw config, error %@"), v13, v14, v15, (uint64_t)v11);
    }
  }
  else
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[ZhuGeArmoryHelperArmory initWithRawConfig:]", 558, CFSTR("Failed to initialize an instance for ZhuGeArmoryHelper!"), v6, v7, v8, v30);
    v11 = 0;
  }

  return v9;
}

- (id)getPrimarykeyOfKey:(id)a3 withError:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v22;
  id v23;

  v6 = a3;
  v10 = v6;
  if (a4)
  {
    *a4 = 0;
    if (!v6)
    {
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[ZhuGeArmoryHelperArmory getPrimarykeyOfKey:withError:]", 604, CFSTR("key pointer is nil!"), v7, v8, v9, v22);
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 45, 0);
      v20 = (id)objc_claimAutoreleasedReturnValue();
      v11 = 0;
      v19 = 0;
      v15 = 0;
      goto LABEL_9;
    }
    v23 = 0;
    -[ZhuGeArmoryHelperArmory getPropertiesOfKey:withError:](self, "getPropertiesOfKey:withError:", v6, &v23);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v23;
    if (!v11)
    {
      ZhuGeLog(263184, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[ZhuGeArmoryHelperArmory getPrimarykeyOfKey:withError:]", 612, CFSTR("Failed to get properties of \"%@\" for primary key!"), v12, v13, v14, (uint64_t)v10);
      v20 = objc_retainAutorelease(v15);
      v15 = v20;
      v19 = 0;
      goto LABEL_9;
    }
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("p_primarykey"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v19)
    {
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[ZhuGeArmoryHelperArmory getPrimarykeyOfKey:withError:]", 619, CFSTR("Unexpected nil primary key of key \"%@\"!"), v16, v17, v18, (uint64_t)v10);
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 45, 0);
      v20 = (id)objc_claimAutoreleasedReturnValue();
LABEL_9:
      *a4 = v20;
    }
  }
  else
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[ZhuGeArmoryHelperArmory getPrimarykeyOfKey:withError:]", 598, CFSTR("error p-pointer is nil!"), v7, v8, v9, v22);
    v11 = 0;
    v19 = 0;
    v15 = 0;
  }

  return v19;
}

- (id)getConfigOfKey:(id)a3 withError:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v22;
  id v23;

  v6 = a3;
  v10 = v6;
  if (a4)
  {
    *a4 = 0;
    if (!v6)
    {
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[ZhuGeArmoryHelperArmory getConfigOfKey:withError:]", 642, CFSTR("key pointer is nil!"), v7, v8, v9, v22);
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 45, 0);
      v20 = (id)objc_claimAutoreleasedReturnValue();
      v11 = 0;
      v19 = 0;
      v15 = 0;
      goto LABEL_9;
    }
    v23 = 0;
    -[ZhuGeArmoryHelperArmory getPropertiesOfKey:withError:](self, "getPropertiesOfKey:withError:", v6, &v23);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v23;
    if (!v11)
    {
      ZhuGeLog(263184, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[ZhuGeArmoryHelperArmory getConfigOfKey:withError:]", 650, CFSTR("Failed to get properties of \"%@\" for config!"), v12, v13, v14, (uint64_t)v10);
      v20 = objc_retainAutorelease(v15);
      v15 = v20;
      v19 = 0;
      goto LABEL_9;
    }
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("p_config"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v19)
    {
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[ZhuGeArmoryHelperArmory getConfigOfKey:withError:]", 657, CFSTR("Unexpected nil config of key \"%@\"!"), v16, v17, v18, (uint64_t)v10);
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 45, 0);
      v20 = (id)objc_claimAutoreleasedReturnValue();
LABEL_9:
      *a4 = v20;
    }
  }
  else
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[ZhuGeArmoryHelperArmory getConfigOfKey:withError:]", 636, CFSTR("error p-pointer is nil!"), v7, v8, v9, v22);
    v11 = 0;
    v19 = 0;
    v15 = 0;
  }

  return v19;
}

- (id)isKeyAlias:(id)a3 withError:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v22;
  id v23;

  v6 = a3;
  v10 = v6;
  if (a4)
  {
    *a4 = 0;
    if (!v6)
    {
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[ZhuGeArmoryHelperArmory isKeyAlias:withError:]", 680, CFSTR("key pointer is nil!"), v7, v8, v9, v22);
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 45, 0);
      v20 = (id)objc_claimAutoreleasedReturnValue();
      v11 = 0;
      v19 = 0;
      v15 = 0;
      goto LABEL_9;
    }
    v23 = 0;
    -[ZhuGeArmoryHelperArmory getPropertiesOfKey:withError:](self, "getPropertiesOfKey:withError:", v6, &v23);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v23;
    if (!v11)
    {
      ZhuGeLog(263184, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[ZhuGeArmoryHelperArmory isKeyAlias:withError:]", 688, CFSTR("Failed to get properties of \"%@\" for alias!"), v12, v13, v14, (uint64_t)v10);
      v20 = objc_retainAutorelease(v15);
      v15 = v20;
      v19 = 0;
      goto LABEL_9;
    }
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("p_is_alias"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v19)
    {
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[ZhuGeArmoryHelperArmory isKeyAlias:withError:]", 695, CFSTR("Unexpected nil isAlias of key \"%@\"!"), v16, v17, v18, (uint64_t)v10);
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 45, 0);
      v20 = (id)objc_claimAutoreleasedReturnValue();
LABEL_9:
      *a4 = v20;
    }
  }
  else
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[ZhuGeArmoryHelperArmory isKeyAlias:withError:]", 674, CFSTR("error p-pointer is nil!"), v7, v8, v9, v22);
    v11 = 0;
    v19 = 0;
    v15 = 0;
  }

  return v19;
}

- (id)getSubkeyOfKey:(id)a3 withError:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v22;
  id v23;

  v6 = a3;
  v10 = v6;
  if (a4)
  {
    *a4 = 0;
    if (!v6)
    {
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[ZhuGeArmoryHelperArmory getSubkeyOfKey:withError:]", 718, CFSTR("key pointer is nil!"), v7, v8, v9, v22);
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 45, 0);
      v20 = (id)objc_claimAutoreleasedReturnValue();
      v11 = 0;
      v19 = 0;
      v15 = 0;
      goto LABEL_9;
    }
    v23 = 0;
    -[ZhuGeArmoryHelperArmory getPropertiesOfKey:withError:](self, "getPropertiesOfKey:withError:", v6, &v23);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v23;
    if (!v11)
    {
      ZhuGeLog(263184, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[ZhuGeArmoryHelperArmory getSubkeyOfKey:withError:]", 726, CFSTR("Failed to get properties of \"%@\" for subkey!"), v12, v13, v14, (uint64_t)v10);
      v20 = objc_retainAutorelease(v15);
      v15 = v20;
      v19 = 0;
      goto LABEL_9;
    }
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("p_subkey"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v19)
    {
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[ZhuGeArmoryHelperArmory getSubkeyOfKey:withError:]", 733, CFSTR("Lacking subkey of key \"%@\"!"), v16, v17, v18, (uint64_t)v10);
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 45, 0);
      v20 = (id)objc_claimAutoreleasedReturnValue();
LABEL_9:
      *a4 = v20;
    }
  }
  else
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[ZhuGeArmoryHelperArmory getSubkeyOfKey:withError:]", 712, CFSTR("error p-pointer is nil!"), v7, v8, v9, v22);
    v11 = 0;
    v19 = 0;
    v15 = 0;
  }

  return v19;
}

- (id)getObfuscatedKey:(id)a3 withError:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v23;
  id v24;

  v6 = a3;
  v10 = v6;
  if (!a4)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[ZhuGeArmoryHelperArmory getObfuscatedKey:withError:]", 750, CFSTR("error p-pointer is nil!"), v7, v8, v9, v23);
    v11 = 0;
    v20 = 0;
    v15 = 0;
    goto LABEL_11;
  }
  *a4 = 0;
  if (!v6)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[ZhuGeArmoryHelperArmory getObfuscatedKey:withError:]", 756, CFSTR("key pointer is nil!"), v7, v8, v9, v23);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 45, 0);
    v21 = (id)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    v20 = 0;
    v15 = 0;
LABEL_10:
    *a4 = v21;
    goto LABEL_11;
  }
  v24 = 0;
  -[ZhuGeArmoryHelperArmory getPropertiesOfKey:withError:](self, "getPropertiesOfKey:withError:", v6, &v24);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v24;
  if (!v11)
  {
    ZhuGeLog(263184, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[ZhuGeArmoryHelperArmory getObfuscatedKey:withError:]", 764, CFSTR("Failed to get properties of \"%@\" for itself!"), v12, v13, v14, (uint64_t)v10);
    v21 = objc_retainAutorelease(v15);
    v15 = v21;
    v20 = 0;
    goto LABEL_10;
  }
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("p_obfuscated_key"));
  v16 = (id)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    ZhuGeLog(262656, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m", "-[ZhuGeArmoryHelperArmory getObfuscatedKey:withError:]", 771, CFSTR("Original key \"%@\" is already obfuscated"), v17, v18, v19, (uint64_t)v10);
    v16 = v10;
  }
  v20 = v16;
LABEL_11:

  return v20;
}

- (NSDictionary)keysConfig
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (NSDictionary)aliasesMap
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (NSArray)flexibleList
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (ZhuGeCacheArmory)propertiesCache
{
  return (ZhuGeCacheArmory *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPropertiesCache:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertiesCache, 0);
  objc_storeStrong((id *)&self->_flexibleList, 0);
  objc_storeStrong((id *)&self->_aliasesMap, 0);
  objc_storeStrong((id *)&self->_keysConfig, 0);
}

@end
