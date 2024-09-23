@implementation PSIQuery

- (BOOL)_enumerateImplicitlyTokenizedParsesWithBaseParse:(id)a3 usingBlock:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  PSIQueryToken *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t *v36;
  void *v37;
  BOOL v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  id v49;
  uint64_t v50;
  char *v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  char *v57;
  void *v58;
  void *v59;
  __CFString *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  char v65;
  void *v66;
  void *v67;
  void *v68;
  char v69;
  void *v71;
  id v72;
  void *v73;
  id v74;
  uint64_t v75;
  uint64_t (**v76)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v77;
  id v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  void *v82;
  uint64_t v83;
  id v84;
  uint64_t v85;
  id obj;
  id obja;
  char *objb;
  void *v89;
  id v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  _QWORD v103[4];
  id v104;
  id v105;
  id v106;
  id v107;
  uint64_t *v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  id v113;
  id v114;
  _QWORD v115[6];
  uint64_t v116;
  uint64_t *v117;
  uint64_t v118;
  void *v119;
  __int128 v120;
  uint64_t v121;
  uint64_t *v122;
  uint64_t v123;
  uint64_t (*v124)(uint64_t, uint64_t);
  void (*v125)(uint64_t);
  id v126;
  _BYTE v127[128];
  _BYTE v128[128];
  _BYTE v129[128];
  uint8_t v130[128];
  uint8_t buf[4];
  id v132;
  uint64_t v133;

  v133 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v78 = a4;
  v77 = v6;
  if (objc_msgSend(v6, "numberOfTokens"))
  {
    v121 = 0;
    v122 = &v121;
    v123 = 0x3032000000;
    v124 = __Block_byref_object_copy__22640;
    v125 = __Block_byref_object_dispose__22641;
    v126 = 0;
    v116 = 0;
    v117 = &v116;
    v118 = 0x3010000000;
    v119 = &unk_199CADF31;
    v120 = xmmword_199B9FD90;
    v115[0] = MEMORY[0x1E0C809B0];
    v115[1] = 3221225472;
    v115[2] = __94__PSIQuery_ImplicitTokenization___enumerateImplicitlyTokenizedParsesWithBaseParse_usingBlock___block_invoke;
    v115[3] = &unk_1E3666888;
    v115[4] = &v121;
    v115[5] = &v116;
    objc_msgSend(v6, "enumerateTokensUsingBlock:", v115);
    if (v122[5])
    {
      -[PSIQuery tokenizer](self, "tokenizer");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v122[5], "normalizedText");
      v7 = objc_claimAutoreleasedReturnValue();
      v113 = 0;
      v114 = 0;
      v8 = (void *)objc_msgSend(v89, "newTokensFromString:withOptions:outCopyRanges:error:", v7, 0, &v114, &v113);
      v90 = v114;
      v72 = v113;
      v73 = v8;
      v82 = (void *)v7;
      if (v8)
      {
        v9 = objc_msgSend(v8, "count");
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v111 = 0u;
        v112 = 0u;
        v109 = 0u;
        v110 = 0u;
        obj = v8;
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v109, v130, 16);
        if (v11)
        {
          v12 = 0;
          v13 = *(_QWORD *)v110;
          v14 = 1;
          v83 = 1 - v9;
          do
          {
            for (i = 0; i != v11; ++i)
            {
              if (*(_QWORD *)v110 != v13)
                objc_enumerationMutation(obj);
              v16 = *(_QWORD *)(*((_QWORD *)&v109 + 1) + 8 * i);
              if (!(v83 + v12 + i))
                v14 = 0;
              objc_msgSend(v90, "objectAtIndexedSubscript:", v12 + i);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = -[PSIQueryToken initWithText:userCategory:matchType:]([PSIQueryToken alloc], "initWithText:userCategory:matchType:", v16, 0, v14);
              v19 = objc_msgSend(v17, "rangeValue");
              -[PSIQueryToken setRangeInSearchText:](v18, "setRangeInSearchText:", v19, v20);
              -[PSIQueryToken setBelongsToSearchText:](v18, "setBelongsToSearchText:", 1);
              -[PSIQueryToken setUserControlledCategoriesUseWildcard:](v18, "setUserControlledCategoriesUseWildcard:", 0);
              -[PSIQueryToken normalizeTextWithTokenizer:](v18, "normalizeTextWithTokenizer:", v89);
              objc_msgSend(v10, "setObject:forKeyedSubscript:", v18, v17);

            }
            v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v109, v130, 16);
            v12 += i;
          }
          while (v11);
        }

        v103[0] = MEMORY[0x1E0C809B0];
        v103[1] = 3221225472;
        v103[2] = __94__PSIQuery_ImplicitTokenization___enumerateImplicitlyTokenizedParsesWithBaseParse_usingBlock___block_invoke_3;
        v103[3] = &unk_1E36668D8;
        v104 = v89;
        v21 = v10;
        v105 = v21;
        obja = v77;
        v106 = obja;
        v108 = &v116;
        v84 = v78;
        v107 = v84;
        v76 = (uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x19AEC174C](v103);
        objc_msgSend((id)objc_opt_class(), "parsedDatesFromText:", v7);
        v101 = 0u;
        v102 = 0u;
        v99 = 0u;
        v100 = 0u;
        v22 = (id)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v99, v129, 16);
        if (v23)
        {
          v24 = *(_QWORD *)v100;
          do
          {
            for (j = 0; j != v23; ++j)
            {
              if (*(_QWORD *)v100 != v24)
                objc_enumerationMutation(v22);
              v26 = *(void **)(*((_QWORD *)&v99 + 1) + 8 * j);
              objc_msgSend(v26, "extensionRange");
              if (!v27)
              {
                v28 = (void *)MEMORY[0x1E0CB3B18];
                v29 = objc_msgSend(v26, "range");
                objc_msgSend(v28, "valueWithRange:", v29, v30);
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v21, "objectForKeyedSubscript:", v31);
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                if (v32)
                {
                  objc_msgSend(v26, "attributes");
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  v34 = (void *)objc_msgSend(v33, "mutableCopy");

                  objc_msgSend(v32, "text");
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v34, "setObject:forKeyedSubscript:", v35, CFSTR("string"));

                  objc_msgSend(v32, "setDateAttributes:", v34);
                }

              }
            }
            v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v99, v129, 16);
          }
          while (v23);
        }

        v36 = v117;
        objc_msgSend(v21, "allValues");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(obja, "parseByReplacingTokensInRange:withTokens:", v36[4], v36[5], v37);
        v71 = (void *)objc_claimAutoreleasedReturnValue();

        buf[0] = 0;
        (*((void (**)(id, void *, uint8_t *))v84 + 2))(v84, v71, buf);
        if (buf[0])
        {
          v38 = 0;
        }
        else
        {
          v97 = 0u;
          v98 = 0u;
          v95 = 0u;
          v96 = 0u;
          v74 = v22;
          v39 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v95, v128, 16);
          if (v39)
          {
            v79 = *(_QWORD *)v96;
            while (2)
            {
              v85 = 0;
              v75 = v39;
              do
              {
                if (*(_QWORD *)v96 != v79)
                  objc_enumerationMutation(v74);
                v40 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * v85);
                v41 = objc_msgSend(v40, "range", v71);
                objb = v42;
                v43 = v41;
                v44 = objc_msgSend(v40, "extensionRange");
                v46 = v45;
                v81 = v40;
                if (v45)
                {
                  v47 = v44;
                  v48 = v21;
                  v93 = 0u;
                  v94 = 0u;
                  v91 = 0u;
                  v92 = 0u;
                  v49 = v90;
                  v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v91, v127, 16);
                  v80 = v43;
                  v51 = &objb[v43];
                  v52 = v47 - (_QWORD)&objb[v43];
                  if (v50)
                  {
                    v53 = *(_QWORD *)v92;
LABEL_39:
                    v54 = 0;
                    while (1)
                    {
                      if (*(_QWORD *)v92 != v53)
                        objc_enumerationMutation(v49);
                      v55 = objc_msgSend(*(id *)(*((_QWORD *)&v91 + 1) + 8 * v54), "rangeValue");
                      if (v55 >= (unint64_t)v51 && v55 - (unint64_t)v51 < v52)
                        break;
                      if (v50 == ++v54)
                      {
                        v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v91, v127, 16);
                        if (v50)
                          goto LABEL_39;
                        goto LABEL_49;
                      }
                    }
                    v60 = &stru_1E36789C0;
                    v21 = v48;
                    v39 = v75;
                    if ((char *)v55 != v51)
                    {
                      objc_msgSend(v82, "substringWithRange:", v51);
                      v60 = (__CFString *)objc_claimAutoreleasedReturnValue();
                    }

                    objc_msgSend(v82, "substringWithRange:", v80, objb);
                    v61 = (void *)objc_claimAutoreleasedReturnValue();
                    v62 = (void *)objc_msgSend(v61, "mutableCopy");

                    objc_msgSend(v62, "appendString:", v60);
                    objc_msgSend(v82, "substringWithRange:", v47, v46);
                    v63 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v62, "appendString:", v63);

                    objc_msgSend(v81, "attributes");
                    v64 = (void *)objc_claimAutoreleasedReturnValue();
                    v65 = ((uint64_t (**)(_QWORD, void *, void *, uint64_t, char *, uint64_t, uint64_t))v76)[2](v76, v62, v64, v80, objb, v47, v46);

                    if ((v65 & 1) != 0)
                      goto LABEL_58;
LABEL_61:

                    v38 = 0;
                    goto LABEL_62;
                  }
LABEL_49:

                  v39 = v75;
                  v21 = v48;
                  v57 = &objb[v46 + v52];
                  objc_msgSend(v82, "substringWithRange:", v80, v57);
                  v58 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v81, "attributes");
                  v59 = (void *)objc_claimAutoreleasedReturnValue();
                  LOBYTE(v57) = ((uint64_t (**)(_QWORD, void *, void *, uint64_t, char *, uint64_t, _QWORD))v76)[2](v76, v58, v59, v80, v57, 0x7FFFFFFFFFFFFFFFLL, 0);

                  v60 = 0;
                  if ((v57 & 1) == 0)
                    goto LABEL_61;
                }
                else
                {
                  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v43, objb);
                  v60 = (__CFString *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v21, "objectForKeyedSubscript:", v60);
                  v66 = (void *)objc_claimAutoreleasedReturnValue();
                  if (!v66)
                  {
                    objc_msgSend(v82, "substringWithRange:", v43, objb);
                    v67 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v81, "attributes");
                    v68 = (void *)objc_claimAutoreleasedReturnValue();
                    v69 = ((uint64_t (**)(_QWORD, void *, void *, uint64_t, char *, uint64_t, _QWORD))v76)[2](v76, v67, v68, v43, objb, 0x7FFFFFFFFFFFFFFFLL, 0);

                    if ((v69 & 1) == 0)
                      goto LABEL_61;
                  }

                }
LABEL_58:

                ++v85;
              }
              while (v85 != v39);
              v39 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v95, v128, 16);
              if (v39)
                continue;
              break;
            }
          }
          v38 = 1;
LABEL_62:

        }
      }
      else
      {
        v38 = 1;
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v132 = v72;
          _os_log_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Skipping implicit tokenization: %@", buf, 0xCu);
        }
      }

    }
    else
    {
      v38 = 1;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Found no implicitly tokenized parses for query with no full text token.", buf, 2u);
      }
    }
    _Block_object_dispose(&v116, 8);
    _Block_object_dispose(&v121, 8);

  }
  else
  {
    v38 = 1;
  }

  return v38;
}

- (id)implicitlyTokenizedParsesWithBaseParse:(id)a3
{
  id v4;
  void *v5;
  uint8_t v7[8];
  _QWORD v8[4];
  id v9;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "numberOfTokens"))
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __73__PSIQuery_ImplicitTokenization__implicitlyTokenizedParsesWithBaseParse___block_invoke;
    v8[3] = &unk_1E3667348;
    v9 = v5;
    -[PSIQuery _enumerateImplicitlyTokenizedParsesWithBaseParse:usingBlock:](self, "_enumerateImplicitlyTokenizedParsesWithBaseParse:usingBlock:", v4, v8);

  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Found no implicitly tokenized parses for query with no text searchable token.", v7, 2u);
  }

  return v5;
}

void __73__PSIQuery_ImplicitTokenization__implicitlyTokenizedParsesWithBaseParse___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Found implicitly tokenized parse: %@", (uint8_t *)&v4, 0xCu);
  }

}

void __94__PSIQuery_ImplicitTokenization___enumerateImplicitlyTokenizedParsesWithBaseParse_usingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v8;
  id v9;

  v9 = a2;
  if (objc_msgSend(v9, "isFullTextToken"))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    *(_QWORD *)(v8 + 32) = a3;
    *(_QWORD *)(v8 + 40) = 1;
    *a4 = 1;
  }

}

uint64_t __94__PSIQuery_ImplicitTokenization___enumerateImplicitlyTokenizedParsesWithBaseParse_usingBlock___block_invoke_3(uint64_t a1, void *a2, void *a3, NSUInteger a4, NSUInteger a5, NSUInteger a6, NSUInteger a7)
{
  id v13;
  id v14;
  PSIQueryToken *v15;
  void *v16;
  NSUInteger location;
  NSUInteger length;
  NSRange v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  _QWORD v25[4];
  id v26;
  NSUInteger v27;
  NSUInteger v28;
  NSUInteger v29;
  NSUInteger v30;
  NSRange v31;
  NSRange v32;

  v13 = a3;
  v14 = a2;
  v15 = -[PSIQueryToken initWithText:userCategory:matchType:]([PSIQueryToken alloc], "initWithText:userCategory:matchType:", v14, 0, 2);
  v16 = (void *)objc_msgSend(v13, "mutableCopy");

  objc_msgSend(v16, "setObject:forKeyedSubscript:", v14, CFSTR("string"));
  -[PSIQueryToken setDateAttributes:](v15, "setDateAttributes:", v16);
  location = a4;
  length = a5;
  if (a7)
  {
    v31.location = a4;
    v31.length = a5;
    v32.location = a6;
    v32.length = a7;
    v19 = NSUnionRange(v31, v32);
    location = v19.location;
    length = v19.length;
  }
  -[PSIQueryToken setRangeInSearchText:](v15, "setRangeInSearchText:", location, length);
  -[PSIQueryToken setBelongsToSearchText:](v15, "setBelongsToSearchText:", 1);
  -[PSIQueryToken setUserControlledCategoriesUseWildcard:](v15, "setUserControlledCategoriesUseWildcard:", 0);
  -[PSIQueryToken normalizeTextWithTokenizer:](v15, "normalizeTextWithTokenizer:", *(_QWORD *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v15);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = *(void **)(a1 + 40);
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __94__PSIQuery_ImplicitTokenization___enumerateImplicitlyTokenizedParsesWithBaseParse_usingBlock___block_invoke_2;
  v25[3] = &unk_1E36668B0;
  v28 = a5;
  v29 = a6;
  v30 = a7;
  v26 = v20;
  v27 = a4;
  v22 = v20;
  objc_msgSend(v21, "enumerateKeysAndObjectsUsingBlock:", v25);
  objc_msgSend(*(id *)(a1 + 48), "parseByReplacingTokensInRange:withTokens:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  return 1;
}

void __94__PSIQuery_ImplicitTokenization___enumerateImplicitlyTokenizedParsesWithBaseParse_usingBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSUInteger v6;
  NSUInteger v7;
  id v8;
  NSRange v9;
  NSRange v10;

  v8 = a2;
  v5 = a3;
  v9.location = objc_msgSend(v8, "rangeValue");
  v9.length = v6;
  if (!NSIntersectionRange(*(NSRange *)(a1 + 40), v9).length)
  {
    if (!*(_QWORD *)(a1 + 64)
      || (v10.location = objc_msgSend(v8, "rangeValue"),
          v10.length = v7,
          !NSIntersectionRange(*(NSRange *)(a1 + 56), v10).length))
    {
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
    }
  }

}

+ (_NSRange)searchTextExtendedRangeForParse:(id)a3
{
  id v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  _NSRange result;

  v3 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3010000000;
  v12 = &unk_199CADF31;
  v13 = xmmword_199B9FD90;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __66__PSIQuery_ImplicitTokenization__searchTextExtendedRangeForParse___block_invoke;
  v8[3] = &unk_1E3668518;
  v8[4] = &v9;
  objc_msgSend(v3, "enumerateTokensUsingBlock:", v8);
  v4 = v10[4];
  v5 = v10[5];
  _Block_object_dispose(&v9, 8);

  v6 = v4;
  v7 = v5;
  result.length = v7;
  result.location = v6;
  return result;
}

void __66__PSIQuery_ImplicitTokenization__searchTextExtendedRangeForParse___block_invoke(uint64_t a1, void *a2)
{
  NSRange *v3;
  NSUInteger v4;
  NSUInteger location;
  NSUInteger length;
  NSRange v7;
  uint64_t v8;
  id v9;
  NSRange v10;

  v9 = a2;
  if (objc_msgSend(v9, "belongsToSearchText"))
  {
    v3 = *(NSRange **)(*(_QWORD *)(a1 + 32) + 8);
    if (v3[2].length)
    {
      v10.location = objc_msgSend(v9, "rangeInSearchText");
      v10.length = v4;
      v7 = NSUnionRange(v3[2], v10);
      length = v7.length;
      location = v7.location;
    }
    else
    {
      location = objc_msgSend(v9, "rangeInSearchText");
    }
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    *(_QWORD *)(v8 + 32) = location;
    *(_QWORD *)(v8 + 40) = length;
  }

}

+ (id)dateFilterWithAttributes:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  PSIDateFilter *v15;
  BOOL v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  int v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  PSIDateFilter *v29;
  PSIDateFilter *v30;
  void *v31;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D512F0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D51318]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D51310]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      goto LABEL_38;
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D51308]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntegerValue");

  v8 = 0;
  if (v7 > 23)
  {
    if (v7 == 24)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v5, "component:fromDate:", 512, v17);

      objc_msgSend(v4, "setWeekday:", v18);
      objc_msgSend(v5, "dateFromComponents:", v4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "dateByAddingUnit:value:toDate:options:", 16, -1, v13, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v5;
      v20 = 1;
    }
    else
    {
      if (v7 != 25)
      {
        v9 = 0;
        v10 = 0;
        v11 = 0;
        if (v7 != 26)
          goto LABEL_26;
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "components:fromDate:", 24, v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "setMonth:", objc_msgSend(v13, "month"));
        objc_msgSend(v4, "setDay:", objc_msgSend(v13, "day"));
        objc_msgSend(v5, "dateFromComponents:", v4);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "dateByAddingUnit:value:toDate:options:", 16, -3, v14, 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "dateByAddingUnit:value:toDate:options:", 16, 3, v14, 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_23:
        if (v8)
        {
LABEL_24:
          objc_msgSend(v5, "components:fromDate:", 28, v8);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v9)
            goto LABEL_25;
          goto LABEL_17;
        }
LABEL_16:
        v10 = 0;
        if (v9)
        {
LABEL_25:
          objc_msgSend(v5, "components:fromDate:", 28, v9);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_26;
        }
