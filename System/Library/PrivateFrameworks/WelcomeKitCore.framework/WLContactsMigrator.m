@implementation WLContactsMigrator

- (void)estimateItemSizeForSummary:(id)a3 account:(id)a4
{
  id v4;

  v4 = a3;
  if (!objc_msgSend(v4, "itemSize"))
    objc_msgSend(v4, "setItemSize:", 512);

}

- (WLContactsMigrator)init
{
  WLContactsMigrator *v2;
  id v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WLContactsMigrator;
  v2 = -[WLContactsMigrator init](&v5, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x24BDBACF8]);
    -[WLContactsMigrator setContactStore:](v2, "setContactStore:", v3);

  }
  return v2;
}

- (void)enable
{
  WLFeaturePayload **p_featurePayload;
  id WeakRetained;
  id v4;

  p_featurePayload = &self->_featurePayload;
  WeakRetained = objc_loadWeakRetained((id *)&self->_featurePayload);
  objc_msgSend(WeakRetained, "setEnabled:", 1);

  v4 = objc_loadWeakRetained((id *)p_featurePayload);
  objc_msgSend(v4, "setState:", CFSTR("enabled"));

}

- (void)setState:(id)a3
{
  WLFeaturePayload **p_featurePayload;
  id v4;
  id WeakRetained;

  p_featurePayload = &self->_featurePayload;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_featurePayload);
  objc_msgSend(WeakRetained, "setState:", v4);

}

- (void)setEstimatedDataSize:(unint64_t)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_featurePayload);
  objc_msgSend(WeakRetained, "setSize:", a3);

}

- (void)addWorkingTime:(unint64_t)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_featurePayload);
  objc_msgSend(WeakRetained, "setElapsedTime:", objc_msgSend(WeakRetained, "elapsedTime") + a3);

}

+ (id)contentType
{
  return CFSTR("contacts");
}

- (id)contentType
{
  return +[WLContactsMigrator contentType](WLContactsMigrator, "contentType");
}

- (id)dataType
{
  return +[WLContactsMigrator contentType](WLContactsMigrator, "contentType");
}

- (BOOL)accountBased
{
  return 1;
}

- (BOOL)storeRecordDataInDatabase
{
  return 1;
}

- (BOOL)wantsSegmentedDownloads
{
  return 0;
}

- (id)importWillBegin
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_featurePayload);
  objc_msgSend(WeakRetained, "setSize:", 0);

  return 0;
}

- (void)importRecordData:(id)a3 summary:(id)a4 account:(id)a5 completion:(id)a6
{
  id v8;
  void (**v9)(id, uint64_t, id);
  id WeakRetained;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  CNContactStore *contactStore;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  id v36;
  uint64_t v37;
  const __CFString *v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (void (**)(id, uint64_t, id))a6;
  WeakRetained = objc_loadWeakRetained((id *)&self->_featurePayload);
  objc_msgSend(WeakRetained, "setCount:", objc_msgSend(WeakRetained, "count") + 1);

  v11 = objc_loadWeakRetained((id *)&self->_featurePayload);
  objc_msgSend(v11, "setSize:", objc_msgSend(v11, "size") + objc_msgSend(v8, "length"));

  if (!objc_msgSend(v8, "length"))
  {
    v14 = 0;
    v23 = 0;
    v12 = v8;
    if (!v9)
      goto LABEL_22;
    goto LABEL_21;
  }
  -[WLContactsMigrator _vcardDataWithoutCustomFieldsFromVcardData:](self, "_vcardDataWithoutCustomFieldsFromVcardData:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = 0;
  objc_msgSend(MEMORY[0x24BDBAD08], "contactsWithData:error:", v12, &v36);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v36;
  if (!objc_msgSend(v13, "count") || v14)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v12, "length"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    _WLLog();

    if (!v14)
    {
      v24 = (void *)MEMORY[0x24BDD1540];
      v25 = *MEMORY[0x24BEC2878];
      v37 = *MEMORY[0x24BDD0FC8];
      v38 = CFSTR("Can't make contact with contact data");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1, self, v29, 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "errorWithDomain:code:userInfo:", v25, 1, v26);
      v14 = (id)objc_claimAutoreleasedReturnValue();

    }
    v23 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v13, "count"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    _WLLog();

    v15 = objc_alloc_init(MEMORY[0x24BDBADA8]);
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v16 = v13;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v32, v39, 16, self, v27);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v33 != v19)
            objc_enumerationMutation(v16);
          v21 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "mutableCopy");
          objc_msgSend(v15, "addContact:toContainerWithIdentifier:", v21, 0);

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v32, v39, 16);
      }
      while (v18);
    }

    _WLLog();
    contactStore = self->_contactStore;
    v31 = 0;
    v23 = -[CNContactStore executeSaveRequest:error:](contactStore, "executeSaveRequest:error:", v15, &v31, self);
    v14 = v31;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v23);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    _WLLog();

    if ((_DWORD)v23 && !v14)
    {
      v23 = 1;
      goto LABEL_20;
    }
  }
  v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v12, 4);
  _WLLog();

