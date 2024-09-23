@implementation WiFiUsageLQMKernelRollingWindow

+ (void)initialize
{
  void *v2;
  id v3;
  void *v4;

  v2 = (void *)_lqmMetricsBlock;
  _lqmMetricsBlock = 0;

  v3 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v4 = (void *)_dateFormatter_0;
  _dateFormatter_0 = (uint64_t)v3;

  objc_msgSend((id)_dateFormatter_0, "setDateFormat:", CFSTR("HH:mm:ss"));
}

+ (BOOL)isOngoing
{
  return _lqmMetricsBlock != 0;
}

+ (id)kernelLQMRollingWindow:(id)a3 withReferenceWindow:(id)a4 andLqmFeatures:(id)a5
{
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
  unint64_t v18;
  id v19;
  char v20;
  void *i;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  void *v38;
  void *v39;
  unint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t j;
  void *v46;
  void *v47;
  void *v48;
  id v50;
  unint64_t v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  id obj;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  uint8_t v76[128];
  uint8_t buf[4];
  uint64_t v78;
  _BYTE v79[128];
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v53 = a3;
  v50 = a4;
  v55 = a4;
  v54 = a5;
  v60 = (void *)MEMORY[0x1E0C99D80];
  v58 = (void *)objc_opt_new();
  v66 = (void *)objc_opt_new();
  v64 = (void *)objc_opt_new();
  v56 = (id)objc_opt_new();
  v7 = (void *)objc_opt_new();
  v8 = (void *)objc_opt_new();
  v9 = (void *)objc_opt_new();
  v10 = (void *)objc_opt_new();
  v11 = (void *)objc_opt_new();
  v12 = (void *)objc_opt_new();
  v13 = (void *)objc_opt_new();
  v14 = (void *)objc_opt_new();
  objc_msgSend(v60, "dictionaryWithObjectsAndKeys:", v58, CFSTR("WiFiUsageLQMKernelSampleRxAmpdu"), v66, CFSTR("WiFiUsageLQMKernelSampleInfraTXRX"), v64, CFSTR("WiFiUsageLQMKernelSamplePerACTxStatsUcast"), v56, CFSTR("WiFiUsageLQMKernelSamplePerACTxStatsMcast"), v7, CFSTR("WiFiUsageLQMKernelSampleOfdmDesense"), v8, CFSTR("WiFiUsageLQMKernelSampleBTCoex"), v9, CFSTR("WiFiUsageLQMKernelSampleAWDLCoex"), v10, CFSTR("WiFiUsageLQMKernelSampleRC1Coex"), v11,
    CFSTR("WiFiUsageLQMKernelSampleRC2Coex"),
    v12,
    CFSTR("WiFiUsageLQMKernelSampleCCA"),
    v13,
    CFSTR("WiFiUsageLQMKernelSampleSecurityErrors"),
    v14,
    CFSTR("WiFiUsageLQMKernelSampleScanSummary"),
    0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = v54;
  v17 = v15;

  objc_storeStrong((id *)&_lqmMetricsBlock, a3);
  if (!v54 || !v55 || !_lqmMetricsBlock)
    goto LABEL_31;
  objc_storeStrong((id *)&_referenceWindow, v50);
  v18 = objc_msgSend(a1, "parseKernelBlobInto:", v15);
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("\n"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  objc_msgSend(v15, "allKeys");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  obj = (id)objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v72, v79, 16);
  if (obj)
  {
    v57 = v19;
    v52 = v18;
    v20 = 0;
    v61 = *(_QWORD *)v73;
    do
    {
      for (i = 0; i != obj; i = (char *)i + 1)
      {
        if (*(_QWORD *)v73 != v61)
          objc_enumerationMutation(v57);
        v22 = *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v17, "objectForKeyedSubscript:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "count");

        if (v24)
        {
          v25 = (void *)_dateFormatter_0;
          objc_msgSend(v17, "objectForKeyedSubscript:", v22);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "firstObject");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "timestamp");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "stringFromDate:", v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = (void *)_dateFormatter_0;
          objc_msgSend(v17, "objectForKeyedSubscript:", v22);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "lastObject");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "timestamp");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "stringFromDate:", v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectForKeyedSubscript:", v22);
          v33 = v17;
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "appendFormat:", CFSTR(" %@ : window %@ to %@ . samples: %lu\n"), v22, v27, v32, objc_msgSend(v34, "count"));

          v17 = v33;
          v20 = 1;
        }
      }
      obj = (id)objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v72, v79, 16);
    }
    while (obj);

    v16 = v54;
    v18 = v52;
    if ((v20 & 1) == 0)
      goto LABEL_17;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s - Parsing results:%@"), "+[WiFiUsageLQMKernelRollingWindow kernelLQMRollingWindow:withReferenceWindow:andLqmFeatures:]", v59);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v35 = (void *)MEMORY[0x1E0CB3940];
      v19 = objc_retainAutorelease(v19);
      objc_msgSend(v35, "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(v19, "UTF8String"));
      v36 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v37 = objc_msgSend(v36, "UTF8String");
      *(_DWORD *)buf = 136446210;
      v78 = v37;
      _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
  }

