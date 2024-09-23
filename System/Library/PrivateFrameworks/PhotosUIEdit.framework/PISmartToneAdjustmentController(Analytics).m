@implementation PISmartToneAdjustmentController(Analytics)

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

  v11 = (id)MEMORY[0x24BDBCF20];
  objc_msgSend(MEMORY[0x24BE71D20], "inputRawHighlightsKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE71D20], "inputExposureKey");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE71D20], "inputHighlightsKey");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE71D20], "inputContrastKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE71D20], "inputBlackKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE71D20], "enabledKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE71D20], "inputBrightnessKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE71D20], "inputShadowsKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE71D20], "inputLocalLightKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE71D20], "statisticsKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setWithObjects:", v10, v0, v1, v2, v3, v4, v5, v6, v7, v8, 0);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)analyticsPayload
{
  id v2;
  uint64_t v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  double v41;
  double v42;
  void *v43;
  void *v44;
  double v45;
  double v46;
  void *v47;
  void *v48;
  double v49;
  double v50;
  void *v51;
  void *v52;
  double v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  id v58;
  void *v60;
  void *v61;
  id obj;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  +[PEAnalyticsUtility adjustmentValueBucketizerFormatter](PEAnalyticsUtility, "adjustmentValueBucketizerFormatter");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "adjustment");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3 || (v4 = (void *)v3, v5 = objc_msgSend(a1, "enabled"), v4, !v5))
  {
    v58 = (id)MEMORY[0x24BDBD1B8];
    goto LABEL_54;
  }
  objc_msgSend(a1, "visualInputKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "analyticsKeysBlocklist");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v67, 16);
  if (!v8)
    goto LABEL_52;
  v9 = v8;
  v10 = *(_QWORD *)v64;
  do
  {
    v11 = 0;
    do
    {
      if (*(_QWORD *)v64 != v10)
        objc_enumerationMutation(obj);
      v12 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * v11);
      if ((objc_msgSend(v7, "containsObject:", v12) & 1) == 0)
      {
        objc_msgSend(MEMORY[0x24BE71D20], "autoKey");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "isEqualToString:", v13))
        {
          v14 = objc_msgSend(a1, "isAuto");

          if (v14)
          {
            objc_msgSend(v2, "setObject:forKeyedSubscript:", CFSTR("1"), CFSTR("st_auto"));
            goto LABEL_45;
          }
        }
        else
        {

        }
        objc_msgSend(MEMORY[0x24BE71D20], "offsetExposureKey");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "isEqualToString:", v15))
        {
          objc_msgSend(a1, "offsetExposure");
          v17 = v16;

          if (v17 != 0.0)
          {
            v18 = (void *)MEMORY[0x24BDD16E0];
            objc_msgSend(a1, "inputExposure");
            objc_msgSend(v18, "numberWithDouble:");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "stringFromNumber:", v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = v2;
            v22 = v20;
            v23 = CFSTR("exposure");
LABEL_44:
            objc_msgSend(v21, "setObject:forKeyedSubscript:", v22, v23);

            goto LABEL_45;
          }
        }
        else
        {

        }
        objc_msgSend(MEMORY[0x24BE71D20], "offsetLocalLightKey");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "isEqualToString:", v24))
        {
          objc_msgSend(a1, "offsetLocalLight");
          v26 = v25;

          if (v26 != 0.0)
          {
            v27 = (void *)MEMORY[0x24BDD16E0];
            objc_msgSend(a1, "inputLocalLight");
            objc_msgSend(v27, "numberWithDouble:");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "stringFromNumber:", v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = v2;
            v22 = v20;
            v23 = CFSTR("brilliance");
            goto LABEL_44;
          }
        }
        else
        {

        }
        objc_msgSend(MEMORY[0x24BE71D20], "offsetHighlightsKey");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "isEqualToString:", v28))
        {
          objc_msgSend(a1, "offsetHighlights");
          v30 = v29;

          if (v30 != 0.0)
          {
            v31 = (void *)MEMORY[0x24BDD16E0];
            objc_msgSend(a1, "inputHighlights");
            objc_msgSend(v31, "numberWithDouble:");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "stringFromNumber:", v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = v2;
            v22 = v20;
            v23 = CFSTR("highlights");
            goto LABEL_44;
          }
        }
        else
        {

        }
        objc_msgSend(MEMORY[0x24BE71D20], "offsetShadowsKey");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "isEqualToString:", v32))
        {
          objc_msgSend(a1, "offsetShadows");
          v34 = v33;

          if (v34 != 0.0)
          {
            v35 = (void *)MEMORY[0x24BDD16E0];
            objc_msgSend(a1, "inputShadows");
            objc_msgSend(v35, "numberWithDouble:");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "stringFromNumber:", v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = v2;
            v22 = v20;
            v23 = CFSTR("shadows");
            goto LABEL_44;
          }
        }
        else
        {

        }
        objc_msgSend(MEMORY[0x24BE71D20], "offsetContrastKey");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "isEqualToString:", v36))
        {
          objc_msgSend(a1, "offsetContrast");
          v38 = v37;

          if (v38 != 0.0)
          {
            v39 = (void *)MEMORY[0x24BDD16E0];
            objc_msgSend(a1, "inputContrast");
            objc_msgSend(v39, "numberWithDouble:");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "stringFromNumber:", v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = v2;
            v22 = v20;
            v23 = CFSTR("contrast");
            goto LABEL_44;
          }
        }
        else
        {

        }
        objc_msgSend(MEMORY[0x24BE71D20], "offsetBrightnessKey");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "isEqualToString:", v40))
        {
          objc_msgSend(a1, "offsetBrightness");
          v42 = v41;

          if (v42 != 0.0)
          {
            v43 = (void *)MEMORY[0x24BDD16E0];
            objc_msgSend(a1, "inputBrightness");
            objc_msgSend(v43, "numberWithDouble:");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "stringFromNumber:", v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = v2;
            v22 = v20;
            v23 = CFSTR("brightness");
            goto LABEL_44;
          }
        }
        else
        {

        }
        objc_msgSend(MEMORY[0x24BE71D20], "offsetBlackKey");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "isEqualToString:", v44))
        {
          objc_msgSend(a1, "offsetBlack");
          v46 = v45;

          if (v46 != 0.0)
          {
            v47 = (void *)MEMORY[0x24BDD16E0];
            objc_msgSend(a1, "inputBlack");
            objc_msgSend(v47, "numberWithDouble:");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "stringFromNumber:", v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = v2;
            v22 = v20;
            v23 = CFSTR("black_point");
            goto LABEL_44;
          }
        }
        else
        {

        }
        objc_msgSend(MEMORY[0x24BE71D20], "inputLightKey");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "isEqualToString:", v48))
        {
          objc_msgSend(a1, "inputLight");
          v50 = v49;

          if (v50 != 0.0)
          {
            v51 = (void *)MEMORY[0x24BDD16E0];
            objc_msgSend(a1, "inputLight");
            objc_msgSend(v51, "numberWithDouble:");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "stringFromNumber:", v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = v2;
            v22 = v20;
            v23 = CFSTR("st_mega");
            goto LABEL_44;
          }
        }
        else
        {

        }
        objc_msgSend(a1, "valueForKey:", v12);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "doubleValue");
        if (v53 != 0.0)
        {
          v54 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v52, "doubleValue");
          objc_msgSend(v54, "numberWithDouble:");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "stringFromNumber:", v60);
          v55 = v2;
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "setObject:forKeyedSubscript:", v56, v12);

          v2 = v55;
        }

      }
LABEL_45:
      ++v11;
    }
    while (v9 != v11);
    v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v67, 16);
    v9 = v57;
  }
  while (v57);
LABEL_52:

  v58 = v2;
LABEL_54:

  return v58;
}

@end
