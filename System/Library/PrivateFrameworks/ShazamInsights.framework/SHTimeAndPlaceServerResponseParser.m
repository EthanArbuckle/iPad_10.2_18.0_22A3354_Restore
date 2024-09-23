@implementation SHTimeAndPlaceServerResponseParser

+ (id)regionAffinityGroupsFromServerData:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  SHAffinityGroup *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  SHRegion *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  SHRegion *v31;
  SHTimeAndPlaceAffinityGroup *v32;
  id v34;
  void *v35;
  void *v36;
  id obj;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  id v55;
  _BYTE v56[128];
  uint64_t v57;
  uint64_t v58;
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v55 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", a3, 0, &v55);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v55;
  v7 = v6;
  if (v5)
  {
    v34 = v6;
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("geoHash"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v35 = v5;
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("geoHashTrackPools"));
    obj = (id)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
    if (v40)
    {
      v39 = *(_QWORD *)v52;
      v9 = *MEMORY[0x24BDE9800];
      v36 = v8;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v52 != v39)
            objc_enumerationMutation(obj);
          v41 = v10;
          v11 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v10);
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("trackPool"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = -[SHAffinityGroup initWithType:cohesionLevel:]([SHAffinityGroup alloc], "initWithType:cohesionLevel:", 1, 1);
          v47 = 0u;
          v48 = 0u;
          v49 = 0u;
          v50 = 0u;
          v14 = v12;
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
          if (v15)
          {
            v16 = v15;
            v17 = *(_QWORD *)v48;
            do
            {
              for (i = 0; i != v16; ++i)
              {
                if (*(_QWORD *)v48 != v17)
                  objc_enumerationMutation(v14);
                v19 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * i);
                v20 = (void *)MEMORY[0x24BDE97D8];
                v57 = v9;
                v58 = v19;
                objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v58, &v57, 1);
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "mediaItemWithProperties:", v21);
                v22 = (void *)objc_claimAutoreleasedReturnValue();

                -[SHAffinityGroup appendMediaItem:](v13, "appendMediaItem:", v22);
              }
              v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
            }
            while (v16);
          }

          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("geoHashSuffixes"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDBCEB8], "array");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v23, "count"))
          {
            v45 = 0u;
            v46 = 0u;
            v43 = 0u;
            v44 = 0u;
            v25 = v23;
            v26 = -[SHRegion countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v43, v56, 16);
            if (v26)
            {
              v27 = v26;
              v38 = v23;
              v28 = *(_QWORD *)v44;
              do
              {
                for (j = 0; j != v27; ++j)
                {
                  if (*(_QWORD *)v44 != v28)
                    objc_enumerationMutation(v25);
                  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v42, *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * j));
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  v31 = -[SHRegion initWithGeohash:]([SHRegion alloc], "initWithGeohash:", v30);
                  objc_msgSend(v24, "addObject:", v31);

                }
                v27 = -[SHRegion countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v43, v56, 16);
              }
              while (v27);
              v8 = v36;
              v23 = v38;
            }
          }
          else
          {
            v25 = -[SHRegion initWithGeohash:]([SHRegion alloc], "initWithGeohash:", v42);
            objc_msgSend(v24, "addObject:", v25);
          }

          v32 = -[SHTimeAndPlaceAffinityGroup initWithRegions:affinityGroup:]([SHTimeAndPlaceAffinityGroup alloc], "initWithRegions:affinityGroup:", v24, v13);
          objc_msgSend(v8, "addObject:", v32);

          v10 = v41 + 1;
        }
        while (v41 + 1 != v40);
        v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
      }
      while (v40);
    }

    v7 = v34;
    v5 = v35;
  }
  else if (a4)
  {
    +[SHInsightsError errorWithCode:underlyingError:](SHInsightsError, "errorWithCode:underlyingError:", 200, v6);
    v8 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
