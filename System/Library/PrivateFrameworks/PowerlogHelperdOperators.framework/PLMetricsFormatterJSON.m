@implementation PLMetricsFormatterJSON

- (PLMetricsFormatterJSON)init
{
  PLMetricsFormatterJSON *v2;
  void *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *allMetrics;
  NSMutableArray *v6;
  NSMutableArray *metricArray;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSArray *appTimeMapping;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSArray *appTimeUnpluggedMapping;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSArray *appBGTimeMapping;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  NSArray *appBGTimeUpMapping;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  NSArray *appTimeLocationActivityMapping;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  NSArray *appTimeCellularConditionMapping;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  NSArray *appNetworkIOWifiMapping;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  NSArray *appNetworkIOCellularMapping;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  NSArray *appDisplayAPLMapping;
  void *v68;
  int v69;
  void *v70;
  void *v71;
  unsigned int v72;
  void *v73;
  uint64_t v74;
  NSMutableArray *appEnergyFGMapping;
  uint64_t v76;
  NSMutableArray *appEnergyBGMapping;
  uint64_t v78;
  NSMutableArray *appEnergyTotalMapping;
  uint64_t v80;
  NSMutableArray *appEnergyBGAudioMapping;
  uint64_t v82;
  NSMutableArray *appEnergyBGLocationMapping;
  PLMetricsFormatterJSON *v84;
  void *v85;
  void *v86;
  void *v87;
  uint64_t v88;
  NSArray *diskIOMapping;
  void *v90;
  void *v91;
  void *v92;
  uint64_t v93;
  NSArray *memoryMapping;
  _QWORD v96[4];
  PLMetricsFormatterJSON *v97;
  objc_super v98;

  v98.receiver = self;
  v98.super_class = (Class)PLMetricsFormatterJSON;
  v2 = -[PLMetricsFormatterJSON init](&v98, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLMetricsFormatterJSON setLogFileTimeStamp:](v2, "setLogFileTimeStamp:", v3);

    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    allMetrics = v2->allMetrics;
    v2->allMetrics = v4;

    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    metricArray = v2->metricArray;
    v2->metricArray = v6;

    -[NSMutableDictionary setObject:forKey:](v2->allMetrics, "setObject:forKey:", v2->metricArray, CFSTR("metrics"));
    v8 = (void *)MEMORY[0x1E0C99D20];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("CPU"), CFSTR("CPUTime"), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("GPU"), CFSTR("GPUTime"), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("fg_total"), CFSTR("fgTime_Total"), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "arrayWithObjects:", v9, v10, v11, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    appTimeMapping = v2->appTimeMapping;
    v2->appTimeMapping = (NSArray *)v12;

    v14 = (void *)MEMORY[0x1E0C99D20];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("CPU"), CFSTR("CPUTime"), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("GPU"), CFSTR("GPUTime"), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("fg_unplugged"), CFSTR("fgTime_Unplugged"), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "arrayWithObjects:", v15, v16, v17, 0);
    v18 = objc_claimAutoreleasedReturnValue();
    appTimeUnpluggedMapping = v2->appTimeUnpluggedMapping;
    v2->appTimeUnpluggedMapping = (NSArray *)v18;

    v20 = (void *)MEMORY[0x1E0C99D20];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("total"), CFSTR("bgTime_Total"), 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("audio"), CFSTR("bgTime_Audio"), 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("location"), CFSTR("bgTime_Location"), 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("location_audio"), CFSTR("bgLocationAudioTime"), 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "arrayWithObjects:", v21, v22, v23, v24, 0);
    v25 = objc_claimAutoreleasedReturnValue();
    appBGTimeMapping = v2->appBGTimeMapping;
    v2->appBGTimeMapping = (NSArray *)v25;

    v27 = (void *)MEMORY[0x1E0C99D20];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("total"), CFSTR("bgTime_Unplugged"), 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("audio"), CFSTR("bgAudioTime_Unplugged"), 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("location"), CFSTR("bgLocationTime_Unplugged"), 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("location_audio"), CFSTR("bgLocationAudioTime_Unplugged"), 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "arrayWithObjects:", v28, v29, v30, v31, 0);
    v32 = objc_claimAutoreleasedReturnValue();
    appBGTimeUpMapping = v2->appBGTimeUpMapping;
    v2->appBGTimeUpMapping = (NSArray *)v32;

    v34 = (void *)MEMORY[0x1E0C99D20];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("bestAccuracy"), CFSTR("BestAccuracy"), 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("bestAccuracyForNavigation"), CFSTR("BestAccuracyForNavigation"), 0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("nearestTenMetersAccuracy"), CFSTR("NearestTenMetersAccuracy"), 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("hundredMetersAccuracy"), CFSTR("HundredMetersAccuracy"), 0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("kilometerAccuracy"), CFSTR("KilometerAccuracy"), 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("threeKilometersAccuracy"), CFSTR("ThreeKilometersAccuracy"), 0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "arrayWithObjects:", v35, v36, v37, v38, v39, v40, 0);
    v41 = objc_claimAutoreleasedReturnValue();
    appTimeLocationActivityMapping = v2->appTimeLocationActivityMapping;
    v2->appTimeLocationActivityMapping = (NSArray *)v41;

    v43 = (void *)MEMORY[0x1E0C99D20];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("signalBar0"), CFSTR("SignalBar0"), 0);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("signalBar1"), CFSTR("SignalBar1"), 0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("signalBar2"), CFSTR("SignalBar2"), 0);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("signalBar3"), CFSTR("SignalBar3"), 0);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("signalBar4"), CFSTR("SignalBar4"), 0);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("signalBar5"), CFSTR("SignalBar5"), 0);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("signalBarUnknown"), CFSTR("SignalBarUnknown"), 0);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "arrayWithObjects:", v44, v45, v46, v47, v48, v49, v50, 0);
    v51 = objc_claimAutoreleasedReturnValue();
    appTimeCellularConditionMapping = v2->appTimeCellularConditionMapping;
    v2->appTimeCellularConditionMapping = (NSArray *)v51;

    v53 = (void *)MEMORY[0x1E0C99D20];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("totalDownload"), CFSTR("bytesWifiIn"), 0);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("totalUpload"), CFSTR("bytesWifiOut"), 0);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "arrayWithObjects:", v54, v55, 0);
    v56 = objc_claimAutoreleasedReturnValue();
    appNetworkIOWifiMapping = v2->appNetworkIOWifiMapping;
    v2->appNetworkIOWifiMapping = (NSArray *)v56;

    v58 = (void *)MEMORY[0x1E0C99D20];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("totalDownload"), CFSTR("bytesCellularIn"), 0);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("totalUpload"), CFSTR("bytesCellularOut"), 0);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "arrayWithObjects:", v59, v60, 0);
    v61 = objc_claimAutoreleasedReturnValue();
    appNetworkIOCellularMapping = v2->appNetworkIOCellularMapping;
    v2->appNetworkIOCellularMapping = (NSArray *)v61;

    v63 = (void *)MEMORY[0x1E0C99D20];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("averagePixelLuminance"), CFSTR("AveragePictureLevel"), 0);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("totalFrameCount"), CFSTR("TotalFrameCount"), 0);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "arrayWithObjects:", v64, v65, 0);
    v66 = objc_claimAutoreleasedReturnValue();
    appDisplayAPLMapping = v2->appDisplayAPLMapping;
    v2->appDisplayAPLMapping = (NSArray *)v66;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = 1;
    do
    {
      v70 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", (__int16)v69);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = (unsigned __int16)v69;
      objc_msgSend(v70, "stringWithFormat:", CFSTR("%@"), v71);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "addObject:", v73);

      ++v69;
    }
    while (v72 < 0x11);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v74 = objc_claimAutoreleasedReturnValue();
    appEnergyFGMapping = v2->appEnergyFGMapping;
    v2->appEnergyFGMapping = (NSMutableArray *)v74;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v76 = objc_claimAutoreleasedReturnValue();
    appEnergyBGMapping = v2->appEnergyBGMapping;
    v2->appEnergyBGMapping = (NSMutableArray *)v76;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v78 = objc_claimAutoreleasedReturnValue();
    appEnergyTotalMapping = v2->appEnergyTotalMapping;
    v2->appEnergyTotalMapping = (NSMutableArray *)v78;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v80 = objc_claimAutoreleasedReturnValue();
    appEnergyBGAudioMapping = v2->appEnergyBGAudioMapping;
    v2->appEnergyBGAudioMapping = (NSMutableArray *)v80;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v82 = objc_claimAutoreleasedReturnValue();
    appEnergyBGLocationMapping = v2->appEnergyBGLocationMapping;
    v2->appEnergyBGLocationMapping = (NSMutableArray *)v82;

    v96[0] = MEMORY[0x1E0C809B0];
    v96[1] = 3221225472;
    v96[2] = __30__PLMetricsFormatterJSON_init__block_invoke;
    v96[3] = &unk_1EA16F6B0;
    v84 = v2;
    v97 = v84;
    objc_msgSend(v68, "enumerateObjectsUsingBlock:", v96);
    v85 = (void *)MEMORY[0x1E0C99D20];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("totalWrites"), CFSTR("byteswritten"), 0);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("totalReads"), CFSTR("bytesread"), 0);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "arrayWithObjects:", v86, v87, 0);
    v88 = objc_claimAutoreleasedReturnValue();
    diskIOMapping = v84->diskIOMapping;
    v84->diskIOMapping = (NSArray *)v88;

    v90 = (void *)MEMORY[0x1E0C99D20];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("peak"), CFSTR("PeakMemory"), 0);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("average"), CFSTR("AverageMemory"), 0);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "arrayWithObjects:", v91, v92, 0);
    v93 = objc_claimAutoreleasedReturnValue();
    memoryMapping = v84->memoryMapping;
    v84->memoryMapping = (NSArray *)v93;

  }
  return v2;
}

