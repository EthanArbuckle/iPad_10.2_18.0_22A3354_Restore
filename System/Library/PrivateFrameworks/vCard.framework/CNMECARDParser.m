@implementation CNMECARDParser

+ (id)parseString:(id)a3 resultFactory:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_msgSend(a4, "makeBuilder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __50__CNMECARDParser_parseString_resultFactory_error___block_invoke;
  v30[3] = &unk_1E956FEA0;
  v13 = v8;
  v31 = v13;
  v14 = v9;
  v32 = v14;
  v15 = v10;
  v33 = v15;
  v16 = v11;
  v34 = v16;
  v17 = v12;
  v35 = v17;
  objc_msgSend(a1, "enumerateTagsInString:usingBlock:", v7, v30);

  objc_msgSend(v14, "_cn_map:", &__block_literal_global_14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_cn_map:", &__block_literal_global_31);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setValues:labels:isPrimaries:forProperty:", v14, v18, v19, CFSTR("Phone"));

  objc_msgSend(v15, "_cn_map:", &__block_literal_global_14);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "_cn_map:", &__block_literal_global_31);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setValues:labels:isPrimaries:forProperty:", v15, v20, v21, CFSTR("Email"));

  objc_msgSend(v16, "_cn_map:", &__block_literal_global_14);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "_cn_map:", &__block_literal_global_31);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setValues:labels:isPrimaries:forProperty:", v16, v22, v23, CFSTR("Address"));

  objc_msgSend(v17, "_cn_map:", &__block_literal_global_14);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "_cn_map:", &__block_literal_global_31);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setValues:labels:isPrimaries:forProperty:", v17, v24, v25, CFSTR("URLs"));

  objc_msgSend(v13, "build");
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = (void *)v26;
  if (v26)
  {
    v36[0] = v26;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v28 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v28;
}

void __50__CNMECARDParser_parseString_resultFactory_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
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
  __CFString **v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  __CFString **v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  int v37;
  id v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(CFSTR("N"), "isEqualToString:", v5))
  {
    objc_msgSend(MEMORY[0x1E0D13AD8], "componentsFromString:", v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v8 = *(void **)(a1 + 32);
    objc_msgSend(v7, "familyName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setValue:forProperty:", v9, CFSTR("Last"));

    v10 = *(void **)(a1 + 32);
    objc_msgSend(v7, "givenName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setValue:forProperty:", v11, CFSTR("First"));

    v12 = *(void **)(a1 + 32);
    objc_msgSend(v7, "middleName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setValue:forProperty:", v13, CFSTR("Middle"));

    v14 = *(void **)(a1 + 32);
    objc_msgSend(v7, "namePrefix");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setValue:forProperty:", v15, CFSTR("Title"));

    v16 = *(void **)(a1 + 32);
    objc_msgSend(v7, "nameSuffix");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setValue:forProperty:", v17, CFSTR("Suffix"));

    v18 = *(void **)(a1 + 32);
    objc_msgSend(v7, "nickname");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = CNVCardKeyNickname;
LABEL_5:
    objc_msgSend(v18, "setValue:forProperty:", v19, *v20);
    goto LABEL_6;
  }
  if (objc_msgSend(CFSTR("SOUND"), "isEqualToString:", v5))
  {
    objc_msgSend(MEMORY[0x1E0D13AD8], "componentsFromString:", v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v21 = *(void **)(a1 + 32);
    objc_msgSend(v7, "familyName");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setValue:forProperty:", v22, CFSTR("LastPhonetic"));

    v23 = *(void **)(a1 + 32);
    objc_msgSend(v7, "givenName");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setValue:forProperty:", v24, CFSTR("FirstPhonetic"));

    v18 = *(void **)(a1 + 32);
    objc_msgSend(v7, "middleName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = CNVCardKeyPhoneticMiddleName;
    goto LABEL_5;
  }
  if (objc_msgSend(CFSTR("NICKNAME"), "isEqualToString:", v5))
  {
    v25 = *(void **)(a1 + 32);
    v26 = CNVCardKeyNickname;
LABEL_11:
    objc_msgSend(v25, "setValue:forProperty:", v6, *v26);
    goto LABEL_8;
  }
  if (objc_msgSend(CFSTR("TEL"), "isEqualToString:", v5)
    || objc_msgSend(CFSTR("TEL-AV"), "isEqualToString:", v5))
  {
    v27 = *(void **)(a1 + 40);
LABEL_15:
    objc_msgSend(v27, "addObject:", v6);
    goto LABEL_8;
  }
  if (objc_msgSend(CFSTR("EMAIL"), "isEqualToString:", v5))
  {
    v27 = *(void **)(a1 + 48);
    goto LABEL_15;
  }
  if (objc_msgSend(CFSTR("ADR"), "isEqualToString:", v5))
  {
    objc_msgSend(MEMORY[0x1E0D13B18], "postalAddressFromString:error:", v6, 0);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (!v7)
      goto LABEL_7;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D138D8]);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v28, CFSTR("street"));

    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D138B0]);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v29, CFSTR("city"));

    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D138D0]);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v30, CFSTR("state"));

    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D138C8]);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v31, CFSTR("postalCode"));

    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D138B8]);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v32, CFSTR("country"));

    objc_msgSend(*(id *)(a1 + 56), "addObject:", v19);
