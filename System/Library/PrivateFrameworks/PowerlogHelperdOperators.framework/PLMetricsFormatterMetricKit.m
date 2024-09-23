@implementation PLMetricsFormatterMetricKit

- (PLMetricsFormatterMetricKit)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PLMetricsFormatterMetricKit;
  return -[PLMetricsFormatterMetricKit init](&v3, sel_init);
}

- (void)publishMetrics:(id)a3 andSignpostData:(id)a4 forDate:(id)a5
{
  id v8;
  void *v9;
  id v10;

  v8 = a5;
  -[PLMetricsFormatterMetricKit constructPayloadWithMetrics:andSignpostData:forDate:](self, "constructPayloadWithMetrics:andSignpostData:forDate:", a3, a4, v8);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D4DE48], "sharedManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sendMetrics:forDate:andSourceID:", v10, v8, 2);

}

- (void)addTelemetryForMetricInconsistencies:(id)a3
{
  id v3;
  int v4;
  uint64_t i;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  double v29;
  uint64_t j;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  double v46;
  int v47;
  id v48;
  int v49;
  int v50;
  int v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v53 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
  if (v53)
  {
    v4 = 0;
    v50 = 0;
    v51 = 0;
    v52 = *(_QWORD *)v60;
    v48 = v3;
    do
    {
      for (i = 0; i != v53; ++i)
      {
        if (*(_QWORD *)v60 != v52)
          objc_enumerationMutation(v3);
        objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * i));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "signpostMetrics");
        v7 = objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          v8 = (void *)v7;
          v54 = i;
          objc_msgSend(v6, "cpuMetrics");
          v9 = objc_claimAutoreleasedReturnValue();
          if (v9)
          {
            v10 = (void *)v9;
            objc_msgSend(v6, "diskIOMetrics");
            v11 = (void *)objc_claimAutoreleasedReturnValue();

            if (v11)
            {
              v49 = v4;
              objc_msgSend(v6, "cpuMetrics");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "cumulativeCPUTime");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3A88], "milliseconds");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "measurementByConvertingToUnit:", v14);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "doubleValue");
              v17 = v16;

              objc_msgSend(v6, "diskIOMetrics");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "cumulativeLogicalWrites");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3AD0], "kilobytes");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "measurementByConvertingToUnit:", v20);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "doubleValue");
              v23 = v22;

              v57 = 0u;
              v58 = 0u;
              v55 = 0u;
              v56 = 0u;
              objc_msgSend(v6, "signpostMetrics");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
              if (v25)
              {
                v26 = v25;
                v27 = *(_QWORD *)v56;
                v28 = 0.0;
                v29 = 0.0;
                do
                {
                  for (j = 0; j != v26; ++j)
                  {
                    if (*(_QWORD *)v56 != v27)
                      objc_enumerationMutation(v24);
                    v31 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * j);
                    objc_msgSend(v31, "signpostIntervalData");
                    v32 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v32)
                    {
                      objc_msgSend(v31, "signpostIntervalData");
                      v33 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v33, "cumulativeCPUTime");
                      v34 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v34)
                      {
                        objc_msgSend(v31, "signpostIntervalData");
                        v35 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v35, "cumulativeCPUTime");
                        v36 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(MEMORY[0x1E0CB3A88], "milliseconds");
                        v37 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v36, "measurementByConvertingToUnit:", v37);
                        v38 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v38, "doubleValue");
                        v28 = v28 + v39;

                      }
                      objc_msgSend(v31, "signpostIntervalData");
                      v40 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v40, "cumulativeLogicalWrites");
                      v41 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v41)
                      {
                        objc_msgSend(v31, "signpostIntervalData");
                        v42 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v42, "cumulativeLogicalWrites");
                        v43 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(MEMORY[0x1E0CB3AD0], "kilobytes");
                        v44 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v43, "measurementByConvertingToUnit:", v44);
                        v45 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v45, "doubleValue");
                        v29 = v29 + v46;

                      }
                    }
                  }
                  v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
                }
                while (v26);
              }
              else
              {
                v28 = 0.0;
                v29 = 0.0;
              }
              ++v51;

              if (v17 >= v28)
                v47 = v50;
              else
                v47 = v50 + 1;
              v50 = v47;
              if (v23 >= v29)
                v4 = v49;
              else
                v4 = v49 + 1;
              v3 = v48;
            }
          }
          else
          {

          }
          i = v54;
        }

      }
      v53 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
    }
    while (v53);
    if (v51 >= 1)
    {
      ADClientSetValueForScalarKey();
      ADClientSetValueForScalarKey();
      ADClientSetValueForScalarKey();
    }
  }

}

- (id)constructPayloadWithMetrics:(id)a3 andSignpostData:(id)a4 forDate:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v31;
  id v32;
  void *v33;
  id v34;
  uint64_t v35;
  PLMetricsFormatterMetricKit *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v34 = a5;
  v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v36 = self;
  self->_processHangs = -[PLMetricsFormatterMetricKit hangtracerEnabled:](self, "hangtracerEnabled:", v9);
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v38;
    v15 = 0x1E0D4D000uLL;
    v31 = *(_QWORD *)v38;
    v32 = v11;
    v33 = v10;
    do
    {
      v16 = 0;
      v35 = v13;
      do
      {
        if (*(_QWORD *)v38 != v14)
          objc_enumerationMutation(v11);
        v17 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * v16);
        if (objc_msgSend(*(id *)(v15 + 3664), "isMetricKitClient:", v17, v31))
        {
          v18 = v9;
          objc_msgSend(v11, "objectForKeyedSubscript:", v17);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "objectForKeyedSubscript:", &unk_1EA1C06C8);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v11, "objectForKeyedSubscript:", v17);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "objectForKeyedSubscript:", &unk_1EA1C06E0);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v11, "objectForKeyedSubscript:", v17);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "objectForKeyedSubscript:", &unk_1EA1C06F8);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (v20)
          {
            objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("app_multiple_versions"));
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v25, "BOOLValue");

          }
          else
          {
            v26 = 0;
          }
          v27 = objc_alloc(MEMORY[0x1E0D4DE40]);
          objc_msgSend(v34, "dateByAddingTimeInterval:", 86400.0);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = (void *)objc_msgSend(v27, "initPayloadDataWithMutipleAppVersions:withTimeStampBegin:withTimeStampEnd:withMetrics:", v26, v34, v28, MEMORY[0x1E0C9AA70]);

          if (v22)
            -[PLMetricsFormatterMetricKit addPowerMetrics:toAppData:](v36, "addPowerMetrics:toAppData:", v22, v29);
          v9 = v18;
          v14 = v31;
          if (v24)
            -[PLMetricsFormatterMetricKit addPerfMetrics:toAppData:](v36, "addPerfMetrics:toAppData:", v24, v29);
          v11 = v32;
          v10 = v33;
          if (v9)
            -[PLMetricsFormatterMetricKit addSignpostData:forApp:toAppData:](v36, "addSignpostData:forApp:toAppData:", v9, v17, v29);
          objc_msgSend(v33, "setObject:forKey:", v29, v17);

          v13 = v35;
          v15 = 0x1E0D4D000;
        }
        ++v16;
      }
      while (v13 != v16);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    }
    while (v13);
  }

  -[PLMetricsFormatterMetricKit addTelemetryForMetricInconsistencies:](v36, "addTelemetryForMetricInconsistencies:", v10);
  return v10;
}

