@implementation WiFiUsageLQMRollingWindow

- (NSMutableArray)samples
{
  return self->_samples;
}

- (void)cleanUpStashedMedians
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[NSMutableSet setValue:forKey:](self->_features, "setValue:forKey:", 0, CFSTR("median"));
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = self->_triggerCriteriaFilterList;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7), "features", (_QWORD)v9);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setValue:forKey:", 0, CFSTR("median"));

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (id)evaluateCriteriaWithStopUponFirstMatch:(BOOL)a3
{
  WiFiUsageLQMRollingWindow *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _BOOL4 v8;
  NSMutableArray *samples;
  void *v10;
  void *v11;
  unint64_t v12;
  NSMutableSet *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSString *v23;
  BOOL v24;
  int v25;
  uint64_t j;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t k;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  uint64_t m;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  char v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  NSString *v65;
  NSString *lastSampleBssid;
  NSString *v67;
  NSMutableArray *obj;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  WiFiUsageLQMRollingWindow *v74;
  void *v75;
  void *v76;
  _BOOL4 v77;
  void *v78;
  id v79;
  uint64_t v80;
  int v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  _BYTE v98[128];
  _BYTE v99[128];
  _BYTE v100[128];
  _BYTE v101[128];
  uint64_t v102;

  v77 = a3;
  v3 = self;
  v102 = *MEMORY[0x1E0C80C00];
  -[NSMutableArray lastObject](self->_samples, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "networkDetails");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "connectedBss");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bssid");
  v7 = objc_claimAutoreleasedReturnValue();

  v78 = 0;
  v74 = v3;
  v80 = v7;
  if (!-[NSMutableArray count](v3->_samples, "count"))
  {
LABEL_14:
    v8 = v77;
    goto LABEL_15;
  }
  v8 = v77;
  if (v7)
  {
    samples = v3->_samples;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("networkDetails.connectedBss.bssid == %@"), v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray filteredArrayUsingPredicate:](samples, "filteredArrayUsingPredicate:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v78 = v11;
    v12 = objc_msgSend(v11, "count");
    if (v12 >= _config_minSamples)
    {
      v96 = 0u;
      v97 = 0u;
      v94 = 0u;
      v95 = 0u;
      v13 = v3->_features;
      v14 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v94, v101, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v95;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v95 != v16)
              objc_enumerationMutation(v13);
            v18 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * i);
            objc_msgSend(v18, "median");
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v19)
            {
              objc_msgSend(v18, "fieldName");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              +[WiFiUsageLQMRollingWindow medianIntegerValueForField:ScaledByDuration:OnSamples:](WiFiUsageLQMRollingWindow, "medianIntegerValueForField:ScaledByDuration:OnSamples:", v20, objc_msgSend(v18, "isPerSecond"), v78);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "setMedian:", v21);

            }
          }
          v15 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v94, v101, 16);
        }
        while (v15);
      }

      v3 = v74;
      goto LABEL_14;
    }
  }
