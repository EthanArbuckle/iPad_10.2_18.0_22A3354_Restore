@implementation PEAnalyticsUtility

+ (id)diffKeysFromInitialComposition:(id)a3 toFinalComposition:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t i;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  objc_class *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  objc_class *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  char v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  _BOOL4 v61;
  void *v62;
  void *v63;
  int v64;
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
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  float v82;
  float v83;
  void *v84;
  void *v85;
  float v86;
  float v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t j;
  uint64_t v92;
  void *v93;
  void *v94;
  void *v95;
  id v97;
  id v98;
  char v99;
  void *v100;
  void *v101;
  BOOL v102;
  uint64_t v103;
  id obj;
  void *v106;
  void *v107;
  id v108;
  void *v109;
  char v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  _BYTE v124[128];
  _QWORD v125[5];
  _BYTE v126[128];
  _QWORD v127[3];

  v127[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc(MEMORY[0x24BE71C40]);
  v8 = (void *)objc_msgSend(v6, "copy");
  v101 = (void *)objc_msgSend(v7, "initWithComposition:", v8);

  v9 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v10 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v11 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v108 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE71C40]), "initWithComposition:", v5);
  objc_msgSend(v12, "semanticStyleAdjustmentController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v100 = v12;
  if (v13)
  {
    v14 = (void *)MEMORY[0x24BE71F80];
    v15 = *MEMORY[0x24BE71E78];
    v127[0] = *MEMORY[0x24BE71E78];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v127, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v14) = objc_msgSend(v14, "isIdentityCompositionController:forKeys:", v12, v16);

    if ((_DWORD)v14)
    {
      objc_msgSend(v12, "removeAdjustmentWithKey:", v15);
      objc_msgSend(v12, "composition");
      v17 = objc_claimAutoreleasedReturnValue();

      v5 = (id)v17;
    }
  }
  objc_msgSend(v101, "composition");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v102 = +[PEAutoAdjustmentController isAutoEnhanceEnabledForCompositionController:](PEAutoAdjustmentController, "isAutoEnhanceEnabledForCompositionController:", v101);
  objc_msgSend(v101, "differingAdjustmentsWithComposition:", v5);
  v120 = 0u;
  v121 = 0u;
  v122 = 0u;
  v123 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v112 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v120, v126, 16);
  if (v112)
  {
    v106 = v10;
    v107 = v11;
    v97 = v9;
    v98 = v6;
    v99 = 0;
    v110 = 0;
    v111 = *(_QWORD *)v121;
    v18 = *MEMORY[0x24BE71F20];
    v115 = *MEMORY[0x24BE71F28];
    v19 = *MEMORY[0x24BE71F50];
    v113 = *MEMORY[0x24BE71DB8];
    v114 = *MEMORY[0x24BE71DA0];
    v103 = *MEMORY[0x24BE71F18];
    v20 = v101;
    v21 = v108;
    v22 = v109;
    while (1)
    {
      for (i = 0; i != v112; ++i)
      {
        if (*(_QWORD *)v121 != v111)
          objc_enumerationMutation(obj);
        v24 = *(void **)(*((_QWORD *)&v120 + 1) + 8 * i);
        v125[0] = v18;
        v125[1] = v115;
        v125[2] = v19;
        v125[3] = v114;
        v125[4] = v113;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v125, 5);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "containsObject:", v24);

        if (v26)
        {
          objc_msgSend(v20, "adjustmentControllerForKey:", v24);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v27)
          {
            objc_msgSend(v20, "addAdjustmentWithKey:", v24);
            objc_msgSend(v20, "adjustmentControllerForKey:", v24);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
          }
          if (objc_msgSend(v24, "isEqualToString:", v18))
          {
            v28 = (objc_class *)MEMORY[0x24BE71D08];
            goto LABEL_25;
          }
          if (objc_msgSend(v24, "isEqualToString:", v115))
          {
            v28 = (objc_class *)MEMORY[0x24BE71D20];
LABEL_25:
            v41 = [v28 alloc];
            objc_msgSend(v5, "objectForKeyedSubscript:", v24);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = (void *)objc_msgSend(v41, "initWithAdjustment:", v42);

          }
          else
          {
            v43 = 0;
          }
          if (objc_msgSend(v24, "isEqualToString:", v103))
          {
            v44 = (objc_class *)MEMORY[0x24BE71D00];
            goto LABEL_45;
          }
          if (objc_msgSend(v24, "isEqualToString:", v19))
          {
            v44 = (objc_class *)MEMORY[0x24BE71D30];
            goto LABEL_45;
          }
          if (objc_msgSend(v24, "isEqualToString:", v114))
          {
            v44 = (objc_class *)MEMORY[0x24BE71C80];
            goto LABEL_45;
          }
          if (objc_msgSend(v24, "isEqualToString:", v113))
          {
            v44 = (objc_class *)MEMORY[0x24BE71C98];
LABEL_45:
            v53 = [v44 alloc];
            objc_msgSend(v5, "objectForKeyedSubscript:", v24);
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            v55 = objc_msgSend(v53, "initWithAdjustment:", v54);

            v43 = (void *)v55;
          }
          objc_msgSend(a1, "diffFromAdjustmentController:toAdjustmentController:", v43, v27);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "objectForKeyedSubscript:", kDiffAddedKey);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v107, "addObjectsFromArray:", v57);

          objc_msgSend(v56, "objectForKeyedSubscript:", kDiffModifiedKey);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v106, "addObjectsFromArray:", v58);

          objc_msgSend(v56, "objectForKeyedSubscript:", kDiffRemovedKey);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "addObjectsFromArray:", v59);

          if ((v110 & 1) == 0)
          {
            if (v102)
            {
              v99 = 1;
              v60 = v107;
              goto LABEL_50;
            }
            v61 = +[PEAutoAdjustmentController isAutoEnhanceEnabledForCompositionController:](PEAutoAdjustmentController, "isAutoEnhanceEnabledForCompositionController:", v100);
            v60 = v21;
            if (v61)
LABEL_50:
              objc_msgSend(v60, "addObject:", CFSTR("auto-enhance"));
          }

          v110 = 1;
