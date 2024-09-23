@implementation ICQQuotaInfoResponse

- (ICQQuotaInfoResponse)initWithHTTPResponse:(id)a3 data:(id)a4
{
  ICQQuotaInfoResponse *v4;
  ICQQuotaInfoResponse *v5;
  uint64_t v6;
  uint64_t v7;
  NSDictionary *urls;
  NSDictionary *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSDictionary *quotaInfoDict;
  NSDictionary *v14;
  uint64_t v15;
  NSDictionary *storageInfo;
  NSDictionary *v17;
  uint64_t v18;
  NSDictionary *accountStatus;
  NSDictionary *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const __CFString *v27;
  unint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  const __CFString *v36;
  unint64_t v37;
  id v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v44;
  void *v45;
  ICQQuotaInfoResponse *v46;
  void *v47;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  objc_super v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v53.receiver = self;
  v53.super_class = (Class)ICQQuotaInfoResponse;
  v4 = -[AAResponse initWithHTTPResponse:data:](&v53, sel_initWithHTTPResponse_data_, a3, a4);
  v5 = v4;
  if (v4)
  {
    v6 = (int)*MEMORY[0x24BE04A98];
    objc_msgSend(*(id *)((char *)&v4->super.super.isa + v6), "objectForKey:", CFSTR("entry_points"));
    v7 = objc_claimAutoreleasedReturnValue();
    urls = v5->_urls;
    v5->_urls = (NSDictionary *)v7;

    if (v5->_urls)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v9 = v5->_urls;
        v5->_urls = 0;

      }
    }
    objc_msgSend(*(id *)((char *)&v5->super.super.isa + v6), "objectForKey:", CFSTR("storage_data"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v10, "objectForKey:", CFSTR("basicAccount"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v5->_basicAccount = objc_msgSend(v11, "BOOLValue");

        objc_msgSend(v10, "objectForKey:", CFSTR("quota_info_in_bytes"));
        v12 = objc_claimAutoreleasedReturnValue();
        quotaInfoDict = v5->_quotaInfoDict;
        v5->_quotaInfoDict = (NSDictionary *)v12;

        if (v5->_quotaInfoDict)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v14 = v5->_quotaInfoDict;
            v5->_quotaInfoDict = 0;

          }
        }
        objc_msgSend(v10, "objectForKey:", CFSTR("storage_info_in_bytes"));
        v15 = objc_claimAutoreleasedReturnValue();
        storageInfo = v5->_storageInfo;
        v5->_storageInfo = (NSDictionary *)v15;

        if (v5->_storageInfo)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v17 = v5->_storageInfo;
            v5->_storageInfo = 0;

          }
        }
        objc_msgSend(v10, "objectForKey:", CFSTR("account_status_info"));
        v18 = objc_claimAutoreleasedReturnValue();
        accountStatus = v5->_accountStatus;
        v5->_accountStatus = (NSDictionary *)v18;

        if (v5->_accountStatus)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v20 = v5->_accountStatus;
            v5->_accountStatus = 0;

          }
        }
      }
    }
    v21 = (void *)objc_opt_new();
    objc_msgSend(v21, "setTotalStorage:", -[ICQQuotaInfoResponse totalStorage](v5, "totalStorage"));
    objc_msgSend(v21, "setUsedStorage:", -[ICQQuotaInfoResponse usedStorage](v5, "usedStorage"));
    v47 = v21;
    objc_storeStrong((id *)&v5->_quotaInfo, v21);
    objc_msgSend(*(id *)((char *)&v5->super.super.isa + v6), "objectForKey:", CFSTR("storage_usage_by_media"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v45 = v10;
      v46 = v5;
      v51 = 0u;
      v52 = 0u;
      v49 = 0u;
      v50 = 0u;
      v44 = v22;
      v23 = v22;
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
      if (v24)
      {
        v25 = v24;
        v26 = *(_QWORD *)v50;
        v27 = CFSTR("media_key");
        v28 = 0x24BDD1000uLL;
        v29 = &unk_24E436448;
        do
        {
          v30 = 0;
          v48 = v25;
          do
          {
            if (*(_QWORD *)v50 != v26)
              objc_enumerationMutation(v23);
            v31 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v30);
            objc_msgSend(v31, "objectForKeyedSubscript:", v27);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v29, "objectForKeyedSubscript:", v32);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              if (v33)
              {
                objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("usage_in_bytes"));
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v35 = v26;
                  v36 = v27;
                  v37 = v28;
                  v38 = v23;
                  v39 = v29;
                  v40 = objc_msgSend(v34, "unsignedLongLongValue");
                  v41 = objc_msgSend(v33, "integerValue");
                  v42 = v40;
                  v29 = v39;
                  v23 = v38;
                  v28 = v37;
                  v27 = v36;
                  v26 = v35;
                  v25 = v48;
                  objc_msgSend(v47, "setStorageInUse:forMediaKind:", v42, v41);
                }

              }
            }

            ++v30;
          }
          while (v25 != v30);
          v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
        }
        while (v25);
      }

      v10 = v45;
      v5 = v46;
      v22 = v44;
    }

  }
  return v5;
}