LABEL_15:
  v92 = 0u;
  v93 = 0u;
  v90 = 0u;
  v91 = 0u;
  obj = v3->_triggerCriteriaFilterList;
  v71 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v90, v100, 16);
  v22 = 0;
  if (v71)
  {
    v23 = (NSString *)v7;
    v70 = *(_QWORD *)v91;
    if (v7)
      v24 = v78 == 0;
    else
      v24 = 1;
    v25 = !v24;
    v81 = v25;
    while (1)
    {
      for (j = 0; j != v71; ++j)
      {
        if (*(_QWORD *)v91 != v70)
          objc_enumerationMutation(obj);
        v27 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * j);
        if (v81
          && objc_msgSend(v78, "count")
          && (objc_msgSend(v27, "filterSamplesPredicate"),
              v28 = (void *)objc_claimAutoreleasedReturnValue(),
              v28,
              v28))
        {
          objc_msgSend(v27, "filterSamplesPredicate");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v78, "filteredArrayUsingPredicate:", v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          if (v30 && objc_msgSend(v30, "count"))
          {
            v72 = j;
            v88 = 0u;
            v89 = 0u;
            v86 = 0u;
            v87 = 0u;
            v75 = v27;
            objc_msgSend(v27, "features");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v86, v99, 16);
            if (v32)
            {
              v33 = v32;
              v34 = *(_QWORD *)v87;
              do
              {
                for (k = 0; k != v33; ++k)
                {
                  if (*(_QWORD *)v87 != v34)
                    objc_enumerationMutation(v31);
                  v36 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * k);
                  objc_msgSend(v36, "median");
                  v37 = (void *)objc_claimAutoreleasedReturnValue();

                  if (!v37)
                  {
                    objc_msgSend(v36, "fieldName");
                    v38 = (void *)objc_claimAutoreleasedReturnValue();
                    +[WiFiUsageLQMRollingWindow medianIntegerValueForField:ScaledByDuration:OnSamples:](WiFiUsageLQMRollingWindow, "medianIntegerValueForField:ScaledByDuration:OnSamples:", v38, objc_msgSend(v36, "isPerSecond"), v30);
                    v39 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v36, "setMedian:", v39);

                  }
                }
                v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v86, v99, 16);
              }
              while (v33);
            }

            v23 = (NSString *)v80;
            j = v72;
            v27 = v75;
          }
        }
        else
        {
          v30 = 0;
        }
        v84 = 0u;
        v85 = 0u;
        v82 = 0u;
        v83 = 0u;
        objc_msgSend(v27, "criterias");
        v79 = (id)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v82, v98, 16);
        if (!v40)
        {
          v43 = 0;
          goto LABEL_87;
        }
        v41 = v40;
        v76 = v27;
        v73 = j;
        v42 = *(_QWORD *)v83;
        v43 = v22;
        while (2)
        {
          for (m = 0; m != v41; ++m)
          {
            v45 = v43;
            if (*(_QWORD *)v83 != v42)
              objc_enumerationMutation(v79);
            v43 = *(id *)(*((_QWORD *)&v82 + 1) + 8 * m);

            if (!v81)
            {
LABEL_54:
              v46 = 0;
              v47 = 0;
              goto LABEL_62;
            }
            v46 = 0;
            v47 = 0;
            if (objc_msgSend(v78, "count") && v30)
            {
              if (!objc_msgSend(v30, "count"))
                goto LABEL_54;
              v48 = objc_msgSend(v43, "type");
              if (v48)
              {
                if (v48 == 1)
                {
                  objc_msgSend(v76, "features");
                  v49 = objc_claimAutoreleasedReturnValue();
                  goto LABEL_56;
                }
                v50 = 0;
              }
              else
              {
                -[NSMutableArray lastObject](v74->_samples, "lastObject");
                v49 = objc_claimAutoreleasedReturnValue();
LABEL_56:
                v50 = (void *)v49;
              }
              objc_msgSend(v43, "requiredFieldsValid");
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              v47 = objc_msgSend(v51, "evaluateWithObject:", v50);

              if ((_DWORD)v47)
              {
                objc_msgSend(v43, "predicate");
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                v46 = objc_msgSend(v52, "evaluateWithObject:", v50);

              }
              else
              {
                v46 = 0;
              }
              objc_msgSend(v30, "lastObject");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v53, "timestamp");
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v43, "setCurrentSample:", v54);

              v8 = v77;
              v23 = (NSString *)v80;
            }