LABEL_52:
          v22 = v109;
          continue;
        }
        objc_msgSend(v5, "objectForKeyedSubscript:", v24);
        v29 = objc_claimAutoreleasedReturnValue();
        if (!v29
          || (v30 = (void *)v29,
              objc_msgSend(v22, "objectForKeyedSubscript:", v24),
              v31 = (void *)objc_claimAutoreleasedReturnValue(),
              v31,
              v30,
              !v31))
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v24);
          v37 = objc_claimAutoreleasedReturnValue();
          if (v37)
          {
            v38 = (void *)v37;
            objc_msgSend(v22, "objectForKeyedSubscript:", v24);
            v39 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v39)
            {
              v21 = v108;
              objc_msgSend(v108, "addObject:", v24);
              continue;
            }
          }
          objc_msgSend(v5, "objectForKeyedSubscript:", v24);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          if (v40)
          {

          }
          else
          {
            objc_msgSend(v22, "objectForKeyedSubscript:", v24);
            v50 = (void *)objc_claimAutoreleasedReturnValue();

            if (v50)
              objc_msgSend(v107, "addObject:", v24);
          }
          goto LABEL_68;
        }
        objc_msgSend(v5, "objectForKeyedSubscript:", v24);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "valueForKey:", CFSTR("enabled"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v33, "BOOLValue") & 1) != 0)
        {
          objc_msgSend(v109, "objectForKeyedSubscript:", v24);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "valueForKey:", CFSTR("enabled"));
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = objc_msgSend(v35, "BOOLValue");

          v20 = v101;
          if (v36)
          {
            objc_msgSend(v106, "addObject:", v24);
LABEL_55:
            v21 = v108;
            v22 = v109;
            continue;
          }
        }
        else
        {

        }
        objc_msgSend(v5, "objectForKeyedSubscript:", v24);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "valueForKey:", CFSTR("enabled"));
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v46, "BOOLValue") & 1) != 0)
        {
          objc_msgSend(v109, "objectForKeyedSubscript:", v24);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "valueForKey:", CFSTR("enabled"));
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = objc_msgSend(v48, "BOOLValue");

          if ((v49 & 1) == 0)
          {
            v21 = v108;
            objc_msgSend(v108, "addObject:", v24);
            v20 = v101;
            goto LABEL_52;
          }
        }
        else
        {

        }
        objc_msgSend(v5, "objectForKeyedSubscript:", v24);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "valueForKey:", CFSTR("enabled"));
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v52, "BOOLValue"))
        {

        }
        else
        {
          objc_msgSend(v109, "objectForKeyedSubscript:", v24);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "valueForKey:", CFSTR("enabled"));
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          v64 = objc_msgSend(v63, "BOOLValue");

          if (v64)
          {
            objc_msgSend(v107, "addObject:", v24);
            v20 = v101;
            goto LABEL_55;
          }
        }
        objc_msgSend(v5, "objectForKeyedSubscript:", v24);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "valueForKey:", CFSTR("value"));
        v66 = objc_claimAutoreleasedReturnValue();
        if (v66)
        {
          v67 = (void *)v66;
          v22 = v109;
          objc_msgSend(v109, "objectForKeyedSubscript:", v24);
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "valueForKey:", CFSTR("value"));
          v69 = (void *)objc_claimAutoreleasedReturnValue();

          if (v69)
          {
            objc_msgSend(v5, "objectForKeyedSubscript:", v24);
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v70, "valueForKey:", CFSTR("value"));
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v71, "stringValue");
            v72 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v109, "objectForKeyedSubscript:", v24);
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v73, "valueForKey:", CFSTR("value"));
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v74, "stringValue");
            v75 = (void *)objc_claimAutoreleasedReturnValue();

            if ((objc_msgSend(v72, "isEqualToString:", v75) & 1) == 0)
              objc_msgSend(v106, "addObject:", v24);

            goto LABEL_66;
          }
        }
        else
        {

          v22 = v109;
        }
        objc_msgSend(v5, "objectForKeyedSubscript:", v24);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "valueForKey:", CFSTR("rate"));
        v76 = objc_claimAutoreleasedReturnValue();
        if (v76)
        {
          v77 = (void *)v76;
          objc_msgSend(v22, "objectForKeyedSubscript:", v24);
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v78, "valueForKey:", CFSTR("rate"));
          v79 = (void *)objc_claimAutoreleasedReturnValue();

          if (v79)
          {
            objc_msgSend(v5, "objectForKeyedSubscript:", v24);
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v80, "valueForKey:", CFSTR("rate"));
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v81, "floatValue");
            v83 = v82;

            objc_msgSend(v22, "objectForKeyedSubscript:", v24);
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v84, "valueForKey:", CFSTR("rate"));
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v85, "floatValue");
            v87 = v86;

            if (v83 != v87)
              objc_msgSend(v106, "addObject:", v24);
          }
          goto LABEL_67;
        }