LABEL_17:
        v11 = 0;
        goto LABEL_26;
      }
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v5, "component:fromDate:", 16, v21);

      objc_msgSend(v4, "setDay:", v22);
      objc_msgSend(v5, "dateFromComponents:", v4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "dateByAddingUnit:value:toDate:options:", 16, -3, v13, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v5;
      v20 = 3;
    }
    objc_msgSend(v19, "dateByAddingUnit:value:toDate:options:", 16, v20, v13, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_23;
  }
  v16 = v7 == 3 || v7 == 8;
  v9 = 0;
  v10 = 0;
  v11 = 0;
  if (v16)
  {
    objc_msgSend(v5, "dateFromComponents:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dateByAddingUnit:value:toDate:options:", 16, 6, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      goto LABEL_24;
    goto LABEL_16;
  }
LABEL_26:
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D51300]);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "unsignedIntegerValue");

  if (v24 == 2)
  {
    if (v10)
      v27 = v10;
    else
      v27 = v4;
    v28 = v27;

    v26 = 0;
    v10 = v28;
  }
  else
  {
    if (v24 != 1)
      goto LABEL_37;

    if (v11)
      v25 = v11;
    else
      v25 = v4;
    v26 = v25;
    v10 = 0;
  }

  v11 = v26;
LABEL_37:

  if (v10)
  {
LABEL_38:
    v29 = [PSIDateFilter alloc];
    if (v11)
      v15 = -[PSIDateFilter initWithStartDateComponents:endDateComponents:](v29, "initWithStartDateComponents:endDateComponents:", v10, v11);
    else
      v15 = -[PSIDateFilter initWithStartDateComponents:](v29, "initWithStartDateComponents:", v10);
    goto LABEL_41;
  }
LABEL_8:
  if (v11)
  {
    v15 = -[PSIDateFilter initWithEndDateComponents:]([PSIDateFilter alloc], "initWithEndDateComponents:", v11);
  }
  else
  {
    if (!v4)
    {
      v30 = 0;
      goto LABEL_42;
    }
    v15 = -[PSIDateFilter initWithSingleDateComponents:]([PSIDateFilter alloc], "initWithSingleDateComponents:", v4);
  }
LABEL_41:
  v30 = v15;
LABEL_42:
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D512F8]);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSIDateFilter setDisplayString:](v30, "setDisplayString:", v31);

  return v30;
}

+ (id)dateFilterByCombiningDateFilter:(id)a3 withDateFilter:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  PSIDateFilter *v8;
  void *v9;
  void *v10;
  void *v11;
  PSIDate *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  PSIDate *v18;
  PSIDate *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "int64RepresentationMask");
  if ((objc_msgSend(v6, "int64RepresentationMask") & v7) != 0)
    goto LABEL_2;
  objc_msgSend(v5, "singleDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "singleDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9)
  {
    if (v10)
    {
      v12 = -[PSIDate initWithInt64Representation:]([PSIDate alloc], "initWithInt64Representation:", objc_msgSend(v10, "int64Representation") | objc_msgSend(v9, "int64Representation"));
      v8 = -[PSIDateFilter initWithSingleDate:]([PSIDateFilter alloc], "initWithSingleDate:", v12);
LABEL_10:

      v20 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v5, "displayString");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "displayString");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "stringWithFormat:", CFSTR("%@, %@"), v21, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSIDateFilter setDisplayString:](v8, "setDisplayString:", v23);

      goto LABEL_11;
    }
    v13 = v6;
    v11 = v9;
LABEL_9:
    v9 = v11;
    objc_msgSend(v13, "startDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "endDate");
    v12 = (PSIDate *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v9, "int64Representation");
    v15 = objc_msgSend(v11, "int64Representation") | v14;
    v16 = objc_msgSend(v9, "int64Representation");
    v17 = -[PSIDate int64Representation](v12, "int64Representation") | v16;
    v18 = -[PSIDate initWithInt64Representation:]([PSIDate alloc], "initWithInt64Representation:", v15);
    v19 = -[PSIDate initWithInt64Representation:]([PSIDate alloc], "initWithInt64Representation:", v17);
    v8 = -[PSIDateFilter initWithStartDate:endDate:]([PSIDateFilter alloc], "initWithStartDate:endDate:", v18, v19);

    goto LABEL_10;
  }
  v13 = v5;
  if (v10)
    goto LABEL_9;
LABEL_2:
  v8 = 0;
LABEL_11:

  return v8;
}

+ (id)dateFilterWithAttributes:(id)a3 andAttributes:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v18[6];
  uint8_t buf[8];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  _QWORD v26[4];
  _QWORD v27[5];

  v27[4] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__26390;
  v24 = __Block_byref_object_dispose__26391;
  v25 = 0;
  v26[0] = *MEMORY[0x1E0D51340];
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("string"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v8;
  v26[1] = *MEMORY[0x1E0D51338];
  v9 = *MEMORY[0x1E0D51300];
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D51300]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v10;
  v26[2] = *MEMORY[0x1E0D51330];
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("string"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v11;
  v26[3] = *MEMORY[0x1E0D51328];
  objc_msgSend(v7, "objectForKeyedSubscript:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v27[3] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D513A0], "defaultManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Photos Search PSIQuery: NLSearchParserManager created, will tokenize and enumerate attributed parses for query", buf, 2u);
  }
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __64__PSIQuery_DateParsing__dateFilterWithAttributes_andAttributes___block_invoke;
  v18[3] = &unk_1E3667280;
  v18[4] = &v20;
  v18[5] = a1;
  v15 = (id)objc_msgSend(v14, "tokenizeAndEnumerateAttributedParsesForQuery:options:withBlock:", 0, v13, v18);
  v16 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  return v16;
}

+ (id)parsedDatesFromText:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D513A0], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "length");
  if (v9)
  {
    v10 = v9;
    if (objc_msgSend(v4, "length") == v9)
      v11 = 0;
    else
      v11 = objc_msgSend(v4, "rangeOfString:options:", v8, 2);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __45__PSIQuery_DateParsing__parsedDatesFromText___block_invoke;
    v14[3] = &unk_1E36672D0;
    v17 = v10;
    v18 = v11;
    v15 = v8;
    v16 = v5;
    v12 = (id)objc_msgSend(v6, "tokenizeAndEnumerateAttributedParsesForQuery:options:withBlock:", v15, MEMORY[0x1E0C9AA70], v14);

  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    v20 = v5;
    v21 = 2112;
    v22 = v4;
    v23 = 2112;
    v24 = a1;
    _os_log_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Photos Search PSIQuery: Generated parsed dates: %@, from text: %@, for query: %@", buf, 0x20u);
  }

  return v5;
}

+ (id)dateAttributesFromToken:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v3 = a3;
  objc_msgSend(v3, "dateAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "dateAttributes");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__26390;
    v21 = __Block_byref_object_dispose__26391;
    v22 = 0;
    objc_msgSend(MEMORY[0x1E0D513A0], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "text");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByTrimmingCharactersInSet:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "length");
    if (v10)
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __49__PSIQuery_DateParsing__dateAttributesFromToken___block_invoke;
      v13[3] = &unk_1E3667320;
      v16 = v10;
      v14 = v9;
      v15 = &v17;
      v11 = (id)objc_msgSend(v6, "tokenizeAndEnumerateAttributedParsesForQuery:options:withBlock:", v14, MEMORY[0x1E0C9AA70], v13);

    }
    v5 = (id)v18[5];

    _Block_object_dispose(&v17, 8);
  }

  return v5;
}

+ (BOOL)tokenIsEligibleForDateParsing:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  if (objc_msgSend(v3, "userCategory"))
    v4 = objc_msgSend(v3, "userCategory") == 8;
  else
    v4 = 1;

  return v4;
}

+ (BOOL)enumerateDatedParsesWithParse:(id)a3 currentTokenIndex:(unint64_t)a4 potentialComboAttributes:(id)a5 usingBlock:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, id, uint8_t *);
  unint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  PSIQueryToken *v19;
  void *v20;
  void *v21;
  PSIQueryToken *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  unint64_t v27;
  id v28;
  char v29;
  void *v30;
  void *v31;
  uint64_t v33;
  PSIQueryToken *v34;
  void *v35;
  void *v36;
  PSIQueryToken *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint8_t buf[4];
  id v53;
  __int16 v54;
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = (void (**)(id, id, uint8_t *))a6;
  if (objc_msgSend(v10, "numberOfTokens") <= a4)
  {
    objc_msgSend(v10, "dateFilter");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      buf[0] = 0;
      v12[2](v12, v10, buf);
      v29 = buf[0] == 0;
    }
    else
    {
      v29 = 1;
    }
  }
  else
  {
    v13 = a4 + 1;
    if (objc_msgSend(a1, "enumerateDatedParsesWithParse:currentTokenIndex:potentialComboAttributes:usingBlock:", v10, a4 + 1, v11, v12))
    {
      objc_msgSend(v10, "tokenAtIndex:", a4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(a1, "tokenIsEligibleForDateParsing:", v14)
        || (objc_msgSend(a1, "dateAttributesFromToken:", v14), (v15 = objc_claimAutoreleasedReturnValue()) == 0))
      {
        v29 = 1;
LABEL_21:

        goto LABEL_22;
      }
      v16 = (void *)v15;
      if (v11)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v53 = v11;
          _os_log_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Photos Search PSIQuery: have potential combo attributes: %@", buf, 0xCu);
        }
        objc_msgSend(a1, "dateFilterWithAttributes:andAttributes:", v11, v16);
        v17 = objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          v46 = (void *)v17;
          v48 = v16;
          v18 = v16;
          v44 = v10;
          objc_msgSend(v44, "tokenAtIndex:", a4);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x1E0D512F8]);
          v50 = (void *)objc_claimAutoreleasedReturnValue();

          v19 = [PSIQueryToken alloc];
          objc_msgSend(v42, "text");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 1102);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = -[PSIQueryToken initWithText:normalizedText:userCategory:searchedCategories:matchType:](v19, "initWithText:normalizedText:userCategory:searchedCategories:matchType:", v20, v50, 8, v21, 3);

          -[PSIQueryToken setBelongsToSearchText:](v22, "setBelongsToSearchText:", objc_msgSend(v42, "belongsToSearchText"));
          -[PSIQueryToken setIsFullTextToken:](v22, "setIsFullTextToken:", objc_msgSend(v42, "isFullTextToken"));
          objc_msgSend(v44, "parseByReplacingTokenAtIndex:withToken:", a4, v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          v24 = v46;
          objc_msgSend(v23, "setDateFilter:", v46);

          v16 = v48;
          v25 = a1;
          v26 = v23;
          v27 = v13;
          v28 = 0;
LABEL_10:
          v29 = objc_msgSend(v25, "enumerateDatedParsesWithParse:currentTokenIndex:potentialComboAttributes:usingBlock:", v26, v27, v28, v12);

LABEL_20:
          goto LABEL_21;
        }
      }
      else
      {
        objc_msgSend(v10, "dateFilter");
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        if (v31)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v14, "text");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "dateFilter");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "displayString");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v53 = v38;
            v54 = 2112;
            v55 = v40;
            _os_log_debug_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Photos Search PSIQuery: Ignoring token \"%@\" because two attributes have already been combined into dateFilter: %@", buf, 0x16u);

          }
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Photos Search PSIQuery: parse.dateFilter is nil", buf, 2u);
          }
          objc_msgSend(a1, "dateFilterWithAttributes:", v16);
          v33 = objc_claimAutoreleasedReturnValue();
          if (v33)
          {
            v47 = (void *)v33;
            v45 = v16;
            v43 = v10;
            objc_msgSend(v43, "tokenAtIndex:", a4);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "objectForKeyedSubscript:", *MEMORY[0x1E0D512F8]);
            v51 = (void *)objc_claimAutoreleasedReturnValue();

            v49 = v16;
            v34 = [PSIQueryToken alloc];
            objc_msgSend(v41, "text");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 1102);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = -[PSIQueryToken initWithText:normalizedText:userCategory:searchedCategories:matchType:](v34, "initWithText:normalizedText:userCategory:searchedCategories:matchType:", v35, v51, 8, v36, 3);

            -[PSIQueryToken setBelongsToSearchText:](v37, "setBelongsToSearchText:", objc_msgSend(v41, "belongsToSearchText"));
            -[PSIQueryToken setIsFullTextToken:](v37, "setIsFullTextToken:", objc_msgSend(v41, "isFullTextToken"));
            objc_msgSend(v43, "parseByReplacingTokenAtIndex:withToken:", a4, v37);
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            v24 = v47;
            objc_msgSend(v23, "setDateFilter:", v47);

            v16 = v49;
            v25 = a1;
            v26 = v23;
            v27 = v13;
            v28 = v45;
            goto LABEL_10;
          }
        }
      }
      v29 = 1;
      goto LABEL_20;
    }
    v29 = 0;
  }
LABEL_22:

  return v29;
}

+ (id)datedParsesWithParses:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  _QWORD v14[4];
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  void *v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    v10 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v12, "numberOfTokens"))
        {
          v14[0] = v10;
          v14[1] = 3221225472;
          v14[2] = __47__PSIQuery_DateParsing__datedParsesWithParses___block_invoke;
          v14[3] = &unk_1E3667348;
          v15 = v5;
          objc_msgSend(a1, "enumerateDatedParsesWithParse:currentTokenIndex:potentialComboAttributes:usingBlock:", v12, 0, 0, v14);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
    }
    while (v8);
  }

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v21 = v5;
    _os_log_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Photos Search PSIQuery: Found dated parses: %@", buf, 0xCu);
  }

  return v5;
}

uint64_t __47__PSIQuery_DateParsing__datedParsesWithParses___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

void __49__PSIQuery_DateParsing__dateAttributesFromToken___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t *v8;
  unint64_t v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(_QWORD *, void *, uint64_t, uint64_t);
  void *v20;
  id v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  void *v34;
  __int128 v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  void *v39;
  __int128 v40;

  v5 = a2;
  v36 = 0;
  v37 = &v36;
  v38 = 0x3010000000;
  v39 = &unk_199CADF31;
  v40 = xmmword_199B9FD90;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3010000000;
  v34 = &unk_199CADF31;
  v35 = xmmword_199B9FD90;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__26390;
  v29 = __Block_byref_object_dispose__26391;
  v30 = 0;
  v6 = *(_QWORD *)(a1 + 48);
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __49__PSIQuery_DateParsing__dateAttributesFromToken___block_invoke_2;
  v20 = &unk_1E36672F8;
  v22 = &v36;
  v21 = *(id *)(a1 + 32);
  v23 = &v25;
  v24 = &v31;
  objc_msgSend(v5, "enumerateAttributesInRange:options:usingBlock:", 0, v6, 0, &v17);
  v7 = v32[4];
  v8 = v37;
  v9 = v37[4];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (!v9 && v37[5] == *(_QWORD *)(a1 + 48))
    {
LABEL_4:
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), (id)v26[5]);
      *a3 = 1;
    }
  }
  else if (v9 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = v9 >= v7;
    if (v9 >= v7)
    {
      v9 = v32[4];
      v8 = v32;
    }
    v11 = v8[5];
    v12 = v11;
    if (!v10)
      v12 = v32[5];
    if (!v9 && v12 + v7 == *(_QWORD *)(a1 + 48))
    {
      objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", v11, v7 - v11, v17, v18, v19, v20);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringByTrimmingCharactersInSet:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "length");

      if (!v16)
        goto LABEL_4;
    }
  }

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v36, 8);

}

void __49__PSIQuery_DateParsing__dateAttributesFromToken___block_invoke_2(_QWORD *a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;

  v16 = a2;
  v7 = objc_msgSend(v16, "count");
  v8 = v16;
  if (v7)
  {
    objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0D51308]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "integerValue");

    if (v10 == 42)
    {
      v11 = *(_QWORD *)(a1[7] + 8);
      *(_QWORD *)(v11 + 32) = a3;
      *(_QWORD *)(v11 + 40) = a4;
    }
    else
    {
      v12 = *(_QWORD *)(a1[5] + 8);
      *(_QWORD *)(v12 + 32) = a3;
      *(_QWORD *)(v12 + 40) = a4;
      v13 = (void *)objc_msgSend(v16, "mutableCopy");
      objc_msgSend(v13, "setObject:forKeyedSubscript:", a1[4], CFSTR("string"));
      v14 = *(_QWORD *)(a1[6] + 8);
      v15 = *(void **)(v14 + 40);
      *(_QWORD *)(v14 + 40) = v13;

    }
    v8 = v16;
  }

}

void __45__PSIQuery_DateParsing__parsedDatesFromText___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  PSIParsedDate *v5;
  PSIParsedDate *v6;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  void *v22;
  __int128 v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  void *v27;
  __int128 v28;

  v3 = a2;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3010000000;
  v27 = &unk_199CADF31;
  v28 = xmmword_199B9FD90;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3010000000;
  v22 = &unk_199CADF31;
  v23 = xmmword_199B9FD90;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__26390;
  v17 = __Block_byref_object_dispose__26391;
  v18 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__PSIQuery_DateParsing__parsedDatesFromText___block_invoke_2;
  v7[3] = &unk_1E36672A8;
  v4 = *(_QWORD *)(a1 + 48);
  v12 = *(_QWORD *)(a1 + 56);
  v9 = &v24;
  v8 = *(id *)(a1 + 32);
  v10 = &v13;
  v11 = &v19;
  objc_msgSend(v3, "enumerateAttributesInRange:options:usingBlock:", 0, v4, 0, v7);
  if (v25[4] != 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = [PSIParsedDate alloc];
    v6 = -[PSIParsedDate initWithAttributes:range:extensionRange:](v5, "initWithAttributes:range:extensionRange:", v14[5], v25[4], v25[5], v20[4], v20[5]);
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);

  }
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v24, 8);

}

void __45__PSIQuery_DateParsing__parsedDatesFromText___block_invoke_2(_QWORD *a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;

  v17 = a2;
  v7 = objc_msgSend(v17, "count");
  v8 = v17;
  if (v7)
  {
    v9 = a1[8] + a3;
    objc_msgSend(v17, "objectForKeyedSubscript:", *MEMORY[0x1E0D51308]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "integerValue");

    if (v11 == 42)
    {
      v12 = *(_QWORD *)(a1[7] + 8);
      *(_QWORD *)(v12 + 32) = v9;
      *(_QWORD *)(v12 + 40) = a4;
    }
    else
    {
      v13 = *(_QWORD *)(a1[5] + 8);
      *(_QWORD *)(v13 + 32) = v9;
      *(_QWORD *)(v13 + 40) = a4;
      v14 = (void *)objc_msgSend(v17, "mutableCopy");
      objc_msgSend(v14, "setObject:forKeyedSubscript:", a1[4], CFSTR("string"));
      v15 = *(_QWORD *)(a1[6] + 8);
      v16 = *(void **)(v15 + 40);
      *(_QWORD *)(v15 + 40) = v14;

    }
    v8 = v17;
  }

}

