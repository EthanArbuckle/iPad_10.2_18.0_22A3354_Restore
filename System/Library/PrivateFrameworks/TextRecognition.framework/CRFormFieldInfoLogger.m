@implementation CRFormFieldInfoLogger

+ (id)parseLog:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
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
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  id obj;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _QWORD v45[2];
  _QWORD v46[2];
  _QWORD v47[2];
  _QWORD v48[2];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  v37 = v3;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithData:encoding:", v5, 4);

  v36 = v6;
  objc_msgSend(v6, "componentsSeparatedByString:", CFSTR("\n"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_opt_new();
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = v7;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v42;
    v39 = *(_QWORD *)v42;
    do
    {
      v12 = 0;
      v38 = v10;
      do
      {
        if (*(_QWORD *)v42 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v12);
        if (objc_msgSend(v13, "hasPrefix:", CFSTR("CTCDataField: ")))
        {
          objc_msgSend(v13, "substringFromIndex:", objc_msgSend(CFSTR("CTCDataField: "), "length"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "dataUsingEncoding:", 4);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v15, 0, 0);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("imagePath"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectForKeyedSubscript:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v18)
          {
            v47[0] = CFSTR("fields");
            v19 = (void *)MEMORY[0x1E0C9AA60];
            v20 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
            v47[1] = CFSTR("textRegions");
            v48[0] = v20;
            v21 = (void *)objc_msgSend(v19, "mutableCopy");
            v48[1] = v21;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, v47, 2);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = (void *)objc_msgSend(v22, "mutableCopy");
            objc_msgSend(v8, "setObject:forKeyedSubscript:", v23, v17);

            v11 = v39;
          }
          objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("imagePath"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectForKeyedSubscript:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("fields"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v26, "addObject:", v16);
        }
        else
        {
          if (!objc_msgSend(v13, "hasPrefix:", CFSTR("CTCDataLabel: ")))
            goto LABEL_15;
          objc_msgSend(v13, "substringFromIndex:", objc_msgSend(CFSTR("CTCDataLabel: "), "length"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "dataUsingEncoding:", 4);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v15, 0, 0);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("imagePath"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectForKeyedSubscript:", v17);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v28)
          {
            v45[0] = CFSTR("fields");
            v29 = (void *)MEMORY[0x1E0C9AA60];
            v30 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
            v45[1] = CFSTR("textRegions");
            v46[0] = v30;
            v31 = (void *)objc_msgSend(v29, "mutableCopy");
            v46[1] = v31;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, v45, 2);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = (void *)objc_msgSend(v32, "mutableCopy");
            objc_msgSend(v8, "setObject:forKeyedSubscript:", v33, v17);

            v11 = v39;
          }
          objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("textRegions"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectForKeyedSubscript:", v17);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "setObject:forKeyedSubscript:", v26, CFSTR("textRegions"));

          v10 = v38;
        }

LABEL_15:
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
    }
    while (v10);
  }

  return v8;
}

+ (void)logFieldInfo:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
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
  const char *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  const char *v28;
  id v29;
  void *v30;
  id v31;
  _QWORD v32[2];
  _QWORD v33[3];

  v33[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (_MergedGlobals_32 != -1)
    dispatch_once(&_MergedGlobals_32, &__block_literal_global_33);
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("imagePath"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = &stru_1E98DC948;
  if (v4)
    v6 = (__CFString *)v4;
  v7 = v6;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("index"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setValue:forKey:", v7, CFSTR("imagePath"));
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("textContentType"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setValue:forKey:", v10, CFSTR("reference"));

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("textContentType"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setValue:forKey:", v11, CFSTR("predicted"));

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("text"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setValue:forKey:", v12, CFSTR("text"));

    objc_msgSend(v9, "setValue:forKey:", &stru_1E98DC948, CFSTR("keyword"));
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("locale"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setValue:forKey:", v13, CFSTR("locale"));

    objc_msgSend(v9, "setValue:forKey:", &stru_1E98DC948, CFSTR("correctLabelText"));
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("index"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setValue:forKey:", v14, CFSTR("index"));

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("matchedResult"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setValue:forKey:", v15, CFSTR("matchedResult"));

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("x"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setValue:forKey:", v16, CFSTR("x"));

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("y"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setValue:forKey:", v17, CFSTR("y"));

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("width"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setValue:forKey:", v18, CFSTR("width"));

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("height"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setValue:forKey:", v19, CFSTR("height"));

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("widthBounded"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setValue:forKey:", v20, CFSTR("widthBounded"));

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("heightBounded"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setValue:forKey:", v21, CFSTR("heightBounded"));

    v22 = (const char *)objc_msgSend(CFSTR("CTCDataField: "), "UTF8String");
    v23 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v9, 0, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_retainAutorelease((id)objc_msgSend(v23, "initWithData:encoding:", v24, 4));
    printf("%s%s\n", v22, (const char *)objc_msgSend(v25, "UTF8String"));

  }
  if ((objc_msgSend((id)qword_1ED0B4840, "containsObject:", v7) & 1) == 0)
  {
    objc_msgSend((id)qword_1ED0B4840, "addObject:", v7);
    v32[0] = CFSTR("imagePath");
    v32[1] = CFSTR("textRegions");
    v33[0] = v7;
    objc_msgSend(v3, "objectForKeyedSubscript:");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v33[1] = v26;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = (const char *)objc_msgSend(CFSTR("CTCDataLabel: "), "UTF8String");
    v29 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v27, 0, 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_retainAutorelease((id)objc_msgSend(v29, "initWithData:encoding:", v30, 4));
    printf("%s%s\n", v28, (const char *)objc_msgSend(v31, "UTF8String"));

  }
}

void __38__CRFormFieldInfoLogger_logFieldInfo___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)qword_1ED0B4840;
  qword_1ED0B4840 = v0;

}

@end