- (void)addPowerMetrics:(id)a3 toAppData:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  id v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  id v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  id v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  id v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  unint64_t v34;
  id v35;
  double v36;
  void *v37;
  id v38;
  void *v39;
  double v40;
  double v41;
  void *v42;
  id v43;
  void *v44;
  double v45;
  void *v46;
  id v47;
  void *v48;
  double v49;
  void *v50;
  id v51;
  void *v52;
  double v53;
  void *v54;
  id v55;
  void *v56;
  double v57;
  void *v58;
  id v59;
  void *v60;
  double v61;
  double v62;
  void *v63;
  id v64;
  void *v65;
  double v66;
  double v67;
  void *v68;
  id v69;
  void *v70;
  double v71;
  double v72;
  void *v73;
  id v74;
  void *v75;
  double v76;
  double v77;
  void *v78;
  id v79;
  void *v80;
  double v81;
  double v82;
  void *v83;
  id v84;
  void *v85;
  double v86;
  double v87;
  void *v88;
  void *v89;
  void *v90;
  id v91;
  void *v92;
  double v93;
  double v94;
  void *v95;
  void *v96;
  id v97;
  void *v98;
  void *v99;
  void *v100;
  id v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  id v121;
  void *v122;
  void *v123;
  void *v125;

  v5 = (objc_class *)MEMORY[0x1E0CB3758];
  v6 = a4;
  v7 = a3;
  v8 = [v5 alloc];
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("fgTime_Total"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValue");
  v11 = v10;
  objc_msgSend(MEMORY[0x1E0CB3A88], "seconds");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v123 = (void *)objc_msgSend(v8, "initWithDoubleValue:unit:", v12, v11);

  v13 = objc_alloc(MEMORY[0x1E0CB3758]);
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("bgTime_Total"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "doubleValue");
  v16 = v15;
  objc_msgSend(MEMORY[0x1E0CB3A88], "seconds");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v122 = (void *)objc_msgSend(v13, "initWithDoubleValue:unit:", v17, v16);

  v18 = objc_alloc(MEMORY[0x1E0CB3758]);
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("bgTime_Audio"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "doubleValue");
  v21 = v20;
  objc_msgSend(MEMORY[0x1E0CB3A88], "seconds");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v120 = (void *)objc_msgSend(v18, "initWithDoubleValue:unit:", v22, v21);

  v23 = objc_alloc(MEMORY[0x1E0CB3758]);
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("bgTime_Location"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "doubleValue");
  v26 = v25;
  objc_msgSend(MEMORY[0x1E0CB3A88], "seconds");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v119 = (void *)objc_msgSend(v23, "initWithDoubleValue:unit:", v27, v26);

  v121 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CC7688]), "initWithCumulativeForegroundTimeMeasurement:cumulativeBackgroundTimeMeasurement:cumulativeBackgroundAudioTimeMeasurement:cumulativeBackgroundLocationTimeMeasurement:", v123, v122, v120, v119);
  objc_msgSend(v6, "setApplicationTimeMetrics:", v121);
  v28 = objc_alloc(MEMORY[0x1E0CB3758]);
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("CPUTime"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "doubleValue");
  v31 = v30;
  objc_msgSend(MEMORY[0x1E0CB3A88], "seconds");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v118 = (void *)objc_msgSend(v28, "initWithDoubleValue:unit:", v32, v31);

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("CPUInstructions"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "unsignedIntegerValue") / 0x3E8uLL;

  v35 = objc_alloc(MEMORY[0x1E0CB3758]);
  v36 = (double)v34;
  v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A50]), "initWithSymbol:", CFSTR("kiloinstructions"));
  v116 = (void *)objc_msgSend(v35, "initWithDoubleValue:unit:", v37, v36);

  v117 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC76A0]), "initWithCumulativeCPUTimeMeasurement:withCumulativeCPUInstructions:", v118, v116);
  v125 = v6;
  objc_msgSend(v6, "setCpuMetrics:", v117);
  v38 = objc_alloc(MEMORY[0x1E0CB3758]);
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("GPUTime"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "doubleValue");
  v41 = v40;
  objc_msgSend(MEMORY[0x1E0CB3A88], "seconds");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v115 = (void *)objc_msgSend(v38, "initWithDoubleValue:unit:", v42, v41);

  v114 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC76C8]), "initWithCumulativeGPUTimeMeasurement:", v115);
  objc_msgSend(v6, "setGpuMetrics:", v114);
  v43 = objc_alloc(MEMORY[0x1E0CB3758]);
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("bytesWifiOut"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = (double)((unint64_t)objc_msgSend(v44, "unsignedIntegerValue") >> 10);
  objc_msgSend(MEMORY[0x1E0CB3AD0], "kilobytes");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v113 = (void *)objc_msgSend(v43, "initWithDoubleValue:unit:", v46, v45);

  v47 = objc_alloc(MEMORY[0x1E0CB3758]);
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("bytesWifiIn"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = (double)((unint64_t)objc_msgSend(v48, "unsignedIntegerValue") >> 10);
  objc_msgSend(MEMORY[0x1E0CB3AD0], "kilobytes");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v112 = (void *)objc_msgSend(v47, "initWithDoubleValue:unit:", v50, v49);

  v51 = objc_alloc(MEMORY[0x1E0CB3758]);
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("bytesCellularOut"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = (double)((unint64_t)objc_msgSend(v52, "unsignedIntegerValue") >> 10);
  objc_msgSend(MEMORY[0x1E0CB3AD0], "kilobytes");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v110 = (void *)objc_msgSend(v51, "initWithDoubleValue:unit:", v54, v53);

  v55 = objc_alloc(MEMORY[0x1E0CB3758]);
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("bytesCellularIn"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = (double)((unint64_t)objc_msgSend(v56, "unsignedIntegerValue") >> 10);
  objc_msgSend(MEMORY[0x1E0CB3AD0], "kilobytes");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v109 = (void *)objc_msgSend(v55, "initWithDoubleValue:unit:", v58, v57);

  v111 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC76E8]), "initWithCumulativeWifiUploadMeasurement:cumulativeWifiDownloadMeasurement:cumulativeCellularUploadMeasurement:cumulativeCellularDownloadMeasurement:", v113, v112, v110, v109);
  objc_msgSend(v6, "setNetworkTransferMetrics:", v111);
  v59 = objc_alloc(MEMORY[0x1E0CB3758]);
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("BestAccuracy"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "doubleValue");
  v62 = v61;
  objc_msgSend(MEMORY[0x1E0CB3A88], "seconds");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v108 = (void *)objc_msgSend(v59, "initWithDoubleValue:unit:", v63, v62);

  v64 = objc_alloc(MEMORY[0x1E0CB3758]);
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("BestAccuracyForNavigation"));
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "doubleValue");
  v67 = v66;
  objc_msgSend(MEMORY[0x1E0CB3A88], "seconds");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v107 = (void *)objc_msgSend(v64, "initWithDoubleValue:unit:", v68, v67);

  v69 = objc_alloc(MEMORY[0x1E0CB3758]);
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("NearestTenMetersAccuracy"));
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "doubleValue");
  v72 = v71;
  objc_msgSend(MEMORY[0x1E0CB3A88], "seconds");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v106 = (void *)objc_msgSend(v69, "initWithDoubleValue:unit:", v73, v72);

  v74 = objc_alloc(MEMORY[0x1E0CB3758]);
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("HundredMetersAccuracy"));
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "doubleValue");
  v77 = v76;
  objc_msgSend(MEMORY[0x1E0CB3A88], "seconds");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v105 = (void *)objc_msgSend(v74, "initWithDoubleValue:unit:", v78, v77);

  v79 = objc_alloc(MEMORY[0x1E0CB3758]);
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("KilometerAccuracy"));
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "doubleValue");
  v82 = v81;
  objc_msgSend(MEMORY[0x1E0CB3A88], "seconds");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v104 = (void *)objc_msgSend(v79, "initWithDoubleValue:unit:", v83, v82);

  v84 = objc_alloc(MEMORY[0x1E0CB3758]);
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ThreeKilometersAccuracy"));
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "doubleValue");
  v87 = v86;
  objc_msgSend(MEMORY[0x1E0CB3A88], "seconds");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = (void *)objc_msgSend(v84, "initWithDoubleValue:unit:", v88, v87);

  v90 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC76D8]), "initWithCumulativeBestAccuracyTimeMeasurement:cumulativeBestAccuracyForNavigationTimeMeasurement:nearestTenMetersAccuracyTimeMeasurement:hundredMetersAccuracyTimeMeasurement:kilometerAccuracyTimeMeasurement:threeKilometerAccuracyTimeMeasurement:", v108, v107, v106, v105, v104, v89);
  objc_msgSend(v125, "setLocationActivityMetrics:", v90);
  v91 = objc_alloc(MEMORY[0x1E0CB3758]);
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("AveragePictureLevel"));
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "doubleValue");
  v94 = v93;
  objc_msgSend(MEMORY[0x1E0CC7700], "apl");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v96 = (void *)objc_msgSend(v91, "initWithDoubleValue:unit:", v95, v94);

  v97 = objc_alloc(MEMORY[0x1E0CC7690]);
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("TotalFrameCount"));
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v99 = (void *)objc_msgSend(v97, "initWithMeasurement:sampleCount:standardDeviation:", v96, objc_msgSend(v98, "unsignedIntegerValue"), -1.0);

  v100 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC76B8]), "initWithAveragePictureLevel:", v99);
  objc_msgSend(v125, "setDisplayMetrics:", v100);
  v101 = objc_alloc(MEMORY[0x1E0CC76A8]);
  -[PLMetricsFormatterMetricKit constructCellularHistogram:](self, "constructCellularHistogram:", v7);
  v102 = (void *)objc_claimAutoreleasedReturnValue();

  v103 = (void *)objc_msgSend(v101, "initWithCellularConditionTime:", v102);
  objc_msgSend(v125, "setCellularConditionMetrics:", v103);

}