LABEL_17:
  objc_msgSend((id)_referenceWindow, "samples");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18 >= objc_msgSend(v38, "count"))
  {

  }
  else
  {
    objc_msgSend((id)_referenceWindow, "samples");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "count") - v18;

    if (v40 > 2)
      goto LABEL_31;
  }
  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  objc_msgSend(v17, "allValues");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v68, v76, 16);
  if (v42)
  {
    v43 = v42;
    v44 = *(_QWORD *)v69;
    do
    {
      for (j = 0; j != v43; ++j)
      {
        if (*(_QWORD *)v69 != v44)
          objc_enumerationMutation(v41);
        v46 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * j);
        if (objc_msgSend(v46, "count"))
        {
          objc_msgSend((id)_referenceWindow, "label");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          +[WiFiUsageLQMWindowAnalysis computeFeatures:For:WithLogLabel:](WiFiUsageLQMWindowAnalysis, "computeFeatures:For:WithLogLabel:", v16, v46, v47);

        }
      }
      v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v68, v76, 16);
    }
    while (v43);
  }

LABEL_31:
  v48 = (void *)_lqmMetricsBlock;
  _lqmMetricsBlock = 0;

  return v16;
}

+ (void)addSample:(id)a3 To:(id)a4
{
  if (a3)
    objc_msgSend(a4, "addObject:");
}

+ (void)advanceReadingPointerOf:(unint64_t)a3
{
  _readingAt += a3;
  if (_readingAt >= (unint64_t)_endOfBuffer)
    _readingAt = _buffer + _readingAt - _endOfBuffer;
}