void __30__PLMetricsFormatterJSON_init__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = a2;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@%@"), CFSTR("fg"), v4);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("bg"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("bgAudio"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("bgLocation"), v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v4, v13, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v4, v5, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v4, v4, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v4, v6, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v4, v7, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "addObject:", v8);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "addObject:", v9);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "addObject:", v10);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "addObject:", v11);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "addObject:", v12);

}

- (id)customRound:(int)a3 precision:(int)a4
{
  void *v4;
  uint64_t v5;

  if (a3 >= a4)
  {
    v5 = (a3 / a4 * a4);
    v4 = (void *)MEMORY[0x1E0CB37E8];
    if (a3 - (int)v5 > (int)v5 + a4 - a3)
      v5 = (v5 + a4);
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    v5 = *(_QWORD *)&a4;
  }
  objc_msgSend(v4, "numberWithInt:", v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)roundArrayValuesToNearestX:(id)a3 precision:(int)a4
{
  uint64_t v4;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v4 = *(_QWORD *)&a4;
  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        -[PLMetricsFormatterJSON customRound:precision:](self, "customRound:precision:", objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v12), "intValue", (_QWORD)v16), v4);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  objc_msgSend(v7, "sortedArrayUsingSelector:", sel_compare_);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (BOOL)checkKeyExistence:(id)a3 secondLevel:(id)a4 dictToCheck:(id)a5
{
  id v7;
  void *v8;
  void *v9;

  v7 = a4;
  objc_msgSend(a5, "objectForKeyedSubscript:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9 != 0;
}

- (void)addSubKeysThirdLevel:(id)a3 extractFromHere:(id)a4 deviceFirstLevelMetric:(id)a5 firstLevelKey:(id)a6 secondLevelKey:(id)a7 thirdLevelKey:(id)a8 subKeyMap:(id)a9
{
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  PLMetricsFormatterJSON *v32;
  id v33;
  id v34;
  id v35;
  id v36;
  uint64_t v37;
  id obj;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v36 = a3;
  v15 = a4;
  v16 = a5;
  v35 = a6;
  v34 = a7;
  v33 = a8;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = a9;
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v41;
    v32 = self;
    do
    {
      v20 = 0;
      v37 = v18;
      do
      {
        if (*(_QWORD *)v41 != v19)
          objc_enumerationMutation(obj);
        v21 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v20);
        objc_msgSend(v21, "objectAtIndexedSubscript:", 1, v32);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = -[PLMetricsFormatterJSON checkKeyExistence:secondLevel:dictToCheck:](self, "checkKeyExistence:secondLevel:dictToCheck:", v16, v22, v15);

        if (v23)
        {
          objc_msgSend(v21, "objectAtIndexedSubscript:", 0);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "objectForKeyedSubscript:", v35);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "objectForKeyedSubscript:", v34);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "objectForKeyedSubscript:", v33);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectForKeyedSubscript:", v16);
          v27 = v15;
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "objectAtIndexedSubscript:", 1);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "objectForKeyedSubscript:", v29);
          v30 = v19;
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "setObject:forKey:", v31, v24);

          v19 = v30;
          v15 = v27;

          self = v32;
          v18 = v37;

        }
        ++v20;
      }
      while (v18 != v20);
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    }
    while (v18);
  }

}

- (void)addSubKeys:(id)a3 extractFromHere:(id)a4 deviceFirstLevelMetric:(id)a5 firstLevelKey:(id)a6 secondLevelKey:(id)a7 subKeyMap:(id)a8
{
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  uint64_t v35;
  id obj;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v34 = a3;
  v13 = a4;
  v14 = a5;
  v33 = a6;
  v15 = a7;
  v16 = v13;
  v32 = v15;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  obj = a8;
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v39;
    do
    {
      v20 = 0;
      v35 = v18;
      do
      {
        if (*(_QWORD *)v39 != v19)
          objc_enumerationMutation(obj);
        v21 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v20);
        objc_msgSend(v21, "objectAtIndexedSubscript:", 1, v32);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = -[PLMetricsFormatterJSON checkKeyExistence:secondLevel:dictToCheck:](self, "checkKeyExistence:secondLevel:dictToCheck:", v14, v22, v16);

        if (v23)
        {
          objc_msgSend(v21, "objectAtIndexedSubscript:", 0);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "objectForKeyedSubscript:", v33);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "objectForKeyedSubscript:", v32);
          v26 = v19;
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKeyedSubscript:", v14);
          v28 = v16;
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "objectAtIndexedSubscript:", 1);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "objectForKeyedSubscript:", v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "setObject:forKey:", v31, v24);

          v16 = v28;
          v19 = v26;
          v18 = v35;

        }
        ++v20;
      }
      while (v18 != v20);
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    }
    while (v18);
  }

}