LABEL_62:
            objc_msgSend(v43, "setMatched:", v46);
            objc_msgSend(v43, "setValid:", v47);
            objc_msgSend(v43, "firstTriggered");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            v56 = v55;
            if ((_DWORD)v46)
            {

              if (!v56)
              {
                objc_msgSend(v43, "currentSample");
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v43, "setFirstTriggered:", v57);

              }
              objc_msgSend(v43, "setBssid:", v23);
              if (v8)
              {
                objc_msgSend(v43, "firstTriggered");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v43, "currentSample");
                v58 = (void *)objc_claimAutoreleasedReturnValue();
                v59 = objc_msgSend(v22, "isEqual:", v58);

                if ((v59 & 1) != 0)
                {
                  v23 = (NSString *)v80;
                  goto LABEL_86;
                }

                v23 = (NSString *)v80;
              }
            }
            else
            {
              if (v55)
              {
                objc_msgSend(v43, "lastTriggered");
                v60 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v60)
                {
                  if (v30 && (unint64_t)objc_msgSend(v30, "count") >= 2)
                  {
                    objc_msgSend(v30, "objectAtIndex:", objc_msgSend(v30, "count") - 2);
                    v61 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v61, "timestamp");
                    v62 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v43, "setLastTriggered:", v62);

                  }
                  else
                  {
                    objc_msgSend(v43, "currentSample");
                    v63 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v63)
                      objc_msgSend(v43, "currentSample");
                    else
                      objc_msgSend(v43, "firstTriggered");
                    v61 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v43, "setLastTriggered:", v61);
                  }

                }
              }
              v23 = (NSString *)v80;
              objc_msgSend(v43, "setBssid:", v80);
              if (v8)
              {
                objc_msgSend(v43, "lastTriggered");
                v64 = (void *)objc_claimAutoreleasedReturnValue();

                if (v64)
                {
                  v22 = v43;
                  j = v73;
                  goto LABEL_88;
                }
              }
            }
          }
          v41 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v82, v98, 16);
          if (v41)
            continue;
          break;
        }
        v22 = v43;
        v43 = 0;
LABEL_86:
        j = v73;
LABEL_87:

        v22 = v43;
LABEL_88:

      }
      v71 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v90, v100, 16);
      if (!v71)
        goto LABEL_92;
    }
  }
  v23 = (NSString *)v7;
LABEL_92:

  v65 = v23;
  lastSampleBssid = v74->_lastSampleBssid;
  v74->_lastSampleBssid = v65;
  v67 = v65;

  return v22;
}

+ (id)medianIntegerValueForField:(id)a3 ScaledByDuration:(BOOL)a4 OnSamples:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  unint64_t v17;
  void *v18;
  unint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v6 = a4;
  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v28 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(a1, "getValue:ForField:ScaledByDuration:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i), v8, v6, (_QWORD)v27);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
          objc_msgSend(v10, "addObject:", v16);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v13);
  }

  v17 = objc_msgSend(v10, "count");
  if (v17 >= _config_minSamples)
  {
    v19 = v17;
    objc_msgSend(v10, "sortUsingSelector:", sel_compare_);
    if ((v19 & 1) != 0)
    {
      objc_msgSend(v10, "objectAtIndex:", v19 >> 1);
      v25 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v10, "objectAtIndex:", (v19 - 1) >> 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "integerValue");

      objc_msgSend(v10, "objectAtIndex:", v19 >> 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "integerValue");

      v24 = v23 + v21;
      if (v23 + v21 < 0 != __OFADD__(v23, v21))
        ++v24;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v24 >> 1, (_QWORD)v27);
      v25 = objc_claimAutoreleasedReturnValue();
    }
    v18 = (void *)v25;
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

+ (id)getValue:(id)a3 ForField:(id)a4 ScaledByDuration:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  double v12;
  uint64_t v13;

  v5 = a5;
  v7 = a3;
  v8 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "numberForKeyPath:", v8);
  else
    objc_msgSend(v7, "valueForKeyPath:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 && (objc_msgSend(v7, "duration") || !v5))
  {
    if (v5 && objc_msgSend(v7, "duration"))
    {
      v11 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v9, "doubleValue");
      objc_msgSend(v11, "numberWithLong:", (uint64_t)(v12 / (double)(unint64_t)objc_msgSend(v7, "duration")));
      v13 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v13;
    }
    v10 = v9;
    v9 = v10;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)setCurrentApplicationName:(id)a3 withAttributes:(id)a4
{
  NSString *v6;
  NSString *fgApp;

  v6 = (NSString *)a3;
  objc_storeStrong((id *)&_current_fgApp, a3);
  fgApp = self->_fgApp;
  self->_fgApp = v6;

}

