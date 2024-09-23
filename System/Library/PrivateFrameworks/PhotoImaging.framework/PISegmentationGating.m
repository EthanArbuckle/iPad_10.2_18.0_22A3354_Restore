@implementation PISegmentationGating

+ (unint64_t)gatingResultForSegmentationScores:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  char v28;
  uint64_t i;
  uint64_t v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  uint64_t v40;
  NSObject *v41;
  void *v42;
  double v43;
  _BOOL4 v44;
  void *v45;
  double v46;
  double v47;
  unint64_t v48;
  _BOOL8 v49;
  void *v50;
  int v51;
  void *v52;
  int v53;
  void *v54;
  double v55;
  double v56;
  void *v57;
  double v58;
  double v59;
  uint64_t v60;
  void *v61;
  void *v62;
  double v63;
  double v64;
  double v66;
  uint64_t v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  uint8_t buf[16];
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *MEMORY[0x1E0D75780];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D75780]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  v8 = v7;

  v9 = *MEMORY[0x1E0D75778];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D75778]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "integerValue");

  }
  else
  {
    v12 = 0;
  }
  objc_msgSend(MEMORY[0x1E0D751C0], "cropScoreThresholdForClassification:", v12);
  v14 = v13;
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D757A0]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "doubleValue");
  v17 = v16;

  objc_msgSend(a1, "segmentationScoreRanges");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = v14 + 0.00001;
    +[PIGlobalSettings globalSettings](PIGlobalSettings, "globalSettings");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "segmentationManualGatingLenience");
    v22 = v21;

    v70 = 0u;
    v71 = 0u;
    v68 = 0u;
    v69 = 0u;
    objc_msgSend(v18, "scoreKeys");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v68, v73, 16);
    if (v24)
    {
      v25 = v24;
      v66 = v19;
      v67 = v12;
      v26 = *(_QWORD *)v69;
      v27 = 1;
      v28 = 1;
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v69 != v26)
            objc_enumerationMutation(v23);
          v30 = *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * i);
          objc_msgSend(v18, "rangeForKey:", v30, *(_QWORD *)&v66);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "objectForKeyedSubscript:", v30);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "doubleValue");
          v34 = v33;

          objc_msgSend(v31, "min");
          if (v34 + 0.00001 < v35 || (objc_msgSend(v31, "max"), v34 + -0.00001 > v36))
            v28 = 0;
          objc_msgSend(v31, "withLenience:", v22);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "manualMin");
          if (v34 + 0.00001 < v38 || (objc_msgSend(v37, "manualMax"), v34 + -0.00001 > v39))
            v27 = 0;

        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v68, v73, 16);
      }
      while (v25);

      v40 = v17 >= v66 && v8 >= 0.5;
      if ((v28 & 1) != 0)
        v40 |= 2uLL;
      v12 = v67;
      if ((v27 & 1) == 0)
      {
LABEL_37:
        objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D75838]);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = objc_msgSend(v50, "BOOLValue");

        if (v51)
          v40 |= 8uLL;
        objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D75840]);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = objc_msgSend(v52, "BOOLValue");

        if (v53)
          v40 |= 0x10uLL;
        objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D75828]);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "doubleValue");
        v56 = v55;

        if (v56 <= 0.0)
          v48 = v40;
        else
          v48 = v40 | 0x20;
        if ((unint64_t)(v12 - 1) <= 1)
        {
          objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D75848]);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "doubleValue");
          v59 = v58;

          v60 = *MEMORY[0x1E0D75850];
          objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D75850]);
          v61 = (void *)objc_claimAutoreleasedReturnValue();

          if (v61)
          {
            if (v59 <= 0.5)
            {
              objc_msgSend(v4, "objectForKeyedSubscript:", v60);
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v62, "doubleValue");
              v64 = v63;

              if (v64 <= 0.5)
                goto LABEL_51;
            }
          }
          else if (v59 <= 0.5)
          {
            goto LABEL_51;
          }
        }
        v48 |= 0x40uLL;
        goto LABEL_51;
      }
    }
    else
    {

      v49 = v17 >= v19 && v8 >= 0.5;
      v40 = v49 | 2;
    }
    v40 |= 4uLL;
    goto LABEL_37;
  }
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_83_12748);
  v41 = *MEMORY[0x1E0D52398];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A6382000, v41, OS_LOG_TYPE_INFO, "Unable to load scoring plist, using fallback", buf, 2u);
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D75818]);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "doubleValue");
  v44 = v43 > 0.5;

  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "doubleValue");
  v47 = v46;

  v48 = v47 > 0.5 && v44;
LABEL_51:

  return v48;
}

+ (BOOL)isValidSegmentationScoreForDepth:(PISegmentationBimodalScore)a3
{
  float var2;
  float var1;
  float var0;
  void *v6;
  double v7;
  void *v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  BOOL v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _QWORD v33[3];
  _QWORD v34[4];

  var2 = a3.var2;
  var1 = a3.var1;
  var0 = a3.var0;
  v34[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "segmentationScoreRanges");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = *MEMORY[0x1E0D75818];
  *(float *)&v7 = var0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v8;
  v33[1] = *MEMORY[0x1E0D757E8];
  *(float *)&v9 = var1;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v34[1] = v10;
  v33[2] = *MEMORY[0x1E0D757F0];
  *(float *)&v11 = var2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v34[2] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v14 = v13;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v29;
    while (2)
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v29 != v17)
          objc_enumerationMutation(v14);
        v19 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v6, "rangeForKey:", v19, (_QWORD)v28);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20)
        {
          objc_msgSend(v14, "objectForKeyedSubscript:", v19);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "doubleValue");
          v23 = v22;

          objc_msgSend(v20, "depthMin");
          if (v23 + 0.00001 < v24 || (objc_msgSend(v20, "depthMax"), v23 + -0.00001 > v25))
          {

            v26 = 0;
            goto LABEL_13;
          }
        }

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      if (v16)
        continue;
      break;
    }
  }
  v26 = 1;
LABEL_13:

  return v26;
}

+ (id)segmentationScoreRanges
{
  if (segmentationScoreRanges_onceToken != -1)
    dispatch_once(&segmentationScoreRanges_onceToken, &__block_literal_global_12773);
  return (id)segmentationScoreRanges_ranges;
}

void __47__PISegmentationGating_segmentationScoreRanges__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  char v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "URLForResource:withExtension:", CFSTR("SegmentationScoreRanges"), CFSTR("plist"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v0, "isReadableFileAtPath:", v3);

  if ((v4 & 1) != 0)
  {
    +[PISegmentationGatingRanges loadFromURL:](PISegmentationGatingRanges, "loadFromURL:", v2);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)segmentationScoreRanges_ranges;
    segmentationScoreRanges_ranges = v5;

  }
  else
  {
    if (*MEMORY[0x1E0D52390] != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_83_12748);
    v7 = *MEMORY[0x1E0D52398];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_ERROR))
    {
      v8 = 138412290;
      v9 = v2;
      _os_log_error_impl(&dword_1A6382000, v7, OS_LOG_TYPE_ERROR, "Failed to load scoring configuration: %@", (uint8_t *)&v8, 0xCu);
    }
  }

}

@end