- (void)addAppTime:(id)a3 userData:(id)a4
{
  void *v6;
  id v7;
  id v8;
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
  id v24;

  v6 = (void *)MEMORY[0x1E0C99E08];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "dictionary");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("power_metrics"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v24, CFSTR("app_time"));

  -[PLMetricsFormatterJSON addSubKeys:extractFromHere:deviceFirstLevelMetric:firstLevelKey:secondLevelKey:subKeyMap:](self, "addSubKeys:extractFromHere:deviceFirstLevelMetric:firstLevelKey:secondLevelKey:subKeyMap:", v8, v7);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("power_metrics"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("app_time"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKey:", v23, CFSTR("bg_total"));

  -[PLMetricsFormatterJSON addSubKeysThirdLevel:extractFromHere:deviceFirstLevelMetric:firstLevelKey:secondLevelKey:thirdLevelKey:subKeyMap:](self, "addSubKeysThirdLevel:extractFromHere:deviceFirstLevelMetric:firstLevelKey:secondLevelKey:thirdLevelKey:subKeyMap:", v8, v7, &unk_1EA1C07D0, CFSTR("power_metrics"), CFSTR("app_time"), CFSTR("bg_total"), self->appBGTimeMapping);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("power_metrics"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKey:", v22, CFSTR("fg_unplugged"));

  -[PLMetricsFormatterJSON addSubKeys:extractFromHere:deviceFirstLevelMetric:firstLevelKey:secondLevelKey:subKeyMap:](self, "addSubKeys:extractFromHere:deviceFirstLevelMetric:firstLevelKey:secondLevelKey:subKeyMap:", v8, v7, &unk_1EA1C07D0, CFSTR("power_metrics"), CFSTR("app_time"), self->appTimeUnpluggedMapping);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("power_metrics"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("app_time"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKey:", v21, CFSTR("bg_unplugged"));

  -[PLMetricsFormatterJSON addSubKeysThirdLevel:extractFromHere:deviceFirstLevelMetric:firstLevelKey:secondLevelKey:thirdLevelKey:subKeyMap:](self, "addSubKeysThirdLevel:extractFromHere:deviceFirstLevelMetric:firstLevelKey:secondLevelKey:thirdLevelKey:subKeyMap:", v8, v7, &unk_1EA1C07D0, CFSTR("power_metrics"), CFSTR("app_time"), CFSTR("bg_unplugged"), self->appBGTimeUpMapping);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("power_metrics"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("app_time"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKey:", v15, CFSTR("location_activity"));

  -[PLMetricsFormatterJSON addSubKeysThirdLevel:extractFromHere:deviceFirstLevelMetric:firstLevelKey:secondLevelKey:thirdLevelKey:subKeyMap:](self, "addSubKeysThirdLevel:extractFromHere:deviceFirstLevelMetric:firstLevelKey:secondLevelKey:thirdLevelKey:subKeyMap:", v8, v7, &unk_1EA1C07D0, CFSTR("power_metrics"), CFSTR("app_time"), CFSTR("location_activity"), self->appTimeLocationActivityMapping);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("power_metrics"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("app_time"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKey:", v18, CFSTR("cellular_condition"));

  -[PLMetricsFormatterJSON addSubKeysThirdLevel:extractFromHere:deviceFirstLevelMetric:firstLevelKey:secondLevelKey:thirdLevelKey:subKeyMap:](self, "addSubKeysThirdLevel:extractFromHere:deviceFirstLevelMetric:firstLevelKey:secondLevelKey:thirdLevelKey:subKeyMap:", v8, v7, &unk_1EA1C07D0, CFSTR("power_metrics"), CFSTR("app_time"), CFSTR("cellular_condition"), self->appTimeCellularConditionMapping);
}

- (void)addNetworkIO:(id)a3 userData:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v6 = (void *)MEMORY[0x1E0C99E08];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "dictionary");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("power_metrics"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v16, CFSTR("network_io"));

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("power_metrics"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("network_io"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKey:", v10, CFSTR("wifi"));

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("power_metrics"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("network_io"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKey:", v13, CFSTR("cellular"));

  -[PLMetricsFormatterJSON addSubKeysThirdLevel:extractFromHere:deviceFirstLevelMetric:firstLevelKey:secondLevelKey:thirdLevelKey:subKeyMap:](self, "addSubKeysThirdLevel:extractFromHere:deviceFirstLevelMetric:firstLevelKey:secondLevelKey:thirdLevelKey:subKeyMap:", v8, v7, &unk_1EA1C07D0, CFSTR("power_metrics"), CFSTR("network_io"), CFSTR("wifi"), self->appNetworkIOWifiMapping);
  -[PLMetricsFormatterJSON addSubKeysThirdLevel:extractFromHere:deviceFirstLevelMetric:firstLevelKey:secondLevelKey:thirdLevelKey:subKeyMap:](self, "addSubKeysThirdLevel:extractFromHere:deviceFirstLevelMetric:firstLevelKey:secondLevelKey:thirdLevelKey:subKeyMap:", v8, v7, &unk_1EA1C07D0, CFSTR("power_metrics"), CFSTR("network_io"), CFSTR("cellular"), self->appNetworkIOCellularMapping);

}

- (void)addDisplayAPL:(id)a3 userData:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v6 = (void *)MEMORY[0x1E0C99E08];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "dictionary");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("power_metrics"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v10, CFSTR("display_apl"));

  -[PLMetricsFormatterJSON addSubKeys:extractFromHere:deviceFirstLevelMetric:firstLevelKey:secondLevelKey:subKeyMap:](self, "addSubKeys:extractFromHere:deviceFirstLevelMetric:firstLevelKey:secondLevelKey:subKeyMap:", v8, v7, &unk_1EA1C07D0, CFSTR("power_metrics"), CFSTR("display_apl"), self->appDisplayAPLMapping);
}

- (void)addAppEnergy:(id)a3 userData:(id)a4
{
  void *v6;
  id v7;
  id v8;
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
  id v25;

  v6 = (void *)MEMORY[0x1E0C99E08];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "dictionary");
  v25 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("power_metrics"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v25, CFSTR("app_energy"));

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("power_metrics"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("app_energy"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKey:", v24, CFSTR("bg"));

  -[PLMetricsFormatterJSON addSubKeysThirdLevel:extractFromHere:deviceFirstLevelMetric:firstLevelKey:secondLevelKey:thirdLevelKey:subKeyMap:](self, "addSubKeysThirdLevel:extractFromHere:deviceFirstLevelMetric:firstLevelKey:secondLevelKey:thirdLevelKey:subKeyMap:", v8, v7, self->appEnergyBGMapping);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("power_metrics"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("app_energy"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKey:", v23, CFSTR("fg"));

  -[PLMetricsFormatterJSON addSubKeysThirdLevel:extractFromHere:deviceFirstLevelMetric:firstLevelKey:secondLevelKey:thirdLevelKey:subKeyMap:](self, "addSubKeysThirdLevel:extractFromHere:deviceFirstLevelMetric:firstLevelKey:secondLevelKey:thirdLevelKey:subKeyMap:", v8, v7, &unk_1EA1C07D0, CFSTR("power_metrics"), CFSTR("app_energy"), CFSTR("fg"), self->appEnergyFGMapping);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("power_metrics"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("app_energy"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKey:", v22, CFSTR("total"));

  -[PLMetricsFormatterJSON addSubKeysThirdLevel:extractFromHere:deviceFirstLevelMetric:firstLevelKey:secondLevelKey:thirdLevelKey:subKeyMap:](self, "addSubKeysThirdLevel:extractFromHere:deviceFirstLevelMetric:firstLevelKey:secondLevelKey:thirdLevelKey:subKeyMap:", v8, v7, &unk_1EA1C07D0, CFSTR("power_metrics"), CFSTR("app_energy"), CFSTR("total"), self->appEnergyTotalMapping);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("power_metrics"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("app_energy"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKey:", v16, CFSTR("bg_audio"));

  -[PLMetricsFormatterJSON addSubKeysThirdLevel:extractFromHere:deviceFirstLevelMetric:firstLevelKey:secondLevelKey:thirdLevelKey:subKeyMap:](self, "addSubKeysThirdLevel:extractFromHere:deviceFirstLevelMetric:firstLevelKey:secondLevelKey:thirdLevelKey:subKeyMap:", v8, v7, &unk_1EA1C07D0, CFSTR("power_metrics"), CFSTR("app_energy"), CFSTR("bg_audio"), self->appEnergyBGAudioMapping);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("power_metrics"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("app_energy"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setObject:forKey:", v19, CFSTR("bg_location"));

  -[PLMetricsFormatterJSON addSubKeysThirdLevel:extractFromHere:deviceFirstLevelMetric:firstLevelKey:secondLevelKey:thirdLevelKey:subKeyMap:](self, "addSubKeysThirdLevel:extractFromHere:deviceFirstLevelMetric:firstLevelKey:secondLevelKey:thirdLevelKey:subKeyMap:", v8, v7, &unk_1EA1C07D0, CFSTR("power_metrics"), CFSTR("app_energy"), CFSTR("bg_location"), self->appEnergyBGLocationMapping);
}

- (void)addDiskIO:(id)a3 userData:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v6 = (void *)MEMORY[0x1E0C99E08];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "dictionary");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("performance_metrics"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v10, CFSTR("disk_io"));

  -[PLMetricsFormatterJSON addSubKeys:extractFromHere:deviceFirstLevelMetric:firstLevelKey:secondLevelKey:subKeyMap:](self, "addSubKeys:extractFromHere:deviceFirstLevelMetric:firstLevelKey:secondLevelKey:subKeyMap:", v8, v7, &unk_1EA1C07E8, CFSTR("performance_metrics"), CFSTR("disk_io"), self->diskIOMapping);
}

- (void)addAppPerformanceKeysLaunch:(id)a3 userData:(id)a4 launchTimeData:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  PLMetricsFormatterJSON *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  _QWORD block[5];

  v7 = a3;
  v8 = a5;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("performance_metrics"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v9, CFSTR("app_performance"));

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("app_bundleid"));
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)v11;
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("app_bundleid"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      {
        v15 = objc_opt_class();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __78__PLMetricsFormatterJSON_addAppPerformanceKeysLaunch_userData_launchTimeData___block_invoke;
        block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        block[4] = v15;
        if (addAppPerformanceKeysLaunch_userData_launchTimeData__defaultOnce != -1)
          dispatch_once(&addAppPerformanceKeysLaunch_userData_launchTimeData__defaultOnce, block);
        if (addAppPerformanceKeysLaunch_userData_launchTimeData__classDebugEnabled)
        {
          v16 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("app_bundleid"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectForKeyedSubscript:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "stringWithFormat:", CFSTR("This is the data object: %@ %@"), CFSTR("app_bundleid"), v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          v20 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/PLMetricsFormatterJSON.m");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "lastPathComponent");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMetricsFormatterJSON addAppPerformanceKeysLaunch:userData:launchTimeData:]");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "logMessage:fromFile:fromFunction:fromLineNumber:", v19, v22, v23, 482);

          PLLogCommon();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
            __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

        }
      }
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("app_bundleid"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "objectForKeyedSubscript:", &unk_1EA1C0800);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLMetricsFormatterJSON roundArrayValuesToNearestX:precision:](self, "roundArrayValuesToNearestX:precision:", v28, 50);
      v29 = self;
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setObject:forKeyedSubscript:", v30, CFSTR("sessions"));

      v31 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("app_bundleid"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "objectForKeyedSubscript:", &unk_1EA1C0800);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "numberWithLong:", objc_msgSend(v34, "count"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setObject:forKeyedSubscript:", v35, CFSTR("count"));

      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("app_bundleid"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "objectForKeyedSubscript:", &unk_1EA1C0818);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLMetricsFormatterJSON roundArrayValuesToNearestX:precision:](v29, "roundArrayValuesToNearestX:precision:", v39, 50);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setObject:forKeyedSubscript:", v40, CFSTR("sessions"));

      v41 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("app_bundleid"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "objectForKeyedSubscript:", &unk_1EA1C0818);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "numberWithLong:", objc_msgSend(v44, "count"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setObject:forKeyedSubscript:", v45, CFSTR("count"));

      objc_msgSend(v48, "setObject:forKeyedSubscript:", v25, CFSTR("fg"));
      objc_msgSend(v48, "setObject:forKeyedSubscript:", v36, CFSTR("bg"));
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("performance_metrics"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("app_performance"));
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "setObject:forKey:", v48, CFSTR("launch"));

    }
  }

}

uint64_t __78__PLMetricsFormatterJSON_addAppPerformanceKeysLaunch_userData_launchTimeData___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  addAppPerformanceKeysLaunch_userData_launchTimeData__classDebugEnabled = result;
  return result;
}

- (void)addAppPerformanceKeysActivations:(id)a3 activationData:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  _QWORD v61[5];
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _QWORD block[5];
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[128];
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("app_bundleid"));
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("app_bundleid"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v57 = v6;
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("app_bundleid"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = v7;
      objc_msgSend(v7, "objectForKeyedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v13, "mutableCopy");

      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = v14;
      v67 = 0u;
      v68 = 0u;
      v69 = 0u;
      v70 = 0u;
      objc_msgSend(v14, "objectForKeyedSubscript:", &unk_1EA1C0800);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "allKeys");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v67, v72, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v68;
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v68 != v19)
              objc_enumerationMutation(v16);
            v21 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * i);
            objc_msgSend(v60, "objectForKeyedSubscript:", &unk_1EA1C0800);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "objectForKeyedSubscript:", v21);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            -[PLMetricsFormatterJSON roundArrayValuesToNearestX:precision:](self, "roundArrayValuesToNearestX:precision:", v23, 50);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "stringValue");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v59, "setObject:forKeyedSubscript:", v24, v25);

          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v67, v72, 16);
        }
        while (v18);
      }

      if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      {
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __74__PLMetricsFormatterJSON_addAppPerformanceKeysActivations_activationData___block_invoke;
        block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        block[4] = objc_opt_class();
        if (addAppPerformanceKeysActivations_activationData__defaultOnce != -1)
          dispatch_once(&addAppPerformanceKeysActivations_activationData__defaultOnce, block);
        if (addAppPerformanceKeysActivations_activationData__classDebugEnabled)
        {
          v26 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v57, "objectForKeyedSubscript:", CFSTR("app_bundleid"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "stringWithFormat:", CFSTR("%@ FG Activation Data: %@"), v27, v59);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          v29 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/PLMetricsFormatterJSON.m");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "lastPathComponent");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMetricsFormatterJSON addAppPerformanceKeysActivations:activationData:]");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "logMessage:fromFile:fromFunction:fromLineNumber:", v28, v31, v32, 517);

          PLLogCommon();
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
            __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

        }
      }
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = 0u;
      v63 = 0u;
      v64 = 0u;
      v65 = 0u;
      objc_msgSend(v60, "objectForKeyedSubscript:", &unk_1EA1C0818);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "allKeys");
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v62, v71, 16);
      if (v36)
      {
        v37 = v36;
        v38 = *(_QWORD *)v63;
        do
        {
          for (j = 0; j != v37; ++j)
          {
            if (*(_QWORD *)v63 != v38)
              objc_enumerationMutation(v35);
            v40 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * j);
            objc_msgSend(v60, "objectForKeyedSubscript:", &unk_1EA1C0818);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "objectForKeyedSubscript:", v40);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            -[PLMetricsFormatterJSON roundArrayValuesToNearestX:precision:](self, "roundArrayValuesToNearestX:precision:", v42, 50);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "stringValue");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v58, "setObject:forKeyedSubscript:", v43, v44);

          }
          v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v62, v71, 16);
        }
        while (v37);
      }

      v6 = v57;
      if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      {
        v45 = objc_opt_class();
        v61[0] = MEMORY[0x1E0C809B0];
        v61[1] = 3221225472;
        v61[2] = __74__PLMetricsFormatterJSON_addAppPerformanceKeysActivations_activationData___block_invoke_210;
        v61[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v61[4] = v45;
        if (addAppPerformanceKeysActivations_activationData__defaultOnce_208 != -1)
          dispatch_once(&addAppPerformanceKeysActivations_activationData__defaultOnce_208, v61);
        if (addAppPerformanceKeysActivations_activationData__classDebugEnabled_209)
        {
          v46 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v57, "objectForKeyedSubscript:", CFSTR("app_bundleid"));
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "stringWithFormat:", CFSTR("%@ BG Activation Data: %@"), v47, v58);
          v48 = (void *)objc_claimAutoreleasedReturnValue();

          v49 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/PLMetricsFormatterJSON.m");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "lastPathComponent");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMetricsFormatterJSON addAppPerformanceKeysActivations:activationData:]");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "logMessage:fromFile:fromFunction:fromLineNumber:", v48, v51, v52, 522);

          PLLogCommon();
          v53 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
            __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

        }
      }
      objc_msgSend(v60, "removeObjectsForKeys:", &unk_1EA1DBF50);
      objc_msgSend(v60, "setObject:forKeyedSubscript:", v59, CFSTR("fg"));
      objc_msgSend(v60, "setObject:forKeyedSubscript:", v58, CFSTR("bg"));
      objc_msgSend(v57, "objectForKeyedSubscript:", CFSTR("performance_metrics"));
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "objectForKeyedSubscript:", CFSTR("app_performance"));
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "setObject:forKeyedSubscript:", v60, CFSTR("activation"));

      v7 = v56;
    }
  }

}

