@implementation SHInsightsConfiguration

+ (void)fetchSharedInstanceWithCompletion:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[16];

  v3 = a3;
  if (fetchSharedInstanceWithCompletion__onceToken != -1)
    dispatch_once(&fetchSharedInstanceWithCompletion__onceToken, &__block_literal_global_1);
  shcore_log_object();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21A508000, v4, OS_LOG_TYPE_DEBUG, "Fetching insights configuration...", buf, 2u);
  }

  objc_msgSend((id)fetchSharedInstanceWithCompletion__insights, "bagContract");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __61__SHInsightsConfiguration_fetchSharedInstanceWithCompletion___block_invoke_26;
  v7[3] = &unk_24DCD25F8;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "loadBaseDictionary:", v7);

}

void __61__SHInsightsConfiguration_fetchSharedInstanceWithCompletion___block_invoke()
{
  SHInsightsConfiguration *v0;
  void *v1;

  v0 = objc_alloc_init(SHInsightsConfiguration);
  v1 = (void *)fetchSharedInstanceWithCompletion__insights;
  fetchSharedInstanceWithCompletion__insights = (uint64_t)v0;

}

void __61__SHInsightsConfiguration_fetchSharedInstanceWithCompletion___block_invoke_26(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    shcore_log_object();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v5 = 138412290;
      v6 = v3;
      _os_log_impl(&dword_21A508000, v4, OS_LOG_TYPE_DEBUG, "Failed to load insights configuration %@, using defaults", (uint8_t *)&v5, 0xCu);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

+ (id)bagContract
{
  if (bagContract_onceToken != -1)
    dispatch_once(&bagContract_onceToken, &__block_literal_global_28);
  return (id)bagContract_bagContract;
}

uint64_t __38__SHInsightsConfiguration_bagContract__block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BE90520]), "initWithBaseDictionaryKey:profile:profileVersion:", CFSTR("shazam-insights"), CFSTR("Shazam"), CFSTR("1"));
  v1 = (void *)bagContract_bagContract;
  bagContract_bagContract = v0;

  objc_msgSend((id)bagContract_bagContract, "addBagKey:defaultValue:", CFSTR("geocharts/minGeohashLength"), &unk_24DCD5EE8);
  objc_msgSend((id)bagContract_bagContract, "addBagKey:defaultValue:", CFSTR("geocharts/maxGeohashLength"), &unk_24DCD5F00);
  objc_msgSend((id)bagContract_bagContract, "addBagKey:defaultValue:", CFSTR("targeting/updateInterval"), &unk_24DCD5F18);
  v2 = MEMORY[0x24BDBD1C0];
  objc_msgSend((id)bagContract_bagContract, "addBagKey:defaultValue:", CFSTR("targeting/enabled"), MEMORY[0x24BDBD1C0]);
  objc_msgSend((id)bagContract_bagContract, "addBagKey:defaultValue:", CFSTR("artists/maxAgeInSeconds"), &unk_24DCD5F18);
  return objc_msgSend((id)bagContract_bagContract, "addBagKey:defaultValue:", CFSTR("artists/enabled"), v2);
}

- (SHInsightsConfiguration)init
{
  SHInsightsConfiguration *v2;
  uint64_t v3;
  SHBagContract *bagContract;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SHInsightsConfiguration;
  v2 = -[SHInsightsConfiguration init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend((id)objc_opt_class(), "bagContract");
    v3 = objc_claimAutoreleasedReturnValue();
    bagContract = v2->_bagContract;
    v2->_bagContract = (SHBagContract *)v3;

  }
  return v2;
}

- (SHInsightsConfiguration)initWithBagContract:(id)a3
{
  id v5;
  SHInsightsConfiguration *v6;
  SHInsightsConfiguration *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SHInsightsConfiguration;
  v6 = -[SHInsightsConfiguration init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_bagContract, a3);

  return v7;
}

- (void)tracksCachedDataMaxAgeWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[SHInsightsConfiguration bagContract](self, "bagContract");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __71__SHInsightsConfiguration_tracksCachedDataMaxAgeWithCompletionHandler___block_invoke;
  v7[3] = &unk_24DCD2640;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "doubleBackedByStringForKey:completionHandler:", CFSTR("targeting/updateInterval"), v7);

}

uint64_t __71__SHInsightsConfiguration_tracksCachedDataMaxAgeWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)tracksEnabledWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[SHInsightsConfiguration bagContract](self, "bagContract");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __62__SHInsightsConfiguration_tracksEnabledWithCompletionHandler___block_invoke;
  v7[3] = &unk_24DCD2668;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "BOOLeanBackedByStringForKey:completionHandler:", CFSTR("targeting/enabled"), v7);

}

uint64_t __62__SHInsightsConfiguration_tracksEnabledWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)tracksClusterEndpointForStorefront:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __80__SHInsightsConfiguration_tracksClusterEndpointForStorefront_completionHandler___block_invoke;
  v10[3] = &unk_24DCD2690;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[SHInsightsConfiguration tokenizedURLForBagPathKey:completionHandler:](self, "tokenizedURLForBagPathKey:completionHandler:", CFSTR("targeting/path"), v10);

}

