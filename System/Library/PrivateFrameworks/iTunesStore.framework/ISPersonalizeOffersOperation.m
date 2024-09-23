@implementation ISPersonalizeOffersOperation

- (ISPersonalizeOffersOperation)initWithPersonalizeOffersRequest:(id)a3
{
  ISPersonalizeOffersOperation *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ISPersonalizeOffersOperation;
  v4 = -[ISOperation init](&v6, sel_init);
  if (v4)
    v4->_request = (ISPersonalizeOffersRequest *)objc_msgSend(a3, "copy");
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ISPersonalizeOffersOperation;
  -[ISPersonalizeOffersOperation dealloc](&v3, sel_dealloc);
}

- (ISPersonalizeOffersRequest)personalizeOffersReqeust
{
  return (ISPersonalizeOffersRequest *)(id)-[ISPersonalizeOffersRequest copy](self->_request, "copy");
}

- (SSPersonalizeOffersResponse)response
{
  SSPersonalizeOffersResponse *v3;

  -[ISOperation lock](self, "lock");
  v3 = self->_response;
  -[ISOperation unlock](self, "unlock");
  return v3;
}

- (void)run
{
  uint64_t v3;
  uint64_t v4;
  _BOOL8 v5;
  void *v6;
  int v7;
  int v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  int v14;
  uint64_t v15;
  void *v16;
  int v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  int *v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  __int16 v28;
  const __CFString *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v25 = 0;
  if (-[ISPersonalizeOffersRequest accountIdentifier](self->_request, "accountIdentifier"))
  {
    v3 = objc_msgSend(MEMORY[0x24BEB1FF8], "contextWithBagType:", 0);
    if (-[ISOperation loadURLBagWithContext:returningError:](self, "loadURLBagWithContext:returningError:", v3, &v25))
    {
      v4 = objc_msgSend((id)objc_msgSend(+[ISURLBagCache sharedCache](ISURLBagCache, "sharedCache"), "URLBagForContext:", v3), "valueForKey:", CFSTR("personalized-buy-buttons"));
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v5 = -[ISPersonalizeOffersOperation _runWithURLDictionary:error:](self, "_runWithURLDictionary:error:", v4, &v25);
        goto LABEL_37;
      }
      v16 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
      if (!v16)
        v16 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v17 = objc_msgSend(v16, "shouldLog");
      if (objc_msgSend(v16, "shouldLogToDisk"))
        v18 = v17 | 2;
      else
        v18 = v17;
      if (!os_log_type_enabled((os_log_t)objc_msgSend(v16, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
        v18 &= 2u;
      if (!v18)
      {
LABEL_36:
        v5 = 0;
        goto LABEL_37;
      }
      v19 = objc_opt_class();
      v26 = 138412546;
      v27 = v19;
      v28 = 2112;
      v29 = CFSTR("personalized-buy-buttons");
      LODWORD(v24) = 22;
      v23 = &v26;
    }
    else
    {
      v12 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
      if (!v12)
        v12 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v13 = objc_msgSend(v12, "shouldLog");
      if (objc_msgSend(v12, "shouldLogToDisk"))
        v14 = v13 | 2;
      else
        v14 = v13;
      if (!os_log_type_enabled((os_log_t)objc_msgSend(v12, "OSLogObject"), OS_LOG_TYPE_ERROR))
        v14 &= 2u;
      if (!v14)
        goto LABEL_36;
      v15 = objc_opt_class();
      v26 = 138412546;
      v27 = v15;
      v28 = 2112;
      v29 = (const __CFString *)v25;
      LODWORD(v24) = 22;
      v23 = &v26;
    }
    v20 = _os_log_send_and_compose_impl();
    if (v20)
    {
      v21 = (void *)v20;
      v22 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v20, 4, &v26, v24);
      free(v21);
      v23 = (int *)v22;
      SSFileLog();
    }
    goto LABEL_36;
  }
  v6 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
  if (!v6)
    v6 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
  v7 = objc_msgSend(v6, "shouldLog");
  if (objc_msgSend(v6, "shouldLogToDisk"))
    v8 = v7 | 2;
  else
    v8 = v7;
  if (!os_log_type_enabled((os_log_t)objc_msgSend(v6, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
    v8 &= 2u;
  if (v8)
  {
    v26 = 138412290;
    v27 = objc_opt_class();
    LODWORD(v24) = 12;
    v23 = &v26;
    v9 = _os_log_send_and_compose_impl();
    if (v9)
    {
      v10 = (void *)v9;
      v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v9, 4, &v26, v24);
      free(v10);
      v23 = (int *)v11;
      SSFileLog();
    }
  }
  v5 = 0;
  v25 = SSError();
LABEL_37:
  -[ISOperation setError:](self, "setError:", v25, v23);
  -[ISOperation setSuccess:](self, "setSuccess:", v5);
}

- (void)_addDictionaryToResponse:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  -[ISOperation lock](self, "lock");
  if (!self->_response)
    self->_response = (SSPersonalizeOffersResponse *)objc_alloc_init(MEMORY[0x24BEB1F50]);
  v5 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("owns-data"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v27 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
          v11 = objc_msgSend(v5, "objectForKey:", v10);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              -[SSPersonalizeOffersResponse setActionParameters:forItemIdentifier:](self->_response, "setActionParameters:forItemIdentifier:", v11, v10);
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v7);
    }
  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v12 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v23;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v23 != v14)
          objc_enumerationMutation(a3);
        v16 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * j);
        v17 = objc_msgSend(a3, "objectForKey:", v16);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            if (objc_msgSend(v16, "rangeOfString:options:", CFSTR("action-display-name-"), 8))
            {
              if (!objc_msgSend(v16, "rangeOfString:options:", CFSTR("button-text-"), 8))
              {
                v20 = (void *)objc_msgSend(v16, "substringFromIndex:", v19);
                if (objc_msgSend(v20, "length"))
                  -[SSPersonalizeOffersResponse setPriceDisplayString:forItemType:](self->_response, "setPriceDisplayString:forItemType:", v17, v20);
              }
            }
            else
            {
              v21 = (void *)objc_msgSend(v16, "substringFromIndex:", v18);
              if (objc_msgSend(v21, "length"))
                -[SSPersonalizeOffersResponse setActionDisplayNameString:forItemType:](self->_response, "setActionDisplayNameString:forItemType:", v17, v21);
            }
          }
        }
      }
      v13 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v13);
  }
  -[ISOperation unlock](self, "unlock");
}