void __64__PSIQuery_DateParsing__dateFilterWithAttributes_andAttributes___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v17 = xmmword_199B9FD90;
  objc_msgSend(a2, "attributesAtIndex:effectiveRange:", 0, &v17);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D51308]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "unsignedIntegerValue");

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412802;
      v19 = v6;
      v20 = 2112;
      v21 = v9;
      v22 = 1024;
      v23 = v8;
      _os_log_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Photos Search PSIQuery: NLSearchParserManager found date parse attributes: %@ for query: %@ with date type: %d", buf, 0x1Cu);
    }
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) || v8 != 41)
    {
      objc_msgSend(*(id *)(a1 + 40), "dateFilterWithAttributes:", v6);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v12 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v10;

      v13 = *(_QWORD *)(a1 + 32);
      if (!*(_QWORD *)(*(_QWORD *)(v13 + 8) + 40) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v19 = v6;
        _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Photos Search PSIQuery: Attributes %@ didn't produce a dateFilter", buf, 0xCu);
        v13 = *(_QWORD *)(a1 + 32);
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        v14 = *(void **)(*(_QWORD *)(v13 + 8) + 40);
        v15 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138412802;
        v19 = v14;
        v20 = 2112;
        v21 = v15;
        v22 = 1024;
        v23 = v8;
        _os_log_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Photos Search PSIQuery: Generated date filter: %@ for query: %@ with date type: %d", buf, 0x1Cu);
        v13 = *(_QWORD *)(a1 + 32);
      }
      if (*(_QWORD *)(*(_QWORD *)(v13 + 8) + 40) && v8 != 41)
        *a3 = 1;
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v16 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138412290;
    v19 = v16;
    _os_log_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Photos Search PSIQuery: NLSearchParserManager found no date parse attributes for query: %@", buf, 0xCu);
  }

}

- (BOOL)implicitTokenizationIncludeBaseParseResults
{
  return -[NSArray count](self->_implicitelyTokenizedParses, "count") != 0;
}

- (PSIQuery)initWithQueryTokens:(id)a3 searchText:(id)a4 useWildcardText:(BOOL)a5 delegate:(id)a6 libraryScope:(unint64_t)a7
{
  _BOOL4 v9;
  id v12;
  id v13;
  id v14;
  PSIQuery *v15;
  PSIQuery *v16;
  void *v17;
  PSIQueryToken *v18;
  void *v19;
  uint64_t v20;
  PSIQuery *v21;
  PSIQueryToken *v22;
  uint64_t v23;
  void *v24;
  NSArray *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  void *v33;
  uint64_t v34;
  NSArray *socialGroupPersonIdentifiers;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t j;
  id v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  PSIQueryToken *v48;
  uint64_t v49;
  NSString *searchText;
  NSArray *queryTokens;
  NSArray *v52;
  NSMutableDictionary *v53;
  NSMutableDictionary *groupIdsByTokenKey;
  NSObject *v55;
  _BOOL4 v57;
  id v58;
  void *v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  objc_super v68;
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;

  v9 = a5;
  v71 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v68.receiver = self;
  v68.super_class = (Class)PSIQuery;
  v15 = -[PSIQuery init](&v68, sel_init);
  v16 = v15;
  if (!v15)
    goto LABEL_39;
  objc_storeWeak((id *)&v15->_delegate, v14);
  v59 = v13;
  v57 = v9;
  if (objc_msgSend(v12, "count") || objc_msgSend(v13, "length"))
  {
    v16->_libraryScope = a7;
    if (a7 == 2)
    {
      PLServicesSharedLibraryLocalizedFrameworkString();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = [PSIQueryToken alloc];
      v19 = v17;
      v20 = 3;
      goto LABEL_9;
    }
    if (a7 == 1)
    {
      PLServicesSharedLibraryLocalizedFrameworkString();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = [PSIQueryToken alloc];
      v19 = v17;
      v20 = 4;
LABEL_9:
      v22 = -[PSIQueryToken initWithText:userCategory:matchType:](v18, "initWithText:userCategory:matchType:", v19, v20, 2);
      v21 = v16;
      objc_msgSend(v12, "arrayByAddingObject:", v22);
      v23 = objc_claimAutoreleasedReturnValue();

      v12 = (id)v23;
      goto LABEL_10;
    }
  }
  v21 = v16;
LABEL_10:
  v58 = v14;
  objc_msgSend(v14, "tokenizer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v25 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_opt_new();
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v27 = v12;
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v64, v70, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v65;
    do
    {
      for (i = 0; i != v29; ++i)
      {
        if (*(_QWORD *)v65 != v30)
          objc_enumerationMutation(v27);
        v32 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
        if (objc_msgSend(v32, "containsMarker"))
        {
          objc_msgSend(v32, "identifier");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "componentsSeparatedByString:", CFSTR(","));
          v34 = objc_claimAutoreleasedReturnValue();
          socialGroupPersonIdentifiers = v21->_socialGroupPersonIdentifiers;
          v21->_socialGroupPersonIdentifiers = (NSArray *)v34;

          +[PSIQueryToken personQueryTokensFromSocialGroupQueryToken:](PSIQueryToken, "personQueryTokensFromSocialGroupQueryToken:", v32);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "addObjectsFromArray:", v36);

        }
        else
        {
          objc_msgSend(v26, "addObject:", v32);
        }
      }
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v64, v70, 16);
    }
    while (v29);
  }

  v37 = v26;
  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  v12 = v37;
  v38 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
  v16 = v21;
  if (v38)
  {
    v39 = v38;
    v40 = *(_QWORD *)v61;
    do
    {
      for (j = 0; j != v39; ++j)
      {
        if (*(_QWORD *)v61 != v40)
          objc_enumerationMutation(v12);
        v42 = *(id *)(*((_QWORD *)&v60 + 1) + 8 * j);
        if (v42)
        {
          v43 = v42;
          do
          {
            if (objc_msgSend(v43, "isTextSearchable"))
            {
              objc_msgSend(v43, "normalizedText");
              v44 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v44)
                objc_msgSend(v43, "normalizeTextWithTokenizer:", v24);
            }
            -[NSArray addObject:](v25, "addObject:", v43);
            objc_msgSend(v43, "parentToken");
            v45 = objc_claimAutoreleasedReturnValue();

            v43 = (void *)v45;
          }
          while (v45);
        }
      }
      v39 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
    }
    while (v39);
  }

  v13 = v59;
  if (objc_msgSend(v59, "length"))
  {
    objc_msgSend(v24, "normalizeString:", v59);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    if (v57)
      v47 = 0;
    else
      v47 = 2;
    v48 = -[PSIQueryToken initWithText:normalizedText:userCategory:matchType:]([PSIQueryToken alloc], "initWithText:normalizedText:userCategory:matchType:", v59, v46, 0, v47);
    -[PSIQueryToken setIsFullTextToken:](v48, "setIsFullTextToken:", 1);
    -[PSIQueryToken setBelongsToSearchText:](v48, "setBelongsToSearchText:", 1);
    -[PSIQueryToken setRangeInSearchText:](v48, "setRangeInSearchText:", 0, objc_msgSend(v59, "length"));
    -[PSIQueryToken setUsesWordEmbeddings:](v48, "setUsesWordEmbeddings:", 1);
    -[NSArray addObject:](v25, "addObject:", v48);

  }
  v49 = objc_msgSend(v59, "copy");
  searchText = v16->_searchText;
  v16->_searchText = (NSString *)v49;

  queryTokens = v16->_queryTokens;
  v16->_queryTokens = v25;
  v52 = v25;

  v16->_useWildcardText = v57;
  v53 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  groupIdsByTokenKey = v16->_groupIdsByTokenKey;
  v16->_groupIdsByTokenKey = v53;

  PLPhotosSearchGetLog();
  v55 = objc_claimAutoreleasedReturnValue();
  v16->_mergeFilterTokenAssetIDsIntervalID = os_signpost_id_make_with_pointer(v55, v16);

  v14 = v58;
LABEL_39:

  return v16;
}

- (void)runWithResultsHandler:(id)a3 disableWildcardMatchesForUserControlledCategories:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void (**v7)(_QWORD, _QWORD);
  id WeakRetained;
  BOOL *p_didStart;
  unsigned __int8 v10;
  const __CFString *v11;
  const __CFString *v12;
  int v13;
  PSIQuery *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v4 = a4;
  v21 = *MEMORY[0x1E0C80C00];
  if (a3)
    v6 = a3;
  else
    v6 = &__block_literal_global_32887;
  v7 = (void (**)(_QWORD, _QWORD))MEMORY[0x19AEC174C](v6, a2);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  p_didStart = &self->_didStart;
  do
    v10 = __ldaxr((unsigned __int8 *)p_didStart);
  while (__stlxr(1u, (unsigned __int8 *)p_didStart));
  if ((v10 & 1) != 0 || -[PSIQuery isCanceled](self, "isCanceled") || !WeakRetained)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      if ((v10 & 1) != 0)
        v11 = CFSTR("yes");
      else
        v11 = CFSTR("no");
      v13 = 138413058;
      if (-[PSIQuery isCanceled](self, "isCanceled"))
        v12 = CFSTR("yes");
      else
        v12 = CFSTR("no");
      v14 = self;
      v15 = 2112;
      v16 = v11;
      v17 = 2112;
      v18 = v12;
      v19 = 2112;
      v20 = WeakRetained;
      _os_log_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Photos Search Query: will NOT execute search query: %@, hadAlreadyStarted = %@, isCancelled = %@, delegate = %@", (uint8_t *)&v13, 0x2Au);
    }
    v7[2](v7, MEMORY[0x1E0C9AA60]);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412290;
      v14 = self;
      _os_log_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Photos Search Query: will execute search query: %@", (uint8_t *)&v13, 0xCu);
    }
    objc_msgSend(WeakRetained, "executeQuery:disableWildcardMatchesForUserControlledCategories:resultsHandler:", self, v4, v7);
  }

}

- (void)cancel
{
  atomic_store(1u, (unsigned __int8 *)&self->_isCanceled);
}

- (BOOL)isCanceled
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_isCanceled);
  return v2 & 1;
}

- (__CFSet)_idsOfGroupsMatchingString:(id)a3 categories:(id)a4 textIsSearchable:(BOOL)a5 isFilterTypeToken:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL8 v7;
  id v10;
  id v11;
  const __CFString *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  id WeakRetained;

  v6 = a6;
  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = CFSTR("ID::%@");
  if (v7)
    v12 = CFSTR("TEXT::%@");
  if (v6)
    v13 = CFSTR("FILTER TOKEN::%@");
  else
    v13 = v12;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v13, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_groupIdsByTokenKey, "objectForKeyedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v15 = (void *)objc_msgSend(WeakRetained, "groupIdsMatchingString:categories:textIsSearchable:", v10, v11, v7);

    if (!v15)
      goto LABEL_12;
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_groupIdsByTokenKey, "setObject:forKeyedSubscript:", v15, v14);
  }
  if (!CFSetGetCount((CFSetRef)v15) || -[PSIQuery isCanceled](self, "isCanceled"))
    v15 = 0;
LABEL_12:

  return (__CFSet *)v15;
}

- (__CFSet)_idsOfGroupsMatchingToken:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  __CFSet *v13;

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(v4, "wordEmbeddingMatch");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "word");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = v9;
    }
    else
    {
      objc_msgSend(v4, "resolvedText");
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    v7 = v11;

  }
  objc_msgSend(v4, "searchedCategories");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[PSIQuery _idsOfGroupsMatchingString:categories:textIsSearchable:isFilterTypeToken:](self, "_idsOfGroupsMatchingString:categories:textIsSearchable:isFilterTypeToken:", v7, v12, v6 == 0, objc_msgSend(v4, "isFilterTypeToken"));

  return v13;
}

- (PSITokenizer)tokenizer
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "tokenizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PSITokenizer *)v3;
}

- (void)bootstrap
{
  id v3;
  NSArray *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t i;
  void *v11;
  __CFSet *v12;
  PSIParse *v13;
  PSIParse *baseParse;
  NSArray *identifierTokens;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = self->_queryTokens;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    v9 = 1;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        v12 = -[PSIQuery _idsOfGroupsMatchingToken:](self, "_idsOfGroupsMatchingToken:", v11, (_QWORD)v16);
        if (objc_msgSend(v11, "isTextSearchable"))
        {
          objc_msgSend(v3, "addObject:", v11);
          if (!v12)
            v9 &= objc_msgSend(v11, "isFilterTypeToken");
        }
        else if (v12)
        {
          -[NSArray addObject:](v4, "addObject:", v11);
        }
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }
  else
  {
    LOBYTE(v9) = 1;
  }

  v13 = -[PSIParse initWithTokens:fromString:]([PSIParse alloc], "initWithTokens:fromString:", v3, self->_searchText);
  baseParse = self->_baseParse;
  self->_baseParse = v13;

  self->_baseParseCouldHaveResults = v9 & 1;
  identifierTokens = self->_identifierTokens;
  self->_identifierTokens = v4;

}

- (void)processImplicitTokenization
{
  NSObject *v3;
  NSObject *v4;
  NSArray *v5;
  NSArray *implicitelyTokenizedParses;
  _BOOL4 baseParseCouldHaveResults;
  void *v8;
  _QWORD v9[6];
  __int128 buf;
  uint64_t v11;
  char v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  PLSearchBackendQueryGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = self;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_INFO, "Process implicit tokenization for query: %@", (uint8_t *)&buf, 0xCu);
  }

  if (!self->_baseParse)
  {
    PLSearchBackendQueryGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_ERROR, "PSIQuery processImplicitTokenization called before bootstrap", (uint8_t *)&buf, 2u);
    }
    goto LABEL_7;
  }
  if (self->_implicitelyTokenizedParses)
  {
    PLSearchBackendQueryGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_ERROR, "PSIQuery processImplicitTokenization already called", (uint8_t *)&buf, 2u);
    }
LABEL_7:

    return;
  }
  -[PSIQuery implicitlyTokenizedParsesWithBaseParse:](self, "implicitlyTokenizedParsesWithBaseParse:");
  v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
  implicitelyTokenizedParses = self->_implicitelyTokenizedParses;
  self->_implicitelyTokenizedParses = v5;

  baseParseCouldHaveResults = self->_baseParseCouldHaveResults;
  self->_implicitlyTokenizedParsesCouldHaveResults = baseParseCouldHaveResults;
  if (!baseParseCouldHaveResults)
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v11 = 0x2020000000;
    v12 = 1;
    -[NSArray firstObject](self->_implicitelyTokenizedParses, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __39__PSIQuery_processImplicitTokenization__block_invoke;
    v9[3] = &unk_1E3668450;
    v9[4] = self;
    v9[5] = &buf;
    objc_msgSend(v8, "enumerateTokensUsingBlock:", v9);

    self->_implicitlyTokenizedParsesCouldHaveResults = *(_BYTE *)(*((_QWORD *)&buf + 1) + 24);
    _Block_object_dispose(&buf, 8);
  }
}

- (void)processDates
{
  NSArray *datedParses;
  NSObject *v4;
  NSObject *p_super;
  const char *v6;
  void *v7;
  void *v8;
  NSArray *v9;
  NSArray *v10;
  NSArray *v11;
  PSIParse *baseParse;
  uint8_t buf[4];
  PSIQuery *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (self->_baseParse)
  {
    datedParses = self->_datedParses;
    PLSearchBackendQueryGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    p_super = v4;
    if (datedParses)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v6 = "Photos Search PSIQuery: processDatedParses already called";
LABEL_7:
        _os_log_impl(&dword_199541000, p_super, OS_LOG_TYPE_ERROR, v6, buf, 2u);
      }
    }
    else
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v14 = self;
        _os_log_impl(&dword_199541000, p_super, OS_LOG_TYPE_INFO, "Photos Search PSIQuery: processing dates: %@", buf, 0xCu);
      }

      v7 = (void *)objc_opt_class();
      baseParse = self->_baseParse;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &baseParse, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "datedParsesWithParses:", v8);
      v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v10 = self->_datedParses;
      self->_datedParses = v9;

      objc_msgSend((id)objc_opt_class(), "datedParsesWithParses:", self->_implicitelyTokenizedParses);
      v11 = (NSArray *)objc_claimAutoreleasedReturnValue();
      p_super = &self->_implicitlyTokenizedDatedParses->super;
      self->_implicitlyTokenizedDatedParses = v11;
    }
  }
  else
  {
    PLSearchBackendQueryGetLog();
    p_super = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v6 = "Photos Search PSIQuery: processDatedParses called before bootstrap";
      goto LABEL_7;
    }
  }

}

- (void)processWordEmbeddings
{
  NSObject *v3;
  const char *v4;
  id WeakRetained;
  id v6;
  id v7;
  unint64_t v8;
  uint64_t v9;
  NSArray *v10;
  NSDictionary *v11;
  void *v12;
  PSIParse *baseParse;
  id v14;
  NSArray *wordEmbeddingParses;
  NSArray *v16;
  NSDictionary *substitutionsByStringToken;
  NSDictionary *v18;
  _QWORD v19[5];
  id v20;
  _QWORD v21[4];
  id v22;
  PSIQuery *v23;
  NSArray *v24;
  NSDictionary *v25;
  unint64_t v26;
  uint8_t buf[16];

  if (!self->_baseParse)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      return;
    *(_WORD *)buf = 0;
    v3 = MEMORY[0x1E0C81028];
    v4 = "Photos Search PSIQuery: processWordEmbeddings called before bootstrap";
    goto LABEL_7;
  }
  if (self->_wordEmbeddingParses)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      return;
    *(_WORD *)buf = 0;
    v3 = MEMORY[0x1E0C81028];
    v4 = "Photos Search PSIQuery: processWordEmbeddings already called";
LABEL_7:
    _os_log_error_impl(&dword_199541000, v3, OS_LOG_TYPE_ERROR, v4, buf, 2u);
    return;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v8 = self->_wordEmbeddingMode & 3;
    v9 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __33__PSIQuery_processWordEmbeddings__block_invoke;
    v21[3] = &unk_1E36684A0;
    v22 = WeakRetained;
    v23 = self;
    v26 = v8;
    v10 = (NSArray *)v6;
    v24 = v10;
    v11 = (NSDictionary *)v7;
    v25 = v11;
    v12 = (void *)MEMORY[0x19AEC174C](v21);
    baseParse = self->_baseParse;
    v19[0] = v9;
    v19[1] = 3221225472;
    v19[2] = __33__PSIQuery_processWordEmbeddings__block_invoke_3;
    v19[3] = &unk_1E36684F0;
    v19[4] = self;
    v20 = v12;
    v14 = v12;
    -[PSIParse enumerateTokensUsingBlock:](baseParse, "enumerateTokensUsingBlock:", v19);
    wordEmbeddingParses = self->_wordEmbeddingParses;
    self->_wordEmbeddingParses = v10;
    v16 = v10;

    substitutionsByStringToken = self->_substitutionsByStringToken;
    self->_substitutionsByStringToken = v11;
    v18 = v11;

  }
}

