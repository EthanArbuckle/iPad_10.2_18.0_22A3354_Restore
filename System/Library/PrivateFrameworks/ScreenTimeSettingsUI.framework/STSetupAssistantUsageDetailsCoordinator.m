@implementation STSetupAssistantUsageDetailsCoordinator

- (STSetupAssistantUsageDetailsCoordinator)init
{
  STSetupAssistantUsageDetailsCoordinator *v2;
  uint64_t v3;
  STUsageDetailsViewModel *viewModel;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v19.receiver = self;
  v19.super_class = (Class)STSetupAssistantUsageDetailsCoordinator;
  v2 = -[STSetupAssistantUsageDetailsCoordinator init](&v19, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    viewModel = v2->_viewModel;
    v2->_viewModel = (STUsageDetailsViewModel *)v3;

    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[STUsageDetailsViewModel setSelectedItemDisplayName:](v2->_viewModel, "setSelectedItemDisplayName:", v6);

    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_opt_new();
    objc_msgSend(v7, "startOfDayForDate:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dateByAddingUnit:value:toDate:options:", 0x2000, -1, v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v7, "maximumRangeOfUnit:", 512);
    if (objc_msgSend(v7, "component:fromDate:", 512, v10) == v11)
    {
      v12 = v10;
    }
    else
    {
      objc_msgSend(v7, "nextDateAfterDate:matchingUnit:value:options:", v10, 512, v11, 260);
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    v13 = v12;
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C0]), "initWithKey:ascending:", CFSTR("startDate"), 1);
    -[STSetupAssistantUsageDetailsCoordinator _introUsageItemsWithStartDate:](v2, "_introUsageItemsWithStartDate:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v14;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "sortedArrayUsingDescriptors:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[STUsageDetailsViewModel setWeekReportUsageItems:weekStartDate:lastUpdatedDate:](v2->_viewModel, "setWeekReportUsageItems:weekStartDate:lastUpdatedDate:", v17, v13, v8);
  }
  return v2;
}

- (id)appConfigByIdentifier
{
  return &unk_24DBBF1A0;
}