LABEL_66:

LABEL_67:
        v20 = v101;
LABEL_68:
        v21 = v108;
      }
      v112 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v120, v126, 16);
      if (!v112)
      {
        v9 = v97;
        v6 = v98;
        v10 = v106;
        v11 = v107;
        if ((v99 & 1) != 0)
        {
          v118 = 0u;
          v119 = 0u;
          v116 = 0u;
          v117 = 0u;
          v88 = objc_msgSend(&unk_24C624B08, "countByEnumeratingWithState:objects:count:", &v116, v124, 16);
          if (v88)
          {
            v89 = v88;
            v90 = *(_QWORD *)v117;
            do
            {
              for (j = 0; j != v89; ++j)
              {
                if (*(_QWORD *)v117 != v90)
                  objc_enumerationMutation(&unk_24C624B08);
                v92 = *(_QWORD *)(*((_QWORD *)&v116 + 1) + 8 * j);
                objc_msgSend(v107, "removeObject:", v92);
                objc_msgSend(v106, "removeObject:", v92);
                objc_msgSend(v108, "removeObject:", v92);
              }
              v89 = objc_msgSend(&unk_24C624B08, "countByEnumeratingWithState:objects:count:", &v116, v124, 16);
            }
            while (v89);
          }
        }
        break;
      }
    }
  }
  if (objc_msgSend(v108, "count"))
  {
    objc_msgSend(v108, "componentsJoinedByString:", CFSTR(","));
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v93, CFSTR("adjustments_removed"));

  }
  if (objc_msgSend(v11, "count"))
  {
    objc_msgSend(v11, "componentsJoinedByString:", CFSTR(","));
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v94, CFSTR("adjustments_added"));

  }
  if (objc_msgSend(v10, "count"))
  {
    objc_msgSend(v10, "componentsJoinedByString:", CFSTR(","));
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v95, CFSTR("adjustments_modified"));

  }
  return v9;
}

