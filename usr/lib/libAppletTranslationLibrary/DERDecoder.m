@implementation DERDecoder

+ (id)DecodeItem:(id)a3 outTag:(unint64_t *)a4 outError:(id *)a5
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  unint64_t v24;
  _QWORD v25[2];
  _QWORD v26[2];
  _QWORD v27[2];
  _QWORD v28[2];
  uint64_t v29;
  uint64_t v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  int v34;
  __int16 v35;
  unint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v7 = objc_retainAutorelease(a3);
  v26[0] = objc_msgSend(v7, "bytes");
  v26[1] = objc_msgSend(v7, "length");
  v24 = 0;
  v25[0] = 0;
  v25[1] = 0;
  v8 = DERDecodeItemCtx((uint64_t)v26, &v24);
  if ((_DWORD)v8)
  {
    v9 = v8;
    ATLLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v32 = v7;
      v33 = 1024;
      v34 = v9;
      v35 = 2048;
      v36 = v24;
      _os_log_impl(&dword_1C3511000, v10, OS_LOG_TYPE_ERROR, "Failed to decode item %@ : %d (0x%llx)", buf, 0x1Cu);
    }

    v11 = objc_alloc(MEMORY[0x1E0CB3940]);
    v12 = objc_msgSend(v11, "initWithFormat:", CFSTR("Failed to decode item %@ : %d (0x%llx)"), v7, v9, v24);
    v13 = (void *)v12;
    if (a5)
    {
      v14 = *a5;
      v15 = (void *)MEMORY[0x1E0CB35C8];
      if (*a5)
      {
        v16 = *MEMORY[0x1E0CB3388];
        v27[0] = *MEMORY[0x1E0CB2D50];
        v27[1] = v16;
        v28[0] = v12;
        v28[1] = v14;
        v17 = (void *)MEMORY[0x1E0C99D80];
        v18 = v28;
        v19 = v27;
        v20 = 2;
      }
      else
      {
        v29 = *MEMORY[0x1E0CB2D50];
        v30 = v12;
        v17 = (void *)MEMORY[0x1E0C99D80];
        v18 = &v30;
        v19 = &v29;
        v20 = 1;
      }
      objc_msgSend(v17, "dictionaryWithObjects:forKeys:count:", v18, v19, v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 8, v22);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    v21 = 0;
  }
  else
  {
    if (a4)
      *a4 = v24;
    +[DERDecoder dataWithSource:item:](DERDecoder, "dataWithSource:item:", v7, v25);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v21;
}