+ (unint64_t)parseKernelBlobInto:(id)a3
{
  id v4;
  __objc2_class **p_superclass;
  __objc2_class **v6;
  __objc2_class **v7;
  uint64_t v8;
  uint64_t v9;
  __objc2_class **v10;
  __objc2_class *v11;
  __objc2_class *v12;
  unint64_t v13;
  __objc2_class *v14;
  __objc2_class *v15;
  char *v16;
  char *v17;
  uint64_t superclass_high;
  void *v19;
  void *v20;
  __objc2_class **v21;
  __objc2_class **v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  void *v34;
  unsigned int *v35;
  void *v36;
  uint64_t v37;
  uint64_t cache_low;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  unint64_t v45;
  unsigned int *v46;
  unsigned int *v47;
  uint64_t v48;
  unsigned int *v49;
  unsigned int *v50;
  void *v51;
  void *v52;
  void *v53;
  unint64_t v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t i;
  void *v60;
  char *v62;
  char *v63;
  uint64_t v64;
  void *v65;
  __uint64_t v66;
  void *v67;
  void *v68;
  id v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _BYTE v74[128];
  _QWORD v75[22];
  _QWORD v76[24];

  v76[22] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_superclass = TBTileFetchRequestDescriptor.superclass;
  _buffer = objc_msgSend((id)_lqmMetricsBlock, "bytes");
  _ringheader = 0;
  v6 = TBTileFetchRequestDescriptor.superclass;
  _readingAt = 0;
  v7 = TBTileFetchRequestDescriptor.superclass;
  _endOfBuffer = 0;
  v75[0] = &unk_1E8862D00;
  v75[1] = &unk_1E8862D18;
  v76[0] = CFSTR("TAG_CTLQM_RX_AMPDU_STATS");
  v76[1] = CFSTR("TAG_CTLQM_INFRA_BAND_TX_RX_STATS");
  v75[2] = &unk_1E8862D30;
  v75[3] = &unk_1E8862D48;
  v76[2] = CFSTR("TAG_CTLQM_TX_DATA_PATH_PER_AC_STATS");
  v76[3] = CFSTR("TAG_CTLQM_SLOW_WIFI_LINK_RECOVERY_INFO");
  v75[4] = &unk_1E8862D60;
  v75[5] = &unk_1E8862D78;
  v76[4] = CFSTR("TAG_CTLQM_DPS_SYMPTOMS_INPUT");
  v76[5] = CFSTR("TAG_CTLQM_TX_DPS");
  v75[6] = &unk_1E8862D90;
  v75[7] = &unk_1E8862DA8;
  v76[6] = CFSTR("TAG_CTLQM_IPS_TRIGGER_REASON");
  v76[7] = CFSTR("TAG_CTLQM_PHY_RX_DESENSE");
  v75[8] = &unk_1E8862DC0;
  v75[9] = &unk_1E8862DD8;
  v76[8] = CFSTR("TAG_CTLQM_WPS_INFO");
  v76[9] = CFSTR("TAG_CTLQM_IP_INFO");
  v75[10] = &unk_1E8862DF0;
  v75[11] = &unk_1E8862E08;
  v76[10] = CFSTR("TAG_CTLQM_CHIP_INFO");
  v76[11] = CFSTR("TAG_CTLQM_BT");
  v75[12] = &unk_1E8862E20;
  v75[13] = &unk_1E8862E38;
  v76[12] = CFSTR("TAG_CTLQM_RC1");
  v76[13] = CFSTR("TAG_CTLQM_RC2");
  v75[14] = &unk_1E8862E50;
  v75[15] = &unk_1E8862E68;
  v76[14] = CFSTR("TAG_CTLQM_AWDL");
  v76[15] = CFSTR("TAG_CTLQM_SCAN");
  v75[16] = &unk_1E8862E80;
  v75[17] = &unk_1E8862E98;
  v76[16] = CFSTR("TAG_CTLQM_NOISE");
  v76[17] = CFSTR("TAG_CTLQM_RX_SECURITY");
  v75[18] = &unk_1E8862EB0;
  v75[19] = &unk_1E8862EC8;
  v76[18] = CFSTR("TAG_CTLQM_CCA");
  v76[19] = CFSTR("TAG_CTLQM_WEIGHT_AVG_LQM");
  v75[20] = &unk_1E8862EE0;
  v75[21] = &unk_1E8862EF8;
  v76[20] = CFSTR("TAG_CTLQM_INFRA_CHAN_INFO");
  v76[21] = CFSTR("TAG_CTLQM_RSSI_CHANGE_LQM_INFO");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v76, v75, 22);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = _buffer;
  _ringheader = _buffer;
  v9 = *(unsigned int *)(_buffer + 40);
  if ((_DWORD)v9 == 1)
  {
    v65 = v4;
    _buffer += 56;
    _endOfBuffer = v8 + 56 + *(unsigned int *)(v8 + 44);
    _readingAt = v8 + 56 + *(unsigned int *)(v8 + 48);
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    v10 = TBTileFetchRequestDescriptor.superclass;
    v69 = a1;
    while (1)
    {
      v11 = v6[415];
      v12 = p_superclass[394];
      if (v11 >= (__objc2_class *)((char *)v12 + *(unsigned int *)(_ringheader + 52))
        && (*(_DWORD *)(_ringheader + 48) < *(_DWORD *)(_ringheader + 52)
         || v11 < (__objc2_class *)((char *)v12 + *(unsigned int *)(_ringheader + 48))))
      {
        break;
      }
      objc_msgSend(a1, "advanceReadingPointerOf:", 24);
      v13 = (unint64_t)v7[405];
      if ((unint64_t)&v11->vtable > v13)
      {
        NSLog(CFSTR("%s - ERROR while Parsing LQM stats from kernel. readStart:%p readEnd:%p endOfBuffer:%p readingAt:%p header + sizeof(logHeader_t):%p which is past endOfBuffer - Aborting"), "+[WiFiUsageLQMKernelRollingWindow parseKernelBlobInto:]", (char *)p_superclass[394] + *(unsigned int *)(_ringheader + 48), (char *)p_superclass[394] + *(unsigned int *)(_ringheader + 52), v13, v6[415], &v11->vtable);
        break;
      }
      v14 = v6[415];
      if ((unint64_t)v14 + LODWORD(v11->cache) <= v13)
      {
        v21 = v6;
        +[WiFiUsageLQMTransformations dateWithMachContinuousTime:WithRef:asNS:](WiFiUsageLQMTransformations, "dateWithMachContinuousTime:WithRef:asNS:", *(__objc2_class **)((char *)&v11->isa + 4), v67, v66);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[__objc2_class samples](v10[416], "samples");
        v22 = v10;
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "firstObject");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "timestamp");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v19, "compare:", v25) == 1)
        {
          -[__objc2_class samples](v22[416], "samples");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "lastObject");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "timestamp");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v19, "compare:", v28);

          if (v29 == -1)
          {
            v6 = v21;
            a1 = v69;
            p_superclass = (__objc2_class **)(TBTileFetchRequestDescriptor + 8);
            v10 = (__objc2_class **)(TBTileFetchRequestDescriptor + 8);
            switch(HIDWORD(v11->superclass))
            {
              case 0:
                if (LODWORD(v11->cache) == 64)
                {
                  +[WiFiUsageLQMKernelSampleRxAmpdu sampleWithStruct:WithReferenceDate:AsNsec:](WiFiUsageLQMKernelSampleRxAmpdu, "sampleWithStruct:WithReferenceDate:AsNsec:", v21[415], v67, v66);
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  v31 = v65;
                  v32 = CFSTR("WiFiUsageLQMKernelSampleRxAmpdu");
                  goto LABEL_40;
                }
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 0);
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v68, "objectForKeyedSubscript:", v30);
                v37 = objc_claimAutoreleasedReturnValue();
                v36 = (void *)v37;
                cache_low = LODWORD(v11->cache);
                v39 = 64;
                goto LABEL_49;
              case 1:
                if (LODWORD(v11->cache) == 140)
                {
                  +[WiFiUsageLQMKernelSampleInfraTXRX sampleWithStruct:WithReferenceDate:AsNsec:](WiFiUsageLQMKernelSampleInfraTXRX, "sampleWithStruct:WithReferenceDate:AsNsec:", v21[415], v67, v66);
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  v31 = v65;
                  v32 = CFSTR("WiFiUsageLQMKernelSampleInfraTXRX");
                  goto LABEL_40;
                }
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 1);
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v68, "objectForKeyedSubscript:", v30);
                v37 = objc_claimAutoreleasedReturnValue();
                v36 = (void *)v37;
                cache_low = LODWORD(v11->cache);
                v39 = 140;
                goto LABEL_49;
              case 2:
                v35 = (unsigned int *)v21[415];
                if (*v35)
                {
                  NSLog(CFSTR("%s - Unknown version %u for TAG_CTLQM_TX_DATA_PATH_PER_AC_STATS. Skipping tag"), "+[WiFiUsageLQMKernelRollingWindow parseKernelBlobInto:]", *v35);
                  break;
                }
                v42 = LODWORD(v11->cache);
                if (v42 >= 0xC)
                {
                  v43 = 0;
                  v44 = 0;
                  v45 = (unint64_t)v35 + v42;
                  v46 = v35 + 3;
                  v47 = v35 + 1;
                  do
                  {
                    v48 = v47[1];
                    v49 = (unsigned int *)((char *)v46 + v48);
                    if (v48 >= 8)
                    {
                      v50 = v46 + 2;
                      do
                      {
                        if (*v47 == 4)
                        {
                          +[WiFiUsageLQMKernelSamplePerACTxStats sampleWithTimestamp:](WiFiUsageLQMKernelSamplePerACTxStatsMcast, "sampleWithTimestamp:", v19);
                          v51 = (void *)objc_claimAutoreleasedReturnValue();
                          v52 = v43;
                          v43 = v51;
                        }
                        else
                        {
                          +[WiFiUsageLQMKernelSamplePerACTxStats sampleWithTimestamp:](WiFiUsageLQMKernelSamplePerACTxStatsUcast, "sampleWithTimestamp:", v19);
                          v51 = (void *)objc_claimAutoreleasedReturnValue();
                          v52 = v44;
                          v44 = v51;
                        }

                        objc_msgSend(v51, "populateTXStats:With:ForQueue:", *(v50 - 2), *(v50 - 1), *v47);
                        v50 += 2;
                      }
                      while (v50 <= v49);
                    }
                    v46 = v49 + 2;
                    v47 = v49;
                  }
                  while ((unint64_t)(v49 + 2) <= v45);
                  if (v44)
                  {
                    objc_msgSend(v44, "transformTXStats");
                    objc_msgSend(v65, "objectForKeyedSubscript:", CFSTR("WiFiUsageLQMKernelSamplePerACTxStatsUcast"));
                    v53 = (void *)objc_claimAutoreleasedReturnValue();
                    a1 = v69;
                    objc_msgSend(v69, "addSample:To:", v44, v53);
                    p_superclass = (__objc2_class **)(TBTileFetchRequestDescriptor + 8);
                    goto LABEL_68;
                  }
                  a1 = v69;
                  p_superclass = (__objc2_class **)(TBTileFetchRequestDescriptor + 8);
                }
                else
                {
                  v43 = 0;
                }
                objc_msgSend(v43, "transformTXStats");
                objc_msgSend(v65, "objectForKeyedSubscript:", CFSTR("WiFiUsageLQMKernelSamplePerACTxStatsMcast"));
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(a1, "addSample:To:", v43, v53);
                v44 = 0;