- (NSString)manageStorageURLString
{
  return (NSString *)-[NSDictionary objectForKey:](self->_urls, "objectForKey:", CFSTR("quota.manage_storage_url"));
}

- (NSString)appDetailsURLString
{
  return (NSString *)-[NSDictionary objectForKey:](self->_urls, "objectForKey:", CFSTR("quota.app_details_url"));
}

- (unint64_t)totalStorage
{
  void *v2;
  unint64_t v3;

  -[NSDictionary objectForKey:](self->_quotaInfoDict, "objectForKey:", CFSTR("total_quota"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = objc_msgSend(v2, "unsignedLongLongValue");
  else
    v3 = 0;

  return v3;
}

- (NSString)totalStorageText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if (self->_basicAccount)
  {
    v3 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("DATA_MAIL"), &stru_24E400750, CFSTR("CloudGroup"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKey:](self->_quotaInfoDict, "objectForKey:", CFSTR("data_quota"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQQuotaInfoResponse _sizeStringFromBytes:](self, "_sizeStringFromBytes:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKey:](self->_quotaInfoDict, "objectForKey:", CFSTR("mail_quota"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQQuotaInfoResponse _sizeStringFromBytes:](self, "_sizeStringFromBytes:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", v5, v7, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[ICQQuotaInfoResponse totalStorage](self, "totalStorage"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQQuotaInfoResponse _sizeStringFromBytes:](self, "_sizeStringFromBytes:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v10;
}

- (unint64_t)usedStorage
{
  void *v2;
  unint64_t v3;

  -[NSDictionary objectForKey:](self->_quotaInfoDict, "objectForKey:", CFSTR("total_used"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = objc_msgSend(v2, "unsignedLongLongValue");
  else
    v3 = 0;

  return v3;
}

- (unint64_t)availableStorage
{
  void *v2;
  unint64_t v3;

  -[NSDictionary objectForKey:](self->_quotaInfoDict, "objectForKey:", CFSTR("total_available"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedLongLongValue");

  return v3;
}

- (NSString)availableStorageText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if (self->_basicAccount)
  {
    v3 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("DATA_MAIL"), &stru_24E400750, CFSTR("CloudGroup"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKey:](self->_quotaInfoDict, "objectForKey:", CFSTR("data_available"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQQuotaInfoResponse _sizeStringFromBytes:](self, "_sizeStringFromBytes:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKey:](self->_quotaInfoDict, "objectForKey:", CFSTR("mail_available"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQQuotaInfoResponse _sizeStringFromBytes:](self, "_sizeStringFromBytes:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", v5, v7, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[ICQQuotaInfoResponse availableStorage](self, "availableStorage"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQQuotaInfoResponse _sizeStringFromBytes:](self, "_sizeStringFromBytes:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v10;
}

- (id)storageFooter:(BOOL)a3
{
  NSArray **p_otherToolbarItems;
  NSArray *otherToolbarItems;
  void *v6;
  float v7;
  float v8;
  const __CFString *v9;
  void *v10;
  float v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  NSDictionary *quotaInfoDict;
  const __CFString *v17;
  void *v18;
  float v19;
  float v20;
  void *v21;
  float v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  NSArray *v33;
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
  void *v47;
  id v48;
  uint64_t v49;
  NSArray *v50;
  uint64_t v52;

  if (self->_basicAccount)
  {
    if (a3)
    {
      p_otherToolbarItems = &self->_otherToolbarItems;
      otherToolbarItems = self->_otherToolbarItems;
      if (!otherToolbarItems)
      {
        -[NSDictionary objectForKey:](self->_quotaInfoDict, "objectForKey:", CFSTR("data_used"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "floatValue");
        v8 = v7;
        v9 = CFSTR("data_quota");
        -[NSDictionary objectForKey:](self->_quotaInfoDict, "objectForKey:", CFSTR("data_quota"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "floatValue");
        v12 = (float)(v8 / v11);

        v13 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("AVAILABLE_OF_ON_CASTLE"), &stru_24E400750, CFSTR("CloudGroup"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        quotaInfoDict = self->_quotaInfoDict;
        v17 = CFSTR("data_available");
LABEL_7:
        -[NSDictionary objectForKey:](quotaInfoDict, "objectForKey:", v17);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "floatValue");
        CPFSSizeStrings();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary objectForKey:](self->_quotaInfoDict, "objectForKey:", v9);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "floatValue");
        CPFSSizeStrings();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringWithFormat:", v15, v24, v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        v28 = objc_alloc(MEMORY[0x24BDBCE30]);
        v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
        +[ICQCloudStorageMeteredBarButtonView barButtonItemWithString:andPercentUsed:](ICQCloudStorageMeteredBarButtonView, "barButtonItemWithString:andPercentUsed:", v27, v12);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
        v32 = objc_msgSend(v28, "initWithObjects:", v29, v30, v31, 0);
        v33 = *p_otherToolbarItems;
        *p_otherToolbarItems = (NSArray *)v32;
LABEL_10:

        otherToolbarItems = *p_otherToolbarItems;
      }
    }
    else
    {
      p_otherToolbarItems = &self->_topToolbarItems;
      otherToolbarItems = self->_topToolbarItems;
      if (!otherToolbarItems)
      {
        v34 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "localizedStringForKey:value:table:", CFSTR("AVAILABLE_OF"), &stru_24E400750, CFSTR("CloudGroup"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary objectForKey:](self->_quotaInfoDict, "objectForKey:", CFSTR("data_available"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "floatValue");
        CPFSSizeStrings();
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary objectForKey:](self->_quotaInfoDict, "objectForKey:", CFSTR("data_quota"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "floatValue");
        CPFSSizeStrings();
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "stringWithFormat:", v36, v38, v40);
        v52 = objc_claimAutoreleasedReturnValue();

        v41 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "localizedStringForKey:value:table:", CFSTR("AVAILABLE_OF"), &stru_24E400750, CFSTR("CloudGroup"));
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary objectForKey:](self->_quotaInfoDict, "objectForKey:", CFSTR("mail_available"));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "floatValue");
        CPFSSizeStrings();
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary objectForKey:](self->_quotaInfoDict, "objectForKey:", CFSTR("mail_quota"));
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "floatValue");
        CPFSSizeStrings();
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "stringWithFormat:", v43, v45, v47);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        v27 = (void *)v52;
        v48 = objc_alloc(MEMORY[0x24BDBCE30]);
        v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
        +[ICQCloudStorageDataAndMailBarButtonView barButtonItemWithData:andMail:](ICQCloudStorageDataAndMailBarButtonView, "barButtonItemWithData:andMail:", v52, v29);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
        v49 = objc_msgSend(v48, "initWithObjects:", v30, v31, v33, 0);
        v50 = *p_otherToolbarItems;
        *p_otherToolbarItems = (NSArray *)v49;

        goto LABEL_10;
      }
    }
  }
  else
  {
    p_otherToolbarItems = &self->_otherToolbarItems;
    otherToolbarItems = self->_otherToolbarItems;
    if (!otherToolbarItems)
    {
      -[NSDictionary objectForKey:](self->_quotaInfoDict, "objectForKey:", CFSTR("total_used"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "floatValue");
      v20 = v19;
      v9 = CFSTR("total_quota");
      -[NSDictionary objectForKey:](self->_quotaInfoDict, "objectForKey:", CFSTR("total_quota"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "floatValue");
      v12 = (float)(v20 / v22);

      v13 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("AVAILABLE_OF_ON_CASTLE"), &stru_24E400750, CFSTR("CloudGroup"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      quotaInfoDict = self->_quotaInfoDict;
      v17 = CFSTR("total_available");
      goto LABEL_7;
    }
  }
  return otherToolbarItems;
}

- (BOOL)hasPurchasedMoreStorage
{
  void *v2;
  BOOL v3;

  -[NSDictionary objectForKey:](self->_storageInfo, "objectForKey:", CFSTR("commerce_storage_in_bytes"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedLongLongValue") != 0;

  return v3;
}

- (id)_sizeStringFromBytes:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD1490], "stringFromByteCount:countStyle:", objc_msgSend(a3, "longLongValue"), 3);
}

- (NSDictionary)accountStatus
{
  return self->_accountStatus;
}

- (BOOL)isDetailed
{
  return self->_detailed;
}

- (PSQuotaInfo)quotaInfo
{
  return self->_quotaInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quotaInfo, 0);
  objc_storeStrong((id *)&self->_otherToolbarItems, 0);
  objc_storeStrong((id *)&self->_topToolbarItems, 0);
  objc_storeStrong((id *)&self->_urls, 0);
  objc_storeStrong((id *)&self->_accountStatus, 0);
  objc_storeStrong((id *)&self->_storageInfo, 0);
  objc_storeStrong((id *)&self->_quotaInfoDict, 0);
}

@end
