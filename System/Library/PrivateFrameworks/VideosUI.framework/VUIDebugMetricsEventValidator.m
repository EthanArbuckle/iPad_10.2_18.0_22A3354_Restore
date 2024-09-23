@implementation VUIDebugMetricsEventValidator

+ (void)validateEvents:(id)a3 forRuleset:(id)a4 withCompletion:(id)a5
{
  id v7;
  id v8;
  int v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  __CFString *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  __CFString *v47;
  id v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  id obj;
  _QWORD v57[4];
  id v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  id v63;
  _BYTE v64[128];
  _QWORD v65[2];
  _QWORD v66[4];

  v66[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v53 = a5;
  v9 = objc_msgSend(v8, "hasPrefix:", CFSTR("com.apple.amp.ae.validator.manifest"));
  v10 = objc_alloc(MEMORY[0x1E0C99E98]);
  objc_msgSend(CFSTR("https://ae-validator-service.amp.apple.com"), "stringByAppendingString:", CFSTR("/v1/validate"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithString:", v11);

  v13 = objc_alloc_init(MEMORY[0x1E0CB37A8]);
  objc_msgSend(v13, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v13, "addValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("accept"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("multipart/form-data; boundary=%@"),
    CFSTR("----------V2ymHFg03ehbqgZCaKO6jy"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setValue:forHTTPHeaderField:");
  v52 = v13;
  objc_msgSend(v13, "setURL:", v12);
  v14 = (void *)MEMORY[0x1E0CB36D8];
  v65[0] = CFSTR("events");
  v65[1] = CFSTR("postTime");
  v66[0] = v7;
  v15 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "timeIntervalSince1970");
  objc_msgSend(v15, "numberWithLong:", (uint64_t)v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v66[1] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v66, v65, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = 0;
  objc_msgSend(v14, "dataWithJSONObject:options:error:", v19, 1, &v63);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v63;

  if (v20)
  {
    v48 = v21;
    v49 = v12;
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v20, 4);
    NSLog(CFSTR("JSON string for Gladiator %@"), v22);

    objc_msgSend(MEMORY[0x1E0C99DF0], "data");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v25 = CFSTR("ruleset");
    if (v9)
      v25 = CFSTR("manifest");
    v50 = v8;
    v47 = v25;
    objc_msgSend(v24, "setObject:forKey:", v8);
    v55 = v20;
    objc_msgSend(v24, "setObject:forKey:", v20, CFSTR("figarojson"));
    objc_msgSend(v24, "setObject:forKey:", CFSTR("false"), CFSTR("singleResult"));
    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    v54 = v24;
    objc_msgSend(v24, "allKeys");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v60;
      do
      {
        for (i = 0; i != v27; ++i)
        {
          if (*(_QWORD *)v60 != v28)
            objc_enumerationMutation(obj);
          v30 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("--%@\r\n"), CFSTR("----------V2ymHFg03ehbqgZCaKO6jy"));
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "dataUsingEncoding:", 4);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "appendData:", v32);

          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Content-Disposition: form-data; name=\"%@\"\r\n\r\n"),
            v30);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "dataUsingEncoding:", 4);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "appendData:", v34);

          if (objc_msgSend(v30, "isEqualToString:", CFSTR("figarojson")))
          {
            objc_msgSend(v23, "appendData:", v55);
          }
          else
          {
            v35 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v54, "objectForKey:", v30);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "stringWithFormat:", CFSTR("%@\r\n"), v36);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "dataUsingEncoding:", 4);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "appendData:", v38);

          }
        }
        v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
      }
      while (v27);
    }

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\r\n--%@--\r\n"), CFSTR("----------V2ymHFg03ehbqgZCaKO6jy"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "dataUsingEncoding:", 4);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "appendData:", v40);

    v41 = v52;
    objc_msgSend(v52, "setHTTPBody:", v23);
    v42 = (void *)MEMORY[0x1E0CB39F0];
    objc_msgSend(MEMORY[0x1E0CB39F8], "defaultSessionConfiguration");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "sessionWithConfiguration:", v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    v57[0] = MEMORY[0x1E0C809B0];
    v57[1] = 3221225472;
    v57[2] = __74__VUIDebugMetricsEventValidator_validateEvents_forRuleset_withCompletion___block_invoke;
    v57[3] = &unk_1E9F99AB8;
    v45 = v53;
    v58 = v53;
    objc_msgSend(v44, "dataTaskWithRequest:completionHandler:", v52, v57);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "resume");

    v8 = v50;
    v21 = v48;
    v12 = v49;
    v20 = v55;
  }
  else
  {
    NSLog(CFSTR("NSJSONSerialization error: %@"), v21);
    v41 = v52;
    v45 = v53;
  }

}