LABEL_68:

                v6 = v21;
                goto LABEL_13;
              case 3:
              case 4:
              case 5:
              case 6:
              case 8:
              case 9:
              case 0xA:
              case 0x10:
              case 0x13:
              case 0x14:
              case 0x15:
                break;
              case 7:
                if (LODWORD(v11->cache) == 16)
                {
                  +[WiFiUsageLQMKernelSampleOfdmDesense sampleWithStruct:andTimestamp:](WiFiUsageLQMKernelSampleOfdmDesense, "sampleWithStruct:andTimestamp:", v21[415], v19);
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  v31 = v65;
                  v32 = CFSTR("WiFiUsageLQMKernelSampleOfdmDesense");
                  goto LABEL_40;
                }
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 7);
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v68, "objectForKeyedSubscript:", v30);
                v37 = objc_claimAutoreleasedReturnValue();
                v36 = (void *)v37;
                cache_low = LODWORD(v11->cache);
                v39 = 16;
                goto LABEL_49;
              case 0xB:
                if (LODWORD(v11->cache) == 12)
                {
                  +[WiFiUsageLQMKernelSampleBTCoex sampleWithStruct:andTimestamp:](WiFiUsageLQMKernelSampleBTCoex, "sampleWithStruct:andTimestamp:", v21[415], v19);
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  v31 = v65;
                  v32 = CFSTR("WiFiUsageLQMKernelSampleBTCoex");
                  goto LABEL_40;
                }
                v40 = (void *)MEMORY[0x1E0CB37E8];
                v41 = 11;
                goto LABEL_48;
              case 0xC:
                if (LODWORD(v11->cache) == 12)
                {
                  +[WiFiUsageLQMKernelSampleRC1Coex sampleWithStruct:andTimestamp:](WiFiUsageLQMKernelSampleRC1Coex, "sampleWithStruct:andTimestamp:", v21[415], v19);
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  v31 = v65;
                  v32 = CFSTR("WiFiUsageLQMKernelSampleRC1Coex");
                  goto LABEL_40;
                }
                v40 = (void *)MEMORY[0x1E0CB37E8];
                v41 = 12;
                goto LABEL_48;
              case 0xD:
                if (LODWORD(v11->cache) == 12)
                {
                  +[WiFiUsageLQMKernelSampleRC2Coex sampleWithStruct:andTimestamp:](WiFiUsageLQMKernelSampleRC2Coex, "sampleWithStruct:andTimestamp:", v21[415], v19);
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  v31 = v65;
                  v32 = CFSTR("WiFiUsageLQMKernelSampleRC2Coex");
                  goto LABEL_40;
                }
                v40 = (void *)MEMORY[0x1E0CB37E8];
                v41 = 13;
                goto LABEL_48;
              case 0xE:
                if (LODWORD(v11->cache) == 12)
                {
                  +[WiFiUsageLQMKernelSampleAWDLCoex sampleWithStruct:andTimestamp:](WiFiUsageLQMKernelSampleAWDLCoex, "sampleWithStruct:andTimestamp:", v21[415], v19);
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  v31 = v65;
                  v32 = CFSTR("WiFiUsageLQMKernelSampleAWDLCoex");
                  goto LABEL_40;
                }
                v40 = (void *)MEMORY[0x1E0CB37E8];
                v41 = 14;