uint64_t __74__PLMetricsFormatterJSON_addAppPerformanceKeysActivations_activationData___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  addAppPerformanceKeysActivations_activationData__classDebugEnabled = result;
  return result;
}

uint64_t __74__PLMetricsFormatterJSON_addAppPerformanceKeysActivations_activationData___block_invoke_210(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  addAppPerformanceKeysActivations_activationData__classDebugEnabled_209 = result;
  return result;
}

- (void)addAppPerformanceKeysResume:(id)a3 userData:(id)a4 resumeTimeData:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD block[5];

  v7 = a3;
  v8 = a5;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("app_bundleid"));
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("app_bundleid"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      {
        v14 = objc_opt_class();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __78__PLMetricsFormatterJSON_addAppPerformanceKeysResume_userData_resumeTimeData___block_invoke;
        block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        block[4] = v14;
        if (addAppPerformanceKeysResume_userData_resumeTimeData__defaultOnce != -1)
          dispatch_once(&addAppPerformanceKeysResume_userData_resumeTimeData__defaultOnce, block);
        if (addAppPerformanceKeysResume_userData_resumeTimeData__classDebugEnabled)
        {
          v15 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("app_bundleid"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectForKeyedSubscript:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "stringWithFormat:", CFSTR("This is the data object: %@ %@"), CFSTR("app_bundleid"), v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          v19 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/PLMetricsFormatterJSON.m");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "lastPathComponent");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMetricsFormatterJSON addAppPerformanceKeysResume:userData:resumeTimeData:]");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "logMessage:fromFile:fromFunction:fromLineNumber:", v18, v21, v22, 550);

          PLLogCommon();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
            __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

        }
      }
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("app_bundleid"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLMetricsFormatterJSON roundArrayValuesToNearestX:precision:](self, "roundArrayValuesToNearestX:precision:", v25, 5);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v26, CFSTR("sessions"));

      v27 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("app_bundleid"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "numberWithLong:", objc_msgSend(v29, "count"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v30, CFSTR("count"));

      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("performance_metrics"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("app_performance"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setObject:forKey:", v13, CFSTR("resume"));

    }
  }

}