- (BOOL)checkCriteriaBSSIDWithSample:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "networkDetails");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "connectedBss");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bssid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[NSString isEqualToString:](self->_lastSampleBssid, "isEqualToString:", v6))
  {
    v7 = 0;
  }
  else
  {
    v22 = v6;
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v8 = self->_triggerCriteriaFilterList;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v9)
    {
      v10 = v9;
      v7 = 0;
      v11 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v28 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          v23 = 0u;
          v24 = 0u;
          v25 = 0u;
          v26 = 0u;
          objc_msgSend(v13, "criterias");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
          if (v15)
          {
            v16 = v15;
            v17 = *(_QWORD *)v24;
            do
            {
              for (j = 0; j != v16; ++j)
              {
                if (*(_QWORD *)v24 != v17)
                  objc_enumerationMutation(v14);
                v19 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * j);
                if (objc_msgSend(v19, "matched"))
                {
                  objc_msgSend(v19, "currentSample");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v19, "setLastTriggered:", v20);

                  v7 = 1;
                }
              }
              v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
            }
            while (v16);
          }

        }
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v10);
    }
    else
    {
      v7 = 0;
    }

    v6 = v22;
  }

  return v7 & 1;
}

- (WiFiUsageInterfaceCapabilities)capabilities
{
  return self->_capabilities;
}

- (NSMutableArray)triggerCriteriaFilterList
{
  return self->_triggerCriteriaFilterList;
}

- (void)addSample:(id)a3
{
  id v4;
  NSMutableArray *v5;
  NSMutableArray *samples;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;

  v4 = a3;
  if (v4)
  {
    v11 = v4;
    if (!self->_samples)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      samples = self->_samples;
      self->_samples = v5;

      v4 = v11;
    }
    objc_msgSend(v4, "setFgApp:", _current_fgApp);
    -[NSMutableArray lastObject](self->_samples, "lastObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "interfaceName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "interfaceName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", v8);

    if (v10)
      objc_msgSend(v11, "setInterfaceName:", v8);
    -[NSMutableArray addObject:](self->_samples, "addObject:", v11);
    if (self->_duration != *(double *)&_config_duration)
      *(_QWORD *)&self->_duration = _config_duration;
    -[WiFiUsageLQMRollingWindow updateWindow](self, "updateWindow");

    v4 = v11;
  }

}

- (void)updateWindow
{
  void *v3;
  NSMutableArray *samples;
  void *v5;
  NSMutableArray *preceedingTriggers;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateByAddingTimeInterval:", -self->_duration);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  samples = self->_samples;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("timestamp >= %@"), v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray filterUsingPredicate:](samples, "filterUsingPredicate:", v5);

  preceedingTriggers = self->_preceedingTriggers;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("timestamp >= %@"), v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray filterUsingPredicate:](preceedingTriggers, "filterUsingPredicate:", v7);

}

+ (void)initialize
{
  void *v2;
  id v3;

  _config_duration = 0x404E000000000000;
  _config_minSamples = 5;
  v2 = (void *)_config_criteriaList;
  _config_criteriaList = 0;

  v3 = +[WiFiUsageLQMConfiguration getConfigForKey:](WiFiUsageLQMConfiguration, "getConfigForKey:", CFSTR("LQMRollingWindow"));
}