- (BOOL)recursiveAddToGroupResults:(id)a3 aggregate:(id)a4 atIndex:(unint64_t)a5 outOf:(unint64_t)a6 inGroupArrays:(id)a7 dateFilter:(id)a8 datedTokens:(id)a9 disableWildcardMatchesForUserControlledCategories:(BOOL)a10
{
  id v16;
  int v17;
  void *v18;
  id WeakRetained;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v29;
  unint64_t v30;
  PSIQuery *v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id obj;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v35 = a3;
  v16 = a4;
  v34 = a7;
  v33 = a8;
  v31 = self;
  v32 = a9;
  if (-[PSIQuery isCanceled](self, "isCanceled"))
  {
    LOBYTE(v17) = 0;
    goto LABEL_26;
  }
  if (a5 != a6)
  {
    objc_msgSend(v34, "objectAtIndex:", a5);
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    if (!v21)
    {
      LOBYTE(v17) = 0;
      goto LABEL_25;
    }
    v22 = v21;
    v17 = 0;
    v23 = *(_QWORD *)v38;
    v30 = a5 + 1;
    while (1)
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v38 != v23)
          objc_enumerationMutation(obj);
        v25 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        if (objc_msgSend(v25, "category") == 2100)
        {
          objc_msgSend(v16, "filenameGroupInAggregate");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (v26)
          {
            v27 = objc_msgSend(v25, "groupId");
            if (v27 != objc_msgSend(v26, "groupId"))
            {

              continue;
            }
          }

        }
        if (objc_msgSend(v16, "pushGroup:disableWildcardMatchesForUserControlledCategories:", v25, a10))
        {
          LOBYTE(v29) = a10;
          v17 |= -[PSIQuery recursiveAddToGroupResults:aggregate:atIndex:outOf:inGroupArrays:dateFilter:datedTokens:disableWildcardMatchesForUserControlledCategories:](v31, "recursiveAddToGroupResults:aggregate:atIndex:outOf:inGroupArrays:dateFilter:datedTokens:disableWildcardMatchesForUserControlledCategories:", v35, v16, v30, a6, v34, v33, v32, v29);
          objc_msgSend(v16, "pop");
        }
      }
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      if (!v22)
      {
LABEL_25:

        goto LABEL_26;
      }
    }
  }
  if (v35)
  {
    v18 = (void *)objc_msgSend(v16, "newGroupResultWithDateFilter:datedTokens:", v33, v32);
    if (v18)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v18, "setDelegate:", WeakRetained);

      objc_msgSend(v16, "transientToken");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setTransientToken:", v20);

      objc_msgSend(v35, "addObject:", v18);
    }

  }
  LOBYTE(v17) = 1;
LABEL_26:

  return v17 & 1;
}

- (id)processParse:(id)a3 disableWildcardMatchesForUserControlledCategories:(BOOL)a4
{
  uint64_t v5;
  void *v6;
  BOOL v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t i;
  void *v18;
  __CFSet *v19;
  int v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  NSObject *v25;
  const char *v26;
  id v27;
  id v28;
  void *v29;
  BOOL v30;
  _BOOL4 v31;
  NSObject *v32;
  os_signpost_id_t v33;
  NSObject *v34;
  unint64_t v35;
  NSObject *v36;
  os_signpost_id_t v37;
  NSObject *v38;
  unint64_t v39;
  void *v40;
  uint64_t v41;
  _BOOL4 v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  PSIGroupAggregate *v47;
  void *v48;
  PSIGroupAggregate *v49;
  void *v50;
  BOOL v51;
  void *v52;
  uint64_t v53;
  unint64_t v54;
  _BOOL4 v55;
  uint64_t v56;
  void *v57;
  id v58;
  BOOL v59;
  char v60;
  void *v61;
  uint64_t v63;
  void *v64;
  void *v66;
  id WeakRetained;
  void *v68;
  id v69;
  id v70;
  id v71;
  _QWORD v72[5];
  _QWORD v73[4];
  id v74;
  PSIQuery *v75;
  id v76;
  id v77;
  uint64_t *v78;
  uint64_t *v79;
  uint8_t *v80;
  uint64_t *v81;
  _BYTE *v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  uint64_t v87;
  uint64_t *v88;
  uint64_t v89;
  char v90;
  uint64_t v91;
  uint64_t *v92;
  uint64_t v93;
  char v94;
  uint64_t v95;
  uint64_t *v96;
  uint64_t v97;
  uint64_t (*v98)(uint64_t, uint64_t);
  void (*v99)(uint64_t);
  id v100;
  _QWORD v101[5];
  uint64_t v102;
  uint64_t *v103;
  uint64_t v104;
  char v105;
  _BYTE values[12];
  _BYTE v107[24];
  char v108;
  uint8_t v109[128];
  uint8_t buf[8];
  _BYTE v111[24];
  void (*v112)(uint64_t);
  id v113;
  _QWORD v114[4];

  v114[1] = *MEMORY[0x1E0C80C00];
  v70 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)&buf[4] = MEMORY[0x1E0C83948];
    *(_WORD *)v111 = 2112;
    *(_QWORD *)&v111[2] = v70;
    *(_WORD *)&v111[10] = 2112;
    *(_QWORD *)&v111[12] = self;
    _os_log_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Photos Search PSIQuery: process parse %d: %@ for query: %@", buf, 0x1Cu);
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v5 = objc_msgSend(v70, "numberOfTokens");
    v102 = 0;
    v103 = &v102;
    v104 = 0x2020000000;
    v105 = 1;
    v101[0] = MEMORY[0x1E0C809B0];
    v101[1] = 3221225472;
    v101[2] = __75__PSIQuery_processParse_disableWildcardMatchesForUserControlledCategories___block_invoke;
    v101[3] = &unk_1E3668518;
    v101[4] = &v102;
    objc_msgSend(v70, "enumerateTokensUsingBlock:", v101);
    objc_msgSend(v70, "dateFilter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v7 = -[NSArray count](self->_identifierTokens, "count") == 0;
    else
      v7 = 0;
    if (!*((_BYTE *)v103 + 24))
      v7 = 0;
    *((_BYTE *)v103 + 24) = v7;

    if (*((_BYTE *)v103 + 24))
    {
      objc_msgSend(v70, "dateFilter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "datedTokens");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "groupResultWithDateFilter:datedTokens:", v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        v114[0] = v11;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v114, 1);
        v8 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v8 = (id)MEMORY[0x1E0C9AA60];
      }
LABEL_92:

      _Block_object_dispose(&v102, 8);
      goto LABEL_93;
    }
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v5);
    v68 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v5);
    v69 = v12;
    v66 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", v5);
    *(_QWORD *)buf = 0;
    *(_QWORD *)v111 = buf;
    *(_QWORD *)&v111[8] = 0x3032000000;
    *(_QWORD *)&v111[16] = __Block_byref_object_copy__32850;
    v112 = __Block_byref_object_dispose__32851;
    v113 = 0;
    v95 = 0;
    v96 = &v95;
    v97 = 0x3032000000;
    v98 = __Block_byref_object_copy__32850;
    v99 = __Block_byref_object_dispose__32851;
    v100 = 0;
    v91 = 0;
    v92 = &v91;
    v93 = 0x2020000000;
    v94 = 0;
    v87 = 0;
    v88 = &v87;
    v89 = 0x2020000000;
    v90 = 0;
    v85 = 0u;
    v86 = 0u;
    v83 = 0u;
    v84 = 0u;
    v13 = self->_identifierTokens;
    v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v83, v109, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v84;
      v16 = MEMORY[0x1E0C81028];
      while (2)
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v84 != v15)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * i);
          v19 = -[PSIQuery _idsOfGroupsMatchingToken:](self, "_idsOfGroupsMatchingToken:", v18);
          v20 = objc_msgSend(v18, "isFilterTypeToken");
          if (v20)
            *((_BYTE *)v92 + 24) = 1;
          if (!v19)
          {

            v27 = 0;
            v8 = (id)MEMORY[0x1E0C9AA60];
            goto LABEL_91;
          }
          objc_msgSend(v12, "addObject:", v18);
          if (v20)
          {
            *((_BYTE *)v88 + 24) = 1;
            if (CFSetGetCount(v19) != 1)
              goto LABEL_29;
            *(_QWORD *)values = 0;
            CFSetGetValues(v19, (const void **)values);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)values);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v66, "addObject:", v21);

            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)v107 = 138412546;
              *(_QWORD *)&v107[4] = v18;
              *(_WORD *)&v107[12] = 2112;
              *(_QWORD *)&v107[14] = self;
              _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_INFO, "Photos Search PSIQuery: Filter token: %@ submitted for query:%@", v107, 0x16u);
            }
          }
          objc_msgSend(v68, "addObject:", v19);
        }
        v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v83, v109, 16);
        if (v14)
          continue;
        break;
      }
    }
LABEL_29:

    *(_QWORD *)v107 = 0;
    *(_QWORD *)&v107[8] = v107;
    *(_QWORD *)&v107[16] = 0x2020000000;
    v108 = 0;
    v73[0] = MEMORY[0x1E0C809B0];
    v73[1] = 3221225472;
    v73[2] = __75__PSIQuery_processParse_disableWildcardMatchesForUserControlledCategories___block_invoke_30;
    v73[3] = &unk_1E3668540;
    v22 = v12;
    v74 = v22;
    v75 = self;
    v78 = &v91;
    v79 = &v87;
    v23 = v66;
    v76 = v23;
    v24 = v68;
    v77 = v24;
    v80 = buf;
    v81 = &v95;
    v82 = v107;
    objc_msgSend(v70, "enumerateTokensUsingBlock:", v73);
    v69 = v22;
    if (*(_BYTE *)(*(_QWORD *)&v107[8] + 24))
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
LABEL_33:
        v27 = 0;
        v8 = (id)MEMORY[0x1E0C9AA60];
        goto LABEL_90;
      }
      *(_DWORD *)values = 138412290;
      *(_QWORD *)&values[4] = self;
      v25 = MEMORY[0x1E0C81028];
      v26 = "Photos Search PSIQuery: Some tokens have no result for query: %@";
LABEL_32:
      _os_log_impl(&dword_199541000, v25, OS_LOG_TYPE_INFO, v26, values, 0xCu);
      goto LABEL_33;
    }
    if (*((_BYTE *)v92 + 24) && !*((_BYTE *)v88 + 24))
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        goto LABEL_33;
      *(_DWORD *)values = 138412290;
      *(_QWORD *)&values[4] = self;
      v25 = MEMORY[0x1E0C81028];
      v26 = "Photos Search PSIQuery: GroupIds not found for any filter tokens; there will be no result for query: %@";
      goto LABEL_32;
    }
    v28 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (-[PSIQuery isCanceled](self, "isCanceled"))
    {
      v27 = 0;
    }
    else
    {
      objc_msgSend(v70, "dateFilter");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v72[0] = MEMORY[0x1E0C809B0];
      v72[1] = 3221225472;
      v72[2] = __75__PSIQuery_processParse_disableWildcardMatchesForUserControlledCategories___block_invoke_31;
      v72[3] = &unk_1E3668568;
      v72[4] = self;
      objc_msgSend(WeakRetained, "groupArraysFromGroupIdSets:dateFilter:searchResultTypes:progressBlock:", v24, v29, 3, v72);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      HIDWORD(v63) = -[PSIQuery isCanceled](self, "isCanceled");
      if ((v63 & 0x100000000) != 0)
      {
        v27 = 0;
      }
      else
      {
        if (objc_msgSend(v23, "count"))
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)values = 138412290;
            *(_QWORD *)&values[4] = self;
            _os_log_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Photos Search PSIQuery: Filter tokens submitted for query:%@", values, 0xCu);
          }
          v30 = +[PSIQuery _shouldApplyFilterTokensForGroupArrays:searchTokens:filterGroupIds:](PSIQuery, "_shouldApplyFilterTokensForGroupArrays:searchTokens:filterGroupIds:", v64, v22, v23);
          v31 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO);
          if (v30)
          {
            if (v31)
            {
              *(_DWORD *)values = 138412290;
              *(_QWORD *)&values[4] = self;
              _os_log_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Photos Search PSIQuery: Applying filter tokens; merging assetIDs for query:%@",
                values,
                0xCu);
            }
            PLPhotosSearchGetLog();
            v32 = objc_claimAutoreleasedReturnValue();
            v33 = -[PSIQuery mergeFilterTokenAssetIDsIntervalID](self, "mergeFilterTokenAssetIDsIntervalID");
            if (v33 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
            {
              *(_WORD *)values = 0;
              _os_signpost_emit_with_name_impl(&dword_199541000, v32, OS_SIGNPOST_INTERVAL_BEGIN, v33, "MergeFilterTokenAssetIDs", ", values, 2u);
            }

            PLPhotosSearchGetLog();
            v34 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
            {
              v35 = -[PSIQuery mergeFilterTokenAssetIDsIntervalID](self, "mergeFilterTokenAssetIDsIntervalID");
              *(_DWORD *)values = 134217984;
              *(_QWORD *)&values[4] = v35;
              _os_log_impl(&dword_199541000, v34, OS_LOG_TYPE_DEFAULT, "Signpost interval begin with ID: %llu", values, 0xCu);
            }

            v71 = 0;
            +[PSIQuery _aggregateAssetIdsOnFilterGroupsInGroupArrays:searchTokens:groupIdToOriginalAssetIdsMap:](PSIQuery, "_aggregateAssetIdsOnFilterGroupsInGroupArrays:searchTokens:groupIdToOriginalAssetIdsMap:", v64, v22, &v71);
            v27 = v71;
            PLPhotosSearchGetLog();
            v36 = objc_claimAutoreleasedReturnValue();
            v37 = -[PSIQuery mergeFilterTokenAssetIDsIntervalID](self, "mergeFilterTokenAssetIDsIntervalID");
            if (v37 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
            {
              *(_WORD *)values = 0;
              _os_signpost_emit_with_name_impl(&dword_199541000, v36, OS_SIGNPOST_INTERVAL_END, v37, "MergeFilterTokenAssetIDs", ", values, 2u);
            }

            PLPhotosSearchGetLog();
            v38 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
            {
              v39 = -[PSIQuery mergeFilterTokenAssetIDsIntervalID](self, "mergeFilterTokenAssetIDsIntervalID");
              *(_DWORD *)values = 134217984;
              *(_QWORD *)&values[4] = v39;
              _os_log_impl(&dword_199541000, v38, OS_LOG_TYPE_DEFAULT, "Signpost interval end with ID: %llu", values, 0xCu);
            }

            +[PSIQuery _indexesToRemoveForDuplicatedFilterGroupsinGroupArrays:searchTokens:](PSIQuery, "_indexesToRemoveForDuplicatedFilterGroupsinGroupArrays:searchTokens:", v64, v22);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = objc_msgSend(v40, "count");
            v42 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO);
            if (v41)
            {
              if (v42)
              {
                *(_DWORD *)values = 138412290;
                *(_QWORD *)&values[4] = self;
                _os_log_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Photos Search PSIQuery: Removing a subset of filter tokens for query:%@", values, 0xCu);
              }
              +[PSIQuery _restoreAssetIdsForGroupsInGroupArrays:atRemovalIndexes:groupIdToOriginalAssetIdsMap:searchTokens:](PSIQuery, "_restoreAssetIdsForGroupsInGroupArrays:atRemovalIndexes:groupIdToOriginalAssetIdsMap:searchTokens:", v64, v40, v27, v22);
            }
            else if (v42)
            {
              *(_DWORD *)values = 138412290;
              *(_QWORD *)&values[4] = self;
              _os_log_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Photos Search PSIQuery: All filter tokens applied for query:%@", values, 0xCu);
            }
          }
          else
          {
            if (v31)
            {
              *(_DWORD *)values = 138412290;
              *(_QWORD *)&values[4] = self;
              _os_log_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Photos Search PSIQuery: Removing filter tokens for query:%@", values, 0xCu);
            }
            +[PSIQuery _indexesOfFilterTokensInSearchTokens:](PSIQuery, "_indexesOfFilterTokensInSearchTokens:", v22);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = 0;
          }
          if (objc_msgSend(v40, "count"))
          {
            v43 = (void *)objc_msgSend(v64, "mutableCopy");
            v44 = (void *)objc_msgSend(v22, "mutableCopy");
            objc_msgSend(v44, "removeObjectsAtIndexes:", v40);
            objc_msgSend(v43, "removeObjectsAtIndexes:", v40);
            v45 = objc_msgSend(v44, "copy");

            v46 = objc_msgSend(v43, "copy");
            v64 = (void *)v46;
            v69 = (id)v45;
          }

        }
        else
        {
          v27 = 0;
        }
        -[PSIQuery _postProcessPersonGroupsInGroupArrays:](self, "_postProcessPersonGroupsInGroupArrays:", v64);
        v47 = [PSIGroupAggregate alloc];
        objc_msgSend(WeakRetained, "groupResultsQueue");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = -[PSIGroupAggregate initWithSearchTokens:groupResultsQueue:](v47, "initWithSearchTokens:groupResultsQueue:", v69, v48);

        objc_msgSend(*(id *)(*(_QWORD *)v111 + 40), "extendedWord");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = objc_msgSend(v50, "length") == 0;

        if (!v51)
        {
          objc_msgSend(*(id *)(*(_QWORD *)v111 + 40), "extendedWord");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          -[PSIGroupAggregate setTransientToken:](v49, "setTransientToken:", v52);

        }
        v53 = objc_msgSend(v64, "count");
        v54 = self->_wordEmbeddingMode & 3;
        v55 = v54 == 3 || *(_QWORD *)(*(_QWORD *)v111 + 40) == 0;
        objc_msgSend(v70, "datedTokens");
        v56 = objc_claimAutoreleasedReturnValue();
        v57 = (void *)v56;
        if (v55)
          v58 = v28;
        else
          v58 = 0;
        LOBYTE(v63) = a4;
        v59 = -[PSIQuery recursiveAddToGroupResults:aggregate:atIndex:outOf:inGroupArrays:dateFilter:datedTokens:disableWildcardMatchesForUserControlledCategories:](self, "recursiveAddToGroupResults:aggregate:atIndex:outOf:inGroupArrays:dateFilter:datedTokens:disableWildcardMatchesForUserControlledCategories:", v58, v49, 0, v53, v64, v29, v56, v63);

        v60 = v54 < 2 || v59;
        if ((v60 & 1) == 0 && *(_QWORD *)(*(_QWORD *)v111 + 40))
        {
          -[NSDictionary objectForKeyedSubscript:](self->_substitutionsByStringToken, "objectForKeyedSubscript:", v96[5]);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "removeObject:", *(_QWORD *)(*(_QWORD *)v111 + 40));

        }
      }

      if ((v63 & 0x100000000) != 0)
      {
        v8 = (id)MEMORY[0x1E0C9AA60];
LABEL_89:

LABEL_90:
        _Block_object_dispose(v107, 8);
LABEL_91:
        _Block_object_dispose(&v87, 8);
        _Block_object_dispose(&v91, 8);
        _Block_object_dispose(&v95, 8);

        _Block_object_dispose(buf, 8);
        v11 = v69;
        goto LABEL_92;
      }
    }
    v8 = v28;
    goto LABEL_89;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)&buf[4] = MEMORY[0x1E0C83948];
    *(_WORD *)v111 = 2112;
    *(_QWORD *)&v111[2] = v70;
    *(_WORD *)&v111[10] = 2112;
    *(_QWORD *)&v111[12] = self;
    _os_log_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Photos Search PSIQuery: cannot process parse %d: %@ for query: %@ because the delegate is nil", buf, 0x1Cu);
  }
  v8 = (id)MEMORY[0x1E0C9AA60];