uint64_t __78__PLMetricsFormatterJSON_addAppPerformanceKeysResume_userData_resumeTimeData___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  addAppPerformanceKeysResume_userData_resumeTimeData__classDebugEnabled = result;
  return result;
}

- (void)addAppPerformanceKeysHang:(id)a3 userData:(id)a4 hangTimeData:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD block[5];

  v7 = a3;
  v8 = a5;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("app_bundleid"));
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("app_bundleid"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      {
        v14 = objc_opt_class();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __74__PLMetricsFormatterJSON_addAppPerformanceKeysHang_userData_hangTimeData___block_invoke;
        block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        block[4] = v14;
        if (addAppPerformanceKeysHang_userData_hangTimeData__defaultOnce != -1)
          dispatch_once(&addAppPerformanceKeysHang_userData_hangTimeData__defaultOnce, block);
        if (addAppPerformanceKeysHang_userData_hangTimeData__classDebugEnabled)
        {
          v15 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("app_bundleid"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectForKeyedSubscript:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "stringWithFormat:", CFSTR("This is the data object: %@ %@"), CFSTR("app_bundleid"), v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          v19 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/PLMetricsFormatterJSON.m");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "lastPathComponent");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMetricsFormatterJSON addAppPerformanceKeysHang:userData:hangTimeData:]");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "logMessage:fromFile:fromFunction:fromLineNumber:", v18, v21, v22, 578);

          PLLogCommon();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
            __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

        }
      }
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("app_bundleid"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLMetricsFormatterJSON roundArrayValuesToNearestX:precision:](self, "roundArrayValuesToNearestX:precision:", v25, 10);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v26, CFSTR("sessions"));

      v27 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("app_bundleid"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "numberWithLong:", objc_msgSend(v29, "count"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v30, CFSTR("count"));

      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("performance_metrics"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("app_performance"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setObject:forKey:", v13, CFSTR("hang"));

    }
  }

}

uint64_t __74__PLMetricsFormatterJSON_addAppPerformanceKeysHang_userData_hangTimeData___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  addAppPerformanceKeysHang_userData_hangTimeData__classDebugEnabled = result;
  return result;
}

- (void)addAppPerformanceKeysGlitch:(id)a3 scrollGlitchData:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v5 = a4;
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("app_bundleid"));
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("app_bundleid"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = (void *)MEMORY[0x1E0C99E08];
      objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("app_bundleid"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "dictionaryWithDictionary:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("performance_metrics"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("app_performance"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKey:", v13, CFSTR("animation"));

    }
  }

}

- (void)addAppPerformanceKeysExits:(id)a3 processExitData:(id)a4
{
  id v5;
  uint64_t v6;
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
  id v19;

  v19 = a3;
  v5 = a4;
  objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("app_bundleid"));
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("app_bundleid"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("app_bundleid"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v11, "mutableCopy");

      objc_msgSend(v12, "objectForKeyedSubscript:", &unk_1EA1C0800);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLMetricsFormatterMetricKit categorizeAppExits:](PLMetricsFormatterMetricKit, "categorizeAppExits:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "objectForKeyedSubscript:", &unk_1EA1C0818);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLMetricsFormatterMetricKit categorizeAppExits:](PLMetricsFormatterMetricKit, "categorizeAppExits:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "removeObjectsForKeys:", &unk_1EA1DBF68);
      objc_msgSend(v12, "setObject:forKey:", v14, CFSTR("fg"));
      objc_msgSend(v12, "setObject:forKey:", v16, CFSTR("bg"));
      objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("performance_metrics"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("app_performance"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v12, CFSTR("processExits"));

    }
  }

}

- (void)addAppMemoryKeys:(id)a3 userData:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v6 = (void *)MEMORY[0x1E0C99E08];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "dictionary");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("performance_metrics"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v10, CFSTR("memory"));

  -[PLMetricsFormatterJSON addSubKeys:extractFromHere:deviceFirstLevelMetric:firstLevelKey:secondLevelKey:subKeyMap:](self, "addSubKeys:extractFromHere:deviceFirstLevelMetric:firstLevelKey:secondLevelKey:subKeyMap:", v8, v7, &unk_1EA1C07E8, CFSTR("performance_metrics"), CFSTR("memory"), self->memoryMapping);
}

- (void)addPowerMetrics:(id)a3 userData:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  -[PLMetricsFormatterJSON addAppTime:userData:](self, "addAppTime:userData:", v7, v6);
  -[PLMetricsFormatterJSON addNetworkIO:userData:](self, "addNetworkIO:userData:", v7, v6);
  -[PLMetricsFormatterJSON addDisplayAPL:userData:](self, "addDisplayAPL:userData:", v7, v6);
  -[PLMetricsFormatterJSON addAppEnergy:userData:](self, "addAppEnergy:userData:", v7, v6);

}

- (void)addPerformanceMetrics:(id)a3 userData:(id)a4 signpostData:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v8 = a5;
  v9 = a4;
  v16 = a3;
  -[PLMetricsFormatterJSON addDiskIO:userData:](self, "addDiskIO:userData:", v16, v9);
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("launchDurations"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLMetricsFormatterJSON addAppPerformanceKeysLaunch:userData:launchTimeData:](self, "addAppPerformanceKeysLaunch:userData:launchTimeData:", v16, v9, v10);

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("resumeDurations"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLMetricsFormatterJSON addAppPerformanceKeysResume:userData:resumeTimeData:](self, "addAppPerformanceKeysResume:userData:resumeTimeData:", v16, v9, v11);

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("hangDurations"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLMetricsFormatterJSON addAppPerformanceKeysHang:userData:hangTimeData:](self, "addAppPerformanceKeysHang:userData:hangTimeData:", v16, v9, v12);

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("scrollGlitches"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLMetricsFormatterJSON addAppPerformanceKeysGlitch:scrollGlitchData:](self, "addAppPerformanceKeysGlitch:scrollGlitchData:", v16, v13);

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("processExits"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLMetricsFormatterJSON addAppPerformanceKeysExits:processExitData:](self, "addAppPerformanceKeysExits:processExitData:", v16, v14);

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("activationDurations"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLMetricsFormatterJSON addAppPerformanceKeysActivations:activationData:](self, "addAppPerformanceKeysActivations:activationData:", v16, v15);
  -[PLMetricsFormatterJSON addAppMemoryKeys:userData:](self, "addAppMemoryKeys:userData:", v16, v9);

}

