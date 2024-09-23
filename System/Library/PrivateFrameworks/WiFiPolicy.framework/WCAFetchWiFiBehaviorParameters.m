@implementation WCAFetchWiFiBehaviorParameters

+ (void)fetchWiFiBehaviorWithCompletion:(id)a3
{
  id v3;
  WCAFetchKeyValuesRequest *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  id v13;
  _QWORD v14[9];

  v14[8] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(WCAFetchKeyValuesRequest);
  v14[0] = CFSTR("WiFiInternalSSIDs");
  v14[1] = CFSTR("MacRandomization");
  v14[2] = CFSTR("SoftErrors");
  v14[3] = CFSTR("JTRN");
  v14[4] = CFSTR("DataPathTelemetry");
  v14[5] = CFSTR("WiFiAmbiguousSSIDs");
  v14[6] = CFSTR("AccessPointProfile");
  v14[7] = CFSTR("BeaconParsing");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WCAFetchKeyValuesRequest setKeys:](v4, "setKeys:", v5);

  +[WCAAsset wifiBehaviorPlistAsset](WCAAsset, "wifiBehaviorPlistAsset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WCAFetchRequest setAsset:](v4, "setAsset:", v6);

  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __66__WCAFetchWiFiBehaviorParameters_fetchWiFiBehaviorWithCompletion___block_invoke;
  v12 = &unk_1E881E6A8;
  v13 = v3;
  v7 = v3;
  -[WCAFetchRequest setCompletionHandler:](v4, "setCompletionHandler:", &v9);
  +[WCAClient sharedClient](WCAClient, "sharedClient", v9, v10, v11, v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "executeFetchRequest:", v4);

}

void __66__WCAFetchWiFiBehaviorParameters_fetchWiFiBehaviorWithCompletion___block_invoke(uint64_t a1, void *a2)
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  objc_class *v30;
  void *v31;
  uint64_t v32;
  id v33;

  v33 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v33;
    v4 = (void *)objc_opt_new();
    objc_msgSend(v3, "keyValues");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("WiFiInternalSSIDs"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "arrayValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setInternalSSIDs:", v7);

    objc_msgSend(v3, "keyValues");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("MacRandomization"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dictionaryValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDisabledMacRandomizationVersions:", v10);

    objc_msgSend(v3, "keyValues");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("SoftErrors"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dictionaryValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setSoftErrors:", v13);

    objc_msgSend(v3, "keyValues");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("DataPathTelemetry"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "dictionaryValue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDatapathTelemetry:", v16);

    objc_msgSend(v3, "keyValues");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("JTRN"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "dictionaryValue");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setJtrnDefaults:", v19);

    objc_msgSend(v3, "keyValues");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("WiFiAmbiguousSSIDs"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "arrayValue");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAmbiguousSSIDs:", v22);

    objc_msgSend(v3, "keyValues");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("AccessPointProfile"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "dictionaryValue");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setApProfile:", v25);

    objc_msgSend(v3, "keyValues");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("BeaconParsing"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "dictionaryValue");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBeaconParsing:", v28);

    v29 = *(_QWORD *)(a1 + 32);
    if (v29)
      (*(void (**)(uint64_t, void *))(v29 + 16))(v29, v4);

  }
  else
  {
    v30 = (objc_class *)objc_opt_class();
    NSStringFromClass(v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Error: Response is not of type WCAFetchKeyValuesResponse, instead its %@"), v31);

    v32 = *(_QWORD *)(a1 + 32);
    if (v32)
      (*(void (**)(uint64_t, _QWORD))(v32 + 16))(v32, 0);
  }

}

- (NSArray)internalSSIDs
{
  return self->_internalSSIDs;
}

- (void)setInternalSSIDs:(id)a3
{
  objc_storeStrong((id *)&self->_internalSSIDs, a3);
}

- (NSDictionary)disabledMacRandomizationVersions
{
  return self->_disabledMacRandomizationVersions;
}

- (void)setDisabledMacRandomizationVersions:(id)a3
{
  objc_storeStrong((id *)&self->_disabledMacRandomizationVersions, a3);
}

- (NSDictionary)softErrors
{
  return self->_softErrors;
}

- (void)setSoftErrors:(id)a3
{
  objc_storeStrong((id *)&self->_softErrors, a3);
}

- (NSDictionary)datapathTelemetry
{
  return self->_datapathTelemetry;
}

- (void)setDatapathTelemetry:(id)a3
{
  objc_storeStrong((id *)&self->_datapathTelemetry, a3);
}

- (NSDictionary)jtrnDefaults
{
  return self->_jtrnDefaults;
}

- (void)setJtrnDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_jtrnDefaults, a3);
}

- (NSArray)ambiguousSSIDs
{
  return self->_ambiguousSSIDs;
}

- (void)setAmbiguousSSIDs:(id)a3
{
  objc_storeStrong((id *)&self->_ambiguousSSIDs, a3);
}

- (NSDictionary)apProfile
{
  return self->_apProfile;
}

- (void)setApProfile:(id)a3
{
  objc_storeStrong((id *)&self->_apProfile, a3);
}

- (NSDictionary)beaconParsing
{
  return self->_beaconParsing;
}

- (void)setBeaconParsing:(id)a3
{
  objc_storeStrong((id *)&self->_beaconParsing, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_beaconParsing, 0);
  objc_storeStrong((id *)&self->_apProfile, 0);
  objc_storeStrong((id *)&self->_ambiguousSSIDs, 0);
  objc_storeStrong((id *)&self->_jtrnDefaults, 0);
  objc_storeStrong((id *)&self->_datapathTelemetry, 0);
  objc_storeStrong((id *)&self->_softErrors, 0);
  objc_storeStrong((id *)&self->_disabledMacRandomizationVersions, 0);
  objc_storeStrong((id *)&self->_internalSSIDs, 0);
}

@end