LABEL_93:

  return v8;
}

- (void)computeSuggestions
{
  id v3;
  NSDictionary *substitutionsByStringToken;
  NSDictionary *v5;
  NSDictionary *substitutions;
  NSDictionary *v7;
  _QWORD v8[4];
  NSDictionary *v9;
  uint8_t buf[16];

  if (self->_substitutionsByStringToken)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    substitutionsByStringToken = self->_substitutionsByStringToken;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __30__PSIQuery_computeSuggestions__block_invoke;
    v8[3] = &unk_1E366B960;
    v5 = (NSDictionary *)v3;
    v9 = v5;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](substitutionsByStringToken, "enumerateKeysAndObjectsUsingBlock:", v8);
    substitutions = self->_substitutions;
    self->_substitutions = v5;
    v7 = v5;

  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "PSIQuery computeSuggestions called before processWordEmbeddings", buf, 2u);
  }
}

- (void)enumerateParsesWithMode:(unint64_t)a3 usingBlock:(id)a4
{
  char v4;
  id v6;
  void (**v7)(_QWORD, _QWORD);
  PSIParse *baseParse;
  void *v9;
  NSArray *datedParses;
  NSArray *implicitlyTokenizedDatedParses;
  BOOL v12;
  NSArray *wordEmbeddingParses;
  _QWORD v14[4];
  void (**v15)(_QWORD, _QWORD);
  uint64_t *v16;
  uint64_t *v17;
  _QWORD v18[4];
  void (**v19)(_QWORD, _QWORD);
  uint64_t *v20;
  uint64_t *v21;
  _QWORD v22[4];
  void (**v23)(_QWORD, _QWORD);
  uint64_t *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  _BYTE v33[8];

  v4 = a3;
  v6 = a4;
  v7 = (void (**)(_QWORD, _QWORD))v6;
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33[0] = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  if ((v4 & 1) == 0
    || !self->_baseParseCouldHaveResults
    || (baseParse = self->_baseParse,
        v29 = 1,
        (*((void (**)(id, PSIParse *, _QWORD, _BYTE *))v6 + 2))(v6, baseParse, 0, v33),
        !*((_BYTE *)v31 + 24)))
  {
    if ((v4 & 2) != 0
      && self->_implicitlyTokenizedParsesCouldHaveResults
      && -[NSArray count](self->_implicitelyTokenizedParses, "count"))
    {
      -[NSArray firstObject](self->_implicitelyTokenizedParses, "firstObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      ++v27[3];
      ((void (**)(_QWORD, void *))v7)[2](v7, v9);

    }
    if (!*((_BYTE *)v31 + 24))
    {
      if ((v4 & 4) == 0)
        goto LABEL_12;
      datedParses = self->_datedParses;
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __47__PSIQuery_enumerateParsesWithMode_usingBlock___block_invoke;
      v22[3] = &unk_1E3668590;
      v23 = v7;
      v24 = &v26;
      v25 = &v30;
      -[NSArray enumerateObjectsUsingBlock:](datedParses, "enumerateObjectsUsingBlock:", v22);

      if (!*((_BYTE *)v31 + 24))
      {
LABEL_12:
        if ((~v4 & 6) != 0)
        {
          v12 = 0;
          if ((v4 & 8) == 0)
            goto LABEL_9;
        }
        else
        {
          implicitlyTokenizedDatedParses = self->_implicitlyTokenizedDatedParses;
          v18[0] = MEMORY[0x1E0C809B0];
          v18[1] = 3221225472;
          v18[2] = __47__PSIQuery_enumerateParsesWithMode_usingBlock___block_invoke_2;
          v18[3] = &unk_1E3668590;
          v19 = v7;
          v20 = &v26;
          v21 = &v30;
          -[NSArray enumerateObjectsUsingBlock:](implicitlyTokenizedDatedParses, "enumerateObjectsUsingBlock:", v18);

          v12 = *((_BYTE *)v31 + 24) != 0;
          if ((v4 & 8) == 0)
            goto LABEL_9;
        }
        if (!v12)
        {
          wordEmbeddingParses = self->_wordEmbeddingParses;
          v14[0] = MEMORY[0x1E0C809B0];
          v14[1] = 3221225472;
          v14[2] = __47__PSIQuery_enumerateParsesWithMode_usingBlock___block_invoke_3;
          v14[3] = &unk_1E3668590;
          v15 = v7;
          v16 = &v26;
          v17 = &v30;
          -[NSArray enumerateObjectsUsingBlock:](wordEmbeddingParses, "enumerateObjectsUsingBlock:", v14);

        }
      }
    }
  }
LABEL_9:
  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v30, 8);

}

- (id)suggestionWhitelistedScenes
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "suggestionWhitelistedScenes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_postProcessPersonGroupsInGroupArrays:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  void *v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  id v18;
  NSArray *socialGroupPersonIdentifiers;
  void *v20;
  id v21;
  id v22;
  void (**v23)(_QWORD, _QWORD, _QWORD, _QWORD);
  NSArray *v24;
  void *v25;
  id v26;
  unint64_t v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  BOOL v34;
  uint64_t k;
  void *v36;
  void *v37;
  void *v38;
  id WeakRetained;
  void *v40;
  PSIQuery *v41;
  void *v42;
  id obj;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _QWORD v48[4];
  id v49;
  id v50;
  PSIQuery *v51;
  id v52;
  id v53;
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
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v41 = self;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v64, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v59;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v59 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
        v54 = 0u;
        v55 = 0u;
        v56 = 0u;
        v57 = 0u;
        v10 = v9;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v54, v63, 16);
        if (v11)
        {
          v12 = v11;
          v13 = 0;
          v14 = 0;
          v15 = *(_QWORD *)v55;
          do
          {
            for (j = 0; j != v12; ++j)
            {
              if (*(_QWORD *)v55 != v15)
                objc_enumerationMutation(v10);
              v17 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * j);
              if (objc_msgSend(v17, "category") == 1300)
              {
                if ((v13 & 1) != 0)
                  goto LABEL_20;
                v18 = v17;

                v13 = 1;
                v14 = v18;
              }
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v54, v63, 16);
          }
          while (v12);

          if ((v13 & 1) != 0)
          {
            objc_msgSend(v42, "addObject:", v14);
            socialGroupPersonIdentifiers = v41->_socialGroupPersonIdentifiers;
            objc_msgSend(v14, "lookupIdentifier");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(socialGroupPersonIdentifiers) = -[NSArray containsObject:](socialGroupPersonIdentifiers, "containsObject:", v20);

            if ((_DWORD)socialGroupPersonIdentifiers)
              objc_msgSend(v40, "addObject:", v14);
          }
        }
        else
        {
          v14 = 0;
LABEL_20:

        }
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v64, 16);
    }
    while (v6);
  }

  if ((unint64_t)objc_msgSend(v42, "count") >= 2)
  {
    v48[0] = MEMORY[0x1E0C809B0];
    v48[1] = 3221225472;
    v48[2] = __50__PSIQuery__postProcessPersonGroupsInGroupArrays___block_invoke_3;
    v48[3] = &unk_1E36685F8;
    v21 = WeakRetained;
    v49 = v21;
    v22 = v40;
    v52 = &__block_literal_global_39;
    v53 = &__block_literal_global_41;
    v50 = v22;
    v51 = v41;
    v23 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x19AEC174C](v48);
    v24 = v41->_socialGroupPersonIdentifiers;
    if (v24)
    {
      PLSearchSocialGroupLookupIdentifier(v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, id, _QWORD))v23)[2](v23, v25, v22, 0);

    }
    if ((objc_msgSend(v42, "isEqualToSet:", v22) & 1) == 0)
    {
      v26 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v27 = objc_msgSend(v42, "count");
      if (v27 >= 3)
      {
        objc_msgSend(v21, "meNodeIdentifier");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v28 = 0;
      }
      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      v29 = v42;
      v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v44, v62, 16);
      if (v30)
      {
        v31 = v30;
        v32 = *(_QWORD *)v45;
        v34 = v27 < 3 || v28 == 0;
        do
        {
          for (k = 0; k != v31; ++k)
          {
            if (*(_QWORD *)v45 != v32)
              objc_enumerationMutation(v29);
            objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * k), "lookupIdentifier");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = v36;
            if (v36 && (v34 || (objc_msgSend(v36, "isEqualToString:", v28) & 1) == 0))
              objc_msgSend(v26, "addObject:", v37);

          }
          v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v44, v62, 16);
        }
        while (v31);
      }

      PLSearchSocialGroupLookupIdentifier(v26);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, id, uint64_t))v23)[2](v23, v38, v29, 1);

    }
  }

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  const __CFString *v6;
  unsigned __int8 v7;
  const __CFString *v8;
  const __CFString *v9;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@:%p\n"), v5, self);

  objc_msgSend(v3, "appendFormat:", CFSTR("tokens: %@\n"), self->_queryTokens);
  if (-[PSIQuery isCanceled](self, "isCanceled"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("canceled: %@\n"), v6);
  v7 = atomic_load((unsigned __int8 *)&self->_didStart);
  if ((v7 & 1) != 0)
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("didStart: %@\n"), v8);
  if (self->_useWildcardText)
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("useWildcardText: %@\n"), v9);
  objc_msgSend(v3, "appendFormat:", CFSTR("matchedSceneIdentifiers: %@\n"), self->_sceneIdentifiers);
  objc_msgSend(v3, "appendFormat:", CFSTR("matchedPersonIdentifiers: %@\n"), self->_personIdentifiers);
  objc_msgSend(v3, "appendFormat:", CFSTR("matchedAudioIdentifiers: %@\n"), self->_audioIdentifiers);
  objc_msgSend(v3, "appendFormat:", CFSTR("matchedHumanActionIdentifiers: %@\n"), self->_humanActionIdentifiers);
  return v3;
}

- (PSIQuery)initWithQueryTokensV2:(id)a3 searchText:(id)a4 scopedSearchIdentifiers:(id)a5 searchResultTypes:(unint64_t)a6 searchSuggestionType:(unint64_t)a7 useWildcardText:(BOOL)a8 enableExactMatchPrioritization:(BOOL)a9 delegate:(id)a10 libraryScope:(unint64_t)a11 suggestionLimit:(unint64_t)a12
{
  _BOOL8 v12;
  id v19;
  PSIQuery *v20;
  PSIQuery *v21;

  v12 = a8;
  v19 = a5;
  v20 = -[PSIQuery initWithQueryTokens:searchText:useWildcardText:delegate:libraryScope:](self, "initWithQueryTokens:searchText:useWildcardText:delegate:libraryScope:", a3, a4, v12, a10, a11);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_scopedSearchIdentifiers, a5);
    v21->_searchResultTypes = a6;
    v21->_searchSuggestionType = a7;
    v21->_suggestionLimit = a12;
    v21->_enableExactMatchPrioritization = a9;
  }

  return v21;
}

- (void)runWithResultsHandlerV2:(id)a3
{
  void (**v5)(id, _QWORD);
  id WeakRetained;
  BOOL *p_didStart;
  unsigned __int8 v8;
  NSObject *v9;
  const __CFString *v10;
  const __CFString *v11;
  void *v12;
  uint8_t buf[4];
  PSIQuery *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, _QWORD))a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PSIQuery.m"), 1077, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("searchResultsHandler"));

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  p_didStart = &self->_didStart;
  do
    v8 = __ldaxr((unsigned __int8 *)p_didStart);
  while (__stlxr(1u, (unsigned __int8 *)p_didStart));
  if ((v8 & 1) != 0 || -[PSIQuery isCanceled](self, "isCanceled") || !WeakRetained)
  {
    PLSearchBackendQueryGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      if ((v8 & 1) != 0)
        v10 = CFSTR("yes");
      else
        v10 = CFSTR("no");
      *(_DWORD *)buf = 138413058;
      if (-[PSIQuery isCanceled](self, "isCanceled"))
        v11 = CFSTR("yes");
      else
        v11 = CFSTR("no");
      v14 = self;
      v15 = 2112;
      v16 = v10;
      v17 = 2112;
      v18 = v11;
      v19 = 2112;
      v20 = WeakRetained;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_INFO, "Will not execute search query: %@, hadAlreadyStarted = %@, isCancelled = %@, delegate = %@", buf, 0x2Au);
    }

    v5[2](v5, 0);
  }
  else
  {
    objc_msgSend(WeakRetained, "executeQueryV2:resultsHandler:", self, v5);
  }

}

- (id)runLookupIdentifierQuery
{
  PSIQueryDelegate **p_delegate;
  id WeakRetained;
  PLSearchResultV2 *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __CFSet *v13;
  void *v14;
  unint64_t v15;
  id v16;
  uint64_t v17;
  PLSearchResultV2 *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  char v27;
  char v28;
  char v29;
  void *v30;
  void *v31;
  PLSearchResultV2 *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v37;
  void *v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_alloc_init(PLSearchResultV2);
  if (!-[NSArray count](self->_socialGroupPersonIdentifiers, "count"))
  {
    -[PSIQuery queryTokens](self, "queryTokens");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "count");

    if (v20 != 1)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PSIQuery.m"), 1120, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.queryTokens.count == 1"));

    }
    -[PSIQuery queryTokens](self, "queryTokens");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "firstObject");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "identifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "length");

    if (!v23)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PSIQuery.m"), 1124, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queryToken.identifier.length > 0"));

    }
    v24 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v7, "identifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "groupForLookupIdentifier:searchResultTypes:", v25, -[PSIQuery searchResultTypes](self, "searchResultTypes"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v26)
      goto LABEL_23;
    v27 = -[PSIQuery searchResultTypes](self, "searchResultTypes");
    v28 = -[PSIQuery searchResultTypes](self, "searchResultTypes");
    v29 = v28;
    if ((v27 & 1) != 0)
    {
      objc_msgSend(WeakRetained, "assetUUIDsForAssetIDs:", objc_msgSend(v26, "assetIds"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v29 & 2) != 0)
        goto LABEL_19;
    }
    else
    {
      v30 = 0;
      if ((v28 & 2) != 0)
      {
LABEL_19:
        objc_msgSend(WeakRetained, "collectionUUIDsForCollectionIDs:", objc_msgSend(v26, "collectionIds"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_22:
        v32 = [PLSearchResultV2 alloc];
        objc_msgSend(v30, "allObjects");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "allObjects");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = -[PLSearchResultV2 initWithAssetUUIDs:collectionUUIDs:suggestions:](v32, "initWithAssetUUIDs:collectionUUIDs:suggestions:", v33, v34, 0);

        v6 = (PLSearchResultV2 *)v35;
LABEL_23:
        v18 = v6;

        goto LABEL_24;
      }
    }
    v31 = 0;
    goto LABEL_22;
  }
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  -[PSIQuery queryTokens](self, "queryTokens");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v41;
LABEL_4:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v41 != v11)
        objc_enumerationMutation(v8);
      v13 = -[PSIQuery _idsOfGroupsMatchingToken:](self, "_idsOfGroupsMatchingToken:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * v12));
      if (!v13)
        break;
      objc_msgSend(v7, "addObject:", v13);
      if (v10 == ++v12)
      {
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
        if (v10)
          goto LABEL_4;
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:

    objc_msgSend(WeakRetained, "groupArraysFromGroupIdSets:dateFilter:searchResultTypes:progressBlock:", v7, 0, -[PSIQuery searchResultTypes](self, "searchResultTypes"), &__block_literal_global_76);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSIQuery _postProcessPersonGroupsInGroupArrays:](self, "_postProcessPersonGroupsInGroupArrays:", v8);
    -[PSIQuery queryTokens](self, "queryTokens");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[PSIQuery searchResultTypes](self, "searchResultTypes");
    v16 = objc_loadWeakRetained((id *)p_delegate);
    BYTE2(v39) = 0;
    LOWORD(v39) = 1;
    +[PSIQuery searchResultFromArrayOfGroupArrays:searchTokens:searchResultTypes:suggestionType:scopedSearchIdentifiers:normalizedSearchText:enableExactMatchPrioritization:includeAllQueryMatchedGroups:includeAllFruitfulMatchedGroups:suggestionLimit:query:delegate:](PSIQuery, "searchResultFromArrayOfGroupArrays:searchTokens:searchResultTypes:suggestionType:scopedSearchIdentifiers:normalizedSearchText:enableExactMatchPrioritization:includeAllQueryMatchedGroups:includeAllFruitfulMatchedGroups:suggestionLimit:query:delegate:", v8, v14, v15, 0, 0, 0, v39, 0, self, v16);
    v17 = objc_claimAutoreleasedReturnValue();

    v6 = (PLSearchResultV2 *)v17;
  }
  v18 = v6;

LABEL_24:
  return v18;
}

