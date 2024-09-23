@implementation SHAffinityGroupQuery

+ (void)affinityGroupsForLocation:(id)a3 atDate:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __75__SHAffinityGroupQuery_affinityGroupsForLocation_atDate_completionHandler___block_invoke;
  v13[3] = &unk_24DCD23D0;
  v15 = v7;
  v16 = v9;
  v14 = v8;
  v10 = v7;
  v11 = v8;
  v12 = v9;
  +[SHInsightsConfiguration fetchSharedInstanceWithCompletion:](SHInsightsConfiguration, "fetchSharedInstanceWithCompletion:", v13);

}

void __75__SHAffinityGroupQuery_affinityGroupsForLocation_atDate_completionHandler___block_invoke(id *a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id v9;

  v3 = a2;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __75__SHAffinityGroupQuery_affinityGroupsForLocation_atDate_completionHandler___block_invoke_2;
  v5[3] = &unk_24DCD23A8;
  v9 = a1[6];
  v6 = v3;
  v7 = a1[4];
  v8 = a1[5];
  v4 = v3;
  objc_msgSend(v4, "geoHashLengthsWithCompletionHandler:", v5);

}

void __75__SHAffinityGroupQuery_affinityGroupsForLocation_atDate_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;

  if (a4)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    v5 = *(void **)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "sh_geohashOfLength:", a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __75__SHAffinityGroupQuery_affinityGroupsForLocation_atDate_completionHandler___block_invoke_3;
    v8[3] = &unk_24DCD2380;
    v11 = *(id *)(a1 + 56);
    v9 = *(id *)(a1 + 48);
    v10 = *(id *)(a1 + 40);
    objc_msgSend(v5, "geoChartsEndpointForDate:geoHash:completionHandler:", v6, v7, v8);

  }
}

void __75__SHAffinityGroupQuery_affinityGroupsForLocation_atDate_completionHandler___block_invoke_3(id *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;

  v3 = a2;
  if (v3)
  {
    +[SHDataFetcherFileInfo dataFetcherForSourceURL:](SHDataFetcherFileInfo, "dataFetcherForSourceURL:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = a1[4];
    v6 = a1[5];
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __75__SHAffinityGroupQuery_affinityGroupsForLocation_atDate_completionHandler___block_invoke_4;
    v7[3] = &unk_24DCD2358;
    v10 = a1[6];
    v8 = a1[4];
    v9 = a1[5];
    objc_msgSend(v4, "clusterDataAtURL:forLocation:date:completionHandler:", v3, v5, v6, v7);

  }
  else
  {
    (*((void (**)(void))a1[6] + 2))();
  }

}

void __75__SHAffinityGroupQuery_affinityGroupsForLocation_atDate_completionHandler___block_invoke_4(_QWORD *a1, void *a2)
{
  SHTimeAndPlaceController *v3;
  void *v4;
  id v5;

  v5 = a2;
  if (v5)
  {
    v3 = objc_alloc_init(SHTimeAndPlaceController);
    objc_msgSend(v5, "data");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHTimeAndPlaceController affinityGroupsFromData:atLocation:onDate:completionHandler:](v3, "affinityGroupsFromData:atLocation:onDate:completionHandler:", v4, a1[4], a1[5], a1[6]);

  }
  else
  {
    (*(void (**)(void))(a1[6] + 16))();
  }

}

@end