+ (void)updateConfig
{
  void *v2;
  double v3;
  float v4;
  double v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  +[WiFiUsageLQMConfiguration getConfigForKey:](WiFiUsageLQMConfiguration, "getConfigForKey:", CFSTR("LQMRollingWindow"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v10, "objectForKey:", CFSTR("duration"));
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      if (v2
        && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        && (v3 = *(double *)&_config_duration, v3 != (double)(unint64_t)objc_msgSend(v2, "unsignedLongValue")))
      {
        objc_msgSend(v2, "floatValue");
        v5 = v4;
      }
      else
      {
        if (arc4random_uniform(0x64u) >= 0x32)
          v6 = 30;
        else
          v6 = 60;
        v5 = (double)v6;
      }
      _config_duration = *(_QWORD *)&v5;
      objc_msgSend(v10, "objectForKey:", CFSTR("minSamplesForFeatures"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v8 = _config_minSamples;
          if (v8 != objc_msgSend(v7, "unsignedLongValue"))
            _config_minSamples = objc_msgSend(v7, "unsignedLongValue");
        }
      }
      objc_msgSend(v10, "objectForKey:", CFSTR("DataTriggeredCriteriaList"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && (objc_msgSend((id)_config_criteriaList, "isEqualToArray:", v9) & 1) == 0)
        {
          objc_storeStrong((id *)&_config_criteriaList, v9);
        }
      }

    }
  }
  NSLog(CFSTR("%s: duration set to %f"), "+[WiFiUsageLQMRollingWindow updateConfig]", _config_duration);
  NSLog(CFSTR("%s: minSamples set to %lu"), "+[WiFiUsageLQMRollingWindow updateConfig]", _config_minSamples);

}

- (WiFiUsageLQMRollingWindow)initWithInterfaceName:(id)a3 andInterfaceCapabilities:(id)a4
{
  return -[WiFiUsageLQMRollingWindow initWithInterfaceName:andDuration:andInterfaceCapabilities:](self, "initWithInterfaceName:andDuration:andInterfaceCapabilities:", a3, a4, *(double *)&_config_duration);
}

- (WiFiUsageLQMRollingWindow)initWithInterfaceName:(id)a3 andDuration:(double)a4 andInterfaceCapabilities:(id)a5
{
  id v8;
  id v9;
  WiFiUsageLQMRollingWindow *v10;
  uint64_t v11;
  NSString *interfaceName;
  uint64_t v13;
  NSDate *createdTimestamp;
  NSMutableArray *samples;
  uint64_t v16;
  NSMutableArray *triggerCriteriaFilterList;
  uint64_t v18;
  NSMutableSet *features;
  NSMutableArray *preceedingTriggers;
  NSString *fgApp;
  WiFiUsageLQMRollingWindow *v22;
  objc_super v24;

  v8 = a3;
  v9 = a5;
  if (v8)
  {
    v24.receiver = self;
    v24.super_class = (Class)WiFiUsageLQMRollingWindow;
    v10 = -[WiFiUsageLQMRollingWindow init](&v24, sel_init);
    v11 = objc_msgSend(v8, "copy");
    interfaceName = v10->_interfaceName;
    v10->_interfaceName = (NSString *)v11;

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v13 = objc_claimAutoreleasedReturnValue();
    createdTimestamp = v10->_createdTimestamp;
    v10->_createdTimestamp = (NSDate *)v13;

    v10->_duration = a4;
    samples = v10->_samples;
    v10->_samples = 0;

    objc_storeStrong((id *)&v10->_capabilities, a5);
    v16 = objc_opt_new();
    triggerCriteriaFilterList = v10->_triggerCriteriaFilterList;
    v10->_triggerCriteriaFilterList = (NSMutableArray *)v16;

    v18 = objc_opt_new();
    features = v10->_features;
    v10->_features = (NSMutableSet *)v18;

    preceedingTriggers = v10->_preceedingTriggers;
    v10->_preceedingTriggers = 0;

    fgApp = v10->_fgApp;
    v10->_fgApp = 0;

    self = v10;
    v22 = self;
  }
  else
  {
    NSLog(CFSTR("%s - Invalid interfaceName:%@"), "-[WiFiUsageLQMRollingWindow initWithInterfaceName:andDuration:andInterfaceCapabilities:]", 0);
    v22 = 0;
  }

  return v22;
}

- (void)addSamples:(id)a3
{
  id v4;
  NSMutableArray *samples;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    samples = self->_samples;
    v8 = v4;
    if (!samples)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      v7 = self->_samples;
      self->_samples = v6;

      samples = self->_samples;
    }
    -[NSMutableArray addObjectsFromArray:](samples, "addObjectsFromArray:", v8);
    -[WiFiUsageLQMRollingWindow updateWindow](self, "updateWindow");
    v4 = v8;
  }

}