- (void)addAppMetaData:(id)a3 userData:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  objc_msgSend(a4, "objectForKeyedSubscript:", &unk_1EA1C0830);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addEntriesFromDictionary:", v6);

}

- (void)addAllMetrics:(id)a3 signpostData:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v19 = a4;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = v6;
  v20 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v20)
  {
    v18 = *(_QWORD *)v22;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v22 != v18)
          objc_enumerationMutation(v7);
        v9 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v8);
        v10 = (void *)MEMORY[0x1DF0A47AC]();
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:forKey:", v12, CFSTR("power_metrics"));
        objc_msgSend(v11, "setObject:forKey:", v13, CFSTR("performance_metrics"));
        objc_msgSend(v7, "objectForKeyedSubscript:", v9);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLMetricsFormatterJSON addAppMetaData:userData:](self, "addAppMetaData:userData:", v11, v14);

        objc_msgSend(v7, "objectForKeyedSubscript:", v9);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLMetricsFormatterJSON addPowerMetrics:userData:](self, "addPowerMetrics:userData:", v11, v15);

        objc_msgSend(v7, "objectForKeyedSubscript:", v9);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLMetricsFormatterJSON addPerformanceMetrics:userData:signpostData:](self, "addPerformanceMetrics:userData:signpostData:", v11, v16, v19);

        -[PLMetricsFormatterJSON sanitizeDictionary:](self, "sanitizeDictionary:", v11);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLMetricsFormatterJSON addAppMetric:](self, "addAppMetric:", v17);
        -[PLMetricsFormatterJSON sendAppMetricToCoreAnalytics:](self, "sendAppMetricToCoreAnalytics:", v17);

        objc_autoreleasePoolPop(v10);
        ++v8;
      }
      while (v20 != v8);
      v20 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v20);
  }

}

- (void)addGlobalMetaData:(id)a3
{
  -[NSMutableDictionary addEntriesFromDictionary:](self->allMetrics, "addEntriesFromDictionary:", a3);
}

- (id)sanitizeDictionary:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v3, "objectForKeyedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v3, "objectForKeyedSubscript:", v9);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "count");

          if (!v12)
            goto LABEL_10;
          objc_msgSend(v3, "objectForKeyedSubscript:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLMetricsFormatterJSON sanitizeDictionary:](self, "sanitizeDictionary:", v10);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, v9);

        }
LABEL_10:
        objc_msgSend(v3, "objectForKeyedSubscript:", v9);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v3, "objectForKeyedSubscript:", v9);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "count");

          if (!v16)
            objc_msgSend(v3, "removeObjectForKey:", v9);
        }
        else
        {

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)getOSVersion
{
  if (getOSVersion_onceToken != -1)
    dispatch_once(&getOSVersion_onceToken, &__block_literal_global_18);
  return (id)getOSVersion_osVersion;
}

void __38__PLMetricsFormatterJSON_getOSVersion__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = (id)_CFCopySupplementalVersionDictionary();
  if (v6)
  {
    v0 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ProductName"));
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ProductVersion"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ProductBuildVersion"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v0, "initWithFormat:", CFSTR("%@ %@ (%@)"), v1, v2, v3);
    v5 = (void *)getOSVersion_osVersion;
    getOSVersion_osVersion = v4;

  }
  else
  {
    v1 = (void *)getOSVersion_osVersion;
    getOSVersion_osVersion = 0;
  }

}

- (id)createHeaderForSessionsFile
{
  uint64_t v2;
  void *v3;
  const __CFString *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  -[PLMetricsFormatterJSON getOSVersion](self, "getOSVersion");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  v7[0] = CFSTR("bug_type");
  v7[1] = CFSTR("os_version");
  v4 = CFSTR("<unknown>");
  if (v2)
    v4 = (const __CFString *)v2;
  v8[0] = CFSTR("278");
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)writeSessionFile
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  NSMutableDictionary *allMetrics;
  void *v11;
  id v12;
  void *v13;
  id v15;
  id v16;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLMetricsFormatterJSON setLogFileTimeStamp:](self, "setLogFileTimeStamp:", v3);

  -[PLMetricsFormatterJSON getCurrentTimeFormatted:](self, "getCurrentTimeFormatted:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](self->allMetrics, "setObject:forKey:", v4, CFSTR("log_timestamp"));
  -[PLMetricsFormatterJSON createHeaderForSessionsFile](self, "createHeaderForSessionsFile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLMetricsFormatterJSON getFileHandle](self, "getFileHandle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v5, 0, &v16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v16;
  objc_msgSend(v6, "writeData:", v7);

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", "\n", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "writeData:", v9);

  -[PLMetricsFormatterJSON pruneJSONData](self, "pruneJSONData");
  allMetrics = self->allMetrics;
  v15 = v8;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", allMetrics, 1, &v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v15;

  objc_msgSend(v6, "writeData:", v11);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", "\n", 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "writeData:", v13);

  objc_msgSend(v6, "closeFile");
  LOBYTE(self) = -[PLMetricsFormatterJSON moveLogFile](self, "moveLogFile");

  return (char)self;
}

- (BOOL)moveLogFile
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  _QWORD block[5];
  id v21;

  -[PLMetricsFormatterJSON getCurrentTimeFormatted:](self, "getCurrentTimeFormatted:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("/tmp/powerlog/"), "stringByAppendingFormat:", CFSTR("log-power-%@.session"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", self->tmpFilePath);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  objc_msgSend(v5, "moveItemAtPath:toPath:error:", v6, v4, &v21);
  v7 = v21;

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = OSAMoveFileForSubmissions();

  if (!v9)
  {
    PLLogCommon();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[PLMetricsFormatterJSON moveLogFile].cold.2();
    goto LABEL_11;
  }
  objc_msgSend(v4, "lastPathComponent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("/var/mobile/Library/Logs/CrashReporter/"), "stringByAppendingPathComponent:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLUtilities markFileAsPurgeable:withUrgency:](PLUtilities, "markFileAsPurgeable:withUrgency:", v11, 32);

  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v12 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __37__PLMetricsFormatterJSON_moveLogFile__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v12;
    if (moveLogFile_defaultOnce != -1)
      dispatch_once(&moveLogFile_defaultOnce, block);
    if (moveLogFile_classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Power log: written to %@"), v4);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/PLMetricsFormatterJSON.m");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "lastPathComponent");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMetricsFormatterJSON moveLogFile]");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "logMessage:fromFile:fromFunction:fromLineNumber:", v13, v16, v17, 819);

      PLLogCommon();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

LABEL_11:
    }
  }

  return v9;
}

uint64_t __37__PLMetricsFormatterJSON_moveLogFile__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  moveLogFile_classDebugEnabled = result;
  return result;
}

