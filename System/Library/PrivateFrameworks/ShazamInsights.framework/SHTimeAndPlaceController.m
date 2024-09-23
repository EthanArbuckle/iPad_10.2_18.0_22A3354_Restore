@implementation SHTimeAndPlaceController

- (void)affinityGroupsFromData:(id)a3 atLocation:(id)a4 onDate:(id)a5 completionHandler:(id)a6
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;

  v8 = a4;
  v9 = a6;
  v19 = 0;
  +[SHTimeAndPlaceServerResponseParser regionAffinityGroupsFromServerData:error:](SHTimeAndPlaceServerResponseParser, "regionAffinityGroupsFromServerData:error:", a3, &v19);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v19;
  if (v10)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __87__SHTimeAndPlaceController_affinityGroupsFromData_atLocation_onDate_completionHandler___block_invoke;
    v14[3] = &unk_24DCD25B0;
    v18 = v9;
    v15 = v8;
    v16 = v10;
    v17 = v12;
    v13 = v12;
    +[SHInsightsConfiguration fetchSharedInstanceWithCompletion:](SHInsightsConfiguration, "fetchSharedInstanceWithCompletion:", v14);

  }
  else
  {
    (*((void (**)(id, _QWORD, id))v9 + 2))(v9, 0, v11);
  }

}

void __87__SHTimeAndPlaceController_affinityGroupsFromData_atLocation_onDate_completionHandler___block_invoke(id *a1, void *a2)
{
  _QWORD v4[4];
  id v5;
  id v6;
  id v7;
  id v8;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __87__SHTimeAndPlaceController_affinityGroupsFromData_atLocation_onDate_completionHandler___block_invoke_2;
  v4[3] = &unk_24DCD23A8;
  v8 = a1[7];
  v5 = a1[4];
  v6 = a1[5];
  v7 = a1[6];
  objc_msgSend(a2, "geoHashLengthsWithCompletionHandler:", v4);

}

void __87__SHTimeAndPlaceController_affinityGroupsFromData_atLocation_onDate_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if (a4)
  {
    (*(void (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), 0, a4);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "sh_geohashOfLength:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v6 = *(id *)(a1 + 40);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v19 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v11, "regionsForGeohash:", v5, (_QWORD)v18);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "count");

          if (v13)
          {
            v14 = *(void **)(a1 + 48);
            objc_msgSend(v11, "affinityGroup");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "addObject:", v15);

          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v8);
    }

    v16 = *(_QWORD *)(a1 + 56);
    v17 = (void *)objc_msgSend(*(id *)(a1 + 48), "copy");
    (*(void (**)(uint64_t, void *, _QWORD))(v16 + 16))(v16, v17, 0);

  }
}

- (SHDataFetcher)dataFetcher
{
  return self->_dataFetcher;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataFetcher, 0);
}

@end