- (void)addTrigger:(id)a3
{
  id v4;
  NSMutableArray *preceedingTriggers;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    preceedingTriggers = self->_preceedingTriggers;
    v8 = v4;
    if (!preceedingTriggers)
    {
      v6 = (NSMutableArray *)objc_opt_new();
      v7 = self->_preceedingTriggers;
      self->_preceedingTriggers = v6;

      preceedingTriggers = self->_preceedingTriggers;
    }
    -[NSMutableArray addObject:](preceedingTriggers, "addObject:", v8);
    v4 = v8;
  }

}

- (void)clearOngoingCriteriaDates
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  NSMutableArray *obj;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = self->_triggerCriteriaFilterList;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v3)
  {
    v4 = v3;
    v17 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v23 != v17)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        objc_msgSend(v6, "criterias");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v19;
          do
          {
            for (j = 0; j != v9; ++j)
            {
              if (*(_QWORD *)v19 != v10)
                objc_enumerationMutation(v7);
              v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * j);
              v13 = objc_msgSend(v12, "matched");
              if ((v13 & 1) == 0)
              {
                objc_msgSend(v12, "firstTriggered");
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                v2 = v14;
                if (v14)
                {

LABEL_17:
                  objc_msgSend(v12, "setCurrentSample:", 0);
                  objc_msgSend(v12, "setFirstTriggered:", 0);
                  objc_msgSend(v12, "setLastTriggered:", 0);
                  objc_msgSend(v12, "setBssid:", 0);
                  continue;
                }
              }
              objc_msgSend(v12, "lastTriggered");
              v15 = (void *)objc_claimAutoreleasedReturnValue();

              if ((v13 & 1) == 0)
              if (v15)
                goto LABEL_17;
            }
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
          }
          while (v9);
        }

      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v4);
  }

}

- (BOOL)endOngoingCriteria
{
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t i;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSString *lastSampleBssid;
  NSMutableArray *obj;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = self->_triggerCriteriaFilterList;
  v2 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v2)
  {
    v3 = v2;
    v4 = 0;
    v22 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v28 != v22)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        objc_msgSend(v6, "criterias");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v24;
          do
          {
            for (j = 0; j != v9; ++j)
            {
              if (*(_QWORD *)v24 != v10)
                objc_enumerationMutation(v7);
              v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * j);
              objc_msgSend(v12, "setMatched:", 0);
              objc_msgSend(v12, "setValid:", 0);
              objc_msgSend(v12, "firstTriggered");
              v13 = objc_claimAutoreleasedReturnValue();
              if (v13)
              {
                v14 = (void *)v13;
                objc_msgSend(v12, "lastTriggered");
                v15 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v15)
                {
                  objc_msgSend(v12, "currentSample");
                  v16 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v16)
                    objc_msgSend(v12, "currentSample");
                  else
                    objc_msgSend(v12, "firstTriggered");
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v12, "setLastTriggered:", v17);

                  v4 = 1;
                }
              }
              objc_msgSend(v12, "setBssid:", 0);
            }
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
          }
          while (v9);
        }

      }
      v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v3);
  }
  else
  {
    v4 = 0;
  }

  lastSampleBssid = self->_lastSampleBssid;
  self->_lastSampleBssid = 0;

  return v4 & 1;
}

- (id)getTriggerCriteriaList
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = self->_triggerCriteriaFilterList;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v8);
        v10 = objc_alloc(MEMORY[0x1E0C99D20]);
        objc_msgSend(v9, "criterias", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)objc_msgSend(v10, "initWithArray:copyItems:", v11, 1);

        objc_msgSend(v3, "addObjectsFromArray:", v12);
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  return v3;
}