- (void)addAppMetric:(id)a3
{
  NSMutableDictionary *allMetrics;
  id v4;
  id v5;

  allMetrics = self->allMetrics;
  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](allMetrics, "objectForKeyedSubscript:", CFSTR("metrics"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)sendAppMetricToCoreAnalytics:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  NSObject *v58;
  id obj;
  id obja;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  uint8_t buf[16];
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("power_metrics"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = objc_opt_new();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("app_bundleid"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v6, CFSTR("app_bundleid"));

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("power_metrics"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("app_time"));
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("power_metrics"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("app_time"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("cellular_condition"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        v13 = v5;
        v63 = 0u;
        v64 = 0u;
        v61 = 0u;
        v62 = 0u;
        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("power_metrics"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("app_time"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("cellular_condition"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        obj = v16;
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v62;
          do
          {
            v20 = 0;
            do
            {
              if (*(_QWORD *)v62 != v19)
                objc_enumerationMutation(obj);
              v21 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * v20);
              objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("power_metrics"));
              v22 = v3;
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("app_time"));
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("cellular_condition"));
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "objectForKeyedSubscript:", v21);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v26, v21);

              v3 = v22;
              ++v20;
            }
            while (v18 != v20);
            v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
          }
          while (v18);
        }

        v5 = v13;
      }
    }
    else
    {

    }
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("power_metrics"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("network_io"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("power_metrics"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("network_io"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v5;
      objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("cellular"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("totalDownload"));
      obja = v3;
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@"), CFSTR("cellular"), CFSTR("totalDownload"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v33, v34);

      objc_msgSend(obja, "objectForKeyedSubscript:", CFSTR("power_metrics"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("network_io"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("cellular"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("totalUpload"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@"), CFSTR("cellular"), CFSTR("totalUpload"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKeyedSubscript:](v31, "setObject:forKeyedSubscript:", v38, v39);

      objc_msgSend(obja, "objectForKeyedSubscript:", CFSTR("power_metrics"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("network_io"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("wifi"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("totalDownload"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@"), CFSTR("wifi"), CFSTR("totalDownload"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKeyedSubscript:](v31, "setObject:forKeyedSubscript:", v43, v44);

      v3 = obja;
      objc_msgSend(obja, "objectForKeyedSubscript:", CFSTR("power_metrics"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("network_io"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("wifi"));
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("totalUpload"));
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v31;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@"), CFSTR("wifi"), CFSTR("totalUpload"));
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v48, v49);

    }
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("power_metrics"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "objectForKeyedSubscript:", CFSTR("display_apl"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    if (v51)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("power_metrics"));
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "objectForKeyedSubscript:", CFSTR("display_apl"));
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("averagePixelLuminance"));
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v54, CFSTR("averagePixelLuminance"));

      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("power_metrics"));
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("display_apl"));
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "objectForKeyedSubscript:", CFSTR("totalFrameCount"));
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v57, CFSTR("totalFrameCount"));

    }
    PLLogAggregateSummarizationService();
    v58 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
      -[PLMetricsFormatterJSON sendAppMetricToCoreAnalytics:].cold.1();

    AnalyticsSendEvent();
  }
  else
  {
    PLLogAggregateSummarizationService();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DA9D6000, v5, OS_LOG_TYPE_INFO, "No power_metrics to report to Core Analytics", buf, 2u);
    }
  }

}

- (id)getCurrentTimeFormatted:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a3;
  -[PLMetricsFormatterJSON logFileTimeStamp](self, "logFileTimeStamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLMetricsFormatterJSON setLogFileTimeStamp:](self, "setLogFileTimeStamp:", v6);

  }
  -[PLMetricsFormatterJSON logFileTimeStamp](self, "logFileTimeStamp");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  objc_msgSend(v8, "setLocale:", v9);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithAbbreviation:", CFSTR("UTC"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTimeZone:", v10);

    objc_msgSend(v8, "setDateFormat:", CFSTR("yyyy-MM-dd'T'HH':'mm':'ssZZ"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTimeZone:", v11);
    objc_msgSend(v8, "setDateFormat:", CFSTR("yyyy-MM-dd-HHmmss"));

  }
  objc_msgSend(v8, "stringFromDate:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)getFileHandle
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  id v19;
  NSObject *v20;
  id v21;
  _QWORD block[5];
  uint64_t v23;
  void *v24;
  char __s[1024];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (!confstr(65537, __s, 0x400uLL))
    goto LABEL_10;
  strlen(__s);
  __strncat_chk();
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v3 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __39__PLMetricsFormatterJSON_getFileHandle__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v3;
    if (getFileHandle_defaultOnce != -1)
      dispatch_once(&getFileHandle_defaultOnce, block);
    if (getFileHandle_classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\n\n\n\n\n%s\n\n\n"), __s);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/PLMetricsFormatterJSON.m");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMetricsFormatterJSON getFileHandle]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v7, v8, 921);

      PLLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }
  v10 = mkstemp(__s);
  if ((v10 + 1) >= 2
    && (v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3608]), "initWithFileDescriptor:", v10)) != 0)
  {
    v14 = (void *)v13;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = *MEMORY[0x1E0CB2AA8];
    v24 = &unk_1EA1C0848;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", __s);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    v18 = objc_msgSend(v15, "setAttributes:ofItemAtPath:error:", v16, v17, &v21);
    v19 = v21;

    if ((v18 & 1) == 0)
    {
      PLLogCommon();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[PLMetricsFormatterJSON getFileHandle].cold.1();

    }
    strncpy(self->tmpFilePath, __s, 0x400uLL);
    v11 = v14;

  }
  else
  {
LABEL_10:
    v11 = 0;
  }
  return v11;
}

uint64_t __39__PLMetricsFormatterJSON_getFileHandle__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  getFileHandle_classDebugEnabled = result;
  return result;
}

- (void)test
{
  int v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  _QWORD v17[5];
  _QWORD block[5];

  v3 = objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
  v4 = MEMORY[0x1E0C809B0];
  if (v3)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __30__PLMetricsFormatterJSON_test__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = objc_opt_class();
    if (test_defaultOnce != -1)
      dispatch_once(&test_defaultOnce, block);
    if (test_classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Object has been successfully created (PLMetricsFormatterJSON)."));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/PLMetricsFormatterJSON.m");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastPathComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMetricsFormatterJSON test]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v8, v9, 950);

      PLLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v17[0] = v4;
    v17[1] = 3221225472;
    v17[2] = __30__PLMetricsFormatterJSON_test__block_invoke_296;
    v17[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v17[4] = objc_opt_class();
    if (test_defaultOnce_294 != -1)
      dispatch_once(&test_defaultOnce_294, v17);
    if (test_classDebugEnabled_295)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), self->allMetrics);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/PLMetricsFormatterJSON.m");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "lastPathComponent");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMetricsFormatterJSON test]");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "logMessage:fromFile:fromFunction:fromLineNumber:", v11, v14, v15, 951);

      PLLogCommon();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }
}

uint64_t __30__PLMetricsFormatterJSON_test__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  test_classDebugEnabled = result;
  return result;
}

uint64_t __30__PLMetricsFormatterJSON_test__block_invoke_296(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  test_classDebugEnabled_295 = result;
  return result;
}

- (id)metricsToStringAsJSON
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSMutableDictionary *allMetrics;
  void *v11;
  id v12;
  __CFString *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v27[5];
  _QWORD v28[5];
  id v29;
  _QWORD block[5];

  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v3 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__PLMetricsFormatterJSON_metricsToStringAsJSON__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v3;
    if (metricsToStringAsJSON_defaultOnce != -1)
      dispatch_once(&metricsToStringAsJSON_defaultOnce, block);
    if (metricsToStringAsJSON_classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Printing each key."));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/PLMetricsFormatterJSON.m");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMetricsFormatterJSON metricsToStringAsJSON]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v7, v8, 956);

      PLLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }
  allMetrics = self->allMetrics;
  v29 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", allMetrics, 1, &v29);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v29;
  if (!v11)
  {
    if (!objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      goto LABEL_23;
    v21 = objc_opt_class();
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __47__PLMetricsFormatterJSON_metricsToStringAsJSON__block_invoke_301;
    v28[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v28[4] = v21;
    if (metricsToStringAsJSON_defaultOnce_299 != -1)
      dispatch_once(&metricsToStringAsJSON_defaultOnce_299, v28);
    if (!metricsToStringAsJSON_classDebugEnabled_300)
    {
LABEL_23:
      v13 = CFSTR("{}");
      goto LABEL_24;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Got an error: %@"), v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)MEMORY[0x1E0D7FF98];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/PLMetricsFormatterJSON.m");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "lastPathComponent");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMetricsFormatterJSON metricsToStringAsJSON]");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "logMessage:fromFile:fromFunction:fromLineNumber:", v15, v24, v25, 962);

    PLLogCommon();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
    v13 = CFSTR("{}");
    goto LABEL_22;
  }
  v13 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v11, 4);
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v14 = objc_opt_class();
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __47__PLMetricsFormatterJSON_metricsToStringAsJSON__block_invoke_308;
    v27[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v27[4] = v14;
    if (metricsToStringAsJSON_defaultOnce_306 != -1)
      dispatch_once(&metricsToStringAsJSON_defaultOnce_306, v27);
    if (metricsToStringAsJSON_classDebugEnabled_307)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\n"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/PLMetricsFormatterJSON.m");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "lastPathComponent");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMetricsFormatterJSON metricsToStringAsJSON]");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "logMessage:fromFile:fromFunction:fromLineNumber:", v15, v18, v19, 966);

      PLLogCommon();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