+ (id)DecodeSequence:(id)a3 specification:(id)a4 unordered:(BOOL)a5 ignoreUnknownTags:(BOOL)a6 outError:(id *)a7
{
  id v8;
  char *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  char *v18;
  void *v19;
  void *v20;
  void *v21;
  char *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  id v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t *v33;
  uint64_t *v34;
  uint64_t v35;
  NSObject *v36;
  uint64_t v37;
  void *v38;
  id v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t *v43;
  uint64_t *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  char *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  unsigned __int16 v54;
  _BOOL8 v56;
  id v58;
  char *v59;
  _QWORD v60[2];
  uint64_t v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _QWORD v66[2];
  _QWORD v67[2];
  uint64_t v68;
  uint64_t v69;
  uint8_t buf[4];
  id v71;
  __int16 v72;
  id v73;
  __int16 v74;
  _BOOL4 v75;
  __int16 v76;
  int v77;
  _QWORD v78[2];
  _QWORD v79[2];
  uint64_t v80;
  uint64_t v81;
  _BYTE v82[128];
  uint64_t v83;

  v56 = a5;
  v83 = *MEMORY[0x1E0C80C00];
  v58 = a3;
  v8 = a4;
  v54 = objc_msgSend(v8, "count");
  v59 = (char *)malloc_type_calloc(v54, 0x10uLL, 0x1010040FDD9F14CuLL);
  v9 = (char *)malloc_type_calloc(v54, 0x20uLL, 0x1000040F0CC3A19uLL);
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v62, v82, 16);
  if (v11)
  {
    v12 = v11;
    v13 = 0;
    v14 = *(_QWORD *)v63;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v63 != v14)
          objc_enumerationMutation(v10);
        v16 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * i);
        if (objc_msgSend(v16, "count") != 4)
        {
          ATLLogObject();
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v71 = v16;
            _os_log_impl(&dword_1C3511000, v36, OS_LOG_TYPE_ERROR, "Invalid spec item %@", buf, 0xCu);
          }

          v37 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid spec item %@"), v16);
          v38 = (void *)v37;
          v23 = v58;
          v22 = v59;
          if (a7)
          {
            v39 = *a7;
            v40 = (void *)MEMORY[0x1E0CB35C8];
            if (*a7)
            {
              v41 = *MEMORY[0x1E0CB3388];
              v78[0] = *MEMORY[0x1E0CB2D50];
              v78[1] = v41;
              v79[0] = v37;
              v79[1] = v39;
              v42 = (void *)MEMORY[0x1E0C99D80];
              v43 = v79;
              v44 = v78;
              v45 = 2;
            }
            else
            {
              v80 = *MEMORY[0x1E0CB2D50];
              v81 = v37;
              v42 = (void *)MEMORY[0x1E0C99D80];
              v43 = &v81;
              v44 = &v80;
              v45 = 1;
            }
            objc_msgSend(v42, "dictionaryWithObjects:forKeys:count:", v43, v44, v45);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 8, v52);
            *a7 = (id)objc_claimAutoreleasedReturnValue();

          }
          v28 = v10;
          goto LABEL_31;
        }
        v17 = (v13 + i);
        v18 = &v9[32 * v17];
        *(_QWORD *)v18 = 16 * v17;
        objc_msgSend(v16, "objectAtIndexedSubscript:", 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *((_QWORD *)v18 + 1) = objc_msgSend(v19, "unsignedLongLongValue");

        objc_msgSend(v16, "objectAtIndexedSubscript:", 2);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *((_WORD *)v18 + 8) = objc_msgSend(v20, "unsignedShortValue");

        objc_msgSend(v16, "objectAtIndexedSubscript:", 3);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *((_QWORD *)v18 + 3) = objc_msgSend(v21, "unsignedLongLongValue");

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v62, v82, 16);
      v13 += i;
      if (v12)
        continue;
      break;
    }
  }

  v60[1] = v9;
  v60[0] = "<autogen>";
  v61 = v54;
  BYTE2(v61) = v56;
  BYTE3(v61) = a6;
  v23 = v58;
  v22 = v59;
  v24 = DERParseSequenceSpec(v58, (uint64_t)v60, v59, 0);
  if ((_DWORD)v24)
  {
    v25 = v24;
    ATLLogObject();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138413058;
      v71 = v58;
      v72 = 2112;
      v73 = v10;
      v74 = 1024;
      v75 = v56;
      v76 = 1024;
      v77 = v25;
      _os_log_impl(&dword_1C3511000, v26, OS_LOG_TYPE_ERROR, "Failed to decode seq %@ spec %@ unord %d ret %d", buf, 0x22u);
    }

    v27 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to decode seq %@ spec %@ unord %d ret %d"), v58, v10, v56, v25);
    v28 = (void *)v27;
    if (a7)
    {
      v29 = *a7;
      v30 = (void *)MEMORY[0x1E0CB35C8];
      if (*a7)
      {
        v31 = *MEMORY[0x1E0CB3388];
        v66[0] = *MEMORY[0x1E0CB2D50];
        v66[1] = v31;
        v67[0] = v27;
        v67[1] = v29;
        v32 = (void *)MEMORY[0x1E0C99D80];
        v33 = v67;
        v34 = v66;
        v35 = 2;
      }
      else
      {
        v68 = *MEMORY[0x1E0CB2D50];
        v69 = v27;
        v32 = (void *)MEMORY[0x1E0C99D80];
        v33 = &v69;
        v34 = &v68;
        v35 = 1;
      }
      objc_msgSend(v32, "dictionaryWithObjects:forKeys:count:", v33, v34, v35);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 8, v38);
      *a7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_31:

    }
    v46 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", v54);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    if (v54)
    {
      v47 = 0;
      v48 = v59;
      do
      {
        if (*((_QWORD *)v48 + 1))
        {
          objc_msgSend(v10, "objectAtIndexedSubscript:", v47);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "objectAtIndexedSubscript:", 0);
          v50 = (void *)objc_claimAutoreleasedReturnValue();

          +[DERDecoder dataWithSource:item:](DERDecoder, "dataWithSource:item:", v58, v48);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "setObject:forKeyedSubscript:", v51, v50);

        }
        ++v47;
        v48 += 16;
      }
      while (v54 != v47);
      v22 = v59;
    }
  }
  free(v22);
  free(v9);

  return v46;
}

+ (id)dataWithSource:(id)a3 item:(id *)a4
{
  char *var0;
  id v6;
  void *v7;

  var0 = a4->var0;
  v6 = objc_retainAutorelease(a3);
  objc_msgSend(v6, "subdataWithRange:", &var0[-objc_msgSend(v6, "bytes")], a4->var1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