- (id)categoryConfigByIdentifier
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[4];
  _QWORD v6[5];

  v6[4] = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BE15790];
  v5[0] = *MEMORY[0x24BE157C8];
  v5[1] = v2;
  v6[0] = &unk_24DBBF1C8;
  v6[1] = &unk_24DBBF1F0;
  v3 = *MEMORY[0x24BE157A8];
  v5[2] = *MEMORY[0x24BE157B0];
  v5[3] = v3;
  v6[2] = &unk_24DBBF218;
  v6[3] = &unk_24DBBF240;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, v5, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_introUsageItemsWithStartDate:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  uint64_t v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t k;
  void *v40;
  void *v41;
  void *v42;
  uint64_t m;
  void *v44;
  uint32_t v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  id obj;
  uint64_t v56;
  void *v57;
  uint64_t v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _QWORD v64[4];
  _QWORD v65[4];
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_new();
  for (i = 0; i != 8; ++i)
  {
    objc_msgSend(v6, "setDay:", i);
    objc_msgSend(v5, "dateByAddingComponents:toDate:options:", v6, v3, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_opt_new();
    objc_msgSend(v9, "setItemType:", 1);
    objc_msgSend(v9, "setIdentifier:", CFSTR("ScreenTime"));
    objc_msgSend(v9, "setTimePeriod:", 0);
    objc_msgSend(v9, "setStartDate:", v8);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", (double)(arc4random_uniform(0x28u) + 80) / 100.0 * 9360.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTotalUsage:", v10);

    objc_msgSend(v4, "addObject:", v9);
  }
  v53 = v5;
  v54 = v4;
  -[STSetupAssistantUsageDetailsCoordinator appConfigByIdentifier](self, "appConfigByIdentifier");
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v11 = 0x24BE84000uLL;
  v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
  if (v51)
  {
    v50 = *(_QWORD *)v61;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v61 != v50)
          objc_enumerationMutation(obj);
        v56 = v12;
        v13 = *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * v12);
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("App Item %@"), v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(obj, "objectForKeyedSubscript:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("total"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "unsignedIntegerValue");

        for (j = 0; j != 8; ++j)
        {
          objc_msgSend(v6, "setDay:", j);
          objc_msgSend(v53, "dateByAddingComponents:toDate:options:", v6, v3, 0);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = (void *)objc_opt_new();
          objc_msgSend(v20, "setItemType:", 2);
          objc_msgSend(v20, "setIdentifier:", v14);
          v21 = (void *)objc_msgSend(objc_alloc(*(Class *)(v11 + 1648)), "initWithIdentifier:usageTrusted:", v13, 1);
          objc_msgSend(v20, "setTrustIdentifier:", v21);

          objc_msgSend(v20, "setTimePeriod:", 0);
          objc_msgSend(v20, "setStartDate:", v19);
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v17);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setTotalUsage:", v22);

          v11 = 0x24BE84000;
          objc_msgSend(v54, "addObject:", v20);

        }
        v12 = v56 + 1;
      }
      while (v56 + 1 != v51);
      v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
    }
    while (v51);
  }
  v23 = *MEMORY[0x24BE15790];
  v64[0] = *MEMORY[0x24BE157C8];
  v64[1] = v23;
  v65[0] = &unk_24DBBF268;
  v65[1] = &unk_24DBBF290;
  v24 = *MEMORY[0x24BE157A8];
  v64[2] = *MEMORY[0x24BE157B0];
  v64[3] = v24;
  v65[2] = &unk_24DBBF2B8;
  v65[3] = &unk_24DBBF2E0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v65, v64, 4);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "allKeys");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v25;
  if (objc_msgSend(v25, "count"))
  {
    v26 = 0;
    do
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Category Item %d"), v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = v26;
      objc_msgSend(v25, "objectAtIndexedSubscript:", v26);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "objectForKeyedSubscript:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("total"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "doubleValue");
      v32 = v31;

      v33 = 0;
      v34 = v32 * 8.0;
      do
      {
        objc_msgSend(v6, "setDay:", v33);
        objc_msgSend(v53, "dateByAddingComponents:toDate:options:", v6, v3, 0);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = (void *)objc_opt_new();
        objc_msgSend(v36, "setItemType:", 3);
        objc_msgSend(v36, "setIdentifier:", v27);
        v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE84670]), "initWithIdentifier:usageTrusted:", v28, 1);
        objc_msgSend(v36, "setTrustIdentifier:", v37);

        objc_msgSend(v36, "setTimePeriod:", 0);
        objc_msgSend(v36, "setStartDate:", v35);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v34 * ((double)(arc4random_uniform(0x28u) + 80) / 100.0));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "setTotalUsage:", v38);

        objc_msgSend(v54, "addObject:", v36);
        ++v33;
      }
      while (v33 != 8);

      ++v26;
      v25 = v52;
    }
    while (v59 + 1 < (unint64_t)objc_msgSend(v52, "count"));
  }
  for (k = 0; k != 8; ++k)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Notification App Item %d"), k);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDay:", k);
    objc_msgSend(v53, "dateByAddingComponents:toDate:options:", v6, v3, 0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = (void *)objc_opt_new();
    objc_msgSend(v42, "setItemType:", 5);
    objc_msgSend(v42, "setIdentifier:", v40);
    objc_msgSend(v42, "setTimePeriod:", 0);
    objc_msgSend(v42, "setStartDate:", v41);
    objc_msgSend(v42, "setTotalUsage:", &unk_24DBBEC88);
    objc_msgSend(v54, "addObject:", v42);

  }
  for (m = 0; m != 8; ++m)
  {
    objc_msgSend(v6, "setDay:", m);
    objc_msgSend(v53, "dateByAddingComponents:toDate:options:", v6, v3, 0);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "rangeOfUnit:inUnit:forDate:", 32, 16, v44);
    objc_msgSend(v6, "setHour:", arc4random_uniform(v45));
    objc_msgSend(v53, "dateByAddingComponents:toDate:options:", v6, v3, 0);
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    v47 = (void *)objc_opt_new();
    objc_msgSend(v47, "setItemType:", 6);
    objc_msgSend(v47, "setIdentifier:", CFSTR("Pickups"));
    objc_msgSend(v47, "setTimePeriod:", 0);
    objc_msgSend(v47, "setStartDate:", v46);
    objc_msgSend(v47, "setTotalUsage:", &unk_24DBBECA0);
    objc_msgSend(v54, "addObject:", v47);

  }
  v48 = (void *)objc_msgSend(v54, "copy");

  return v48;
}

- (NSArray)devices
{
  return self->_devices;
}

- (void)setDevices:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)selectedDeviceIdentifier
{
  return self->_selectedDeviceIdentifier;
}

- (void)setSelectedDeviceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (STUsageDetailsViewModel)viewModel
{
  return self->_viewModel;
}

- (BOOL)isRefreshing
{
  return self->_refreshing;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_selectedDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_devices, 0);
}

@end
