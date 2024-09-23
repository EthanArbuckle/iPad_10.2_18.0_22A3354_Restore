@implementation PECopyActionEventBuilder

- (id)buildEvent
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[PECopyActionEventBuilder asset](self, "asset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PECopyActionEventBuilder asset](self, "asset");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, *MEMORY[0x24BE121B8]);

  }
  -[PECopyActionEventBuilder asset](self, "asset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PEAnalyticsUtility semanticStylesIdentifierForItem:](PEAnalyticsUtility, "semanticStylesIdentifierForItem:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && objc_msgSend(v7, "length"))
  {
    v15 = CFSTR("semantic_style");
    v16[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addEntriesFromDictionary:", v8);

  }
  -[PECopyActionEventBuilder copiedCompositionController](self, "copiedCompositionController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[PECopyActionEventBuilder copiedCompositionController](self, "copiedCompositionController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[PEAnalyticsUtility analyticPayloadForCompositionController:](PEAnalyticsUtility, "analyticPayloadForCompositionController:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "addEntriesFromDictionary:", v11);
  }
  -[PECopyActionEventBuilder configurationAnalyticsPayload](self, "configurationAnalyticsPayload");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[PECopyActionEventBuilder configurationAnalyticsPayload](self, "configurationAnalyticsPayload");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addEntriesFromDictionary:", v13);

  }
  return v3;
}

- (PEAsset)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
  objc_storeStrong((id *)&self->_asset, a3);
}

- (PICompositionController)copiedCompositionController
{
  return self->_copiedCompositionController;
}

- (void)setCopiedCompositionController:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDictionary)configurationAnalyticsPayload
{
  return self->_configurationAnalyticsPayload;
}

- (void)setConfigurationAnalyticsPayload:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationAnalyticsPayload, 0);
  objc_storeStrong((id *)&self->_copiedCompositionController, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

@end
