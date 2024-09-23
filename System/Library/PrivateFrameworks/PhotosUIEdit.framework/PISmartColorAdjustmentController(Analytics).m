@implementation PISmartColorAdjustmentController(Analytics)

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

  v0 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(MEMORY[0x24BE71D08], "statisticsKey");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE71D08], "enabledKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE71D08], "inputSaturationKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE71D08], "inputCastKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE71D08], "inputContrastKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE71D08], "offsetCastKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, v5, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
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
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
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
  void *v34;
  double v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  uint64_t v46;
  uint64_t v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  +[PEAnalyticsUtility adjustmentValueBucketizerFormatter](PEAnalyticsUtility, "adjustmentValueBucketizerFormatter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "adjustment");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4 || (v5 = (void *)v4, v6 = objc_msgSend(a1, "enabled"), v5, !v6))
  {
    v44 = (id)MEMORY[0x24BDBD1B8];
    goto LABEL_34;
  }
  objc_msgSend(a1, "visualInputKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "analyticsKeysBlocklist");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
  if (!v10)
    goto LABEL_32;
  v11 = v10;
  v12 = *(_QWORD *)v49;
  v47 = *(_QWORD *)v49;
  do
  {
    v13 = 0;
    v46 = v11;
    do
    {
      if (*(_QWORD *)v49 != v12)
        objc_enumerationMutation(v9);
      v14 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v13);
      if ((objc_msgSend(v8, "containsObject:", v14, v46) & 1) == 0)
      {
        objc_msgSend(MEMORY[0x24BE71D08], "autoKey");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "isEqualToString:", v15))
        {
          v16 = objc_msgSend(a1, "isAuto");

          if (v16)
          {
            objc_msgSend(v2, "setObject:forKeyedSubscript:", CFSTR("1"), CFSTR("sc_auto"));
LABEL_29:
            v12 = v47;
            goto LABEL_30;
          }
        }
        else
        {

        }
        objc_msgSend(MEMORY[0x24BE71D08], "offsetSaturationKey");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "isEqualToString:", v17))
        {
          objc_msgSend(a1, "offsetSaturation");
          v19 = v18;

          if (v19 != 0.0)
          {
            v20 = (void *)MEMORY[0x24BDD16E0];
            objc_msgSend(a1, "inputSaturation");
            objc_msgSend(v20, "numberWithDouble:");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "stringFromNumber:", v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = v2;
            v24 = v22;
            v25 = CFSTR("saturation");
LABEL_24:
            objc_msgSend(v23, "setObject:forKeyedSubscript:", v24, v25);

            goto LABEL_29;
          }
        }
        else
        {

        }
        objc_msgSend(MEMORY[0x24BE71D08], "offsetContrastKey");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "isEqualToString:", v26))
        {
          objc_msgSend(a1, "offsetContrast");
          v28 = v27;

          if (v28 != 0.0)
          {
            v29 = (void *)MEMORY[0x24BDD16E0];
            objc_msgSend(a1, "inputContrast");
            objc_msgSend(v29, "numberWithDouble:");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "stringFromNumber:", v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = v2;
            v24 = v22;
            v25 = CFSTR("vibrance");
            goto LABEL_24;
          }
        }
        else
        {

        }
        objc_msgSend(MEMORY[0x24BE71D08], "inputColorKey");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "isEqualToString:", v30))
        {
          objc_msgSend(a1, "inputColor");
          v32 = v31;

          if (v32 != 0.0)
          {
            v33 = (void *)MEMORY[0x24BDD16E0];
            objc_msgSend(a1, "inputColor");
            objc_msgSend(v33, "numberWithDouble:");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "stringFromNumber:", v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = v2;
            v24 = v22;
            v25 = CFSTR("sc_mega");
            goto LABEL_24;
          }
        }
        else
        {

        }
        objc_msgSend(a1, "valueForKey:", v14);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "doubleValue");
        if (v35 != 0.0)
        {
          v36 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v34, "doubleValue");
          objc_msgSend(v36, "numberWithDouble:");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "stringFromNumber:", v37);
          v38 = v9;
          v39 = v8;
          v40 = a1;
          v41 = v3;
          v42 = v2;
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "setObject:forKeyedSubscript:", v43, v14);

          v2 = v42;
          v3 = v41;
          a1 = v40;
          v8 = v39;
          v9 = v38;
          v11 = v46;

        }
        goto LABEL_29;
      }
LABEL_30:
      ++v13;
    }
    while (v11 != v13);
    v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
  }
  while (v11);
LABEL_32:

  v44 = v2;
LABEL_34:

  return v44;
}

@end
