@implementation PICropAdjustmentController(Analytics)

- (id)analyticsKeysBlocklist
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(MEMORY[0x24BE71C80], "constraintWidthKey");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE71C80], "constraintHeightKey");
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
  uint64_t v13;
  void *v14;
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
  void *v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  float v38;
  float v39;
  void *v40;
  void *v41;
  float v42;
  float v43;
  double v44;
  void *v45;
  void *v46;
  int v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  double v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  id v62;
  char v64;
  void *v65;
  id v66;
  char v67;
  id v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x24BDAC8D0];
  v68 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v2 = objc_alloc_init(MEMORY[0x24BDD16F0]);
  objc_msgSend(v2, "setMinimumFractionDigits:", 1);
  objc_msgSend(v2, "setMaximumFractionDigits:", 2);
  objc_msgSend(a1, "adjustment");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3 || (v4 = (void *)v3, v5 = objc_msgSend(a1, "enabled"), v4, !v5))
  {
    v62 = (id)MEMORY[0x24BDBD1B8];
    goto LABEL_46;
  }
  objc_msgSend(a1, "visualInputKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "analyticsKeysBlocklist");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v69, v73, 16);
  if (!v9)
    goto LABEL_44;
  v10 = v9;
  v64 = 0;
  v67 = 0;
  v11 = 0x24BE71000uLL;
  v12 = *(_QWORD *)v70;
  v66 = v8;
  do
  {
    v13 = 0;
    do
    {
      if (*(_QWORD *)v70 != v12)
        objc_enumerationMutation(v8);
      v14 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * v13);
      if ((objc_msgSend(v7, "containsObject:", v14) & 1) == 0)
      {
        objc_msgSend(*(id *)(v11 + 3200), "angleKey");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "isEqualToString:", v15))
        {
          objc_msgSend(a1, "angle");
          v17 = v16;

          if (v17 != 0.0)
          {
            v18 = (void *)MEMORY[0x24BDD16E0];
            objc_msgSend(a1, "angle");
            objc_msgSend(v18, "numberWithDouble:");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v2, "stringFromNumber:", v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = v68;
            v22 = v20;
            v23 = CFSTR("straighten");
LABEL_20:
            objc_msgSend(v21, "setObject:forKeyedSubscript:", v22, v23);
            goto LABEL_21;
          }
        }
        else
        {

        }
        objc_msgSend(*(id *)(v11 + 3200), "yawKey");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "isEqualToString:", v24))
        {
          objc_msgSend(a1, "yaw");
          v26 = v25;

          if (v26 != 0.0)
          {
            v27 = (void *)MEMORY[0x24BDD16E0];
            objc_msgSend(a1, "yaw");
            objc_msgSend(v27, "numberWithDouble:");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v2, "stringFromNumber:", v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = v68;
            v22 = v20;
            v23 = CFSTR("horizontal");
            goto LABEL_20;
          }
        }
        else
        {

        }
        objc_msgSend(*(id *)(v11 + 3200), "pitchKey");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "isEqualToString:", v28))
        {
          objc_msgSend(a1, "pitch");
          v30 = v29;

          if (v30 != 0.0)
          {
            v31 = (void *)MEMORY[0x24BDD16E0];
            objc_msgSend(a1, "pitch");
            objc_msgSend(v31, "numberWithDouble:");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v2, "stringFromNumber:", v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = v68;
            v22 = v20;
            v23 = CFSTR("vertical");
            goto LABEL_20;
          }
        }
        else
        {

        }
        v32 = v2;
        objc_msgSend(*(id *)(v11 + 3200), "widthKey");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "isEqualToString:", v33))
        {

        }
        else
        {
          objc_msgSend(*(id *)(v11 + 3200), "heightKey");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend(v14, "isEqualToString:", v34);

          v11 = 0x24BE71000uLL;
          if (!v35)
          {
            objc_msgSend(MEMORY[0x24BE71C80], "xOriginKey");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v14, "isEqualToString:", v45))
            {

              v2 = v32;
              goto LABEL_36;
            }
            objc_msgSend(MEMORY[0x24BE71C80], "yOriginKey");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v47 = objc_msgSend(v14, "isEqualToString:", v46);

            v2 = v32;
            if (v47)
            {
LABEL_36:
              if ((v64 & 1) != 0)
              {
                v64 = 1;
                v8 = v66;
                goto LABEL_23;
              }
              v48 = (void *)MEMORY[0x24BDD16E0];
              objc_msgSend(MEMORY[0x24BE71C80], "xOriginKey");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(a1, "valueForKey:", v49);
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v50, "doubleValue");
              objc_msgSend(v48, "numberWithDouble:");
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "stringFromNumber:", v51);
              v19 = (void *)objc_claimAutoreleasedReturnValue();

              v52 = (void *)MEMORY[0x24BDD16E0];
              objc_msgSend(MEMORY[0x24BE71C80], "yOriginKey");
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(a1, "valueForKey:", v65);
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v53, "doubleValue");
              objc_msgSend(v52, "numberWithDouble:");
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "stringFromNumber:", v54);
              v20 = (void *)objc_claimAutoreleasedReturnValue();

              v2 = v32;
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@;%@"), v19, v20);
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v68, "setObject:forKeyedSubscript:", v55, CFSTR("crop_rect_origin"));

              v64 = 1;
LABEL_41:
              v8 = v66;
LABEL_21:

            }
            else
            {
              objc_msgSend(a1, "valueForKey:", v14);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "doubleValue");
              if (v56 != 0.0)
              {
                v57 = (void *)MEMORY[0x24BDD16E0];
                objc_msgSend(v19, "doubleValue");
                objc_msgSend(v57, "numberWithDouble:");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v2, "stringFromNumber:", v20);
                v58 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v68, "setObject:forKeyedSubscript:", v58, v14);

                goto LABEL_41;
              }
              v8 = v66;
            }

LABEL_23:
            v11 = 0x24BE71000;
            goto LABEL_24;
          }
        }
        if ((v67 & 1) == 0)
        {
          objc_msgSend(*(id *)(v11 + 3200), "widthKey");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "valueForKey:", v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "floatValue");
          v39 = v38;

          objc_msgSend(*(id *)(v11 + 3200), "heightKey");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "valueForKey:", v40);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "floatValue");
          v43 = v42;

          *(float *)&v44 = v39 / v43;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v44);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v2 = v32;
          objc_msgSend(v32, "stringFromNumber:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "setObject:forKeyedSubscript:", v20, CFSTR("crop_ratio"));
          v67 = 1;
          goto LABEL_41;
        }
        v67 = 1;
        v2 = v32;
        v8 = v66;
      }
LABEL_24:
      ++v13;
    }
    while (v10 != v13);
    v59 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v69, v73, 16);
    v10 = v59;
  }
  while (v59);
LABEL_44:

  v60 = v8;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), objc_msgSend(a1, "isAuto"));
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "setObject:forKeyedSubscript:", v61, CFSTR("crop_auto"));

  v62 = v68;
LABEL_46:

  return v62;
}

@end