- (id)processParseV2:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  PLSearchResultV2 *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  NSArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  uint64_t v25;
  __CFSet *v26;
  uint64_t v27;
  NSObject *v28;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  BOOL v34;
  unint64_t v35;
  id v36;
  uint64_t v37;
  BOOL v38;
  BOOL v39;
  unint64_t v40;
  unint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  id WeakRetained;
  _QWORD v46[5];
  _QWORD v47[5];
  NSObject *v48;
  NSObject *v49;
  _BYTE *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _QWORD v55[5];
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  char v59;
  uint8_t v60[128];
  _BYTE buf[24];
  void *v62;
  __int16 v63;
  PSIQuery *v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  PLSearchBackendQueryGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v4;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = self;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_INFO, "Process parse: %@ for query: %@", buf, 0x16u);
    }

    v7 = objc_msgSend(v4, "numberOfTokens");
    v56 = 0;
    v57 = &v56;
    v58 = 0x2020000000;
    v59 = 1;
    v55[0] = MEMORY[0x1E0C809B0];
    v55[1] = 3221225472;
    v55[2] = __27__PSIQuery_processParseV2___block_invoke;
    v55[3] = &unk_1E3668518;
    v55[4] = &v56;
    objc_msgSend(v4, "enumerateTokensUsingBlock:", v55);
    objc_msgSend(v4, "dateFilter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      v9 = -[NSArray count](self->_identifierTokens, "count") == 0;
    else
      v9 = 0;
    if (!*((_BYTE *)v57 + 24))
      v9 = 0;
    *((_BYTE *)v57 + 24) = v9;

    if (*((_BYTE *)v57 + 24))
    {
      PLPhotosSearchGetLog();
      v11 = (id)objc_claimAutoreleasedReturnValue();
      v12 = os_signpost_id_generate(v11);

      v13 = v11;
      v14 = v13;
      if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_199541000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "PLSearchDateQuerySignpost", ", buf, 2u);
      }

      objc_msgSend(v4, "dateFilter");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSIQuery scopedSearchIdentifiers](self, "scopedSearchIdentifiers");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "searchResultV2WithDateFilter:scopedSearchIdentifiers:searchResultTypes:suggestionType:", v15, v16, -[PSIQuery searchResultTypes](self, "searchResultTypes"), -[PSIQuery searchSuggestionType](self, "searchSuggestionType"));
      v10 = (PLSearchResultV2 *)objc_claimAutoreleasedReturnValue();

      v17 = v14;
      v18 = v17;
      if (v12 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v17))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_199541000, v18, OS_SIGNPOST_INTERVAL_END, v12, "PLSearchDateQuerySignpost", ", buf, 2u);
      }

      PLSearchBackendQueryGetLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v4, "dateFilter");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        *(_QWORD *)&buf[4] = v10;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v4;
        *(_WORD *)&buf[22] = 2112;
        v62 = v20;
        v63 = 2112;
        v64 = self;
        _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_INFO, "Generated search result: %@ for parse: %@ with date filter %@ for query: %@", buf, 0x2Au);

      }
    }
    else
    {
      v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v7);
      v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v7);
      v53 = 0u;
      v54 = 0u;
      v51 = 0u;
      v52 = 0u;
      v21 = self->_identifierTokens;
      v22 = -[NSArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
      if (v22)
      {
        v23 = *(_QWORD *)v52;
        while (2)
        {
          for (i = 0; i != v22; ++i)
          {
            if (*(_QWORD *)v52 != v23)
              objc_enumerationMutation(v21);
            v25 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * i);
            v26 = -[PSIQuery _idsOfGroupsMatchingToken:](self, "_idsOfGroupsMatchingToken:", v25);
            if (!v26)
            {
              PLSearchBackendQueryGetLog();
              v28 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412546;
                *(_QWORD *)&buf[4] = v25;
                *(_WORD *)&buf[12] = 2112;
                *(_QWORD *)&buf[14] = self;
                _os_log_impl(&dword_199541000, v28, OS_LOG_TYPE_INFO, "Token: %@ has no matching group ids for query: %@, returning nil for query", buf, 0x16u);
              }

              v10 = 0;
              goto LABEL_36;
            }
            -[NSObject addObject:](v18, "addObject:", v25);
            -[NSObject addObject:](v19, "addObject:", v26);
          }
          v22 = -[NSArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
          if (v22)
            continue;
          break;
        }
      }

      v27 = MEMORY[0x1E0C809B0];
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      LOBYTE(v62) = 0;
      v47[0] = MEMORY[0x1E0C809B0];
      v47[1] = 3221225472;
      v47[2] = __27__PSIQuery_processParseV2___block_invoke_81;
      v47[3] = &unk_1E3668620;
      v47[4] = self;
      v18 = v18;
      v48 = v18;
      v19 = v19;
      v49 = v19;
      v50 = buf;
      objc_msgSend(v4, "enumerateTokensUsingBlock:", v47);
      if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24) || -[PSIQuery isCanceled](self, "isCanceled"))
      {
        v10 = 0;
      }
      else
      {
        objc_msgSend(v4, "dateFilter");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v46[0] = v27;
        v46[1] = 3221225472;
        v46[2] = __27__PSIQuery_processParseV2___block_invoke_82;
        v46[3] = &unk_1E3668568;
        v46[4] = self;
        objc_msgSend(WeakRetained, "groupArraysFromGroupIdSets:dateFilter:searchResultTypes:progressBlock:", v19, v30, -[PSIQuery searchResultTypes](self, "searchResultTypes"), v46);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[PSIQuery isCanceled](self, "isCanceled"))
        {
          v10 = 0;
        }
        else if (objc_msgSend(v31, "count"))
        {
          if (objc_msgSend(v4, "isImplicitlyTokenizedParse"))
            self->_searchSuggestionType = 0;
          -[PSIQuery searchText](self, "searchText");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v32, "length"))
          {
            -[NSObject lastObject](v18, "lastObject");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "normalizedText");
            v44 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v44 = 0;
          }

          -[PSIQuery _postProcessPersonGroupsInGroupArrays:](self, "_postProcessPersonGroupsInGroupArrays:", v31);
          v42 = (void *)objc_opt_class();
          v41 = -[PSIQuery searchResultTypes](self, "searchResultTypes");
          v40 = -[PSIQuery searchSuggestionType](self, "searchSuggestionType");
          -[PSIQuery scopedSearchIdentifiers](self, "scopedSearchIdentifiers");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = -[PSIQuery enableExactMatchPrioritization](self, "enableExactMatchPrioritization");
          v38 = -[PSIQuery includeAllQueryMatchedGroups](self, "includeAllQueryMatchedGroups");
          v34 = -[PSIQuery includeAllFruitfulMatchedGroups](self, "includeAllFruitfulMatchedGroups");
          v35 = -[PSIQuery suggestionLimit](self, "suggestionLimit");
          v36 = objc_loadWeakRetained((id *)&self->_delegate);
          BYTE2(v37) = v34;
          BYTE1(v37) = v38;
          LOBYTE(v37) = v39;
          objc_msgSend(v42, "searchResultFromArrayOfGroupArrays:searchTokens:searchResultTypes:suggestionType:scopedSearchIdentifiers:normalizedSearchText:enableExactMatchPrioritization:includeAllQueryMatchedGroups:includeAllFruitfulMatchedGroups:suggestionLimit:query:delegate:", v31, v18, v41, v40, v43, v44, v37, v35, self, v36);
          v10 = (PLSearchResultV2 *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v10 = objc_alloc_init(PLSearchResultV2);
        }

      }
      _Block_object_dispose(buf, 8);
    }
LABEL_36:

    _Block_object_dispose(&v56, 8);
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v4;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = self;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_ERROR, "Cannot process parse: %@ for query: %@ because delegate is nil", buf, 0x16u);
    }

    v10 = 0;
  }

  return v10;
}

- (PSIQuery)initWithQueryText:(id)a3 suggestionType:(unint64_t)a4 suggestionLimit:(unint64_t)a5 resultTypes:(unint64_t)a6 delegate:(id)a7 libraryScope:(unint64_t)a8
{
  PSIQuery *result;

  result = -[PSIQuery initWithQueryTokens:searchText:useWildcardText:delegate:libraryScope:](self, "initWithQueryTokens:searchText:useWildcardText:delegate:libraryScope:", MEMORY[0x1E0C9AA60], a3, 1, a7, a8);
  if (result)
  {
    result->_searchSuggestionType = a4;
    result->_suggestionLimit = a5;
    result->_searchResultTypes = a6;
  }
  return result;
}

- (PSIQuery)initWithEmbeddingModelTypes:(id)a3 assetUUID:(id)a4 delegate:(id)a5
{
  id v9;
  id v10;
  id v11;
  PSIQuery *v12;
  PSIQuery *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PSIQuery;
  v12 = -[PSIQuery init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeWeak((id *)&v12->_delegate, v11);
    objc_storeStrong((id *)&v13->_queryAssetUUID, a4);
    objc_storeStrong((id *)&v13->_modelTypes, a3);
  }

  return v13;
}

- (void)runFetchEmbeddingQueryWitBatchHandler:(id)a3
{
  id v4;
  id WeakRetained;
  BOOL *p_didStart;
  unsigned __int8 v7;
  NSObject *v8;
  const __CFString *v9;
  const __CFString *v10;
  int v11;
  PSIQuery *v12;
  __int16 v13;
  const __CFString *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  p_didStart = &self->_didStart;
  do
    v7 = __ldaxr((unsigned __int8 *)p_didStart);
  while (__stlxr(1u, (unsigned __int8 *)p_didStart));
  if ((v7 & 1) != 0 || -[PSIQuery isCanceled](self, "isCanceled") || !WeakRetained)
  {
    PLSearchBackendQueryGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      if ((v7 & 1) != 0)
        v9 = CFSTR("yes");
      else
        v9 = CFSTR("no");
      v11 = 138413058;
      if (-[PSIQuery isCanceled](self, "isCanceled"))
        v10 = CFSTR("yes");
      else
        v10 = CFSTR("no");
      v12 = self;
      v13 = 2112;
      v14 = v9;
      v15 = 2112;
      v16 = v10;
      v17 = 2112;
      v18 = WeakRetained;
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_INFO, "Will not execute search query: %@, hadAlreadyStarted = %@, isCancelled = %@, delegate = %@", (uint8_t *)&v11, 0x2Au);
    }

  }
  else
  {
    objc_msgSend(WeakRetained, "executeFetchEmbeddingQuery:batchHandler:", self, v4);
  }

}

- (NSArray)queryTokens
{
  return self->_queryTokens;
}

- (NSString)searchText
{
  return self->_searchText;
}

- (BOOL)legacyDisableTopAssetsAndTopCollections
{
  return self->_legacyDisableTopAssetsAndTopCollections;
}

- (void)setLegacyDisableTopAssetsAndTopCollections:(BOOL)a3
{
  self->_legacyDisableTopAssetsAndTopCollections = a3;
}

- (unint64_t)wordEmbeddingMode
{
  return self->_wordEmbeddingMode;
}

- (void)setWordEmbeddingMode:(unint64_t)a3
{
  self->_wordEmbeddingMode = a3;
}

- (NSDictionary)substitutions
{
  return self->_substitutions;
}

- (void)setSubstitutions:(id)a3
{
  objc_storeStrong((id *)&self->_substitutions, a3);
}

- (unint64_t)numberOfNextKeywordSuggestionToProcess
{
  return self->_numberOfNextKeywordSuggestionToProcess;
}

- (void)setNumberOfNextKeywordSuggestionToProcess:(unint64_t)a3
{
  self->_numberOfNextKeywordSuggestionToProcess = a3;
}

- (NSArray)nextKeywordSuggestions
{
  return self->_nextKeywordSuggestions;
}

- (void)setNextKeywordSuggestions:(id)a3
{
  objc_storeStrong((id *)&self->_nextKeywordSuggestions, a3);
}

- (NSSet)sceneIdentifiers
{
  return self->_sceneIdentifiers;
}

- (void)setSceneIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (NSSet)personIdentifiers
{
  return self->_personIdentifiers;
}

- (void)setPersonIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (NSSet)audioIdentifiers
{
  return self->_audioIdentifiers;
}

- (void)setAudioIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (NSSet)humanActionIdentifiers
{
  return self->_humanActionIdentifiers;
}

- (void)setHumanActionIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (NSArray)dedupedGroupResults
{
  return self->_dedupedGroupResults;
}

- (void)setDedupedGroupResults:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (NSSet)socialGroupExtendedAssetIds
{
  return &self->_socialGroupExtendedAssetIds->super;
}

- (void)setSocialGroupExtendedAssetIds:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSSet)socialGroupExtendedCollectionIds
{
  return &self->_socialGroupExtendedCollectionIds->super;
}

- (void)setSocialGroupExtendedCollectionIds:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (unint64_t)libraryScope
{
  return self->_libraryScope;
}

- (void)setLibraryScope:(unint64_t)a3
{
  self->_libraryScope = a3;
}

- (PSIQueryDelegate)delegate
{
  return (PSIQueryDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSSet)scopedSearchIdentifiers
{
  return self->_scopedSearchIdentifiers;
}

- (unint64_t)searchResultTypes
{
  return self->_searchResultTypes;
}

- (unint64_t)searchSuggestionType
{
  return self->_searchSuggestionType;
}

- (unint64_t)suggestionLimit
{
  return self->_suggestionLimit;
}

- (BOOL)enableExactMatchPrioritization
{
  return self->_enableExactMatchPrioritization;
}

- (BOOL)includeAllFruitfulMatchedGroups
{
  return self->_includeAllFruitfulMatchedGroups;
}

- (void)setIncludeAllFruitfulMatchedGroups:(BOOL)a3
{
  self->_includeAllFruitfulMatchedGroups = a3;
}

- (BOOL)includeAllQueryMatchedGroups
{
  return self->_includeAllQueryMatchedGroups;
}

- (void)setIncludeAllQueryMatchedGroups:(BOOL)a3
{
  self->_includeAllQueryMatchedGroups = a3;
}

- (NSDate)queryBeginParsingTime
{
  return self->_queryBeginParsingTime;
}

- (void)setQueryBeginParsingTime:(id)a3
{
  objc_storeStrong((id *)&self->_queryBeginParsingTime, a3);
}

- (double)elapsedTimeQueryParsing
{
  return self->_elapsedTimeQueryParsing;
}

- (void)setElapsedTimeQueryParsing:(double)a3
{
  self->_elapsedTimeQueryParsing = a3;
}

- (NSDate)queryBeginResultGenerationAndIntersectionsTime
{
  return self->_queryBeginResultGenerationAndIntersectionsTime;
}

- (void)setQueryBeginResultGenerationAndIntersectionsTime:(id)a3
{
  objc_storeStrong((id *)&self->_queryBeginResultGenerationAndIntersectionsTime, a3);
}

- (double)elapsedTimeResultGenerationAndIntersections
{
  return self->_elapsedTimeResultGenerationAndIntersections;
}

- (void)setElapsedTimeResultGenerationAndIntersections:(double)a3
{
  self->_elapsedTimeResultGenerationAndIntersections = a3;
}

- (NSIndexSet)modelTypes
{
  return self->_modelTypes;
}

- (NSString)queryAssetUUID
{
  return self->_queryAssetUUID;
}

- (unint64_t)mergeFilterTokenAssetIDsIntervalID
{
  return self->_mergeFilterTokenAssetIDsIntervalID;
}

- (void)setMergeFilterTokenAssetIDsIntervalID:(unint64_t)a3
{
  self->_mergeFilterTokenAssetIDsIntervalID = a3;
}

- (BOOL)useWildcardText
{
  return self->_useWildcardText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryAssetUUID, 0);
  objc_storeStrong((id *)&self->_modelTypes, 0);
  objc_storeStrong((id *)&self->_queryBeginResultGenerationAndIntersectionsTime, 0);
  objc_storeStrong((id *)&self->_queryBeginParsingTime, 0);
  objc_storeStrong((id *)&self->_scopedSearchIdentifiers, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dedupedGroupResults, 0);
  objc_storeStrong((id *)&self->_humanActionIdentifiers, 0);
  objc_storeStrong((id *)&self->_audioIdentifiers, 0);
  objc_storeStrong((id *)&self->_personIdentifiers, 0);
  objc_storeStrong((id *)&self->_sceneIdentifiers, 0);
  objc_storeStrong((id *)&self->_nextKeywordSuggestions, 0);
  objc_storeStrong((id *)&self->_substitutions, 0);
  objc_storeStrong((id *)&self->_searchText, 0);
  objc_storeStrong((id *)&self->_queryTokens, 0);
  objc_storeStrong((id *)&self->_socialGroupExtendedCollectionIds, 0);
  objc_storeStrong((id *)&self->_socialGroupExtendedAssetIds, 0);
  objc_storeStrong((id *)&self->_socialGroupPersonIdentifiers, 0);
  objc_storeStrong((id *)&self->_substitutionsByStringToken, 0);
  objc_storeStrong((id *)&self->_groupIdsByTokenKey, 0);
  objc_storeStrong((id *)&self->_identifierTokens, 0);
  objc_storeStrong((id *)&self->_wordEmbeddingParses, 0);
  objc_storeStrong((id *)&self->_implicitlyTokenizedDatedParses, 0);
  objc_storeStrong((id *)&self->_datedParses, 0);
  objc_storeStrong((id *)&self->_implicitelyTokenizedParses, 0);
  objc_storeStrong((id *)&self->_baseParse, 0);
}

uint64_t __27__PSIQuery_processParseV2___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "matchType");
  if (result != 3)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  return result;
}

void __27__PSIQuery_processParseV2___block_invoke_81(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  id v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  if (objc_msgSend(v6, "matchType") != 3)
  {
    v7 = objc_msgSend(*(id *)(a1 + 32), "_idsOfGroupsMatchingToken:", v6);
    if (v7)
    {
      v8 = v7;
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);
      objc_msgSend(*(id *)(a1 + 48), "addObject:", v8);
    }
    else
    {
      PLSearchBackendQueryGetLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v10 = *(_QWORD *)(a1 + 32);
        v11 = 138412546;
        v12 = v6;
        v13 = 2112;
        v14 = v10;
        _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_INFO, "Token: %@ has no matching group ids for query: %@, returning nil for query", (uint8_t *)&v11, 0x16u);
      }

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
      *a4 = 1;
    }
  }

}

uint64_t __27__PSIQuery_processParseV2___block_invoke_82(uint64_t a1, _BYTE *a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isCanceled");
  *a2 = result;
  return result;
}

void __50__PSIQuery__postProcessPersonGroupsInGroupArrays___block_invoke_3(uint64_t a1, void *a2, void *a3, int a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  void *v22;
  id v23;
  id v24;
  id obj;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _OWORD v32[4];
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  objc_msgSend(*(id *)(a1 + 32), "groupIdsMatchingString:categories:textIsSearchable:", v7, 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  memset(v32, 0, sizeof(v32));
  if (objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", v32, v34, 16))
  {
    v22 = v9;
    v23 = v8;
    v24 = v7;
    objc_msgSend(*(id *)(a1 + 32), "groupWithMatchingGroupId:dateFilter:searchResultTypes:", **((_QWORD **)&v32[0] + 1), 0, 3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    obj = *(id *)(a1 + 40);
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v11)
    {
      v12 = v11;
      v13 = 0;
      v14 = 0;
      v15 = *(_QWORD *)v29;
      do
      {
        v16 = 0;
        v17 = v13;
        do
        {
          if (*(_QWORD *)v29 != v15)
            objc_enumerationMutation(obj);
          v18 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v16);
          if ((a4 & 1) == 0)
          {
            v19 = *(_QWORD *)(a1 + 56);
            v27 = v14;
            (*(void (**)(uint64_t, id *, uint64_t))(v19 + 16))(v19, &v27, objc_msgSend(v18, "assetIds"));
            v20 = v27;

            v14 = v20;
          }
          v21 = *(_QWORD *)(a1 + 56);
          v26 = v17;
          (*(void (**)(uint64_t, id *, uint64_t))(v21 + 16))(v21, &v26, objc_msgSend(v18, "collectionIds"));
          v13 = v26;

          if (a4)
            objc_msgSend(v18, "unionCollectionIdsWithGroup:", v10);
          else
            objc_msgSend(v18, "unionIdsWithGroup:", v10);
          ++v16;
          v17 = v13;
        }
        while (v12 != v16);
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v12);
    }
    else
    {
      v13 = 0;
      v14 = 0;
    }

    v7 = v24;
    if ((a4 & 1) == 0)
      (*(void (**)(_QWORD, uint64_t, uint64_t, void *))(*(_QWORD *)(a1 + 64) + 16))(*(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48) + 104, objc_msgSend(v10, "assetIds"), v14);
    (*(void (**)(_QWORD, uint64_t, uint64_t, id))(*(_QWORD *)(a1 + 64) + 16))(*(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48) + 112, objc_msgSend(v10, "collectionIds"), v13);

    v9 = v22;
    v8 = v23;
  }

}

void __50__PSIQuery__postProcessPersonGroupsInGroupArrays___block_invoke_2(uint64_t a1, id *a2, uint64_t a3, void *a4)
{
  const __CFAllocator *v6;
  id v7;
  CFMutableSetRef obj;

  v6 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v7 = a4;
  obj = CFSetCreateMutable(v6, 0, 0);
  -[__CFSet addObjectsFromArray:](obj, "addObjectsFromArray:", a3);
  -[__CFSet minusSet:](obj, "minusSet:", v7);

  if (*a2)
    objc_msgSend(*a2, "intersectSet:", obj);
  else
    objc_storeStrong(a2, obj);

}

void __50__PSIQuery__postProcessPersonGroupsInGroupArrays___block_invoke(uint64_t a1, id *a2, uint64_t a3)
{
  CFMutableSetRef Mutable;

  Mutable = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0);
  -[__CFSet addObjectsFromArray:](Mutable, "addObjectsFromArray:", a3);
  if (*a2)
    objc_msgSend(*a2, "intersectSet:", Mutable);
  else
    *a2 = objc_retainAutorelease(Mutable);

}