+ (id)analyticPayloadForCompositionController:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  void *v43;
  void *v44;
  void *v45;
  double v46;
  double v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  void *v52;
  double v53;
  double v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  double v59;
  double v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  int v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  int v72;
  void *v73;
  void *v74;
  double v75;
  double v76;
  void *v77;
  void *v78;
  void *v79;
  int v80;
  void *v81;
  void *v82;
  void *v83;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  const __CFString *v89;
  _QWORD v90[2];

  v90[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(a1, "adjustmentValueBucketizerFormatter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v4, "smartToneAdjustmentController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "smartColorAdjustmentController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = v8;
  if (objc_msgSend(v7, "isAuto") && objc_msgSend(v8, "isAuto"))
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("1"), CFSTR("auto-enhance"));
    objc_msgSend(v7, "inputLight");
    v10 = v9;
    objc_msgSend(v7, "inputLightDefault");
    if (vabdd_f64(v10, v11) <= 0.001)
    {
      objc_msgSend(v6, "addEntriesFromDictionary:", &unk_24C624B38);
      goto LABEL_7;
    }
    v89 = CFSTR("auto-enhance_intensity");
    v12 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v7, "inputLight");
    objc_msgSend(v12, "numberWithDouble:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringFromNumber:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v90[0] = v14;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v90, &v89, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addEntriesFromDictionary:", v15);

  }
  else
  {
    objc_msgSend(v7, "analyticsPayload");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "analyticsPayload");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addEntriesFromDictionary:", v13);
    objc_msgSend(v6, "addEntriesFromDictionary:", v14);
  }

