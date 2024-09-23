@implementation WLAccessibilityMigrator

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
  return CFSTR("accessibility");
}

- (id)contentType
{
  return +[WLAccessibilityMigrator contentType](WLAccessibilityMigrator, "contentType");
}

- (id)dataType
{
  return +[WLAccessibilityMigrator contentType](WLAccessibilityMigrator, "contentType");
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
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  const __CFString *v27;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x24BDAC8D0];
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
      if (objc_msgSend(v13, "enableAccessibilityDisplayInversion"))
        _AXSInvertColorsSetEnabled();
      objc_msgSend(v14, "accessibilityFontScale");
      if (v15 > 0.0)
      {
        objc_msgSend(v14, "accessibilityFontScale");
        if (v16 != 1.0)
        {
          objc_msgSend(v14, "accessibilityFontScale");
          if (v17 < 1.29999995)
          {
            objc_msgSend(v14, "accessibilityFontScale");
            if (v18 < 1.14999998)
              objc_msgSend(v14, "accessibilityFontScale");
          }
          _AXSSetPreferredContentSizeCategoryName();
        }
      }
      if (v12)
        v12[2](v12, 1, 0);
    }
    else
    {
      _WLLog();
      if (v12)
      {
        v22 = (void *)MEMORY[0x24BDD1540];
        v23 = *MEMORY[0x24BEC2878];
        v26 = *MEMORY[0x24BDD0FC8];
        v27 = CFSTR("did fail to convert json");
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "errorWithDomain:code:userInfo:", v23, 1, v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        ((void (**)(id, uint64_t, void *))v12)[2](v12, 0, v25);
      }
    }
    goto LABEL_18;
  }
  _WLLog();
  if (v12)
  {
    v19 = (void *)MEMORY[0x24BDD1540];
    v20 = *MEMORY[0x24BEC2878];
    v28 = *MEMORY[0x24BDD0FC8];
    v29[0] = CFSTR("could not import anything from nil data");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "errorWithDomain:code:userInfo:", v20, 1, v21);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    ((void (**)(id, uint64_t, void *))v12)[2](v12, 0, v14);
LABEL_18:

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
