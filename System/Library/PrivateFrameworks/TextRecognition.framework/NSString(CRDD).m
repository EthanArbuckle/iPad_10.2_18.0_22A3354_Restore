@implementation NSString(CRDD)

- (id)_crDDFriendlyTextWithIndexMapping:()CRDD
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  id v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unint64_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  _QWORD v41[4];
  id v42;
  _QWORD v43[4];
  id v44;
  _QWORD v45[4];
  id v46;
  _QWORD v47[4];
  id v48;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v51;
  __int16 v52;
  int v53;
  __int16 v54;
  uint64_t v55;
  __int16 v56;
  uint64_t v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v4 = a1;
  v5 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__NSString_CRDD___crDDFriendlyTextWithIndexMapping___block_invoke;
  block[3] = &unk_1E98DB338;
  v40 = v4;
  block[4] = v4;
  if (qword_1ED0B4758 != -1)
    dispatch_once(&qword_1ED0B4758, block);
  v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", v40);
  objc_msgSend(v32, "applyRegex:withReplacementTemplate:", qword_1ED0B4720, &__block_literal_global_71);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "applyRegex:withReplacementTemplate:", qword_1ED0B4728, &__block_literal_global_74);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "applyRegex:withReplacementTemplate:", qword_1ED0B4730, &__block_literal_global_77);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = qword_1ED0B4738;
  v47[0] = v5;
  v47[1] = 3221225472;
  v47[2] = __52__NSString_CRDD___crDDFriendlyTextWithIndexMapping___block_invoke_5;
  v47[3] = &unk_1E98DB3E0;
  v7 = v32;
  v48 = v7;
  objc_msgSend(v7, "applyRegex:withReplacementTemplate:", v6, v47);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = qword_1ED0B4740;
  v45[0] = v5;
  v45[1] = 3221225472;
  v45[2] = __52__NSString_CRDD___crDDFriendlyTextWithIndexMapping___block_invoke_6;
  v45[3] = &unk_1E98DB3E0;
  v9 = v7;
  v46 = v9;
  objc_msgSend(v9, "applyRegex:withReplacementTemplate:", v8, v45);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = qword_1ED0B4748;
  v43[0] = v5;
  v43[1] = 3221225472;
  v43[2] = __52__NSString_CRDD___crDDFriendlyTextWithIndexMapping___block_invoke_7;
  v43[3] = &unk_1E98DB3E0;
  v11 = v9;
  v44 = v11;
  objc_msgSend(v11, "applyRegex:withReplacementTemplate:", v10, v43);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = qword_1ED0B4750;
  v41[0] = v5;
  v41[1] = 3221225472;
  v41[2] = __52__NSString_CRDD___crDDFriendlyTextWithIndexMapping___block_invoke_8;
  v41[3] = &unk_1E98DB3E0;
  v13 = v11;
  v42 = v13;
  objc_msgSend(v13, "applyRegex:withReplacementTemplate:", v12, v41);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
  {
    v14 = 0;
    *a3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v13, "length"));
    while (objc_msgSend(v13, "length") > v14)
    {
      objc_msgSend(v39, "objectAtIndexedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "objectAtIndexedSubscript:", objc_msgSend(v15, "integerValue"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "objectAtIndexedSubscript:", objc_msgSend(v16, "integerValue"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "objectAtIndexedSubscript:", objc_msgSend(v17, "integerValue"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "objectAtIndexedSubscript:", objc_msgSend(v18, "integerValue"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "objectAtIndexedSubscript:", objc_msgSend(v19, "integerValue"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "objectAtIndexedSubscript:", objc_msgSend(v20, "integerValue"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*a3, "setObject:atIndexedSubscript:", v21, v14);
      if (objc_msgSend(v21, "integerValue") < 0
        || (v22 = objc_msgSend(v21, "integerValue"), v22 >= objc_msgSend(v40, "length")))
      {
        CROSLogForCategory(7);
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          v24 = objc_msgSend(v21, "integerValue");
          v25 = objc_msgSend(v40, "length");
          v26 = objc_msgSend(v13, "length");
          *(_DWORD *)buf = 134218752;
          v51 = v24;
          v52 = 1024;
          v53 = v14;
          v54 = 2048;
          v55 = v25;
          v56 = 2048;
          v57 = v26;
          _os_log_impl(&dword_1D4FB8000, v23, OS_LOG_TYPE_ERROR, "_crDDFriendly: Mapping index %ld at %d out of bounds for (%ld) -> (%ld).", buf, 0x26u);
        }

        v27 = *a3;
        if (v14)
        {
          objc_msgSend(v27, "objectAtIndexedSubscript:", v14 - 1);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*a3, "setObject:atIndexedSubscript:", v28, v14);

        }
        else
        {
          objc_msgSend(v27, "setObject:atIndexedSubscript:", &unk_1E9926AF0, 0);
        }
      }

      ++v14;
    }
  }
  objc_msgSend(v13, "componentsSeparatedByCharactersInSet:", qword_1ED0B4718);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "componentsJoinedByString:", CFSTR("-"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  return v30;
}

- (id)_compositeRegexForReplacing:()CRDD nonspaceLeft:nonspaceRight:
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v21;
  id v23;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v23 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v23, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = a5;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v23;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v26;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v26 != v8)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v9), "stringByReplacingOccurrencesOfString:withString:", CFSTR("/"), CFSTR("\\/"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:", CFSTR("."), CFSTR("\\."));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v11);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v7);
  }

  v12 = CFSTR("(^|\\s)");
  if (a4)
    v12 = CFSTR("(\\S)");
  v13 = v12;
  v14 = CFSTR("($|\\.$|,$|;$|\\?$|!$|\\s|\\.\\s|,\\s|;\\s|\\?\\s|!\\s)");
  if (v21)
    v14 = CFSTR("(\\S)");
  v15 = v14;
  v16 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v6, "componentsJoinedByString:", CFSTR("|"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("%@(%@)%@"), v13, v17, v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", v18, 0, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

@end