LABEL_48:
                objc_msgSend(v40, "numberWithUnsignedInt:", v41);
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v68, "objectForKeyedSubscript:", v30);
                v37 = objc_claimAutoreleasedReturnValue();
                v36 = (void *)v37;
                cache_low = LODWORD(v11->cache);
                v39 = 12;
                goto LABEL_49;
              case 0xF:
                if (LODWORD(v11->cache) == 24)
                {
                  +[WiFiUsageLQMKernelSampleScanSummary sampleWithStruct:andTimestamp:](WiFiUsageLQMKernelSampleScanSummary, "sampleWithStruct:andTimestamp:", v21[415], v19);
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  v31 = v65;
                  v32 = CFSTR("WiFiUsageLQMKernelSampleScanSummary");
                  goto LABEL_40;
                }
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 15);
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v68, "objectForKeyedSubscript:", v30);
                v37 = objc_claimAutoreleasedReturnValue();
                v36 = (void *)v37;
                cache_low = LODWORD(v11->cache);
                v39 = 24;
                goto LABEL_49;
              case 0x11:
                if (LODWORD(v11->cache) == 20)
                {
                  +[WiFiUsageLQMKernelSampleSecurityErrors sampleWithStruct:andTimestamp:](WiFiUsageLQMKernelSampleSecurityErrors, "sampleWithStruct:andTimestamp:", v21[415], v19);
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  v31 = v65;
                  v32 = CFSTR("WiFiUsageLQMKernelSampleSecurityErrors");
                  goto LABEL_40;
                }
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 17);
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v68, "objectForKeyedSubscript:", v30);
                v37 = objc_claimAutoreleasedReturnValue();
                v36 = (void *)v37;
                cache_low = LODWORD(v11->cache);
                v39 = 20;
                goto LABEL_49;
              case 0x12:
                if (LODWORD(v11->cache) == 28)
                {
                  +[WiFiUsageLQMKernelSampleCCA sampleWithStruct:andTimestamp:](WiFiUsageLQMKernelSampleCCA, "sampleWithStruct:andTimestamp:", v21[415], v19);
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  v31 = v65;
                  v32 = CFSTR("WiFiUsageLQMKernelSampleCCA");
LABEL_40:
                  objc_msgSend(v31, "objectForKeyedSubscript:", v32);
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v69, "addSample:To:", v30, v36);
                }
                else
                {
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 18);
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v68, "objectForKeyedSubscript:", v30);
                  v37 = objc_claimAutoreleasedReturnValue();
                  v36 = (void *)v37;
                  cache_low = LODWORD(v11->cache);
                  v39 = 28;