LABEL_7:
  objc_msgSend(v4, "smartBWAdjustmentController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "analyticsPayload");
  v17 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "whiteBalanceAdjustmentController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "analyticsPayload");
  v19 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "cropAdjustmentController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "analyticsPayload");
  v21 = objc_claimAutoreleasedReturnValue();

  v87 = (void *)v17;
  objc_msgSend(v6, "addEntriesFromDictionary:", v17);
  v86 = (void *)v19;
  objc_msgSend(v6, "addEntriesFromDictionary:", v19);
  v85 = (void *)v21;
  objc_msgSend(v6, "addEntriesFromDictionary:", v21);
  objc_msgSend(v4, "semanticStyleAdjustmentController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "analyticsPayload");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addEntriesFromDictionary:", v23);
  objc_msgSend(v4, "sharpenAdjustmentController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v17) = objc_msgSend(v24, "enabled");

  if ((_DWORD)v17)
  {
    objc_msgSend(v4, "sharpenAdjustmentController");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE71CF8], "intensityKey");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "valueForUndefinedKey:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "doubleValue");
    v29 = v28;

    if (v29 != 0.0)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringFromNumber:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v31, CFSTR("sharpness"));

    }
  }
  objc_msgSend(v4, "definitionAdjustmentController");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "enabled");

  if (v33)
  {
    objc_msgSend(v4, "definitionAdjustmentController");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE71C90], "intensityKey");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "valueForUndefinedKey:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "doubleValue");
    v38 = v37;

    if (v38 != 0.0)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringFromNumber:", v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v40, CFSTR("definition"));

    }
  }
  objc_msgSend(v4, "noiseReductionAdjustmentController");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v41, "enabled");

  if (v42)
  {
    objc_msgSend(v4, "noiseReductionAdjustmentController");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE71CB8], "amountKey");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "valueForUndefinedKey:", v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "doubleValue");
    v47 = v46;

    if (v47 != 0.0)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringFromNumber:", v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v49, CFSTR("noise_reduction"));

    }
  }
  objc_msgSend(v4, "vignetteAdjustmentController");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend(v50, "enabled");

  if (v51)
  {
    objc_msgSend(v4, "vignetteAdjustmentController");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "intensity");
    v54 = v53;

    if (v54 != 0.0)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v54);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringFromNumber:", v55);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v56, CFSTR("vignette"));

    }
  }
  objc_msgSend(v4, "slomoAdjustmentController");
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  if (v57)
  {
    objc_msgSend(v4, "slomoAdjustmentController");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "rate");
    v60 = v59;

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v61, CFSTR("slomo"));

  }
  objc_msgSend(v4, "cinematicAudioAdjustmentController");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "analyticsPayload");
  v63 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addEntriesFromDictionary:", v63);
  objc_msgSend(v4, "semanticStyleAdjustmentController");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "analyticsPayload");
  v65 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addEntriesFromDictionary:", v65);
  objc_msgSend(v4, "effect3DAdjustmentController");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = objc_msgSend(v66, "enabled");

  if (v67)
  {
    objc_msgSend(v4, "effect3DAdjustmentController");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "kind");
    v69 = (void *)objc_claimAutoreleasedReturnValue();

    if (v69 && (objc_msgSend(v69, "isEqualToString:", &stru_24C619BD0) & 1) == 0)
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v69, CFSTR("filter"));
    objc_msgSend(v4, "effect3DAdjustmentController");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "effectAdjustmentController");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = objc_msgSend(v71, "enabled");

    if (!v72)
      goto LABEL_34;
    objc_msgSend(v4, "effectAdjustmentController");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "kind");
    v69 = (void *)objc_claimAutoreleasedReturnValue();

    if (v69 && (objc_msgSend(v69, "isEqualToString:", &stru_24C619BD0) & 1) == 0)
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v69, CFSTR("filter"));
    objc_msgSend(v4, "effectAdjustmentController");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v74 = v70;
  objc_msgSend(v70, "intensity");
  v76 = v75;

  if (v76 != 0.0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v76);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringFromNumber:", v77);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v78, CFSTR("filter_intensity"));

  }
LABEL_34:
  objc_msgSend(v4, "portraitAdjustmentController");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = objc_msgSend(v79, "enabled");

  if (v80)
  {
    objc_msgSend(v4, "portraitAdjustmentController");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "kind");
    v82 = (void *)objc_claimAutoreleasedReturnValue();

    if (v82 && (objc_msgSend(v82, "isEqualToString:", &stru_24C619BD0) & 1) == 0)
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v82, CFSTR("portrait_effect"));

  }
  objc_msgSend(v4, "userOrientation");
  NUOrientationName();
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v83, CFSTR("user_orientation"));

  return v6;
}

