@implementation PIDepthAdjustmentController(Analytics)

- (id)analyticsKeysBlocklist
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(MEMORY[0x24BE71C98], "depthInfoKey");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE71C98], "glassesMatteAllowedKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithObjects:", v1, v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)analyticsPayload
{
  id v2;
  uint64_t v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  float v24;
  double v25;
  void *v26;
  void *v27;
  float v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id v39;
  id v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v40 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v2 = objc_alloc_init(MEMORY[0x24BDD16F0]);
  objc_msgSend(v2, "setMinimumFractionDigits:", 1);
  objc_msgSend(v2, "setMaximumFractionDigits:", 2);
  objc_msgSend(a1, "adjustment");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v37 = (id)MEMORY[0x24BDBD1B8];
    goto LABEL_22;
  }
  v4 = (void *)v3;
  v39 = v2;
  v5 = objc_msgSend(a1, "enabled");

  if (!v5)
  {
    v37 = (id)MEMORY[0x24BDBD1B8];
    v2 = v39;
    goto LABEL_22;
  }
  objc_msgSend(a1, "visualInputKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = a1;
  objc_msgSend(a1, "analyticsKeysBlocklist");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
  v2 = v39;
  if (!v9)
    goto LABEL_19;
  v10 = v9;
  v11 = 0x24BE71000uLL;
  v12 = *(_QWORD *)v43;
  do
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v43 != v12)
        objc_enumerationMutation(v8);
      v14 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
      if ((objc_msgSend(v7, "containsObject:", v14) & 1) == 0)
      {
        objc_msgSend(*(id *)(v11 + 3224), "apertureKey");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v14, "isEqualToString:", v15);

        if (v16)
        {
          v17 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v41, "aperture");
          objc_msgSend(v17, "numberWithDouble:");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "stringFromNumber:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "setObject:forKeyedSubscript:", v19, CFSTR("aperture"));
          goto LABEL_15;
        }
        objc_msgSend(*(id *)(v11 + 3224), "focusRectKey");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v14, "isEqualToString:", v20);

        if (v21)
        {
          objc_msgSend(v41, "focusRect");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("x"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "floatValue");
          v25 = v24;

          objc_msgSend(v41, "focusRect");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("y"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "floatValue");
          v29 = v28;

          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v25);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "stringFromNumber:", v30);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v29);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "stringFromNumber:", v31);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_%@"), v18, v19);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "setObject:forKeyedSubscript:", v32, CFSTR("focusRect"));

          goto LABEL_15;
        }
        objc_msgSend(v41, "valueForKey:", v14);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "doubleValue");
        if (v33 != 0.0)
        {
          v34 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v18, "doubleValue");
          objc_msgSend(v34, "numberWithDouble:");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "stringFromNumber:", v19);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "setObject:forKeyedSubscript:", v35, v14);

          v2 = v39;
LABEL_15:

        }
        v11 = 0x24BE71000;
        continue;
      }
    }
    v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
  }
  while (v10);
LABEL_19:
  v36 = v8;

  v37 = v40;
LABEL_22:

  return v37;
}

@end
