@implementation PISemanticStyleAdjustmentController(Analytics)

- (id)analyticsKeysBlocklist
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v0 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(MEMORY[0x24BE71CE8], "useStyleEngineKey");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE71CE8], "statisticsKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE71CE8], "debugModeKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithObjects:", v1, v2, v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  void *v34;
  id v35;
  void *v36;
  uint64_t v37;
  id obj;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _QWORD v43[3];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v35 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v2 = objc_alloc_init(MEMORY[0x24BDD16F0]);
  objc_msgSend(v2, "setMinimumFractionDigits:", 1);
  v34 = v2;
  objc_msgSend(v2, "setMaximumFractionDigits:", 2);
  objc_msgSend(a1, "adjustment");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3 || (v4 = (void *)v3, v5 = objc_msgSend(a1, "enabled"), v4, !v5))
  {
    v32 = (id)MEMORY[0x24BDBD1B8];
    goto LABEL_22;
  }
  objc_msgSend(a1, "visualInputKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "analyticsKeysBlocklist");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (!v8)
    goto LABEL_20;
  v9 = v8;
  v10 = *(_QWORD *)v40;
  v36 = v7;
  do
  {
    v11 = 0;
    v37 = v9;
    do
    {
      if (*(_QWORD *)v40 != v10)
        objc_enumerationMutation(obj);
      v12 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v11);
      if ((objc_msgSend(v7, "containsObject:", v12) & 1) == 0)
      {
        v13 = a1;
        objc_msgSend(MEMORY[0x24BE71CE8], "toneKey");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v43[0] = v14;
        objc_msgSend(MEMORY[0x24BE71CE8], "colorKey");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v43[1] = v15;
        objc_msgSend(MEMORY[0x24BE71CE8], "intensityKey");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v43[2] = v16;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v43, 3);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "containsObject:", v12);

        if (v18)
        {
          v19 = (void *)MEMORY[0x24BDD16E0];
          a1 = v13;
          objc_msgSend(v13, "valueForKey:", v12);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "doubleValue");
          objc_msgSend(v19, "numberWithDouble:");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "stringFromNumber:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("styles_%@"), v12);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "setObject:forKeyedSubscript:", v22, v23);

          goto LABEL_13;
        }
        objc_msgSend(MEMORY[0x24BE71CE8], "castKey");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v12, "isEqualToString:", v24);

        a1 = v13;
        if (v25)
        {
          objc_msgSend(v13, "cast");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "setObject:forKeyedSubscript:", v20, CFSTR("styles_cast"));
LABEL_13:
          v9 = v37;
        }
        else
        {
          objc_msgSend(v13, "valueForKey:", v12);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "doubleValue");
          v9 = v37;
          if (v26 != 0.0)
          {
            v27 = (void *)MEMORY[0x24BDD16E0];
            objc_msgSend(v20, "doubleValue");
            objc_msgSend(v27, "numberWithDouble:");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "stringFromNumber:", v28);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("styles_%@"), v12);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "setObject:forKeyedSubscript:", v29, v30);

          }
        }

        v7 = v36;
      }
      ++v11;
    }
    while (v9 != v11);
    v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    v9 = v31;
  }
  while (v31);
LABEL_20:

  v32 = v35;
LABEL_22:

  return v32;
}

@end
