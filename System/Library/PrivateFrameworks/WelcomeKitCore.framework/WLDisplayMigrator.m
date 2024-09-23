@implementation WLDisplayMigrator

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

- (void)addWorkingTime:(unint64_t)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_featurePayload);
  objc_msgSend(WeakRetained, "setElapsedTime:", objc_msgSend(WeakRetained, "elapsedTime") + a3);

}

+ (id)contentType
{
  return CFSTR("display");
}

- (id)contentType
{
  return +[WLDisplayMigrator contentType](WLDisplayMigrator, "contentType");
}

- (id)dataType
{
  return +[WLDisplayMigrator contentType](WLDisplayMigrator, "contentType");
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

- (void)estimateItemSizeForSummary:(id)a3 account:(id)a4
{
  id v4;

  v4 = a3;
  if (!objc_msgSend(v4, "itemSize"))
    objc_msgSend(v4, "setItemSize:", 5242880);

}

- (void)importRecordData:(id)a3 summary:(id)a4 account:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  void (**v12)(id, uint64_t, _QWORD);
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  const __CFString *v24;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void (**)(id, uint64_t, _QWORD))a6;
  if (v9 && objc_msgSend(v9, "length"))
  {
    objc_msgSend(MEMORY[0x24BEC2818], "settingsWithData:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      objc_msgSend(MEMORY[0x24BEC2830], "setBool:forKey:", objc_msgSend(v13, "enableDisplayZoom"), CFSTR("enable_display_zoom"));
      if (objc_msgSend(v14, "enableDisplayDarkMode"))
      {
        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBEC58]), "initWithDelegate:", 0);
        objc_msgSend(v15, "setModeValue:", 2);

      }
      if (v12)
        v12[2](v12, 1, 0);
    }
    else
    {
      _WLLog();
      if (v12)
      {
        v19 = (void *)MEMORY[0x24BDD1540];
        v20 = *MEMORY[0x24BEC2878];
        v23 = *MEMORY[0x24BDD0FC8];
        v24 = CFSTR("did fail to convert json");
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "errorWithDomain:code:userInfo:", v20, 1, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        ((void (**)(id, uint64_t, void *))v12)[2](v12, 0, v22);
      }
    }
    goto LABEL_10;
  }
  _WLLog();
  if (v12)
  {
    v16 = (void *)MEMORY[0x24BDD1540];
    v17 = *MEMORY[0x24BEC2878];
    v25 = *MEMORY[0x24BDD0FC8];
    v26[0] = CFSTR("could not import anything from nil data");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", v17, 1, v18);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    ((void (**)(id, uint64_t, void *))v12)[2](v12, 0, v14);
LABEL_10:

  }
}

- (WLFeaturePayload)featurePayload
{
  return (WLFeaturePayload *)objc_loadWeakRetained((id *)&self->_featurePayload);
}

- (void)setFeaturePayload:(id)a3
{
  objc_storeWeak((id *)&self->_featurePayload, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_featurePayload);
}

@end