+ (id)diffFromAdjustmentController:(id)a3 toAdjustmentController:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD v35[3];
  _QWORD v36[3];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v30 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v29 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v25 = v7;
    v27 = v5;
    objc_msgSend(v5, "analyticsPayload");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v6;
    objc_msgSend(v6, "analyticsPayload");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allKeys");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "mutableCopy");

    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v28 = v9;
    objc_msgSend(v9, "allKeys");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v32 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
          objc_msgSend(v11, "removeObject:", v17);
          objc_msgSend(v8, "objectForKeyedSubscript:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          v19 = v30;
          if (!v18)
            goto LABEL_10;
          objc_msgSend(v8, "objectForKeyedSubscript:", v17);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "objectForKeyedSubscript:", v17);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v20, "isEqualToString:", v21);

          v19 = v29;
          if ((v22 & 1) == 0)
LABEL_10:
            objc_msgSend(v19, "addObject:", v17);
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
      }
      while (v14);
    }

    v7 = v25;
    objc_msgSend(v25, "addObjectsFromArray:", v11);
    v35[0] = kDiffAddedKey;
    v35[1] = kDiffModifiedKey;
    v36[0] = v30;
    v36[1] = v29;
    v35[2] = kDiffRemovedKey;
    v36[2] = v25;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v36, v35, 3);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = v26;
    v5 = v27;
  }
  else
  {
    v23 = (void *)MEMORY[0x24BDBD1B8];
  }

  return v23;
}

+ (id)adjustmentValueBucketizerFormatter
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x24BDD16F0]);
  objc_msgSend(v2, "setUsesSignificantDigits:", 0);
  objc_msgSend(v2, "setRoundingMode:", 1);
  objc_msgSend(v2, "setRoundingIncrement:", &unk_24C624B88);
  objc_msgSend(v2, "setMultiplier:", &unk_24C624BA0);
  objc_msgSend(v2, "setZeroSymbol:", CFSTR("zero"));
  return v2;
}

+ (id)semanticStylesIdentifierForItem:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    objc_msgSend(v4, "fetchPropertySetsIfNeeded");
    objc_msgSend(v4, "photosInfoPanelExtendedProperties");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "semanticStylePreset");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = objc_msgSend(v6, "integerValue");
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("sem_style_%ld"), v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)semanticStyleCapturedCastForItem:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (v4 = objc_msgSend(v3, "currentSmartStyleCast"), (_DWORD)v4))
  {
    +[PEAdjustmentUtilities adjustmentStyleCastDisplayName:](PEAdjustmentUtilities, "adjustmentStyleCastDisplayName:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (void)reportAnalyticsForChangeFrom:(id)a3 to:(id)a4 actionType:(unint64_t)a5
{
  __CFString *v5;
  void *v6;
  id v7;

  if (a5 > 2)
    v5 = 0;
  else
    v5 = off_24C6180F8[a5];
  +[PEAnalyticsUtility diffKeysFromInitialComposition:toFinalComposition:](PEAnalyticsUtility, "diffKeysFromInitialComposition:toFinalComposition:", a3, a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, CFSTR("actionType"));
    objc_msgSend(v6, "addEntriesFromDictionary:", v7);
    objc_msgSend(MEMORY[0x24BE121D0], "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.edit.editAction"), v6);

  }
}

+ (id)analyticPayloadForCopyEditsSettings:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  __CFString *v11;
  __CFString *v12;
  int v13;
  const __CFString *v14;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  +[PECopyEditsSetting allSettings](PECopyEditsSetting, "allSettings");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "identifier");
        v11 = CFSTR("PECopyEditsSettingIdentifierCinematic");
        if ((unint64_t)(v10 - 1) <= 8)
          v11 = off_24C618160[v10 - 1];
        v12 = v11;
        v13 = PFExists();
        v14 = CFSTR("-1");
        if (v13)
        {
          if (objc_msgSend(v9, "enabled", CFSTR("-1")))
            v14 = CFSTR("1");
          else
            v14 = CFSTR("0");
        }
        objc_msgSend(v4, "setObject:forKey:", v14, v12);

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }

  return v4;
}

BOOL __58__PEAnalyticsUtility_analyticPayloadForCopyEditsSettings___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  v4 = objc_msgSend(v2, "identifier");
  v5 = objc_msgSend(v3, "identifier");

  return v4 == v5;
}

@end