uint64_t __47__PSIQuery_enumerateParsesWithMode_usingBlock___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  uint64_t result;

  v6 = a1[4];
  ++*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
  result = (*(uint64_t (**)(void))(v6 + 16))();
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = *a4;
  return result;
}

uint64_t __47__PSIQuery_enumerateParsesWithMode_usingBlock___block_invoke_2(_QWORD *a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  uint64_t result;

  v6 = a1[4];
  ++*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
  result = (*(uint64_t (**)(void))(v6 + 16))();
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = *a4;
  return result;
}

uint64_t __47__PSIQuery_enumerateParsesWithMode_usingBlock___block_invoke_3(_QWORD *a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  uint64_t result;

  v6 = a1[4];
  ++*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
  result = (*(uint64_t (**)(void))(v6 + 16))();
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = *a4;
  return result;
}

void __30__PSIQuery_computeSuggestions__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v17;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[3];
  _QWORD v24[3];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v17 = a2;
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v9);
        v23[0] = CFSTR("PLSearchWordEmbeddingsTextKey");
        objc_msgSend(v10, "word");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v24[0] = v11;
        v23[1] = CFSTR("PLSearchWordEmbeddingsPathKey");
        objc_msgSend(v10, "extendedWord");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v24[1] = v12;
        v23[2] = CFSTR("PLSearchWordEmbeddingsScoreKey");
        v13 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v10, "score");
        objc_msgSend(v13, "numberWithDouble:");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v24[2] = v14;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 3);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "addObject:", v15);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    }
    while (v7);
  }

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v17);
}

uint64_t __75__PSIQuery_processParse_disableWildcardMatchesForUserControlledCategories___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "matchType");
  if (result != 3)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  return result;
}

void __75__PSIQuery_processParse_disableWildcardMatchesForUserControlledCategories___block_invoke_30(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  const __CFSet *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  int v18;
  id v19;
  __int16 v20;
  uint64_t v21;
  void *values[2];

  values[1] = *(void **)MEMORY[0x1E0C80C00];
  v6 = a2;
  if (objc_msgSend(v6, "matchType") == 3)
    goto LABEL_15;
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
  v7 = (const __CFSet *)objc_msgSend(*(id *)(a1 + 40), "_idsOfGroupsMatchingToken:", v6);
  if (objc_msgSend(v6, "isFilterTypeToken"))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
    if (v7)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
      if (CFSetGetCount(v7) != 1)
        *a4 = 1;
      values[0] = 0;
      CFSetGetValues(v7, (const void **)values);
      v8 = *(void **)(a1 + 48);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", values[0]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v9);

      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        v10 = *(_QWORD *)(a1 + 40);
        v18 = 138412546;
        v19 = v6;
        v20 = 2112;
        v21 = v10;
        _os_log_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Photos Search PSIQuery: Filter token: %@ submitted for query:%@", (uint8_t *)&v18, 0x16u);
      }
      goto LABEL_9;
    }
LABEL_12:
    if ((objc_msgSend(v6, "isFilterTypeToken") & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "removeObject:", v6);
    }
    else
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = 1;
      *a4 = 1;
    }
    goto LABEL_15;
  }
  if (!v7)
    goto LABEL_12;
LABEL_9:
  objc_msgSend(*(id *)(a1 + 56), "addObject:", v7);
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40))
  {
    objc_msgSend(v6, "wordEmbeddingMatch");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v6, "wordEmbeddingMatch");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
      v14 = *(void **)(v13 + 40);
      *(_QWORD *)(v13 + 40) = v12;

      objc_msgSend(v6, "text");
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
      v17 = *(void **)(v16 + 40);
      *(_QWORD *)(v16 + 40) = v15;

    }
  }
LABEL_15:

}

uint64_t __75__PSIQuery_processParse_disableWildcardMatchesForUserControlledCategories___block_invoke_31(uint64_t a1, _BYTE *a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isCanceled");
  *a2 = result;
  return result;
}

void __33__PSIQuery_processWordEmbeddings__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[5];
  id v33;
  id v34;
  id v35;
  id v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(*(id *)(a1 + 32), "wordEmbeddingMatchesForToken:", a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
  {
    v30 = v8;
    v31 = v7;
    v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v11 = v9;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v39 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
          objc_msgSend(v16, "score", v30);
          v18 = v17;
          objc_msgSend(v16, "word");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectForKeyedSubscript:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "score");
          v22 = v21;

          if (v18 > v22)
          {
            objc_msgSend(v16, "word");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "setObject:forKeyedSubscript:", v16, v23);

          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      }
      while (v13);
    }

    v24 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __33__PSIQuery_processWordEmbeddings__block_invoke_2;
    v32[3] = &unk_1E3668478;
    v32[4] = *(_QWORD *)(a1 + 40);
    v7 = v31;
    v25 = v31;
    v26 = *(_QWORD *)(a1 + 64);
    v33 = v25;
    v37 = v26;
    v8 = v30;
    v36 = v30;
    v34 = *(id *)(a1 + 48);
    v35 = v24;
    v27 = v24;
    objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v32);
    v28 = *(void **)(a1 + 56);
    objc_msgSend(v25, "text");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setObject:forKeyedSubscript:", v27, v29);

  }
}

void __33__PSIQuery_processWordEmbeddings__block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[6];

  v5 = a2;
  if (objc_msgSend(v5, "usesWordEmbeddings"))
  {
    objc_msgSend(v5, "wildcardResolvedText");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __33__PSIQuery_processWordEmbeddings__block_invoke_4;
    v10[3] = &unk_1E36684C8;
    v7 = *(_QWORD *)(a1 + 40);
    v10[4] = *(_QWORD *)(a1 + 32);
    v10[5] = a3;
    (*(void (**)(uint64_t, void *, id, _QWORD *, uint64_t, uint64_t))(v7 + 16))(v7, v6, v5, v10, v8, v9);

  }
}

uint64_t __33__PSIQuery_processWordEmbeddings__block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "parseByReplacingTokenAtIndex:withToken:", *(_QWORD *)(a1 + 40), a2);
}

void __33__PSIQuery_processWordEmbeddings__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;

  v13 = a3;
  v5 = *(void **)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v7 = a2;
  v8 = objc_msgSend(v5, "_idsOfGroupsMatchingString:categories:textIsSearchable:isFilterTypeToken:", v7, 0, 1, objc_msgSend(v6, "isFilterTypeToken"));

  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 40), "tokenByWordEmbeddingWithMatch:", v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "setWordEmbeddingMatch:", v13);
      v11 = v13;
      if (*(_QWORD *)(a1 + 72) >= 2uLL)
      {
        (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          objc_msgSend(*(id *)(a1 + 48), "addObject:", v12);

        v11 = v13;
      }
      objc_msgSend(*(id *)(a1 + 56), "addObject:", v11);
    }

  }
}

void __39__PSIQuery_processImplicitTokenization__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "belongsToSearchText")
    && !objc_msgSend(*(id *)(a1 + 32), "_idsOfGroupsMatchingToken:", v6))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }

}

+ (void)bootstrap
{
  id v2;

  v2 = (id)objc_msgSend(MEMORY[0x1E0D513A0], "defaultManager");
}

+ (BOOL)_shouldApplyFilterTokensForGroupArrays:(id)a3 searchTokens:(id)a4 filterGroupIds:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 1;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __79__PSIQuery__shouldApplyFilterTokensForGroupArrays_searchTokens_filterGroupIds___block_invoke;
  v14[3] = &unk_1E3668620;
  v10 = v7;
  v15 = v10;
  v11 = v8;
  v16 = v11;
  v12 = v9;
  v17 = v12;
  v18 = &v19;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v14);
  LOBYTE(v9) = *((_BYTE *)v20 + 24);

  _Block_object_dispose(&v19, 8);
  return (char)v9;
}

+ (void)_aggregateAssetIdsOnFilterGroupsInGroupArrays:(id)a3 searchTokens:(id)a4 groupIdToOriginalAssetIdsMap:(id *)a5
{
  id v7;
  id v8;
  const __CFArray *Mutable;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  const __CFArray *v33;
  _BYTE v34[128];
  uint64_t v35;
  CFRange v36;

  v35 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (a5)
  {
    Mutable = CFArrayCreateMutable(0, 0, 0);
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v7, "count"));
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v7, "count"));
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __100__PSIQuery__aggregateAssetIdsOnFilterGroupsInGroupArrays_searchTokens_groupIdToOriginalAssetIdsMap___block_invoke;
    v29[3] = &unk_1E3668648;
    v23 = v8;
    v30 = v8;
    v24 = v7;
    v31 = v7;
    v33 = Mutable;
    v12 = v10;
    v32 = v12;
    objc_msgSend(v30, "enumerateObjectsUsingBlock:", v29);
    v36.length = CFArrayGetCount(Mutable);
    v36.location = 0;
    CFArraySortValues(Mutable, v36, (CFComparatorFunction)PSIRowIDCompare_32948, 0);
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v13 = v12;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v26 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v18, "groupId"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectForKeyedSubscript:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v20)
          {
            v21 = (void *)objc_msgSend((id)objc_msgSend(v18, "assetIds"), "copy");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v18, "groupId"));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "setObject:forKeyedSubscript:", v21, v22);

          }
          objc_msgSend(v18, "setAssetIds:", Mutable);
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
      }
      while (v15);
    }

    *a5 = (id)objc_msgSend(v11, "copy");
    CFRelease(Mutable);

    v8 = v23;
    v7 = v24;
  }

}

+ (id)_indexesToRemoveForDuplicatedFilterGroupsinGroupArrays:(id)a3 searchTokens:(id)a4
{
  id v5;
  id v6;
  id v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  if (!objc_msgSend(v6, "count"))
    goto LABEL_15;
  v8 = 0;
  do
  {
    if (!objc_msgSend(v6, "count"))
      goto LABEL_14;
    v9 = 0;
    while (1)
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "isFilterTypeToken"))
      {
        if ((objc_msgSend(v11, "isFilterTypeToken") & 1) == 0)
          break;
      }
LABEL_11:

      if (++v9 >= (unint64_t)objc_msgSend(v6, "count"))
        goto LABEL_14;
    }
    objc_msgSend(v5, "objectAtIndexedSubscript:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "count") == 1)
    {
      objc_msgSend(v13, "firstObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "containsObject:", v14))
        objc_msgSend(v7, "addIndex:", v8);

      goto LABEL_11;
    }

LABEL_14:
    ++v8;
  }
  while (v8 < objc_msgSend(v6, "count"));
LABEL_15:
  v15 = (void *)objc_msgSend(v7, "copy");

  return v15;
}

+ (id)_indexesOfFilterTokensInSearchTokens:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t);
  void *v12;
  id v13;
  id v14;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __49__PSIQuery__indexesOfFilterTokensInSearchTokens___block_invoke;
  v12 = &unk_1E3668670;
  v13 = v3;
  v14 = v4;
  v5 = v4;
  v6 = v3;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", &v9);
  v7 = (void *)objc_msgSend(v5, "copy", v9, v10, v11, v12);

  return v7;
}

+ (void)_restoreAssetIdsForGroupsInGroupArrays:(id)a3 atRemovalIndexes:(id)a4 groupIdToOriginalAssetIdsMap:(id)a5 searchTokens:(id)a6
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v8 = a3;
  v9 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __110__PSIQuery__restoreAssetIdsForGroupsInGroupArrays_atRemovalIndexes_groupIdToOriginalAssetIdsMap_searchTokens___block_invoke;
  v12[3] = &unk_1E3675358;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  objc_msgSend(a4, "enumerateIndexesUsingBlock:", v12);

}

