@implementation WBSUserAgentQuirksSnapshot

- (WBSUserAgentQuirksSnapshot)initWithSnapshotData:(id)a3 error:(id *)a4
{
  id v6;
  WBSUserAgentQuirksSnapshot *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSDictionary *domainsToQuirkTypes;
  uint64_t v17;
  NSDictionary *userAgentQuirks;
  uint64_t v19;
  NSDictionary *sitesRequiringUserAgentQuirks;
  WBSUserAgentQuirksSnapshot *v21;
  _QWORD v23[4];
  id v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;
  objc_super v37;

  v6 = a3;
  v37.receiver = self;
  v37.super_class = (Class)WBSUserAgentQuirksSnapshot;
  v7 = -[WBSUserAgentQuirksSnapshot init](&v37, sel_init);
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "safari_dictionaryWithPropertyListData:options:", v6, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("UserAgentQuirks"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10 && objc_msgSend(v10, "count"))
      {
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("SitesRequiringUserAgentQuirks"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v12 && objc_msgSend(v12, "count"))
        {
          v33 = 0;
          v34 = &v33;
          v35 = 0x2020000000;
          v36 = 1;
          v27 = 0;
          v28 = &v27;
          v29 = 0x3032000000;
          v30 = __Block_byref_object_copy__35;
          v31 = __Block_byref_object_dispose__35;
          v32 = 0;
          v23[0] = MEMORY[0x1E0C809B0];
          v23[1] = 3221225472;
          v23[2] = __57__WBSUserAgentQuirksSnapshot_initWithSnapshotData_error___block_invoke;
          v23[3] = &unk_1E4B40680;
          v25 = &v27;
          v26 = &v33;
          v24 = v11;
          objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v23);
          if (a4)
          {
            v14 = (void *)v28[5];
            if (v14)
              *a4 = objc_retainAutorelease(v14);
          }
          if (*((_BYTE *)v34 + 24))
          {
            v15 = objc_msgSend(v9, "copy");
            domainsToQuirkTypes = v7->_domainsToQuirkTypes;
            v7->_domainsToQuirkTypes = (NSDictionary *)v15;

            -[NSDictionary objectForKeyedSubscript:](v7->_domainsToQuirkTypes, "objectForKeyedSubscript:", CFSTR("UserAgentQuirks"));
            v17 = objc_claimAutoreleasedReturnValue();
            userAgentQuirks = v7->_userAgentQuirks;
            v7->_userAgentQuirks = (NSDictionary *)v17;

            -[NSDictionary objectForKeyedSubscript:](v7->_domainsToQuirkTypes, "objectForKeyedSubscript:", CFSTR("SitesRequiringUserAgentQuirks"));
            v19 = objc_claimAutoreleasedReturnValue();
            sitesRequiringUserAgentQuirks = v7->_sitesRequiringUserAgentQuirks;
            v7->_sitesRequiringUserAgentQuirks = (NSDictionary *)v19;

            v21 = v7;
          }
          else
          {
            v21 = 0;
          }

          _Block_object_dispose(&v27, 8);
          _Block_object_dispose(&v33, 8);
        }
        else if (a4)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 259, 0);
          v21 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v21 = 0;
        }

      }
      else if (a4)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 259, 0);
        v21 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v21 = 0;
      }

    }
    else if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 259, 0);
      v21 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = 0;
    }

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

void __57__WBSUserAgentQuirksSnapshot_initWithSnapshotData_error___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v10),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        !v6))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 259, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    *a4 = 1;
  }

}

- (id)quirkTypeForURLString:(id)a3 withDefaultUserAgent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", 495, 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "hasSuffix:", CFSTR("/")))
  {
    objc_msgSend(v8, "substringToIndex:", objc_msgSend(v8, "length") - 1);
    v9 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v9;
  }
  -[NSDictionary objectForKeyedSubscript:](self->_sitesRequiringUserAgentQuirks, "objectForKeyedSubscript:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(v6, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", 511, 0, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](self->_sitesRequiringUserAgentQuirks, "objectForKeyedSubscript:", v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      objc_msgSend(v6, "safari_highLevelDomainFromHost");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDictionary objectForKeyedSubscript:](self->_sitesRequiringUserAgentQuirks, "objectForKeyedSubscript:", v12);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  -[NSDictionary objectForKeyedSubscript:](self->_userAgentQuirks, "objectForKeyedSubscript:", v10);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v7 && !v13)
  {
    if (objc_msgSend(v10, "containsString:", CFSTR("*")))
    {
      objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:", CFSTR("*"), v7);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = 0;
    }
  }

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  WBSUserAgentQuirksSnapshot *v4;
  BOOL v5;

  v4 = (WBSUserAgentQuirksSnapshot *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[NSDictionary isEqualToDictionary:](self->_domainsToQuirkTypes, "isEqualToDictionary:", v4->_domainsToQuirkTypes);
  }

  return v5;
}

- (unint64_t)hash
{
  return -[NSDictionary hash](self->_domainsToQuirkTypes, "hash");
}

- (id)snapshotData
{
  return (id)objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", self->_domainsToQuirkTypes, 200, 0, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sitesRequiringUserAgentQuirks, 0);
  objc_storeStrong((id *)&self->_userAgentQuirks, 0);
  objc_storeStrong((id *)&self->_domainsToQuirkTypes, 0);
}

@end