- (void)addPerfMetrics:(id)a3 toAppData:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;

  v5 = (objc_class *)MEMORY[0x1E0CB3758];
  v6 = a4;
  v7 = a3;
  v8 = [v5 alloc];
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("byteswritten"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (double)((unint64_t)objc_msgSend(v9, "unsignedIntegerValue") >> 10);
  objc_msgSend(MEMORY[0x1E0CB3AD0], "kilobytes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v8, "initWithDoubleValue:unit:", v11, v10);

  v30 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CC76B0]), "initWithCumulativeLogicalWritesMeasurement:", v12);
  objc_msgSend(v6, "setDiskIOMetrics:", v30);
  v13 = objc_alloc(MEMORY[0x1E0CB3758]);
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("PeakMemory"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (double)((unint64_t)objc_msgSend(v14, "unsignedIntegerValue") >> 10);
  objc_msgSend(MEMORY[0x1E0CB3AD0], "kilobytes");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v13, "initWithDoubleValue:unit:", v16, v15);

  v18 = objc_alloc(MEMORY[0x1E0CB3758]);
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("AverageMemory"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (double)((unint64_t)objc_msgSend(v19, "unsignedIntegerValue") >> 10);
  objc_msgSend(MEMORY[0x1E0CB3AD0], "kilobytes");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v18, "initWithDoubleValue:unit:", v21, v20);

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("AverageMemoryVariance"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "doubleValue");
  v25 = sqrt(v24) * 0.0009765625;

  v26 = objc_alloc(MEMORY[0x1E0CC7690]);
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("AverageMemoryCount"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = (void *)objc_msgSend(v26, "initWithMeasurement:sampleCount:standardDeviation:", v22, objc_msgSend(v27, "integerValue"), v25);
  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC76E0]), "initWithPeakMemoryUsageMeasurement:averageMemoryUsageMeasurement:", v17, v28);
  objc_msgSend(v6, "setMemoryMetrics:", v29);

}