LABEL_20:
  if (v9)
LABEL_21:
    v9[2](v9, v23, v14);
LABEL_22:

}

- (id)_vcardDataWithoutCustomFieldsFromVcardData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  char i;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v4, 4);
  v6 = v4;
  if (objc_msgSend(v5, "rangeOfString:options:range:", CFSTR("BEGIN:VCARD\r\n"), 1, 0, objc_msgSend(CFSTR("BEGIN:VCARD\r\n"), "length")) != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v4, "length"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v5, "length"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    _WLLog();

    v33 = v5;
    v8 = (void *)objc_msgSend(v5, "mutableCopy", self, v7, v31);
    v9 = objc_msgSend(v8, "length");
    v10 = 0;
    for (i = 0; ; i = 1)
    {
      objc_msgSend(MEMORY[0x24BDD1968], "valueWithRange:", v10, v9);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      _WLLog();

      v12 = objc_msgSend(v8, "rangeOfString:options:range:", CFSTR("\r\nX-ANDROID-CUSTOM"), 1, v10, v9, self, v26);
      if (v12 == 0x7FFFFFFFFFFFFFFFLL)
        break;
      v10 = v12;
      v14 = v13;
      objc_msgSend(MEMORY[0x24BDD1968], "valueWithRange:", v12, v13);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      _WLLog();

      v15 = v10 + v14;
      v16 = objc_msgSend(v8, "length", self, v27);
      v17 = v16 - v15;
      objc_msgSend(MEMORY[0x24BDD1968], "valueWithRange:", v15, v16 - v15);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      _WLLog();

      v18 = objc_msgSend(v8, "rangeOfString:options:range:", CFSTR("\r\n"), 1, v15, v17, self, v28);
      if (v18 == 0x7FFFFFFFFFFFFFFFLL)
        break;
      v20 = v18;
      v21 = v19;
      objc_msgSend(MEMORY[0x24BDD1968], "valueWithRange:", v18, v19);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      _WLLog();

      v22 = objc_msgSend(CFSTR("\r\n"), "length", self, v29) + v10;
      v23 = v20 + v21 - v22;
      objc_msgSend(MEMORY[0x24BDD1968], "valueWithRange:", v22, v23);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      _WLLog();

      objc_msgSend(v8, "replaceCharactersInRange:withString:", v22, v23, &stru_24E376E00, self, v30);
      v9 = objc_msgSend(v8, "length") - v10;
    }
    v6 = v4;
    if ((i & 1) != 0)
    {
      objc_msgSend(v8, "dataUsingEncoding:", 4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v6, "length"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v8, "length"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      _WLLog();

    }
    _WLLog();

    v5 = v33;
  }

  return v6;
}

- (WLFeaturePayload)featurePayload
{
  return (WLFeaturePayload *)objc_loadWeakRetained((id *)&self->_featurePayload);
}

- (void)setFeaturePayload:(id)a3
{
  objc_storeWeak((id *)&self->_featurePayload, a3);
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setContactStore:(id)a3
{
  objc_storeStrong((id *)&self->_contactStore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_destroyWeak((id *)&self->_featurePayload);
}

@end