- (BOOL)configureDataTriggeredCriteria
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  id v9;
  WiFiUsageLQMTriggerCriteriaFilter *v10;
  void *v11;
  WiFiUsageLQMTriggerCriteriaFilter *v12;
  _BOOL4 v13;
  const __CFString *v14;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  uint64_t v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (!_config_criteriaList)
    return 0;
  -[NSMutableArray removeAllObjects](self->_triggerCriteriaFilterList, "removeAllObjects");
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v3 = (id)_config_criteriaList;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v9 = v8;
          v10 = [WiFiUsageLQMTriggerCriteriaFilter alloc];
          +[WiFiUsageLQMUserSample allLQMProperties](WiFiUsageLQMUserSample, "allLQMProperties");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = -[WiFiUsageLQMTriggerCriteriaFilter initWith:forFields:andFeatures:](v10, "initWith:forFields:andFeatures:", v9, v11, self->_features);

          v13 = v12 == 0;
          if (v12)
            -[NSMutableArray addObject:](self->_triggerCriteriaFilterList, "addObject:", v12);

        }
        else
        {
          NSLog(CFSTR("%s: DataTriggered criteria has wrong format"), "-[WiFiUsageLQMRollingWindow configureDataTriggeredCriteria]");
          v13 = 1;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    }
    while (v5);

    if (v13)
      v14 = CFSTR("(with errors)");
    else
      v14 = &stru_1E881F240;
  }
  else
  {

    LOBYTE(v13) = 0;
    v14 = &stru_1E881F240;
  }
  v16 = (void *)MEMORY[0x1E0CB3940];
  -[WiFiUsageLQMRollingWindow getTriggerCriteriaList](self, "getTriggerCriteriaList");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("%s: DataTriggered criteria configured %@: %@"), "-[WiFiUsageLQMRollingWindow configureDataTriggeredCriteria]", v14, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(objc_retainAutorelease(v18), "UTF8String"));
    v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v20 = objc_msgSend(v19, "UTF8String");
    *(_DWORD *)buf = 136446210;
    v26 = v20;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  return !v13;
}

+ (id)maximumIntegerValueForField:(id)a3 ScaledByDuration:(BOOL)a4 OnSamples:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v6 = a4;
  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (!v10)
    goto LABEL_12;
  v11 = v10;
  v12 = *(_QWORD *)v20;
  v13 = 0x8000000000000000;
  do
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v20 != v12)
        objc_enumerationMutation(v9);
      objc_msgSend(a1, "getValue:ForField:ScaledByDuration:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i), v8, v6);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v15 && objc_msgSend(v15, "integerValue") > v13)
        v13 = objc_msgSend(v16, "integerValue");

    }
    v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  }
  while (v11);
  if (v13 != 0x8000000000000000)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_12:
    v17 = 0;
  }

  return v17;
}

+ (id)minimumIntegerValueForField:(id)a3 ScaledByDuration:(BOOL)a4 OnSamples:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v6 = a4;
  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (!v10)
    goto LABEL_12;
  v11 = v10;
  v12 = *(_QWORD *)v20;
  v13 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v20 != v12)
        objc_enumerationMutation(v9);
      objc_msgSend(a1, "getValue:ForField:ScaledByDuration:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i), v8, v6);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v15 && objc_msgSend(v15, "integerValue") < v13)
        v13 = objc_msgSend(v16, "integerValue");

    }
    v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  }
  while (v11);
  if (v13 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_12:
    v17 = 0;
  }

  return v17;
}

+ (id)averageIntegerValueForField:(id)a3 ScaledByDuration:(BOOL)a4 OnSamples:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v6 = a4;
  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (!v10)
    goto LABEL_12;
  v11 = v10;
  v12 = 0;
  v13 = 0;
  v14 = *(_QWORD *)v21;
  do
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v21 != v14)
        objc_enumerationMutation(v9);
      objc_msgSend(a1, "getValue:ForField:ScaledByDuration:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i), v8, v6);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v16)
      {
        ++v12;
        v13 += objc_msgSend(v16, "integerValue");
      }

    }
    v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  }
  while (v11);
  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)v13 / (double)v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_12:
    v18 = 0;
  }

  return v18;
}