- (void)addSignpostData:(id)a3 forApp:(id)a4 toAppData:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  unint64_t v31;
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
  uint64_t v44;
  void *v45;
  _BOOL4 v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  double v58;
  double v59;
  void *v60;
  double v61;
  double v62;
  id v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  void *v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  void *v82;
  void *v83;
  id v84;
  void *v85;
  uint64_t v86;
  void *v87;
  uint64_t v88;
  void *v89;
  uint64_t v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  uint64_t v98;
  void *v99;
  id v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t i;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  id v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  id v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t j;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  void *v130;
  uint64_t v131;
  void *v132;
  uint64_t v133;
  uint64_t v134;
  void *v135;
  uint64_t v136;
  void *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  void *v141;
  uint64_t v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  id v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  id v156;
  id v157;
  void *v158;
  uint64_t v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  id v165;
  uint64_t v166;
  void *v167;
  id v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  _BYTE v177[128];
  _BYTE v178[128];
  uint64_t v179;

  v179 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("launchDurations"));
  v10 = objc_claimAutoreleasedReturnValue();
  v156 = v7;
  v157 = v9;
  if (v10)
  {
    v11 = (void *)v10;
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("resumeDurations"));
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      v14 = 0;
LABEL_26:

      goto LABEL_27;
    }
    v13 = (void *)v12;
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("activationDurations"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
LABEL_25:

      goto LABEL_26;
    }
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("extendedLaunchDurations"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("launchDurations"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", v8);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKeyedSubscript:", &unk_1EA1C0710);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("launchDurations"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectForKeyedSubscript:", v8);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectForKeyedSubscript:", &unk_1EA1C0710);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v21 = 0x1E0C99000;
      }
      else
      {
        v21 = 0x1E0C99000uLL;
        objc_msgSend(MEMORY[0x1E0C99D20], "array");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }

      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("resumeDurations"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "objectForKeyedSubscript:", v8);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (v23)
      {
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("resumeDurations"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "objectForKeyedSubscript:", v8);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(*(id *)(v21 + 3360), "array");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }

      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("activationDurations"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "objectForKeyedSubscript:", v8);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "objectForKeyedSubscript:", &unk_1EA1C0710);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "objectForKeyedSubscript:", &unk_1EA1C0728);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (v28)
      {
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("activationDurations"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "objectForKeyedSubscript:", v8);
        v160 = v26;
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "objectForKeyedSubscript:", &unk_1EA1C0710);
        v31 = v21;
        v32 = v25;
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "objectForKeyedSubscript:", &unk_1EA1C0728);
        v166 = objc_claimAutoreleasedReturnValue();

        v25 = v32;
        v21 = v31;

        v26 = v160;
        v7 = v156;
      }
      else
      {
        objc_msgSend(*(id *)(v21 + 3360), "array");
        v166 = objc_claimAutoreleasedReturnValue();
      }

      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("extendedLaunchDurations"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "objectForKeyedSubscript:", v8);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "objectForKeyedSubscript:", &unk_1EA1C0710);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (v36)
      {
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("extendedLaunchDurations"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "objectForKeyedSubscript:", v8);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "objectForKeyedSubscript:", &unk_1EA1C0710);
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        v7 = v156;
      }
      else
      {
        objc_msgSend(*(id *)(v21 + 3360), "array");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v9 = v157;

      v14 = 0;
      if (v11)
      {
        v40 = (void *)v166;
        if (v13 && v166 && v39)
        {
          -[PLMetricsFormatterMetricKit constructHistogramBucketsWithDuration:andData:](self, "constructHistogramBucketsWithDuration:andData:", 10, v11);
          v161 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLMetricsFormatterMetricKit constructHistogramBucketsWithDuration:andData:](self, "constructHistogramBucketsWithDuration:andData:", 10, v13);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLMetricsFormatterMetricKit constructHistogramBucketsWithDuration:andData:](self, "constructHistogramBucketsWithDuration:andData:", 10, v166);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLMetricsFormatterMetricKit constructHistogramBucketsWithDuration:andData:](self, "constructHistogramBucketsWithDuration:andData:", 10, v39);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC7678]), "initWithLaunchTimeData:withResumeTimeData:withActivationTimeData:withExtendedLaunchTimeData:", v161, v41, v42, v43);

          v40 = (void *)v166;
          v9 = v157;

        }
      }
      else
      {
        v40 = (void *)v166;
      }

      goto LABEL_25;
    }
  }
  v14 = 0;
