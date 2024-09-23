@implementation WFNextHourPrecipitation(WeatherAdditions)

- (uint64_t)initWithDictionary:()WeatherAdditions
{
  id v3;
  void *v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t k;
  void *v33;
  uint64_t v34;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v41;
  __int128 v42;
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
  _BYTE v54[128];
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "objectForKey:", 0x24DDA4038);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedIntegerValue");

  if (v5)
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", (double)v5);
  else
    objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", 0x24DDA4058);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntegerValue");

  if (v7)
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", (double)v7);
  else
    objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", 0x24DDA4078);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedIntegerValue");

  if (v9)
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", (double)v9);
  else
    objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", 0x24DDA4098);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v12 = v10;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v51;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v51 != v15)
          objc_enumerationMutation(v12);
        v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC2200]), "initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * i));
        objc_msgSend(v11, "addObject:", v17);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
    }
    while (v14);
  }
  v36 = v12;

  objc_msgSend(v3, "objectForKey:", 0x24DDA40B8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v20 = v18;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v47;
    do
    {
      for (j = 0; j != v22; ++j)
      {
        if (*(_QWORD *)v47 != v23)
          objc_enumerationMutation(v20);
        v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC21F8]), "initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * j), v36);
        objc_msgSend(v19, "addObject:", v25);

      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
    }
    while (v22);
  }

  v41 = v3;
  objc_msgSend(v3, "objectForKey:", 0x24DDA40D8);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v28 = v26;
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v43;
    do
    {
      for (k = 0; k != v30; ++k)
      {
        if (*(_QWORD *)v43 != v31)
          objc_enumerationMutation(v28);
        v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC21F0]), "initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * k));
        objc_msgSend(v27, "addObject:", v33);

      }
      v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
    }
    while (v30);
  }

  v34 = objc_msgSend(a1, "initWithReadDate:startDate:expirationDate:minutes:conditions:descriptions:", v39, v38, v37, v11, v27, v19);
  return v34;
}

- (id)dictionaryRepresentation
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _QWORD v46[6];
  _QWORD v47[6];
  _BYTE v48[128];
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(a1, "readDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSince1970");
  objc_msgSend(v2, "numberWithDouble:");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(a1, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSince1970");
  objc_msgSend(v4, "numberWithDouble:");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(a1, "expirationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSince1970");
  objc_msgSend(v6, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  objc_msgSend(a1, "minutes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v43;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v43 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * v14), "dictionaryRepresentation", v32);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
    }
    while (v12);
  }

  v16 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  objc_msgSend(a1, "precipitationDescriptions");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v38, v49, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v39;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v39 != v20)
          objc_enumerationMutation(v17);
        objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * v21), "dictionaryRepresentation", v32);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addObject:", v22);

        ++v21;
      }
      while (v19 != v21);
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v38, v49, 16);
    }
    while (v19);
  }

  v23 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  objc_msgSend(a1, "conditions");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v34, v48, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v35;
    do
    {
      v28 = 0;
      do
      {
        if (*(_QWORD *)v35 != v27)
          objc_enumerationMutation(v24);
        objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * v28), "dictionaryRepresentation", v32);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "addObject:", v29);

        ++v28;
      }
      while (v26 != v28);
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v34, v48, 16);
    }
    while (v26);
  }

  v46[0] = 0x24DDA4038;
  v46[1] = 0x24DDA4058;
  v47[0] = v33;
  v47[1] = v32;
  v46[2] = 0x24DDA4078;
  v46[3] = 0x24DDA4098;
  v47[2] = v8;
  v47[3] = v9;
  v46[4] = 0x24DDA40B8;
  v46[5] = 0x24DDA40D8;
  v47[4] = v16;
  v47[5] = v23;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v47, v46, 6);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  return v30;
}

@end