LABEL_22:

    }
  }
LABEL_24:

  return v13;
}

uint64_t __47__PLMetricsFormatterJSON_metricsToStringAsJSON__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  metricsToStringAsJSON_classDebugEnabled = result;
  return result;
}

uint64_t __47__PLMetricsFormatterJSON_metricsToStringAsJSON__block_invoke_301(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  metricsToStringAsJSON_classDebugEnabled_300 = result;
  return result;
}

uint64_t __47__PLMetricsFormatterJSON_metricsToStringAsJSON__block_invoke_308(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  metricsToStringAsJSON_classDebugEnabled_307 = result;
  return result;
}

- (void)printAllMetricsToConsole
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t block;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  uint64_t v16;

  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v3 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __50__PLMetricsFormatterJSON_printAllMetricsToConsole__block_invoke;
    v15 = &__block_descriptor_40_e5_v8__0lu32l8;
    v16 = v3;
    if (printAllMetricsToConsole_defaultOnce != -1)
      dispatch_once(&printAllMetricsToConsole_defaultOnce, &block);
    if (printAllMetricsToConsole_classDebugEnabled)
    {
      v4 = (void *)MEMORY[0x1E0CB3940];
      -[PLMetricsFormatterJSON metricsToStringAsJSON](self, "metricsToStringAsJSON");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "stringWithFormat:", CFSTR("%@"), v5, block, v13, v14, v15, v16);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/PLMetricsFormatterJSON.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMetricsFormatterJSON printAllMetricsToConsole]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 973);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }
}

uint64_t __50__PLMetricsFormatterJSON_printAllMetricsToConsole__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  printAllMetricsToConsole_classDebugEnabled = result;
  return result;
}

- (void)pruneJSONData
{
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;
  PLMetricsFormatterJSON *v7;

  if (!-[PLMetricsFormatterJSON testAllMetrics](self, "testAllMetrics"))
  {
    +[PLUtilities getSessionsAllowlist](PLUtilities, "getSessionsAllowlist");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[NSMutableDictionary allKeys](self->allMetrics, "allKeys");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __39__PLMetricsFormatterJSON_pruneJSONData__block_invoke;
      v5[3] = &unk_1EA16F720;
      v6 = v4;
      v7 = self;
      objc_msgSend(v3, "enumerateObjectsUsingBlock:", v5);

    }
  }
}

void __39__PLMetricsFormatterJSON_pruneJSONData__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  int v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v3 = *(void **)(a1 + 32);
  v9 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = objc_msgSend(v9, "isEqualToString:", CFSTR("metrics"));

    if (v5)
    {
      v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v7 = *(void **)(a1 + 32);
      v8 = *(void **)(*(_QWORD *)(a1 + 40) + 16);
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __39__PLMetricsFormatterJSON_pruneJSONData__block_invoke_2;
      v11[3] = &unk_1EA16F6F8;
      v12 = v7;
      v13 = v6;
      v10 = v6;
      objc_msgSend(v8, "enumerateObjectsUsingBlock:", v11);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "setObject:forKey:", v10, CFSTR("metrics"));

    }
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "removeObjectForKey:", v9);

  }
}

void __39__PLMetricsFormatterJSON_pruneJSONData__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_msgSend(a2, "mutableCopy");
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("metrics"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLMetricsFormatterJSON pruneDictionary:withAllowlist:](PLMetricsFormatterJSON, "pruneDictionary:withAllowlist:", v3, v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
}

+ (id)pruneDictionary:(id)a3 withAllowlist:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __56__PLMetricsFormatterJSON_pruneDictionary_withAllowlist___block_invoke;
  v14[3] = &unk_1EA16F748;
  v15 = v7;
  v9 = v6;
  v16 = v9;
  v17 = a1;
  v10 = v7;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v14);

  v11 = v16;
  v12 = v9;

  return v12;
}

void __56__PLMetricsFormatterJSON_pruneDictionary_withAllowlist___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;

  v15 = a2;
  v3 = (void *)MEMORY[0x1DF0A47AC]();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v15);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *(void **)(a1 + 40);
  if (v4)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", v15);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_8:

      goto LABEL_9;
    }
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v15);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v9 = *(void **)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v15);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v10, "mutableCopy");
      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v15);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "pruneDictionary:withAllowlist:", v11, v12);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = objc_msgSend(v6, "count");
      v14 = *(void **)(a1 + 40);
      if (v13)
        objc_msgSend(v14, "setObject:forKey:", v6, v15);
      else
        objc_msgSend(v14, "removeObjectForKey:", v15);
      goto LABEL_8;
    }
  }
  else
  {
    objc_msgSend(v5, "removeObjectForKey:", v15);
  }
LABEL_9:
  objc_autoreleasePoolPop(v3);

}

- (BOOL)testAllMetrics
{
  if (testAllMetrics_defaultOnce != -1)
    dispatch_once(&testAllMetrics_defaultOnce, &__block_literal_global_313);
  return testAllMetrics_allowMetrics;
}

void __40__PLMetricsFormatterJSON_testAllMetrics__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0D7FFA0], "objectForKey:forApplicationID:synchronize:", CFSTR("TestAllMetricsJSON"), CFSTR("com.apple.powerlogd"), 1);
  v0 = (id)objc_claimAutoreleasedReturnValue();
  testAllMetrics_allowMetrics = objc_msgSend(v0, "BOOLValue");

}

- (NSDate)logFileTimeStamp
{
  return (NSDate *)objc_getProperty(self, a2, 1176, 1);
}

- (void)setLogFileTimeStamp:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1176);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logFileTimeStamp, 0);
  objc_storeStrong((id *)&self->memoryMapping, 0);
  objc_storeStrong((id *)&self->diskIOMapping, 0);
  objc_storeStrong((id *)&self->appEnergyBGLocationMapping, 0);
  objc_storeStrong((id *)&self->appEnergyBGAudioMapping, 0);
  objc_storeStrong((id *)&self->appEnergyTotalMapping, 0);
  objc_storeStrong((id *)&self->appEnergyBGMapping, 0);
  objc_storeStrong((id *)&self->appEnergyFGMapping, 0);
  objc_storeStrong((id *)&self->appDisplayAPLMapping, 0);
  objc_storeStrong((id *)&self->appNetworkIOCellularMapping, 0);
  objc_storeStrong((id *)&self->appNetworkIOWifiMapping, 0);
  objc_storeStrong((id *)&self->appTimeCellularConditionMapping, 0);
  objc_storeStrong((id *)&self->appTimeLocationActivityMapping, 0);
  objc_storeStrong((id *)&self->appTimeUnpluggedMapping, 0);
  objc_storeStrong((id *)&self->appBGTimeUpMapping, 0);
  objc_storeStrong((id *)&self->appBGTimeMapping, 0);
  objc_storeStrong((id *)&self->appTimeMapping, 0);
  objc_storeStrong((id *)&self->metricArray, 0);
  objc_storeStrong((id *)&self->allMetrics, 0);
}

- (void)moveLogFile
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_1DA9D6000, v0, OS_LOG_TYPE_ERROR, "Couldn't move tempSession from %@ using OSAMoveFileForSubmissions", v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

- (void)sendAppMetricToCoreAnalytics:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "Sending saniztized app metric data to Core Analytics: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)getFileHandle
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  v3 = 2112;
  v4 = v0;
  _os_log_error_impl(&dword_1DA9D6000, v1, OS_LOG_TYPE_ERROR, "Couldn't change the permissions of tempSession log at %s. Error: %@", v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

@end