+ (id)searchResultFromArrayOfGroupArrays:(id)a3 searchTokens:(id)a4 searchResultTypes:(unint64_t)a5 suggestionType:(unint64_t)a6 scopedSearchIdentifiers:(id)a7 normalizedSearchText:(id)a8 enableExactMatchPrioritization:(BOOL)a9 includeAllQueryMatchedGroups:(BOOL)a10 includeAllFruitfulMatchedGroups:(BOOL)a11 suggestionLimit:(unint64_t)a12 query:(id)a13 delegate:(id)a14
{
  id v20;
  id v21;
  id v22;
  void *v23;
  PLSearchResultV2 *v24;
  const __CFString *v25;
  const __CFString *v26;
  const __CFString *v27;
  const __CFString *v28;
  NSObject *v29;
  uint64_t v30;
  const __CFString *v31;
  BOOL v32;
  uint64_t v33;
  NSObject *v34;
  os_signpost_id_t v35;
  NSObject *v36;
  NSObject *v37;
  unint64_t v38;
  uint64_t v39;
  os_signpost_id_t v40;
  uint64_t v41;
  NSObject *v42;
  os_signpost_id_t v43;
  NSObject *v44;
  NSObject *v45;
  NSObject *v46;
  NSObject *v47;
  NSObject *v48;
  uint64_t v49;
  const char *v50;
  NSObject *v51;
  NSObject *v52;
  uint64_t v53;
  void *v54;
  NSObject *v55;
  os_signpost_id_t v56;
  NSObject *v57;
  NSObject *v58;
  const __CFArray *v59;
  CFIndex Count;
  const __CFArray *v61;
  CFIndex v62;
  NSObject *v63;
  NSObject *v64;
  PLSearchResultV2 *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  const void *v70;
  const void *v71;
  const void *v72;
  const void *v73;
  void *v75;
  void *v76;
  id v77;
  id v78;
  void *v80;
  id v81;
  id v82;
  id v83;
  _QWORD v84[4];
  id v85;
  id v86;
  uint64_t *v87;
  uint64_t *v88;
  BOOL v89;
  _QWORD v90[4];
  id v91;
  id v92;
  uint64_t *v93;
  _BYTE *v94;
  BOOL v95;
  uint64_t v96;
  uint64_t *v97;
  uint64_t v98;
  uint64_t v99;
  _QWORD v100[8];
  uint64_t v101;
  uint64_t *v102;
  uint64_t v103;
  uint64_t (*v104)(uint64_t, uint64_t);
  void (*v105)(uint64_t);
  id v106;
  uint64_t v107;
  uint64_t *v108;
  uint64_t v109;
  uint64_t (*v110)(uint64_t, uint64_t);
  void (*v111)(uint64_t);
  id v112;
  uint64_t v113;
  uint64_t *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t *v118;
  uint64_t v119;
  uint64_t v120;
  uint8_t v121[4];
  uint64_t v122;
  __int16 v123;
  unint64_t v124;
  _BYTE buf[24];
  const __CFString *v126;
  __int16 v127;
  const __CFString *v128;
  __int16 v129;
  uint64_t v130;
  uint64_t v131;

  v131 = *MEMORY[0x1E0C80C00];
  v20 = a3;
  v82 = a4;
  v83 = a7;
  v81 = a8;
  v21 = a13;
  v22 = a14;
  if (objc_msgSend(v20, "count"))
  {
    if (v22)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PSIQuery.m"), 1253, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("arrayOfGroupArrays.count > 0"));

    if (v22)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PSIQuery.m"), 1254, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("delegate"));

LABEL_3:
  +[PLScopedSearchUtilities filterArrayOfGroupsArraysForEqualMatchType:searchTokens:](PLScopedSearchUtilities, "filterArrayOfGroupsArraysForEqualMatchType:searchTokens:", v20, v82);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v23, "count"))
  {
    v117 = 0;
    v118 = &v117;
    v119 = 0x2020000000;
    v120 = 0;
    v113 = 0;
    v114 = &v113;
    v115 = 0x2020000000;
    v116 = 0;
    v107 = 0;
    v108 = &v107;
    v109 = 0x3032000000;
    v110 = __Block_byref_object_copy__32850;
    v111 = __Block_byref_object_dispose__32851;
    v112 = 0;
    v101 = 0;
    v102 = &v101;
    v103 = 0x3032000000;
    v104 = __Block_byref_object_copy__32850;
    v105 = __Block_byref_object_dispose__32851;
    v106 = 0;
    if (objc_msgSend(v83, "count"))
    {
      if (objc_msgSend(v21, "isCanceled"))
      {
        v24 = objc_alloc_init(PLSearchResultV2);
LABEL_104:
        _Block_object_dispose(&v101, 8);

        _Block_object_dispose(&v107, 8);
        _Block_object_dispose(&v113, 8);
        _Block_object_dispose(&v117, 8);
        goto LABEL_105;
      }
      v100[0] = MEMORY[0x1E0C809B0];
      v100[1] = 3221225472;
      v100[2] = __261__PSIQuery_searchResultFromArrayOfGroupArrays_searchTokens_searchResultTypes_suggestionType_scopedSearchIdentifiers_normalizedSearchText_enableExactMatchPrioritization_includeAllQueryMatchedGroups_includeAllFruitfulMatchedGroups_suggestionLimit_query_delegate___block_invoke;
      v100[3] = &unk_1E3668698;
      v100[4] = &v117;
      v100[5] = &v113;
      v100[6] = &v107;
      v100[7] = &v101;
      +[PLScopedSearchUtilities searchIndexIdsFromUUIDs:searchResultTypes:psiDatabase:completion:](PLScopedSearchUtilities, "searchIndexIdsFromUUIDs:searchResultTypes:psiDatabase:completion:", v83, a5, v22, v100);
    }
    if ((~(_BYTE)a5 & 3) != 0)
      v25 = CFSTR("assets");
    else
      v25 = CFSTR("assets & collections");
    v26 = CFSTR("collections");
    if ((a5 & 2) == 0)
      v26 = &stru_1E36789C0;
    if ((a5 & 1) != 0)
      v27 = v25;
    else
      v27 = v26;
    if (a6 == 2)
      v28 = CFSTR("next term");
    else
      v28 = CFSTR("none");
    PLSearchBackendQueryGetLog();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      v30 = objc_msgSend(v83, "count");
      v31 = CFSTR("completion");
      *(_DWORD *)buf = 138413314;
      if (a6 != 1)
        v31 = v28;
      *(_QWORD *)&buf[4] = v20;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = a1;
      *(_WORD *)&buf[22] = 2112;
      v126 = v27;
      v127 = 2112;
      v128 = v31;
      v129 = 2048;
      v130 = v30;
      _os_log_impl(&dword_199541000, v29, OS_LOG_TYPE_INFO, "Generating search result from group arrays: %@ for query: %@ with search result types:%@ suggestion type: %@ and %llu scoped identifiers", buf, 0x34u);
    }

    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v126 = 0;
    v96 = 0;
    v97 = &v96;
    v98 = 0x2020000000;
    v99 = 0;
    if (a6)
      v32 = a12 == 0;
    else
      v32 = 1;
    v33 = !v32;
    v77 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v78 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    if ((a5 & 1) != 0 && (objc_msgSend(v21, "isCanceled") & 1) == 0)
    {
      v90[0] = MEMORY[0x1E0C809B0];
      v90[1] = 3221225472;
      v90[2] = __261__PSIQuery_searchResultFromArrayOfGroupArrays_searchTokens_searchResultTypes_suggestionType_scopedSearchIdentifiers_normalizedSearchText_enableExactMatchPrioritization_includeAllQueryMatchedGroups_includeAllFruitfulMatchedGroups_suggestionLimit_query_delegate___block_invoke_101;
      v90[3] = &unk_1E36686C0;
      v95 = a9;
      v93 = &v117;
      v94 = buf;
      v91 = v77;
      v92 = v78;
      +[PLScopedSearchUtilities intersectGroups:searchResultTypes:shouldGenerateCompletionCandidates:query:completion:](PLScopedSearchUtilities, "intersectGroups:searchResultTypes:shouldGenerateCompletionCandidates:query:completion:", v23, 1, v33, v21, v90);

    }
    if ((a5 & 2) != 0 && (objc_msgSend(v21, "isCanceled") & 1) == 0)
    {
      v84[0] = MEMORY[0x1E0C809B0];
      v84[1] = 3221225472;
      v84[2] = __261__PSIQuery_searchResultFromArrayOfGroupArrays_searchTokens_searchResultTypes_suggestionType_scopedSearchIdentifiers_normalizedSearchText_enableExactMatchPrioritization_includeAllQueryMatchedGroups_includeAllFruitfulMatchedGroups_suggestionLimit_query_delegate___block_invoke_2;
      v84[3] = &unk_1E36686C0;
      v89 = a9;
      v87 = &v113;
      v88 = &v96;
      v85 = v77;
      v86 = v78;
      +[PLScopedSearchUtilities intersectGroups:searchResultTypes:shouldGenerateCompletionCandidates:query:completion:](PLScopedSearchUtilities, "intersectGroups:searchResultTypes:shouldGenerateCompletionCandidates:query:completion:", v23, 2, v33, v21, v84);

    }
    if (a6 == 1)
    {
      if ((objc_msgSend(v21, "isCanceled") & 1) == 0)
      {
        PLPhotosSearchGetLog();
        v34 = (id)objc_claimAutoreleasedReturnValue();
        v35 = os_signpost_id_generate(v34);

        v36 = v34;
        v37 = v36;
        v38 = v35 - 1;
        if (v35 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
        {
          *(_WORD *)v121 = 0;
          _os_signpost_emit_with_name_impl(&dword_199541000, v37, OS_SIGNPOST_INTERVAL_BEGIN, v35, "PLSearchCompletionSuggestionsSignpost", ", v121, 2u);
        }

        v39 = objc_msgSend(v81, "length");
        if (a12 && v39)
        {
          +[PLScopedSearchSuggestionGeneration generateCompletionSuggestionsFromGroups:queryMatchedScopedAssetIds:queryMatchedScopedCollectionIds:searchResultTypes:normalizedSearchText:delegate:](PLScopedSearchSuggestionGeneration, "generateCompletionSuggestionsFromGroups:queryMatchedScopedAssetIds:queryMatchedScopedCollectionIds:searchResultTypes:normalizedSearchText:delegate:", v77, *(_QWORD *)(*(_QWORD *)&buf[8] + 24), v97[3], a5, v81, v22);
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = v35;
        }
        else
        {
          PLSearchBackendQueryGetLog();
          v51 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v121 = 138412546;
            v122 = (uint64_t)a1;
            v123 = 2048;
            v124 = a12;
            _os_log_impl(&dword_199541000, v51, OS_LOG_TYPE_INFO, "No completions generated for query: %@ with maximum suggestion count: %lu, will not attempt to generate completion candidates", v121, 0x16u);
          }

          v40 = v35;
          v80 = (void *)MEMORY[0x1E0C9AA70];
        }
        v52 = v37;
        v47 = v52;
        if (v38 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v52))
        {
          *(_WORD *)v121 = 0;
          _os_signpost_emit_with_name_impl(&dword_199541000, v47, OS_SIGNPOST_INTERVAL_END, v40, "PLSearchCompletionSuggestionsSignpost", ", v121, 2u);
        }

        PLSearchBackendQueryGetLog();
        v48 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
          goto LABEL_65;
        v53 = objc_msgSend(v80, "count");
        *(_DWORD *)v121 = 134218242;
        v122 = v53;
        v123 = 2112;
        v124 = (unint64_t)a1;
        v50 = "Generated %llu completion suggestions for query: %@";
LABEL_64:
        _os_log_impl(&dword_199541000, v48, OS_LOG_TYPE_INFO, v50, v121, 0x16u);
LABEL_65:

LABEL_66:
        v41 = objc_msgSend(v80, "count");
        goto LABEL_67;
      }
    }
    else
    {
      v80 = 0;
      if (a6 != 2 || !a12)
        goto LABEL_66;
      if ((objc_msgSend(v21, "isCanceled") & 1) == 0)
      {
        PLPhotosSearchGetLog();
        v42 = (id)objc_claimAutoreleasedReturnValue();
        v43 = os_signpost_id_generate(v42);

        v44 = v42;
        v45 = v44;
        if (v43 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v44))
        {
          *(_WORD *)v121 = 0;
          _os_signpost_emit_with_name_impl(&dword_199541000, v45, OS_SIGNPOST_INTERVAL_BEGIN, v43, "PLSearchNextTokenSuggestionsSignpost", ", v121, 2u);
        }

        +[PLScopedSearchSuggestionGeneration generateNextTermSuggestionsForQueryMatchedScopedAssetIds:queryMatchedScopedCollectionIds:searchResultTypes:delegate:](PLScopedSearchSuggestionGeneration, "generateNextTermSuggestionsForQueryMatchedScopedAssetIds:queryMatchedScopedCollectionIds:searchResultTypes:delegate:", *(_QWORD *)(*(_QWORD *)&buf[8] + 24), v97[3], a5, v22);
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = v45;
        v47 = v46;
        if (v43 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v46))
        {
          *(_WORD *)v121 = 0;
          _os_signpost_emit_with_name_impl(&dword_199541000, v47, OS_SIGNPOST_INTERVAL_END, v43, "PLSearchNextTokenSuggestionsSignpost", ", v121, 2u);
        }

        PLSearchBackendQueryGetLog();
        v48 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
          goto LABEL_65;
        v49 = objc_msgSend(v80, "count");
        *(_DWORD *)v121 = 134218242;
        v122 = v49;
        v123 = 2112;
        v124 = (unint64_t)a1;
        v50 = "Generated %llu next term suggestions for query: %@";
        goto LABEL_64;
      }
    }
    v80 = 0;
    v41 = objc_msgSend(0, "count");
LABEL_67:
    if (v41 && (objc_msgSend(v21, "isCanceled") & 1) == 0)
    {
      PLPhotosSearchGetLog();
      v55 = (id)objc_claimAutoreleasedReturnValue();
      v56 = os_signpost_id_generate(v55);

      v57 = v55;
      v58 = v57;
      if (v56 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v57))
      {
        *(_WORD *)v121 = 0;
        _os_signpost_emit_with_name_impl(&dword_199541000, v58, OS_SIGNPOST_INTERVAL_BEGIN, v56, "PLSearchSuggestionRankingSignpost", ", v121, 2u);
      }

      v59 = *(const __CFArray **)(*(_QWORD *)&buf[8] + 24);
      if (v59)
        Count = CFArrayGetCount(v59);
      else
        Count = 0;
      v61 = (const __CFArray *)v97[3];
      if (v61)
        v62 = CFArrayGetCount(v61);
      else
        v62 = 0;
      +[PLScopedSearchSuggestionGeneration rankedSuggestionsFromSuggestionCandidates:suggestionType:queryAssetCount:queryCollectionCount:suggestionLimit:](PLScopedSearchSuggestionGeneration, "rankedSuggestionsFromSuggestionCandidates:suggestionType:queryAssetCount:queryCollectionCount:suggestionLimit:", v80, a6, Count, v62, a12);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = v58;
      v64 = v63;
      if (v56 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v63))
      {
        *(_WORD *)v121 = 0;
        _os_signpost_emit_with_name_impl(&dword_199541000, v64, OS_SIGNPOST_INTERVAL_END, v56, "PLSearchSuggestionRankingSignpost", ", v121, 2u);
      }

    }
    else
    {
      v54 = 0;
    }
    v65 = objc_alloc_init(PLSearchResultV2);
    if ((objc_msgSend(v21, "isCanceled") & 1) != 0)
    {
      v24 = v65;
LABEL_95:
      v70 = *(const void **)(*(_QWORD *)&buf[8] + 24);
      if (v70)
      {
        CFRelease(v70);
        *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = 0;
      }
      v71 = (const void *)v118[3];
      if (v71)
      {
        CFRelease(v71);
        v118[3] = 0;
      }
      v72 = (const void *)v97[3];
      if (v72)
      {
        CFRelease(v72);
        v97[3] = 0;
      }
      v73 = (const void *)v114[3];
      if (v73)
      {
        CFRelease(v73);
        v114[3] = 0;
      }

      _Block_object_dispose(&v96, 8);
      _Block_object_dispose(buf, 8);
      goto LABEL_104;
    }
    if ((a5 & 1) != 0)
    {
      +[PLScopedSearchUtilities UUIDsFromSearchIndexIds:searchIndexIdsToUUIDs:searchResultType:delegate:](PLScopedSearchUtilities, "UUIDsFromSearchIndexIds:searchIndexIdsToUUIDs:searchResultType:delegate:", *(_QWORD *)(*(_QWORD *)&buf[8] + 24), v108[5], 1, v22);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      if ((a5 & 2) == 0)
        goto LABEL_87;
    }
    else
    {
      v66 = (void *)MEMORY[0x1E0C9AA60];
      if ((a5 & 2) == 0)
      {
LABEL_87:
        v67 = (void *)MEMORY[0x1E0C9AA60];
LABEL_90:
        v24 = -[PLSearchResultV2 initWithAssetUUIDs:collectionUUIDs:suggestions:]([PLSearchResultV2 alloc], "initWithAssetUUIDs:collectionUUIDs:suggestions:", v66, v67, v54);

        if (a11)
        {
          +[PLScopedSearchUtilities generateFruitfulMatchedGroupsFromAllMatchedGroups:queryMatchedScopedAssetUUIDs:queryMatchedScopedCollectionUUIDs:searchResultTypes:delegate:](PLScopedSearchUtilities, "generateFruitfulMatchedGroupsFromAllMatchedGroups:queryMatchedScopedAssetUUIDs:queryMatchedScopedCollectionUUIDs:searchResultTypes:delegate:", v78, v66, v67, a5, v22);
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLSearchResultV2 setAllFruitfulScopedQueryMatchedGroups:](v24, "setAllFruitfulScopedQueryMatchedGroups:", v68);

        }
        if (a10)
        {
          +[PLScopedSearchUtilities groupDictionariesFromArrayOfGroupsArrays:](PLScopedSearchUtilities, "groupDictionariesFromArrayOfGroupsArrays:", v23);
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLSearchResultV2 setAllQueryMatchedGroups:](v24, "setAllQueryMatchedGroups:", v69);

        }
        goto LABEL_95;
      }
    }
    +[PLScopedSearchUtilities UUIDsFromSearchIndexIds:searchIndexIdsToUUIDs:searchResultType:delegate:](PLScopedSearchUtilities, "UUIDsFromSearchIndexIds:searchIndexIdsToUUIDs:searchResultType:delegate:", v97[3], v102[5], 2, v22);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_90;
  }
  v24 = objc_alloc_init(PLSearchResultV2);
LABEL_105:

  return v24;
}

void __261__PSIQuery_searchResultFromArrayOfGroupArrays_searchTokens_searchResultTypes_suggestionType_scopedSearchIdentifiers_normalizedSearchText_enableExactMatchPrioritization_includeAllQueryMatchedGroups_includeAllFruitfulMatchedGroups_suggestionLimit_query_delegate___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;

  v9 = a4;
  v10 = a5;
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = a2;
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = a3;
  v11 = *(_QWORD *)(a1[6] + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v9;
  v15 = v9;

  v13 = *(_QWORD *)(a1[7] + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v10;

}

void __261__PSIQuery_searchResultFromArrayOfGroupArrays_searchTokens_searchResultTypes_suggestionType_scopedSearchIdentifiers_normalizedSearchText_enableExactMatchPrioritization_includeAllQueryMatchedGroups_includeAllFruitfulMatchedGroups_suggestionLimit_query_delegate___block_invoke_101(uint64_t a1, const void *a2, const __CFArray *a3, void *a4, void *a5)
{
  const __CFArray *v6;
  const void *v7;
  id v9;
  id v10;
  CFIndex Count;
  int v12;
  const __CFArray *v13;
  const void *v14;

  v6 = a3;
  v7 = a2;
  v13 = a3;
  v14 = a2;
  v9 = a4;
  v10 = a5;
  if (v6)
  {
    Count = CFArrayGetCount(v6);
    LOBYTE(v12) = 1;
    if (*(_BYTE *)(a1 + 64) && Count)
      v12 = !+[PLScopedSearchUtilities shouldUseExactMatchResultsForGroups:](PLScopedSearchUtilities, "shouldUseExactMatchResultsForGroups:", v10);
  }
  else
  {
    LOBYTE(v12) = 1;
  }
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    if ((v12 & 1) != 0)
    {
      +[PLScopedSearchUtilities intersectSortedArray:withOtherSortedArray:intersectionLimit:](PLScopedSearchUtilities, "intersectSortedArray:withOtherSortedArray:intersectionLimit:", &v14);
      v7 = v14;
      goto LABEL_10;
    }
    +[PLScopedSearchUtilities intersectSortedArray:withOtherSortedArray:intersectionLimit:](PLScopedSearchUtilities, "intersectSortedArray:withOtherSortedArray:intersectionLimit:", &v13);
    v6 = v13;
  }
  else if ((v12 & 1) != 0)
  {
LABEL_10:
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v7;
    if (v6)
    {
      CFRelease(v6);
      v13 = 0;
    }
    goto LABEL_15;
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v6;
  if (v7)
  {
    CFRelease(v7);
    v14 = 0;
  }
LABEL_15:
  objc_msgSend(*(id *)(a1 + 32), "unionSet:", v9, v13, v14);
  objc_msgSend(*(id *)(a1 + 40), "unionSet:", v10);

}

void __261__PSIQuery_searchResultFromArrayOfGroupArrays_searchTokens_searchResultTypes_suggestionType_scopedSearchIdentifiers_normalizedSearchText_enableExactMatchPrioritization_includeAllQueryMatchedGroups_includeAllFruitfulMatchedGroups_suggestionLimit_query_delegate___block_invoke_2(uint64_t a1, const void *a2, const __CFArray *a3, void *a4, void *a5)
{
  const __CFArray *v6;
  const void *v7;
  id v9;
  id v10;
  CFIndex Count;
  int v12;
  const __CFArray *v13;
  const void *v14;

  v6 = a3;
  v7 = a2;
  v13 = a3;
  v14 = a2;
  v9 = a4;
  v10 = a5;
  if (v6)
  {
    Count = CFArrayGetCount(v6);
    LOBYTE(v12) = 1;
    if (*(_BYTE *)(a1 + 64) && Count)
      v12 = !+[PLScopedSearchUtilities shouldUseExactMatchResultsForGroups:](PLScopedSearchUtilities, "shouldUseExactMatchResultsForGroups:", v10);
  }
  else
  {
    LOBYTE(v12) = 1;
  }
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    if ((v12 & 1) != 0)
    {
      +[PLScopedSearchUtilities intersectSortedArray:withOtherSortedArray:intersectionLimit:](PLScopedSearchUtilities, "intersectSortedArray:withOtherSortedArray:intersectionLimit:", &v14);
      v7 = v14;
      goto LABEL_10;
    }
    +[PLScopedSearchUtilities intersectSortedArray:withOtherSortedArray:intersectionLimit:](PLScopedSearchUtilities, "intersectSortedArray:withOtherSortedArray:intersectionLimit:", &v13);
    v6 = v13;
  }
  else if ((v12 & 1) != 0)
  {
LABEL_10:
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v7;
    if (v6)
    {
      CFRelease(v6);
      v13 = 0;
    }
    goto LABEL_15;
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v6;
  if (v7)
  {
    CFRelease(v7);
    v14 = 0;
  }
LABEL_15:
  objc_msgSend(*(id *)(a1 + 32), "unionSet:", v9, v13, v14);
  objc_msgSend(*(id *)(a1 + 40), "unionSet:", v10);

}

void __110__PSIQuery__restoreAssetIdsForGroupsInGroupArrays_atRemovalIndexes_groupIdToOriginalAssetIdsMap_searchTokens___block_invoke(uint64_t a1, unint64_t a2, _BYTE *a3)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  if (objc_msgSend(*(id *)(a1 + 32), "count") <= a2)
    *a3 = 1;
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a2);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count") != 1)
    *a3 = 1;
  objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v6, "groupId"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
    *a3 = 1;
  objc_msgSend(v6, "setAssetIds:", v9);

}

void __49__PSIQuery__indexesOfFilterTokensInSearchTokens___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isFilterTypeToken"))
    objc_msgSend(*(id *)(a1 + 40), "addIndex:", a3);

}

void __100__PSIQuery__aggregateAssetIdsOnFilterGroupsInGroupArrays_searchTokens_groupIdToOriginalAssetIdsMap___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  CFIndex Count;
  __CFArray *v10;
  const __CFArray *v11;
  id v12;
  CFRange v13;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "isFilterTypeToken"))
  {
    objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count") != 1)
      *a4 = 1;
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    Count = CFArrayGetCount((CFArrayRef)objc_msgSend(v8, "assetIds"));
    v10 = *(__CFArray **)(a1 + 56);
    v11 = (const __CFArray *)objc_msgSend(v8, "assetIds");
    v13.location = 0;
    v13.length = Count;
    CFArrayAppendArray(v10, v11, v13);
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v8);

  }
}

void __79__PSIQuery__shouldApplyFilterTokensForGroupArrays_searchTokens_filterGroupIds___block_invoke(uint64_t a1, void *a2, unint64_t a3, _BYTE *a4)
{
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint8_t buf[4];
  unint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a2, "isFilterTypeToken") & 1) == 0)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "count") <= a3)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v11 = *(_QWORD *)(a1 + 32);
        v12 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 134218498;
        v15 = a3;
        v16 = 2112;
        v17 = v11;
        v18 = 2112;
        v19 = v12;
        _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Attempted to access a group at out of bounds index: %lu from group arrays: %@, for search: %@", buf, 0x20u);
      }
      *a4 = 1;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "count") == 1)
      {
        objc_msgSend(v13, "firstObject");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "groupId");

        v9 = *(void **)(a1 + 48);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v9) = objc_msgSend(v9, "containsObject:", v10);

        if ((_DWORD)v9)
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
          *a4 = 1;
        }
      }

    }
  }
}

@end