LABEL_27:
  v154 = v14;
  objc_msgSend(v9, "setApplicationLaunchMetrics:", v14);
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("hangDurations"));
  v44 = objc_claimAutoreleasedReturnValue();
  if (v44
    && (v45 = (void *)v44,
        v46 = -[PLMetricsFormatterMetricKit processHangs](self, "processHangs"),
        v45,
        v46))
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("hangDurations"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "objectForKeyedSubscript:", v8);
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    if (v48)
    {
      -[PLMetricsFormatterMetricKit constructHistogramBucketsWithDuration:andData:](self, "constructHistogramBucketsWithDuration:andData:", 10, v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC7680]), "initWithAppResponsivenessData:", v49);

    }
    else
    {
      v50 = 0;
    }

  }
  else
  {
    v50 = 0;
  }
  objc_msgSend(v9, "setApplicationResponsivenessMetrics:", v50);
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("scrollGlitches"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  if (v51)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("scrollGlitches"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "objectForKeyedSubscript:", v8);
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    if (v53
      && (objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("glitchDuration")),
          (v54 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v55 = (void *)v54;
      objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("scrollDuration"));
      v56 = (void *)objc_claimAutoreleasedReturnValue();

      if (v56)
      {
        objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("glitchDuration"));
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "doubleValue");
        v59 = v58;

        objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("scrollDuration"));
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "doubleValue");
        v62 = v61 / 1000.0;

        v63 = objc_alloc(MEMORY[0x1E0CB3758]);
        v64 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A50]), "initWithSymbol:", CFSTR("ms per s"));
        v65 = (void *)objc_msgSend(v63, "initWithDoubleValue:unit:", v64, v59 / v62);

        v56 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC7668]), "initWithGlitchTimeRatio:", v65);
      }
    }
    else
    {
      v56 = 0;
    }

  }
  else
  {
    v56 = 0;
  }
  v153 = v56;
  objc_msgSend(v9, "setAnimationMetrics:", v56);
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("processExits"));
  v66 = objc_claimAutoreleasedReturnValue();
  v155 = v50;
  if (!v66)
    goto LABEL_45;
  v67 = (void *)v66;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("processExits"));
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "objectForKeyedSubscript:", v8);
  v69 = (void *)objc_claimAutoreleasedReturnValue();

  if (v69)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("processExits"));
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "objectForKeyedSubscript:", v8);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "objectForKeyedSubscript:", &unk_1EA1C0710);
    v162 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("processExits"));
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "objectForKeyedSubscript:", v8);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "objectForKeyedSubscript:", &unk_1EA1C0740);
    v167 = (void *)objc_claimAutoreleasedReturnValue();

    +[PLMetricsFormatterMetricKit categorizeAppExits:](PLMetricsFormatterMetricKit, "categorizeAppExits:", v162);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v149 = objc_alloc(MEMORY[0x1E0CC76C0]);
    objc_msgSend(v74, "objectForKeyedSubscript:", CFSTR("cumulativeNormalAppExitCount"));
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    v142 = objc_msgSend(v146, "unsignedIntegerValue");
    objc_msgSend(v74, "objectForKeyedSubscript:", CFSTR("cumulativeMemoryResourceLimitExitCount"));
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    v140 = objc_msgSend(v144, "unsignedIntegerValue");
    objc_msgSend(v74, "objectForKeyedSubscript:", CFSTR("cumulativeCPUResourceLimitExitCount"));
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v138 = objc_msgSend(v75, "unsignedIntegerValue");
    objc_msgSend(v74, "objectForKeyedSubscript:", CFSTR("cumulativeBadAccessExitCount"));
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = objc_msgSend(v76, "unsignedIntegerValue");
    objc_msgSend(v74, "objectForKeyedSubscript:", CFSTR("cumulativeAbnormalExitCount"));
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = objc_msgSend(v78, "unsignedIntegerValue");
    v158 = v74;
    objc_msgSend(v74, "objectForKeyedSubscript:", CFSTR("cumulativeIllegalInstructionExitCount"));
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = objc_msgSend(v80, "unsignedIntegerValue");
    objc_msgSend(v74, "objectForKeyedSubscript:");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v150 = (void *)objc_msgSend(v149, "initWithNormalAppExitCount:withMemoryResourceLimitExitCount:withCPUResourceLimitExitCount:withBadAccessExitCount:withAbnormalExitCount:withIllegalInstructionExitCount:withAppWatchDogExitCount:", v142, v140, v138, v77, v79, v81, objc_msgSend(v82, "unsignedIntegerValue"));

    +[PLMetricsFormatterMetricKit categorizeAppExits:](PLMetricsFormatterMetricKit, "categorizeAppExits:", v167);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = objc_alloc(MEMORY[0x1E0CC7698]);
    objc_msgSend(v83, "objectForKeyedSubscript:", CFSTR("cumulativeNormalAppExitCount"));
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    v139 = objc_msgSend(v147, "unsignedIntegerValue");
    objc_msgSend(v83, "objectForKeyedSubscript:", CFSTR("cumulativeMemoryResourceLimitExitCount"));
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    v136 = objc_msgSend(v145, "unsignedIntegerValue");
    objc_msgSend(v83, "objectForKeyedSubscript:", CFSTR("cumulativeCPUResourceLimitExitCount"));
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    v134 = objc_msgSend(v143, "unsignedIntegerValue");
    objc_msgSend(v83, "objectForKeyedSubscript:", CFSTR("cumulativeMemoryPressureExitCount"));
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    v133 = objc_msgSend(v141, "unsignedIntegerValue");
    objc_msgSend(v83, "objectForKeyedSubscript:", CFSTR("cumulativeBadAccessExitCount"));
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    v131 = objc_msgSend(v137, "unsignedIntegerValue");
    objc_msgSend(v83, "objectForKeyedSubscript:", CFSTR("cumulativeAbnormalExitCount"));
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    v129 = objc_msgSend(v135, "unsignedIntegerValue");
    objc_msgSend(v83, "objectForKeyedSubscript:", CFSTR("cumulativeIllegalInstructionExitCount"));
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    v128 = objc_msgSend(v132, "unsignedIntegerValue");
    objc_msgSend(v83, "objectForKeyedSubscript:", CFSTR("cumulativeAppWatchdogExitCount"));
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    v127 = objc_msgSend(v130, "unsignedIntegerValue");
    objc_msgSend(v83, "objectForKeyedSubscript:", CFSTR("cumulativeSuspendedWithLockedFileExitCount"));
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = objc_msgSend(v85, "unsignedIntegerValue");
    objc_msgSend(v83, "objectForKeyedSubscript:", CFSTR("cumulativeBackgroundTaskAssertionTimeoutExitCount"));
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = objc_msgSend(v87, "unsignedIntegerValue");
    objc_msgSend(v83, "objectForKeyedSubscript:", CFSTR("cumulativeBackgroundURLSessionCompletionTimeoutExitCount"));
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v90 = objc_msgSend(v89, "unsignedIntegerValue");
    objc_msgSend(v83, "objectForKeyedSubscript:", CFSTR("cumulativeBackgroundFetchCompletionTimeoutExitCount"));
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v92 = (void *)objc_msgSend(v84, "initWithNormalAppExitCount:memoryResourceLimitExitCount:cpuResourceLimitExitCount:memoryPressureExitCount:badAccessExitCount:abnormalExitCount:illegalInstructionExitCount:appWatchDogExitCount:cumulativeSuspendedWithLockedFileExitCount:cumulativeBackgroundTaskAssertionTimeoutExitCount:cumulativeBackgroundURLSessionCompletionTimeoutExitCount:cumulativeBackgroundFetchCompletionTimeoutExitCount:", v139, v136, v134, v133, v131, v129, v128, v127, v86, v88, v90, objc_msgSend(v91, "unsignedIntegerValue"));

    v50 = v155;
    v9 = v157;

    v7 = v156;
    v93 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC7670]), "initWithForegroundExitData:backgroundExitData:", v150, v92);

  }
  else
  {
LABEL_45:
    v93 = 0;
  }
  objc_msgSend(v9, "setApplicationExitMetrics:", v93);
  v168 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("signpostIntervals"));
  v94 = (void *)objc_claimAutoreleasedReturnValue();

  if (v94)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("signpostIntervals"));
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "objectForKeyedSubscript:", v8);
    v96 = (void *)objc_claimAutoreleasedReturnValue();

    if (v96)
    {
      v151 = v93;
      objc_msgSend(v96, "objectForKeyedSubscript:", CFSTR("appSignpostDurations"));
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      v148 = v96;
      objc_msgSend(v96, "objectForKeyedSubscript:", CFSTR("appSignpostMetrics"));
      v98 = objc_claimAutoreleasedReturnValue();
      v99 = (void *)MEMORY[0x1E0C9AA70];
      if (v98)
        v99 = (void *)v98;
      v163 = v99;
      v173 = 0u;
      v174 = 0u;
      v175 = 0u;
      v176 = 0u;
      v100 = v97;
      v101 = objc_msgSend(v100, "countByEnumeratingWithState:objects:count:", &v173, v178, 16);
      if (v101)
      {
        v102 = v101;
        v103 = *(_QWORD *)v174;
        v159 = *(_QWORD *)v174;
        do
        {
          for (i = 0; i != v102; ++i)
          {
            if (*(_QWORD *)v174 != v103)
              objc_enumerationMutation(v100);
            v105 = *(void **)(*((_QWORD *)&v173 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v105, "count") == 2)
            {
              objc_msgSend(v105, "objectAtIndexedSubscript:", 0);
              v106 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v105, "objectAtIndexedSubscript:", 1);
              v107 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v100, "objectForKeyedSubscript:", v105);
              v108 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v163, "objectForKeyedSubscript:", v105);
              v109 = (void *)objc_claimAutoreleasedReturnValue();
              -[PLMetricsFormatterMetricKit analyticsLogSignpostsWithBundleId:withName:withCategory:withMetrics:](self, "analyticsLogSignpostsWithBundleId:withName:withCategory:withMetrics:", v8, v107, v106, v109);
              -[PLMetricsFormatterMetricKit constructSignpostIntervalDataWithDurations:withMetrics:](self, "constructSignpostIntervalDataWithDurations:withMetrics:", v108, v109);
              v110 = (void *)objc_claimAutoreleasedReturnValue();
              v111 = v8;
              v112 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC76F8]), "initWithSignpostName:withSignpostCategory:withTotalCount:withSignpostIntervalData:", v107, v106, objc_msgSend(v108, "count"), v110);
              objc_msgSend(v168, "addObject:", v112);

              v8 = v111;
              v103 = v159;
            }
          }
          v102 = objc_msgSend(v100, "countByEnumeratingWithState:objects:count:", &v173, v178, 16);
        }
        while (v102);
      }

      v7 = v156;
      v9 = v157;
      v50 = v155;
      v96 = v148;
      v93 = v151;
    }

  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("signpostEvents"));
  v113 = (void *)objc_claimAutoreleasedReturnValue();

  if (v113)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("signpostEvents"));
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    v165 = v8;
    objc_msgSend(v114, "objectForKeyedSubscript:", v8);
    v115 = (void *)objc_claimAutoreleasedReturnValue();

    if (v115)
    {
      v152 = v93;
      v171 = 0u;
      v172 = 0u;
      v169 = 0u;
      v170 = 0u;
      v116 = v115;
      v117 = objc_msgSend(v116, "countByEnumeratingWithState:objects:count:", &v169, v177, 16);
      if (v117)
      {
        v118 = v117;
        v119 = *(_QWORD *)v170;
        do
        {
          for (j = 0; j != v118; ++j)
          {
            if (*(_QWORD *)v170 != v119)
              objc_enumerationMutation(v116);
            v121 = *(void **)(*((_QWORD *)&v169 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v121, "count") == 2)
            {
              objc_msgSend(v121, "objectAtIndexedSubscript:", 0);
              v122 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v121, "objectAtIndexedSubscript:", 1);
              v123 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v116, "objectForKeyedSubscript:", v121);
              v124 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v124, "integerValue") >= 1)
              {
                v125 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC76F8]), "initWithSignpostName:withSignpostCategory:withTotalCount:withSignpostIntervalData:", v123, v122, objc_msgSend(v124, "unsignedIntegerValue"), 0);
                objc_msgSend(v168, "addObject:", v125);

              }
            }
          }
          v118 = objc_msgSend(v116, "countByEnumeratingWithState:objects:count:", &v169, v177, 16);
        }
        while (v118);
      }

      v7 = v156;
      v9 = v157;
      v50 = v155;
      v93 = v152;
    }

    v8 = v165;
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v168);
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSignpostMetrics:", v126);

}

