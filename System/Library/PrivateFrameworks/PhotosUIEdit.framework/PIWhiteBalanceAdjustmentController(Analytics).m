@implementation PIWhiteBalanceAdjustmentController(Analytics)

- (id)analyticsKeysBlocklist
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;

  v11 = (id)MEMORY[0x24BDBCF20];
  objc_msgSend(MEMORY[0x24BE71D30], "faceIKey");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE71D30], "temperatureKey");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE71D30], "grayIKey");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE71D30], "grayYKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE71D30], "tintKey");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE71D30], "warmFaceKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE71D30], "faceQKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE71D30], "autoKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE71D30], "enabledKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE71D30], "grayQKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE71D30], "faceStrengthKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE71D30], "grayStrengthKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setWithObjects:", v14, v13, v0, v10, v1, v2, v3, v4, v5, v6, v7, v8, 0);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)analyticsPayload
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v42;
  uint64_t v43;
  void *v44;
  id obj;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  +[PEAnalyticsUtility adjustmentValueBucketizerFormatter](PEAnalyticsUtility, "adjustmentValueBucketizerFormatter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "adjustment");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4 || (v5 = (void *)v4, v6 = objc_msgSend(a1, "enabled"), v5, !v6))
  {
    v40 = (id)MEMORY[0x24BDBD1B8];
    goto LABEL_41;
  }
  v43 = objc_msgSend(a1, "colorType");
  objc_msgSend(a1, "visualInputKeys");
  v42 = v3;
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = a1;
  objc_msgSend(a1, "analyticsKeysBlocklist");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v9 = v7;
  v3 = v42;
  obj = v9;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
  if (!v10)
    goto LABEL_39;
  v11 = v10;
  v12 = *(_QWORD *)v47;
  do
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v47 != v12)
        objc_enumerationMutation(obj);
      v14 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
      if ((objc_msgSend(v8, "containsObject:", v14) & 1) == 0)
      {
        objc_msgSend(MEMORY[0x24BE71D30], "colorTypeKey");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v14, "isEqualToString:", v15);

        if (v16)
        {
          objc_msgSend(MEMORY[0x24BE71D30], "stringForColorType:", v43);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "setObject:forKeyedSubscript:", v17, CFSTR("whiteBalanceType"));
LABEL_36:

          continue;
        }
        objc_msgSend(MEMORY[0x24BE71D30], "warmTintKey");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "isEqualToString:", v18))
        {
          objc_msgSend(v44, "warmTint");
          v20 = v19;

          if (v20 != 0.0)
          {
            if (v43 != 3)
              continue;
            v21 = (void *)MEMORY[0x24BDD16E0];
            objc_msgSend(v44, "warmTint");
            objc_msgSend(v21, "numberWithDouble:");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "stringFromNumber:", v17);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = v2;
            v24 = v22;
            v25 = CFSTR("tint");
LABEL_31:
            objc_msgSend(v23, "setObject:forKeyedSubscript:", v24, v25);
LABEL_35:

            goto LABEL_36;
          }
        }
        else
        {

        }
        objc_msgSend(MEMORY[0x24BE71D30], "warmTempKey");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "isEqualToString:", v26))
        {
          objc_msgSend(v44, "warmTemp");
          v28 = v27;

          if (v28 != 0.0)
          {
            if (v43 != 3)
              continue;
            v29 = (void *)MEMORY[0x24BDD16E0];
            objc_msgSend(v44, "warmTemp");
LABEL_30:
            objc_msgSend(v29, "numberWithDouble:");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "stringFromNumber:", v17);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = v2;
            v24 = v22;
            v25 = CFSTR("temperature");
            goto LABEL_31;
          }
        }
        else
        {

        }
        objc_msgSend(MEMORY[0x24BE71D30], "faceWarmthKey");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "isEqualToString:", v30))
        {
          objc_msgSend(v44, "faceWarmth");
          v32 = v31;

          if (v32 != 0.0)
          {
            if (v43 != 1)
              continue;
            v29 = (void *)MEMORY[0x24BDD16E0];
            objc_msgSend(v44, "faceWarmth");
            goto LABEL_30;
          }
        }
        else
        {

        }
        objc_msgSend(MEMORY[0x24BE71D30], "grayWarmthKey");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "isEqualToString:", v33))
        {
          objc_msgSend(v44, "faceWarmth");
          v35 = v34;

          if (v35 != 0.0)
          {
            if ((v43 & 0xFFFFFFFFFFFFFFFDLL) != 0)
              continue;
            v29 = (void *)MEMORY[0x24BDD16E0];
            objc_msgSend(v44, "grayWarmth");
            goto LABEL_30;
          }
        }
        else
        {

        }
        objc_msgSend(v44, "valueForKey:", v14);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "doubleValue");
        if (v36 == 0.0)
          goto LABEL_36;
        v37 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v17, "doubleValue");
        objc_msgSend(v37, "numberWithDouble:");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "stringFromNumber:", v22);
        v38 = v2;
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "setObject:forKeyedSubscript:", v39, v14);

        v2 = v38;
        v3 = v42;
        goto LABEL_35;
      }
    }
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
  }
  while (v11);
LABEL_39:

  v40 = v2;
LABEL_41:

  return v40;
}

@end