void __80__SHInsightsConfiguration_tracksClusterEndpointForStorefront_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = a2;
  v6 = v3;
  if (v3)
  {
    objc_msgSend(v3, "updateToken:withValue:", 3, *(_QWORD *)(a1 + 32));
    v4 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v6, "URLRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v4 + 16))(v4, v5, 0);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (void)artistsCachedDataMaxAgeWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[SHInsightsConfiguration bagContract](self, "bagContract");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __72__SHInsightsConfiguration_artistsCachedDataMaxAgeWithCompletionHandler___block_invoke;
  v7[3] = &unk_24DCD2640;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "doubleBackedByStringForKey:completionHandler:", CFSTR("artists/maxAgeInSeconds"), v7);

}

uint64_t __72__SHInsightsConfiguration_artistsCachedDataMaxAgeWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)artistsEnabledWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[SHInsightsConfiguration bagContract](self, "bagContract");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __63__SHInsightsConfiguration_artistsEnabledWithCompletionHandler___block_invoke;
  v7[3] = &unk_24DCD2668;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "BOOLeanBackedByStringForKey:completionHandler:", CFSTR("artists/enabled"), v7);

}

uint64_t __63__SHInsightsConfiguration_artistsEnabledWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)artistsClusterEndpointWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __71__SHInsightsConfiguration_artistsClusterEndpointWithCompletionHandler___block_invoke;
  v6[3] = &unk_24DCD26B8;
  v7 = v4;
  v5 = v4;
  -[SHInsightsConfiguration tokenizedURLForBagPathKey:completionHandler:](self, "tokenizedURLForBagPathKey:completionHandler:", CFSTR("artists/path"), v6);

}

void __71__SHInsightsConfiguration_artistsClusterEndpointWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "URLRepresentation");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);

}

- (void)geoChartsEndpointForDate:(id)a3 geoHash:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __78__SHInsightsConfiguration_geoChartsEndpointForDate_geoHash_completionHandler___block_invoke;
  v14[3] = &unk_24DCD26E0;
  v15 = v8;
  v16 = v9;
  v17 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  -[SHInsightsConfiguration tokenizedURLForBagPathKey:completionHandler:](self, "tokenizedURLForBagPathKey:completionHandler:", CFSTR("geocharts/path"), v14);

}

void __78__SHInsightsConfiguration_geoChartsEndpointForDate_geoHash_completionHandler___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "components:fromDate:", 8196, a1[4]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), objc_msgSend(v4, "year"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "updateToken:withValue:", 6, v5);

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), objc_msgSend(v4, "weekOfYear"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "updateToken:withValue:", 7, v6);

    objc_msgSend(v9, "updateToken:withValue:", 8, a1[5]);
    v7 = a1[6];
    objc_msgSend(v9, "URLRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v7 + 16))(v7, v8, 0);

  }
  else
  {
    (*(void (**)(void))(a1[6] + 16))();
  }

}

- (void)geoHashLengthsWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[SHInsightsConfiguration bagContract](self, "bagContract");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __63__SHInsightsConfiguration_geoHashLengthsWithCompletionHandler___block_invoke;
  v7[3] = &unk_24DCD2730;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "integerBackedByStringForKey:completionHandler:", CFSTR("geocharts/minGeohashLength"), v7);

}

void __63__SHInsightsConfiguration_geoHashLengthsWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint64_t v11;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "bagContract");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __63__SHInsightsConfiguration_geoHashLengthsWithCompletionHandler___block_invoke_2;
  v8[3] = &unk_24DCD2708;
  v10 = *(id *)(a1 + 40);
  v11 = a2;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "integerBackedByStringForKey:completionHandler:", CFSTR("geocharts/maxGeohashLength"), v8);

}

uint64_t __63__SHInsightsConfiguration_geoHashLengthsWithCompletionHandler___block_invoke_2(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  if (a1[4])
    a3 = a1[4];
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t, uint64_t))(a1[5] + 16))(a1[5], a1[6], a2, a3);
}

- (void)tokenizedURLForBagPathKey:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[SHInsightsConfiguration bagContract](self, "bagContract");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __71__SHInsightsConfiguration_tokenizedURLForBagPathKey_completionHandler___block_invoke;
  v11[3] = &unk_24DCD2780;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "stringForKey:withCompletionHandler:", CFSTR("baseURL"), v11);

}

void __71__SHInsightsConfiguration_tokenizedURLForBagPathKey_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "bagContract");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __71__SHInsightsConfiguration_tokenizedURLForBagPathKey_completionHandler___block_invoke_2;
  v7[3] = &unk_24DCD2758;
  v8 = v3;
  v5 = *(_QWORD *)(a1 + 40);
  v9 = *(id *)(a1 + 48);
  v6 = v3;
  objc_msgSend(v4, "stringForKey:withCompletionHandler:", v5, v7);

}

void __71__SHInsightsConfiguration_tokenizedURLForBagPathKey_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 40);
  v8 = v3;
  if (v3 && *(_QWORD *)(a1 + 32))
  {
    v5 = objc_alloc(MEMORY[0x24BE90568]);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), *(_QWORD *)(a1 + 32), v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithString:", v6);
    (*(void (**)(uint64_t, void *, _QWORD))(v4 + 16))(v4, v7, 0);

  }
  else
  {
    +[SHInsightsError errorWithCode:underlyingError:](SHInsightsError, "errorWithCode:underlyingError:", 200, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v4 + 16))(v4, 0, v6);
  }

}

- (SHBagContract)bagContract
{
  return self->_bagContract;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bagContract, 0);
}

@end