- (id)constructSignpostIntervalDataWithDurations:(id)a3 withMetrics:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  id v37;
  void *v38;
  void *v39;

  v6 = a4;
  -[PLMetricsFormatterMetricKit constructHistogramBucketsWithDuration:andData:](self, "constructHistogramBucketsWithDuration:andData:", 100, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("cpuTime"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "doubleValue");
    v10 = v9 * 1000.0;

    v11 = objc_alloc(MEMORY[0x1E0CB3758]);
    objc_msgSend(MEMORY[0x1E0CB3A88], "milliseconds");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithDoubleValue:unit:", v12, (double)(unint64_t)v10);

    v14 = objc_alloc(MEMORY[0x1E0CB3758]);
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("averageMemory"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "doubleValue");
    v17 = v16;
    objc_msgSend(MEMORY[0x1E0CB3AD0], "kilobytes");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v14, "initWithDoubleValue:unit:", v18, v17);

    v20 = objc_alloc(MEMORY[0x1E0CC7690]);
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("countInstances"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v20, "initWithMeasurement:sampleCount:standardDeviation:", v19, (int)objc_msgSend(v21, "intValue"), -1.0);

    v23 = objc_alloc(MEMORY[0x1E0CB3758]);
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("diskIO"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "doubleValue");
    v26 = v25;
    objc_msgSend(MEMORY[0x1E0CB3AD0], "kilobytes");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_msgSend(v23, "initWithDoubleValue:unit:", v27, v26);

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("hitchDuration"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "doubleValue");
    v31 = v30;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("animationDuration"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "doubleValue");
    v34 = v33;

    v35 = 0;
    if (v31 >= 0.0)
    {
      v36 = v34 / 1000.0;
      if (v36 > 0.0)
      {
        v37 = objc_alloc(MEMORY[0x1E0CB3758]);
        v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A50]), "initWithSymbol:", CFSTR("ms per s"));
        v35 = (void *)objc_msgSend(v37, "initWithDoubleValue:unit:", v38, v31 / v36);

      }
    }

  }
  else
  {
    v35 = 0;
    v28 = 0;
    v22 = 0;
    v13 = 0;
  }
  v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC76F0]), "initWithHistogramDurationData:withCumulativeCPUTime:withAverageMemory:withCumulativeLogicalWrites:withCumulativeHitchTimeRatio:", v7, v13, v22, v28, v35);

  return v39;
}