LABEL_49:
                  NSLog(CFSTR("%s - Failed to parse LQM stats from kernel. Found %@ with payload len %u rather than %lu"), "+[WiFiUsageLQMKernelRollingWindow parseKernelBlobInto:]", v37, cache_low, v39);
                }

                break;
              default:
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 0x1ED333000);
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v68, "objectForKeyedSubscript:", v33);
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                NSLog(CFSTR("%s - Unrecognized header tag %u (%@) while parsing sample"), "+[WiFiUsageLQMKernelRollingWindow parseKernelBlobInto:]", 0x1ED333000, v34);

                goto LABEL_12;
            }
          }
          else
          {
            v6 = v21;
            a1 = v69;
LABEL_12:
            p_superclass = (__objc2_class **)(TBTileFetchRequestDescriptor + 8);
LABEL_13:
            v10 = (__objc2_class **)(TBTileFetchRequestDescriptor + 8);
          }
        }
        else
        {

          v6 = v21;
          v10 = v22;
        }
      }
      else
      {
        v15 = p_superclass[394];
        v16 = (char *)v15 + *(unsigned int *)(_ringheader + 48);
        v17 = (char *)v15 + *(unsigned int *)(_ringheader + 52);
        superclass_high = HIDWORD(v11->superclass);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", superclass_high);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "objectForKeyedSubscript:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = superclass_high;
        v10 = (__objc2_class **)(TBTileFetchRequestDescriptor + 8);
        v62 = v16;
        v63 = v17;
        p_superclass = (__objc2_class **)(TBTileFetchRequestDescriptor + 8);
        a1 = v69;
        NSLog(CFSTR("%s - ERROR while Parsing LQM stats from kernel. readStart:%p readEnd:%p endOfBuffer:%p readingAt:%p (moved past logHeader_t) tag:%04X(%@) length:%04X readingAt+length:%p which is past endOfBuffer - Skipping"), "+[WiFiUsageLQMKernelRollingWindow parseKernelBlobInto:]", v62, v63, v13, v14, v64, v20, LODWORD(v11->cache), (char *)v6[415] + LODWORD(v11->cache));

      }
      objc_msgSend(a1, "advanceReadingPointerOf:", LODWORD(v11->cache));
      objc_msgSend(a1, "advanceReadingPointerOf:", HIDWORD(v11->cache));
      v7 = (__objc2_class **)(TBTileFetchRequestDescriptor + 8);
    }
    v72 = 0u;
    v73 = 0u;
    v70 = 0u;
    v71 = 0u;
    objc_msgSend(v65, "allValues");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v70, v74, 16);
    if (v56)
    {
      v57 = v56;
      v54 = 0;
      v58 = *(_QWORD *)v71;
      do
      {
        for (i = 0; i != v57; ++i)
        {
          if (*(_QWORD *)v71 != v58)
            objc_enumerationMutation(v55);
          v60 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * i);
          if (v54 <= objc_msgSend(v60, "count"))
            v54 = objc_msgSend(v60, "count");
        }
        v57 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v70, v74, 16);
      }
      while (v57);
    }
    else
    {
      v54 = 0;
    }

    v4 = v65;
  }
  else
  {
    NSLog(CFSTR("%s - Failed to parse LQM stats from kernel. Ringbuffer version is %u rather than %u"), "+[WiFiUsageLQMKernelRollingWindow parseKernelBlobInto:]", v9, 1);
    v54 = 0;
  }

  return v54;
}

@end
