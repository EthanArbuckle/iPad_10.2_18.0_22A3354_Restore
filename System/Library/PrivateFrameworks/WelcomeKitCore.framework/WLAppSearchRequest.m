@implementation WLAppSearchRequest

- (WLAppSearchRequest)initWithAndroidIdentifiers:(id)a3
{
  id v4;
  WLAppSearchRequest *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)WLAppSearchRequest;
  v5 = -[WLAppSearchRequest init](&v8, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "componentsJoinedByString:", CFSTR(","));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WLAppSearchRequest setIdentifiers:](v5, "setIdentifiers:", v6);

  }
  return v5;
}

- (void)search:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSString *identifiers;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  const __CFString *v15;
  NSString *v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[NSString length](self->_identifiers, "length"))
  {
    objc_msgSend(MEMORY[0x24BE08238], "createBagForSubProfile");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE08238]), "initWithType:clientIdentifier:clientVersion:bag:", 0, CFSTR("com.apple.welcomemat"), CFSTR("1"), v5);
    identifiers = self->_identifiers;
    v15 = CFSTR("androidAppId");
    v16 = identifiers;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFilters:", v8);

    objc_msgSend(v6, "perform");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __29__WLAppSearchRequest_search___block_invoke;
    v13[3] = &unk_24E376430;
    v14 = v4;
    objc_msgSend(v9, "addFinishBlock:", v13);

  }
  else
  {
    v10 = (void *)MEMORY[0x24BDD1540];
    v11 = *MEMORY[0x24BEC2878];
    v17 = *MEMORY[0x24BDD0FC8];
    v18[0] = CFSTR("WLAppSearchRequest could not search identifiers because the request was empty.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, 1, v12);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
      (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v5);
  }

}

void __29__WLAppSearchRequest_search___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
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
  BOOL v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  float v29;
  WLApp *v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  void *v34;
  id v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = *(_QWORD *)(a1 + 32);
    if (v7)
      (*(void (**)(uint64_t, _QWORD, id))(v7 + 16))(v7, 0, v6);
  }
  else
  {
    v32 = a1;
    v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v33 = v5;
    objc_msgSend(v5, "responseDataItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    if (v10)
    {
      v11 = v10;
      v39 = *(_QWORD *)v45;
      v34 = v9;
      v35 = v8;
      do
      {
        v12 = 0;
        v36 = v11;
        do
        {
          if (*(_QWORD *)v45 != v39)
            objc_enumerationMutation(v9);
          v13 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v12);
          objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("id"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("attributes"));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("platformAttributes"));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("ios"));
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            if (v17)
            {
              objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("bundleId"));
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("offers"));
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              if (v18)
                v20 = v19 == 0;
              else
                v20 = 1;
              if (!v20)
              {
                v37 = v19;
                v38 = v18;
                v42 = 0u;
                v43 = 0u;
                v40 = 0u;
                v41 = 0u;
                v21 = v19;
                v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
                if (v22)
                {
                  v23 = *(_QWORD *)v41;
                  while (2)
                  {
                    for (i = 0; i != v22; ++i)
                    {
                      if (*(_QWORD *)v41 != v23)
                        objc_enumerationMutation(v21);
                      v25 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
                      objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("type"));
                      v26 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v26, "lowercaseString");
                      v27 = (void *)objc_claimAutoreleasedReturnValue();

                      objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("price"));
                      v28 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v28 && objc_msgSend(v27, "isEqualToString:", CFSTR("get")))
                      {
                        objc_msgSend(v28, "floatValue");
                        v22 = v29 == 0.0;

                        goto LABEL_26;
                      }

                    }
                    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
                    if (v22)
                      continue;
                    break;
                  }
LABEL_26:
                  v9 = v34;
                  v8 = v35;
                }

                v18 = v38;
                v30 = -[WLApp initWithBundleIdentifier:appStoreIdentifier:isFree:]([WLApp alloc], "initWithBundleIdentifier:appStoreIdentifier:isFree:", v38, v14, v22);
                objc_msgSend(v8, "addObject:", v30);

                v11 = v36;
                v19 = v37;
              }

            }
          }

          ++v12;
        }
        while (v12 != v11);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
      }
      while (v11);
    }
    v31 = *(_QWORD *)(v32 + 32);
    if (v31)
      (*(void (**)(uint64_t, id, _QWORD))(v31 + 16))(v31, v8, 0);

    v6 = 0;
    v5 = v33;
  }

}

- (NSString)identifiers
{
  return self->_identifiers;
}

- (void)setIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifiers, 0);
}

@end