LABEL_6:

LABEL_7:
    goto LABEL_8;
  }
  if (objc_msgSend(CFSTR("BDAY"), "isEqualToString:", v5))
  {
    if (objc_msgSend(v6, "length") != 8)
      goto LABEL_8;
    v7 = objc_alloc_init(MEMORY[0x1E0C99D78]);
    objc_msgSend(v6, "substringWithRange:", 0, 4);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setYear:", objc_msgSend(v33, "integerValue"));

    objc_msgSend(v6, "substringWithRange:", 4, 2);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setMonth:", objc_msgSend(v34, "integerValue"));

    objc_msgSend(v6, "substringWithRange:", 6, 2);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDay:", objc_msgSend(v35, "integerValue"));

    objc_msgSend(*(id *)(a1 + 32), "setValue:forProperty:", v7, CFSTR("BirthdayComponents"));
    goto LABEL_7;
  }
  if (objc_msgSend(CFSTR("URL"), "isEqualToString:", v5))
  {
    v27 = *(void **)(a1 + 64);
    goto LABEL_15;
  }
  if (objc_msgSend(CFSTR("NOTE"), "isEqualToString:", v5))
  {
    v25 = *(void **)(a1 + 32);
    v26 = CNVCardKeyNote;
    goto LABEL_11;
  }
  +[CNVCardLogging meCard](CNVCardLogging, "meCard");
  v36 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    v37 = 138543618;
    v38 = v5;
    v39 = 2112;
    v40 = v6;
    _os_log_impl(&dword_1D3C07000, v36, OS_LOG_TYPE_DEFAULT, "Unhandled tag: %{public}@ — %@", (uint8_t *)&v37, 0x16u);
  }

LABEL_8:
}

+ (void)enumerateTagsInString:(id)a3 usingBlock:(id)a4
{
  void (**v5)(id, NSObject *, void *);
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  void *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, NSObject *, void *))a4;
  objc_msgSend(a3, "substringFromIndex:", 7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsSeparatedByString:", CFSTR(";"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
    v12 = *MEMORY[0x1E0D13848];
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (((*(uint64_t (**)(uint64_t, void *))(v12 + 16))(v12, v14) & 1) == 0)
        {
          v15 = objc_msgSend(v14, "rangeOfString:", CFSTR(":"));
          if (v15 == 0x7FFFFFFFFFFFFFFFLL)
          {
            +[CNVCardLogging meCard](CNVCardLogging, "meCard");
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v24 = v14;
              _os_log_error_impl(&dword_1D3C07000, v16, OS_LOG_TYPE_ERROR, "Syntax error: no value separator in field: '%@'", buf, 0xCu);
            }
          }
          else
          {
            v17 = v15;
            objc_msgSend(v14, "substringToIndex:", v15);
            v16 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "substringFromIndex:", v17 + 1);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v5[2](v5, v16, v18);

          }
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    }
    while (v10);
  }

}

@end