void __74__VUIDebugMetricsEventValidator_validateEvents_forRuleset_withCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v4;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;

  if (a4)
  {
    objc_msgSend(a4, "userInfo");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "description");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Error in Gladiator Response %@"), v4);

  }
  else
  {
    v10 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", a2, 0, &v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v10;
    v8 = v7;
    if (v7)
      NSLog(CFSTR("Error Parsing Gladiator JSON response %@"), v7);
    else
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

+ (id)validationResults:(id)a3 fromIndex:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  id v12;
  const __CFString *v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  const __CFString *v29;
  unint64_t v30;
  unint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD *v39;
  _QWORD *v40;
  uint64_t v41;
  void *v42;
  uint64_t v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  id obj;
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
  _QWORD v65[4];
  _QWORD v66[4];
  _QWORD v67[3];
  _QWORD v68[3];
  _QWORD v69[4];
  _QWORD v70[4];
  _QWORD v71[3];
  _QWORD v72[3];
  const __CFString *v73;
  void *v74;
  const __CFString *v75;
  void *v76;
  _BYTE v77[128];
  _BYTE v78[128];
  _QWORD v79[3];
  _QWORD v80[5];

  v80[3] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)MEMORY[0x1E0C99E08];
  v79[0] = CFSTR("failedRulesets");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v80[0] = v7;
  v79[1] = CFSTR("passedRulesets");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v80[1] = v8;
  v79[2] = CFSTR("filteredRulesets");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v80[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v80, v79, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryWithDictionary:", v10);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = 0x1E0C99000uLL;
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v12 = v5;
  v47 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v61, v78, 16);
  if (v47)
  {
    v13 = CFSTR("ruleResults");
    v44 = *(_QWORD *)v62;
    v45 = v12;
    do
    {
      for (i = 0; i != v47; ++i)
      {
        if (*(_QWORD *)v62 != v44)
          objc_enumerationMutation(v12);
        v49 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * i);
        objc_msgSend(v12, "valueForKey:");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "valueForKey:", v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = 0u;
        v58 = 0u;
        v59 = 0u;
        v60 = 0u;
        v18 = v16;
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v57, v77, 16);
        if (v19)
        {
          v20 = v19;
          v53 = v17;
          obj = v18;
          v48 = i;
          v52 = 0;
          v55 = *(_QWORD *)v58;
          v56 = 0;
          do
          {
            for (j = 0; j != v20; ++j)
            {
              if (*(_QWORD *)v58 != v55)
                objc_enumerationMutation(obj);
              v22 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * j);
              objc_msgSend(v22, "valueForKey:", CFSTR("ruleLabel"));
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "valueForKey:", v13);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "objectAtIndexedSubscript:", a4);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v25, "isEqualToString:", CFSTR("OK")))
              {
                v75 = CFSTR("ruleLabel");
                v76 = v23;
                objc_msgSend(*(id *)(v11 + 3456), "dictionaryWithObjects:forKeys:count:", &v76, &v75, 1);
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v53, "addObject:", v26);

                ++v56;
              }
              else if (objc_msgSend(v25, "isEqualToString:", CFSTR("FILTERED")))
              {
                v73 = CFSTR("ruleLabel");
                v74 = v23;
                objc_msgSend(*(id *)(v11 + 3456), "dictionaryWithObjects:forKeys:count:", &v74, &v73, 1);
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v51, "addObject:", v27);

              }
              else
              {
                v71[0] = CFSTR("ruleLabel");
                v71[1] = CFSTR("ruleResult");
                v72[0] = v23;
                v72[1] = v25;
                v71[2] = CFSTR("onFailMapList");
                objc_msgSend(v22, "valueForKey:");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                v72[2] = v28;
                objc_msgSend(*(id *)(v11 + 3456), "dictionaryWithObjects:forKeys:count:", v72, v71, 3);
                v29 = v13;
                v30 = v11;
                v31 = a4;
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v50, "addObject:", v32);

                a4 = v31;
                v11 = v30;
                v13 = v29;

                ++v52;
              }

            }
            v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v77, 16);
          }
          while (v20);
          v33 = obj;

          if (v52)
          {
            objc_msgSend(v46, "valueForKey:", CFSTR("failedRulesets"));
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v69[0] = CFSTR("ruleset");
            v69[1] = CFSTR("failedRules");
            v35 = v50;
            v70[0] = v49;
            v70[1] = v50;
            v69[2] = CFSTR("passedRules");
            v69[3] = CFSTR("filteredRules");
            v17 = v53;
            v36 = v51;
            v70[2] = v53;
            v70[3] = v51;
            objc_msgSend(*(id *)(v11 + 3456), "dictionaryWithObjects:forKeys:count:", v70, v69, 4);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "addObject:", v37);
            i = v48;
            goto LABEL_25;
          }
          i = v48;
          v17 = v53;
          v35 = v50;
          v36 = v51;
          if (v56)
          {
            objc_msgSend(v46, "valueForKey:", CFSTR("passedRulesets"));
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v65[0] = CFSTR("ruleset");
            v65[1] = CFSTR("failedRules");
            v66[0] = v49;
            v66[1] = v50;
            v65[2] = CFSTR("passedRules");
            v65[3] = CFSTR("filteredRules");
            v66[2] = v53;
            v66[3] = v51;
            v38 = *(void **)(v11 + 3456);
            v39 = v66;
            v40 = v65;
            v41 = 4;
            goto LABEL_24;
          }
        }
        else
        {

          v35 = v50;
          v36 = v51;
          v33 = v18;
        }
        objc_msgSend(v46, "valueForKey:", CFSTR("filteredRulesets"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v67[0] = CFSTR("ruleset");
        v67[1] = CFSTR("failedRules");
        v68[0] = v49;
        v68[1] = v35;
        v67[2] = CFSTR("filteredRules");
        v68[2] = v36;
        v38 = *(void **)(v11 + 3456);
        v39 = v68;
        v40 = v67;
        v41 = 3;
LABEL_24:
        objc_msgSend(v38, "dictionaryWithObjects:forKeys:count:", v39, v40, v41);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "addObject:", v37);
LABEL_25:

        v12 = v45;
      }
      v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v61, v78, 16);
    }
    while (v47);
  }

  v42 = (void *)objc_msgSend(v46, "copy");
  return v42;
}

+ (id)removeGladiatorPrefix:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;

  v3 = a3;
  v4 = objc_msgSend(v3, "rangeOfString:", CFSTR("com.apple.amp.metrics.validator."));
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = v3;
  }
  else
  {
    objc_msgSend(v3, "stringByReplacingCharactersInRange:withString:", v4, v5, &stru_1E9FF3598);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

@end