+ (id)sumIntegerValueForField:(id)a3 ScaledByDuration:(BOOL)a4 OnSamples:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v6 = a4;
  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v9);
        objc_msgSend(a1, "getValue:ForField:ScaledByDuration:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i), v8, v6);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (v15)
          v12 += objc_msgSend(v15, "integerValue");

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v11);
  }
  else
  {
    v12 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (id)modeValueForField:(id)a3 ScaledByDuration:(BOOL)a4 OnSamples:(id)a5
{
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a1, "modesValueForField:ScaledByDuration:OnSamples:", a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "lastObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)modesValueForField:(id)a3 ScaledByDuration:(BOOL)a4 OnSamples:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  uint64_t v27;
  WiFiUsageLQMModes *v28;
  void *v29;
  WiFiUsageLQMModes *v30;
  void *v31;
  void *v33;
  id obj;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v6 = a4;
  v45 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = v9;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v40 != v13)
          objc_enumerationMutation(obj);
        objc_msgSend(a1, "getValue:ForField:ScaledByDuration:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i), v8, v6);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          objc_msgSend(v10, "objectForKey:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v16;
          if (v16)
            v18 = objc_msgSend(v16, "unsignedIntegerValue") + 1;
          else
            v18 = 1;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setObject:forKey:", v19, v15);

        }
      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    }
    while (v12);
  }
  v33 = v8;

  objc_msgSend(v10, "keysSortedByValueUsingSelector:", sel_compare_);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_opt_new();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v22 = v20;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v36;
    do
    {
      for (j = 0; j != v24; ++j)
      {
        if (*(_QWORD *)v36 != v25)
          objc_enumerationMutation(v22);
        v27 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * j);
        v28 = [WiFiUsageLQMModes alloc];
        objc_msgSend(v10, "objectForKeyedSubscript:", v27, v33);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = -[WiFiUsageLQMModes initWithValue:andOccurrences:](v28, "initWithValue:andOccurrences:", v27, v29);
        objc_msgSend(v21, "addObject:", v30);

      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
    }
    while (v24);
  }

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v21);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return v31;
}

- (BOOL)hasChanged:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_samples;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = 0;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      v9 = 0;
      v10 = v7;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "numberForKeyPath:", v4, (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v11;
        if (v10 && (objc_msgSend(v11, "isEqual:", v10) & 1) == 0)
        {

          LOBYTE(v6) = 1;
          goto LABEL_12;
        }

        ++v9;
        v10 = v7;
      }
      while (v6 != v9);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
    v10 = v7;
LABEL_12:

  }
  return v6;
}

- (NSString)interfaceName
{
  return self->_interfaceName;
}

- (void)setInterfaceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDate)createdTimestamp
{
  return self->_createdTimestamp;
}

- (void)setCreatedTimestamp:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (void)setSamples:(id)a3
{
  objc_storeStrong((id *)&self->_samples, a3);
}

- (void)setCapabilities:(id)a3
{
  objc_storeStrong((id *)&self->_capabilities, a3);
}

- (void)setTriggerCriteriaFilterList:(id)a3
{
  objc_storeStrong((id *)&self->_triggerCriteriaFilterList, a3);
}

- (NSMutableSet)features
{
  return self->_features;
}

- (void)setFeatures:(id)a3
{
  objc_storeStrong((id *)&self->_features, a3);
}

- (NSMutableArray)preceedingTriggers
{
  return self->_preceedingTriggers;
}

- (NSString)fgApp
{
  return self->_fgApp;
}

- (void)setFgApp:(id)a3
{
  objc_storeStrong((id *)&self->_fgApp, a3);
}

- (NSString)lastSampleBssid
{
  return self->_lastSampleBssid;
}

- (void)setLastSampleBssid:(id)a3
{
  objc_storeStrong((id *)&self->_lastSampleBssid, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastSampleBssid, 0);
  objc_storeStrong((id *)&self->_fgApp, 0);
  objc_storeStrong((id *)&self->_preceedingTriggers, 0);
  objc_storeStrong((id *)&self->_features, 0);
  objc_storeStrong((id *)&self->_triggerCriteriaFilterList, 0);
  objc_storeStrong((id *)&self->_capabilities, 0);
  objc_storeStrong((id *)&self->_samples, 0);
  objc_storeStrong((id *)&self->_createdTimestamp, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_interfaceName, 0);
}

@end