- (id)_copyResponseForURL:(id)a3 requestString:(id)a4 error:(id *)a5
{
  ISStoreURLOperation *v9;
  ISJSONDataProvider *v10;
  void *v11;
  void *v12;
  id v13;
  void *v15;

  v15 = 0;
  v9 = objc_alloc_init(ISStoreURLOperation);
  v10 = objc_alloc_init(ISJSONDataProvider);
  -[ISURLOperation setDataProvider:](v9, "setDataProvider:", v10);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1DC0]), "initWithAccountIdentifier:", -[ISPersonalizeOffersRequest accountIdentifier](self->_request, "accountIdentifier"));
  -[ISURLOperation setAuthenticationContext:](v9, "setAuthenticationContext:", v11);

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1F30]), "initWithURL:", a3);
  objc_msgSend(v12, "setHTTPBody:", objc_msgSend(a4, "dataUsingEncoding:", 4));
  objc_msgSend(v12, "setHTTPMethod:", CFSTR("POST"));
  -[ISURLOperation setRequestProperties:](v9, "setRequestProperties:", v12);

  -[ISOperation runSubOperation:returningError:](self, "runSubOperation:returningError:", v9, &v15);
  v13 = -[ISDataProvider output](v10, "output");

  if (a5)
    *a5 = v15;
  return v13;
}

