@implementation TAFilterObservationAggregator

+ (void)attachAISInfo:(id)a3 deviceRecord:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v11, "address");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "getAccessoryInfo:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "setAccessoryInfo:", v13);
      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

}

+ (id)aggregateObservationsThroughHistoryForDetectionResults:(id)a3 visitSnapshotBuffer:(id)a4 intervisitSnapshotBuffer:(id)a5 clock:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v14 = v9;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v22;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v22 != v17)
          objc_enumerationMutation(v14);
        +[TAFilterObservationAggregator aggregateObservationsThroughHistoryForSingleDetection:visitSnapshotBuffer:intervisitSnapshotBuffer:clock:](TAFilterObservationAggregator, "aggregateObservationsThroughHistoryForSingleDetection:visitSnapshotBuffer:intervisitSnapshotBuffer:clock:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v18), v10, v11, v12, (_QWORD)v21);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObject:", v19);

        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v16);
  }

  return v13;
}

+ (id)location:(id)a3 withAdvertisementTimestamp:(id)a4
{
  id v5;
  id v6;
  TALocationLite *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  TALocationLite *v33;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;

  v5 = a4;
  v6 = a3;
  v7 = [TALocationLite alloc];
  objc_msgSend(v5, "scanDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "latitude");
  v41 = v9;
  objc_msgSend(v6, "longitude");
  v40 = v10;
  objc_msgSend(v6, "horizontalAccuracy");
  v39 = v11;
  objc_msgSend(v6, "altitude");
  v38 = v12;
  objc_msgSend(v6, "verticalAccuracy");
  v37 = v13;
  objc_msgSend(v6, "speed");
  v36 = v14;
  objc_msgSend(v6, "speedAccuracy");
  v35 = v15;
  objc_msgSend(v6, "course");
  v17 = v16;
  objc_msgSend(v6, "courseAccuracy");
  v19 = v18;
  objc_msgSend(v6, "deltaDistance");
  v21 = v20;
  objc_msgSend(v6, "deltaDistanceAccuracy");
  v23 = v22;
  objc_msgSend(v6, "groundAltitude");
  v25 = v24;
  objc_msgSend(v6, "groundAltitudeUncertainty");
  v27 = v26;
  objc_msgSend(v6, "pressure");
  v29 = v28;
  objc_msgSend(v6, "pressureUncertainty");
  v31 = v30;
  v32 = objc_msgSend(v6, "isSimulatedOrSpoofed");

  v33 = -[TALocationLite initWithTimestamp:latitude:longitude:horizontalAccuracy:altitude:verticalAccuracy:speed:speedAccuracy:course:courseAccuracy:deltaDistance:deltaDistanceAccuracy:groundAltitude:groundAltitudeUncertainty:pressure:pressureUncertainty:isSimulatedOrSpoofed:](v7, "initWithTimestamp:latitude:longitude:horizontalAccuracy:altitude:verticalAccuracy:speed:speedAccuracy:course:courseAccuracy:deltaDistance:deltaDistanceAccuracy:groundAltitude:groundAltitudeUncertainty:pressure:pressureUncertainty:isSimulatedOrSpoofed:", v8, v32, v41, v40, v39, v38, v37, v36, v35, v17, v19, v21, v23, v25, v27,
          v29,
          v31);

  return v33;
}

+ (id)aggregateObservationsThroughHistoryForSingleDetection:(id)a3 visitSnapshotBuffer:(id)a4 intervisitSnapshotBuffer:(id)a5 clock:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  TASuspiciousDevice *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
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
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  void *v46;
  uint64_t v48;
  id v49;
  id v50;
  id v51;
  id obj;
  TASuspiciousDevice *obja;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = 0;
  if (v9 && v12)
  {
    v50 = v12;
    v14 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v51 = v10;
    if (v10)
    {
      v49 = v11;
      v60 = 0u;
      v61 = 0u;
      v58 = 0u;
      v59 = 0u;
      objc_msgSend(v10, "bufferCopy");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v59;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v59 != v17)
              objc_enumerationMutation(obj);
            v19 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
            objc_msgSend(v19, "earliestUtAdvertisements");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "address");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "objectForKeyedSubscript:", v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v19, "latestUtAdvertisements");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "address");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "objectForKeyedSubscript:", v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v19, "getLocationRepresentingSnapshot");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            if (v22)
            {
              +[TAFilterObservationAggregator location:withAdvertisementTimestamp:](TAFilterObservationAggregator, "location:withAdvertisementTimestamp:", v26, v22);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "addObject:", v27);

            }
            if (v25 && (objc_msgSend(v25, "isEqual:", v22) & 1) == 0)
            {
              +[TAFilterObservationAggregator location:withAdvertisementTimestamp:](TAFilterObservationAggregator, "location:withAdvertisementTimestamp:", v26, v25);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "addObject:", v28);

            }
          }
          v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
        }
        while (v16);
      }

      v11 = v49;
    }
    if (v11)
    {
      v56 = 0u;
      v57 = 0u;
      v54 = 0u;
      v55 = 0u;
      objc_msgSend(v11, "bufferCopy");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
      if (v30)
      {
        v31 = v30;
        v32 = *(_QWORD *)v55;
        do
        {
          for (j = 0; j != v31; ++j)
          {
            if (*(_QWORD *)v55 != v32)
              objc_enumerationMutation(v29);
            objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * j), "accumulatedDeviceMetrics");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "address");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "objectForKeyedSubscript:", v35);
            v36 = (void *)objc_claimAutoreleasedReturnValue();

            if (v36)
            {
              objc_msgSend(v36, "sampledObservedLocations");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "addObjectsFromArray:", v37);

            }
          }
          v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
        }
        while (v31);
      }

    }
    objc_msgSend(v9, "locationHistory");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObjectsFromArray:", v38);

    obja = [TASuspiciousDevice alloc];
    objc_msgSend(v9, "latestAdvertisement");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "detectionSummary");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = (void *)objc_msgSend(v14, "copy");
    objc_msgSend(v9, "detectionMetrics");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v9, "detectionType");
    v44 = v11;
    v45 = objc_msgSend(v9, "immediacyType");
    objc_msgSend(v9, "accessoryInfo");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v45;
    v11 = v44;
    v13 = -[TASuspiciousDevice initWithLatestAdv:detectionSummary:date:locHistory:detectionMetrics:detectionType:immediacyType:accessoryInfo:forceSurfaceReason:](obja, "initWithLatestAdv:detectionSummary:date:locHistory:detectionMetrics:detectionType:immediacyType:accessoryInfo:forceSurfaceReason:", v39, v40, v50, v41, v42, v43, v48, v46, objc_msgSend(v9, "forceSurfaceReason"));

    v12 = v50;
    v10 = v51;
  }

  return v13;
}

@end
