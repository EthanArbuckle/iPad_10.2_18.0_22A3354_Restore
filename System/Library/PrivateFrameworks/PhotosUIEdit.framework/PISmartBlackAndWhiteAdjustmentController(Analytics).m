@implementation PISmartBlackAndWhiteAdjustmentController(Analytics)

- (uint64_t)analyticsKeysBlocklist
{
  return objc_msgSend(MEMORY[0x24BDBCF20], "set");
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
  unint64_t v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  const __CFString *v43;
  void *v44;
  double v45;
  double v46;
  void *v47;
  double v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v54;
  uint64_t v55;
  id obj;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  +[PEAnalyticsUtility adjustmentValueBucketizerFormatter](PEAnalyticsUtility, "adjustmentValueBucketizerFormatter");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "adjustment");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3 || (v4 = (void *)v3, v5 = objc_msgSend(a1, "enabled"), v4, !v5))
  {
    v52 = (id)MEMORY[0x24BDBD1B8];
    goto LABEL_41;
  }
  objc_msgSend(a1, "visualInputKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "analyticsKeysBlocklist");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
  if (!v8)
    goto LABEL_39;
  v9 = v8;
  v10 = *(_QWORD *)v58;
  v11 = 0x24BE71000uLL;
  do
  {
    v12 = 0;
    v55 = v9;
    do
    {
      if (*(_QWORD *)v58 != v10)
        objc_enumerationMutation(obj);
      v13 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * v12);
      if ((objc_msgSend(v7, "containsObject:", v13) & 1) == 0)
      {
        v14 = v11;
        objc_msgSend(*(id *)(v11 + 3328), "autoKey");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "isEqualToString:", v15))
        {
          v16 = objc_msgSend(a1, "isAuto");

          if (v16)
          {
            objc_msgSend(v2, "setObject:forKeyedSubscript:", CFSTR("1"), CFSTR("sbw_auto"));
            v11 = v14;
            goto LABEL_37;
          }
        }
        else
        {

        }
        v17 = v10;
        objc_msgSend(*(id *)(v14 + 3328), "hueKey");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v13, "isEqualToString:", v18);

        if (v19)
        {
          v20 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(a1, "hue");
          objc_msgSend(v20, "numberWithDouble:");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "stringFromNumber:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "setObject:forKeyedSubscript:", v22, CFSTR("sbw_mega"));

          v11 = v14;
LABEL_36:
          v9 = v55;
          goto LABEL_37;
        }
        objc_msgSend(*(id *)(v14 + 3328), "grainKey");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v14;
        if (objc_msgSend(v13, "isEqualToString:", v23))
        {
          objc_msgSend(a1, "grain");
          v25 = v24;

          if (v25 != 0.0)
          {
            v26 = (void *)MEMORY[0x24BDD16E0];
            objc_msgSend(a1, "grain");
            objc_msgSend(v26, "numberWithDouble:");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "stringFromNumber:", v27);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v2, "setObject:forKeyedSubscript:", v28, CFSTR("sbw_grain"));

            v11 = v14;
            goto LABEL_36;
          }
        }
        else
        {

        }
        objc_msgSend(*(id *)(v14 + 3328), "neutralKey");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "isEqualToString:", v29))
        {
          objc_msgSend(a1, "neutral");
          v31 = v30;

          if (v31 != 0.0)
          {
            v32 = (void *)MEMORY[0x24BDD16E0];
            objc_msgSend(a1, "neutral");
            objc_msgSend(v32, "numberWithDouble:");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "stringFromNumber:", v33);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v2, "setObject:forKeyedSubscript:", v34, CFSTR("sbw_neutral"));

            v11 = v14;
            goto LABEL_36;
          }
        }
        else
        {

        }
        objc_msgSend(*(id *)(v14 + 3328), "toneKey");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "isEqualToString:", v35))
        {
          objc_msgSend(a1, "tone");
          v37 = v36;

          if (v37 != 0.0)
          {
            v38 = (void *)MEMORY[0x24BDD16E0];
            objc_msgSend(a1, "tone");
            objc_msgSend(v38, "numberWithDouble:");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "stringFromNumber:", v39);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = v2;
            v42 = v40;
            v43 = CFSTR("sbw_tone");
            goto LABEL_30;
          }
        }
        else
        {

        }
        objc_msgSend(*(id *)(v14 + 3328), "strengthKey");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "isEqualToString:", v44))
        {
          objc_msgSend(a1, "strength");
          v46 = v45;

          if (v46 != 0.0)
          {
            v47 = (void *)MEMORY[0x24BDD16E0];
            objc_msgSend(a1, "strength");
            objc_msgSend(v47, "numberWithDouble:");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "stringFromNumber:", v39);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = v2;
            v42 = v40;
            v43 = CFSTR("sbw_intensity");
LABEL_30:
            objc_msgSend(v41, "setObject:forKeyedSubscript:", v42, v43);
LABEL_34:

            v11 = v14;
            goto LABEL_35;
          }
        }
        else
        {

        }
        objc_msgSend(a1, "valueForKey:", v13);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "doubleValue");
        if (v48 != 0.0)
        {
          v49 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v39, "doubleValue");
          objc_msgSend(v49, "numberWithDouble:");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "stringFromNumber:", v40);
          v50 = v2;
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "setObject:forKeyedSubscript:", v51, v13);

          v2 = v50;
          v10 = v17;
          goto LABEL_34;
        }
LABEL_35:

        goto LABEL_36;
      }
LABEL_37:
      ++v12;
    }
    while (v9 != v12);
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
  }
  while (v9);
LABEL_39:

  v52 = v2;
LABEL_41:

  return v52;
}

@end