- (void)analyticsLogSignpostsWithBundleId:(id)a3 withName:(id)a4 withCategory:(id)a5 withMetrics:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = v12;
  if (v9 && v10 && v11 && v12)
  {
    v14 = v9;
    v15 = v10;
    v16 = v11;
    v17 = v13;
    AnalyticsSendEventLazy();

  }
}

id __99__PLMetricsFormatterMetricKit_analyticsLogSignpostsWithBundleId_withName_withCategory_withMetrics___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v27[10];
  __int128 v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v28 = *(_OWORD *)(a1 + 32);
  v27[0] = CFSTR("BundleID");
  v27[1] = CFSTR("Name");
  v3 = *(_QWORD *)(a1 + 48);
  v2 = *(void **)(a1 + 56);
  v29 = v3;
  v27[2] = CFSTR("Category");
  v27[3] = CFSTR("cpuTime");
  objc_msgSend(v2, "objectForKeyedSubscript:");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = (void *)v4;
  else
    v6 = &unk_1EA1C0740;
  v30 = v6;
  v27[4] = CFSTR("diskIO");
  objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = (void *)v7;
  else
    v9 = &unk_1EA1C0740;
  v31 = v9;
  v27[5] = CFSTR("peakMemory");
  objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
    v12 = (void *)v10;
  else
    v12 = &unk_1EA1C0740;
  v32 = v12;
  v27[6] = CFSTR("averageMemory");
  objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v13)
    v15 = (void *)v13;
  else
    v15 = &unk_1EA1C0740;
  v33 = v15;
  v27[7] = CFSTR("countInstances");
  objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  if (v16)
    v18 = (void *)v16;
  else
    v18 = &unk_1EA1C0740;
  v34 = v18;
  v27[8] = CFSTR("hitchDuration");
  objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:");
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)v19;
  if (v19)
    v21 = (void *)v19;
  else
    v21 = &unk_1EA1C0740;
  v35 = v21;
  v27[9] = CFSTR("animationDuration");
  objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:");
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = (void *)v22;
  if (v22)
    v24 = (void *)v22;
  else
    v24 = &unk_1EA1C0740;
  v36 = v24;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, v27, 10);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (id)constructHistogramBucketsWithDuration:(int)a3 andData:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v4 = *(_QWORD *)&a3;
  v25 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v6, "sortedArrayUsingComparator:", &__block_literal_global_16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v18 = v6;
    v10 = 0;
    v11 = *(_QWORD *)v21;
    v12 = v4;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v7);
        v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v15 = -[PLMetricsFormatterMetricKit computeBucketEndWithDuration:andValue:](self, "computeBucketEndWithDuration:andValue:", v4, objc_msgSend(v14, "intValue"));
          if ((_DWORD)v12 == (_DWORD)v15)
          {
            ++v10;
          }
          else
          {
            v16 = v15;
            if (v10)
              -[PLMetricsFormatterMetricKit addBucketWithDuration:WithEnd:andCount:toList:](self, "addBucketWithDuration:WithEnd:andCount:toList:", v4, v12, v10, v19);
            v12 = v16;
            v10 = 1;
          }
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
    v6 = v18;
    if (v10)
      -[PLMetricsFormatterMetricKit addBucketWithDuration:WithEnd:andCount:toList:](self, "addBucketWithDuration:WithEnd:andCount:toList:", v4, v12, v10, v19);
  }

  return v19;
}

uint64_t __77__PLMetricsFormatterMetricKit_constructHistogramBucketsWithDuration_andData___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (int)computeBucketEndWithDuration:(int)a3 andValue:(int)a4
{
  return ~(a4 % a3) + a3 + a4;
}

- (void)addBucketWithDuration:(int)a3 WithEnd:(int)a4 andCount:(unint64_t)a5 toList:(id)a6
{
  double v8;
  objc_class *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v8 = (double)(a4 - a3 + 1);
  v9 = (objc_class *)MEMORY[0x1E0CB3758];
  v10 = a6;
  v11 = [v9 alloc];
  objc_msgSend(MEMORY[0x1E0CB3A88], "milliseconds");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (id)objc_msgSend(v11, "initWithDoubleValue:unit:", v12, v8);

  v13 = objc_alloc(MEMORY[0x1E0CB3758]);
  v14 = (double)a4;
  objc_msgSend(MEMORY[0x1E0CB3A88], "milliseconds");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v13, "initWithDoubleValue:unit:", v15, v14);

  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC76D0]), "initWithBucketStart:bucketEnd:bucketCount:", v18, v16, a5);
  objc_msgSend(v10, "addObject:", v17);

}

- (id)constructCellularHistogram:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = (objc_class *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  -[PLMetricsFormatterMetricKit constructCellularData:](self, "constructCellularData:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLMetricsFormatterMetricKit normalizeCellularData:](self, "normalizeCellularData:", v7);
  objc_msgSend(v7, "objectForKeyedSubscript:", &unk_1EA1C06C8);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLMetricsFormatterMetricKit addBucketWithSignalBar:withTime:toList:](self, "addBucketWithSignalBar:withTime:toList:", 0, v8, v6);

  objc_msgSend(v7, "objectForKeyedSubscript:", &unk_1EA1C06E0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLMetricsFormatterMetricKit addBucketWithSignalBar:withTime:toList:](self, "addBucketWithSignalBar:withTime:toList:", 1, v9, v6);

  objc_msgSend(v7, "objectForKeyedSubscript:", &unk_1EA1C06F8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLMetricsFormatterMetricKit addBucketWithSignalBar:withTime:toList:](self, "addBucketWithSignalBar:withTime:toList:", 2, v10, v6);

  objc_msgSend(v7, "objectForKeyedSubscript:", &unk_1EA1C0758);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLMetricsFormatterMetricKit addBucketWithSignalBar:withTime:toList:](self, "addBucketWithSignalBar:withTime:toList:", 3, v11, v6);

  objc_msgSend(v7, "objectForKeyedSubscript:", &unk_1EA1C0770);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLMetricsFormatterMetricKit addBucketWithSignalBar:withTime:toList:](self, "addBucketWithSignalBar:withTime:toList:", 4, v12, v6);

  return v6;
}