- (BOOL)_runWithURLDictionary:(id)a3 error:(id *)a4
{
  NSArray *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  uint64_t v19;
  void *v20;
  int v21;
  int v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  int v29;
  int v30;
  int v31;
  void *v32;
  ISPersonalizeOffersOperation *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t k;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  id v47;
  void *v48;
  int v49;
  int v50;
  int v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  void *v56;
  BOOL v57;
  void *v58;
  _BYTE *v60;
  _BYTE *v61;
  _BYTE *v62;
  uint64_t v63;
  NSArray *obj;
  id v66;
  void *v68;
  ISPersonalizeOffersOperation *v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  _BYTE v82[128];
  _BYTE v83[128];
  _BYTE v84[12];
  __int16 v85;
  uint64_t v86;
  _BYTE v87[128];
  uint64_t v88;

  v88 = *MEMORY[0x24BDAC8D0];
  v66 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v69 = self;
  v5 = -[ISPersonalizeOffersRequest allItemTypes](self->_request, "allItemTypes");
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  v81 = 0u;
  obj = v5;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v78, v87, 16);
  v7 = 0x24BDD1000uLL;
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v79;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v79 != v9)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v78 + 1) + 8 * i);
        v12 = (void *)objc_msgSend(a3, "objectForKey:", v11, v60, v63);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v12, "length"))
        {
          v13 = (id)objc_msgSend(v66, "objectForKey:", v12);
          if (!v13)
          {
            v13 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithString:", CFSTR("ids="));
            objc_msgSend(v66, "setObject:forKey:", v13, v12);
          }
          v14 = -[ISPersonalizeOffersRequest itemIdentifiersForItemType:](v69->_request, "itemIdentifiersForItemType:", v11);
          v74 = 0u;
          v75 = 0u;
          v76 = 0u;
          v77 = 0u;
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v74, v83, 16);
          if (v15)
          {
            v16 = v15;
            v17 = *(_QWORD *)v75;
            do
            {
              for (j = 0; j != v16; ++j)
              {
                if (*(_QWORD *)v75 != v17)
                  objc_enumerationMutation(v14);
                v19 = *(_QWORD *)(*((_QWORD *)&v74 + 1) + 8 * j);
                if ((unint64_t)objc_msgSend(v13, "length") >= 5)
                  objc_msgSend(v13, "appendString:", CFSTR(","));
                objc_msgSend(v13, "appendString:", v19);
              }
              v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v74, v83, 16);
            }
            while (v16);
          }

          v7 = 0x24BDD1000;
        }
        else
        {
          v20 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
          if (!v20)
            v20 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
          v21 = objc_msgSend(v20, "shouldLog");
          if (objc_msgSend(v20, "shouldLogToDisk"))
            v22 = v21 | 2;
          else
            v22 = v21;
          if (os_log_type_enabled((os_log_t)objc_msgSend(v20, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
            v23 = v22;
          else
            v23 = v22 & 2;
          if (v23)
          {
            v24 = objc_opt_class();
            *(_DWORD *)v84 = 138412546;
            *(_QWORD *)&v84[4] = v24;
            v85 = 2112;
            v86 = v11;
            LODWORD(v63) = 22;
            v60 = v84;
            v25 = _os_log_send_and_compose_impl();
            if (v25)
            {
              v26 = (void *)v25;
              v27 = objc_msgSend(*(id *)(v7 + 1992), "stringWithCString:encoding:", v25, 4, v84, v63);
              free(v26);
              v60 = (_BYTE *)v27;
              SSFileLog();
            }
          }
        }
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v78, v87, 16);
    }
    while (v8);
  }
  v28 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig", v60);
  if (!v28)
    v28 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
  v29 = objc_msgSend(v28, "shouldLog");
  if (objc_msgSend(v28, "shouldLogToDisk"))
    v30 = v29 | 2;
  else
    v30 = v29;
  if (os_log_type_enabled((os_log_t)objc_msgSend(v28, "OSLogObject"), OS_LOG_TYPE_INFO))
    v31 = v30;
  else
    v31 = v30 & 2;
  v32 = v66;
  v33 = v69;
  if (v31)
  {
    v34 = objc_opt_class();
    v35 = objc_msgSend(v66, "count");
    *(_DWORD *)v84 = 138412546;
    *(_QWORD *)&v84[4] = v34;
    v85 = 2048;
    v86 = v35;
    LODWORD(v63) = 22;
    v61 = v84;
    v36 = _os_log_send_and_compose_impl();
    if (v36)
    {
      v37 = (void *)v36;
      v38 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v36, 4, v84, v63);
      free(v37);
      v61 = (_BYTE *)v38;
      SSFileLog();
    }
  }
  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  v39 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v70, v82, 16, v61);
  if (v39)
  {
    v40 = v39;
    v41 = 0;
    v68 = 0;
    v42 = *(_QWORD *)v71;
    do
    {
      for (k = 0; k != v40; ++k)
      {
        if (*(_QWORD *)v71 != v42)
          objc_enumerationMutation(v32);
        v44 = *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * k);
        v45 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", v44);
        if (v45)
        {
          v46 = (void *)v45;
          *(_QWORD *)v84 = 0;
          v47 = -[ISPersonalizeOffersOperation _copyResponseForURL:requestString:error:](v33, "_copyResponseForURL:requestString:error:", v45, objc_msgSend(v32, "objectForKey:", v44), v84);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            -[ISPersonalizeOffersOperation _addDictionaryToResponse:](v33, "_addDictionaryToResponse:", v47);
          }
          else
          {
            ++v41;
            v56 = v68;
            if (!v68)
              v56 = *(void **)v84;
            v68 = v56;
          }

        }
        else
        {
          v48 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
          if (!v48)
            v48 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
          v49 = objc_msgSend(v48, "shouldLog", v62, v63);
          if (objc_msgSend(v48, "shouldLogToDisk"))
            v50 = v49 | 2;
          else
            v50 = v49;
          if (os_log_type_enabled((os_log_t)objc_msgSend(v48, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
            v51 = v50;
          else
            v51 = v50 & 2;
          if (v51)
          {
            v52 = objc_opt_class();
            *(_DWORD *)v84 = 138412546;
            *(_QWORD *)&v84[4] = v52;
            v85 = 2112;
            v86 = v44;
            LODWORD(v63) = 22;
            v62 = v84;
            v53 = _os_log_send_and_compose_impl();
            if (v53)
            {
              v54 = (void *)v53;
              v55 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v53, 4, v84, v63);
              free(v54);
              v62 = (_BYTE *)v55;
              SSFileLog();
            }
          }
          ++v41;
          v32 = v66;
          v33 = v69;
        }
      }
      v40 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v70, v82, 16);
    }
    while (v40);
    if (v41)
      v57 = v41 < objc_msgSend(v32, "count");
    else
      v57 = 1;
    v58 = v68;
  }
  else
  {
    v58 = 0;
    v57 = 1;
  }

  if (a4)
    *a4 = v58;
  return v57;
}

@end
