@implementation SUScriptAccessSecurity

- (BOOL)canAccessFacebookInFrame:(id)a3 error:(id *)a4
{
  return -[SUScriptAccessSecurity _canAccessType:inFrame:error:](self, "_canAccessType:inFrame:error:", CFSTR("facebook"), a3, a4);
}

- (BOOL)canAccessFacebookWithURL:(id)a3 inFrame:(id)a4 error:(id *)a5
{
  return -[SUScriptAccessSecurity _canAccessType:withURL:inFrame:error:](self, "_canAccessType:withURL:inFrame:error:", CFSTR("facebook"), a3, a4, a5);
}

- (BOOL)canAccessTelephonyInFrame:(id)a3 error:(id *)a4
{
  return -[SUScriptAccessSecurity _canAccessType:inFrame:error:](self, "_canAccessType:inFrame:error:", CFSTR("telephony"), a3, a4);
}

- (id)_accessDictionaryForType:(id)a3
{
  uint64_t v4;
  void *v5;
  char isKindOfClass;
  id result;
  void *v8;

  v4 = objc_msgSend(MEMORY[0x24BEB1FF8], "contextWithBagType:", 0);
  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEC8C48], "sharedCache"), "URLBagForContext:", v4), "valueForKey:", CFSTR("p2-api-access"));
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  result = 0;
  if ((isKindOfClass & 1) != 0)
  {
    v8 = (void *)objc_msgSend(v5, "objectForKey:", a3);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      return v8;
    else
      return 0;
  }
  return result;
}

- (BOOL)_canAccessType:(id)a3 inFrame:(id)a4 error:(id *)a5
{
  id v8;
  BOOL v9;

  if (-[SUScriptAccessSecurity _accessDictionaryForType:](self, "_accessDictionaryForType:", a3))
  {
    v8 = -[SUScriptAccessSecurity _copyResourceURLsForWebFrame:](self, "_copyResourceURLsForWebFrame:", a4);
    v9 = -[SUScriptAccessSecurity _urls:matchPatternStrings:](self, "_urls:matchPatternStrings:", v8, &unk_24DEDC710);

    if (!a5)
      return v9;
  }
  else
  {
    v9 = 0;
    if (!a5)
      return v9;
  }
  if (!v9)
    *a5 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BEB24A0], 107, 0);
  return v9;
}

- (BOOL)_canAccessType:(id)a3 withURL:(id)a4 inFrame:(id)a5 error:(id *)a6
{
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  int v16;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;

  v9 = (uint64_t)self;
  v21 = *MEMORY[0x24BDAC8D0];
  v10 = -[SUScriptAccessSecurity _accessDictionaryForType:](self, "_accessDictionaryForType:", a3);
  if (!v10)
  {
    v14 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v15 = objc_msgSend(v14, "shouldLog");
    if (objc_msgSend(v14, "shouldLogToDisk"))
      v16 = v15 | 2;
    else
      v16 = v15;
    if (!os_log_type_enabled((os_log_t)objc_msgSend(v14, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
      v16 &= 2u;
    if (v16)
    {
      v19 = 138412290;
      v20 = objc_opt_class();
      LODWORD(v18) = 12;
      v9 = _os_log_send_and_compose_impl();
      if (!v9)
        goto LABEL_13;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v9, 4, &v19, v18);
      free((void *)v9);
      SSFileLog();
    }
LABEL_12:
    LOBYTE(v9) = 0;
    goto LABEL_13;
  }
  v11 = v10;
  v12 = objc_msgSend(v10, "objectForKey:", CFSTR("request-patterns"));
  if (!objc_msgSend((id)v9, "_urls:matchPatternStrings:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", a4, 0), v12))goto LABEL_12;
  v13 = (void *)objc_msgSend((id)v9, "_copyResourceURLsForWebFrame:", a5);
  LOBYTE(v9) = objc_msgSend((id)v9, "_urls:matchPatternStrings:", v13, objc_msgSend(v11, "objectForKey:", CFSTR("origin-patterns")));

LABEL_13:
  if (a6 && (v9 & 1) == 0)
    *a6 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BEB24A0], 107, 0);
  return v9;
}

- (id)_copyResourceURLsForWebFrame:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(a3, "dataSource");
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", objc_msgSend((id)objc_msgSend(v3, "mainResource"), "URL"), 0);
  v5 = (void *)objc_msgSend(v3, "subresources");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "URL");
        if (v10)
          objc_msgSend(v4, "addObject:", v10);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }
  return v4;
}

- (BOOL)_url:(id)a3 matchesExpressions:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)objc_msgSend(a3, "absoluteString");
  v6 = objc_msgSend(v5, "length");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(a4);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v10), "rangeOfFirstMatchInString:options:range:", v5, 0, 0, v6) != 0x7FFFFFFFFFFFFFFFLL)
        {
          LOBYTE(v7) = 1;
          return v7;
        }
        ++v10;
      }
      while (v8 != v10);
      v7 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      v8 = v7;
      if (v7)
        continue;
      break;
    }
  }
  return v7;
}

- (BOOL)_urls:(id)a3 matchPatternStrings:(id)a4
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  int v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  int *v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  int v39;
  uint64_t v40;
  __int16 v41;
  uint64_t v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v8 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v36 != v10)
            objc_enumerationMutation(a4);
          v12 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1798]), "initWithPattern:options:error:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i), 1, 0);
          if (v12)
          {
            v13 = (void *)v12;
            objc_msgSend(v7, "addObject:", v12);

          }
        }
        v9 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
      }
      while (v9);
    }
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v14 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
    if (v14)
    {
      v15 = v14;
      v16 = 0;
      v17 = *(_QWORD *)v32;
      while (2)
      {
        v18 = 0;
        v19 = v16 + v15;
        do
        {
          if (*(_QWORD *)v32 != v17)
            objc_enumerationMutation(a3);
          v20 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v18);
          if (!-[SUScriptAccessSecurity _url:matchesExpressions:](self, "_url:matchesExpressions:", v20, v7))
          {
            v21 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
            v22 = objc_msgSend(v21, "shouldLog");
            if (objc_msgSend(v21, "shouldLogToDisk"))
              v23 = v22 | 2;
            else
              v23 = v22;
            if (!os_log_type_enabled((os_log_t)objc_msgSend(v21, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
              v23 &= 2u;
            v19 = v16 + v18;
            if (v23)
            {
              v24 = objc_opt_class();
              v39 = 138412546;
              v40 = v24;
              v41 = 2112;
              v42 = v20;
              LODWORD(v30) = 22;
              v29 = &v39;
              v25 = _os_log_send_and_compose_impl();
              if (v25)
              {
                v26 = (void *)v25;
                v27 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v25, 4, &v39, v30);
                free(v26);
                v29 = (int *)v27;
                SSFileLog();
              }
            }
            goto LABEL_30;
          }
          ++v18;
        }
        while (v15 != v18);
        v15 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
        v16 = v19;
        if (v15)
          continue;
        break;
      }
    }
    else
    {
      v19 = 0;
    }
LABEL_30:

  }
  else
  {
    v19 = 0;
  }
  return v19 == objc_msgSend(a3, "count", v29);
}

@end