- (void)addBucketWithSignalBar:(signed __int16)a3 withTime:(id)a4 toList:(id)a5
{
  int v6;
  id v7;
  id v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a3;
  v13 = a4;
  v7 = a5;
  if (v13 && objc_msgSend(v13, "unsignedIntegerValue"))
  {
    v8 = objc_alloc(MEMORY[0x1E0CB3758]);
    v9 = (double)v6;
    objc_msgSend(MEMORY[0x1E0CC7708], "bars");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v8, "initWithDoubleValue:unit:", v10, v9);

    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC76D0]), "initWithBucketStart:bucketEnd:bucketCount:", v11, v11, objc_msgSend(v13, "unsignedIntegerValue"));
    objc_msgSend(v7, "addObject:", v12);

  }
}

- (void)normalizeCellularData:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t k;
  void *v25;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v37 != v7)
          objc_enumerationMutation(v3);
        objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v6 += objc_msgSend(v9, "unsignedIntegerValue");

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
    }
    while (v5);
    if (v6)
    {
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      v10 = (void *)objc_msgSend(v3, "copy");
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v33;
        do
        {
          for (j = 0; j != v12; ++j)
          {
            if (*(_QWORD *)v33 != v13)
              objc_enumerationMutation(v10);
            v15 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * j);
            v16 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v3, "objectForKeyedSubscript:", v15);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "numberWithUnsignedLongLong:", 100 * objc_msgSend(v17, "unsignedIntegerValue") / v6);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, v15);

          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
        }
        while (v12);
      }

      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v19 = v3;
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
      if (v20)
      {
        v21 = v20;
        v22 = 0;
        v23 = *(_QWORD *)v29;
        do
        {
          for (k = 0; k != v21; ++k)
          {
            if (*(_QWORD *)v29 != v23)
              objc_enumerationMutation(v19);
            v25 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * k);
            if (objc_msgSend(v25, "shortValue", (_QWORD)v28))
            {
              objc_msgSend(v19, "objectForKeyedSubscript:", v25);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v22 += objc_msgSend(v26, "unsignedIntegerValue");

            }
          }
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
        }
        while (v21);

        if (v22 > 0x63)
        {
          objc_msgSend(v19, "setObject:forKeyedSubscript:", &unk_1EA1C0740, &unk_1EA1C06C8);
          goto LABEL_29;
        }
      }
      else
      {

        v22 = 0;
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 100 - v22, (_QWORD)v28);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setObject:forKeyedSubscript:", v27, &unk_1EA1C06C8);

    }
  }
LABEL_29:

}

- (id)constructCellularData:(id)a3
{
  id v3;
  id v4;
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

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("SignalBar0"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("SignalBar0"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, &unk_1EA1C06C8);

  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("SignalBar1"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("SignalBar1"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, &unk_1EA1C06E0);

  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("SignalBar2"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("SignalBar2"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, &unk_1EA1C06F8);

  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("SignalBar3"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("SignalBar3"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, &unk_1EA1C0758);

  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("SignalBar4"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("SignalBar4"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, &unk_1EA1C0770);

  }
  return v4;
}

- (BOOL)hangtracerEnabled:(id)a3
{
  id v3;
  BOOL v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a3;
  if ((objc_msgSend(MEMORY[0x1E0D80020], "internalBuild") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    if (!v3)
      goto LABEL_7;
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("hangtracer_enabled"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5
      || (objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("hangtracer_enabled")),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v7 = objc_msgSend(v6, "longValue"),
          v6,
          v4 = 1,
          (unint64_t)(v7 - 100) >= 2)
      && v7 != 1000)
    {
LABEL_7:
      v4 = 0;
    }
  }

  return v4;
}

+ (id)categorizeAppExits:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v3 = (objc_class *)MEMORY[0x1E0C99E08];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __50__PLMetricsFormatterMetricKit_categorizeAppExits___block_invoke;
  v8[3] = &unk_1EA16F618;
  v6 = v5;
  v9 = v6;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v8);

  return v6;
}

void __50__PLMetricsFormatterMetricKit_categorizeAppExits___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v5 = a2;
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedShortValue");

  objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "unsignedLongValue");
  +[PLMetricsFormatterMetricKit decodeExitWithDomain:withCode:](PLMetricsFormatterMetricKit, "decodeExitWithDomain:withCode:", v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "numberWithUnsignedInteger:", objc_msgSend(v14, "unsignedIntegerValue") + objc_msgSend(v12, "unsignedIntegerValue"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v13, v10);

  }
}

+ (id)decodeExitWithDomain:(unsigned int)a3 withCode:(unint64_t)a4
{
  const __CFString *v4;
  const __CFString *v5;
  BOOL v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;

  if ((int)a3 <= 9)
  {
    if (a3 == 1)
    {
      if (a4 <= 0xC)
      {
        if (((1 << a4) & 0x1F78) != 0)
          return CFSTR("cumulativeMemoryPressureExitCount");
        if (((1 << a4) & 0x84) != 0)
          return CFSTR("cumulativeMemoryResourceLimitExitCount");
      }
      v6 = a4 == 100;
      v5 = CFSTR("cumulativeCPUResourceLimitExitCount");
    }
    else
    {
      v4 = CFSTR("cumulativeIllegalInstructionExitCount");
      if (a4 != 4)
        v4 = 0;
      if (a4 == 6)
        v4 = CFSTR("cumulativeAbnormalExitCount");
      if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 0xA)
        v5 = CFSTR("cumulativeBadAccessExitCount");
      else
        v5 = v4;
      v6 = a3 == 2;
    }
    goto LABEL_26;
  }
  if (a3 != 10)
  {
    if (a4 == 3735883980)
      v7 = CFSTR("cumulativeSuspendedWithLockedFileExitCount");
    else
      v7 = 0;
    if (a4 == 562215636)
      v8 = CFSTR("cumulativeBackgroundFetchCompletionTimeoutExitCount");
    else
      v8 = v7;
    v9 = CFSTR("cumulativeBackgroundTaskAssertionTimeoutExitCount");
    v10 = CFSTR("cumulativeBackgroundURLSessionCompletionTimeoutExitCount");
    if (a4 != 562215635)
      v10 = 0;
    if (a4 != 562215634)
      v9 = v10;
    if ((uint64_t)a4 <= 562215635)
      v5 = v9;
    else
      v5 = v8;
    v6 = a3 == 15;
LABEL_26:
    if (v6)
      return (id)v5;
    else
      return 0;
  }
  if (a4 == 2343432205)
    return CFSTR("cumulativeAppWatchdogExitCount");
  if (a4 == 4227595259 || a4 == 3735943697)
    return CFSTR("cumulativeNormalAppExitCount");
  return 0;
}

- (BOOL)processHangs
{
  return self->_processHangs;
}

- (void)setProcessHangs:(BOOL)a3
{
  self->_processHangs = a3;
}

@end
