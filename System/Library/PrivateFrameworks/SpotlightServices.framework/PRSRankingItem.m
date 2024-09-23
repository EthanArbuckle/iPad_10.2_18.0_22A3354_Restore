@implementation PRSRankingItem

- (float)staleDemotionWithCurrentTime:(double)a3 topicality:(float)a4
{
  float v4;

  -[PRSRankingItem mostRecentTimeToQueryInMinutesWithCurrentTime:topicality:](self, "mostRecentTimeToQueryInMinutesWithCurrentTime:topicality:", a3);
  return timeDecay(&unk_1E6E9B680, v4);
}

- (float)mostRecentTimeToQueryInMinutesWithCurrentTime:(double)a3 topicality:(float)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  id v18;
  double v19;
  id v20;
  float v21;
  double v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  double v29;
  float v30;
  _BOOL4 v32;
  float *v33;
  float v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  double v42;
  float v43;
  float v44;
  void *v46;
  void *v47;
  double v48;
  void *v49;
  double v50;
  void *v51;
  double v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  double v57;
  uint64_t v58;
  void *v59;
  void *v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  float v65;
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  SSCompactRankingAttrsGetValue((int8x8_t *)-[PRSRankingItem attributes](self, "attributes"), 9uLL);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  SSCompactRankingAttrsGetValue((int8x8_t *)-[PRSRankingItem attributes](self, "attributes"), 0x20uLL);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  SSCompactRankingAttrsGetValue((int8x8_t *)-[PRSRankingItem attributes](self, "attributes"), 0x6CuLL);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  SSCompactRankingAttrsGetValue((int8x8_t *)-[PRSRankingItem attributes](self, "attributes"), 0x72uLL);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(v9, "valueForKeyPath:", CFSTR("@max.self"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  if (objc_msgSend(v10, "count"))
  {
    objc_msgSend(v10, "valueForKeyPath:", CFSTR("@max.self"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
  -[PRSRankingItem moreRecentDateFromDate1:date2:](self, "moreRecentDateFromDate1:date2:", v7, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[PRSRankingItem moreRecentDateFromDate1:date2:](self, "moreRecentDateFromDate1:date2:", v13, v12);
  v14 = objc_claimAutoreleasedReturnValue();

  if (v14)
    -[PRSRankingItem setLastUsedDate:](self, "setLastUsedDate:", v14);
  if ((-[PRSRankingItem bundleIDType](self, "bundleIDType") & 0x100) != 0)
  {
    SSCompactRankingAttrsGetValue((int8x8_t *)-[PRSRankingItem attributes](self, "attributes"), 0x11CuLL);
    v17 = objc_claimAutoreleasedReturnValue();
    if (v14 | v17)
    {
      -[PRSRankingItem moreRecentDateFromDate1:date2:](self, "moreRecentDateFromDate1:date2:", v14, v17);
      v18 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!v8 || (objc_msgSend(v8, "timeIntervalSinceReferenceDate"), (a3 - v19) / 60.0 >= 5.0))
      {
        v20 = 0;
        goto LABEL_33;
      }
      v18 = v8;
    }
    v20 = v18;
    goto LABEL_33;
  }
  if ((-[PRSRankingItem bundleIDType](self, "bundleIDType") & 4) != 0)
    goto LABEL_26;
  if ((-[PRSRankingItem bundleIDType](self, "bundleIDType") & 0x100000) != 0)
  {
    if (!v14)
    {
      SSCompactRankingAttrsGetValue((int8x8_t *)-[PRSRankingItem attributes](self, "attributes"), 0x11DuLL);
      v16 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_78;
    }
LABEL_43:
    v20 = (id)v14;
    goto LABEL_44;
  }
  if ((-[PRSRankingItem bundleIDType](self, "bundleIDType") & 0x80) != 0
    || (-[PRSRankingItem bundleIDType](self, "bundleIDType") & 0x10) != 0)
  {
LABEL_26:
    if (!v14)
      goto LABEL_34;
    goto LABEL_43;
  }
  if ((-[PRSRankingItem bundleIDType](self, "bundleIDType") & 2) != 0
    || (-[PRSRankingItem bundleIDType](self, "bundleIDType") & 0x800) != 0)
  {
    if (v14)
      v35 = (id)v14;
    SSCompactRankingAttrsGetValue((int8x8_t *)-[PRSRankingItem attributes](self, "attributes"), 0x19uLL);
    v17 = objc_claimAutoreleasedReturnValue();
    -[PRSRankingItem moreRecentDateFromDate1:date2:](self, "moreRecentDateFromDate1:date2:", v14, v8);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    -[PRSRankingItem moreRecentDateFromDate1:date2:](self, "moreRecentDateFromDate1:date2:", v36, v17);
    v20 = (id)objc_claimAutoreleasedReturnValue();

LABEL_33:
    if (!v20)
      goto LABEL_34;
    goto LABEL_44;
  }
  if ((-[PRSRankingItem bundleIDType](self, "bundleIDType") & 0x40) != 0)
  {
    SSCompactRankingAttrsGetValue((int8x8_t *)-[PRSRankingItem attributes](self, "attributes"), 0x1DuLL);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v49)
    {
      -[PRSRankingItem setStartDueDateToNowInSeconds:](self, "setStartDueDateToNowInSeconds:", 0x7FFFFFFFFFFFFFFFLL);
      goto LABEL_34;
    }
    v20 = v49;
    objc_msgSend(v49, "timeIntervalSinceReferenceDate");
    -[PRSRankingItem setStartDueDateToNowInSeconds:](self, "setStartDueDateToNowInSeconds:", (uint64_t)(v50 - a3));
    goto LABEL_44;
  }
  if ((-[PRSRankingItem bundleIDType](self, "bundleIDType") & 0x20) != 0)
  {
    SSCompactRankingAttrsGetValue((int8x8_t *)-[PRSRankingItem attributes](self, "attributes"), 0x12uLL);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    SSCompactRankingAttrsGetValue((int8x8_t *)-[PRSRankingItem attributes](self, "attributes"), 0x11uLL);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (uint64_t)v51;
    if (v51)
    {
      objc_msgSend(v51, "timeIntervalSinceReferenceDate");
      v53 = (uint64_t)(v52 - a3);
    }
    else
    {
      v53 = 0x7FFFFFFFFFFFFFFFLL;
    }
    -[PRSRankingItem setStartDueDateToNowInSeconds:](self, "setStartDueDateToNowInSeconds:", v53);
    goto LABEL_33;
  }
  if ((-[PRSRankingItem bundleIDType](self, "bundleIDType") & 0x20000000000000) == 0)
  {
    if ((-[PRSRankingItem bundleIDType](self, "bundleIDType") & 0x10000000000) != 0
      && (-[PRSRankingItem lastUsedDate](self, "lastUsedDate"),
          v15 = (void *)objc_claimAutoreleasedReturnValue(),
          v15,
          v15)
      || (-[PRSRankingItem bundleIDType](self, "bundleIDType") & 0x200000) != 0)
    {
      -[PRSRankingItem lastUsedDate](self, "lastUsedDate");
      v16 = (id)objc_claimAutoreleasedReturnValue();
    }
    else if ((-[PRSRankingItem bundleIDType](self, "bundleIDType") & 0x200) != 0)
    {
      v16 = v8;
    }
    else
    {
      -[PRSRankingItem interestingDate](self, "interestingDate");
      v16 = (id)objc_claimAutoreleasedReturnValue();
    }
LABEL_78:
    v20 = v16;
    if (!v16)
      goto LABEL_34;
LABEL_44:
    objc_msgSend(v20, "timeIntervalSinceReferenceDate");
    v21 = (a3 - v22) / 60.0;
    -[PRSRankingItem setMostRecentUseInMinutes:](self, "setMostRecentUseInMinutes:", v21);
    if ((-[PRSRankingItem bundleIDType](self, "bundleIDType") & 0x100) != 0)
    {
      if (v21 <= 259200.0)
      {
        if (v21 > 1440.0)
        {
          v65 = 0.0;
          SSCompactRankingAttrsGetFloat((uint64_t)-[PRSRankingItem attributes](self, "attributes"), 0x113uLL, &v65);
          if (v65 < 5.0)
            v21 = 216000.0;
        }
      }
      else
      {
        v21 = 257760.0;
      }
      goto LABEL_103;
    }
    if ((-[PRSRankingItem bundleIDType](self, "bundleIDType") & 4) != 0)
    {
      if (v21 > 777600.0)
        v21 = 777600.0;
      if (v21 < 0.0)
      {
        SSCompactRankingAttrsGetValue((int8x8_t *)-[PRSRankingItem attributes](self, "attributes"), 0x3CuLL);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v23, "count"))
        {
          v59 = v11;
          v60 = v8;
          v63 = 0u;
          v64 = 0u;
          v61 = 0u;
          v62 = 0u;
          v24 = v23;
          v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
          if (v25)
          {
            v26 = v25;
            v27 = *(_QWORD *)v62;
            v21 = 43200.0;
            do
            {
              for (i = 0; i != v26; ++i)
              {
                if (*(_QWORD *)v62 != v27)
                  objc_enumerationMutation(v24);
                objc_msgSend(*(id *)(*((_QWORD *)&v61 + 1) + 8 * i), "timeIntervalSinceReferenceDate");
                v30 = (a3 - v29) / 60.0;
                if (v21 > v30 && v30 > 0.0)
                  v21 = v30;
              }
              v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
            }
            while (v26);
          }
          else
          {
            v21 = 43200.0;
          }

          v11 = v59;
          v8 = v60;
        }

      }
      goto LABEL_103;
    }
    if ((-[PRSRankingItem bundleIDType](self, "bundleIDType") & 0x80) == 0)
    {
      if ((-[PRSRankingItem bundleIDType](self, "bundleIDType") & 0x20) == 0)
      {
        if ((-[PRSRankingItem bundleIDType](self, "bundleIDType") & 0x40) != 0)
        {
          SSCompactRankingAttrsGetValue((int8x8_t *)-[PRSRankingItem attributes](self, "attributes"), 0x1CuLL);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          SSCompactRankingAttrsGetValue((int8x8_t *)-[PRSRankingItem attributes](self, "attributes"), 0x1DuLL);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = v38;
          if (v37)
          {
            objc_msgSend(v37, "timeIntervalSinceReferenceDate");
            if ((a3 - v40) / 60.0 > 1440.0)
              v21 = v21 + 129600.0;
          }
          else if (v38)
          {
            objc_msgSend(v38, "timeIntervalSinceReferenceDate");
            v43 = (v42 - a3) / 60.0;
            v44 = v21 >= v43 ? v43 : v21;
            if (v43 < 1440.0 && v43 > 0.0)
              v21 = v44;
          }

          goto LABEL_103;
        }
        if ((-[PRSRankingItem bundleIDType](self, "bundleIDType") & 0x100000) == 0)
        {
          if ((-[PRSRankingItem bundleIDType](self, "bundleIDType") & 0x460000000200) != 0)
          {
            v21 = fminf(v21, 259200.0);
          }
          else if ((-[PRSRankingItem bundleIDType](self, "bundleIDType") & 0x1080000000000) != 0)
          {
            v21 = 259200.0;
          }
          goto LABEL_103;
        }
        v65 = 0.0;
        SSCompactRankingAttrsGetFloat((uint64_t)-[PRSRankingItem attributes](self, "attributes"), 0x121uLL, &v65);
        v21 = dbl_1B87DF620[v65 > 0.0] + v21;
        if (v21 >= 1576800.0)
          goto LABEL_103;
        if (v21 <= 777600.0)
        {
          if (v21 <= 525600.0)
          {
            if (v21 <= 129600.0)
            {
              v34 = 43200.0;
              if (v21 <= 43200.0)
                goto LABEL_103;
            }
            else
            {
              v34 = 172800.0;
            }
          }
          else
          {
            v34 = 345600.0;
          }
          goto LABEL_102;
        }
        goto LABEL_92;
      }
      if (v21 > 10080.0)
      {
        v34 = 777600.0;
LABEL_102:
        v21 = v21 + v34;
        goto LABEL_103;
      }
      if (v21 > 1440.0)
      {
LABEL_92:
        v34 = 518400.0;
        goto LABEL_102;
      }
      if (v21 <= 0.0)
      {
        if (v21 < 0.0)
          v21 = -v21;
        goto LABEL_103;
      }
    }
    v34 = 43200.0;
    goto LABEL_102;
  }
  SSCompactRankingAttrsGetValue((int8x8_t *)-[PRSRankingItem attributes](self, "attributes"), 0x11uLL);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = v55;
  if (v55)
  {
    objc_msgSend(v55, "timeIntervalSinceReferenceDate");
    v58 = (uint64_t)(v57 - a3);
  }
  else
  {
    v58 = 0x7FFFFFFFFFFFFFFFLL;
  }
  -[PRSRankingItem setStartDueDateToNowInSeconds:](self, "setStartDueDateToNowInSeconds:", v58);

LABEL_34:
  if ((-[PRSRankingItem bundleIDType](self, "bundleIDType") & 0x100) != 0)
  {
    v20 = 0;
    v21 = 129600.0;
    goto LABEL_103;
  }
  if ((-[PRSRankingItem bundleIDType](self, "bundleIDType") & 4) != 0)
  {
    v20 = 0;
    if (a4 > 0.96)
    {
      v21 = 259200.0;
      goto LABEL_103;
    }
    v32 = a4 < 0.9;
    v33 = (float *)&unk_1B87DF4E8;
LABEL_82:
    v21 = v33[v32];
    goto LABEL_103;
  }
  if ((-[PRSRankingItem bundleIDType](self, "bundleIDType") & 0x10) != 0)
  {
    v20 = 0;
    v32 = a4 > 0.6;
    v33 = (float *)&unk_1B87DF4F0;
    goto LABEL_82;
  }
  v21 = 259200.0;
  if ((-[PRSRankingItem bundleIDType](self, "bundleIDType") & 0x80) == 0
    && (-[PRSRankingItem bundleIDType](self, "bundleIDType") & 0x200) == 0
    && (-[PRSRankingItem bundleIDType](self, "bundleIDType") & 0x816F0000000001) == 0)
  {
    if ((-[PRSRankingItem bundleIDType](self, "bundleIDType") & 0x100000000000) != 0)
    {
      v20 = 0;
      v21 = 302400.0;
      goto LABEL_103;
    }
    if ((-[PRSRankingItem bundleIDType](self, "bundleIDType") & 0x200000) != 0)
    {
      SSCompactRankingAttrsGetValue((int8x8_t *)-[PRSRankingItem attributes](self, "attributes"), 0x48uLL);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = v54;
      if (a4 > 0.6
        && objc_msgSend(v54, "length", a4)
        && (objc_msgSend(v47, "isEqualToString:", CFSTR("com.apple.Preferences")) & 1) != 0)
      {
        v21 = 43200.0;
      }
      else
      {
        v21 = 129600.0;
      }
    }
    else
    {
      if ((-[PRSRankingItem bundleIDType](self, "bundleIDType") & 0x40) != 0)
      {
        v20 = 0;
        v21 = 518400.0;
        goto LABEL_103;
      }
      if ((-[PRSRankingItem bundleIDType](self, "bundleIDType") & 0x1800000) == 0)
      {
        v20 = 0;
        v21 = 777600.0;
        goto LABEL_103;
      }
      SSCompactRankingAttrsGetValue((int8x8_t *)-[PRSRankingItem attributes](self, "attributes"), 0x24uLL);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = v46;
      if (v46)
      {
        objc_msgSend(v46, "timeIntervalSinceReferenceDate");
        v21 = (v48 - a3) / 60.0 + 259200.0;
      }
      else
      {
        v21 = 777600.0;
      }
    }

  }
  v20 = 0;
LABEL_103:

  return v21;
}

- (float)inSpotlightEngagementScoreWithEvaluator:(id)a3 currentTime:(double)a4 queriesInSpotlight:(id)a5 datesInSpotlight:(id)a6 queriesInSpotlightNonUnique:(id)a7 datesInSpotlightNonUnique:(id)a8 launchString:(id)a9 lastUsedDate:(id)a10 topicalityScore:(float)a11
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  float v29;
  void *v30;
  float v31;
  float v32;
  double v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  float v39;
  float v40;
  void *v41;
  double v42;
  float v43;
  void *v44;
  uint64_t v45;
  unint64_t v46;
  void *v47;
  char isKindOfClass;
  void *v49;
  double v50;
  double v51;
  void *v52;
  float v53;
  float v54;
  double v55;
  id v56;
  void *v57;
  uint64_t v58;
  unint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  float v64;
  float v65;
  void *v66;
  void *v67;
  void *v68;
  float v69;
  double v70;
  float v71;
  id v73;
  id v74;
  id v75;
  void *v76;
  void *v78;

  v18 = a3;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v22 = a8;
  v75 = a9;
  v23 = a10;
  v78 = v20;
  v24 = objc_msgSend(v20, "count");
  v25 = objc_msgSend(v19, "count");
  v26 = objc_msgSend(v22, "count");
  v76 = v21;
  v27 = objc_msgSend(v21, "count");
  if (v24 && v25 && v24 == v25 && v26 == v27)
  {
    v73 = v23;
    v28 = 0;
    v29 = 0.0;
    while (1)
    {
      objc_msgSend(v19, "objectAtIndexedSubscript:", v28, v73);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      +[PRSRankingItem matchScoreLaunchString:withEvaluator:](PRSRankingItem, "matchScoreLaunchString:withEvaluator:", v30, v18);
      v32 = v31;

      if (v32 == 1.0)
        -[PRSRankingItem setExactMatchedLaunchString:](self, "setExactMatchedLaunchString:", 1);
      v33 = v32;
      if (v32 < 0.01)
      {
        v34 = objc_alloc(MEMORY[0x1E0CA6AB8]);
        objc_msgSend(v19, "objectAtIndexedSubscript:", v28);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "language");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = (void *)objc_msgSend(v34, "initWithQuery:language:fuzzyThreshold:options:", v35, v36, 0, 0);

        objc_msgSend(v18, "queryString");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        +[PRSRankingItem matchScoreLaunchString:withEvaluator:](PRSRankingItem, "matchScoreLaunchString:withEvaluator:", v38, v37);
        v40 = v39;

        if (v40 > 0.9)
          v32 = v40;

      }
      if (v32 == 0.0)
        goto LABEL_17;
      objc_msgSend(v20, "objectAtIndexedSubscript:", v28, v33);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "timeIntervalSinceReferenceDate");
      v43 = (a4 - v42) / 60.0;

      if (v43 > 0.0)
        break;
LABEL_19:
      if (v24 == ++v28)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        if (v26)
        {
          v45 = 0;
          v46 = 0x1E0C99000uLL;
          v74 = v22;
          do
          {
            objc_msgSend(v22, "objectAtIndexedSubscript:", v45);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            isKindOfClass = objc_opt_isKindOfClass();

            if ((isKindOfClass & 1) != 0)
            {
              objc_msgSend(v22, "objectAtIndexedSubscript:", v45);
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v49, "timeIntervalSinceReferenceDate");
              v51 = (a4 - v50) / 60.0;

              if (v51 < 10080.0)
              {
                objc_msgSend(v76, "objectAtIndexedSubscript:", v45);
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                +[PRSRankingItem matchScoreLaunchString:withEvaluator:](PRSRankingItem, "matchScoreLaunchString:withEvaluator:", v52, v18);
                v54 = v53;

                v55 = v54;
                if (v54 < 0.01)
                {
                  v56 = objc_alloc(MEMORY[0x1E0CA6AB8]);
                  objc_msgSend(v76, "objectAtIndexedSubscript:", v45);
                  v57 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v18, "language");
                  v58 = v26;
                  v59 = v46;
                  v60 = v44;
                  v61 = (void *)objc_claimAutoreleasedReturnValue();
                  v62 = (void *)objc_msgSend(v56, "initWithQuery:language:fuzzyThreshold:options:", v57, v61, 0, 0);

                  objc_msgSend(v18, "queryString");
                  v63 = (void *)objc_claimAutoreleasedReturnValue();
                  +[PRSRankingItem matchScoreLaunchString:withEvaluator:](PRSRankingItem, "matchScoreLaunchString:withEvaluator:", v63, v62);
                  v65 = v64;

                  v44 = v60;
                  v46 = v59;
                  v26 = v58;
                  v22 = v74;

                  v55 = v65;
                }
                if (v55 > 0.9)
                {
                  objc_msgSend(v22, "objectAtIndexedSubscript:", v45);
                  v66 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v44, "addObject:", v66);

                }
              }
            }
            ++v45;
          }
          while (v26 != v45);
        }
        if ((unint64_t)objc_msgSend(v44, "count") > 1)
        {
          objc_msgSend(v44, "sortWithOptions:usingComparator:", 1, &__block_literal_global_74);
          if ((unint64_t)objc_msgSend(v44, "count") >= 3)
            objc_msgSend(v44, "removeObjectsInRange:", 2, objc_msgSend(v44, "count") - 2);
        }
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v44);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        -[PRSRankingItem setRecentSimilarIntentEngagementDates:](self, "setRecentSimilarIntentEngagementDates:", v67);

        v68 = v75;
        v23 = v73;
        goto LABEL_42;
      }
    }
    if (v32 <= a11)
      v32 = a11;
    v32 = v32 * timeDecay(&unk_1E6E9B698, v43);
LABEL_17:
    if (v32 >= v29)
      v29 = v32;
    goto LABEL_19;
  }
  v68 = v75;
  if (objc_msgSend(v75, "length"))
  {
    +[PRSRankingItem matchScoreLaunchString:withEvaluator:](PRSRankingItem, "matchScoreLaunchString:withEvaluator:", v75, v18);
    v29 = v69;
    if (v69 == 1.0)
      -[PRSRankingItem setExactMatchedLaunchString:](self, "setExactMatchedLaunchString:", 1);
    if (v29 <= a11)
      v29 = a11;
    if (v23)
    {
      objc_msgSend(v23, "timeIntervalSinceReferenceDate");
      v71 = (a4 - v70) / 60.0;
      if (v71 > 0.0)
        v29 = v29 * timeDecay(&unk_1E6E9B698, v71);
    }
  }
  else
  {
    v29 = 0.0;
  }
LABEL_42:

  return v29;
}

uint64_t __211__PRSRankingItem_Scoring__inSpotlightEngagementScoreWithEvaluator_currentTime_queriesInSpotlight_datesInSpotlight_queriesInSpotlightNonUnique_datesInSpotlightNonUnique_launchString_lastUsedDate_topicalityScore___block_invoke(uint64_t a1, void *a2)
{
  return -objc_msgSend(a2, "compare:");
}

+ (float)inAppEngagementScoreWithEvaluator:(id)a3 currentTime:(double)a4 queriesInApp:(id)a5 datesInApp:(id)a6 topicalityScore:(float)a7
{
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  float v16;
  uint64_t v17;
  void *v18;
  float v19;
  float v20;
  void *v21;
  double v22;
  float v23;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v14 = objc_msgSend(v13, "count");
  v15 = objc_msgSend(v12, "count");
  v16 = 0.0;
  if (v14 && v15 && v14 == v15)
  {
    v17 = 0;
    while (1)
    {
      objc_msgSend(v12, "objectAtIndexedSubscript:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[PRSRankingItem matchScoreLaunchString:withEvaluator:](PRSRankingItem, "matchScoreLaunchString:withEvaluator:", v18, v11);
      v20 = v19;

      if (v20 <= 0.0)
        goto LABEL_10;
      objc_msgSend(v13, "objectAtIndexedSubscript:", v17);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "timeIntervalSinceReferenceDate");
      v23 = (a4 - v22) / 60.0;

      if (v23 > 0.0)
        break;
LABEL_12:
      if (v14 == ++v17)
        goto LABEL_13;
    }
    if (v20 <= a7)
      v20 = a7;
    v20 = v20 * timeDecay(&unk_1E6E9B698, v23);
LABEL_10:
    if (v20 >= v16)
      v16 = v20;
    goto LABEL_12;
  }
LABEL_13:

  return v16;
}

+ (float)outOfSpotlightEngagementScore:(double)a3 datesOutOfSpotlight:(id)a4 topicalityScore:(float)a5 alternativeOutOfSpotlightCount:(float)a6
{
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  float v13;
  float v14;
  void *v15;
  double v16;
  float v17;
  float v18;
  float v19;

  v9 = a4;
  v10 = objc_msgSend(v9, "count");
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    if (a5 >= 1.0)
      v13 = a5;
    else
      v13 = 1.0;
    v14 = 0.0;
    do
    {
      objc_msgSend(v9, "objectAtIndexedSubscript:", v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "timeIntervalSinceReferenceDate");
      v17 = (a3 - v16) / 60.0;

      if (v17 > 0.0)
      {
        v18 = v13 * timeDecay(&unk_1E6E9B698, v17);
        if (v18 >= v14)
          v14 = v18;
      }
      ++v12;
    }
    while (v11 != v12);
  }
  else
  {
    v19 = 1.0;
    if (a6 < 5.0)
      v19 = 0.5;
    if (a6 == 0.0)
      v14 = 0.0;
    else
      v14 = v19;
  }

  return v14;
}

- (float)engagementScoreWithEvaluator:(id)a3 currentTime:(double)a4 launchString:(id)a5 topicalityScore:(float)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  float v19;
  float v20;
  double v21;
  float v22;
  float v23;
  unint64_t v24;
  double v25;
  double v26;
  float v27;
  float v28;
  double v29;
  float v30;
  uint64_t v32;
  void *v33;
  void *v34;
  int v35;

  v10 = a5;
  v11 = a3;
  SSCompactRankingAttrsGetValue((int8x8_t *)-[PRSRankingItem attributes](self, "attributes"), 0x6CuLL);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  SSCompactRankingAttrsGetValue((int8x8_t *)-[PRSRankingItem attributes](self, "attributes"), 0x6DuLL);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  SSCompactRankingAttrsGetValue((int8x8_t *)-[PRSRankingItem attributes](self, "attributes"), 0x6FuLL);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  SSCompactRankingAttrsGetValue((int8x8_t *)-[PRSRankingItem attributes](self, "attributes"), 0x70uLL);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  SSCompactRankingAttrsGetValue((int8x8_t *)-[PRSRankingItem attributes](self, "attributes"), 0x72uLL);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  SSCompactRankingAttrsGetValue((int8x8_t *)-[PRSRankingItem attributes](self, "attributes"), 0x73uLL);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  SSCompactRankingAttrsGetValue((int8x8_t *)-[PRSRankingItem attributes](self, "attributes"), 0x74uLL);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  SSCompactRankingAttrsGetValue((int8x8_t *)-[PRSRankingItem attributes](self, "attributes"), 9uLL);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "length")
    || objc_msgSend(v12, "count")
    && objc_msgSend(v13, "count")
    && (v32 = objc_msgSend(v12, "count"), v32 == objc_msgSend(v13, "count")))
  {
    -[PRSRankingItem setWasEngaged:](self, "setWasEngaged:", 1);
    -[PRSRankingItem setWasEngagedInSpotlight:](self, "setWasEngagedInSpotlight:", 1);
  }
  *(float *)&v18 = a6;
  -[PRSRankingItem inSpotlightEngagementScoreWithEvaluator:currentTime:queriesInSpotlight:datesInSpotlight:queriesInSpotlightNonUnique:datesInSpotlightNonUnique:launchString:lastUsedDate:topicalityScore:](self, "inSpotlightEngagementScoreWithEvaluator:currentTime:queriesInSpotlight:datesInSpotlight:queriesInSpotlightNonUnique:datesInSpotlightNonUnique:launchString:lastUsedDate:topicalityScore:", v11, v13, v12, v33, v34, v10, a4, v18, v17);
  v20 = v19;
  *(float *)&v21 = a6;
  +[PRSRankingItem inAppEngagementScoreWithEvaluator:currentTime:queriesInApp:datesInApp:topicalityScore:](PRSRankingItem, "inAppEngagementScoreWithEvaluator:currentTime:queriesInApp:datesInApp:topicalityScore:", v11, v15, v14, a4, v21);
  v23 = v22;

  if (SSEnableSpotlightPersonalizedRanking2024())
  {
    v35 = 0;
    v24 = -[PRSRankingItem bundleIDType](self, "bundleIDType");
    LODWORD(v26) = 0;
    if ((v24 & 0x200000) != 0)
    {
      SSCompactRankingAttrsGetFloat((uint64_t)-[PRSRankingItem attributes](self, "attributes"), 0x75uLL, &v35);
      LODWORD(v26) = v35;
    }
    *(float *)&v25 = a6;
    +[PRSRankingItem outOfSpotlightEngagementScore:datesOutOfSpotlight:topicalityScore:alternativeOutOfSpotlightCount:](PRSRankingItem, "outOfSpotlightEngagementScore:datesOutOfSpotlight:topicalityScore:alternativeOutOfSpotlightCount:", v16, a4, v25, v26);
    v28 = 1.0;
    if (v20 > 0.0)
      v28 = 0.5;
    v29 = v20 + v23 * 0.2 + (float)(v28 * v27);
  }
  else
  {
    v29 = v20 + v23 * 0.2;
  }
  v30 = fmin(v29, 1.0);

  return v30;
}

- (int64_t)itemSparseMatchStrengthTypeWithEvaluator:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int64_t v19;
  void *v20;
  uint64_t v21;
  PRSRankingItem *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  id obj;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v24 = a3;
  objc_msgSend(v24, "language");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = self;
  -[PRSRankingItem getMatchInfoDictionaryWithKeyboardLanguage:](self, "getMatchInfoDictionaryWithKeyboardLanguage:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v5;
  v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v26)
  {
    v25 = *(_QWORD *)v34;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v34 != v25)
          objc_enumerationMutation(obj);
        v28 = v7;
        v8 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v7);
        objc_msgSend(obj, "objectForKeyedSubscript:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v30;
          do
          {
            for (i = 0; i != v11; ++i)
            {
              if (*(_QWORD *)v30 != v12)
                objc_enumerationMutation(v9);
              v14 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
              objc_msgSend(v14, "original");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "objectForKey:", v15);
              v16 = (void *)objc_claimAutoreleasedReturnValue();

              if (v16)
              {
                objc_msgSend(v16, "addObject:", v8);
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", v8);
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v14, "original");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v6, "setObject:forKey:", v16, v17);

              }
            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
          }
          while (v11);
        }

        v7 = v28 + 1;
      }
      while (v28 + 1 != v26);
      v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v26);
  }

  if ((-[PRSRankingItem bundleIDType](v23, "bundleIDType") & 0x80) != 0)
  {
    v20 = (void *)objc_msgSend(v6, "copy");
    v18 = v24;
    v21 = -[PRSRankingItem itemSparseMatchStrengthTypeForSafariWithEvaluator:attributeMatchesForToken:](v23, "itemSparseMatchStrengthTypeForSafariWithEvaluator:attributeMatchesForToken:", v24, v20);
LABEL_33:
    v19 = v21;

    goto LABEL_34;
  }
  v18 = v24;
  if ((-[PRSRankingItem bundleIDType](v23, "bundleIDType") & 2) != 0)
  {
    v20 = (void *)objc_msgSend(v6, "copy");
    v21 = -[PRSRankingItem itemSparseMatchStrengthTypeForNotesWithEvaluator:attributeMatchesForToken:](v23, "itemSparseMatchStrengthTypeForNotesWithEvaluator:attributeMatchesForToken:", v24, v20);
    goto LABEL_33;
  }
  if ((-[PRSRankingItem bundleIDType](v23, "bundleIDType") & 0x800) != 0)
  {
    v20 = (void *)objc_msgSend(v6, "copy");
    v21 = -[PRSRankingItem itemSparseMatchStrengthTypeForFilesWithEvaluator:attributeMatchesForToken:](v23, "itemSparseMatchStrengthTypeForFilesWithEvaluator:attributeMatchesForToken:", v24, v20);
    goto LABEL_33;
  }
  if ((-[PRSRankingItem bundleIDType](v23, "bundleIDType") & 0x20) != 0)
  {
    v20 = (void *)objc_msgSend(v6, "copy");
    v21 = -[PRSRankingItem itemSparseMatchStrengthTypeForCalendarWithEvaluator:attributeMatchesForToken:](v23, "itemSparseMatchStrengthTypeForCalendarWithEvaluator:attributeMatchesForToken:", v24, v20);
    goto LABEL_33;
  }
  if ((-[PRSRankingItem bundleIDType](v23, "bundleIDType") & 0x40) != 0)
  {
    v20 = (void *)objc_msgSend(v6, "copy");
    v21 = -[PRSRankingItem itemSparseMatchStrengthTypeForRemindersWithEvaluator:attributeMatchesForToken:](v23, "itemSparseMatchStrengthTypeForRemindersWithEvaluator:attributeMatchesForToken:", v24, v20);
    goto LABEL_33;
  }
  if ((-[PRSRankingItem bundleIDType](v23, "bundleIDType") & 0x100000) != 0)
  {
    v20 = (void *)objc_msgSend(v6, "copy");
    v21 = -[PRSRankingItem itemSparseMatchStrengthTypeForMailWithEvaluator:attributeMatchesForToken:](v23, "itemSparseMatchStrengthTypeForMailWithEvaluator:attributeMatchesForToken:", v24, v20);
    goto LABEL_33;
  }
  if ((-[PRSRankingItem bundleIDType](v23, "bundleIDType") & 8) != 0)
  {
    v20 = (void *)objc_msgSend(v6, "copy");
    v21 = -[PRSRankingItem itemSparseMatchStrengthTypeForMessagesWithEvaluator:attributeMatchesForToken:](v23, "itemSparseMatchStrengthTypeForMessagesWithEvaluator:attributeMatchesForToken:", v24, v20);
    goto LABEL_33;
  }
  v19 = 3;
LABEL_34:

  return v19;
}

- (int64_t)itemSparseMatchStrengthTypeForSafariWithEvaluator:(id)a3 attributeMatchesForToken:(id)a4
{
  return 3;
}

- (int64_t)itemSparseMatchStrengthTypeForMailWithEvaluator:(id)a3 attributeMatchesForToken:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  void *v36;
  uint64_t v37;
  void *v38;
  unint64_t v39;
  void *v40;
  int v41;
  BOOL v42;
  void *v43;
  int v44;
  int v45;
  int v46;
  int v47;
  int v48;
  int v49;
  int v50;
  BOOL v51;
  unsigned int v52;
  unsigned int v53;
  int v54;
  unsigned int v55;
  int v56;
  unsigned int v57;
  unsigned int v58;
  unsigned int v59;
  unsigned int v60;
  unsigned int v61;
  int v62;
  int v63;
  int v64;
  int v65;
  int v66;
  int v67;
  unsigned int v68;
  unsigned int v69;
  unsigned int v70;
  int v71;
  int v72;
  int v73;
  int64_t v74;
  unsigned int v75;
  BOOL v76;
  int v77;
  int v79;
  BOOL v80;
  BOOL v81;
  BOOL v82;
  BOOL v83;
  unsigned int v84;
  id v85;
  id v86;
  uint64_t v87;
  int v88;
  uint64_t v89;
  int v90;
  uint64_t v91;
  uint64_t v92;
  unint64_t v93;
  unint64_t v94;
  unint64_t v95;
  id obj;
  id obja;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  __int128 v103;
  uint64_t v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  _BYTE v113[128];
  _BYTE v114[128];
  uint64_t v115;

  v115 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v109 = 0u;
  v110 = 0u;
  v111 = 0u;
  v112 = 0u;
  v86 = v5;
  objc_msgSend(v5, "itemQPQUOutputTokenInfo");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v109, v114, 16);
  if (v7)
  {
    v8 = v7;
    v103 = 0uLL;
    v101 = 0;
    v102 = 0;
    v99 = 0;
    v100 = 0;
    v98 = 0;
    v104 = 0;
    v9 = *(_QWORD *)v110;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v110 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * i);
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("kQPQUOutputToken"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("kQPQUOutputTokenArgScores"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("kQPQUOutputTokenArgLabels"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKey:", v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        HIDWORD(v104) += objc_msgSend(v14, "isEqualToString:", CFSTR("ARG_MEDIA_TYPE"));
        if (v15)
        {
          v16 = objc_msgSend(v14, "isEqualToString:", CFSTR("ARG_UNSPECIFIED")) ^ 1;
          v17 = objc_msgSend(v15, "containsObject:", CFSTR("kMDItemSubject"));
          HIDWORD(v100) += v17;
          if (v17)
            v18 = v16;
          else
            v18 = 0;
          LODWORD(v104) = v18 + v104;
          v19 = objc_msgSend(v15, "containsObject:", CFSTR("kMDItemTextContent"));
          if (v19)
            v20 = v16;
          else
            v20 = 0;
          HIDWORD(v103) += v20;
          HIDWORD(v99) += v19;
          v21 = objc_msgSend(v15, "containsObject:", CFSTR("kMDItemAuthors"));
          if (v21)
            v22 = v16;
          else
            v22 = 0;
          DWORD2(v103) += v22;
          LODWORD(v100) = v100 + v21;
          if (objc_msgSend(v15, "containsObject:", CFSTR("kMDItemAuthorEmailAddresses")))
            v23 = v16;
          else
            v23 = 0;
          DWORD1(v103) += v23;
          v24 = objc_msgSend(v15, "containsObject:", CFSTR("kMDItemRecipients"));
          if (v24)
            v25 = v16;
          else
            v25 = 0;
          HIDWORD(v101) += v25;
          HIDWORD(v98) += v24;
          if (objc_msgSend(v15, "containsObject:", CFSTR("kMDItemRecipientEmailAddresses")))
            v26 = v16;
          else
            v26 = 0;
          HIDWORD(v102) += v26;
          if (objc_msgSend(v15, "containsObject:", CFSTR("kMDItemEmailAddresses")))
            v27 = v16;
          else
            v27 = 0;
          LODWORD(v102) = v27 + v102;
          v28 = objc_msgSend(v15, "containsObject:", CFSTR("kMDItemAttachmentNames"));
          if (v28)
            v29 = v16;
          else
            v29 = 0;
          LODWORD(v101) = v29 + v101;
          LODWORD(v98) = v98 + v28;
          v30 = objc_msgSend(v15, "containsObject:", CFSTR("kMDItemAttachmentTypes"));
          if (v30)
            v31 = v16;
          else
            v31 = 0;
          LODWORD(v103) = v31 + v103;
          LODWORD(v99) = v99 + v30;
        }

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v109, v114, 16);
    }
    while (v8);
  }
  else
  {
    v103 = 0uLL;
    v101 = 0;
    v102 = 0;
    v99 = 0;
    v100 = 0;
    v98 = 0;
    v104 = 0;
  }

  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("\\S+"), 1, 0);
  obja = (id)objc_claimAutoreleasedReturnValue();
  v105 = 0u;
  v106 = 0u;
  v107 = 0u;
  v108 = 0u;
  v32 = v6;
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v105, v113, 16);
  if (v33)
  {
    v34 = v33;
    v94 = 0;
    v95 = 0;
    v92 = 0;
    v93 = 0;
    v91 = 0;
    v35 = 0;
    v90 = 0;
    v89 = *(_QWORD *)v106;
    v36 = v86;
    v85 = v32;
    do
    {
      v37 = 0;
      v87 = v34;
      do
      {
        if (*(_QWORD *)v106 != v89)
          objc_enumerationMutation(v32);
        v38 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * v37);
        v39 = objc_msgSend(obja, "numberOfMatchesInString:options:range:", v38, 0, 0, objc_msgSend(v38, "length", v85));
        objc_msgSend(v36, "queryString");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend(v40, "localizedCaseInsensitiveContainsString:", v38);

        if (v41)
          v42 = v39 >= 2;
        else
          v42 = 0;
        if (v42)
        {
          objc_msgSend(v32, "objectForKey:", v38);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = objc_msgSend(v43, "containsObject:", CFSTR("kMDItemSubject"));
          v45 = objc_msgSend(v43, "containsObject:", CFSTR("kMDItemTextContent"));
          v46 = objc_msgSend(v43, "containsObject:", CFSTR("kMDItemAuthors"));
          v47 = objc_msgSend(v43, "containsObject:", CFSTR("kMDItemRecipients"));
          v48 = v35;
          v49 = objc_msgSend(v43, "containsObject:", CFSTR("kMDItemAttachmentNames"));
          v50 = objc_msgSend(v43, "containsObject:", CFSTR("kMDItemAttachmentTypes"));
          v51 = v39 == 2;
          v53 = v95;
          v52 = HIDWORD(v95);
          v54 = v44;
          v55 = HIDWORD(v95) + v44;
          v56 = HIDWORD(v92);
          v57 = v93;
          v58 = v93 + v45;
          v60 = v94;
          v59 = HIDWORD(v94);
          v61 = v94 + v46;
          v63 = HIDWORD(v91);
          v62 = v92;
          v64 = HIDWORD(v91) + v47;
          v66 = v90;
          v65 = v91;
          v67 = v90 + v49;
          v88 = HIDWORD(v92) + v50;
          v68 = HIDWORD(v94) + v45;
          v69 = HIDWORD(v93);
          v70 = HIDWORD(v93) + v46;
          v71 = v92 + v47;
          v32 = v85;
          v36 = v86;
          v72 = v48 + v49;
          v35 = v48;
          v34 = v87;
          v73 = v91 + v50;
          if (v51)
            v53 = v95 + v54;
          if (!v51)
            v52 = v55;
          v95 = __PAIR64__(v52, v53);
          if (v51)
            v59 = v68;
          if (v51)
            v69 = v70;
          else
            v57 = v58;
          v93 = __PAIR64__(v69, v57);
          if (!v51)
            v60 = v61;
          v94 = __PAIR64__(v59, v60);
          if (v51)
            v62 = v71;
          if (!v51)
            v63 = v64;
          HIDWORD(v91) = v63;
          LODWORD(v92) = v62;
          if (v51)
            v35 = v72;
          if (v51)
            v65 = v73;
          else
            v66 = v67;
          v90 = v66;
          LODWORD(v91) = v65;
          if (!v51)
            v56 = v88;
          HIDWORD(v92) = v56;

        }
        ++v37;
      }
      while (v34 != v37);
      v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v105, v113, 16);
    }
    while (v34);
  }
  else
  {
    v94 = 0;
    v95 = 0;
    v92 = 0;
    v93 = 0;
    v91 = 0;
    v35 = 0;
    v90 = 0;
    v36 = v86;
  }

  if (objc_msgSend(v36, "countQPUSpecialToken") != 1 || (v74 = 0, !(_DWORD)v104) && !*(_QWORD *)((char *)&v103 + 4))
  {
    v75 = v101
        + HIDWORD(v101)
        + DWORD2(v103)
        + DWORD1(v103)
        + HIDWORD(v102)
        + v102
        + v103
        + HIDWORD(v103)
        + v104
        + HIDWORD(v104);
    if (objc_msgSend(v36, "countQPUSpecialToken"))
    {
      v74 = 0;
      if (DWORD2(v103))
        goto LABEL_105;
      if (v104 > 1)
        goto LABEL_105;
      if (HIDWORD(v103) > 2)
        goto LABEL_105;
      v74 = 0;
      if (HIDWORD(v104) + (int)v104 + HIDWORD(v103) >= v75
        || HIDWORD(v104) + (int)v104 >= v75
        || HIDWORD(v104) + HIDWORD(v103) >= v75
        || HIDWORD(v95))
      {
        goto LABEL_105;
      }
    }
    else if (HIDWORD(v95))
    {
      goto LABEL_104;
    }
    v74 = 0;
    if ((_DWORD)v95 || (_DWORD)v94 || v93 || HIDWORD(v94) > 1)
      goto LABEL_105;
    if (HIDWORD(v100) && (_DWORD)v100)
      goto LABEL_104;
    v76 = v100 != 0;
    if (v100)
    {
      if (HIDWORD(v94))
        goto LABEL_104;
    }
    v77 = HIDWORD(v91) + v92 + v35 + v90 + v91;
    if (!(v77 + HIDWORD(v92)))
      v76 = 0;
    if (v76)
    {
LABEL_104:
      v74 = 0;
      goto LABEL_105;
    }
    v74 = 1;
    if (HIDWORD(v103) <= 1 && HIDWORD(v94) != 1)
    {
      if (HIDWORD(v100) && HIDWORD(v99))
      {
        v74 = 1;
      }
      else
      {
        v79 = v98 + HIDWORD(v98);
        if (HIDWORD(v99))
          v80 = (_DWORD)v100 != 0;
        else
          v80 = 0;
        if (v79 + (_DWORD)v99)
          v81 = HIDWORD(v100) != 0;
        else
          v81 = 0;
        if (v79 + (_DWORD)v99)
          v82 = (_DWORD)v100 != 0;
        else
          v82 = 0;
        if (v79 + (_DWORD)v99)
          v83 = HIDWORD(v99) > 1;
        else
          v83 = 0;
        v74 = 1;
        if (!v81 && !v80 && !v82 && v77 == -HIDWORD(v92) && !v83)
        {
          if ((_DWORD)v104
            || (v84 = v101 + HIDWORD(v101) + v103, HIDWORD(v103) == 1) && v84
            || v84 && v84 >= v75
            || HIDWORD(v99)
            || v79 != -(int)v99)
          {
            v74 = 2;
          }
          else
          {
            v74 = 3;
          }
        }
      }
    }
  }
LABEL_105:

  return v74;
}

- (int64_t)itemSparseMatchStrengthTypeForMessagesAndCalendarWithEvaluator:(id)a3 attributeMatchesForToken:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t j;
  void *v32;
  unint64_t v33;
  void *v34;
  int v35;
  BOOL v36;
  void *v37;
  char v38;
  const __CFString *v39;
  char v40;
  char v41;
  char v42;
  char v43;
  int64_t v44;
  unsigned int v45;
  int v47;
  BOOL v48;
  uint64_t v49;
  uint64_t v50;
  id obj;
  int obja;
  uint64_t v53;
  id v54;
  int v55;
  id v56;
  int v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v54 = a4;
  v56 = v5;
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  objc_msgSend(v5, "itemQPQUOutputTokenInfo");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v71, 16);
  if (v6)
  {
    v7 = v6;
    v59 = 0;
    v60 = 0;
    v58 = 0;
    v53 = 0;
    v57 = 0;
    v8 = 0;
    v9 = *(_QWORD *)v67;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v67 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * i);
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("kQPQUOutputToken"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("kQPQUOutputTokenArgScores"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("kQPQUOutputTokenArgLabels"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "objectForKey:", v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v14, "isEqualToString:", CFSTR("ARG_MEDIA_TYPE"));
        if (v15)
        {
          v17 = objc_msgSend(v14, "isEqualToString:", CFSTR("ARG_UNSPECIFIED")) ^ 1;
          if (((-[PRSRankingItem bundleIDType](self, "bundleIDType") & 8) != 0
             || (-[PRSRankingItem bundleIDType](self, "bundleIDType") & 0x40) != 0)
            && (objc_msgSend(v15, "containsObject:", CFSTR("kMDItemTextContent")) & 1) != 0
            || (-[PRSRankingItem bundleIDType](self, "bundleIDType") & 0x20) != 0
            && objc_msgSend(v15, "containsObject:", CFSTR("kMDItemTitle")))
          {
            HIDWORD(v53) += v17;
            LODWORD(v53) = v53 + 1;
          }
          v18 = objc_msgSend(v15, "containsObject:", CFSTR("kMDItemAuthors"));
          if (v18)
            v19 = v17;
          else
            v19 = 0;
          HIDWORD(v60) += v19;
          HIDWORD(v59) += v18;
          if (objc_msgSend(v15, "containsObject:", CFSTR("kMDItemAuthorEmailAddresses")))
            v20 = v17;
          else
            v20 = 0;
          LODWORD(v60) = v20 + v60;
          v21 = objc_msgSend(v15, "containsObject:", CFSTR("kMDItemRecipients"));
          if (v21)
            v22 = v17;
          else
            v22 = 0;
          LODWORD(v59) = v22 + v59;
          LODWORD(v58) = v58 + v21;
          v23 = objc_msgSend(v15, "containsObject:", CFSTR("kMDItemRecipientEmailAddresses"));
          if (v23)
            v24 = v17;
          else
            v24 = 0;
          HIDWORD(v58) += v24;
          v57 += v23;
        }
        v8 += v16;

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v71, 16);
    }
    while (v7);
  }
  else
  {
    v59 = 0;
    v60 = 0;
    v58 = 0;
    v53 = 0;
    v57 = 0;
    v8 = 0;
  }

  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("\\S+"), 1, 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v26 = v54;
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
  if (v27)
  {
    v28 = v27;
    v49 = 0;
    v50 = 0;
    obja = 0;
    v55 = 0;
    v29 = *(_QWORD *)v63;
    v30 = v56;
    do
    {
      for (j = 0; j != v28; ++j)
      {
        if (*(_QWORD *)v63 != v29)
          objc_enumerationMutation(v26);
        v32 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * j);
        v33 = objc_msgSend(v25, "numberOfMatchesInString:options:range:", v32, 0, 0, objc_msgSend(v32, "length"));
        objc_msgSend(v30, "queryString");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v34, "localizedCaseInsensitiveContainsString:", v32);

        if (v35)
          v36 = v33 >= 2;
        else
          v36 = 0;
        if (v36)
        {
          objc_msgSend(v26, "objectForKey:", v32);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = -[PRSRankingItem bundleIDType](self, "bundleIDType");
          v39 = CFSTR("kMDItemTitle");
          if (v33 == 2)
          {
            v30 = v56;
            if ((v38 & 0x20) != 0
              || (v40 = -[PRSRankingItem bundleIDType](self, "bundleIDType", CFSTR("kMDItemTitle")),
                  v39 = CFSTR("kMDItemTitle"),
                  (v40 & 0x40) != 0)
              || (v41 = -[PRSRankingItem bundleIDType](self, "bundleIDType", CFSTR("kMDItemTitle")),
                  v39 = CFSTR("kMDItemTextContent"),
                  (v41 & 8) != 0))
            {
              LODWORD(v49) = v49 + objc_msgSend(v37, "containsObject:", v39);
            }
            obja += objc_msgSend(v37, "containsObject:", CFSTR("kMDItemAuthors"));
            LODWORD(v50) = v50 + objc_msgSend(v37, "containsObject:", CFSTR("kMDItemRecipients"));
          }
          else
          {
            v30 = v56;
            if ((v38 & 0x20) != 0
              || (v42 = -[PRSRankingItem bundleIDType](self, "bundleIDType", CFSTR("kMDItemTitle")),
                  v39 = CFSTR("kMDItemTitle"),
                  (v42 & 0x40) != 0)
              || (v43 = -[PRSRankingItem bundleIDType](self, "bundleIDType", CFSTR("kMDItemTitle")),
                  v39 = CFSTR("kMDItemTextContent"),
                  (v43 & 8) != 0))
            {
              HIDWORD(v49) += objc_msgSend(v37, "containsObject:", v39);
            }
            v55 += objc_msgSend(v37, "containsObject:", CFSTR("kMDItemAuthors"));
            HIDWORD(v50) += objc_msgSend(v37, "containsObject:", CFSTR("kMDItemRecipients"));
          }

        }
        else
        {
          v30 = v56;
        }
      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
    }
    while (v28);
  }
  else
  {
    v49 = 0;
    v50 = 0;
    obja = 0;
    v55 = 0;
    v30 = v56;
  }

  if (objc_msgSend(v30, "countQPUSpecialToken") == 1)
  {
    v44 = 0;
    if (HIDWORD(v53) || v60)
      goto LABEL_74;
    if (!objc_msgSend(v30, "countQPUSpecialToken"))
      goto LABEL_72;
LABEL_63:
    if ((-[PRSRankingItem bundleIDType](self, "bundleIDType") & 0x20) != 0 && HIDWORD(v53) > 1
      || (-[PRSRankingItem bundleIDType](self, "bundleIDType") & 8) != 0 && HIDWORD(v53) > 2)
    {
      goto LABEL_73;
    }
    v44 = 0;
    v45 = v8 + v60 + v59 + HIDWORD(v58) + HIDWORD(v60) + HIDWORD(v53);
    if (v8 + HIDWORD(v53) >= v45)
      goto LABEL_74;
    if (v8 + (int)v60 >= v45)
      goto LABEL_74;
    v44 = 0;
    if (v8 + HIDWORD(v53) + (int)v60 >= v45 || HIDWORD(v49))
      goto LABEL_74;
    goto LABEL_75;
  }
  if (objc_msgSend(v30, "countQPUSpecialToken"))
  {
    if (HIDWORD(v60))
    {
LABEL_73:
      v44 = 0;
      goto LABEL_74;
    }
    goto LABEL_63;
  }
LABEL_72:
  if (HIDWORD(v49))
    goto LABEL_73;
LABEL_75:
  v44 = 0;
  if (!(_DWORD)v49 && !v55 && !obja)
  {
    if ((_DWORD)v53 && HIDWORD(v59))
      goto LABEL_73;
    v47 = -HIDWORD(v50);
    if (v53 | HIDWORD(v59))
    {
      if ((_DWORD)v50 != v47)
        goto LABEL_73;
    }
    if ((-[PRSRankingItem bundleIDType](self, "bundleIDType") & 0x20) != 0 && HIDWORD(v53))
    {
      v44 = 1;
    }
    else
    {
      v44 = 1;
      if (((HIDWORD(v53) > 1) & (-[PRSRankingItem bundleIDType](self, "bundleIDType") >> 3)) == 0
        && v53 <= 1
        && !HIDWORD(v59))
      {
        v48 = !((_DWORD)v58 + v57) || (_DWORD)v53 == 0;
        v44 = 1;
        if (v48 && (_DWORD)v50 == v47)
        {
          if (((HIDWORD(v53) != 0) & (-[PRSRankingItem bundleIDType](self, "bundleIDType") >> 3)) != 0
            || (_DWORD)v59 != -HIDWORD(v58)
            || (objc_msgSend(v30, "countQPUSpecialToken"), (_DWORD)v53)
            || (_DWORD)v58 != -v57)
          {
            v44 = 2;
          }
          else
          {
            v44 = 3;
          }
        }
      }
    }
  }
LABEL_74:

  return v44;
}

- (int64_t)itemSparseMatchStrengthTypeForNotesAndFilesWithEvaluator:(id)a3 attributeMatchesForToken:(id)a4
{
  id v5;
  unsigned int v6;
  int v7;
  int v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  unint64_t v33;
  void *v34;
  int v35;
  BOOL v36;
  void *v37;
  int v38;
  int v39;
  char v40;
  int v41;
  int v42;
  uint64_t v43;
  unsigned int v44;
  int64_t v45;
  unsigned int v46;
  uint64_t v48;
  int v49;
  __int128 v50;
  uint64_t v51;
  id v52;
  id v53;
  uint64_t v54;
  int v55;
  unsigned int v56;
  int v57;
  void *v58;
  unsigned int v59;
  unsigned int v60;
  uint64_t v61;
  uint64_t v62;
  int v63;
  int v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _BYTE v73[128];
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v52 = a4;
  v53 = v5;
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  objc_msgSend(v5, "itemQPQUOutputTokenInfo");
  *((_QWORD *)&v50 + 1) = objc_claimAutoreleasedReturnValue();
  v54 = objc_msgSend(*((id *)&v50 + 1), "countByEnumeratingWithState:objects:count:", &v69, v74, 16);
  if (v54)
  {
    v61 = 0;
    v62 = 0;
    v63 = 0;
    v55 = 0;
    v56 = 0;
    v60 = 0;
    v6 = 0;
    v7 = 0;
    v8 = 0;
    v51 = *(_QWORD *)v70;
    do
    {
      for (i = 0; i != v54; ++i)
      {
        if (*(_QWORD *)v70 != v51)
          objc_enumerationMutation(*((id *)&v50 + 1));
        v10 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * i);
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("kQPQUOutputToken"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("kQPQUOutputTokenArgScores"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("kQPQUOutputTokenArgLabels"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "objectForKey:", v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v13, "isEqualToString:", CFSTR("ARG_MEDIA_TYPE"));
        if (v14)
        {
          v57 = v15;
          v58 = v12;
          v64 = v8;
          v16 = v7;
          v59 = v6;
          v17 = objc_msgSend(v13, "isEqualToString:", CFSTR("ARG_UNSPECIFIED")) ^ 1;
          v18 = objc_msgSend(v14, "containsObject:", CFSTR("kMDItemTextContent"));
          if (v18)
            v19 = v17;
          else
            v19 = 0;
          v20 = objc_msgSend(v14, "containsObject:", CFSTR("kMDItemTitle"));
          if (v20)
            v21 = v17;
          else
            v21 = 0;
          if ((objc_msgSend(v14, "containsObject:", CFSTR("kMDItemDisplayName")) & 1) != 0
            || (objc_msgSend(v14, "containsObject:", CFSTR("kMDItemFileName")) & 1) != 0
            || (objc_msgSend(v14, "containsObject:", CFSTR("kMDItemAlternateNames")) & 1) != 0
            || objc_msgSend(v14, "containsObject:", CFSTR("FPFilename")))
          {
            v56 += v17;
            ++v55;
          }
          v60 += v18;
          HIDWORD(v62) += v19;
          LODWORD(v61) = v61 + v20;
          v7 = v21 + v16;
          v22 = objc_msgSend(v14, "containsObject:", CFSTR("kMDItemAuthors"));
          if (v22)
            v23 = v17;
          else
            v23 = 0;
          v63 += v23;
          HIDWORD(v61) += v22;
          v24 = objc_msgSend(v14, "containsObject:", CFSTR("kMDItemLastEditorName"));
          if (v24)
            v25 = v17;
          else
            v25 = 0;
          LODWORD(v62) = v25 + v62;
          v6 = v59 + v24;
          v8 = v64;
          v12 = v58;
          v15 = v57;
        }
        v8 += v15;

      }
      v54 = objc_msgSend(*((id *)&v50 + 1), "countByEnumeratingWithState:objects:count:", &v69, v74, 16);
    }
    while (v54);
  }
  else
  {
    v61 = 0;
    v62 = 0;
    v63 = 0;
    v55 = 0;
    v56 = 0;
    v60 = 0;
    v6 = 0;
    v7 = 0;
    v8 = 0;
  }
  v64 = v8;
  LODWORD(v48) = v7;

  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("\\S+"), 1, 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v27 = v52;
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v65, v73, 16);
  if (v28)
  {
    v29 = v28;
    memset(&v50, 0, 12);
    HIDWORD(v48) = 0;
    v57 = 0;
    LODWORD(v58) = 0;
    v59 = 0;
    LODWORD(v54) = 0;
    LODWORD(v51) = 0;
    LODWORD(v52) = 0;
    v30 = *(_QWORD *)v66;
    do
    {
      v31 = 0;
      do
      {
        if (*(_QWORD *)v66 != v30)
          objc_enumerationMutation(v27);
        v32 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * v31);
        v33 = objc_msgSend(v26, "numberOfMatchesInString:options:range:", v32, 0, 0, objc_msgSend(v32, "length", v48));
        objc_msgSend(v53, "queryString");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v34, "localizedCaseInsensitiveContainsString:", v32);

        if (v35)
          v36 = v33 >= 2;
        else
          v36 = 0;
        if (v36)
        {
          objc_msgSend(v27, "objectForKey:", v32);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = objc_msgSend(v37, "containsObject:", CFSTR("kMDItemTextContent"));
          v39 = objc_msgSend(v37, "containsObject:", CFSTR("kMDItemTitle"));
          v40 = objc_msgSend(v37, "containsObject:", CFSTR("kMDItemDisplayName"));
          if (v33 == 2)
          {
            if ((v40 & 1) != 0
              || (objc_msgSend(v37, "containsObject:", CFSTR("kMDItemFileName")) & 1) != 0
              || (objc_msgSend(v37, "containsObject:", CFSTR("kMDItemAlternateNames")) & 1) != 0)
            {
              v41 = 1;
            }
            else
            {
              v41 = objc_msgSend(v37, "containsObject:", CFSTR("FPFilename"));
            }
            LODWORD(v50) = v50 + v38;
            LODWORD(v58) = (_DWORD)v58 + v39;
            LODWORD(v54) = v54 + v41;
            LODWORD(v51) = v51 + objc_msgSend(v37, "containsObject:", CFSTR("kMDItemAuthors"));
            DWORD1(v50) += objc_msgSend(v37, "containsObject:", CFSTR("kMDItemLastEditorName"));
          }
          else
          {
            if ((v40 & 1) != 0
              || (objc_msgSend(v37, "containsObject:", CFSTR("kMDItemFileName")) & 1) != 0
              || (objc_msgSend(v37, "containsObject:", CFSTR("kMDItemAlternateNames")) & 1) != 0)
            {
              v42 = 1;
            }
            else
            {
              v42 = objc_msgSend(v37, "containsObject:", CFSTR("FPFilename"));
            }
            HIDWORD(v48) += v38;
            v59 += v39;
            v57 += v42;
            LODWORD(v52) = (_DWORD)v52 + objc_msgSend(v37, "containsObject:", CFSTR("kMDItemAuthors"));
            DWORD2(v50) += objc_msgSend(v37, "containsObject:", CFSTR("kMDItemLastEditorName"));
          }

        }
        ++v31;
      }
      while (v29 != v31);
      v43 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v65, v73, 16);
      v29 = v43;
    }
    while (v43);
  }
  else
  {
    memset(&v50, 0, 12);
    HIDWORD(v48) = 0;
    v57 = 0;
    LODWORD(v58) = 0;
    v59 = 0;
    LODWORD(v54) = 0;
    LODWORD(v51) = 0;
    LODWORD(v52) = 0;
  }

  v44 = v48;
  if (objc_msgSend(v53, "countQPUSpecialToken") != 1 || (v45 = 0, !(_DWORD)v48) && !v56 && !v63)
  {
    if (objc_msgSend(v53, "countQPUSpecialToken", v48))
    {
      v45 = 0;
      v46 = v64 + v63 + v62 + v56 + v44 + HIDWORD(v62);
      if (v64 + v44 >= v46)
        goto LABEL_83;
      if (v64 + v56 >= v46)
        goto LABEL_83;
      v45 = 0;
      if (v64 + v63 >= v46 || v44 > 1 || v56 > 1 || HIDWORD(v62) > 2 || v59)
        goto LABEL_83;
    }
    else if (v59)
    {
      goto LABEL_82;
    }
    v45 = 0;
    if ((_DWORD)v58
      || v57
      || (_DWORD)v54
      || (_DWORD)v52
      || (_DWORD)v51
      || *(_QWORD *)((char *)&v50 + 4)
      || v49
      || v50 > 1)
    {
      goto LABEL_83;
    }
    if (v61 | v55 && HIDWORD(v61))
    {
LABEL_82:
      v45 = 0;
      goto LABEL_83;
    }
    if (!(v55 | v61) || (v45 = 0, !(_DWORD)v50) && v60 <= 1)
    {
      v45 = 1;
      if (!v44
        && !v56
        && !v63
        && !(_DWORD)v62
        && !(v55 | v61 | HIDWORD(v62))
        && !HIDWORD(v61)
        && v6 <= 1
        && HIDWORD(v62) <= 1)
      {
        if (v6)
          v45 = 2;
        else
          v45 = 3;
      }
    }
  }
LABEL_83:

  return v45;
}

- (float)computeCalibratedSparseScore
{
  float v3;
  float v4;
  int v5;
  int64_t v6;
  float v7;
  float v8;
  float v10;
  float v11;

  -[PRSRankingItem pommesL1Score](self, "pommesL1Score");
  v4 = v3;
  v5 = -[PRSRankingItem bundleIDType](self, "bundleIDType");
  v6 = -[PRSRankingItem itemSparseMatchStrengthType](self, "itemSparseMatchStrengthType");
  if (v4 <= 0.00000011921)
    return 0.0;
  switch(v6)
  {
    case 0:
      v10 = 1.5;
      v7 = 1.0;
      v8 = 0.8;
      if ((v5 & 0x100000) != 0)
      {
        v11 = 0.4;
      }
      else
      {
        v11 = 0.5;
        if ((v5 & 0x862) == 0)
        {
          if ((v5 & 8) != 0)
            v11 = 0.5;
          else
            v11 = 0.0;
          v10 = 1.5;
          v7 = 1.0;
          if ((v5 & 8) == 0)
            v10 = 1.0;
        }
      }
      return v8
           + (float)(sqrtf((float)(fminf(fmaxf(v4, v11), v10) - v11) / (float)((float)(v10 - v11) + 0.00000011921))
                   * (float)(v7 - v8));
    case 1:
      v8 = 0.5;
      v7 = 0.78;
      if ((v5 & 0x100000) != 0)
        goto LABEL_26;
      break;
    case 2:
      v7 = 0.48;
      v8 = 0.1;
      if ((v5 & 0x100000) != 0)
      {
LABEL_26:
        if (v6 != 1)
        {
          if (v6 == 2)
          {
            v10 = 0.5;
            v11 = 0.2;
            return v8
                 + (float)(sqrtf((float)(fminf(fmaxf(v4, v11), v10) - v11) / (float)((float)(v10 - v11) + 0.00000011921))
                         * (float)(v7 - v8));
          }
LABEL_36:
          v10 = 1.0;
          v11 = 0.0;
          return v8
               + (float)(sqrtf((float)(fminf(fmaxf(v4, v11), v10) - v11) / (float)((float)(v10 - v11) + 0.00000011921))
                       * (float)(v7 - v8));
        }
        goto LABEL_37;
      }
      break;
    default:
      v7 = 1.0;
      v8 = 0.0;
      if ((v5 & 0x100000) != 0)
        goto LABEL_26;
      break;
  }
  if ((v5 & 0x20) != 0)
  {
    if (v6 != 1)
    {
      if (v6 != 2)
        goto LABEL_36;
      v10 = 0.6;
LABEL_35:
      v11 = 0.1;
      return v8
           + (float)(sqrtf((float)(fminf(fmaxf(v4, v11), v10) - v11) / (float)((float)(v10 - v11) + 0.00000011921))
                   * (float)(v7 - v8));
    }
    goto LABEL_39;
  }
  if ((v5 & 2) != 0 || (v5 & 0x40) != 0 || (v5 & 0x800) != 0)
  {
    if (v6 != 1)
    {
      if (v6 != 2)
        goto LABEL_36;
LABEL_34:
      v10 = 0.5;
      goto LABEL_35;
    }
LABEL_39:
    v10 = 1.2;
    goto LABEL_40;
  }
  v10 = 1.0;
  v11 = 0.0;
  if ((v5 & 8) != 0)
  {
    if (v6 == 1)
    {
LABEL_37:
      v10 = 0.75;
LABEL_40:
      v11 = 0.3;
      return v8
           + (float)(sqrtf((float)(fminf(fmaxf(v4, v11), v10) - v11) / (float)((float)(v10 - v11) + 0.00000011921))
                   * (float)(v7 - v8));
    }
    if (v6 != 2)
      return v8
           + (float)(sqrtf((float)(fminf(fmaxf(v4, v11), v10) - v11) / (float)((float)(v10 - v11) + 0.00000011921))
                   * (float)(v7 - v8));
    goto LABEL_34;
  }
  return v8
       + (float)(sqrtf((float)(fminf(fmaxf(v4, v11), v10) - v11) / (float)((float)(v10 - v11) + 0.00000011921))
               * (float)(v7 - v8));
}

- (float)topicalityScoreWithEvaluator:(id)a3 quParsedEvaluator:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _BOOL8 v10;
  float v11;
  float v12;

  v6 = a3;
  v7 = a4;
  SSCompactRankingAttrsGetValue((int8x8_t *)-[PRSRankingItem attributes](self, "attributes"), 0x105uLL);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  SSCompactRankingAttrsGetValue((int8x8_t *)-[PRSRankingItem attributes](self, "attributes"), 0x106uLL);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "length") && objc_msgSend(v9, "length");
  -[PRSRankingItem setIsAppEntity:](self, "setIsAppEntity:", v10);
  if ((-[PRSRankingItem bundleIDType](self, "bundleIDType") & 0x80) != 0)
  {
    -[PRSRankingItem matchScoreForSafariWithEvaluator:quParsedEvaluator:](self, "matchScoreForSafariWithEvaluator:quParsedEvaluator:", v6, v7);
  }
  else if ((-[PRSRankingItem bundleIDType](self, "bundleIDType") & 0x100) != 0)
  {
    -[PRSRankingItem matchScoreForApplicationsWithEvaluator:](self, "matchScoreForApplicationsWithEvaluator:", v6);
  }
  else if ((-[PRSRankingItem bundleIDType](self, "bundleIDType") & 4) != 0)
  {
    -[PRSRankingItem matchScoreForContactsWithEvaluator:](self, "matchScoreForContactsWithEvaluator:", v6);
  }
  else if ((-[PRSRankingItem bundleIDType](self, "bundleIDType") & 0x10) != 0)
  {
    -[PRSRankingItem matchScoreForPreferencesWithEvaluator:](self, "matchScoreForPreferencesWithEvaluator:", v6);
  }
  else
  {
    if ((-[PRSRankingItem bundleIDType](self, "bundleIDType") & 2) != 0)
      goto LABEL_26;
    if ((-[PRSRankingItem bundleIDType](self, "bundleIDType") & 0x800) != 0)
    {
      -[PRSRankingItem matchScoreForFilesWithEvaluator:quParsedEvaluator:](self, "matchScoreForFilesWithEvaluator:quParsedEvaluator:", v6, v7);
      goto LABEL_36;
    }
    if ((-[PRSRankingItem bundleIDType](self, "bundleIDType") & 0x20) != 0)
    {
      -[PRSRankingItem matchScoreForCalendarWithEvaluator:quParsedEvaluator:](self, "matchScoreForCalendarWithEvaluator:quParsedEvaluator:", v6, v7);
      goto LABEL_36;
    }
    if ((-[PRSRankingItem bundleIDType](self, "bundleIDType") & 0x40) != 0)
    {
LABEL_26:
      -[PRSRankingItem matchScoreForNotesWithEvaluator:](self, "matchScoreForNotesWithEvaluator:", v6);
    }
    else if ((-[PRSRankingItem bundleIDType](self, "bundleIDType") & 0x100000) != 0)
    {
      -[PRSRankingItem matchScoreForMailWithEvaluator:](self, "matchScoreForMailWithEvaluator:", v6);
    }
    else if ((-[PRSRankingItem bundleIDType](self, "bundleIDType") & 8) != 0)
    {
      -[PRSRankingItem matchScoreForMessagesWithEvaluator:](self, "matchScoreForMessagesWithEvaluator:", v6);
    }
    else if ((-[PRSRankingItem bundleIDType](self, "bundleIDType") & 0x200000) != 0)
    {
      -[PRSRankingItem matchScoreForShortcutsWithEvaluator:](self, "matchScoreForShortcutsWithEvaluator:", v6);
    }
    else if ((-[PRSRankingItem bundleIDType](self, "bundleIDType") & 0x800000000000) != 0)
    {
      -[PRSRankingItem matchScoreForDictionaryWithEvaluator:](self, "matchScoreForDictionaryWithEvaluator:", v6);
    }
    else if ((-[PRSRankingItem bundleIDType](self, "bundleIDType") & 0x2000000000000) != 0)
    {
      -[PRSRankingItem matchScoreForBooksWithEvaluator:quParsedEvaluator:](self, "matchScoreForBooksWithEvaluator:quParsedEvaluator:", v6, v7);
    }
    else if ((-[PRSRankingItem bundleIDType](self, "bundleIDType") & 0x4000000000000) != 0)
    {
      -[PRSRankingItem matchScoreForTipsWithEvaluator:](self, "matchScoreForTipsWithEvaluator:", v6);
    }
    else if ((-[PRSRankingItem bundleIDType](self, "bundleIDType") & 0x8000000000000) != 0)
    {
      -[PRSRankingItem matchScoreForHelpWithEvaluator:](self, "matchScoreForHelpWithEvaluator:", v6);
    }
    else if ((-[PRSRankingItem bundleIDType](self, "bundleIDType") & 0x40000000000200) != 0)
    {
      -[PRSRankingItem matchScoreForMusicWithEvaluator:quParsedEvaluator:](self, "matchScoreForMusicWithEvaluator:quParsedEvaluator:", v6, v7);
    }
    else if ((-[PRSRankingItem bundleIDType](self, "bundleIDType") & 0x1800000) != 0)
    {
      -[PRSRankingItem matchScoreForPeopleItemsWithEvaluator:](self, "matchScoreForPeopleItemsWithEvaluator:", v6);
    }
    else if ((-[PRSRankingItem bundleIDType](self, "bundleIDType") & 0x200000000) != 0)
    {
      -[PRSRankingItem matchScoreForWalletWithEvaluator:quParsedEvaluator:](self, "matchScoreForWalletWithEvaluator:quParsedEvaluator:", v6, v7);
    }
    else
    {
      v12 = -1.0;
      if (!-[PRSRankingItem isAppEntity](self, "isAppEntity"))
        goto LABEL_37;
      -[PRSRankingItem matchScoreForAppEntityWithEvaluator:quParsedEvaluator:](self, "matchScoreForAppEntityWithEvaluator:quParsedEvaluator:", v6, v7);
    }
  }
LABEL_36:
  v12 = v11;
LABEL_37:
  if (SSEnableSpotlightFullPageRanking() && v12 > 0.05)
    -[PRSRankingItem setShouldHideUnderShowMore:](self, "setShouldHideUnderShowMore:", 0);

  return v12;
}

+ (id)tokenizeURLString:(id)a3 removeTLD:(BOOL)a4 hostTokenCount:(unint64_t *)a5 hostLength:(unint64_t *)a6 pathLength:(unint64_t *)a7 queryLength:(unint64_t *)a8 fragmentLength:(unint64_t *)a9
{
  _BOOL4 v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  __CFString *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v38;
  void *v39;
  char v40;
  _BOOL4 v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;

  v13 = a4;
  v14 = a3;
  if (tokenizeURLString_removeTLD_hostTokenCount_hostLength_pathLength_queryLength_fragmentLength__onceToken != -1)
    dispatch_once(&tokenizeURLString_removeTLD_hostTokenCount_hostLength_pathLength_queryLength_fragmentLength__onceToken, &__block_literal_global_120_1);
  *a5 = 0;
  *a6 = 0;
  *a7 = 0;
  *a8 = 0;
  *a9 = 0;
  if (objc_msgSend(v14, "length"))
  {
    objc_msgSend(v14, "lowercaseString");
    v15 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (!v16 || (objc_msgSend(v16, "host"), (v18 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      v27 = &stru_1E6E549F0;
LABEL_22:

      v14 = (id)v15;
      goto LABEL_23;
    }
    v19 = v18;
    v44 = v15;
    objc_msgSend(v18, "componentsSeparatedByString:", CFSTR("."));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v20, "mutableCopy");

    if ((unint64_t)objc_msgSend(v21, "count") >= 3)
    {
      v41 = v13;
      objc_msgSend(v21, "objectAtIndexedSubscript:", 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "length");

      if (v23 > 4)
      {
        v13 = v41;
      }
      else
      {
        objc_msgSend(v21, "objectAtIndexedSubscript:", 0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v24, "hasPrefix:", CFSTR("www")) & 1) != 0)
        {
LABEL_11:

          v13 = v41;
LABEL_12:
          objc_msgSend(v21, "removeObjectAtIndex:", 0);
          objc_msgSend(v21, "componentsJoinedByString:", CFSTR("."));
          v26 = objc_claimAutoreleasedReturnValue();

          v19 = (void *)v26;
          goto LABEL_16;
        }
        objc_msgSend(v21, "objectAtIndexedSubscript:", 0);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v25, "isEqualToString:", CFSTR("m")))
        {

          goto LABEL_11;
        }
        objc_msgSend(v21, "objectAtIndexedSubscript:", 0);
        v46 = v19;
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(v38, "isEqualToString:", CFSTR("ww"));

        v19 = v46;
        v13 = v41;
        if ((v40 & 1) != 0)
          goto LABEL_12;
      }
    }
LABEL_16:
    v43 = v21;
    v45 = v19;
    objc_msgSend(v19, "componentsSeparatedByCharactersInSet:", tokenizeURLString_removeTLD_hostTokenCount_hostLength_pathLength_queryLength_fragmentLength__removeCharsHost);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)objc_msgSend(v28, "mutableCopy");

    objc_msgSend(v29, "removeObject:", &stru_1E6E549F0);
    if (v13 && (unint64_t)objc_msgSend(v29, "count") >= 2)
      objc_msgSend(v29, "removeLastObject");
    *a5 = objc_msgSend(v29, "count");
    objc_msgSend(v17, "path");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "query");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "fragment");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "stringByDeletingPathExtension");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v31, "componentsSeparatedByCharactersInSet:", tokenizeURLString_removeTLD_hostTokenCount_hostLength_pathLength_queryLength_fragmentLength__removeCharsPath);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "componentsJoinedByString:", CFSTR(" "));
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "stringByTrimmingCharactersInSet:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v29, "componentsJoinedByString:", CFSTR(" "));
    v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *a6 = -[__CFString length](v27, "length");
    *a7 = objc_msgSend(v35, "length");
    *a8 = objc_msgSend(v42, "length");
    *a9 = objc_msgSend(v39, "length");
    if (objc_msgSend(v35, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), v27, v35);
      v36 = objc_claimAutoreleasedReturnValue();

      v27 = (__CFString *)v36;
    }

    v15 = v44;
    goto LABEL_22;
  }
  v27 = &stru_1E6E549F0;
LABEL_23:

  return v27;
}

void __119__PRSRankingItem_Scoring__tokenizeURLString_removeTLD_hostTokenCount_hostLength_pathLength_queryLength_fragmentLength___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR(".-"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)tokenizeURLString_removeTLD_hostTokenCount_hostLength_pathLength_queryLength_fragmentLength__removeCharsHost;
  tokenizeURLString_removeTLD_hostTokenCount_hostLength_pathLength_queryLength_fragmentLength__removeCharsHost = v0;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("/.-_"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)tokenizeURLString_removeTLD_hostTokenCount_hostLength_pathLength_queryLength_fragmentLength__removeCharsPath;
  tokenizeURLString_removeTLD_hostTokenCount_hostLength_pathLength_queryLength_fragmentLength__removeCharsPath = v2;

}

+ (id)tokenizeContactsEmailAddress:(id)a3 removeTLD:(BOOL)a4 usernameTokenCount:(unint64_t *)a5 usernameLength:(unint64_t *)a6 domainLength:(unint64_t *)a7 username:(id *)a8
{
  id v13;
  __CFString *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  unint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;

  v13 = a3;
  if (tokenizeContactsEmailAddress_removeTLD_usernameTokenCount_usernameLength_domainLength_username__onceToken != -1)
    dispatch_once(&tokenizeContactsEmailAddress_removeTLD_usernameTokenCount_usernameLength_domainLength_username__onceToken, &__block_literal_global_142);
  v14 = &stru_1E6E549F0;
  *a8 = &stru_1E6E549F0;
  objc_msgSend((id)tokenizeContactsEmailAddress_removeTLD_usernameTokenCount_usernameLength_domainLength_username__emailAddressRegularExpression, "firstMatchInString:options:range:", v13, 0, 0, objc_msgSend(v13, "length"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    v17 = objc_msgSend(v15, "rangeAtIndex:", 1);
    objc_msgSend(v13, "substringWithRange:", v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "lowercaseString");
    *a8 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*a8, "componentsSeparatedByCharactersInSet:", tokenizeContactsEmailAddress_removeTLD_usernameTokenCount_usernameLength_domainLength_username__removeCharsUsername);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *a5 = objc_msgSend(v20, "count");
    objc_msgSend(v20, "componentsJoinedByString:", CFSTR(" "));
    v21 = a7;
    v22 = objc_claimAutoreleasedReturnValue();
    *a6 = objc_msgSend(*a8, "length");
    v23 = objc_msgSend(v16, "rangeAtIndex:", 2);
    objc_msgSend(v13, "substringWithRange:", v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "lowercaseString");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v26, "componentsSeparatedByCharactersInSet:", tokenizeContactsEmailAddress_removeTLD_usernameTokenCount_usernameLength_domainLength_username__removeCharsDomain);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "componentsJoinedByString:", CFSTR(" "));
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    *v21 = objc_msgSend(v26, "length");
    v29 = (void *)v22;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), v22, v28);
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v16, "rangeAtIndex:", 3);
    objc_msgSend(v13, "substringWithRange:", v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "lowercaseString");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (!a4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), v14, v33);
      v34 = objc_claimAutoreleasedReturnValue();

      v14 = (__CFString *)v34;
    }

  }
  return v14;
}

void __122__PRSRankingItem_Scoring__tokenizeContactsEmailAddress_removeTLD_usernameTokenCount_usernameLength_domainLength_username___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("(.+)@(.+)\\.(.+)"), 1, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)tokenizeContactsEmailAddress_removeTLD_usernameTokenCount_usernameLength_domainLength_username__emailAddressRegularExpression;
  tokenizeContactsEmailAddress_removeTLD_usernameTokenCount_usernameLength_domainLength_username__emailAddressRegularExpression = v0;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR(".-_~+"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)tokenizeContactsEmailAddress_removeTLD_usernameTokenCount_usernameLength_domainLength_username__removeCharsUsername;
  tokenizeContactsEmailAddress_removeTLD_usernameTokenCount_usernameLength_domainLength_username__removeCharsUsername = v2;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR(".-_"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)tokenizeContactsEmailAddress_removeTLD_usernameTokenCount_usernameLength_domainLength_username__removeCharsDomain;
  tokenizeContactsEmailAddress_removeTLD_usernameTokenCount_usernameLength_domainLength_username__removeCharsDomain = v4;

}

+ (id)tokenizeContactsName:(id)a3 tokenCount:(unint64_t *)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a3;
  if (tokenizeContactsName_tokenCount__onceToken != -1)
    dispatch_once(&tokenizeContactsName_tokenCount__onceToken, &__block_literal_global_149);
  *a4 = 0;
  if (objc_msgSend(v5, "length"))
  {
    objc_msgSend(v5, "componentsSeparatedByCharactersInSet:", tokenizeContactsName_tokenCount__removeCharsContactsName);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "componentsJoinedByString:", &stru_1E6E549F0);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "componentsSeparatedByCharactersInSet:", tokenizeContactsName_tokenCount__replaceCharsContactsName);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *a4 = objc_msgSend(v8, "count");
    objc_msgSend(v8, "componentsJoinedByString:", CFSTR(" "));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lowercaseString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = v5;
    v10 = v7;
  }

  return v10;
}

void __59__PRSRankingItem_Scoring__tokenizeContactsName_tokenCount___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("|/\\:. ()~*"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)tokenizeContactsName_tokenCount__replaceCharsContactsName;
  tokenizeContactsName_tokenCount__replaceCharsContactsName = v0;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("-"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)tokenizeContactsName_tokenCount__removeCharsContactsName;
  tokenizeContactsName_tokenCount__removeCharsContactsName = v2;

}

+ (id)tokenizeTitleString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  if (tokenizeTitleString__onceToken != -1)
    dispatch_once(&tokenizeTitleString__onceToken, &__block_literal_global_154);
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(v3, "componentsSeparatedByCharactersInSet:", removeCharsTitle);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "componentsJoinedByString:", CFSTR(" "));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "lowercaseString");
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = v3;
  }

  return v6;
}

void __47__PRSRankingItem_Scoring__tokenizeTitleString___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("|/\\:. -()~*&"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)removeCharsTitle;
  removeCharsTitle = v0;

}

- (float)matchScoreURLString:(id)a3 withEvaluator:(id)a4
{
  id v5;
  id v6;
  unint64_t v7;
  float v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  int v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  char v18;
  void *v19;
  int v20;
  uint64_t v21;
  char v22;
  char v23;
  float v24;
  float v25;
  float v26;
  float v27;
  void *v28;
  float v29;
  float v30;
  void *v31;
  int v32;
  void *v33;
  unint64_t v34;
  double v35;
  BOOL v37;
  BOOL v38;
  float v39;
  float v40;
  void *v41;
  unint64_t v42;
  float v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  float v48;
  void *v49;
  void *v50;
  void *v51;
  float v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  char v58;
  void *v59;
  void *v60;
  void *v61;
  unint64_t v62;
  uint64_t v63;
  unint64_t v64;
  uint64_t v65;
  unint64_t v66;
  float v67;
  float v68;
  void *v69;
  unint64_t v70;
  unint64_t v71;
  unint64_t v72;
  _BOOL4 v73;
  void *v74;
  unint64_t v75;
  unint64_t v76;
  unint64_t v77;
  uint64_t v78;
  uint64_t v79;
  float v80;
  float v81;
  float v82;
  char v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  _QWORD v90[4];
  id v91;
  uint64_t *v92;
  uint64_t *v93;
  unint64_t v94;
  unint64_t v95;
  uint64_t v96;
  uint64_t v97;
  unint64_t v98;
  unint64_t v99;
  unint64_t v100;
  uint64_t v101;
  uint64_t *v102;
  uint64_t v103;
  uint64_t (*v104)(uint64_t, uint64_t);
  void (*v105)(uint64_t);
  id v106;
  uint64_t v107;
  uint64_t *v108;
  uint64_t v109;
  uint64_t (*v110)(uint64_t, uint64_t);
  void (*v111)(uint64_t);
  id v112;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "queryTerms");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v89, "count");
  v8 = 0.0;
  if (!objc_msgSend(v5, "length") || !v7)
    goto LABEL_114;
  v87 = v5;
  v88 = v6;
  v107 = 0;
  v108 = &v107;
  v109 = 0x3032000000;
  v110 = __Block_byref_object_copy__7;
  v111 = __Block_byref_object_dispose__7;
  v112 = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v7);
  v112 = (id)objc_claimAutoreleasedReturnValue();
  v101 = 0;
  v102 = &v101;
  v103 = 0x3032000000;
  v104 = __Block_byref_object_copy__7;
  v105 = __Block_byref_object_dispose__7;
  v106 = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v7);
  v9 = 0;
  v106 = (id)objc_claimAutoreleasedReturnValue();
  do
  {
    objc_msgSend((id)v108[5], "insertObject:atIndex:", &unk_1E6E98220, v9);
    objc_msgSend((id)v102[5], "insertObject:atIndex:", &unk_1E6E9A300, v9++);
  }
  while (v7 != v9);
  v99 = 0;
  v100 = 0;
  v97 = 0;
  v98 = 0;
  v96 = 0;
  +[PRSRankingItem tokenizeURLString:removeTLD:hostTokenCount:hostLength:pathLength:queryLength:fragmentLength:](PRSRankingItem, "tokenizeURLString:removeTLD:hostTokenCount:hostLength:pathLength:queryLength:fragmentLength:", v5, 1, &v100, &v98, &v99, &v97, &v96);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0.0;
  if (!v98 || !v100)
    goto LABEL_113;
  v90[0] = MEMORY[0x1E0C809B0];
  v90[1] = 3221225472;
  v90[2] = __61__PRSRankingItem_Scoring__matchScoreURLString_withEvaluator___block_invoke;
  v90[3] = &unk_1E6E45828;
  v94 = v7;
  v11 = v89;
  v91 = v11;
  v92 = &v107;
  v95 = v100;
  v93 = &v101;
  objc_msgSend(v6, "evaluateAttribute:ignoreSubtokens:strongCompounds:skipTranscriptions:withHandler:", v10, 1, 1, 0, v90);
  objc_msgSend((id)v108[5], "objectAtIndexedSubscript:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "intValue");

  v14 = v13 != -1;
  v15 = v100;
  v16 = v13 < (int)v100 && v13 != -1;
  v86 = v10;
  if (v7 < 2)
  {
    v84 = 0;
  }
  else
  {
    v17 = 1;
    v18 = 1;
    while (v17 < objc_msgSend((id)v108[5], "count"))
    {
      objc_msgSend((id)v108[5], "objectAtIndexedSubscript:", v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "intValue");

      if (v20 == -1 || v13 != -1 && v20 - v13 != 1)
        v18 = 0;
      v14 += v20 >= 0;
      if (v20 < (int)v100)
        ++v16;
      ++v17;
      v13 = v20;
    }
    v84 = v18 & 1;
    v15 = v100;
  }
  v21 = 0;
  v22 = 0;
  v23 = 0;
  v24 = (double)v98 + (double)v99 * 0.6;
  v25 = (float)v98 / v24;
  v26 = (float)v16 / (float)v15;
  v27 = 0.0;
  do
  {
    objc_msgSend((id)v102[5], "objectAtIndexedSubscript:", v21);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "floatValue");
    v30 = v29;

    objc_msgSend((id)v108[5], "objectAtIndexedSubscript:", v21);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "intValue");

    objc_msgSend(v11, "objectAtIndexedSubscript:", v21);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "composedLength");

    if ((v32 & 0x80000000) == 0 && v32 < (int)v100)
    {
      if (!v32 && (v34 > 2 || v100 == 1))
      {
        v35 = v30;
        if (v30 > 0.94)
          goto LABEL_29;
        v37 = v35 > 0.27 && v34 > 2;
        if (v37 || (v35 > 0.24 ? (v38 = v34 > 3) : (v38 = 0), v38 || v35 > 0.2 && v34 > 4 || v35 > 0.1 && v34 >= 6))
        {
          v30 = (v35 + 1.0) * 0.95 * 0.5;
          goto LABEL_29;
        }
      }
      if ((v23 & 1) == 0)
      {
        v23 = 0;
        *(float *)&v35 = v26 * v30;
LABEL_41:
        v30 = v25 * *(float *)&v35;
        v22 = 1;
        goto LABEL_42;
      }
LABEL_29:
      v35 = v30 * 0.9;
      *(float *)&v35 = v35;
      if (v100 <= 1)
        *(float *)&v35 = v30;
      if ((float)((float)(v99 + v98) / (float)(v96 + v97 + v99 + v98)) < 0.2 || v96 + v97 + v99 >= 0x29)
      {
        v35 = *(float *)&v35 * 0.3;
        *(float *)&v35 = v35;
      }
      v23 = 1;
      goto LABEL_41;
    }
    if (v32 >= (int)v100 && v99 != 0)
    {
      *(float *)&v35 = (float)v34 / (float)v99;
      v30 = v30 * *(float *)&v35;
    }
LABEL_42:
    v27 = v27 + v30;
    ++v21;
  }
  while (v7 != v21);
  v39 = (float)v7;
  if ((v84 & 1) != 0)
  {
    if ((float)(v27 + v27) >= v39)
      v40 = (float)v7;
    else
      v40 = v27 + v27;
    objc_msgSend(v88, "queryString");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "composedLength");
    v43 = (float)v42 / (float)(unint64_t)objc_msgSend(v86, "length");

    LODWORD(v35) = 1.0;
    if (v43 <= 1.0)
      *(float *)&v35 = v43;
    v27 = v40 * *(float *)&v35;
  }
  else if ((v22 & 1) == 0)
  {
    v35 = v27 * 0.4;
    v27 = v35;
  }
  v44 = v98;
  v45 = v99;
  v47 = v96;
  v46 = v97;
  v48 = v27 / v39;
  if (v14 >= v7)
  {
    v35 = v48;
    if (v48 >= 0.2)
    {
      v6 = v88;
      v10 = v86;
      goto LABEL_111;
    }
  }
  objc_msgSend(v88, "queryString", v35);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "lowercaseString");
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v86, "lowercaseString");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = (float)v44 / (float)(v45 + v44 + v46 + v47);
  v6 = v88;
  v10 = v86;
  if (objc_msgSend(v50, "rangeOfString:", CFSTR(" ")) == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_73:
    v85 = v51;
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v87);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "host");
    v56 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v56, "hasCommonSubDomainPrefix"))
    {
      objc_msgSend(v88, "queryString");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = objc_msgSend(v57, "hasCommonSubDomainPrefix");

      if ((v58 & 1) == 0)
      {
        objc_msgSend(v56, "componentsSeparatedByString:", CFSTR("."));
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = (void *)objc_msgSend(v59, "mutableCopy");

        if ((unint64_t)objc_msgSend(v60, "count") >= 3)
        {
          objc_msgSend(v60, "objectAtIndexedSubscript:", 0);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          v62 = objc_msgSend(v61, "length");

          if (v62 <= 4)
          {
            objc_msgSend(v60, "removeObjectAtIndex:", 0);
            objc_msgSend(v60, "componentsJoinedByString:", CFSTR("."));
            v63 = objc_claimAutoreleasedReturnValue();

            v56 = (void *)v63;
          }
        }

      }
    }
    v65 = objc_msgSend(v56, "rangeOfString:", v50);
    if (v65 == 0x7FFFFFFFFFFFFFFFLL || (v66 = v64, !objc_msgSend(v56, "length")))
    {
      objc_msgSend(v87, "lowercaseString");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v69, "rangeOfString:", v50) == 0x7FFFFFFFFFFFFFFFLL || (v71 = v70, !objc_msgSend(v69, "length")))
      {
        +[PRSRankingItem tokenizeURLString:removeTLD:hostTokenCount:hostLength:pathLength:queryLength:fragmentLength:](PRSRankingItem, "tokenizeURLString:removeTLD:hostTokenCount:hostLength:pathLength:queryLength:fragmentLength:", v87, 0, &v100, &v98, &v99, &v97, &v96);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v74, "rangeOfString:", v50) == 0x7FFFFFFFFFFFFFFFLL
          || (v76 = v75, !objc_msgSend(v74, "length")))
        {
          v73 = v14 < v7;
          v8 = 0.0;
        }
        else
        {
          v77 = objc_msgSend(v74, "length");
          if ((float)((float)v76 / (float)v77) <= 0.3)
            v8 = (float)v76 / (float)v77;
          else
            v8 = 1.0;
          v73 = 1;
        }

      }
      else
      {
        v72 = objc_msgSend(v69, "length");
        if ((float)((float)v71 / (float)v72) <= 0.6)
          v8 = (float)v71 / (float)v72;
        else
          v8 = 1.0;
        v73 = 1;
      }

    }
    else
    {
      v67 = (float)v66 / (float)(unint64_t)objc_msgSend(v56, "length");
      if (v65 || (v68 = 1.0, v67 <= 0.5) && objc_msgSend(v50, "rangeOfString:", CFSTR(".")) == 0x7FFFFFFFFFFFFFFFLL)
        v68 = v67 * 0.3;
      if (v52 >= 0.3)
        v82 = v25;
      else
        v82 = v52;
      v48 = v82 * v68;
      v73 = 1;
      v8 = v82 * v68;
    }

    if (!v73)
LABEL_111:
      v8 = v48;
  }
  else
  {
    objc_msgSend(v50, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_1E6E549F0);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v51, "rangeOfString:", v53))
    {

      goto LABEL_73;
    }
    v78 = v54;
    v79 = objc_msgSend(v51, "length");
    v80 = 0.95;
    if (v78 == v79)
      v80 = 1.0;
    if (v52 >= 0.3)
      v81 = v25;
    else
      v81 = v52;
    v8 = v81 * v80;

  }
  v5 = v87;
LABEL_113:

  _Block_object_dispose(&v101, 8);
  _Block_object_dispose(&v107, 8);

LABEL_114:
  return v8;
}

void __61__PRSRankingItem_Scoring__matchScoreURLString_withEvaluator___block_invoke(uint64_t a1, char a2, uint64_t a3, unint64_t a4, uint64_t a5, unint64_t a6, unint64_t a7)
{
  unint64_t v10;
  void *v12;
  int v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v21;
  float v22;
  void *v23;
  int v24;
  void *v25;
  int v26;
  void *v27;
  int v28;
  void *v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  id v38;

  v10 = *(_QWORD *)(a1 + 56) - 1;
  if ((a2 & 7) == 1 && v10 == a6)
  {
    if (a4)
    {
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a6);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (float)(unint64_t)objc_msgSend(v21, "composedLength") / (float)a4;

      if (v22 > 1.0)
        v22 = 1.0;
    }
    else
    {
      v22 = 0.0;
    }
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "objectAtIndexedSubscript:", a6);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "intValue");

    if (v24 != -1)
    {
      if (!a6)
        return;
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "objectAtIndexedSubscript:", a6);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "intValue");
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "objectAtIndexedSubscript:", a6 - 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v26 - objc_msgSend(v27, "intValue");

      if (v28 == 1)
        return;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a7);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:atIndexedSubscript:", v34, a6);

      v31 = (void *)MEMORY[0x1E0CB37E8];
      goto LABEL_24;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a7);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:atIndexedSubscript:", v29, a6);

    if (*(_QWORD *)(a1 + 64) <= a7)
    {
      v31 = (void *)MEMORY[0x1E0CB37E8];
      v32 = v22;
      v33 = 0.7;
    }
    else
    {
      v31 = (void *)MEMORY[0x1E0CB37E8];
      if (!a7)
      {
LABEL_24:
        *(float *)&v30 = v22;
        objc_msgSend(v31, "numberWithFloat:", v30);
        v35 = objc_claimAutoreleasedReturnValue();
LABEL_30:
        v38 = (id)v35;
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setObject:atIndexedSubscript:", v35, a6);

        return;
      }
      v32 = v22;
      v33 = 0.95;
    }
    objc_msgSend(v31, "numberWithDouble:", v32 * v33);
    v35 = objc_claimAutoreleasedReturnValue();
    goto LABEL_30;
  }
  if ((a2 & 7) == 3 && v10 > a6)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "objectAtIndexedSubscript:", a6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "intValue");

    if (v13 == -1)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a7);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:atIndexedSubscript:", v36, a6);

      if (*(_QWORD *)(a1 + 64) <= a7)
      {
        v19 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
        v37 = &unk_1E6E9A310;
        goto LABEL_33;
      }
      v19 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      if (a7)
      {
        v37 = &unk_1E6E9A280;
LABEL_33:
        objc_msgSend(v19, "setObject:atIndexedSubscript:", v37, a6);
        return;
      }
LABEL_31:
      v37 = &unk_1E6E9A320;
      goto LABEL_33;
    }
    if (a6)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "objectAtIndexedSubscript:", a6);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "intValue");
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "objectAtIndexedSubscript:", a6 - 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v15 - objc_msgSend(v16, "intValue");

      if (v17 != 1)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a7);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:atIndexedSubscript:", v18, a6);

        v19 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
        goto LABEL_31;
      }
    }
  }
}

+ (float)matchScoreLaunchString:(id)a3 withEvaluator:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  float v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  float *v21;
  uint64_t v22;
  int v23;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "queryTerms");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");
  v10 = 0.0;
  if (objc_msgSend(v6, "length"))
  {
    if (v9)
    {
      if (!objc_msgSend(v6, "length"))
        goto LABEL_6;
      objc_msgSend(v7, "queryString");
      v11 = objc_claimAutoreleasedReturnValue();
      if (!v11
        || (v12 = (void *)v11,
            objc_msgSend(v7, "queryString"),
            v13 = (void *)objc_claimAutoreleasedReturnValue(),
            v14 = objc_msgSend(v6, "isEqualToString:", v13),
            v13,
            v12,
            v10 = 1.0,
            (v14 & 1) == 0))
      {
LABEL_6:
        v20 = 0;
        v21 = (float *)&v20;
        v22 = 0x2020000000;
        v23 = 0;
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __64__PRSRankingItem_Scoring__matchScoreLaunchString_withEvaluator___block_invoke;
        v16[3] = &unk_1E6E45850;
        v18 = &v20;
        v19 = v9;
        v17 = v8;
        objc_msgSend(a1, "matchScoreTokensFromText:withEvaluator:withHandler:", v6, v7, v16);
        v10 = fminf(v21[6], 1.0);

        _Block_object_dispose(&v20, 8);
      }
    }
  }

  return v10;
}

void __64__PRSRankingItem_Scoring__matchScoreLaunchString_withEvaluator___block_invoke(uint64_t a1, void *a2, unint64_t a3, int a4, float a5, uint64_t a6, uint64_t a7, unint64_t a8)
{
  id v13;
  uint64_t v14;
  void *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  void *v20;
  unint64_t v21;
  double v22;
  void *v23;
  unint64_t v24;
  float v25;
  unint64_t v26;
  uint64_t v27;
  float v28;
  id v29;

  v13 = a2;
  if (*(_QWORD *)(a1 + 48) > a8)
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    goto LABEL_21;
  }
  v29 = v13;
  if (objc_msgSend(v13, "count"))
  {
    v14 = 0;
    while (1)
    {
      objc_msgSend(v29, "objectAtIndexedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "intValue");

      if ((_DWORD)v14 != v16)
        break;
      if (++v14 >= (unint64_t)objc_msgSend(v29, "count"))
        goto LABEL_7;
    }
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    goto LABEL_20;
  }
LABEL_7:
  v17 = *(_QWORD *)(a1 + 48);
  if (v17 == a3 && vabds_f32(a5, (float)a3) < 2.2204e-16)
  {
    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v19 = 1065353216;
LABEL_18:
    *(_DWORD *)(v18 + 24) = v19;
LABEL_20:
    v13 = v29;
    goto LABEL_21;
  }
  if (a3 == 1 && v17 == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "composedLength");

    if (a5 >= 0.75 || a5 >= 0.5 && v21 || (v22 = a5, a5 >= 0.4) && v21 >= 2)
    {
      v18 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v19 = 1065017672;
      goto LABEL_18;
    }
    if (v22 >= 0.1)
    {
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "composedLength");

      if (v24 >= 3)
      {
        v25 = fmin((v22 + 1.0) * 0.5, 0.98);
        *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v25;
        goto LABEL_20;
      }
    }
  }
  v26 = *(_QWORD *)(a1 + 48);
  if (v26 <= a3)
    v26 = a3;
  *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a5 / (float)v26;
  v13 = v29;
  if (a4)
  {
    v27 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v28 = *(float *)(v27 + 24) + *(float *)(v27 + 24);
    if (v28 >= 0.99)
      v28 = 0.99;
    *(float *)(v27 + 24) = v28;
  }
LABEL_21:

}

- (float)matchScoreAppName:(id)a3 withEvaluator:(id)a4
{
  id v6;
  id v7;
  float v8;
  float v9;
  double v10;
  float v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  float v20;
  float v21;
  void *v22;
  void *v23;
  void *v24;
  float v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  float v36;
  float v37;
  float v38;
  void *v39;
  float v40;
  float v41;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[PRSRankingItem matchScoreAppName:withEvaluator:matchOption:](self, "matchScoreAppName:withEvaluator:matchOption:", v6, v7, 2);
  v9 = v8;
  v10 = v8;
  if (v8 < 0.95)
  {
    -[PRSRankingItem matchScoreAppName:withEvaluator:matchOption:](self, "matchScoreAppName:withEvaluator:matchOption:", v6, v7, 0);
    if (v9 < v11)
      v9 = v11;
    v10 = v9;
  }
  if (v10 < 0.8)
  {
    objc_msgSend(v7, "queryString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "rangeOfString:", CFSTR(" "));

    if (v13 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v7, "queryString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "lowercaseString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_1E6E549F0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = objc_alloc(MEMORY[0x1E0CA6AB8]);
      objc_msgSend(v7, "language");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v17, "initWithQuery:language:fuzzyThreshold:options:", v16, v18, 0, 0);

      -[PRSRankingItem matchScoreAppName:withEvaluator:matchOption:](self, "matchScoreAppName:withEvaluator:matchOption:", v6, v19, 2);
      if (v9 < v20)
        v9 = v20;
      v10 = v9;
      if (v9 < 0.95)
      {
        -[PRSRankingItem matchScoreAppName:withEvaluator:matchOption:](self, "matchScoreAppName:withEvaluator:matchOption:", v6, v19, 0);
        if (v9 < v21)
          v9 = v21;
        v10 = v9;
      }

    }
  }
  if (v10 < 0.8)
  {
    +[PRSRankingItem tokenizeTitleString:](PRSRankingItem, "tokenizeTitleString:", v6);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v22, "rangeOfString:", CFSTR(" ")) != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v22, "componentsSeparatedByString:", CFSTR(" "));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v23, "count") >= 2)
      {
        objc_msgSend(v23, "componentsJoinedByString:", &stru_1E6E549F0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[PRSRankingItem matchScoreAppName:withEvaluator:matchOption:](self, "matchScoreAppName:withEvaluator:matchOption:", v24, v7, 0);
        if (v9 < v25)
          v9 = v25;

        v10 = v9;
      }

    }
  }
  if (v10 < 0.8)
  {
    objc_msgSend(v6, "componentsSeparatedByString:", CFSTR(" "));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "queryString");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "stringByTrimmingCharactersInSet:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v30 = v26;
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v44;
      while (2)
      {
        for (i = 0; i != v32; ++i)
        {
          if (*(_QWORD *)v44 != v33)
            objc_enumerationMutation(v30);
          v35 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
          v36 = (float)(unint64_t)objc_msgSend(v29, "length", (_QWORD)v43);
          if ((float)(v36 / (float)(unint64_t)objc_msgSend(v6, "length")) <= 0.38)
          {
            if (!objc_msgSend(v35, "localizedCaseInsensitiveContainsString:", v29))
              continue;
            v37 = (float)(unint64_t)objc_msgSend(v29, "length");
            if ((float)(v37 / (float)(unint64_t)objc_msgSend(v35, "length")) <= 0.38
              && !objc_msgSend(v35, "hasSpecialAppPrefix"))
            {
              continue;
            }
          }
          -[PRSRankingItem matchScoreAppName:withEvaluator:matchOption:](self, "matchScoreAppName:withEvaluator:matchOption:", v6, v7, 8);
          if (v9 < v38)
            v9 = v38;
          v10 = v9;
          goto LABEL_38;
        }
        v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
        if (v32)
          continue;
        break;
      }
    }
LABEL_38:

  }
  if (v10 < 0.8 && (unint64_t)objc_msgSend(v6, "length") >= 3)
  {
    if (objc_msgSend(v6, "containsString:", CFSTR("&")))
    {
      objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR("&"), &stru_1E6E549F0);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRSRankingItem matchScoreAppName:withEvaluator:matchOption:](self, "matchScoreAppName:withEvaluator:matchOption:", v39, v7, 8);
      v41 = v40;

      if (v9 < v41)
        v9 = v41;
    }
  }

  return v9;
}

- (float)matchScoreAppName:(id)a3 withEvaluator:(id)a4 matchOption:(unsigned __int8)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  float v15;
  _QWORD v17[4];
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  float *v23;
  uint64_t v24;
  int v25;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v8, "queryTerms");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");
  v11 = v7;
  v12 = v11;
  v13 = v11;
  if ((a5 & 8) == 0)
  {
    objc_msgSend(v11, "lowercaseString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if ((a5 & 2) != 0)
  {
    +[PRSRankingItem tokenizeTitleString:](PRSRankingItem, "tokenizeTitleString:", v13);
    v14 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)v14;
  }
  v15 = 0.0;
  if (objc_msgSend(v13, "length") && v10)
  {
    v22 = 0;
    v23 = (float *)&v22;
    v24 = 0x2020000000;
    v25 = 0;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __71__PRSRankingItem_Scoring__matchScoreAppName_withEvaluator_matchOption___block_invoke;
    v17[3] = &unk_1E6E45878;
    v20 = &v22;
    v21 = v10;
    v18 = v12;
    v19 = v8;
    +[PRSRankingItem matchScoreTokensFromText:withEvaluator:withHandler:](PRSRankingItem, "matchScoreTokensFromText:withEvaluator:withHandler:", v13, v19, v17);
    v15 = v23[6];

    _Block_object_dispose(&v22, 8);
  }

  return v15;
}

void __71__PRSRankingItem_Scoring__matchScoreAppName_withEvaluator_matchOption___block_invoke(uint64_t a1, void *a2, unint64_t a3, int a4, int a5, int a6, unint64_t a7, float a8)
{
  id v15;
  unint64_t v16;
  uint64_t v17;
  float v18;
  uint64_t v19;
  float v20;
  int v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  id v28;

  v15 = a2;
  v16 = *(_QWORD *)(a1 + 56);
  if (v16 > a7)
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    goto LABEL_26;
  }
  if (v16 == 1)
  {
    if (a5)
    {
      if (a3 == 1 && a8 == 1.0)
      {
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1065353216;
        goto LABEL_26;
      }
      v28 = v15;
      v22 = *(void **)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "queryString");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "rangeOfString:options:", v23, 393);
      v26 = v25;

      if (v24 || !v26)
        v27 = 1064849900;
      else
        v27 = 1065017672;
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v27;
      v15 = v28;
    }
    else
    {
      if (a6)
        v21 = 1063675494;
      else
        v21 = 1060320051;
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v21;
    }
    if (a3 < 8)
      goto LABEL_26;
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v20 = *(float *)(v19 + 24) / (float)(a3 - 7);
LABEL_25:
    *(float *)(v19 + 24) = v20;
    goto LABEL_26;
  }
  if (v16 <= a3)
    v16 = a3;
  *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a8 / (float)v16;
  if (a5)
  {
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v18 = fmin(*(float *)(v17 + 24) + 0.2, 1.0);
    *(float *)(v17 + 24) = v18;
  }
  if (a4)
  {
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v20 = fmin(*(float *)(v19 + 24) * 1.5, 1.0);
    goto LABEL_25;
  }
LABEL_26:

}

- (float)matchScoreContactsName:(id)a3 withEvaluator:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  float v10;
  BOOL v11;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  float *v18;
  uint64_t v19;
  int v20;
  uint64_t v21;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "queryTerms");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");
  v21 = 0;
  +[PRSRankingItem tokenizeContactsName:tokenCount:](PRSRankingItem, "tokenizeContactsName:tokenCount:", v5, &v21);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0.0;
  if (objc_msgSend(v9, "length"))
    v11 = v8 == 0;
  else
    v11 = 1;
  if (!v11)
  {
    v17 = 0;
    v18 = (float *)&v17;
    v19 = 0x2020000000;
    v20 = 0;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __64__PRSRankingItem_Scoring__matchScoreContactsName_withEvaluator___block_invoke;
    v13[3] = &unk_1E6E45850;
    v15 = &v17;
    v16 = v8;
    v14 = v7;
    +[PRSRankingItem matchScoreTokensFromText:withEvaluator:withHandler:](PRSRankingItem, "matchScoreTokensFromText:withEvaluator:withHandler:", v9, v6, v13);
    v10 = fminf(v18[6], 1.0);

    _Block_object_dispose(&v17, 8);
  }

  return v10;
}

void __64__PRSRankingItem_Scoring__matchScoreContactsName_withEvaluator___block_invoke(uint64_t a1, void *a2, unint64_t a3, int a4, int a5, int a6, unint64_t a7, float a8)
{
  id v15;
  unint64_t v16;
  uint64_t v17;
  int v18;
  void *v19;
  unint64_t v20;
  void *v21;
  unint64_t v22;
  float v23;
  uint64_t v24;
  float v25;
  double v26;
  float v27;
  int v28;
  uint64_t v29;
  float v30;
  id v31;

  v15 = a2;
  v16 = *(_QWORD *)(a1 + 48);
  if (v16 > a7)
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    goto LABEL_36;
  }
  if (vabds_f32(a8, (float)a3) < 2.2204e-16)
  {
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v18 = 1065353216;
LABEL_5:
    *(_DWORD *)(v17 + 24) = v18;
    goto LABEL_36;
  }
  if (a7 < 2)
  {
    if ((a5 & 1) == 0 && !a6)
      goto LABEL_22;
    if (a8 <= 0.4)
      goto LABEL_17;
    v31 = v15;
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "composedLength");
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "containsCJK") ? 2 : 4;

    v15 = v31;
    if (v20 >= v22)
    {
      if (a8 == 1.0)
        v28 = 1065017672;
      else
        v28 = 1064849900;
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v28;
      if (!a6)
        goto LABEL_34;
    }
    else
    {
LABEL_17:
      v23 = a8 * 0.95;
      *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v23;
      if (!a6)
      {
LABEL_34:
        v24 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v25 = fminf(*(float *)(v24 + 24), 1.0);
LABEL_35:
        *(float *)(v24 + 24) = v25;
        goto LABEL_36;
      }
    }
    if ((a5 & 1) == 0)
    {
      v29 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v30 = *(float *)(v29 + 24) + -0.001;
      *(float *)(v29 + 24) = v30;
    }
    goto LABEL_34;
  }
  if (a5 && a6)
  {
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v18 = 1065185444;
    goto LABEL_5;
  }
  if ((a5 | a6) == 1 && v16 <= 3)
  {
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v18 = 1065017672;
    goto LABEL_5;
  }
LABEL_22:
  if (v16 <= a3)
    v16 = a3;
  *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a8 / (float)v16;
  if (a4)
  {
    v24 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v25 = *(float *)(v24 + 24);
    v26 = fmin((float)(v25 + v25), 0.99);
    if (v26 > v25)
    {
      v27 = v26;
      v25 = v27;
    }
    goto LABEL_35;
  }
LABEL_36:

}

- (float)matchScoreContactsEmailAddress:(id)a3 withEvaluator:(id)a4
{
  id v5;
  id v6;
  void *v7;
  unint64_t v8;
  float v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  int v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char v23;
  void *v24;
  int v25;
  uint64_t v26;
  char v27;
  float v28;
  float v29;
  float v30;
  float v31;
  void *v32;
  float v33;
  float v34;
  void *v35;
  int v36;
  void *v37;
  unint64_t v38;
  double v39;
  BOOL v41;
  BOOL v42;
  BOOL v43;
  float v44;
  float v45;
  float v46;
  void *v47;
  unint64_t v48;
  float v49;
  float v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  unint64_t v55;
  unint64_t v56;
  void *v57;
  unint64_t v58;
  unint64_t v59;
  unint64_t v60;
  float v61;
  uint64_t v62;
  _BOOL4 v63;
  void *v64;
  id v65;
  unint64_t v66;
  unint64_t v67;
  unint64_t v68;
  float v69;
  uint64_t v70;
  unint64_t v71;
  double v73;
  char v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  id v80;
  _QWORD v81[4];
  id v82;
  uint64_t *v83;
  uint64_t *v84;
  unint64_t v85;
  unint64_t v86;
  uint64_t v87;
  id v88;
  unint64_t v89;
  unint64_t v90;
  unint64_t v91;
  uint64_t v92;
  uint64_t *v93;
  uint64_t v94;
  uint64_t (*v95)(uint64_t, uint64_t);
  void (*v96)(uint64_t);
  id v97;
  uint64_t v98;
  uint64_t *v99;
  uint64_t v100;
  uint64_t (*v101)(uint64_t, uint64_t);
  void (*v102)(uint64_t);
  id v103;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "queryTerms");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");
  v9 = 0.0;
  if (!objc_msgSend(v5, "length") || !v8)
    goto LABEL_95;
  v76 = v7;
  v77 = v6;
  v98 = 0;
  v99 = &v98;
  v100 = 0x3032000000;
  v101 = __Block_byref_object_copy__7;
  v102 = __Block_byref_object_dispose__7;
  v103 = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v8);
  v103 = (id)objc_claimAutoreleasedReturnValue();
  v92 = 0;
  v93 = &v92;
  v94 = 0x3032000000;
  v95 = __Block_byref_object_copy__7;
  v96 = __Block_byref_object_dispose__7;
  v97 = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v8);
  v10 = 0;
  v97 = (id)objc_claimAutoreleasedReturnValue();
  do
  {
    objc_msgSend((id)v99[5], "insertObject:atIndex:", &unk_1E6E98220, v10);
    objc_msgSend((id)v93[5], "insertObject:atIndex:", &unk_1E6E9A300, v10++);
  }
  while (v8 != v10);
  v90 = 0;
  v91 = 0;
  v88 = 0;
  v89 = 0;
  +[PRSRankingItem tokenizeContactsEmailAddress:removeTLD:usernameTokenCount:usernameLength:domainLength:username:](PRSRankingItem, "tokenizeContactsEmailAddress:removeTLD:usernameTokenCount:usernameLength:domainLength:username:", v5, 1, &v91, &v90, &v89, &v88);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v88;
  v12 = objc_msgSend(v5, "length");
  v13 = objc_msgSend(v11, "length");
  v75 = v11;
  v9 = 0.0;
  if (!v90 || !v91)
    goto LABEL_94;
  v14 = v7;
  v15 = v12 + ~v13;
  v81[0] = MEMORY[0x1E0C809B0];
  v81[1] = 3221225472;
  v81[2] = __72__PRSRankingItem_Scoring__matchScoreContactsEmailAddress_withEvaluator___block_invoke;
  v81[3] = &unk_1E6E458A0;
  v85 = v8;
  v16 = v14;
  v82 = v16;
  v83 = &v98;
  v86 = v91;
  v87 = v15;
  v84 = &v92;
  objc_msgSend(v6, "evaluateAttribute:ignoreSubtokens:strongCompounds:skipTranscriptions:withHandler:", v79, 1, 1, 0, v81);
  objc_msgSend((id)v99[5], "objectAtIndexedSubscript:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "intValue");

  v19 = v18 != -1;
  v20 = v91;
  v21 = v18 < (int)v91 && v18 != -1;
  if (v8 < 2)
  {
    v74 = 0;
  }
  else
  {
    v22 = 1;
    v23 = 1;
    while (v22 < objc_msgSend((id)v99[5], "count"))
    {
      objc_msgSend((id)v99[5], "objectAtIndexedSubscript:", v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "intValue");

      if (v25 == -1 || v18 != -1 && v25 - v18 != 1)
        v23 = 0;
      v19 += v25 >= 0;
      if (v25 < (int)v91)
        ++v21;
      ++v22;
      v18 = v25;
    }
    v74 = v23 & 1;
    v20 = v91;
  }
  v26 = 0;
  v27 = 0;
  v73 = 0.7;
  v28 = (double)v90 + (double)v89 * 0.7;
  v29 = (float)v90 / v28;
  v30 = (float)v21 / (float)v20;
  v31 = 0.0;
  do
  {
    objc_msgSend((id)v93[5], "objectAtIndexedSubscript:", v26, *(_QWORD *)&v73);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "floatValue");
    v34 = v33;

    objc_msgSend((id)v99[5], "objectAtIndexedSubscript:", v26);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "intValue");

    objc_msgSend(v16, "objectAtIndexedSubscript:", v26);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "composedLength");

    if ((v36 & 0x80000000) == 0 && v36 < (int)v91)
    {
      if (!v36)
      {
        v39 = v34;
        if (v34 > 0.94)
          goto LABEL_51;
        v41 = v39 > 0.39 && v38 > 1;
        if (v41
          || (v39 > 0.27 ? (v42 = v38 > 2) : (v42 = 0),
              v42 || (v39 > 0.24 ? (v43 = v38 > 3) : (v43 = 0), v43 || v39 > 0.2 && v38 > 4 || v39 > 0.1 && v38 >= 6)))
        {
          v39 = (v39 + 1.0) * 0.95 * 0.5;
          v34 = v39;
          goto LABEL_51;
        }
      }
      if ((v27 & 1) == 0)
      {
        v27 = 0;
        v34 = v30 * v34;
LABEL_54:
        v44 = (float)v38 / (float)v90;
        if (v44 >= 0.5)
          v44 = 1.0;
        *(float *)&v39 = v44 * v34;
        v34 = v29 * *(float *)&v39;
        goto LABEL_57;
      }
LABEL_51:
      if (v91 >= 2)
      {
        v39 = v34 * 0.9;
        v34 = v39;
      }
      v27 = 1;
      goto LABEL_54;
    }
    if (v36 >= (int)v91 && v89 != 0)
    {
      *(float *)&v39 = (float)v38 / (float)v89;
      v34 = v34 * *(float *)&v39;
    }
LABEL_57:
    v31 = v31 + v34;
    ++v26;
  }
  while (v8 != v26);
  if ((v74 & 1) != 0)
  {
    v45 = (float)v8;
    if ((float)(v31 + v31) >= (float)v8)
      v46 = (float)v8;
    else
      v46 = v31 + v31;
    v6 = v77;
    objc_msgSend(v77, "queryString");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v47, "composedLength");
    v49 = (float)v48 / (float)(unint64_t)objc_msgSend(v79, "length");

    LODWORD(v39) = 1.0;
    if (v49 <= 1.0)
      *(float *)&v39 = v49;
    v31 = v46 * *(float *)&v39;
  }
  else
  {
    v45 = (float)v8;
    v6 = v77;
  }
  v50 = v31 / v45;
  if (v19 >= v8)
  {
    v39 = v50;
    if (v50 >= 0.05)
    {
LABEL_68:
      v9 = v50;
      goto LABEL_93;
    }
  }
  objc_msgSend(v6, "queryString", v39);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "lowercaseString");
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v79, "lowercaseString");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v52, "rangeOfString:", CFSTR(" ")) == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_72:
    if (objc_msgSend(v75, "rangeOfString:", v52) != 0x7FFFFFFFFFFFFFFFLL)
    {
      v56 = v55;
      if (objc_msgSend(v75, "length"))
      {
        v9 = (float)((float)v56 / (float)(unint64_t)objc_msgSend(v75, "length")) * 0.4 * v29;
        goto LABEL_92;
      }
    }
    objc_msgSend(v5, "lowercaseString");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = objc_msgSend(v57, "rangeOfString:", v52);
    if (v59 == 0x7FFFFFFFFFFFFFFFLL || (v60 = v58, !objc_msgSend(v57, "length")))
    {
      v80 = v75;
      +[PRSRankingItem tokenizeContactsEmailAddress:removeTLD:usernameTokenCount:usernameLength:domainLength:username:](PRSRankingItem, "tokenizeContactsEmailAddress:removeTLD:usernameTokenCount:usernameLength:domainLength:username:", v5, 0, &v91, &v90, &v89, &v80);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = v80;

      v67 = objc_msgSend(v64, "rangeOfString:", v52);
      if (v67 == 0x7FFFFFFFFFFFFFFFLL || (v68 = v66, !objc_msgSend(v64, "length")))
      {
        v63 = v19 < v8;
        v9 = 0.0;
      }
      else
      {
        v69 = (float)(unint64_t)objc_msgSend(v64, "length");
        if (v67 > objc_msgSend(v65, "length"))
        {
          v70 = objc_msgSend(v64, "length");
          v69 = v69 + (float)(unint64_t)(v70 + ~objc_msgSend(v65, "length"));
        }
        v9 = (float)v68 / v69;
        v63 = 1;
      }

      v75 = v65;
    }
    else
    {
      v61 = (float)(unint64_t)objc_msgSend(v57, "length");
      if (v59 > objc_msgSend(v75, "length"))
      {
        v62 = objc_msgSend(v57, "length");
        v61 = v61 + (float)(unint64_t)(v62 + ~objc_msgSend(v75, "length"));
      }
      v9 = (float)v60 / v61;
      v63 = 1;
    }

    if (!v63)
      goto LABEL_68;
  }
  else
  {
    objc_msgSend(v52, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_1E6E549F0);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v78, "rangeOfString:", v53))
    {

      goto LABEL_72;
    }
    v9 = 1.0;
    if (v54 != objc_msgSend(v78, "length"))
    {
      v71 = objc_msgSend(v53, "length");
      v9 = v29 * v73 * fmin((float)((float)v71 / (float)v90), 1.0);
    }

LABEL_92:
  }
LABEL_93:

  v7 = v76;
LABEL_94:

  _Block_object_dispose(&v92, 8);
  _Block_object_dispose(&v98, 8);

LABEL_95:
  return v9;
}

void __72__PRSRankingItem_Scoring__matchScoreContactsEmailAddress_withEvaluator___block_invoke(uint64_t a1, char a2, uint64_t a3, unint64_t a4, uint64_t a5, unint64_t a6, unint64_t a7)
{
  unint64_t v10;
  void *v12;
  int v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  float v23;
  void *v24;
  int v25;
  void *v26;
  int v27;
  void *v28;
  int v29;
  void *v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  double v39;
  void *v40;
  float v41;
  float v42;
  id v43;

  v10 = *(_QWORD *)(a1 + 56) - 1;
  if ((a2 & 7) == 1 && v10 == a6)
  {
    if (a4)
    {
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a6);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (float)(unint64_t)objc_msgSend(v22, "composedLength") / (float)a4;

      if (v23 > 1.0)
        v23 = 1.0;
    }
    else
    {
      v23 = 0.0;
    }
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "objectAtIndexedSubscript:", a6);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "intValue");

    if (v25 != -1)
    {
      if (!a6)
        return;
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "objectAtIndexedSubscript:", a6);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "intValue");
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "objectAtIndexedSubscript:", a6 - 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v27 - objc_msgSend(v28, "intValue");

      if (v29 == 1)
        return;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a7);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:atIndexedSubscript:", v35, a6);

      v32 = (void *)MEMORY[0x1E0CB37E8];
      goto LABEL_24;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a7);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:atIndexedSubscript:", v30, a6);

    if (*(_QWORD *)(a1 + 64) <= a7)
    {
      if (*(_QWORD *)(a1 + 72))
      {
        objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a6);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (float)(unint64_t)objc_msgSend(v38, "composedLength")
            / (float)(unint64_t)(2 * *(_QWORD *)(a1 + 72));

        if (v23 > 1.0)
          v23 = 1.0;
      }
      v32 = (void *)MEMORY[0x1E0CB37E8];
      v33 = v23;
      v34 = 0.5;
    }
    else
    {
      v32 = (void *)MEMORY[0x1E0CB37E8];
      if (!a7)
      {
LABEL_24:
        *(float *)&v31 = v23;
        objc_msgSend(v32, "numberWithFloat:", v31);
        v36 = objc_claimAutoreleasedReturnValue();
LABEL_43:
        v43 = (id)v36;
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setObject:atIndexedSubscript:", v36, a6);

        return;
      }
      v33 = v23;
      v34 = 0.95;
    }
    v39 = v33 * v34;
LABEL_42:
    objc_msgSend(v32, "numberWithDouble:", v39);
    v36 = objc_claimAutoreleasedReturnValue();
    goto LABEL_43;
  }
  if ((a2 & 7) != 3 || v10 <= a6)
    return;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "objectAtIndexedSubscript:", a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "intValue");

  if (v13 == -1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a7);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:atIndexedSubscript:", v37, a6);

    if (*(_QWORD *)(a1 + 64) > a7)
    {
      if (a7)
        v20 = &unk_1E6E9A280;
      else
        v20 = &unk_1E6E9A320;
      v19 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      goto LABEL_30;
    }
    if (*(_QWORD *)(a1 + 72))
    {
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a6);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = (float)(unint64_t)objc_msgSend(v40, "composedLength")
          / (float)(unint64_t)(2 * *(_QWORD *)(a1 + 72));

      v42 = 1.0;
      if (v41 <= 1.0)
        v42 = v41;
      v39 = v42 * 0.5;
    }
    else
    {
      v39 = 0.0;
    }
    v32 = (void *)MEMORY[0x1E0CB37E8];
    goto LABEL_42;
  }
  if (a6)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "objectAtIndexedSubscript:", a6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "intValue");
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "objectAtIndexedSubscript:", a6 - 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v15 - objc_msgSend(v16, "intValue");

    if (v17 != 1)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a7);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:atIndexedSubscript:", v18, a6);

      v19 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      v20 = &unk_1E6E9A320;
LABEL_30:
      objc_msgSend(v19, "setObject:atIndexedSubscript:", v20, a6);
    }
  }
}

- (float)matchScoreFileName:(id)a3 withEvaluator:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  float v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  double v14;
  _QWORD v16[6];
  uint64_t v17;
  float *v18;
  uint64_t v19;
  int v20;
  _QWORD v21[6];
  uint64_t v22;
  float *v23;
  uint64_t v24;
  int v25;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "queryTerms");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");
  if ((objc_msgSend(v7, "containsObject:", CFSTR("keynote")) & 1) != 0
    || (objc_msgSend(v7, "containsObject:", CFSTR("document")) & 1) != 0
    || (objc_msgSend(v7, "containsObject:", CFSTR("file")) & 1) != 0
    || (objc_msgSend(v7, "containsObject:", CFSTR("keynotes")) & 1) != 0
    || (objc_msgSend(v7, "containsObject:", CFSTR("documents")) & 1) != 0
    || objc_msgSend(v7, "containsObject:", CFSTR("files")))
  {
    --v8;
  }
  v9 = 0.0;
  if (objc_msgSend(v5, "length") && v8)
  {
    +[PRSRankingItem tokenizeTitleString:](PRSRankingItem, "tokenizeTitleString:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    v23 = (float *)&v22;
    v24 = 0x2020000000;
    v25 = 0;
    v11 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __60__PRSRankingItem_Scoring__matchScoreFileName_withEvaluator___block_invoke;
    v21[3] = &unk_1E6E458C8;
    v21[4] = &v22;
    v21[5] = v8;
    +[PRSRankingItem matchScoreTokensFromText:withEvaluator:withHandler:](PRSRankingItem, "matchScoreTokensFromText:withEvaluator:withHandler:", v10, v6, v21);
    v9 = v23[6];
    if (fabs(v9 + -1.0) >= 2.22044605e-16)
    {
      objc_msgSend(v5, "stringByDeletingPathExtension");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[PRSRankingItem tokenizeTitleString:](PRSRankingItem, "tokenizeTitleString:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v13, "isEqualToString:", v10))
      {
        v9 = v23[6];
      }
      else
      {
        v17 = 0;
        v18 = (float *)&v17;
        v19 = 0x2020000000;
        v20 = 0;
        v16[0] = v11;
        v16[1] = 3221225472;
        v16[2] = __60__PRSRankingItem_Scoring__matchScoreFileName_withEvaluator___block_invoke_2;
        v16[3] = &unk_1E6E458C8;
        v16[4] = &v17;
        v16[5] = v8;
        +[PRSRankingItem matchScoreTokensFromText:withEvaluator:withHandler:](PRSRankingItem, "matchScoreTokensFromText:withEvaluator:withHandler:", v13, v6, v16);
        v14 = v18[6] * 0.9;
        if (v14 <= v23[6])
          v9 = v23[6];
        else
          v9 = v14;
        _Block_object_dispose(&v17, 8);
      }

    }
    _Block_object_dispose(&v22, 8);

  }
  return v9;
}

float __60__PRSRankingItem_Scoring__matchScoreFileName_withEvaluator___block_invoke(uint64_t a1, float result, uint64_t a3, unint64_t a4, int a5, uint64_t a6, uint64_t a7, unint64_t a8)
{
  unint64_t v8;
  double v9;
  double v10;
  uint64_t v11;

  v8 = *(_QWORD *)(a1 + 40);
  if (v8 <= a8)
  {
    v9 = result;
    v10 = fmin((double)a4, 4.0);
    if (v10 <= (double)v8)
      v10 = (double)v8;
    result = v9 / v10;
    *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (a5)
    {
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      result = fmin(*(float *)(v11 + 24) * 1.2, 1.0);
      *(float *)(v11 + 24) = result;
    }
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  }
  return result;
}

float __60__PRSRankingItem_Scoring__matchScoreFileName_withEvaluator___block_invoke_2(uint64_t a1, float result, uint64_t a3, unint64_t a4, int a5, uint64_t a6, uint64_t a7, unint64_t a8)
{
  unint64_t v8;
  double v9;
  double v10;
  uint64_t v11;

  v8 = *(_QWORD *)(a1 + 40);
  if (v8 <= a8)
  {
    v9 = result;
    v10 = fmin((double)a4, 4.0);
    if (v10 <= (double)v8)
      v10 = (double)v8;
    result = v9 / v10;
    *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (a5)
    {
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      result = fmin(*(float *)(v11 + 24) * 1.2, 1.0);
      *(float *)(v11 + 24) = result;
    }
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  }
  return result;
}

- (float)matchScoreTitle:(id)a3 withEvaluator:(id)a4
{
  id v6;
  id v7;
  float v8;
  float v9;
  void *v10;
  uint64_t v11;
  float v12;

  v6 = a3;
  v7 = a4;
  -[PRSRankingItem matchScoreTitle:withEvaluator:matchOption:](self, "matchScoreTitle:withEvaluator:matchOption:", v6, v7, 2);
  v9 = v8;
  if (v8 < 0.1)
  {
    objc_msgSend(v7, "queryString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "rangeOfCharacterFromSet:", removeCharsTitle);

    if (v11 != 0x7FFFFFFFFFFFFFFFLL)
    {
      -[PRSRankingItem matchScoreTitle:withEvaluator:matchOption:](self, "matchScoreTitle:withEvaluator:matchOption:", v6, v7, 0);
      if (v9 < v12)
        v9 = v12;
    }
  }

  return v9;
}

- (float)matchScoreTitle:(id)a3 withEvaluator:(id)a4 matchOption:(unsigned __int8)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  float v13;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  uint64_t v18;
  unsigned __int8 v19;
  uint64_t v20;
  float *v21;
  uint64_t v22;
  int v23;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v8, "queryTerms");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");
  v11 = v7;
  v12 = v11;
  if ((a5 & 2) != 0)
  {
    +[PRSRankingItem tokenizeTitleString:](PRSRankingItem, "tokenizeTitleString:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v13 = 0.0;
  if (objc_msgSend(v12, "length") && v10)
  {
    v20 = 0;
    v21 = (float *)&v20;
    v22 = 0x2020000000;
    v23 = 0;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __69__PRSRankingItem_Scoring__matchScoreTitle_withEvaluator_matchOption___block_invoke;
    v15[3] = &unk_1E6E458F0;
    v17 = &v20;
    v18 = v10;
    v19 = a5;
    v16 = v12;
    +[PRSRankingItem matchScoreTokensFromText:withEvaluator:withHandler:](PRSRankingItem, "matchScoreTokensFromText:withEvaluator:withHandler:", v16, v8, v15);
    v13 = v21[6];

    _Block_object_dispose(&v20, 8);
  }

  return v13;
}

void __69__PRSRankingItem_Scoring__matchScoreTitle_withEvaluator_matchOption___block_invoke(uint64_t a1, void *a2, unint64_t a3, int a4, float a5, uint64_t a6, uint64_t a7, unint64_t a8)
{
  id v13;
  unint64_t v14;
  float v15;
  double v16;
  uint64_t v17;
  float v18;
  id v19;

  v13 = a2;
  v14 = *(_QWORD *)(a1 + 48);
  if (v14 > a8)
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    goto LABEL_17;
  }
  if (a3 > 0xA || (*(_BYTE *)(a1 + 56) & 4) != 0)
  {
    if (v14 <= a3)
      v14 = a3;
    v15 = a5 / (float)v14;
    goto LABEL_15;
  }
  if ((*(_BYTE *)(a1 + 56) & 2) != 0)
    goto LABEL_12;
  v19 = v13;
  if ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "composedLength") <= 0x32)
  {
    v14 = *(_QWORD *)(a1 + 48);
    v13 = v19;
LABEL_12:
    v16 = fmin((double)a3, 4.0);
    if (v16 <= (double)v14)
      v16 = (double)v14;
    v15 = a5 / v16;
    goto LABEL_15;
  }
  v15 = a5 * 0.1;
  v13 = v19;
LABEL_15:
  *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v15;
  if (a4)
  {
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v18 = fmin(*(float *)(v17 + 24) * 1.4, 1.0);
    *(float *)(v17 + 24) = v18;
  }
LABEL_17:

}

- (float)matchScoreSettings:(id)a3 withEvaluator:(id)a4 matchOption:(unsigned __int8)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  float v11;
  id v12;
  uint64_t v13;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  float *v22;
  uint64_t v23;
  int v24;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v8, "queryTerms");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");
  v11 = 0.0;
  if (objc_msgSend(v7, "length") && v10)
  {
    v12 = v7;
    if ((a5 & 2) != 0)
    {
      +[PRSRankingItem tokenizeTitleString:](PRSRankingItem, "tokenizeTitleString:", v12);
      v13 = objc_claimAutoreleasedReturnValue();

      v12 = (id)v13;
    }
    if (objc_msgSend(v12, "length"))
    {
      v21 = 0;
      v22 = (float *)&v21;
      v23 = 0x2020000000;
      v24 = 0;
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __72__PRSRankingItem_Scoring__matchScoreSettings_withEvaluator_matchOption___block_invoke;
      v15[3] = &unk_1E6E45918;
      v19 = &v21;
      v20 = v10;
      v16 = v8;
      v17 = v12;
      v18 = v9;
      +[PRSRankingItem matchScoreTokensFromText:withEvaluator:withHandler:](PRSRankingItem, "matchScoreTokensFromText:withEvaluator:withHandler:", v17, v16, v15);
      v11 = v22[6];

      _Block_object_dispose(&v21, 8);
    }

  }
  return v11;
}

void __72__PRSRankingItem_Scoring__matchScoreSettings_withEvaluator_matchOption___block_invoke(uint64_t a1, void *a2, unint64_t a3, int a4, int a5, int a6, unint64_t a7, float a8)
{
  id v14;
  unint64_t v15;
  unint64_t v16;
  void *v17;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  void *v23;
  unint64_t v24;
  void *v25;
  unint64_t v26;
  void *v27;
  unint64_t v28;
  uint64_t v30;
  int v31;
  int v32;
  uint64_t v33;
  float v34;
  id v36;

  v14 = a2;
  v15 = *(_QWORD *)(a1 + 64);
  if (v15 <= a3)
    v16 = a3;
  else
    v16 = *(_QWORD *)(a1 + 64);
  *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = a8 / (float)v16;
  v36 = v14;
  if (v15 > a7 || *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) < 0.1)
  {
    objc_msgSend(*(id *)(a1 + 32), "queryString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "lowercaseString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "rangeOfString:", v18);
    v20 = v19;
    if (objc_msgSend(*(id *)(a1 + 40), "rangeOfString:", CFSTR(" ")) == 0x7FFFFFFFFFFFFFFFLL)
    {
      v21 = 0;
      v22 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_1E6E549F0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v23, "rangeOfString:", v18);
      v21 = v24;

    }
    if (v22 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (objc_msgSend(v18, "rangeOfString:", CFSTR(" ")) == 0x7FFFFFFFFFFFFFFFLL)
      {
LABEL_15:

        v15 = *(_QWORD *)(a1 + 64);
        v14 = v36;
        goto LABEL_16;
      }
      objc_msgSend(v18, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_1E6E549F0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(*(id *)(a1 + 40), "rangeOfString:", v25);
      v21 = v26;

    }
    if (!v22 && v21 > v20)
    {
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1062836634;

      v14 = v36;
      goto LABEL_42;
    }
    goto LABEL_15;
  }
LABEL_16:
  if (v15 == 1 && *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) < 1.0)
  {
    objc_msgSend(*(id *)(a1 + 48), "objectAtIndexedSubscript:", 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "composedLength");

    if (a8 >= 0.2 || v28 > 2)
    {
      if (a5)
      {
        if (a3 != 1 || v28 < 3)
        {
          v14 = v36;
          if (v28 < 4)
            v32 = 1053609165;
          else
            v32 = 1059984507;
          *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v32;
          goto LABEL_40;
        }
        v30 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        v31 = 1060320051;
      }
      else
      {
        v30 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        if (a6)
        {
          if (v28 < 4)
            v31 = 1050253722;
          else
            v31 = 1058642330;
        }
        else if (v28 < 4)
        {
          v31 = 1045220557;
        }
        else
        {
          v31 = 1056964608;
        }
      }
      *(_DWORD *)(v30 + 24) = v31;
    }
    else
    {
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
    }
    v14 = v36;
  }
LABEL_40:
  if (a4)
  {
    v33 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v34 = fmin(*(float *)(v33 + 24) * 1.2, 1.0);
    *(float *)(v33 + 24) = v34;
  }
LABEL_42:

}

+ (void)matchScoreTokensFromText:(id)a3 withEvaluator:(id)a4 withHandler:(id)a5
{
  id v7;
  id v8;
  unint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  char v20;
  void *v21;
  BOOL v22;
  void *v23;
  BOOL v24;
  void *v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  void *v30;
  int v31;
  uint64_t v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  _QWORD v37[4];
  id v38;
  id v39;
  id v40;
  uint64_t *v41;
  uint64_t *v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  uint64_t v50;
  float *v51;
  uint64_t v52;
  int v53;

  v7 = a3;
  v8 = a4;
  v36 = a5;
  objc_msgSend(v8, "queryTerms");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v35, "count");
  v50 = 0;
  v51 = (float *)&v50;
  v52 = 0x2020000000;
  v53 = 0;
  v44 = 0;
  v45 = &v44;
  v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__7;
  v48 = __Block_byref_object_dispose__7;
  v49 = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v9);
  v49 = (id)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    for (i = 0; i != v9; ++i)
      objc_msgSend((id)v45[5], "insertObject:atIndex:", &unk_1E6E98220, i);
  }
  v11 = objc_msgSend(v7, "length");
  if (v9 && v11)
  {
    v34 = v7;
    objc_msgSend(v8, "language");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v8, "language");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v13, "hasPrefix:", CFSTR("zh")) & 1) != 0)
      {
        v14 = 0;
      }
      else
      {
        objc_msgSend(v8, "language");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v15, "hasPrefix:", CFSTR("ja")) & 1) != 0)
        {
          v14 = 0;
        }
        else
        {
          objc_msgSend(v8, "language");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v16, "hasPrefix:", CFSTR("ko")) ^ 1;

        }
      }

    }
    else
    {
      v14 = 1;
    }

    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __78__PRSRankingItem_Scoring__matchScoreTokensFromText_withEvaluator_withHandler___block_invoke;
    v37[3] = &unk_1E6E45940;
    v43 = v9;
    v41 = &v44;
    v38 = v8;
    v39 = v34;
    v42 = &v50;
    v40 = v35;
    v17 = objc_msgSend(v38, "evaluateAttribute:ignoreSubtokens:strongCompounds:skipTranscriptions:withHandler:", v39, v14, 1, 0, v37);
    v18 = 0;
    v19 = 0;
    v20 = 0;
    do
    {
      objc_msgSend((id)v45[5], "objectAtIndexedSubscript:", v18);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "intValue") == 0;

      objc_msgSend((id)v45[5], "objectAtIndexedSubscript:", v18);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v20 |= v22;
      v24 = objc_msgSend(v23, "intValue") + 1 == (_DWORD)v17;

      v19 |= v24;
      ++v18;
    }
    while (v9 != v18);
    objc_msgSend((id)v45[5], "objectAtIndexedSubscript:", 0);
    v7 = v34;
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "intValue");

    v27 = v26 != -1;
    if (v9 < 2)
    {
      v32 = 0;
    }
    else
    {
      v33 = v8;
      v28 = 1;
      v29 = 1;
      do
      {
        objc_msgSend((id)v45[5], "objectAtIndexedSubscript:", v28);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "intValue");

        if (v31 == -1 || v26 != -1 && v31 - v26 != 1)
          v29 = 0;
        v27 += v31 >= 0;
        ++v28;
        v26 = v31;
      }
      while (v9 != v28);
      v32 = v29 & 1;
      v8 = v33;
      v7 = v34;
    }
    (*((void (**)(id, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, uint64_t, float))v36 + 2))(v36, v45[5], v17, v32, v20 & 1, v19 & 1, v27, v51[6]);

  }
  else
  {
    (*((void (**)(id, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, float))v36 + 2))(v36, v45[5], 0, 0, 0, 0, 0, v51[6]);
  }
  _Block_object_dispose(&v44, 8);

  _Block_object_dispose(&v50, 8);
}

void __78__PRSRankingItem_Scoring__matchScoreTokensFromText_withEvaluator_withHandler___block_invoke(uint64_t a1, char a2, uint64_t a3, unint64_t a4, uint64_t a5, unint64_t a6, uint64_t a7)
{
  unint64_t v10;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;
  float v16;
  void *v18;
  int v19;
  int v20;
  void *v21;
  int v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  int v27;
  int v28;
  void *v29;
  int v30;
  void *v31;
  float v32;
  float v33;
  float v34;
  double v35;
  id v36;

  v10 = *(_QWORD *)(a1 + 72) - 1;
  if ((a2 & 7) == 1 && v10 == a6)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "objectAtIndexedSubscript:", a6);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "intValue");

    if (v19 == -1)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a7);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setObject:atIndexedSubscript:", v25, a6);

      objc_msgSend(*(id *)(a1 + 32), "queryString");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "containsCJK");
      v28 = objc_msgSend(*(id *)(a1 + 40), "containsCJK");

      if (v27 == v28)
      {
        objc_msgSend(*(id *)(a1 + 48), "objectAtIndexedSubscript:", a6);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = (float)(unint64_t)objc_msgSend(v31, "composedLength");
        v33 = (float)a4;
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "queryString");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "containsCJK");

        if (v30)
        {
          objc_msgSend(*(id *)(a1 + 48), "objectAtIndexedSubscript:", a6);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = (float)(unint64_t)objc_msgSend(v31, "composedLength");
          v33 = (float)a4 / 3.6;
        }
        else
        {
          if (!objc_msgSend(*(id *)(a1 + 40), "containsCJK"))
            return;
          objc_msgSend(*(id *)(a1 + 48), "objectAtIndexedSubscript:", a6);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = (float)(unint64_t)objc_msgSend(v31, "composedLength");
          v33 = (float)a4 * 3.6;
        }
      }
      v34 = v32 / v33;

      v35 = v34;
      if (v34 > 1.0)
        v35 = 1.0;
      v15 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v16 = v35 + *(float *)(v15 + 24);
      goto LABEL_24;
    }
  }
  else
  {
    if ((a2 & 7) != 3 || v10 <= a6)
      return;
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "objectAtIndexedSubscript:", a6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "intValue");

    if (v13 == -1)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a7);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setObject:atIndexedSubscript:", v14, a6);

      v15 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v16 = *(float *)(v15 + 24) + 1.0;
LABEL_24:
      *(float *)(v15 + 24) = v16;
      return;
    }
  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "objectAtIndexedSubscript:", a6);
  v36 = (id)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v36, "intValue");
  if (a6 && v20 != -1)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "objectAtIndexedSubscript:", a6);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "intValue");
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "objectAtIndexedSubscript:", a6 - 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v22 - objc_msgSend(v23, "intValue");

    if (v24 == 1)
      return;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a7);
    v36 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setObject:atIndexedSubscript:", v36, a6);
  }

}

- (float)matchScoreForApplicationsWithEvaluator:(id)a3
{
  id v4;
  void *v5;
  float v6;
  float v7;
  float v8;
  void *v9;
  uint64_t v10;
  void *v11;
  float v12;
  void *v13;
  double v14;
  void *v15;
  float v16;
  float v17;
  void *v18;
  void *v19;
  unint64_t v20;
  float v21;
  double v22;
  double v23;
  float v24;
  int v25;
  float v26;
  void *v27;
  float v28;
  id v29;
  void *v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  float v35;
  float v36;
  float v37;
  void *v38;
  void *v39;
  float v40;
  float v41;
  float v42;
  NSObject *v43;
  void *v44;
  void *v45;
  double v46;
  void *v47;
  id v48;
  void *v49;
  float v50;
  float v51;
  float v52;
  uint8_t buf[4];
  void *v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  double v59;
  __int16 v60;
  double v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SSCompactRankingAttrsGetValue((int8x8_t *)-[PRSRankingItem attributes](self, "attributes"), 7uLL);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0.0;
  v7 = 0.0;
  if (objc_msgSend(v5, "length"))
  {
    -[PRSRankingItem matchScoreAppName:withEvaluator:](self, "matchScoreAppName:withEvaluator:", v5, v4);
    v7 = v8;
  }
  -[PRSRankingItem firstMatchedAltName](self, "firstMatchedAltName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");

  if (v10)
  {
    objc_msgSend(v4, "queryString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (float)(unint64_t)objc_msgSend(v11, "length");
    -[PRSRankingItem firstMatchedAltName](self, "firstMatchedAltName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (float)(v12 / (float)(unint64_t)objc_msgSend(v13, "length"));

    -[PRSRankingItem firstMatchedAltName](self, "firstMatchedAltName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14 <= 0.1)
      -[PRSRankingItem matchScoreTitle:withEvaluator:matchOption:](self, "matchScoreTitle:withEvaluator:matchOption:", v15, v4, 0);
    else
      -[PRSRankingItem matchScoreAppName:withEvaluator:](self, "matchScoreAppName:withEvaluator:", v15, v4);
    v6 = v16;

    SSCompactRankingAttrsGetValue((int8x8_t *)-[PRSRankingItem attributes](self, "attributes"), 0x135uLL);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0.6;
    if (objc_msgSend(v5, "length"))
    {
      if (objc_msgSend(v5, "startCJK"))
      {
        if (objc_msgSend(v18, "length"))
        {
          objc_msgSend(v4, "queryString");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "composedLength");

          if (v20 >= 4)
          {
            -[PRSRankingItem matchScoreTitle:withEvaluator:matchOption:](self, "matchScoreTitle:withEvaluator:matchOption:", v18, v4, 0);
            v22 = v21;
            v23 = v22 * 0.4 + 0.600000024;
            if (v23 > 1.0)
              v23 = 1.0;
            v24 = v23;
            if (v22 >= 0.1)
              v17 = v24;
            else
              v17 = 0.6;
          }
        }
      }
    }

  }
  else
  {
    v17 = 0.6;
  }
  v25 = objc_msgSend(v4, "isCJK");
  if (v25)
    v26 = 0.59;
  else
    v26 = 0.2;
  if ((v25 & (v17 < 0.91)) != 0)
    v17 = 0.91;
  SSCompactRankingAttrsGetValue((int8x8_t *)-[PRSRankingItem attributes](self, "attributes"), 0x3FuLL);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0.0;
  if (v27)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v29 = v27;
      if ((unint64_t)objc_msgSend(v29, "composedLength") >= 2)
      {
        objc_msgSend(v29, "componentsSeparatedByString:", CFSTR(","));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v30, "count"))
        {
          v31 = objc_msgSend(v30, "count");
          v32 = v31 >= 0x1E ? 30 : v31;
          if (v32)
          {
            v33 = 0;
            while (1)
            {
              objc_msgSend(v30, "objectAtIndexedSubscript:", v33);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              if ((unint64_t)objc_msgSend(v34, "composedLength") >= 2
                && (!v5 || (objc_msgSend(v5, "localizedCaseInsensitiveContainsString:", v34) & 1) == 0))
              {
                -[PRSRankingItem matchScoreAppName:withEvaluator:matchOption:](self, "matchScoreAppName:withEvaluator:matchOption:", v34, v4, 0);
                if (v35 >= 1.0)
                  break;
              }

              if (v32 == ++v33)
                goto LABEL_39;
            }

            v28 = 1.0;
          }
        }
LABEL_39:

      }
    }
  }
  v36 = v6 * v17;
  if (v7 >= (float)(v6 * v17))
    v36 = v7;
  if (v36 >= (float)(v26 * v28))
    v37 = v36;
  else
    v37 = v26 * v28;
  if (SSEnableAppSearchV2())
  {
    objc_msgSend(v4, "queryString");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if ((isAppPrefixMatch() & 1) == 0 && v37 < 0.5)
    {
      objc_msgSend(v5, "lowercaseString");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "isCJK");
      appErrorScore();
      v41 = v40;

      if (v41 > 0.9)
      {
        -[PRSRankingItem setSpellCorrectedApp:](self, "setSpellCorrectedApp:", 1, v41);
        v42 = v41 + -0.5;
        if (v37 < v42)
          v37 = v42;
        SSGeneralLog();
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          SSRedactString(v38, 1);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          SSRedactString(v5, 1);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413058;
          v55 = v44;
          v56 = 2112;
          v57 = v45;
          v58 = 2048;
          v59 = v42;
          v60 = 2048;
          v61 = v37;
          _os_log_impl(&dword_1B86C5000, v43, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] <AppSpellCorrection> query: %@, app name: %@, matchScore: %f, finalScore = %f", buf, 0x2Au);

        }
      }
    }

  }
  v46 = v37;
  if (v37 < 0.1)
  {
    SSCompactRankingAttrsGetValue((int8x8_t *)-[PRSRankingItem attributes](self, "attributes", v46), 0x47uLL);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if (v47)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v48 = v47;
        if (objc_msgSend(v48, "length") && objc_msgSend(v5, "length"))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), v5, v48);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          -[PRSRankingItem matchScoreAppName:withEvaluator:matchOption:](self, "matchScoreAppName:withEvaluator:matchOption:", v49, v4, 2);
          if (v50 > 0.9)
            v37 = v50;

        }
      }
    }

  }
  *(float *)&v46 = v37;
  -[PRSRankingItem setKeywordMatchScore:](self, "setKeywordMatchScore:", v46);
  -[PRSRankingItem keywordMatchScore](self, "keywordMatchScore");
  v52 = v51;

  return v52;
}

- (float)matchScoreForContactsWithEvaluator:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  float v8;
  void *v9;
  uint64_t v10;
  void *v11;
  float v12;
  float v13;
  double v14;
  float v15;
  float v16;

  v4 = a3;
  SSCompactRankingAttrsGetValue((int8x8_t *)-[PRSRankingItem attributes](self, "attributes"), 7uLL);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0.0;
  v7 = 0.0;
  if (objc_msgSend(v5, "length"))
  {
    -[PRSRankingItem matchScoreContactsName:withEvaluator:](self, "matchScoreContactsName:withEvaluator:", v5, v4);
    v7 = v8;
  }
  -[PRSRankingItem firstMatchedAltName](self, "firstMatchedAltName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");

  if (v10)
  {
    -[PRSRankingItem firstMatchedAltName](self, "firstMatchedAltName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRSRankingItem matchScoreContactsName:withEvaluator:](self, "matchScoreContactsName:withEvaluator:", v11, v4);
    v13 = v12;

    v6 = v13 * 0.95;
  }
  if (v7 >= v6)
    v14 = v7;
  else
    v14 = v6;
  *(float *)&v14 = v14;
  -[PRSRankingItem setKeywordMatchScore:](self, "setKeywordMatchScore:", v14);
  -[PRSRankingItem keywordMatchScore](self, "keywordMatchScore");
  v16 = v15;

  return v16;
}

- (float)matchScoreForSafariWithEvaluator:(id)a3 quParsedEvaluator:(id)a4
{
  id v6;
  id v7;
  float v8;
  void *v9;
  int v10;
  float v11;
  void *v12;
  void *v13;
  float v14;
  float v15;
  float v16;
  double v17;
  void *v18;
  void *v19;
  float v20;
  float v21;
  uint64_t v23;

  v6 = a3;
  v7 = a4;
  v23 = 0;
  SSCompactRankingAttrsGetFloat((uint64_t)-[PRSRankingItem attributes](self, "attributes"), 0x10AuLL, (_DWORD *)&v23 + 1);
  SSCompactRankingAttrsGetFloat((uint64_t)-[PRSRankingItem attributes](self, "attributes"), 0x41uLL, &v23);
  v8 = *((float *)&v23 + 1);
  if (*((float *)&v23 + 1) < *(float *)&v23)
    v8 = *(float *)&v23;
  if (v8 > 0.0
    || (-[PRSRankingItem contentType](self, "contentType"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.safari.bookmark")),
        v9,
        v11 = 0.0,
        v10))
  {
    SSCompactRankingAttrsGetValue((int8x8_t *)-[PRSRankingItem attributes](self, "attributes"), 0xDuLL);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    SSCompactRankingAttrsGetValue((int8x8_t *)-[PRSRankingItem attributes](self, "attributes"), 0xCuLL);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0.0;
    v11 = 0.0;
    if (objc_msgSend(v12, "length"))
    {
      if (-[PRSRankingItem isSearchResultPage:](self, "isSearchResultPage:", v12))
      {
LABEL_16:

        goto LABEL_17;
      }
      -[PRSRankingItem matchScoreURLString:withEvaluator:](self, "matchScoreURLString:withEvaluator:", v12, v6);
      v11 = v15;
      if (v15 < 2.2204e-16)
      {
        -[PRSRankingItem matchScoreURLString:withEvaluator:](self, "matchScoreURLString:withEvaluator:", v12, v7);
        v11 = v16;
      }
    }
    if (objc_msgSend(v13, "length"))
    {
      -[PRSRankingItem matchScoreTitle:withEvaluator:](self, "matchScoreTitle:withEvaluator:", v13, v6);
      v14 = *(float *)&v17;
      if (*(float *)&v17 < 2.2204e-16)
      {
        -[PRSRankingItem matchScoreTitle:withEvaluator:](self, "matchScoreTitle:withEvaluator:", v13, v7);
        v14 = *(float *)&v17;
      }
    }
    if (v11 >= v14)
      *(float *)&v17 = v11;
    else
      *(float *)&v17 = v14;
    -[PRSRankingItem setKeywordMatchScore:](self, "setKeywordMatchScore:", v17);
    -[PRSRankingItem keywordMatchScore](self, "keywordMatchScore");
    -[PRSRankingItem embeddingSimilarity](self, "embeddingSimilarity");
    -[PRSRankingItem pommesL1Score](self, "pommesL1Score");
    -[PRSRankingItem bundleIDType](self, "bundleIDType");
    objc_msgSend(v6, "queryString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "language");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    chooseTopicality();
    v21 = v20;

    v11 = v21 * 0.8;
    goto LABEL_16;
  }
LABEL_17:

  return v11;
}

- (float)matchScoreForNotesWithEvaluator:(id)a3
{
  id v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  float v9;
  float v10;
  double v11;
  void *v12;
  uint64_t v13;
  double v14;
  void *v15;
  unint64_t v16;
  float v17;

  v4 = a3;
  SSCompactRankingAttrsGetValue((int8x8_t *)-[PRSRankingItem attributes](self, "attributes"), 7uLL);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
    -[PRSRankingItem matchScoreTitle:withEvaluator:](self, "matchScoreTitle:withEvaluator:", v5, v4);
  else
    LODWORD(v6) = 0;
  -[PRSRankingItem setKeywordMatchScore:](self, "setKeywordMatchScore:", v6);
  -[PRSRankingItem keywordMatchScore](self, "keywordMatchScore");
  -[PRSRankingItem embeddingSimilarity](self, "embeddingSimilarity");
  -[PRSRankingItem pommesL1Score](self, "pommesL1Score");
  -[PRSRankingItem bundleIDType](self, "bundleIDType");
  objc_msgSend(v4, "queryString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "language");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  chooseTopicality();
  v10 = v9;

  v11 = v10;
  if (v11 < 0.4)
    goto LABEL_9;
  objc_msgSend(v4, "queryTerms");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (v13 != 2)
  {
    objc_msgSend(v4, "queryTerms");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count");

    if (v16 > 2)
    {
      v14 = 0.9;
      goto LABEL_10;
    }
LABEL_9:
    v14 = 0.6;
    goto LABEL_10;
  }
  v14 = 0.8;
LABEL_10:
  v17 = v14 * v11;

  return v17;
}

- (float)matchScoreForFilesWithEvaluator:(id)a3 quParsedEvaluator:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  float v10;
  float v11;
  float v12;
  float v13;
  void *v14;
  int v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  float v20;
  float v21;
  double v22;
  void *v23;
  uint64_t v24;
  void *v25;
  _BOOL4 v26;

  v6 = a3;
  v7 = a4;
  SSCompactRankingAttrsGetValue((int8x8_t *)-[PRSRankingItem attributes](self, "attributes"), 0x35uLL);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "length"))
  {
    SSCompactRankingAttrsGetValue((int8x8_t *)-[PRSRankingItem attributes](self, "attributes"), 7uLL);
    v9 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v9;
  }
  -[PRSRankingItem matchScoreFileName:withEvaluator:](self, "matchScoreFileName:withEvaluator:", v8, v6);
  v11 = v10;
  if (v10 < 2.2204e-16)
  {
    -[PRSRankingItem matchScoreTitle:withEvaluator:matchOption:](self, "matchScoreTitle:withEvaluator:matchOption:", v8, v6, 0);
    v11 = v12;
    if (v7)
    {
      if (v12 == 0.0)
      {
        -[PRSRankingItem matchScoreTitle:withEvaluator:matchOption:](self, "matchScoreTitle:withEvaluator:matchOption:", v8, v7, 0);
        v11 = v13;
      }
    }
  }
  -[PRSRankingItem contentType](self, "contentType");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("public.folder"));

  v16 = 0.8;
  v17 = v11 * 0.8;
  *(float *)&v17 = v17;
  if (!v15)
    *(float *)&v17 = v11;
  -[PRSRankingItem setKeywordMatchScore:](self, "setKeywordMatchScore:", v17);
  -[PRSRankingItem keywordMatchScore](self, "keywordMatchScore");
  -[PRSRankingItem embeddingSimilarity](self, "embeddingSimilarity");
  -[PRSRankingItem pommesL1Score](self, "pommesL1Score");
  -[PRSRankingItem bundleIDType](self, "bundleIDType");
  objc_msgSend(v6, "queryString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "language");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  chooseTopicality();
  v21 = v20;

  v22 = v21;
  if (v22 >= 0.4)
  {
    objc_msgSend(v6, "queryTerms");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "count");

    if (v24 != 2)
    {
      objc_msgSend(v6, "queryTerms");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (unint64_t)objc_msgSend(v25, "count") > 2;

      v16 = dbl_1B87DF630[v26];
    }
  }
  else
  {
    v16 = 0.6;
  }

  return v16 * v22;
}

- (float)matchScoreForCalendarWithEvaluator:(id)a3 quParsedEvaluator:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  float v11;
  float v12;
  float v13;
  void *v14;
  uint64_t v15;
  float v16;
  float v17;
  float v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  unint64_t v23;
  void *v24;
  unint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  _BOOL4 v29;
  float v30;
  double v31;
  void *v32;
  void *v33;
  float v34;
  float v35;

  v6 = a3;
  v7 = a4;
  SSCompactRankingAttrsGetValue((int8x8_t *)-[PRSRankingItem attributes](self, "attributes"), 0xCuLL);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  SSCompactRankingAttrsGetValue((int8x8_t *)-[PRSRankingItem attributes](self, "attributes"), 5uLL);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  extractStringFromArray(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v8, "length"))
  {
    v12 = 0.0;
LABEL_8:
    SSCompactRankingAttrsGetValue((int8x8_t *)-[PRSRankingItem attributes](self, "attributes"), 0x14uLL);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "length"))
    {
      objc_msgSend(v8, "stringByAppendingFormat:", CFSTR(" %@"), v14);
      v15 = objc_claimAutoreleasedReturnValue();

      -[PRSRankingItem matchScoreTitle:withEvaluator:](self, "matchScoreTitle:withEvaluator:", v15, v6);
      v12 = v16;
      v8 = (void *)v15;
    }
    if (v7 && v12 < 2.2204e-16)
    {
      -[PRSRankingItem matchScoreTitle:withEvaluator:](self, "matchScoreTitle:withEvaluator:", v8, v7);
      v12 = v17;
    }
    v12 = v12 * 0.5;

    goto LABEL_14;
  }
  -[PRSRankingItem matchScoreTitle:withEvaluator:](self, "matchScoreTitle:withEvaluator:", v8, v6);
  v12 = v11;
  if (v7 && v11 < 2.2204e-16)
  {
    -[PRSRankingItem matchScoreTitle:withEvaluator:](self, "matchScoreTitle:withEvaluator:", v8, v7);
    v12 = v13;
  }
  if (v12 < 2.2204e-16)
    goto LABEL_8;
LABEL_14:
  if (objc_msgSend(v10, "length"))
  {
    -[PRSRankingItem matchScoreContactsName:withEvaluator:](self, "matchScoreContactsName:withEvaluator:", v10, v6);
    v19 = v18;
  }
  else
  {
    v19 = 0.0;
  }
  v20 = v12;
  if ((objc_msgSend(v8, "containsCJK") & 1) != 0)
  {
    if (v20 < 0.4)
    {
      v21 = 0.7;
    }
    else
    {
      objc_msgSend(v6, "queryTerms");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "count");

      if (v23 <= 2)
      {
        objc_msgSend(v6, "queryTerms");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "count");

        v21 = 0.85;
        if (v27 != 2)
          v21 = 0.75;
      }
      else
      {
        v21 = 0.95;
      }
    }
  }
  else if (v20 < 0.4)
  {
    v21 = 0.6;
  }
  else
  {
    objc_msgSend(v6, "queryTerms");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "count");

    if (v25 <= 2)
    {
      objc_msgSend(v6, "queryTerms");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "count") == 2;

      v21 = dbl_1B87DF640[v29];
    }
    else
    {
      v21 = 0.9;
    }
  }
  v30 = v21 * v20;
  v31 = fmin(v30 + v19 * 0.2, 1.0);
  *(float *)&v31 = v31;
  -[PRSRankingItem setKeywordMatchScore:](self, "setKeywordMatchScore:", v31);
  -[PRSRankingItem keywordMatchScore](self, "keywordMatchScore");
  -[PRSRankingItem embeddingSimilarity](self, "embeddingSimilarity");
  -[PRSRankingItem pommesL1Score](self, "pommesL1Score");
  -[PRSRankingItem bundleIDType](self, "bundleIDType");
  objc_msgSend(v6, "queryString");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "language");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  chooseTopicality();
  v35 = v34;

  return v35;
}

- (float)matchScoreForMailWithEvaluator:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  float v8;
  void *v9;
  void *v10;
  float v11;
  void *v12;
  void *v13;
  float v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  float v20;
  float v21;
  void *v22;
  unint64_t v23;
  float v24;
  void *v25;
  uint64_t v26;
  float v27;

  v4 = a3;
  SSCompactRankingAttrsGetValue((int8x8_t *)-[PRSRankingItem attributes](self, "attributes"), 4uLL);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0.0;
  v7 = 0.0;
  if (objc_msgSend(v5, "length"))
  {
    -[PRSRankingItem matchScoreTitle:withEvaluator:matchOption:](self, "matchScoreTitle:withEvaluator:matchOption:", v5, v4, 6);
    v7 = v8 * 0.55;
  }
  SSCompactRankingAttrsGetValue((int8x8_t *)-[PRSRankingItem attributes](self, "attributes"), 5uLL);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  extractStringFromArray(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "length"))
  {
    -[PRSRankingItem matchScoreContactsName:withEvaluator:](self, "matchScoreContactsName:withEvaluator:", v10, v4);
    v6 = v11 * 0.3;
  }
  SSCompactRankingAttrsGetValue((int8x8_t *)-[PRSRankingItem attributes](self, "attributes"), 0x23uLL);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  extractStringFromArray(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v13, "length"))
  {
    -[PRSRankingItem matchScoreContactsEmailAddress:withEvaluator:](self, "matchScoreContactsEmailAddress:withEvaluator:", v13, v4);
    v15 = v14 * 0.55;
  }
  else
  {
    v15 = 0.0;
  }
  if (v7 >= v6)
    v16 = v7;
  else
    v16 = v6;
  if (v15 < v16)
    v15 = v16;
  v17 = fmin(v15, 1.0);
  *(float *)&v17 = v17;
  -[PRSRankingItem setKeywordMatchScore:](self, "setKeywordMatchScore:", v17);
  -[PRSRankingItem keywordMatchScore](self, "keywordMatchScore");
  -[PRSRankingItem embeddingSimilarity](self, "embeddingSimilarity");
  -[PRSRankingItem pommesL1Score](self, "pommesL1Score");
  -[PRSRankingItem bundleIDType](self, "bundleIDType");
  objc_msgSend(v4, "queryString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "language");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  chooseTopicality();
  v21 = v20;

  objc_msgSend(v4, "queryTerms");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "count");

  if (v23 >= 2)
  {
    objc_msgSend(v4, "queryTerms");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "count");

    v24 = 0.8;
    if (v26 != 2)
      v24 = 1.0;
  }
  else
  {
    v24 = 0.6;
  }
  v27 = fminf(v21 * v24, 1.0);

  return v27;
}

- (float)matchScoreForMessagesWithEvaluator:(id)a3
{
  id v4;
  double v5;
  void *v6;
  void *v7;
  float v8;
  float v9;
  void *v10;
  unint64_t v11;
  float v12;
  void *v13;
  uint64_t v14;
  float v15;

  v4 = a3;
  LODWORD(v5) = 0;
  -[PRSRankingItem setKeywordMatchScore:](self, "setKeywordMatchScore:", v5);
  -[PRSRankingItem keywordMatchScore](self, "keywordMatchScore");
  -[PRSRankingItem embeddingSimilarity](self, "embeddingSimilarity");
  -[PRSRankingItem pommesL1Score](self, "pommesL1Score");
  -[PRSRankingItem bundleIDType](self, "bundleIDType");
  objc_msgSend(v4, "queryString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "language");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  chooseTopicality();
  v9 = v8;

  objc_msgSend(v4, "queryTerms");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11 >= 2)
  {
    objc_msgSend(v4, "queryTerms");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    v12 = 0.8;
    if (v14 != 2)
      v12 = 1.0;
  }
  else
  {
    v12 = 0.6;
  }
  v15 = fminf(v9 * v12, 1.0);

  return v15;
}

- (void)parsePreferenceIdentity:(id)a3 withHandler:(id)a4
{
  void (**v5)(id, __CFString *, __CFString *);
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v5 = (void (**)(id, __CFString *, __CFString *))a4;
  if ((unint64_t)objc_msgSend(v14, "length") > 0xB)
  {
    objc_msgSend(v14, "substringFromIndex:", 6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "componentsSeparatedByString:", CFSTR("root="));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "count") == 2
      && (objc_msgSend(v9, "objectAtIndexedSubscript:", 1),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v11 = objc_msgSend(v10, "length"),
          v10,
          v11))
    {
      objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "componentsSeparatedByString:", CFSTR("&path="));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v13, "count"))
      {
        objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)objc_msgSend(v13, "count") < 2)
        {
          v7 = &stru_1E6E549F0;
        }
        else
        {
          objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
          v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        v5[2](v5, v6, v7);
      }
      else
      {
        v6 = &stru_1E6E549F0;
        v5[2](v5, &stru_1E6E549F0, &stru_1E6E549F0);
        v7 = &stru_1E6E549F0;
      }

    }
    else
    {
      v6 = &stru_1E6E549F0;
      v5[2](v5, &stru_1E6E549F0, &stru_1E6E549F0);
      v7 = &stru_1E6E549F0;
    }

  }
  else
  {
    v6 = &stru_1E6E549F0;
    v5[2](v5, &stru_1E6E549F0, &stru_1E6E549F0);
    v7 = &stru_1E6E549F0;
  }

}

- (int)preferencePriorityFromIdentity:(id)a3
{
  id v4;
  int v5;
  int v6;

  v4 = a3;
  if (preferencePriorityFromIdentity__onceToken[0] != -1)
    dispatch_once(preferencePriorityFromIdentity__onceToken, &__block_literal_global_195);
  if (objc_msgSend(v4, "hasPrefix:", preferencePriorityFromIdentity__prefsString))
  {
    v5 = -[PRSRankingItem preferencePriorityFromIdentityWithPrefixPrefs:](self, "preferencePriorityFromIdentityWithPrefixPrefs:", v4);
  }
  else
  {
    if (!objc_msgSend(v4, "hasPrefix:", preferencePriorityFromIdentity__settingsNavigationString))
    {
      v6 = 6;
      goto LABEL_9;
    }
    v5 = -[PRSRankingItem preferencePriorityFromIdentityWithPrefixSettingsNavigation:](self, "preferencePriorityFromIdentityWithPrefixSettingsNavigation:", v4);
  }
  v6 = v5;
LABEL_9:

  return v6;
}

void __58__PRSRankingItem_Scoring__preferencePriorityFromIdentity___block_invoke()
{
  void *v0;
  void *v1;

  v0 = (void *)preferencePriorityFromIdentity__prefsString;
  preferencePriorityFromIdentity__prefsString = (uint64_t)CFSTR("prefs:");

  v1 = (void *)preferencePriorityFromIdentity__settingsNavigationString;
  preferencePriorityFromIdentity__settingsNavigationString = (uint64_t)CFSTR("settings-navigation://");

}

- (int)preferencePriorityFromIdentityWithPrefixPrefs:(id)a3
{
  id v4;
  int v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  int v11;

  v4 = a3;
  if (preferencePriorityFromIdentityWithPrefixPrefs__onceToken != -1)
    dispatch_once(&preferencePriorityFromIdentityWithPrefixPrefs__onceToken, &__block_literal_global_200);
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 6;
  if (objc_msgSend(v4, "length"))
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __73__PRSRankingItem_Scoring__preferencePriorityFromIdentityWithPrefixPrefs___block_invoke_2;
    v7[3] = &unk_1E6E459A8;
    v7[4] = &v8;
    -[PRSRankingItem parsePreferenceIdentity:withHandler:](self, "parsePreferenceIdentity:withHandler:", v4, v7);
  }
  v5 = *((_DWORD *)v9 + 6);
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __73__PRSRankingItem_Scoring__preferencePriorityFromIdentityWithPrefixPrefs___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("MOBILE_DATA_SETTINGS_ID"), CFSTR("DO_NOT_DISTURB"), CFSTR("ControlCenter"), CFSTR("BATTERY_USAGE"), CFSTR("DISPLAY"), CFSTR("Phone"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)preferencePriorityFromIdentityWithPrefixPrefs__setOfImportantFirstPrioritySettingRoots;
  preferencePriorityFromIdentityWithPrefixPrefs__setOfImportantFirstPrioritySettingRoots = v0;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("IBOOKS"), CFSTR("SHORTCUTS"), CFSTR("SOUND"), 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)preferencePriorityFromIdentityWithPrefixPrefs__setOfDemotedFirstPrioritySettingRoots;
  preferencePriorityFromIdentityWithPrefixPrefs__setOfDemotedFirstPrioritySettingRoots = v2;

}

void __73__PRSRankingItem_Scoring__preferencePriorityFromIdentityWithPrefixPrefs___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  id v16;

  v16 = a2;
  v5 = a3;
  if (objc_msgSend(v16, "length"))
  {
    if (objc_msgSend(v5, "length"))
    {
      if ((objc_msgSend(v16, "isEqualToString:", CFSTR("General")) & 1) != 0
        || objc_msgSend(v16, "isEqualToString:", CFSTR("APPLE_ACCOUNT")))
      {
        if ((objc_msgSend(v5, "containsString:", CFSTR("#")) & 1) == 0
          && !objc_msgSend(v5, "containsString:", CFSTR("/"))
          && (objc_msgSend(v5, "isEqualToString:", CFSTR("REGULATORY")) & 1) == 0
          && !objc_msgSend(v5, "isEqualToString:", CFSTR("LEGAL_AND_REGULATORY")))
        {
          v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
LABEL_31:
          v11 = 1;
          goto LABEL_17;
        }
        goto LABEL_16;
      }
      if (objc_msgSend(v5, "containsString:", CFSTR("#")))
      {
        v12 = objc_msgSend(v5, "containsString:", CFSTR("/"));
        v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
        if (v12)
          v11 = 6;
        else
          v11 = 5;
        goto LABEL_17;
      }
      v13 = objc_msgSend((id)preferencePriorityFromIdentityWithPrefixPrefs__setOfImportantFirstPrioritySettingRoots, "containsObject:", v16);
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      if (v13)
      {
        v11 = 2;
        goto LABEL_17;
      }
      goto LABEL_30;
    }
    if (!objc_msgSend(v16, "containsString:", CFSTR("#")))
    {
      if ((objc_msgSend(v16, "isEqualToString:", CFSTR("STORE")) & 1) != 0
        || (objc_msgSend(v16, "isEqualToString:", CFSTR("GAMECENTER")) & 1) != 0
        || objc_msgSend(v16, "isEqualToString:", CFSTR("WEATHER")))
      {
LABEL_16:
        v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
        v11 = 3;
LABEL_17:
        *(_DWORD *)(v6 + 24) = v11;
        goto LABEL_18;
      }
      v15 = objc_msgSend(v16, "isEqualToString:", CFSTR("EXPOSURE_NOTIFICATION"));
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      if (!v15)
        goto LABEL_31;
LABEL_30:
      v11 = 4;
      goto LABEL_17;
    }
    objc_msgSend(v16, "componentsSeparatedByString:", CFSTR("#"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v8, "isEqualToString:", CFSTR("ROOT")))
    {
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v10 = 1;
    }
    else if (objc_msgSend((id)preferencePriorityFromIdentityWithPrefixPrefs__setOfImportantFirstPrioritySettingRoots, "containsObject:", v8))
    {
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v10 = 2;
    }
    else
    {
      v14 = objc_msgSend((id)preferencePriorityFromIdentityWithPrefixPrefs__setOfDemotedFirstPrioritySettingRoots, "containsObject:", v8);
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      if (v14)
        v10 = 4;
      else
        v10 = 3;
    }
    *(_DWORD *)(v9 + 24) = v10;
    v16 = v8;
  }
LABEL_18:

}

- (int)preferencePriorityFromIdentityWithPrefixSettingsNavigation:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  unsigned int v12;
  int v13;
  void *v14;
  int v15;
  int v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  int v24;
  int v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  uint64_t v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (preferencePriorityFromIdentityWithPrefixSettingsNavigation__onceToken != -1)
    dispatch_once(&preferencePriorityFromIdentityWithPrefixSettingsNavigation__onceToken, &__block_literal_global_243);
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4
      && (objc_msgSend(v4, "scheme"), (v6 = objc_claimAutoreleasedReturnValue()) != 0)
      && (v7 = (void *)v6,
          objc_msgSend(v5, "host"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v8,
          v7,
          v8))
    {
      objc_msgSend(v5, "host");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "hasPrefix:", preferencePriorityFromIdentityWithPrefixSettingsNavigation__settingsURLPrefix)&& (v10 = objc_msgSend(v9, "length"), v10 > objc_msgSend((id)preferencePriorityFromIdentityWithPrefixSettingsNavigation__settingsURLPrefix, "length")))
      {
        objc_msgSend((id)preferencePriorityFromIdentityWithPrefixSettingsNavigation__hostPriorityOverrides, "objectForKey:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "intValue");
        if (v12 <= 1)
          v13 = 1;
        else
          v13 = v12;

        objc_msgSend(v5, "pathComponents");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "count");

        v16 = v15 - 2;
        if (v15 >= 2)
        {
          objc_msgSend(v5, "host");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "isEqualToString:", preferencePriorityFromIdentityWithPrefixSettingsNavigation__appSettingsPrefix);

          if (v18)
          {
            v19 = (void *)preferencePriorityFromIdentityWithPrefixSettingsNavigation__appPriorityOverrides;
            objc_msgSend(v5, "pathComponents");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "objectAtIndexedSubscript:", 1);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "objectForKey:", v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v22, "intValue");
            if (preferencePriorityFromIdentityWithPrefixSettingsNavigation__defaultAppPriority)
              v24 = 2;
            else
              v24 = 0;
            if (v23)
              v13 = v23;
            else
              v13 = v24;

          }
          else
          {
            v16 = v15 - 1;
          }
          v39 = 0u;
          v40 = 0u;
          v37 = 0u;
          v38 = 0u;
          objc_msgSend(v5, "pathComponents", 0);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
          if (v27)
          {
            v28 = v27;
            v29 = *(_QWORD *)v38;
            do
            {
              for (i = 0; i != v28; ++i)
              {
                if (*(_QWORD *)v38 != v29)
                  objc_enumerationMutation(v26);
                v16 -= objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * i), "isEqualToString:", CFSTR("root"));
              }
              v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
            }
            while (v28);
          }

          v13 += v16 & ~(v16 >> 31);
        }
        objc_msgSend(v5, "fragment");
        v31 = objc_claimAutoreleasedReturnValue();
        if (v31)
        {
          v32 = (void *)v31;
          objc_msgSend(v5, "fragment");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend(v33, "isEqualToString:", CFSTR("root")) ^ 1;

          v13 += v34;
        }
        objc_msgSend(v5, "query");
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        if (v35)
          v25 = v13 + 1;
        else
          v25 = v13;
      }
      else if (preferencePriorityFromIdentityWithPrefixSettingsNavigation__defaultPriority)
      {
        v25 = 6;
      }
      else
      {
        v25 = 0;
      }

    }
    else if (preferencePriorityFromIdentityWithPrefixSettingsNavigation__defaultPriority)
    {
      v25 = 6;
    }
    else
    {
      v25 = 0;
    }

  }
  else if (preferencePriorityFromIdentityWithPrefixSettingsNavigation__defaultPriority)
  {
    v25 = 6;
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

void __86__PRSRankingItem_Scoring__preferencePriorityFromIdentityWithPrefixSettingsNavigation___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;

  preferencePriorityFromIdentityWithPrefixSettingsNavigation__defaultPriority = 1;
  preferencePriorityFromIdentityWithPrefixSettingsNavigation__defaultAppPriority = 1;
  v0 = (void *)preferencePriorityFromIdentityWithPrefixSettingsNavigation__settingsURLPrefix;
  preferencePriorityFromIdentityWithPrefixSettingsNavigation__settingsURLPrefix = (uint64_t)CFSTR("com.apple.Settings.");

  v1 = (void *)preferencePriorityFromIdentityWithPrefixSettingsNavigation__appSettingsPrefix;
  preferencePriorityFromIdentityWithPrefixSettingsNavigation__appSettingsPrefix = (uint64_t)CFSTR("com.apple.Settings.Apps");

  v2 = (void *)preferencePriorityFromIdentityWithPrefixSettingsNavigation__appPriorityOverrides;
  v3 = MEMORY[0x1E0C9AA70];
  preferencePriorityFromIdentityWithPrefixSettingsNavigation__appPriorityOverrides = MEMORY[0x1E0C9AA70];

  v4 = (void *)preferencePriorityFromIdentityWithPrefixSettingsNavigation__hostPriorityOverrides;
  preferencePriorityFromIdentityWithPrefixSettingsNavigation__hostPriorityOverrides = v3;

}

- (float)matchScoreForPreferencesWithEvaluator:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  int v9;
  void *v10;
  uint64_t v11;
  float v12;
  float v13;

  v4 = a3;
  SSCompactRankingAttrsGetValue((int8x8_t *)-[PRSRankingItem attributes](self, "attributes"), 4uLL);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SSCompactRankingAttrsGetValue((int8x8_t *)-[PRSRankingItem attributes](self, "attributes"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  SSCompactRankingAttrsGetValue((int8x8_t *)-[PRSRankingItem attributes](self, "attributes"), 1uLL);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  if (objc_msgSend(v5, "length") && objc_msgSend(v7, "length"))
  {
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.systempreference.prefpane")))
    {
      -[PRSRankingItem identifier](self, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        -[PRSRankingItem identifier](self, "identifier");
        v11 = objc_claimAutoreleasedReturnValue();

        v7 = (void *)v11;
      }
    }
    -[PRSRankingItem matchScoreForPreferencesWithEvaluator:subject:preferenceType:preferenceId:](self, "matchScoreForPreferencesWithEvaluator:subject:preferenceType:preferenceId:", v4, v5, v6, v7);
    v9 = LODWORD(v8);
  }
  LODWORD(v8) = v9;
  -[PRSRankingItem setKeywordMatchScore:](self, "setKeywordMatchScore:", v8);
  -[PRSRankingItem keywordMatchScore](self, "keywordMatchScore");
  v13 = v12;

  return v13;
}

- (float)matchScoreForPreferencesWithEvaluator:(id)a3 subject:(id)a4 isFirstParty:(BOOL)a5 preferencePriority:(int)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  float v15;
  float v16;
  double v17;
  double v18;
  void *v19;
  unint64_t v20;

  v10 = a3;
  v11 = a4;
  if (objc_msgSend(v11, "length"))
  {
    objc_msgSend(v10, "queryString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("-&"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "rangeOfCharacterFromSet:", v13) == 0x7FFFFFFFFFFFFFFFLL;

    -[PRSRankingItem matchScoreSettings:withEvaluator:matchOption:](self, "matchScoreSettings:withEvaluator:matchOption:", v11, v10, (2 * v14));
    v16 = v15;
    if (v15 != 0.0)
    {
      if (a5)
      {
        switch(a6)
        {
          case 1:
            v17 = v15;
            v18 = 0.96;
            goto LABEL_18;
          case 2:
            v17 = v15;
            v18 = 0.8;
            goto LABEL_18;
          case 3:
            v17 = v15;
            if (v16 <= 0.95)
              goto LABEL_15;
            v18 = 0.61;
            goto LABEL_18;
          case 4:
            v17 = v15;
            if (v16 <= 0.95)
            {
              v18 = 0.4;
LABEL_18:
              v16 = v17 * v18;
            }
            else
            {
LABEL_15:
              v16 = v16 * 0.5;
            }
LABEL_19:
            objc_msgSend(v10, "queryString");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "length");

            if (v20 < 2)
              v16 = v16 * 0.25;
            break;
          case 5:
            v17 = v15;
            if (v16 <= 0.95)
              v18 = 0.3;
            else
              v18 = 0.45;
            goto LABEL_18;
          default:
            v16 = v15 / (float)a6;
            goto LABEL_19;
        }
      }
      else
      {
        v16 = v15 * 0.25;
      }
    }
  }
  else
  {
    v16 = 0.0;
  }

  return v16;
}

- (float)matchScoreForPreferencesWithEvaluator:(id)a3 subject:(id)a4 preferenceType:(id)a5 preferenceId:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  float v15;
  float v16;

  v10 = a5;
  v11 = a6;
  v12 = a4;
  v13 = a3;
  if ((objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.Preferences.firstParty")) & 1) != 0)
    v14 = 1;
  else
    v14 = objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.systempreference.prefpane"));
  -[PRSRankingItem setSettingsPreferencePriority:](self, "setSettingsPreferencePriority:", -[PRSRankingItem preferencePriorityFromIdentity:](self, "preferencePriorityFromIdentity:", v11));
  -[PRSRankingItem matchScoreForPreferencesWithEvaluator:subject:isFirstParty:preferencePriority:](self, "matchScoreForPreferencesWithEvaluator:subject:isFirstParty:preferencePriority:", v13, v12, v14, -[PRSRankingItem settingsPreferencePriority](self, "settingsPreferencePriority"));
  v16 = v15;

  return v16;
}

- (int)shortcutPriorityFromIdentifier:(id)a3
{
  uint64_t v3;
  id v4;
  int v5;
  int v6;

  v3 = shortcutPriorityFromIdentifier__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&shortcutPriorityFromIdentifier__onceToken, &__block_literal_global_256);
  if (objc_msgSend(0, "containsObject:", v4))
    v5 = -1;
  else
    v5 = 2;
  v6 = objc_msgSend((id)shortcutPriorityFromIdentifier__setOfFirstPriority, "containsObject:", v4);

  if (v6)
    return 1;
  else
    return v5;
}

void __58__PRSRankingItem_Scoring__shortcutPriorityFromIdentifier___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("is.workflow.actions.dnd.set.com.apple.donotdisturb.mode.default.toggle"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)shortcutPriorityFromIdentifier__setOfFirstPriority;
  shortcutPriorityFromIdentifier__setOfFirstPriority = v0;

}

- (float)matchScoreForShortcutsSettingWithEvaluator:(id)a3 name:(id)a4 preferencePriority:(int)a5
{
  id v8;
  id v9;
  float v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  float v14;
  double v15;

  v8 = a3;
  v9 = a4;
  v10 = 0.0;
  if (objc_msgSend(v9, "length"))
  {
    objc_msgSend(v8, "queryString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("-&"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "rangeOfCharacterFromSet:", v12) == 0x7FFFFFFFFFFFFFFFLL;

    -[PRSRankingItem matchScoreSettings:withEvaluator:matchOption:](self, "matchScoreSettings:withEvaluator:matchOption:", v9, v8, (2 * v13));
    v10 = v14;
    if (v14 >= 2.2204e-16)
    {
      if (a5 == -1)
      {
        v10 = 0.0;
      }
      else if (a5 != 2)
      {
        if (a5 == 1)
        {
          v15 = v14 * 1.1;
          if (v15 > 1.0)
            v15 = 1.0;
          v10 = v15;
        }
        else
        {
          v10 = v14 * 0.5;
        }
      }
    }
  }

  return v10;
}

- (float)matchScoreForShortcutsAppWithEvaluator:(id)a3
{
  id v4;
  void *v5;
  float v6;
  float v7;
  float v8;
  void *v9;
  uint64_t v10;
  void *v11;
  float v12;
  float v13;
  void *v14;
  unint64_t v15;
  float v16;

  v4 = a3;
  SSCompactRankingAttrsGetValue((int8x8_t *)-[PRSRankingItem attributes](self, "attributes"), 7uLL);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0.0;
  v7 = 0.0;
  if (objc_msgSend(v5, "length"))
  {
    -[PRSRankingItem matchScoreTitle:withEvaluator:](self, "matchScoreTitle:withEvaluator:", v5, v4);
    v7 = v8;
  }
  -[PRSRankingItem firstMatchedAltName](self, "firstMatchedAltName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");

  if (v10)
  {
    -[PRSRankingItem firstMatchedAltName](self, "firstMatchedAltName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRSRankingItem matchScoreTitle:withEvaluator:](self, "matchScoreTitle:withEvaluator:", v11, v4);
    v6 = v12;

  }
  if (v7 >= (float)(v6 * 0.6))
    v13 = v7;
  else
    v13 = v6 * 0.6;
  if (v7 < 1.0 && v6 < 1.0)
  {
    objc_msgSend(v4, "queryString", 1.0, v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "composedLength");

    v16 = 0.2;
    if (v13 < 0.2)
      v16 = v13;
    if (v15 < 4)
      v13 = v16;
  }

  return v13;
}

- (float)matchScoreForShortcutsWithEvaluator:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  float v10;
  float v11;
  float v12;
  double v13;
  float v14;
  float v15;
  int v17;
  float v18;
  uint64_t v19;
  void *v20;
  unint64_t v21;
  void *v22;
  void *v23;
  int v24;
  double v25;
  void *v26;
  unint64_t v27;

  v4 = a3;
  SSCompactRankingAttrsGetValue((int8x8_t *)-[PRSRankingItem attributes](self, "attributes"), 0x48uLL);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SSCompactRankingAttrsGetValue((int8x8_t *)-[PRSRankingItem attributes](self, "attributes"), 0x32uLL);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (matchScoreForShortcutsWithEvaluator__onceToken != -1)
    dispatch_once(&matchScoreForShortcutsWithEvaluator__onceToken, &__block_literal_global_259);
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.Preferences")))
  {
    SSCompactRankingAttrsGetValue((int8x8_t *)-[PRSRankingItem attributes](self, "attributes"), 7uLL);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRSRankingItem identifier](self, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[PRSRankingItem shortcutPriorityFromIdentifier:](self, "shortcutPriorityFromIdentifier:", v8);

    if (objc_msgSend(v7, "length"))
    {
      -[PRSRankingItem matchScoreForShortcutsSettingWithEvaluator:name:preferencePriority:](self, "matchScoreForShortcutsSettingWithEvaluator:name:preferencePriority:", v4, v7, v9);
LABEL_9:
      v11 = v10;
      v12 = 1.0;
LABEL_11:

      goto LABEL_12;
    }
    goto LABEL_10;
  }
  if (objc_msgSend((id)matchScoreForShortcutsWithEvaluator__appPrefixActionBundleIDs, "containsObject:", v5))
  {
    SSCompactRankingAttrsGetValue((int8x8_t *)-[PRSRankingItem attributes](self, "attributes"), 0xACuLL);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "length"))
    {
      -[PRSRankingItem matchScoreTitle:withEvaluator:](self, "matchScoreTitle:withEvaluator:", v7, v4);
      goto LABEL_9;
    }
LABEL_10:
    v12 = 0.0;
    v11 = 0.0;
    goto LABEL_11;
  }
  v17 = objc_msgSend(v6, "isEqualToString:", CFSTR("app-shortcut"));
  -[PRSRankingItem matchScoreForShortcutsAppWithEvaluator:](self, "matchScoreForShortcutsAppWithEvaluator:", v4);
  v11 = v18;
  v19 = objc_msgSend(v5, "length");
  if (v17)
  {
    if (!v19 || (objc_msgSend(v5, "hasPrefix:", CFSTR("com.apple.")) & 1) == 0)
    {
      v13 = v11;
      if (v11 <= 1.0)
      {
        objc_msgSend(v4, "queryString", v13);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "composedLength");

        v12 = 0.25;
        if (v21 < 8)
          goto LABEL_12;
      }
    }
    SSCompactRankingAttrsGetValue((int8x8_t *)-[PRSRankingItem attributes](self, "attributes", v13), 0xA4uLL);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (!v22 || v11 >= 1.0)
      goto LABEL_35;
    v24 = objc_msgSend(v22, "intValue");
    if (v24 == 1)
    {
      v25 = 1.2;
    }
    else
    {
      if (v24)
        goto LABEL_33;
      v25 = 1.4;
    }
    v11 = v11 * v25;
LABEL_33:
    if (v11 > 0.98)
      v11 = 0.98;
LABEL_35:

    v12 = 1.0;
    goto LABEL_12;
  }
  if (v19 && (objc_msgSend(v5, "hasPrefix:", CFSTR("com.apple.")) & 1) != 0
    || (v13 = v11, v11 > 1.0)
    || (objc_msgSend(v4, "queryString", v13),
        v26 = (void *)objc_claimAutoreleasedReturnValue(),
        v27 = objc_msgSend(v26, "composedLength"),
        v26,
        v27 >= 8))
  {
    v12 = 0.8;
  }
  else
  {
    v12 = 0.2;
  }
LABEL_12:
  *(float *)&v13 = v12 * v11;
  if ((float)(v12 * v11) > 1.0)
    *(float *)&v13 = 1.0;
  -[PRSRankingItem setKeywordMatchScore:](self, "setKeywordMatchScore:", v13);
  -[PRSRankingItem keywordMatchScore](self, "keywordMatchScore");
  v15 = v14;

  return v15;
}

void __63__PRSRankingItem_Scoring__matchScoreForShortcutsWithEvaluator___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = CFSTR("com.apple.facetime");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)matchScoreForShortcutsWithEvaluator__appPrefixActionBundleIDs;
  matchScoreForShortcutsWithEvaluator__appPrefixActionBundleIDs = v2;

}

- (float)matchScoreForAppEntityWithEvaluator:(id)a3 quParsedEvaluator:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  double v10;
  float v11;
  void *v12;
  void *v13;
  __CFString *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  float v19;
  void *v20;
  void *v21;
  float v22;
  float v23;
  double v24;
  void *v25;
  unint64_t v26;
  float v27;

  v6 = a3;
  v7 = a4;
  SSCompactRankingAttrsGetValue((int8x8_t *)-[PRSRankingItem attributes](self, "attributes"), 0xCuLL);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "length"))
  {
    SSCompactRankingAttrsGetValue((int8x8_t *)-[PRSRankingItem attributes](self, "attributes"), 7uLL);
    v9 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v9;
  }
  if (!objc_msgSend(v8, "length"))
  {
    v11 = 0.0;
LABEL_10:
    SSCompactRankingAttrsGetValue((int8x8_t *)-[PRSRankingItem attributes](self, "attributes"), 4uLL);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    SSCompactRankingAttrsGetValue((int8x8_t *)-[PRSRankingItem attributes](self, "attributes"), 6uLL);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "length") || objc_msgSend(v13, "length"))
    {
      if (objc_msgSend(v8, "length"))
      {
        objc_msgSend(&stru_1E6E549F0, "stringByAppendingString:", v8);
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v14 = &stru_1E6E549F0;
      }
      if (objc_msgSend(v12, "length"))
      {
        if (-[__CFString length](v14, "length"))
        {
          -[__CFString stringByAppendingString:](v14, "stringByAppendingString:", CFSTR(" "));
          v15 = objc_claimAutoreleasedReturnValue();

          v14 = (__CFString *)v15;
        }
        -[__CFString stringByAppendingString:](v14, "stringByAppendingString:", v12);
        v16 = objc_claimAutoreleasedReturnValue();

        v14 = (__CFString *)v16;
      }
      if (objc_msgSend(v13, "length"))
      {
        if (-[__CFString length](v14, "length"))
        {
          -[__CFString stringByAppendingString:](v14, "stringByAppendingString:", CFSTR(" "));
          v17 = objc_claimAutoreleasedReturnValue();

          v14 = (__CFString *)v17;
        }
        -[__CFString stringByAppendingString:](v14, "stringByAppendingString:", v13);
        v18 = objc_claimAutoreleasedReturnValue();

        v14 = (__CFString *)v18;
      }
      -[PRSRankingItem matchScoreTitle:withEvaluator:](self, "matchScoreTitle:withEvaluator:", v14, v6);
      if (v7 && v19 < 2.2204e-16)
        -[PRSRankingItem matchScoreTitle:withEvaluator:](self, "matchScoreTitle:withEvaluator:", v13, v7);
      v11 = v19 * 0.5;

    }
    goto LABEL_28;
  }
  -[PRSRankingItem matchScoreTitle:withEvaluator:](self, "matchScoreTitle:withEvaluator:", v8, v6);
  v11 = *(float *)&v10;
  if (v7 && *(float *)&v10 < 2.2204e-16)
  {
    -[PRSRankingItem matchScoreTitle:withEvaluator:](self, "matchScoreTitle:withEvaluator:", v8, v7);
    v11 = *(float *)&v10;
  }
  if (v11 < 2.2204e-16)
    goto LABEL_10;
LABEL_28:
  *(float *)&v10 = v11;
  -[PRSRankingItem setKeywordMatchScore:](self, "setKeywordMatchScore:", v10);
  -[PRSRankingItem keywordMatchScore](self, "keywordMatchScore");
  -[PRSRankingItem embeddingSimilarity](self, "embeddingSimilarity");
  -[PRSRankingItem pommesL1Score](self, "pommesL1Score");
  -[PRSRankingItem bundleIDType](self, "bundleIDType");
  objc_msgSend(v6, "queryString");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "language");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  chooseTopicality();
  v23 = v22;

  v24 = 0.25;
  if (v11 < 1.0)
  {
    objc_msgSend(v6, "queryString", 0.25, v11);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "composedLength");

    v24 = 0.025;
    if (v26 >= 5)
      v24 = 0.25;
  }
  v27 = v24 * v23;

  return v27;
}

- (float)matchScoreForDictionaryWithEvaluator:(id)a3
{
  void *v4;
  double v5;
  float v6;
  void *v7;
  float v8;
  float v9;

  objc_msgSend(a3, "queryTerms");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0.0;
  if (-[PRSRankingItem hasPolicyMultipleTermsPhraseMatch](self, "hasPolicyMultipleTermsPhraseMatch")
    && (unint64_t)objc_msgSend(v4, "count") >= 2)
  {
    SSCompactRankingAttrsGetValue((int8x8_t *)-[PRSRankingItem attributes](self, "attributes"), 7uLL);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v7, "composedLength") > 1)
      v6 = 0.98;
    else
      v6 = (float)((float)(unint64_t)objc_msgSend(v7, "composedLength") * 0.5) * 0.98;

  }
  *(float *)&v5 = v6;
  -[PRSRankingItem setKeywordMatchScore:](self, "setKeywordMatchScore:", v5);
  -[PRSRankingItem keywordMatchScore](self, "keywordMatchScore");
  v9 = v8;

  return v9;
}

- (float)matchScoreForBooksWithEvaluator:(id)a3 quParsedEvaluator:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  float v10;
  float v11;
  float v12;
  double v13;
  float v14;
  void *v15;
  void *v16;
  float v17;
  float v18;
  void *v19;
  unint64_t v20;
  void *v21;

  v6 = a3;
  v7 = a4;
  SSCompactRankingAttrsGetValue((int8x8_t *)-[PRSRankingItem attributes](self, "attributes"), 7uLL);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  SSCompactRankingAttrsGetValue((int8x8_t *)-[PRSRankingItem attributes](self, "attributes"), 0x5BuLL);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "composedLength"))
  {
    -[PRSRankingItem matchScoreTitle:withEvaluator:](self, "matchScoreTitle:withEvaluator:", v8, v6);
    v11 = v10;
    if (v7 && v10 < 0.00000011921)
    {
      -[PRSRankingItem matchScoreTitle:withEvaluator:](self, "matchScoreTitle:withEvaluator:", v8, v7);
      v11 = v12;
    }
    if (v11 < 1.0)
      v11 = v11 * 0.8;
  }
  else
  {
    v11 = 0.0;
  }
  if (objc_msgSend(v9, "composedLength"))
  {
    -[PRSRankingItem matchScoreTitle:withEvaluator:](self, "matchScoreTitle:withEvaluator:", v9, v6);
    if (v7 && *(float *)&v13 < 0.00000011921)
      -[PRSRankingItem matchScoreTitle:withEvaluator:](self, "matchScoreTitle:withEvaluator:", v9, v7);
    v14 = *(float *)&v13 * 0.4;
    if (v14 >= v11)
      v11 = v14;
  }
  *(float *)&v13 = fminf(v11, 1.0);
  -[PRSRankingItem setKeywordMatchScore:](self, "setKeywordMatchScore:", v13);
  -[PRSRankingItem keywordMatchScore](self, "keywordMatchScore");
  -[PRSRankingItem embeddingSimilarity](self, "embeddingSimilarity");
  -[PRSRankingItem pommesL1Score](self, "pommesL1Score");
  -[PRSRankingItem bundleIDType](self, "bundleIDType");
  objc_msgSend(v6, "queryString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "language");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  chooseTopicality();
  v18 = v17;

  objc_msgSend(v6, "queryTerms");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "count");

  if (v20 <= 3)
  {
    objc_msgSend(v6, "queryTerms");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = ((double)(unint64_t)objc_msgSend(v21, "count") * 0.599999994 * 0.25 + 0.400000006) * v18;

  }
  return v18;
}

- (float)matchScoreForTipsWithEvaluator:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  float v7;
  void *v8;
  float v9;
  void *v10;
  unint64_t v11;
  float v12;
  void *v13;
  unint64_t v14;
  double v15;
  void *v16;
  float v17;

  v4 = a3;
  objc_msgSend(v4, "queryString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "composedLength");

  v7 = 0.0;
  if (v6 >= 4)
  {
    SSCompactRankingAttrsGetValue((int8x8_t *)-[PRSRankingItem attributes](self, "attributes"), 7uLL);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "composedLength"))
    {
      -[PRSRankingItem matchScoreTitle:withEvaluator:](self, "matchScoreTitle:withEvaluator:", v8, v4);
      v7 = v9;
      if (v9 < 1.0)
      {
        objc_msgSend(v4, "queryString");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "composedLength");

        v12 = v7 * 0.1;
        if (v11 >= 0xA)
          v12 = v7;
        v7 = v12 * 0.6;
      }
    }
    objc_msgSend(v4, "queryTerms");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    if (v14 <= 3)
    {
      objc_msgSend(v4, "queryTerms");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (double)(unint64_t)objc_msgSend(v16, "count") * 0.25 * v7;

    }
    *(float *)&v15 = v7;
    -[PRSRankingItem setKeywordMatchScore:](self, "setKeywordMatchScore:", v15);
    -[PRSRankingItem keywordMatchScore](self, "keywordMatchScore");
    v7 = v17;

  }
  return v7;
}

- (float)matchScoreForHelpWithEvaluator:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  float v7;
  void *v8;
  float v9;
  void *v10;
  unint64_t v11;
  float v12;
  void *v13;
  unint64_t v14;
  double v15;
  void *v16;
  float v17;

  v4 = a3;
  objc_msgSend(v4, "queryString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "composedLength");

  v7 = 0.0;
  if (v6 >= 4)
  {
    SSCompactRankingAttrsGetValue((int8x8_t *)-[PRSRankingItem attributes](self, "attributes"), 7uLL);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "composedLength"))
    {
      -[PRSRankingItem matchScoreTitle:withEvaluator:](self, "matchScoreTitle:withEvaluator:", v8, v4);
      v7 = v9;
      if (v9 < 1.0)
      {
        objc_msgSend(v4, "queryString");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "composedLength");

        v12 = v7 * 0.1;
        if (v11 >= 0xA)
          v12 = v7;
        v7 = v12 * 0.6;
      }
    }
    objc_msgSend(v4, "queryTerms");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    if (v14 <= 3)
    {
      objc_msgSend(v4, "queryTerms");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (double)(unint64_t)objc_msgSend(v16, "count") * 0.25 * v7;

    }
    *(float *)&v15 = v7;
    -[PRSRankingItem setKeywordMatchScore:](self, "setKeywordMatchScore:", v15);
    -[PRSRankingItem keywordMatchScore](self, "keywordMatchScore");
    v7 = v17;

  }
  return v7;
}

- (float)matchScoreForWalletWithEvaluator:(id)a3 quParsedEvaluator:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  float v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  char v15;
  double v16;
  void *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  float v21;
  float v22;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "queryString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "composedLength");

  v10 = 0.0;
  if (v9 >= 4)
  {
    SSCompactRankingAttrsGetValue((int8x8_t *)-[PRSRankingItem attributes](self, "attributes"), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    SSCompactRankingAttrsGetValue((int8x8_t *)-[PRSRankingItem attributes](self, "attributes"), 7uLL);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "length")
      && ((objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.pktransaction")) & 1) != 0
       || (objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.finance.transaction")) & 1) != 0
       || objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.finance.order"))))
    {
      SSCompactRankingAttrsGetValue((int8x8_t *)-[PRSRankingItem attributes](self, "attributes"), 0x1FuLL);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "length") && objc_msgSend(v13, "length"))
      {
        objc_msgSend(v12, "stringByAppendingString:", v13);
        v14 = objc_claimAutoreleasedReturnValue();

        v12 = (void *)v14;
      }

      v15 = 1;
    }
    else
    {
      v15 = 0;
    }
    if (objc_msgSend(v12, "composedLength"))
    {
      -[PRSRankingItem matchScoreTitle:withEvaluator:](self, "matchScoreTitle:withEvaluator:", v12, v6);
      v10 = *(float *)&v16;
      if (v7)
      {
        HIDWORD(v16) = 872415232;
        if (*(float *)&v16 < 0.00000011921)
        {
          -[PRSRankingItem matchScoreTitle:withEvaluator:](self, "matchScoreTitle:withEvaluator:", v12, v7);
          v10 = *(float *)&v16;
        }
      }
      if ((v15 & 1) != 0
        || (v16 = v10, v10 < 1.0)
        && (objc_msgSend(v6, "queryString", v16),
            v17 = (void *)objc_claimAutoreleasedReturnValue(),
            v18 = objc_msgSend(v17, "composedLength"),
            v17,
            v18 <= 9))
      {
        v10 = v10 * 0.1;
      }
    }
    *(float *)&v16 = fminf(v10, 1.0);
    -[PRSRankingItem setKeywordMatchScore:](self, "setKeywordMatchScore:", v16);
    -[PRSRankingItem keywordMatchScore](self, "keywordMatchScore");
    -[PRSRankingItem embeddingSimilarity](self, "embeddingSimilarity");
    -[PRSRankingItem pommesL1Score](self, "pommesL1Score");
    -[PRSRankingItem bundleIDType](self, "bundleIDType");
    objc_msgSend(v6, "queryString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "language");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    chooseTopicality();
    v22 = v21;

    v10 = v22 * 0.6;
  }

  return v10;
}

- (float)matchScoreForMusicWithEvaluator:(id)a3 quParsedEvaluator:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  double v15;
  void *v16;
  void *v17;
  float v18;
  float v19;

  v6 = a3;
  v7 = a4;
  SSCompactRankingAttrsGetValue((int8x8_t *)-[PRSRankingItem attributes](self, "attributes"), 7uLL);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  SSCompactRankingAttrsGetValue((int8x8_t *)-[PRSRankingItem attributes](self, "attributes"), 0x25uLL);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "composedLength"))
  {
    -[PRSRankingItem matchScoreTitle:withEvaluator:](self, "matchScoreTitle:withEvaluator:", v8, v6);
    v11 = v10;
    if (v7 && v10 < 0.00000011921)
    {
      -[PRSRankingItem matchScoreTitle:withEvaluator:](self, "matchScoreTitle:withEvaluator:", v8, v7);
      v11 = v12;
    }
  }
  else
  {
    v11 = 0.0;
  }
  if (objc_msgSend(v9, "composedLength"))
  {
    -[PRSRankingItem matchScoreTitle:withEvaluator:](self, "matchScoreTitle:withEvaluator:", v9, v6);
    if (v7 && v13 < 0.00000011921)
      -[PRSRankingItem matchScoreTitle:withEvaluator:](self, "matchScoreTitle:withEvaluator:", v9, v7);
    v14 = v13 * 0.25;
    if (v14 >= v11)
      v11 = v14;
  }
  v15 = v11 * 0.7;
  *(float *)&v15 = v15;
  if (v11 >= 1.0)
    *(float *)&v15 = v11;
  *(float *)&v15 = fminf(*(float *)&v15, 1.0);
  -[PRSRankingItem setKeywordMatchScore:](self, "setKeywordMatchScore:", v15);
  -[PRSRankingItem keywordMatchScore](self, "keywordMatchScore");
  -[PRSRankingItem embeddingSimilarity](self, "embeddingSimilarity");
  -[PRSRankingItem pommesL1Score](self, "pommesL1Score");
  -[PRSRankingItem bundleIDType](self, "bundleIDType");
  objc_msgSend(v6, "queryString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "language");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  chooseTopicality();
  v19 = v18;

  return v19 * 0.61;
}

- (float)matchScoreForPeopleItemsWithEvaluator:(id)a3
{
  id v4;
  void *v5;
  double v6;
  float v7;
  double v8;
  double v9;
  float v10;
  float v11;

  v4 = a3;
  SSCompactRankingAttrsGetValue((int8x8_t *)-[PRSRankingItem attributes](self, "attributes"), 0xCuLL);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "composedLength"))
  {
    -[PRSRankingItem matchScoreTitle:withEvaluator:](self, "matchScoreTitle:withEvaluator:", v5, v4);
    v8 = v7;
    if (v8 >= 1.0)
      v9 = 0.51;
    else
      v9 = 0.35;
    v6 = v8 * v9;
    *(float *)&v6 = v6;
  }
  else
  {
    LODWORD(v6) = 0;
  }
  -[PRSRankingItem setKeywordMatchScore:](self, "setKeywordMatchScore:", v6);
  -[PRSRankingItem keywordMatchScore](self, "keywordMatchScore");
  v11 = v10;

  return v11;
}

- (int64_t)compareShortcutTopHitCandidate:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  char IsSyndicatedPhotos;
  void *v14;
  char v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  __CFString *v24;
  int64_t v25;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  __CFString *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  uint64_t v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  uint64_t v59;
  __int16 v60;
  __CFString *v61;
  __int16 v62;
  uint64_t v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  -[PRSRankingItem recentSimilarIntentEngagementDates](self, "recentSimilarIntentEngagementDates");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  objc_msgSend(v7, "recentSimilarIntentEngagementDates");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (!(v9 | v11))
    goto LABEL_19;
  if (v9 != 2)
    goto LABEL_8;
  if (!v11)
    goto LABEL_6;
  -[PRSRankingItem recentSimilarIntentEngagementDates](self, "recentSimilarIntentEngagementDates");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "recentSimilarIntentEngagementDates");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "compare:", v5) == 1)
  {
LABEL_6:
    -[PRSRankingItem sectionBundleIdentifier](self, "sectionBundleIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    IsSyndicatedPhotos = SSSectionIsSyndicatedPhotos(v12);

    if (v11)
    {

      if ((IsSyndicatedPhotos & 1) != 0)
        goto LABEL_8;
    }
    else if ((IsSyndicatedPhotos & 1) != 0)
    {
      goto LABEL_19;
    }
    PRSLogCategoryDefault();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      -[PRSRankingItem sectionBundleIdentifier](self, "sectionBundleIdentifier");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRSRankingItem recentSimilarIntentEngagementDates](self, "recentSimilarIntentEngagementDates");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v45, "count");
      -[PRSRankingItem recentSimilarIntentEngagementDates](self, "recentSimilarIntentEngagementDates");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "lastObject");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRSRankingItem likelihood](self, "likelihood");
      v30 = v29;
      objc_msgSend(v7, "sectionBundleIdentifier");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "recentSimilarIntentEngagementDates");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "count");
      objc_msgSend(v7, "recentSimilarIntentEngagementDates");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "count");
      if (v35)
      {
        objc_msgSend(v7, "recentSimilarIntentEngagementDates");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "firstObject");
        v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v36 = CFSTR("nil");
      }
      objc_msgSend(v7, "likelihood");
      *(_DWORD *)buf = 138414082;
      v49 = v47;
      v50 = 2048;
      v51 = v41;
      v52 = 2112;
      v53 = v28;
      v54 = 2048;
      v55 = v30;
      v56 = 2112;
      v57 = v31;
      v58 = 2048;
      v59 = v33;
      v60 = 2112;
      v61 = v36;
      v62 = 2048;
      v63 = v37;
      _os_log_impl(&dword_1B86C5000, v27, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] <Engagement_Debug> Rule: %@ (%lu, %@, %f) overtakes %@ (%lu, %@, %f)", buf, 0x52u);
      if (v35)
      {

      }
    }

    v25 = 1;
    goto LABEL_20;
  }

LABEL_8:
  if (v11 != 2)
  {
LABEL_19:
    v25 = 0;
    goto LABEL_20;
  }
  if (v9)
  {
    objc_msgSend(v7, "recentSimilarIntentEngagementDates");
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v11, "lastObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRSRankingItem recentSimilarIntentEngagementDates](self, "recentSimilarIntentEngagementDates");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "compare:", v4) != 1)
    {

      goto LABEL_19;
    }
  }
  objc_msgSend(v7, "sectionBundleIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = SSSectionIsSyndicatedPhotos(v14);

  if (v9)
  {

  }
  if ((v15 & 1) != 0)
    goto LABEL_19;
  PRSLogCategoryDefault();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "sectionBundleIdentifier");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "recentSimilarIntentEngagementDates");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v42, "count");
    objc_msgSend(v7, "recentSimilarIntentEngagementDates");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "lastObject");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "likelihood");
    v18 = v17;
    -[PRSRankingItem sectionBundleIdentifier](self, "sectionBundleIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRSRankingItem recentSimilarIntentEngagementDates](self, "recentSimilarIntentEngagementDates");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "count");
    -[PRSRankingItem recentSimilarIntentEngagementDates](self, "recentSimilarIntentEngagementDates");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "count");
    if (v23)
    {
      -[PRSRankingItem recentSimilarIntentEngagementDates](self, "recentSimilarIntentEngagementDates");
      v11 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v11, "firstObject");
      v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v24 = CFSTR("nil");
    }
    -[PRSRankingItem likelihood](self, "likelihood");
    *(_DWORD *)buf = 138414082;
    v49 = v44;
    v50 = 2048;
    v51 = v39;
    v52 = 2112;
    v53 = v46;
    v54 = 2048;
    v55 = v18;
    v56 = 2112;
    v57 = v19;
    v58 = 2048;
    v59 = v21;
    v60 = 2112;
    v61 = v24;
    v62 = 2048;
    v63 = v38;
    _os_log_impl(&dword_1B86C5000, v16, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] <Engagement_Debug> Rule: %@ (%lu, %@, %f) overtakes %@ (%lu, %@, %f)", buf, 0x52u);
    if (v23)
    {

    }
  }

  v25 = -1;
LABEL_20:

  return v25;
}

- (int64_t)compareWithCCCDTopHitCandidate:(id)a3
{
  id v4;
  double v5;
  double v6;
  int64_t v7;
  double v8;
  double v9;

  v4 = a3;
  if (!-[PRSRankingItem isLocalTopHitCandidate](self, "isLocalTopHitCandidate")
    || !objc_msgSend(v4, "isLocalTopHitCandidate"))
  {
    goto LABEL_11;
  }
  if (!objc_msgSend(v4, "isCCCD")
    || (-[PRSRankingItem bundleIDType](self, "bundleIDType"),
        -[PRSRankingItem topicalityScore](self, "topicalityScore"),
        v5 <= 0.8)
    && (-[PRSRankingItem engagementScore](self, "engagementScore"), v6 <= 0.8))
  {
    if (-[PRSRankingItem isCCCD](self, "isCCCD"))
    {
      objc_msgSend(v4, "bundleIDType");
      objc_msgSend(v4, "topicalityScore");
      if (v8 > 0.8 || (objc_msgSend(v4, "engagementScore"), v9 > 0.8))
      {
        v7 = -1;
        goto LABEL_12;
      }
    }
LABEL_11:
    v7 = 0;
    goto LABEL_12;
  }
  v7 = 1;
LABEL_12:

  return v7;
}

- (int64_t)compareAppsTopHitCandidate:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  int64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  unint64_t v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  uint64_t v31;
  unint64_t v32;

  v4 = a3;
  if (!v4
    || -[PRSRankingItem isLocalTopHitCandidate](self, "isLocalTopHitCandidate")
    && !objc_msgSend(v4, "isLocalTopHitCandidate"))
  {
    goto LABEL_18;
  }
  if (!-[PRSRankingItem isLocalTopHitCandidate](self, "isLocalTopHitCandidate")
    && (objc_msgSend(v4, "isLocalTopHitCandidate") & 1) != 0)
  {
    goto LABEL_20;
  }
  if ((!-[PRSRankingItem isLocalTopHitCandidate](self, "isLocalTopHitCandidate")
     || (objc_msgSend(v4, "isLocalTopHitCandidate") & 1) == 0)
    && (-[PRSRankingItem isLocalTopHitCandidate](self, "isLocalTopHitCandidate")
     || (objc_msgSend(v4, "isLocalTopHitCandidate") & 1) != 0))
  {
    goto LABEL_10;
  }
  v15 = -[PRSRankingItem compareShortcutTopHitCandidate:](self, "compareShortcutTopHitCandidate:", v4);
  if (!v15)
  {
    -[PRSRankingItem likelihood](self, "likelihood");
    v17 = v16;
    objc_msgSend(v4, "likelihood");
    if (v17 > v18)
    {
LABEL_18:
      v15 = 1;
      goto LABEL_42;
    }
    -[PRSRankingItem likelihood](self, "likelihood");
    v20 = v19;
    objc_msgSend(v4, "likelihood");
    if (v20 >= v21)
    {
      -[PRSRankingItem likelihood](self, "likelihood");
      if (v25 != 1.0)
        goto LABEL_30;
      if (-[PRSRankingItem wasEngagedInSpotlight](self, "wasEngagedInSpotlight")
        && !objc_msgSend(v4, "wasEngagedInSpotlight"))
      {
        goto LABEL_18;
      }
      if (-[PRSRankingItem wasEngagedInSpotlight](self, "wasEngagedInSpotlight")
        || (objc_msgSend(v4, "wasEngagedInSpotlight") & 1) == 0)
      {
LABEL_30:
        -[PRSRankingItem likelihood](self, "likelihood");
        if (v26 > 0.0)
        {
          objc_msgSend(v4, "likelihood");
          if (v27 > 0.0)
          {
            -[PRSRankingItem likelihood](self, "likelihood");
            v29 = v28;
            objc_msgSend(v4, "likelihood");
            if (vabdd_f64(v29, v30) < 0.00000011920929)
            {
              SSCompactRankingAttrsGetValue((int8x8_t *)-[PRSRankingItem attributes](self, "attributes"), 9uLL);
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(v4, "attributes"), 9uLL);
              v31 = objc_claimAutoreleasedReturnValue();
              v13 = (void *)v31;
              if (!v11 || !v31)
              {
                if (v11)
                  v15 = 1;
                else
                  v15 = -1;
                goto LABEL_41;
              }
              v14 = objc_msgSend(v11, "compare:", v31);
              if (v14)
                goto LABEL_15;

            }
          }
        }
LABEL_10:
        -[PRSRankingItem topicalityScore](self, "topicalityScore");
        v6 = v5;
        objc_msgSend(v4, "topicalityScore");
        if (v6 <= v7)
        {
          -[PRSRankingItem topicalityScore](self, "topicalityScore");
          v9 = v8;
          objc_msgSend(v4, "topicalityScore");
          if (v9 >= v10)
          {
            SSCompactRankingAttrsGetValue((int8x8_t *)-[PRSRankingItem attributes](self, "attributes"), 0x11CuLL);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(v4, "attributes"), 0x11CuLL);
            v12 = objc_claimAutoreleasedReturnValue();
            v13 = (void *)v12;
            if (v11 && v12)
            {
              v14 = objc_msgSend(v11, "compare:", v12);
LABEL_15:
              v15 = v14;
LABEL_41:

              goto LABEL_42;
            }
            SSCompactRankingAttrsGetValue((int8x8_t *)-[PRSRankingItem attributes](self, "attributes"), 7uLL);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(v4, "attributes"), 7uLL);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v22, "length") && objc_msgSend(v23, "length"))
            {
              v24 = objc_msgSend(v22, "length");
              if (v24 < objc_msgSend(v23, "length"))
              {
                v15 = 1;
LABEL_40:

                goto LABEL_41;
              }
              v32 = objc_msgSend(v22, "length");
              if (v32 > objc_msgSend(v23, "length"))
              {
                v15 = -1;
                goto LABEL_40;
              }
            }
            v15 = -objc_msgSend(v22, "compare:", v23);
            goto LABEL_40;
          }
          goto LABEL_20;
        }
        goto LABEL_18;
      }
    }
LABEL_20:
    v15 = -1;
  }
LABEL_42:

  return v15;
}

- (int64_t)compareContactsTopHitCandidate:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  float v8;
  int64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  float v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v28;
  void *v29;

  v4 = a3;
  if (!v4
    || -[PRSRankingItem isLocalTopHitCandidate](self, "isLocalTopHitCandidate")
    && !objc_msgSend(v4, "isLocalTopHitCandidate"))
  {
    goto LABEL_22;
  }
  if (!-[PRSRankingItem isLocalTopHitCandidate](self, "isLocalTopHitCandidate")
    && (objc_msgSend(v4, "isLocalTopHitCandidate") & 1) != 0)
  {
    goto LABEL_24;
  }
  if ((!-[PRSRankingItem isLocalTopHitCandidate](self, "isLocalTopHitCandidate")
     || (objc_msgSend(v4, "isLocalTopHitCandidate") & 1) == 0)
    && (-[PRSRankingItem isLocalTopHitCandidate](self, "isLocalTopHitCandidate")
     || (objc_msgSend(v4, "isLocalTopHitCandidate") & 1) != 0))
  {
    -[PRSRankingItem topicalityScore](self, "topicalityScore");
    v6 = v5;
    objc_msgSend(&unk_1E6E9B680, "objectAtIndexedSubscript:", 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "floatValue");
    if (v6 >= v8)
    {
      objc_msgSend(v4, "topicalityScore");
      v17 = v16;
      objc_msgSend(&unk_1E6E9B680, "objectAtIndexedSubscript:", 3);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "floatValue");
      v20 = v19;

      if (v17 >= v20)
      {
        if (-[PRSRankingItem wasEngagedInSpotlight](self, "wasEngagedInSpotlight")
          && !objc_msgSend(v4, "wasEngagedInSpotlight"))
        {
          goto LABEL_22;
        }
        if (!-[PRSRankingItem wasEngagedInSpotlight](self, "wasEngagedInSpotlight")
          && (objc_msgSend(v4, "wasEngagedInSpotlight") & 1) != 0)
        {
          goto LABEL_24;
        }
      }
    }
    else
    {

    }
    goto LABEL_21;
  }
  v9 = -[PRSRankingItem compareShortcutTopHitCandidate:](self, "compareShortcutTopHitCandidate:", v4);
  if (!v9)
  {
    -[PRSRankingItem likelihood](self, "likelihood");
    v11 = v10;
    objc_msgSend(v4, "likelihood");
    if (v11 > v12)
    {
LABEL_22:
      v9 = 1;
      goto LABEL_25;
    }
    -[PRSRankingItem likelihood](self, "likelihood");
    v14 = v13;
    objc_msgSend(v4, "likelihood");
    if (v14 < v15)
    {
LABEL_24:
      v9 = -1;
      goto LABEL_25;
    }
LABEL_21:
    -[PRSRankingItem topicalityScore](self, "topicalityScore");
    v22 = v21;
    objc_msgSend(v4, "topicalityScore");
    if (v22 > v23)
      goto LABEL_22;
    -[PRSRankingItem topicalityScore](self, "topicalityScore");
    v25 = v24;
    objc_msgSend(v4, "topicalityScore");
    if (v25 >= v26)
    {
      SSCompactRankingAttrsGetValue((int8x8_t *)-[PRSRankingItem attributes](self, "attributes"), 7uLL);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(v4, "attributes"), 7uLL);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -objc_msgSend(v28, "compare:", v29);

      goto LABEL_25;
    }
    goto LABEL_24;
  }
LABEL_25:

  return v9;
}

- (int64_t)comparePeopleItemTopHitCandidate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  v4 = a3;
  if (!v4)
  {
    v7 = 1;
    goto LABEL_12;
  }
  SSCompactRankingAttrsGetValue((int8x8_t *)-[PRSRankingItem attributes](self, "attributes"), 0x99uLL);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(v4, "attributes"), 0x99uLL);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_9;
  objc_msgSend(v4, "bundleIDType");
  if (objc_msgSend(v5, "intValue") == 1 && objc_msgSend(v6, "intValue") != 1)
  {
    v7 = 1;
    goto LABEL_10;
  }
  if (objc_msgSend(v5, "intValue") != 1 && objc_msgSend(v6, "intValue") == 1)
    v7 = -1;
  else
LABEL_9:
    v7 = -[PRSRankingItem compareLocalTopHitCandidate:](self, "compareLocalTopHitCandidate:", v4);
LABEL_10:

LABEL_12:
  return v7;
}

- (int64_t)compareSafariTopHitCandidate:(id)a3
{
  id v4;
  int64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;

  v4 = a3;
  if (!v4
    || -[PRSRankingItem isLocalTopHitCandidate](self, "isLocalTopHitCandidate")
    && !objc_msgSend(v4, "isLocalTopHitCandidate"))
  {
    goto LABEL_17;
  }
  if (!-[PRSRankingItem isLocalTopHitCandidate](self, "isLocalTopHitCandidate")
    && (objc_msgSend(v4, "isLocalTopHitCandidate") & 1) != 0)
  {
    goto LABEL_6;
  }
  if ((!-[PRSRankingItem isLocalTopHitCandidate](self, "isLocalTopHitCandidate")
     || (objc_msgSend(v4, "isLocalTopHitCandidate") & 1) == 0)
    && (-[PRSRankingItem isLocalTopHitCandidate](self, "isLocalTopHitCandidate")
     || (objc_msgSend(v4, "isLocalTopHitCandidate") & 1) != 0))
  {
    goto LABEL_23;
  }
  v5 = -[PRSRankingItem compareShortcutTopHitCandidate:](self, "compareShortcutTopHitCandidate:", v4);
  if (v5)
    goto LABEL_20;
  -[PRSRankingItem likelihood](self, "likelihood");
  v7 = v6;
  objc_msgSend(v4, "likelihood");
  if (v7 > v8)
  {
LABEL_17:
    v5 = 1;
    goto LABEL_20;
  }
  -[PRSRankingItem likelihood](self, "likelihood");
  v10 = v9;
  objc_msgSend(v4, "likelihood");
  if (v10 >= v11)
  {
LABEL_23:
    if (!-[PRSRankingItem wasEngaged](self, "wasEngaged") || !objc_msgSend(v4, "wasEngaged"))
      goto LABEL_19;
    -[PRSRankingItem topicalityScore](self, "topicalityScore");
    v13 = v12;
    objc_msgSend(v4, "topicalityScore");
    if (v13 > v14)
      goto LABEL_17;
    -[PRSRankingItem topicalityScore](self, "topicalityScore");
    v16 = v15;
    objc_msgSend(v4, "topicalityScore");
    if (v16 >= v17)
    {
LABEL_19:
      v5 = 0;
      goto LABEL_20;
    }
  }
LABEL_6:
  v5 = -1;
LABEL_20:

  return v5;
}

- (int64_t)compareLocalTopHitCandidate:(id)a3
{
  id v4;
  int64_t v5;
  double v6;
  double v7;
  double v8;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;

  v4 = a3;
  if (!v4
    || -[PRSRankingItem isLocalTopHitCandidate](self, "isLocalTopHitCandidate")
    && !objc_msgSend(v4, "isLocalTopHitCandidate"))
  {
    goto LABEL_14;
  }
  if (!-[PRSRankingItem isLocalTopHitCandidate](self, "isLocalTopHitCandidate")
    && (objc_msgSend(v4, "isLocalTopHitCandidate") & 1) != 0)
  {
    goto LABEL_6;
  }
  if ((!-[PRSRankingItem isLocalTopHitCandidate](self, "isLocalTopHitCandidate")
     || (objc_msgSend(v4, "isLocalTopHitCandidate") & 1) == 0)
    && (-[PRSRankingItem isLocalTopHitCandidate](self, "isLocalTopHitCandidate")
     || (objc_msgSend(v4, "isLocalTopHitCandidate") & 1) != 0))
  {
LABEL_11:
    v5 = 0;
    goto LABEL_15;
  }
  v5 = -[PRSRankingItem compareShortcutTopHitCandidate:](self, "compareShortcutTopHitCandidate:", v4);
  if (v5)
    goto LABEL_15;
  -[PRSRankingItem likelihood](self, "likelihood");
  v7 = v6;
  objc_msgSend(v4, "likelihood");
  if (v7 > v8)
  {
LABEL_14:
    v5 = 1;
    goto LABEL_15;
  }
  -[PRSRankingItem likelihood](self, "likelihood");
  v11 = v10;
  objc_msgSend(v4, "likelihood");
  if (v11 >= v12)
  {
    -[PRSRankingItem likelihood](self, "likelihood");
    if (v13 == 1.0)
    {
      if (-[PRSRankingItem wasEngagedInSpotlight](self, "wasEngagedInSpotlight")
        && !objc_msgSend(v4, "wasEngagedInSpotlight"))
      {
        goto LABEL_14;
      }
      if (-[PRSRankingItem wasEngagedInSpotlight](self, "wasEngagedInSpotlight")
        || (objc_msgSend(v4, "wasEngagedInSpotlight") & 1) == 0)
      {
        goto LABEL_11;
      }
    }
    else
    {
      -[PRSRankingItem freshnessScore](self, "freshnessScore");
      v15 = v14;
      objc_msgSend(v4, "freshnessScore");
      if (v15 > v16)
        goto LABEL_14;
      -[PRSRankingItem freshnessScore](self, "freshnessScore");
      v18 = v17;
      objc_msgSend(v4, "freshnessScore");
      if (v18 >= v19)
        goto LABEL_11;
    }
  }
LABEL_6:
  v5 = -1;
LABEL_15:

  return v5;
}

- (int64_t)compareParsecTopHitCandidate:(id)a3
{
  id v4;
  int64_t v5;
  double v6;
  float v7;
  double v8;
  float v9;
  uint64_t v10;

  v4 = a3;
  if (v4)
  {
    v5 = -[PRSRankingItem compareShortcutTopHitCandidate:](self, "compareShortcutTopHitCandidate:", v4);
    if (!v5)
    {
      -[PRSRankingItem engagementScore](self, "engagementScore");
      v7 = v6;
      objc_msgSend(v4, "engagementScore");
      v9 = v8;
      if (v7 >= v9)
        v10 = 0;
      else
        v10 = -1;
      if (v7 > v9)
        v5 = 1;
      else
        v5 = v10;
    }
  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (BOOL)isPerfectMatch
{
  double v2;

  -[PRSRankingItem topicalityScore](self, "topicalityScore");
  return fabs(v2 + -1.0) < 2.22044605e-16;
}

- (BOOL)isAssociatedWithTophitContactsFromItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((-[PRSRankingItem bundleIDType](self, "bundleIDType") & 0x20) == 0
    && (-[PRSRankingItem bundleIDType](self, "bundleIDType") & 8) == 0
    && (-[PRSRankingItem bundleIDType](self, "bundleIDType") & 0x100000) == 0
    || !objc_msgSend(v4, "count"))
  {
    v23 = 0;
    goto LABEL_42;
  }
  SSCompactRankingAttrsGetValue((int8x8_t *)-[PRSRankingItem attributes](self, "attributes"), 5uLL);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SSCompactRankingAttrsGetValue((int8x8_t *)-[PRSRankingItem attributes](self, "attributes"), 0x10BuLL);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "count") && !objc_msgSend(v6, "count"))
  {
    v23 = 0;
    goto LABEL_41;
  }
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
  if (!v8)
  {
    v23 = 0;
    goto LABEL_40;
  }
  v9 = v8;
  v10 = *(_QWORD *)v36;
  v25 = v6;
  v26 = v5;
  while (2)
  {
    for (i = 0; i != v9; ++i)
    {
      if (*(_QWORD *)v36 != v10)
        objc_enumerationMutation(v7);
      v12 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
      if ((objc_msgSend(v12, "bundleIDType", v25) & 0x8000) != 0 && (objc_msgSend(v12, "bundleIDType") & 4) != 0)
      {
        SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(v12, "attributes"), 7uLL);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "length"))
        {
          v33 = 0u;
          v34 = 0u;
          v31 = 0u;
          v32 = 0u;
          v14 = v5;
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
          if (v15)
          {
            v16 = v15;
            v17 = *(_QWORD *)v32;
LABEL_17:
            v18 = 0;
            while (1)
            {
              if (*(_QWORD *)v32 != v17)
                objc_enumerationMutation(v14);
              if ((objc_msgSend(v13, "isEqualToString:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v18)) & 1) != 0)
                goto LABEL_38;
              if (v16 == ++v18)
              {
                v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
                if (v16)
                  goto LABEL_17;
                break;
              }
            }
          }

          v6 = v25;
          v5 = v26;
          if ((unint64_t)objc_msgSend(v25, "count") <= 3)
          {
            v29 = 0u;
            v30 = 0u;
            v27 = 0u;
            v28 = 0u;
            v14 = v25;
            v19 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
            if (v19)
            {
              v20 = v19;
              v21 = *(_QWORD *)v28;
LABEL_26:
              v22 = 0;
              while (1)
              {
                if (*(_QWORD *)v28 != v21)
                  objc_enumerationMutation(v14);
                if ((objc_msgSend(v13, "isEqualToString:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v22)) & 1) != 0)
                  break;
                if (v20 == ++v22)
                {
                  v20 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
                  if (v20)
                    goto LABEL_26;
                  goto LABEL_32;
                }
              }
LABEL_38:

              v23 = 1;
              v6 = v25;
              v5 = v26;
              goto LABEL_40;
            }
LABEL_32:

            v6 = v25;
            v5 = v26;
          }
        }

      }
    }
    v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
    v23 = 0;
    if (v9)
      continue;
    break;
  }
LABEL_40:

LABEL_41:
LABEL_42:

  return v23;
}

- (BOOL)isGoodPhotosMatch
{
  float v2;

  -[PRSRankingItem l2Score](self, "l2Score");
  return v2 > 44.0;
}

- (BOOL)isGoodMatchAlternateName:(id)a3 withEvaluator:(id)a4
{
  id v6;
  id v7;
  float v8;
  double v9;
  BOOL v10;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  float v17;
  float v18;
  void *v19;
  uint64_t v20;
  void *v21;
  unint64_t v22;
  void *v23;
  unint64_t v24;
  void *v25;

  v6 = a3;
  v7 = a4;
  -[PRSRankingItem matchScoreAppName:withEvaluator:](self, "matchScoreAppName:withEvaluator:", v6, v7);
  v9 = v8;
  if (v8 > 0.99 || v9 > 0.97 && (objc_msgSend(v7, "isCJK") & 1) != 0)
    goto LABEL_2;
  if (v9 <= 0.95)
    goto LABEL_14;
  objc_msgSend(v7, "queryString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v12, "length") < 2 || (unint64_t)objc_msgSend(v6, "length") > 5)
    goto LABEL_13;
  v13 = objc_msgSend(v6, "length");
  objc_msgSend(v7, "queryString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)(v13 - objc_msgSend(v14, "length")) >= 2)
  {

LABEL_13:
    goto LABEL_14;
  }
  objc_msgSend(v6, "localizedUppercaseString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isEqualToString:", v6);

  if ((v16 & 1) != 0)
    goto LABEL_2;
LABEL_14:
  -[PRSRankingItem matchScoreTitle:withEvaluator:](self, "matchScoreTitle:withEvaluator:", v6, v7);
  v18 = v17;
  if (v9 > 0.9)
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v6, "rangeOfCharacterFromSet:", v19);

    if (v20 != 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_26;
    if (v9 > 0.95)
    {
      objc_msgSend(v7, "queryString");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "length");

      if (v22 > 3)
        goto LABEL_2;
    }
    if (objc_msgSend(v6, "containsCJK"))
    {
LABEL_26:
      if (v18 <= 0.35)
      {
        objc_msgSend(v7, "queryString", v18);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "length");

        if (v24 <= 2)
          goto LABEL_21;
      }
LABEL_2:
      v10 = 1;
      goto LABEL_3;
    }
  }
LABEL_21:
  if (v18 >= 0.6)
  {
    objc_msgSend(v7, "queryString", v18);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (unint64_t)objc_msgSend(v25, "length") > 2;

  }
  else
  {
    v10 = 0;
  }
LABEL_3:

  return v10;
}

- (BOOL)isCCCD
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;

  -[PRSRankingItem sectionBundleIdentifier](self, "sectionBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.conversion")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[PRSRankingItem sectionBundleIdentifier](self, "sectionBundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.calculation")) & 1) != 0)
    {
      v4 = 1;
    }
    else
    {
      -[PRSRankingItem sectionBundleIdentifier](self, "sectionBundleIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.worldclock")) & 1) != 0)
      {
        v4 = 1;
      }
      else
      {
        -[PRSRankingItem sectionBundleIdentifier](self, "sectionBundleIdentifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.datadetector.quick_actions"));

      }
    }

  }
  return v4;
}

- (BOOL)isSearchResultPage:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t k;
  BOOL v26;
  void *v27;
  BOOL v28;
  void *v30;
  void *v31;
  id obj;
  uint64_t v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v3 = isSearchResultPage__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&isSearchResultPage__onceToken, &__block_literal_global_264);
  objc_msgSend(v4, "lowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
    v28 = 0;
    goto LABEL_51;
  }
  objc_msgSend(v6, "host");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v28 = 0;
    goto LABEL_50;
  }
  objc_msgSend(v7, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "query");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  obj = (id)isSearchResultPage__searchProviders;
  v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
  if (!v33)
  {
    v28 = 0;
    goto LABEL_49;
  }
  v34 = *(_QWORD *)v44;
  v30 = v5;
  v31 = v10;
  while (2)
  {
    for (i = 0; i != v33; ++i)
    {
      if (*(_QWORD *)v44 != v34)
        objc_enumerationMutation(obj);
      v12 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i);
      objc_msgSend((id)isSearchResultPage__searchProvidersAlternateHostChecks, "objectForKey:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
        v49 = v12;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v49, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      v14 = v13;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
      v16 = v14;
      if (!v15)
        goto LABEL_39;
      v17 = v15;
      v18 = 0;
      v19 = *(_QWORD *)v40;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v40 != v19)
            objc_enumerationMutation(v14);
          v18 |= objc_msgSend(v8, "containsString:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * j));
        }
        v17 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
      }
      while (v17);

      if ((v18 & 1) != 0)
      {
        objc_msgSend((id)isSearchResultPage__searchProvidersPaths, "objectForKey:", v12);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = 0u;
        v36 = 0u;
        v37 = 0u;
        v38 = 0u;
        v16 = v21;
        v22 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
        if (v22)
        {
          v23 = v22;
          v24 = *(_QWORD *)v36;
          while (2)
          {
            for (k = 0; k != v23; ++k)
            {
              if (*(_QWORD *)v36 != v24)
                objc_enumerationMutation(v16);
              if (*(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * k))
                v26 = v9 == 0;
              else
                v26 = 1;
              if (!v26 && (objc_msgSend(v9, "isEqualToString:") & 1) != 0)
              {
                v27 = v16;
                goto LABEL_45;
              }
            }
            v23 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
            if (v23)
              continue;
            break;
          }
        }

        if (!objc_msgSend(v16, "count") && (unint64_t)objc_msgSend(v9, "length") > 1)
        {
          v28 = 0;
          goto LABEL_46;
        }
        objc_msgSend((id)isSearchResultPage__searchProvidersQueryPrefix, "objectForKey:", v12);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v16, "count") && v27 && v31 && (objc_msgSend(v31, "hasPrefix:", v27) & 1) != 0)
        {
LABEL_45:

          v28 = 1;
LABEL_46:
          v5 = v30;
          v10 = v31;

          goto LABEL_49;
        }

LABEL_39:
      }

    }
    v28 = 0;
    v5 = v30;
    v10 = v31;
    v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
    if (v33)
      continue;
    break;
  }
LABEL_49:

LABEL_50:
LABEL_51:

  return v28;
}

void __46__PRSRankingItem_Scoring__isSearchResultPage___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[2];
  _QWORD v11[2];
  const __CFString *v12;
  const __CFString *v13;
  _QWORD v14[8];
  _QWORD v15[8];
  _QWORD v16[11];

  v16[9] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v16[0] = CFSTR("baidu");
  v16[1] = CFSTR("bing");
  v16[2] = CFSTR("duckduckgo");
  v16[3] = CFSTR("ecosia");
  v16[4] = CFSTR("google");
  v16[5] = CFSTR("qihoo");
  v16[6] = CFSTR("sogou");
  v16[7] = CFSTR("yahoo");
  v16[8] = CFSTR("yandex");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 9);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)isSearchResultPage__searchProviders;
  isSearchResultPage__searchProviders = v2;

  v14[0] = CFSTR("baidu");
  v14[1] = CFSTR("bing");
  v15[0] = &unk_1E6E9B6B0;
  v15[1] = &unk_1E6E9B6C8;
  v14[2] = CFSTR("ecosia");
  v14[3] = CFSTR("google");
  v15[2] = &unk_1E6E9B6E0;
  v15[3] = &unk_1E6E9B6F8;
  v14[4] = CFSTR("qihoo");
  v14[5] = CFSTR("sogou");
  v15[4] = &unk_1E6E9B710;
  v15[5] = &unk_1E6E9B728;
  v14[6] = CFSTR("yahoo");
  v14[7] = CFSTR("yandex");
  v15[6] = &unk_1E6E9B740;
  v15[7] = &unk_1E6E9B758;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 8);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)isSearchResultPage__searchProvidersPaths;
  isSearchResultPage__searchProvidersPaths = v4;

  v12 = CFSTR("duckduckgo");
  v13 = CFSTR("q=");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)isSearchResultPage__searchProvidersQueryPrefix;
  isSearchResultPage__searchProvidersQueryPrefix = v6;

  v10[0] = CFSTR("duckduckgo");
  v10[1] = CFSTR("qihoo");
  v11[0] = &unk_1E6E9B770;
  v11[1] = &unk_1E6E9B788;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)isSearchResultPage__searchProvidersAlternateHostChecks;
  isSearchResultPage__searchProvidersAlternateHostChecks = v8;

}

- (void)resetScoreForShortcutsSetting:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  id v24;

  v24 = a3;
  SSCompactRankingAttrsGetValue((int8x8_t *)-[PRSRankingItem attributes](self, "attributes"), 0x48uLL);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.Preferences")))
  {
    SSCompactRankingAttrsGetValue((int8x8_t *)-[PRSRankingItem attributes](self, "attributes"), 0xA7uLL);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      objc_msgSend(v24, "objectForKeyedSubscript:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        -[PRSRankingItem topicalityScore](self, "topicalityScore");
        v8 = v7;
        objc_msgSend(v6, "topicalityScore");
        v10 = v9 + 0.01;
        if (v10 > 1.0)
          v10 = 1.0;
        if (v8 >= v10)
          v10 = v8;
        -[PRSRankingItem setTopicalityScore:](self, "setTopicalityScore:", v10);
        -[PRSRankingItem topicalityScore](self, "topicalityScore");
        *(float *)&v11 = v11;
        -[PRSRankingItem setKeywordMatchScore:](self, "setKeywordMatchScore:", v11);
        -[PRSRankingItem engagementScore](self, "engagementScore");
        v13 = v12;
        objc_msgSend(v6, "engagementScore");
        v15 = v14 + 0.01;
        if (v15 > 1.0)
          v15 = 1.0;
        if (v13 >= v15)
          v15 = v13;
        -[PRSRankingItem setEngagementScore:](self, "setEngagementScore:", v15);
        -[PRSRankingItem freshnessScore](self, "freshnessScore");
        v17 = v16;
        objc_msgSend(v6, "freshnessScore");
        v19 = v18 + 0.01;
        if (v19 > 1.0)
          v19 = 1.0;
        if (v17 >= v19)
          v19 = v17;
        -[PRSRankingItem setFreshnessScore:](self, "setFreshnessScore:", v19);
        -[PRSRankingItem likelihood](self, "likelihood");
        v21 = v20;
        objc_msgSend(v6, "likelihood");
        v23 = v22 + 0.01;
        if (v23 > 1.0)
          v23 = 1.0;
        if (v21 >= v23)
          v23 = v21;
        -[PRSRankingItem setLikelihood:](self, "setLikelihood:", v23);
      }

    }
  }

}

- (uint64_t)test_inputToModelScore
{
  if (result)
    return *(_QWORD *)(result + 528);
  return result;
}

- (uint64_t)inputToModelScore
{
  if (result)
    return *(_QWORD *)(result + 528);
  return result;
}

- (uint64_t)test_indexScore
{
  if (result)
    return *(_QWORD *)(result + 544);
  return result;
}

- (uint64_t)indexScore
{
  if (result)
    return *(_QWORD *)(result + 544);
  return result;
}

- (void)setTest_inputToModelScore:(PRSRankingItem *)self
{
  uint64_t v2;
  uint64_t v3;

  if (self)
  {
    *(_QWORD *)self->_inputToModelScore = v2;
    *(_QWORD *)&self->_inputToModelScore[8] = v3;
  }
}

- (void)setTest_indexScore:(PRSRankingItem *)self
{
  uint64_t v2;
  uint64_t v3;

  if (self)
  {
    *(_QWORD *)self->_indexScore = v2;
    *(_QWORD *)&self->_indexScore[8] = v3;
  }
}

+ (void)initialize
{
  __assert_rtn("+[PRSRankingItem initialize]", "PRSRankingItem.m", 4490, "NO");
}

+ (id)bundlesExcludedFromRankCategory
{
  if (bundlesExcludedFromRankCategory_onceToken != -1)
    dispatch_once(&bundlesExcludedFromRankCategory_onceToken, &__block_literal_global_151);
  return (id)bundlesExcludedFromRankCategory_sDictionary;
}

void __49__PRSRankingItem_bundlesExcludedFromRankCategory__block_invoke()
{
  uint64_t v0;
  void *v1;
  const __CFString *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v2 = CFSTR("public.image");
  v3[0] = CFSTR("com.apple.mobilemail");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, &v2, 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)bundlesExcludedFromRankCategory_sDictionary;
  bundlesExcludedFromRankCategory_sDictionary = v0;

}

- (PRSRankingItem)initWithAttrs:(id *)a3
{
  return -[PRSRankingItem initWithAttrs:isServerAlternativeResult:](self, "initWithAttrs:isServerAlternativeResult:", a3, 0);
}

- (PRSRankingItem)initWithAttrs:(id *)a3 isServerAlternativeResult:(BOOL)a4
{
  PRSRankingItem *v6;
  PRSRankingItem *v7;
  NSData *serverSuggestionsData;
  NSData *localSuggestionsData;
  PRSL2FeatureVector *v10;
  PRSL2FeatureVector *L2FeatureVector;
  uint64_t v12;
  PRSRankingSpanCalculator *spanCalculator;
  uint64_t v14;
  NSString *identifier;
  uint64_t v16;
  NSString *contentType;
  uint64_t v18;
  unint64_t v19;
  int64x2_t v20;
  float *v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t i;
  char v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  BOOL v43;
  uint64_t v44;
  NSString *sectionBundleIdentifier;
  NSString *firstMatchedAltName;
  NSString *exactMatchedKeyword;
  NSString *displayNameInitials;
  NSString *v49;
  uint64_t v50;
  NSDate *lastUsedDate;
  NSArray *recentSimilarIntentEngagementDates;
  NSDate *interestingDate;
  void *v54;
  BOOL v56;
  uint64x2_t v57;
  PRSRankingItem *v58;
  id obj;
  unint64_t v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  objc_super v65;
  _BYTE v66[128];
  _QWORD v67[2];
  _QWORD v68[3];
  int v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v65.receiver = self;
  v65.super_class = (Class)PRSRankingItem;
  v6 = -[PRSRankingItem init](&v65, sel_init);
  v7 = v6;
  if (!v6)
    return v7;
  v56 = a4;
  *(_OWORD *)v6->_indexScore = 0u;
  v6->_suggestionScore = 0.0;
  serverSuggestionsData = v6->_serverSuggestionsData;
  v6->_serverSuggestionsData = 0;

  localSuggestionsData = v7->_localSuggestionsData;
  v7->_localSuggestionsData = 0;

  v7->_attributes = a3;
  v10 = objc_alloc_init(PRSL2FeatureVector);
  L2FeatureVector = v7->_L2FeatureVector;
  v7->_L2FeatureVector = v10;

  -[PRSL2FeatureVector setRankingItem:](v7->_L2FeatureVector, "setRankingItem:", v7);
  v12 = objc_opt_new();
  spanCalculator = v7->_spanCalculator;
  v7->_spanCalculator = (PRSRankingSpanCalculator *)v12;

  v7->_itemSparseMatchStrengthType = 3;
  SSCompactRankingAttrsGetValue((int8x8_t *)v7->_attributes, 2uLL);
  v14 = objc_claimAutoreleasedReturnValue();
  identifier = v7->_identifier;
  v7->_identifier = (NSString *)v14;

  SSCompactRankingAttrsGetValue((int8x8_t *)v7->_attributes, 0);
  v16 = objc_claimAutoreleasedReturnValue();
  contentType = v7->_contentType;
  v7->_contentType = (NSString *)v16;

  SSCompactRankingAttrsGetInt128((uint64_t)v7->_attributes, 8uLL, v7->_indexScore);
  v18 = 0;
  v19 = *(_QWORD *)&v7->_indexScore[8];
  v60 = *(_QWORD *)v7->_indexScore;
  memset(v68, 0, sizeof(v68));
  v69 = 0;
  v67[0] = 0x780077F077E077DLL;
  *(_QWORD *)((char *)v67 + 6) = 0x783078207810780;
  v20 = (int64x2_t)xmmword_1B87DF3C0;
  v21 = (float *)v68 + 1;
  v57 = (uint64x2_t)vdupq_n_s64(7uLL);
  v22 = v19;
  v23 = 2 * v19;
  do
  {
    if ((vmovn_s64((int64x2_t)vcgtq_u64(v57, (uint64x2_t)v20)).u8[0] & 1) != 0)
    {
      if ((v18 & 0x40) != 0)
        v24 = v19 >> v18;
      else
        v24 = (v23 << ~(_BYTE)v18) | (v60 >> v18);
      if ((v18 & 0x40) != 0)
        v25 = 0;
      else
        v25 = v19 >> v18;
      *(v21 - 1) = (float)*(unsigned __int128 *)&v24;
    }
    if ((vmovn_s64((int64x2_t)vcgtq_u64((uint64x2_t)vdupq_n_s64(7uLL), *(uint64x2_t *)&v20)).i32[1] & 1) != 0)
    {
      if (((v18 + 24) & 0x40) != 0)
        v26 = v19 >> (v18 + 24);
      else
        v26 = (v23 << ~(v18 + 24)) | (v60 >> (v18 + 24));
      if (((v18 + 24) & 0x40) != 0)
        v27 = 0;
      else
        v27 = v19 >> (v18 + 24);
      *v21 = (float)*(unsigned __int128 *)&v26;
    }
    v20 = vaddq_s64(v20, vdupq_n_s64(2uLL));
    v18 += 48;
    v21 += 2;
  }
  while (v18 != 192);
  -[PRSL2FeatureVector setScores:forFeatures:count:](v7->_L2FeatureVector, "setScores:forFeatures:count:", v68, v67, 7);
  v58 = v7;
  -[PRSL2FeatureVector setIndexScore:](v7->_L2FeatureVector, "setIndexScore:", *(_QWORD *)v7->_indexScore, *(_QWORD *)&v7->_indexScore[8]);
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  obj = (id)sModelScoreBitMapRepresentation;
  v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
  if (v28)
  {
    v29 = v28;
    v30 = 0;
    v31 = 0;
    v32 = 0;
    v33 = *(_QWORD *)v62;
    do
    {
      for (i = 0; i != v29; ++i)
      {
        if (*(_QWORD *)v62 != v33)
          objc_enumerationMutation(obj);
        v35 = v32 + i;
        v36 = objc_msgSend(*(id *)(*((_QWORD *)&v61 + 1) + 8 * i), "unsignedIntegerValue");
        v37 = (v23 << ~v36) | (v60 >> v36);
        if ((v36 & 0x40) != 0)
          v37 = v22 >> v36;
        v38 = v37 << 63 >> 63;
        v39 = 1 << v35;
        if (((v32 + (_BYTE)i) & 0x40) != 0)
          v40 = 0;
        else
          v40 = 1 << v35;
        if (((v32 + (_BYTE)i) & 0x40) == 0)
          v39 = 0;
        v41 = v38 & v39;
        v42 = v38 & v40;
        v43 = __CFADD__(v42, v30);
        v30 += v42;
        v31 += v43 + v41;
      }
      v32 += v29;
      v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
    }
    while (v29);
  }
  else
  {
    v30 = 0;
    v31 = 0;
  }

  v7 = v58;
  *(_QWORD *)&v58->_inputToModelScore[8] = v31;
  *(_QWORD *)v58->_inputToModelScore = v30;
  SSCompactRankingAttrsGetValue((int8x8_t *)v58->_attributes, 0xAuLL);
  v44 = objc_claimAutoreleasedReturnValue();
  sectionBundleIdentifier = v58->_sectionBundleIdentifier;
  v58->_sectionBundleIdentifier = (NSString *)v44;

  firstMatchedAltName = v58->_firstMatchedAltName;
  v58->_firstMatchedAltName = 0;

  exactMatchedKeyword = v58->_exactMatchedKeyword;
  v58->_exactMatchedKeyword = 0;

  displayNameInitials = v58->_displayNameInitials;
  v58->_displayNameInitials = 0;

  v58->_importantPropertiesPrefixMatched = 0;
  v58->_importantPropertiesWordMatched = 0;
  v49 = v58->_sectionBundleIdentifier;
  if (-[NSString isEqualToString:](v49, "isEqualToString:", CFSTR("com.apple.mobilenotes")))
  {
    v50 = 2;
    goto LABEL_66;
  }
  if (-[NSString isEqualToString:](v49, "isEqualToString:", CFSTR("com.apple.MobileAddressBook")))
  {
    v50 = 4;
    goto LABEL_66;
  }
  if (-[NSString isEqualToString:](v49, "isEqualToString:", CFSTR("com.apple.MobileSMS")))
  {
    v50 = 8;
    goto LABEL_66;
  }
  if (-[NSString isEqualToString:](v49, "isEqualToString:", CFSTR("com.apple.Preferences")))
  {
    v50 = 16;
    goto LABEL_66;
  }
  if (-[NSString isEqualToString:](v49, "isEqualToString:", CFSTR("com.apple.mobilecal")))
  {
    v50 = 32;
    goto LABEL_66;
  }
  if (-[NSString isEqualToString:](v49, "isEqualToString:", CFSTR("com.apple.spotlight.events")))
  {
    v50 = 0x20000000000000;
    goto LABEL_66;
  }
  if (-[NSString isEqualToString:](v49, "isEqualToString:", CFSTR("com.apple.reminders")))
  {
    v50 = 64;
    goto LABEL_66;
  }
  if (-[NSString isEqualToString:](v49, "isEqualToString:", CFSTR("com.apple.mobilesafari")))
  {
    v50 = 128;
    goto LABEL_66;
  }
  if (-[NSString isEqualToString:](v49, "isEqualToString:", CFSTR("com.apple.application")))
  {
    v50 = 256;
    goto LABEL_66;
  }
  if (-[NSString isEqualToString:](v49, "isEqualToString:", CFSTR("com.apple.Music")))
  {
    v50 = 512;
    goto LABEL_66;
  }
  if (-[NSString isEqualToString:](v49, "isEqualToString:", CFSTR("com.apple.weather")))
  {
    v50 = 1024;
    goto LABEL_66;
  }
  if (-[NSString isEqualToString:](v49, "isEqualToString:", CFSTR("com.apple.CloudDocs.iCloudDriveFileProvider"))
    || -[NSString isEqualToString:](v49, "isEqualToString:", CFSTR("com.apple.CloudDocs.iCloudDriveFileProviderManaged")))
  {
    v50 = 2048;
    goto LABEL_66;
  }
  if (-[NSString isEqualToString:](v49, "isEqualToString:", CFSTR("com.apple.DocumentsApp"))
    || -[NSString isEqualToString:](v49, "isEqualToString:", CFSTR("com.apple.FileProvider.LocalStorage"))
    || -[NSString isEqualToString:](v49, "isEqualToString:", CFSTR("com.apple.CloudDocs.MobileDocumentsFileProvider")))
  {
    v50 = 2048;
LABEL_65:
    v7 = v58;
    goto LABEL_66;
  }
  if (-[NSString isEqualToString:](v49, "isEqualToString:", CFSTR("com.apple.calculation")))
  {
    v50 = 4096;
    goto LABEL_65;
  }
  if (-[NSString isEqualToString:](v49, "isEqualToString:", CFSTR("com.apple.worldclock")))
  {
    v50 = 0x40000000;
    goto LABEL_65;
  }
  if (-[NSString isEqualToString:](v49, "isEqualToString:", CFSTR("com.apple.datadetector.quick_actions")))
  {
    v50 = 0x80000000;
    goto LABEL_65;
  }
  if (-[NSString isEqualToString:](v49, "isEqualToString:", CFSTR("com.apple.conversion")))
  {
    v50 = 0x2000;
    goto LABEL_65;
  }
  if (-[NSString isEqualToString:](v49, "isEqualToString:", CFSTR("com.apple.app-clips")))
  {
    v50 = 0x10000;
    goto LABEL_65;
  }
  if (-[NSString isEqualToString:](v49, "isEqualToString:", CFSTR("com.apple.photos")))
  {
    v50 = 0x20000;
    goto LABEL_65;
  }
  if (-[NSString isEqualToString:](v49, "isEqualToString:", CFSTR("com.apple.mobileslideshow")))
  {
    v50 = 0x40000;
    goto LABEL_65;
  }
  if (-[NSString isEqualToString:](v49, "isEqualToString:", CFSTR("com.apple.shortcuts")))
  {
    v50 = 0x200000;
    goto LABEL_65;
  }
  if (-[NSString isEqualToString:](v49, "isEqualToString:", CFSTR("com.apple.mobiletimer")))
  {
    v50 = 0x100000000;
    goto LABEL_65;
  }
  if (-[NSString isEqualToString:](v49, "isEqualToString:", CFSTR("com.apple.Passbook")))
  {
    v50 = 0x200000000;
    goto LABEL_65;
  }
  if (-[NSString isEqualToString:](v49, "isEqualToString:", CFSTR("com.apple.people.findMy")))
  {
    v50 = 0x400000;
    goto LABEL_65;
  }
  if (-[NSString isEqualToString:](v49, "isEqualToString:", CFSTR("com.apple.people.askToBuyRequest")))
  {
    v50 = 0x800000;
    goto LABEL_65;
  }
  if (-[NSString isEqualToString:](v49, "isEqualToString:", CFSTR("com.apple.people.screenTimeRequest")))
  {
    v50 = 0x1000000;
    goto LABEL_65;
  }
  if (-[NSString isEqualToString:](v49, "isEqualToString:", CFSTR("com.apple.searchd.syndicatedPhotos")))
  {
    v50 = 0x2000000;
    goto LABEL_65;
  }
  if (-[NSString isEqualToString:](v49, "isEqualToString:", CFSTR("com.apple.mobilemail")))
  {
    v50 = 0x100000;
    goto LABEL_65;
  }
  if (-[NSString isEqualToString:](v49, "isEqualToString:", CFSTR("com.apple.dictionary")))
  {
    v50 = 0x800000000000;
    goto LABEL_65;
  }
  if (-[NSString isEqualToString:](v49, "isEqualToString:", CFSTR("com.apple.iBooks")))
  {
    v50 = 0x2000000000000;
    goto LABEL_65;
  }
  if (-[NSString isEqualToString:](v49, "isEqualToString:", CFSTR("com.apple.tips")))
  {
    v50 = 0x4000000000000;
    goto LABEL_65;
  }
  v7 = v58;
  if (!-[NSString isEqualToString:](v49, "isEqualToString:", CFSTR("com.apple.podcasts")))
    goto LABEL_67;
  v50 = 0x40000000000000;
LABEL_66:
  v7->_bundleIDType |= v50;
LABEL_67:
  if (-[NSString hasPrefix:](v7->_identifier, "hasPrefix:", CFSTR("com.apple.coreduet.")))
    v7->_bundleIDType |= 0x4000uLL;
  v7->_isPrepared = 0;
  *(_QWORD *)&v7->_hasPolicyMultipleTermsNearMatch = 0;
  *(_QWORD *)&v7->_eligibleForDemotion = 0;
  *(_QWORD *)&v7->_displayNameInitialsPrefixMatchOnly = 0;
  v7->_isServerAlternativeResult = v56;
  v7->_topHitReason = 0;
  objc_msgSend(CFSTR("com.apple.searchd"), "UTF8String");
  v7->_isInternal = os_variant_has_internal_diagnostics();
  v7->_queryTermCount = -1;
  *(_OWORD *)&v7->_attrCountsPrefix = 0u;
  *(_OWORD *)&v7->_attrCountsPrefixLast = 0u;
  *(_OWORD *)&v7->_attrCountsWord2 = 0u;
  *(_OWORD *)&v7->_attrCountsPrefix3 = 0u;
  *(_OWORD *)&v7->_attrCountsPrefixLast3 = 0u;
  *(_OWORD *)&v7->_attrStrong = 0u;
  *(_QWORD *)&v7->_maxCoverage = 0x4F00000000000000;
  lastUsedDate = v7->_lastUsedDate;
  v7->_lastUsedDate = 0;

  recentSimilarIntentEngagementDates = v7->_recentSimilarIntentEngagementDates;
  v7->_recentSimilarIntentEngagementDates = 0;

  v7->_mostRecentUseInMinutes = 0.0;
  interestingDate = v7->_interestingDate;
  v7->_interestingDate = 0;

  v7->_cachedFeatures = 0;
  requiredTextFeatureAttributes();
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  sRequiredAttributesCount = objc_msgSend(v54, "count");

  v7->_isAppEntity = 0;
  return v7;
}

- (id)initForParsecResultWithBundleID:(id)a3
{
  id v5;
  PRSRankingItem *v6;
  PRSRankingItem *v7;
  NSData *localSuggestionsData;
  NSData *serverSuggestionsData;
  PRSL2FeatureVector *v10;
  PRSL2FeatureVector *L2FeatureVector;
  uint64_t v12;
  PRSRankingSpanCalculator *spanCalculator;
  NSString *v14;
  NSString *firstMatchedAltName;
  NSString *exactMatchedKeyword;
  NSString *displayNameInitials;
  NSDate *lastUsedDate;
  NSArray *recentSimilarIntentEngagementDates;
  NSDate *interestingDate;
  void *v21;
  uint64_t v22;
  objc_super v24;

  v5 = a3;
  v24.receiver = self;
  v24.super_class = (Class)PRSRankingItem;
  v6 = -[PRSRankingItem init](&v24, sel_init);
  v7 = v6;
  if (v6)
  {
    *(_OWORD *)v6->_indexScore = 0u;
    v6->_suggestionScore = 0.0;
    localSuggestionsData = v6->_localSuggestionsData;
    v6->_localSuggestionsData = 0;

    serverSuggestionsData = v7->_serverSuggestionsData;
    v7->_serverSuggestionsData = 0;

    v10 = objc_alloc_init(PRSL2FeatureVector);
    L2FeatureVector = v7->_L2FeatureVector;
    v7->_L2FeatureVector = v10;

    v12 = objc_opt_new();
    spanCalculator = v7->_spanCalculator;
    v7->_spanCalculator = (PRSRankingSpanCalculator *)v12;

    objc_storeStrong((id *)&v7->_sectionBundleIdentifier, a3);
    v14 = v7->_sectionBundleIdentifier;
    firstMatchedAltName = v7->_firstMatchedAltName;
    v7->_firstMatchedAltName = 0;

    exactMatchedKeyword = v7->_exactMatchedKeyword;
    v7->_exactMatchedKeyword = 0;

    displayNameInitials = v7->_displayNameInitials;
    v7->_displayNameInitials = 0;

    v7->_isPrepared = 0;
    v7->_topHitReason = 0;
    *(_QWORD *)&v7->_eligibleForDemotion = 0;
    *(_QWORD *)&v7->_displayNameInitialsFirstWordAndMoreMatchOnly = 0;
    *(_QWORD *)&v7->_hasPolicyMultipleTermsNearMatch = 0;
    v7->_importantPropertiesPrefixMatched = 0;
    v7->_importantPropertiesWordMatched = 0;
    objc_msgSend(CFSTR("com.apple.searchd"), "UTF8String");
    v7->_isInternal = os_variant_has_internal_diagnostics();
    v7->_queryTermCount = -1;
    *(_OWORD *)&v7->_attrCountsPrefix = 0u;
    *(_OWORD *)&v7->_attrCountsPrefixLast = 0u;
    *(_OWORD *)&v7->_attrCountsWord2 = 0u;
    *(_OWORD *)&v7->_attrCountsPrefix3 = 0u;
    *(_OWORD *)&v7->_attrCountsPrefixLast3 = 0u;
    *(_OWORD *)&v7->_attrStrong = 0u;
    *(_QWORD *)&v7->_maxCoverage = 0x4F00000000000000;
    lastUsedDate = v7->_lastUsedDate;
    v7->_lastUsedDate = 0;

    recentSimilarIntentEngagementDates = v7->_recentSimilarIntentEngagementDates;
    v7->_recentSimilarIntentEngagementDates = 0;

    v7->_mostRecentUseInMinutes = 0.0;
    interestingDate = v7->_interestingDate;
    v7->_interestingDate = 0;

    v7->_cachedFeatures = 0;
    requiredTextFeatureAttributes();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    sRequiredAttributesCount = objc_msgSend(v21, "count");

    if (-[NSString isEqualToString:](v14, "isEqualToString:", CFSTR("com.apple.parsec.web_index")))
    {
      v22 = 0x200000000000;
    }
    else if (-[NSString isEqualToString:](v14, "isEqualToString:", CFSTR("com.apple.parsec.maps")))
    {
      v22 = 0x10000000000;
    }
    else if (-[NSString isEqualToString:](v14, "isEqualToString:", CFSTR("com.apple.parsec.stocks")))
    {
      v22 = 0x20000000000;
    }
    else if (-[NSString isEqualToString:](v14, "isEqualToString:", CFSTR("com.apple.parsec.sports")))
    {
      v22 = 0x40000000000;
    }
    else if (-[NSString isEqualToString:](v14, "isEqualToString:", CFSTR("com.apple.parsec.itunes.iosSoftware"))
           || -[NSString isEqualToString:](v14, "isEqualToString:", CFSTR("com.apple.parsec.itunes.iosSoftware")))
    {
      v22 = 0x80000000000;
    }
    else if (-[NSString isEqualToString:](v14, "isEqualToString:", CFSTR("com.apple.parsec.kg")))
    {
      v22 = 0x100000000000;
    }
    else if (-[NSString isEqualToString:](v14, "isEqualToString:", CFSTR("com.apple.parsec.movies"))
           || -[NSString hasPrefix:](v14, "hasPrefix:", CFSTR("com.apple.parsec.itunes.")))
    {
      v22 = 0x400000000000;
    }
    else if (-[NSString isEqualToString:](v14, "isEqualToString:", CFSTR("com.apple.parsec.dictionary")))
    {
      v22 = 0x1000000000000;
    }
    else if (-[NSString isEqualToString:](v14, "isEqualToString:", CFSTR("com.apple.parsec.weather")))
    {
      v22 = 1;
    }
    else
    {
      if (!-[NSString isEqualToString:](v14, "isEqualToString:", CFSTR("com.apple.parsec.web_answer.passage")))
        goto LABEL_14;
      v22 = 0x80000000000000;
    }
    v7->_bundleIDType |= v22;
LABEL_14:

  }
  return v7;
}

- (void)dealloc
{
  unint64_t *attrCountsPrefix;
  unint64_t *attrCountsWord;
  unint64_t *attrCountsPrefixLast;
  unint64_t *attrCountsPrefix2;
  unint64_t *attrCountsWord2;
  unint64_t *attrCountsPrefixLast2;
  unint64_t *attrCountsPrefix3;
  unint64_t *attrCountsWord3;
  unint64_t *attrCountsPrefixLast3;
  float *cachedFeatures;
  objc_super v13;

  SSCompactRankingAttrsDealloc((char *)self->_attributes);
  attrCountsPrefix = self->_attrCountsPrefix;
  if (attrCountsPrefix)
    free(attrCountsPrefix);
  attrCountsWord = self->_attrCountsWord;
  if (attrCountsWord)
    free(attrCountsWord);
  attrCountsPrefixLast = self->_attrCountsPrefixLast;
  if (attrCountsPrefixLast)
    free(attrCountsPrefixLast);
  attrCountsPrefix2 = self->_attrCountsPrefix2;
  if (attrCountsPrefix2)
    free(attrCountsPrefix2);
  attrCountsWord2 = self->_attrCountsWord2;
  if (attrCountsWord2)
    free(attrCountsWord2);
  attrCountsPrefixLast2 = self->_attrCountsPrefixLast2;
  if (attrCountsPrefixLast2)
    free(attrCountsPrefixLast2);
  attrCountsPrefix3 = self->_attrCountsPrefix3;
  if (attrCountsPrefix3)
    free(attrCountsPrefix3);
  attrCountsWord3 = self->_attrCountsWord3;
  if (attrCountsWord3)
    free(attrCountsWord3);
  attrCountsPrefixLast3 = self->_attrCountsPrefixLast3;
  if (attrCountsPrefixLast3)
    free(attrCountsPrefixLast3);
  cachedFeatures = self->_cachedFeatures;
  if (cachedFeatures)
    free(cachedFeatures);
  v13.receiver = self;
  v13.super_class = (Class)PRSRankingItem;
  -[PRSRankingItem dealloc](&v13, sel_dealloc);
}

+ (unint64_t)requiredAttributesCount
{
  return sRequiredAttributesCount;
}

- (BOOL)didMatchRankingDescriptor:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;

  v4 = a3;
  objc_msgSend((id)sRankingQueryIndexDictionary, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedLongLongValue");

  if (v6 >= 0x81)
    -[PRSRankingItem didMatchRankingDescriptor:].cold.1();
  v7 = *(_QWORD *)&self->_indexScore[8];
  v8 = (2 * v7) << ~(_BYTE)v6;
  v9 = v7 >> v6;
  if ((v6 & 0x40) != 0)
    LOBYTE(v10) = v9;
  else
    v10 = v8 | (*(_QWORD *)self->_indexScore >> v6);

  return v10 & 1;
}

- (void)populateContactFeatures:(PRSL2FeatureScoreInfo *)a3 currentTime:(double)a4
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  float v18;
  float *var1;
  unint64_t var2;
  float v21;
  float *v22;
  unint64_t v23;
  float v24;
  float *v25;
  unint64_t v26;
  float v27;
  float *v28;
  unint64_t v29;
  float v30;
  float *v31;
  unint64_t v32;
  float v33;
  float *v34;
  unint64_t v35;
  float v36;
  float *v37;
  unint64_t v38;
  float v39;
  float *v40;
  unint64_t v41;
  float *v42;
  unint64_t v43;
  float *v44;
  unint64_t v45;
  float *v46;
  unint64_t v47;
  float *v48;
  unint64_t v49;
  int ArrayInt64;
  unsigned __int16 *var0;
  unint64_t v52;
  float *v53;
  unint64_t v54;
  float v55;
  float *v56;
  unint64_t v57;
  float v58;
  float *v59;
  unint64_t v60;
  float v61;
  float *v62;
  unint64_t v63;
  float v64;
  float *v65;
  unint64_t v66;
  float *v67;
  unint64_t v68;
  float *v69;
  unint64_t v70;
  float *v71;
  unint64_t v72;
  float *v73;
  unint64_t v74;
  float v75;
  float *v76;
  unint64_t v77;
  float v78;
  float *v79;
  unint64_t v80;
  float v81;
  float *v82;
  unint64_t v83;
  float v84;
  float *v85;
  unint64_t v86;
  float *v87;
  unint64_t v88;
  float *v89;
  unint64_t v90;
  float *v91;
  unint64_t v92;
  float *v93;
  unint64_t v94;
  float v95;
  float *v96;
  unint64_t v97;
  float v98;
  float *v99;
  unint64_t v100;
  float v101;
  float *v102;
  unint64_t v103;
  float v104;
  float *v105;
  unint64_t v106;
  float *v107;
  unint64_t v108;
  float *v109;
  unint64_t v110;
  float *v111;
  unint64_t v112;
  float *v113;
  unint64_t v114;
  float v115;
  float *v116;
  unint64_t v117;
  float v118;
  float *v119;
  unint64_t v120;
  float v121;
  float *v122;
  unint64_t v123;
  float v124;
  float *v125;
  unint64_t v126;
  float *v127;
  unint64_t v128;
  float *v129;
  unint64_t v130;
  float *v131;
  unint64_t v132;
  float *v133;
  unint64_t v134;
  float v135;
  float *v136;
  unint64_t v137;
  float v138;
  float *v139;
  unint64_t v140;
  float v141;
  float *v142;
  unint64_t v143;
  float v144;
  float *v145;
  unint64_t v146;
  float *v147;
  unint64_t v148;
  float *v149;
  unint64_t v150;
  float *v151;
  unint64_t v152;
  float *v153;
  unint64_t v154;
  float v155;
  float *v156;
  unint64_t v157;
  float v158;
  float *v159;
  unint64_t v160;
  float v161;
  float *v162;
  unint64_t v163;
  float v164;
  float *v165;
  unint64_t v166;
  float *v167;
  unint64_t v168;
  float *v169;
  unint64_t v170;
  float *v171;
  unint64_t v172;
  float *v173;
  unint64_t v174;
  float v175;
  float *v176;
  unint64_t v177;
  float v178;
  float *v179;
  unint64_t v180;
  float v181;
  float *v182;
  unint64_t v183;
  float v184;
  float *v185;
  unint64_t v186;
  float *v187;
  unint64_t v188;
  float *v189;
  unint64_t v190;
  float *v191;
  unint64_t v192;
  float *v193;
  unint64_t v194;
  float v195;
  float *v196;
  unint64_t v197;
  float v198;
  float *v199;
  unint64_t v200;
  float v201;
  float *v202;
  unint64_t v203;
  float v204;
  float *v205;
  unint64_t v206;
  float *v207;
  unint64_t v208;
  float *v209;
  unint64_t v210;
  float *v211;
  unint64_t v212;
  float *v213;
  unint64_t v214;
  float v215;
  float *v216;
  unint64_t v217;
  float v218;
  float *v219;
  unint64_t v220;
  float v221;
  float *v222;
  unint64_t v223;
  float v224;
  float *v225;
  unint64_t v226;
  float *v227;
  unint64_t v228;
  float *v229;
  unint64_t v230;
  float *v231;
  unint64_t v232;
  float *v233;
  unint64_t v234;
  void *v235;
  PRSRankingItem *v236;
  __int128 v237;
  __int128 v238;
  __int128 v239;
  __int128 v240;
  __int128 v241;
  __int128 v242;
  __int128 v243;
  __int128 v244;
  __int128 v245;
  __int128 v246;
  __int128 v247;
  __int128 v248;
  __int128 __dst;
  __int128 v250;
  _BYTE v251[128];
  uint64_t v252;

  v252 = *MEMORY[0x1E0C80C00];
  requiredContactAttributes();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    v9 = 0;
    v10 = 0;
    v236 = self;
    do
    {
      *(_QWORD *)&__dst = 0;
      *(_QWORD *)&v247 = 0;
      *(_QWORD *)&v245 = 0;
      *(_QWORD *)&v243 = 0;
      SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, requiredContactAttributesIndexes_attrs[v9]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11)
      {
        v239 = 0u;
        v240 = 0u;
        v237 = 0u;
        v238 = 0u;
        v13 = v11;
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v237, v251, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v238;
          while (2)
          {
            for (i = 0; i != v15; ++i)
            {
              if (*(_QWORD *)v238 != v16)
                objc_enumerationMutation(v13);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {

                goto LABEL_14;
              }
            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v237, v251, 16);
            if (v15)
              continue;
            break;
          }
        }

        +[PRSRankingUtilities computeDateCountsForDates:countLastYear:countLastMonth:countLastWeek:countLastDay:currentTime:](PRSRankingUtilities, "computeDateCountsForDates:countLastYear:countLastMonth:countLastWeek:countLastDay:currentTime:", v13, &__dst, &v247, &v245, &v243, a4);
LABEL_14:
        self = v236;
      }
      v18 = (float)(unint64_t)__dst;
      a3->var0[a3->var2] = sContactsFeatureList[v10];
      var1 = a3->var1;
      var2 = a3->var2;
      a3->var2 = var2 + 1;
      var1[var2] = v18;
      v21 = (float)(unint64_t)v247;
      a3->var0[var2 + 1] = sContactsFeatureList[v10 | 1];
      v22 = a3->var1;
      v23 = a3->var2;
      a3->var2 = v23 + 1;
      v22[v23] = v21;
      LODWORD(v22) = v10 | 3;
      v24 = (float)(unint64_t)v245;
      a3->var0[v23 + 1] = sContactsFeatureList[v10 | 2];
      v25 = a3->var1;
      v26 = a3->var2;
      a3->var2 = v26 + 1;
      v25[v26] = v24;
      v10 += 4;
      v27 = (float)(unint64_t)v243;
      a3->var0[v26 + 1] = sContactsFeatureList[v22];
      v28 = a3->var1;
      v29 = a3->var2;
      a3->var2 = v29 + 1;
      v28[v29] = v27;

      ++v9;
    }
    while (v9 != v8);
  }
  __dst = 0u;
  v250 = 0u;
  if ((SSCompactRankingAttrsGetArrayInt64((uint64_t)self->_attributes, 0x114uLL, &__dst, 4) & 1) != 0)
  {
    v30 = (float)(uint64_t)__dst;
    a3->var0[a3->var2] = 307;
    v31 = a3->var1;
    v32 = a3->var2;
    a3->var2 = v32 + 1;
    v31[v32] = v30;
    v33 = v30 + (float)*((uint64_t *)&__dst + 1);
    a3->var0[v32 + 1] = 306;
    v34 = a3->var1;
    v35 = a3->var2;
    a3->var2 = v35 + 1;
    v34[v35] = v33;
    v36 = v33 + (float)(uint64_t)v250;
    a3->var0[v35 + 1] = 305;
    v37 = a3->var1;
    v38 = a3->var2;
    a3->var2 = v38 + 1;
    v37[v38] = v36;
    v39 = v36 + (float)*((uint64_t *)&v250 + 1);
    a3->var0[v38 + 1] = 304;
    v40 = a3->var1;
    v41 = a3->var2;
    a3->var2 = v41 + 1;
    v40[v41] = v39;
  }
  else
  {
    a3->var0[a3->var2] = 307;
    v42 = a3->var1;
    v43 = a3->var2;
    a3->var2 = v43 + 1;
    v42[v43] = 0.0;
    a3->var0[v43 + 1] = 306;
    v44 = a3->var1;
    v45 = a3->var2;
    a3->var2 = v45 + 1;
    v44[v45] = 0.0;
    a3->var0[v45 + 1] = 305;
    v46 = a3->var1;
    v47 = a3->var2;
    a3->var2 = v47 + 1;
    v46[v47] = 0.0;
    a3->var0[v47 + 1] = 304;
    v48 = a3->var1;
    v49 = a3->var2;
    a3->var2 = v49 + 1;
    v48[v49] = 0.0;
  }
  ArrayInt64 = SSCompactRankingAttrsGetArrayInt64((uint64_t)self->_attributes, 0x115uLL, &__dst, 4);
  var0 = a3->var0;
  v52 = a3->var2;
  if (ArrayInt64)
  {
    var0[v52] = 327;
    v53 = a3->var1;
    v54 = a3->var2;
    a3->var2 = v54 + 1;
    v53[v54] = 1.0;
    v55 = (float)(uint64_t)__dst;
    a3->var0[v54 + 1] = 303;
    v56 = a3->var1;
    v57 = a3->var2;
    a3->var2 = v57 + 1;
    v56[v57] = v55;
    v58 = v55 + (float)*((uint64_t *)&__dst + 1);
    a3->var0[v57 + 1] = 302;
    v59 = a3->var1;
    v60 = a3->var2;
    a3->var2 = v60 + 1;
    v59[v60] = v58;
    v61 = v58 + (float)(uint64_t)v250;
    a3->var0[v60 + 1] = 301;
    v62 = a3->var1;
    v63 = a3->var2;
    a3->var2 = v63 + 1;
    v62[v63] = v61;
    v64 = v61 + (float)*((uint64_t *)&v250 + 1);
    a3->var0[v63 + 1] = 300;
    v65 = a3->var1;
    v66 = a3->var2;
    a3->var2 = v66 + 1;
    v65[v66] = v64;
  }
  else
  {
    var0[v52] = 303;
    v67 = a3->var1;
    v68 = a3->var2;
    a3->var2 = v68 + 1;
    v67[v68] = 0.0;
    a3->var0[v68 + 1] = 302;
    v69 = a3->var1;
    v70 = a3->var2;
    a3->var2 = v70 + 1;
    v69[v70] = 0.0;
    a3->var0[v70 + 1] = 301;
    v71 = a3->var1;
    v72 = a3->var2;
    a3->var2 = v72 + 1;
    v71[v72] = 0.0;
    a3->var0[v72 + 1] = 300;
    v73 = a3->var1;
    v74 = a3->var2;
    a3->var2 = v74 + 1;
    v73[v74] = 0.0;
  }
  v247 = 0u;
  v248 = 0u;
  if (SSCompactRankingAttrsGetArrayInt64((uint64_t)self->_attributes, 0x12DuLL, &v247, 4))
  {
    v75 = (float)(uint64_t)v247;
    a3->var0[a3->var2] = 1990;
    v76 = a3->var1;
    v77 = a3->var2;
    a3->var2 = v77 + 1;
    v76[v77] = v75;
    v78 = v75 + (float)*((uint64_t *)&v247 + 1);
    a3->var0[v77 + 1] = 1989;
    v79 = a3->var1;
    v80 = a3->var2;
    a3->var2 = v80 + 1;
    v79[v80] = v78;
    v81 = v78 + (float)(uint64_t)v248;
    a3->var0[v80 + 1] = 1988;
    v82 = a3->var1;
    v83 = a3->var2;
    a3->var2 = v83 + 1;
    v82[v83] = v81;
    v84 = v81 + (float)*((uint64_t *)&v248 + 1);
    a3->var0[v83 + 1] = 1987;
    v85 = a3->var1;
    v86 = a3->var2;
    a3->var2 = v86 + 1;
    v85[v86] = v84;
  }
  else
  {
    a3->var0[a3->var2] = 1990;
    v87 = a3->var1;
    v88 = a3->var2;
    a3->var2 = v88 + 1;
    v87[v88] = 0.0;
    a3->var0[v88 + 1] = 1989;
    v89 = a3->var1;
    v90 = a3->var2;
    a3->var2 = v90 + 1;
    v89[v90] = 0.0;
    a3->var0[v90 + 1] = 1988;
    v91 = a3->var1;
    v92 = a3->var2;
    a3->var2 = v92 + 1;
    v91[v92] = 0.0;
    a3->var0[v92 + 1] = 1987;
    v93 = a3->var1;
    v94 = a3->var2;
    a3->var2 = v94 + 1;
    v93[v94] = 0.0;
  }
  SSCompactRankingAttrsGetArrayInt64((uint64_t)self->_attributes, 0x12EuLL, &v247, 4);
  if (ArrayInt64)
  {
    v95 = (float)(uint64_t)v247;
    a3->var0[a3->var2] = 1986;
    v96 = a3->var1;
    v97 = a3->var2;
    a3->var2 = v97 + 1;
    v96[v97] = v95;
    v98 = v95 + (float)*((uint64_t *)&v247 + 1);
    a3->var0[v97 + 1] = 1985;
    v99 = a3->var1;
    v100 = a3->var2;
    a3->var2 = v100 + 1;
    v99[v100] = v98;
    v101 = v98 + (float)(uint64_t)v248;
    a3->var0[v100 + 1] = 1984;
    v102 = a3->var1;
    v103 = a3->var2;
    a3->var2 = v103 + 1;
    v102[v103] = v101;
    v104 = v101 + (float)*((uint64_t *)&v248 + 1);
    a3->var0[v103 + 1] = 1983;
    v105 = a3->var1;
    v106 = a3->var2;
    a3->var2 = v106 + 1;
    v105[v106] = v104;
  }
  else
  {
    a3->var0[a3->var2] = 1986;
    v107 = a3->var1;
    v108 = a3->var2;
    a3->var2 = v108 + 1;
    v107[v108] = 0.0;
    a3->var0[v108 + 1] = 1985;
    v109 = a3->var1;
    v110 = a3->var2;
    a3->var2 = v110 + 1;
    v109[v110] = 0.0;
    a3->var0[v110 + 1] = 1984;
    v111 = a3->var1;
    v112 = a3->var2;
    a3->var2 = v112 + 1;
    v111[v112] = 0.0;
    a3->var0[v112 + 1] = 1983;
    v113 = a3->var1;
    v114 = a3->var2;
    a3->var2 = v114 + 1;
    v113[v114] = 0.0;
  }
  v245 = 0u;
  v246 = 0u;
  if (SSCompactRankingAttrsGetArrayInt64((uint64_t)self->_attributes, 0x12FuLL, &v245, 4))
  {
    v115 = (float)(uint64_t)v245;
    a3->var0[a3->var2] = 1998;
    v116 = a3->var1;
    v117 = a3->var2;
    a3->var2 = v117 + 1;
    v116[v117] = v115;
    v118 = v115 + (float)*((uint64_t *)&v245 + 1);
    a3->var0[v117 + 1] = 1997;
    v119 = a3->var1;
    v120 = a3->var2;
    a3->var2 = v120 + 1;
    v119[v120] = v118;
    v121 = v118 + (float)(uint64_t)v246;
    a3->var0[v120 + 1] = 1996;
    v122 = a3->var1;
    v123 = a3->var2;
    a3->var2 = v123 + 1;
    v122[v123] = v121;
    v124 = v121 + (float)*((uint64_t *)&v246 + 1);
    a3->var0[v123 + 1] = 1995;
    v125 = a3->var1;
    v126 = a3->var2;
    a3->var2 = v126 + 1;
    v125[v126] = v124;
  }
  else
  {
    a3->var0[a3->var2] = 1998;
    v127 = a3->var1;
    v128 = a3->var2;
    a3->var2 = v128 + 1;
    v127[v128] = 0.0;
    a3->var0[v128 + 1] = 1997;
    v129 = a3->var1;
    v130 = a3->var2;
    a3->var2 = v130 + 1;
    v129[v130] = 0.0;
    a3->var0[v130 + 1] = 1996;
    v131 = a3->var1;
    v132 = a3->var2;
    a3->var2 = v132 + 1;
    v131[v132] = 0.0;
    a3->var0[v132 + 1] = 1995;
    v133 = a3->var1;
    v134 = a3->var2;
    a3->var2 = v134 + 1;
    v133[v134] = 0.0;
  }
  SSCompactRankingAttrsGetArrayInt64((uint64_t)self->_attributes, 0x130uLL, &v245, 4);
  if (ArrayInt64)
  {
    v135 = (float)(uint64_t)v245;
    a3->var0[a3->var2] = 1994;
    v136 = a3->var1;
    v137 = a3->var2;
    a3->var2 = v137 + 1;
    v136[v137] = v135;
    v138 = v135 + (float)*((uint64_t *)&v245 + 1);
    a3->var0[v137 + 1] = 1993;
    v139 = a3->var1;
    v140 = a3->var2;
    a3->var2 = v140 + 1;
    v139[v140] = v138;
    v141 = v138 + (float)(uint64_t)v246;
    a3->var0[v140 + 1] = 1992;
    v142 = a3->var1;
    v143 = a3->var2;
    a3->var2 = v143 + 1;
    v142[v143] = v141;
    v144 = v141 + (float)*((uint64_t *)&v246 + 1);
    a3->var0[v143 + 1] = 1991;
    v145 = a3->var1;
    v146 = a3->var2;
    a3->var2 = v146 + 1;
    v145[v146] = v144;
  }
  else
  {
    a3->var0[a3->var2] = 1994;
    v147 = a3->var1;
    v148 = a3->var2;
    a3->var2 = v148 + 1;
    v147[v148] = 0.0;
    a3->var0[v148 + 1] = 1993;
    v149 = a3->var1;
    v150 = a3->var2;
    a3->var2 = v150 + 1;
    v149[v150] = 0.0;
    a3->var0[v150 + 1] = 1992;
    v151 = a3->var1;
    v152 = a3->var2;
    a3->var2 = v152 + 1;
    v151[v152] = 0.0;
    a3->var0[v152 + 1] = 1991;
    v153 = a3->var1;
    v154 = a3->var2;
    a3->var2 = v154 + 1;
    v153[v154] = 0.0;
  }
  v243 = 0u;
  v244 = 0u;
  if (SSCompactRankingAttrsGetArrayInt64((uint64_t)self->_attributes, 0x131uLL, &v243, 4))
  {
    v155 = (float)(uint64_t)v243;
    a3->var0[a3->var2] = 2006;
    v156 = a3->var1;
    v157 = a3->var2;
    a3->var2 = v157 + 1;
    v156[v157] = v155;
    v158 = v155 + (float)*((uint64_t *)&v243 + 1);
    a3->var0[v157 + 1] = 2005;
    v159 = a3->var1;
    v160 = a3->var2;
    a3->var2 = v160 + 1;
    v159[v160] = v158;
    v161 = v158 + (float)(uint64_t)v244;
    a3->var0[v160 + 1] = 2004;
    v162 = a3->var1;
    v163 = a3->var2;
    a3->var2 = v163 + 1;
    v162[v163] = v161;
    v164 = v161 + (float)*((uint64_t *)&v244 + 1);
    a3->var0[v163 + 1] = 2003;
    v165 = a3->var1;
    v166 = a3->var2;
    a3->var2 = v166 + 1;
    v165[v166] = v164;
  }
  else
  {
    a3->var0[a3->var2] = 2006;
    v167 = a3->var1;
    v168 = a3->var2;
    a3->var2 = v168 + 1;
    v167[v168] = 0.0;
    a3->var0[v168 + 1] = 2005;
    v169 = a3->var1;
    v170 = a3->var2;
    a3->var2 = v170 + 1;
    v169[v170] = 0.0;
    a3->var0[v170 + 1] = 2004;
    v171 = a3->var1;
    v172 = a3->var2;
    a3->var2 = v172 + 1;
    v171[v172] = 0.0;
    a3->var0[v172 + 1] = 2003;
    v173 = a3->var1;
    v174 = a3->var2;
    a3->var2 = v174 + 1;
    v173[v174] = 0.0;
  }
  SSCompactRankingAttrsGetArrayInt64((uint64_t)self->_attributes, 0x132uLL, &v245, 4);
  if (ArrayInt64)
  {
    v175 = (float)(uint64_t)v243;
    a3->var0[a3->var2] = 2002;
    v176 = a3->var1;
    v177 = a3->var2;
    a3->var2 = v177 + 1;
    v176[v177] = v175;
    v178 = v175 + (float)*((uint64_t *)&v243 + 1);
    a3->var0[v177 + 1] = 2001;
    v179 = a3->var1;
    v180 = a3->var2;
    a3->var2 = v180 + 1;
    v179[v180] = v178;
    v181 = v178 + (float)(uint64_t)v244;
    a3->var0[v180 + 1] = 2000;
    v182 = a3->var1;
    v183 = a3->var2;
    a3->var2 = v183 + 1;
    v182[v183] = v181;
    v184 = v181 + (float)*((uint64_t *)&v244 + 1);
    a3->var0[v183 + 1] = 1999;
    v185 = a3->var1;
    v186 = a3->var2;
    a3->var2 = v186 + 1;
    v185[v186] = v184;
  }
  else
  {
    a3->var0[a3->var2] = 2002;
    v187 = a3->var1;
    v188 = a3->var2;
    a3->var2 = v188 + 1;
    v187[v188] = 0.0;
    a3->var0[v188 + 1] = 2001;
    v189 = a3->var1;
    v190 = a3->var2;
    a3->var2 = v190 + 1;
    v189[v190] = 0.0;
    a3->var0[v190 + 1] = 2000;
    v191 = a3->var1;
    v192 = a3->var2;
    a3->var2 = v192 + 1;
    v191[v192] = 0.0;
    a3->var0[v192 + 1] = 1999;
    v193 = a3->var1;
    v194 = a3->var2;
    a3->var2 = v194 + 1;
    v193[v194] = 0.0;
  }
  v241 = 0u;
  v242 = 0u;
  if (SSCompactRankingAttrsGetArrayInt64((uint64_t)self->_attributes, 0x133uLL, &v241, 4))
  {
    v195 = (float)(uint64_t)v241;
    a3->var0[a3->var2] = 2014;
    v196 = a3->var1;
    v197 = a3->var2;
    a3->var2 = v197 + 1;
    v196[v197] = v195;
    v198 = v195 + (float)*((uint64_t *)&v241 + 1);
    a3->var0[v197 + 1] = 2013;
    v199 = a3->var1;
    v200 = a3->var2;
    a3->var2 = v200 + 1;
    v199[v200] = v198;
    v201 = v198 + (float)(uint64_t)v242;
    a3->var0[v200 + 1] = 2012;
    v202 = a3->var1;
    v203 = a3->var2;
    a3->var2 = v203 + 1;
    v202[v203] = v201;
    v204 = v201 + (float)*((uint64_t *)&v242 + 1);
    a3->var0[v203 + 1] = 2011;
    v205 = a3->var1;
    v206 = a3->var2;
    a3->var2 = v206 + 1;
    v205[v206] = v204;
  }
  else
  {
    a3->var0[a3->var2] = 2014;
    v207 = a3->var1;
    v208 = a3->var2;
    a3->var2 = v208 + 1;
    v207[v208] = 0.0;
    a3->var0[v208 + 1] = 2013;
    v209 = a3->var1;
    v210 = a3->var2;
    a3->var2 = v210 + 1;
    v209[v210] = 0.0;
    a3->var0[v210 + 1] = 2012;
    v211 = a3->var1;
    v212 = a3->var2;
    a3->var2 = v212 + 1;
    v211[v212] = 0.0;
    a3->var0[v212 + 1] = 2011;
    v213 = a3->var1;
    v214 = a3->var2;
    a3->var2 = v214 + 1;
    v213[v214] = 0.0;
  }
  SSCompactRankingAttrsGetArrayInt64((uint64_t)self->_attributes, 0x134uLL, &v245, 4);
  if (ArrayInt64)
  {
    v215 = (float)(uint64_t)v241;
    a3->var0[a3->var2] = 2010;
    v216 = a3->var1;
    v217 = a3->var2;
    a3->var2 = v217 + 1;
    v216[v217] = v215;
    v218 = v215 + (float)*((uint64_t *)&v241 + 1);
    a3->var0[v217 + 1] = 2009;
    v219 = a3->var1;
    v220 = a3->var2;
    a3->var2 = v220 + 1;
    v219[v220] = v218;
    v221 = v218 + (float)(uint64_t)v242;
    a3->var0[v220 + 1] = 2008;
    v222 = a3->var1;
    v223 = a3->var2;
    a3->var2 = v223 + 1;
    v222[v223] = v221;
    v224 = v221 + (float)*((uint64_t *)&v242 + 1);
    a3->var0[v223 + 1] = 2007;
    v225 = a3->var1;
    v226 = a3->var2;
    a3->var2 = v226 + 1;
    v225[v226] = v224;
  }
  else
  {
    a3->var0[a3->var2] = 2010;
    v227 = a3->var1;
    v228 = a3->var2;
    a3->var2 = v228 + 1;
    v227[v228] = 0.0;
    a3->var0[v228 + 1] = 2009;
    v229 = a3->var1;
    v230 = a3->var2;
    a3->var2 = v230 + 1;
    v229[v230] = 0.0;
    a3->var0[v230 + 1] = 2008;
    v231 = a3->var1;
    v232 = a3->var2;
    a3->var2 = v232 + 1;
    v231[v232] = 0.0;
    a3->var0[v232 + 1] = 2007;
    v233 = a3->var1;
    v234 = a3->var2;
    a3->var2 = v234 + 1;
    v233[v234] = 0.0;
  }
  SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x28uLL);
  v235 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_storeStrong((id *)&self->_emailAddresses, v235);

}

- (void)populateParsecAlbumFeatures:(PRSL2FeatureScoreInfo *)a3 currentTime:(double)a4 forParsecResult:(id)a5
{
  id v7;
  unint64_t var2;
  unsigned __int16 *var0;
  float v10;
  float *var1;
  unint64_t v12;
  int v13;
  unint64_t v14;
  unsigned __int16 *v15;
  float *v16;
  unint64_t v17;

  v7 = a5;
  objc_msgSend(v7, "PRSRankingItemAdditions_albumStarRating");
  a3->var0[a3->var2] = 2298;
  var2 = a3->var2;
  var0 = a3->var0;
  a3->var1[var2++] = v10;
  a3->var2 = var2;
  var0[var2] = 2297;
  var1 = a3->var1;
  v12 = a3->var2;
  a3->var2 = v12 + 1;
  var1[v12] = v10;
  objc_msgSend(v7, "PRSRankingItemAdditions_albumNumYearsAgo:", a4);
  LODWORD(a4) = v13;

  a3->var0[a3->var2] = 2309;
  v14 = a3->var2;
  v15 = a3->var0;
  a3->var1[v14++] = *(float *)&a4;
  a3->var2 = v14;
  v15[v14] = 2308;
  v16 = a3->var1;
  v17 = a3->var2;
  a3->var2 = v17 + 1;
  v16[v17] = *(float *)&a4;
}

- (void)populateParsecSongFeatures:(PRSL2FeatureScoreInfo *)a3 currentTime:(double)a4 forParsecResult:(id)a5
{
  unint64_t var2;
  unsigned __int16 *var0;
  float v8;
  float *var1;
  unint64_t v10;

  objc_msgSend(a5, "PRSRankingItemAdditions_songNumYearsAgo:", a4);
  a3->var0[a3->var2] = 2311;
  var2 = a3->var2;
  var0 = a3->var0;
  a3->var1[var2++] = v8;
  a3->var2 = var2;
  var0[var2] = 2308;
  var1 = a3->var1;
  v10 = a3->var2;
  a3->var2 = v10 + 1;
  var1[v10] = v8;
}

- (void)populateParsecAppFeatures:(PRSL2FeatureScoreInfo *)a3 currentTime:(double)a4 forParsecResult:(id)a5
{
  id v6;
  float v7;
  float v8;
  float *var1;
  unint64_t var2;
  float v11;
  float v12;
  unint64_t v13;
  unsigned __int16 *var0;
  unint64_t v15;
  unsigned __int16 *v16;
  float *v17;
  unint64_t v18;

  v6 = a5;
  objc_msgSend(v6, "PRSRankingItemAdditions_appNumReviews");
  v8 = v7;
  a3->var0[a3->var2] = 2304;
  var1 = a3->var1;
  var2 = a3->var2;
  a3->var2 = var2 + 1;
  var1[var2] = v7;
  objc_msgSend(v6, "PRSRankingItemAdditions_appStarRating");
  v12 = v11;

  a3->var0[a3->var2] = 2299;
  v13 = a3->var2;
  var0 = a3->var0;
  a3->var1[v13++] = v12;
  a3->var2 = v13;
  var0[v13] = 2297;
  v15 = a3->var2;
  v16 = a3->var0;
  a3->var1[v15++] = v12;
  a3->var2 = v15;
  v16[v15] = 2303;
  v17 = a3->var1;
  v18 = a3->var2;
  a3->var2 = v18 + 1;
  v17[v18] = v8;
}

- (void)populateParsecPodcastFeatures:(PRSL2FeatureScoreInfo *)a3 currentTime:(double)a4 forParsecResult:(id)a5
{
  unint64_t var2;
  unsigned __int16 *var0;
  float v8;
  float *var1;
  unint64_t v10;

  objc_msgSend(a5, "PRSRankingItemAdditions_podcastStarRating", a4);
  a3->var0[a3->var2] = 2301;
  var2 = a3->var2;
  var0 = a3->var0;
  a3->var1[var2++] = v8;
  a3->var2 = var2;
  var0[var2] = 2297;
  var1 = a3->var1;
  v10 = a3->var2;
  a3->var2 = v10 + 1;
  var1[v10] = v8;
}

- (void)populateParsecMovieFeatures:(PRSL2FeatureScoreInfo *)a3 currentTime:(double)a4 forParsecResult:(id)a5
{
  id v7;
  float *var1;
  unint64_t var2;
  float v10;
  float *v11;
  unint64_t v12;
  float v13;
  int v14;
  unint64_t v15;
  unsigned __int16 *var0;
  float *v17;
  unint64_t v18;

  v7 = a5;
  objc_msgSend(v7, "PRSRankingItemAdditions_movieReviewRating");
  a3->var0[a3->var2] = 2302;
  var1 = a3->var1;
  var2 = a3->var2;
  a3->var2 = var2 + 1;
  var1[var2] = v10;
  objc_msgSend(v7, "PRSRankingItemAdditions_movieStarRating");
  a3->var0[a3->var2] = 2297;
  v11 = a3->var1;
  v12 = a3->var2;
  a3->var2 = v12 + 1;
  v11[v12] = v13;
  objc_msgSend(v7, "PRSRankingItemAdditions_movieNumYearsAgo:", a4);
  LODWORD(a4) = v14;

  a3->var0[a3->var2] = 2310;
  v15 = a3->var2;
  var0 = a3->var0;
  a3->var1[v15++] = *(float *)&a4;
  a3->var2 = v15;
  var0[v15] = 2308;
  v17 = a3->var1;
  v18 = a3->var2;
  a3->var2 = v18 + 1;
  v17[v18] = *(float *)&a4;
}

- (void)populateParsecEPubBookFeatures:(PRSL2FeatureScoreInfo *)a3 currentTime:(double)a4 forParsecResult:(id)a5
{
  id v7;
  unint64_t var2;
  unsigned __int16 *var0;
  float v10;
  float *var1;
  unint64_t v12;
  float v13;
  float *v14;
  unint64_t v15;
  float v16;
  float v17;
  unint64_t v18;
  unsigned __int16 *v19;
  unint64_t v20;
  unsigned __int16 *v21;
  float *v22;
  unint64_t v23;

  v7 = a5;
  objc_msgSend(v7, "PRSRankingItemAdditions_epubBookNumYearsAgo:", a4);
  a3->var0[a3->var2] = 2314;
  var2 = a3->var2;
  var0 = a3->var0;
  a3->var1[var2++] = v10;
  a3->var2 = var2;
  var0[var2] = 2308;
  var1 = a3->var1;
  v12 = a3->var2;
  a3->var2 = v12 + 1;
  var1[v12] = v10;
  objc_msgSend(v7, "PRSRankingItemAdditions_epubBookStarRating");
  *(float *)&a4 = v13;
  a3->var0[a3->var2] = 2300;
  v14 = a3->var1;
  v15 = a3->var2;
  a3->var2 = v15 + 1;
  v14[v15] = v13;
  objc_msgSend(v7, "PRSRankingItemAdditions_epubBookNumReviews");
  v17 = v16;

  a3->var0[a3->var2] = 2305;
  v18 = a3->var2;
  v19 = a3->var0;
  a3->var1[v18++] = v17;
  a3->var2 = v18;
  v19[v18] = 2297;
  v20 = a3->var2;
  v21 = a3->var0;
  a3->var1[v20++] = *(float *)&a4;
  a3->var2 = v20;
  v21[v20] = 2303;
  v22 = a3->var1;
  v23 = a3->var2;
  a3->var2 = v23 + 1;
  v22[v23] = v17;
}

- (void)populateParsecProfileFeatures:(PRSL2FeatureScoreInfo *)a3 currentTime:(double)a4 forParsecResult:(id)a5
{
  unint64_t var2;
  unsigned __int16 *var0;
  float v8;
  float *var1;
  unint64_t v10;

  objc_msgSend(a5, "PRSRankingItemAdditions_profileNumFollowers", a4);
  a3->var0[a3->var2] = 2306;
  var2 = a3->var2;
  var0 = a3->var0;
  a3->var1[var2++] = v8;
  a3->var2 = var2;
  var0[var2] = 2303;
  var1 = a3->var1;
  v10 = a3->var2;
  a3->var2 = v10 + 1;
  var1[v10] = v8;
}

- (void)populateParsecTvShowFeatures:(PRSL2FeatureScoreInfo *)a3 currentTime:(double)a4 forParsecResult:(id)a5
{
  unint64_t var2;
  unsigned __int16 *var0;
  float v8;
  float *var1;
  unint64_t v10;

  objc_msgSend(a5, "PRSRankingItemAdditions_tvshowNumYearsAgo:", a4);
  a3->var0[a3->var2] = 2312;
  var2 = a3->var2;
  var0 = a3->var0;
  a3->var1[var2++] = v8;
  a3->var2 = var2;
  var0[var2] = 2308;
  var1 = a3->var1;
  v10 = a3->var2;
  a3->var2 = v10 + 1;
  var1[v10] = v8;
}

- (void)populateParsecWebVideoFeatures:(PRSL2FeatureScoreInfo *)a3 currentTime:(double)a4 forParsecResult:(id)a5
{
  id v7;
  unint64_t var2;
  unsigned __int16 *var0;
  float v10;
  float *var1;
  unint64_t v12;
  int v13;
  unint64_t v14;
  unsigned __int16 *v15;
  float *v16;
  unint64_t v17;

  v7 = a5;
  objc_msgSend(v7, "PRSRankingItemAdditions_webVideoNumViews");
  a3->var0[a3->var2] = 2307;
  var2 = a3->var2;
  var0 = a3->var0;
  a3->var1[var2++] = v10;
  a3->var2 = var2;
  var0[var2] = 2303;
  var1 = a3->var1;
  v12 = a3->var2;
  a3->var2 = v12 + 1;
  var1[v12] = v10;
  objc_msgSend(v7, "PRSRankingItemAdditions_webVideoNumYearsAgo:", a4);
  LODWORD(a4) = v13;

  a3->var0[a3->var2] = 2313;
  v14 = a3->var2;
  v15 = a3->var0;
  a3->var1[v14++] = *(float *)&a4;
  a3->var2 = v14;
  v15[v14] = 2308;
  v16 = a3->var1;
  v17 = a3->var2;
  a3->var2 = v17 + 1;
  v16[v17] = *(float *)&a4;
}

- (void)populateParsecAnyFeatures:(PRSL2FeatureScoreInfo *)a3 currentTime:(double)a4 forParsecResult:(id)a5
{
  id v6;
  float *var1;
  unint64_t var2;
  float v9;
  float v10;
  float v11;
  float *v12;
  unint64_t v13;

  v6 = a5;
  objc_msgSend(v6, "PRSRankingItemAdditions_anyTophitMustBe");
  a3->var0[a3->var2] = 2315;
  var1 = a3->var1;
  var2 = a3->var2;
  a3->var2 = var2 + 1;
  var1[var2] = v9;
  objc_msgSend(v6, "PRSRankingItemAdditions_anyTophitNo");
  v11 = v10;

  a3->var0[a3->var2] = 2316;
  v12 = a3->var1;
  v13 = a3->var2;
  a3->var2 = v13 + 1;
  v12[v13] = v11;
}

- (void)updateNumScoreDescriptorBundleFeatures:(float *)a3 feature:(unint64_t)a4 featureScoreInfo:(PRSL2FeatureScoreInfo *)a5
{
  unint64_t v9;
  uint64_t v10;
  unsigned __int16 v11;
  uint64_t *v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  float v16;
  uint64_t v17;
  float *var1;
  unint64_t var2;

  if (updateNumScoreDescriptorBundleFeatures_feature_featureScoreInfo__onceToken != -1)
    dispatch_once(&updateNumScoreDescriptorBundleFeatures_feature_featureScoreInfo__onceToken, &__block_literal_global_167);
  v9 = a4 - 36;
  if (a4 - 36 >= 8 || ((0x9Fu >> v9) & 1) == 0)
    -[PRSRankingItem updateNumScoreDescriptorBundleFeatures:feature:featureScoreInfo:].cold.1();
  v10 = 0;
  v11 = word_1B87DF8C0[v9];
  v12 = off_1E6E53010[v9];
  v13 = *v12;
  v14 = *(_QWORD *)&self->_indexScore[8] & v12[1];
  v15 = *(_QWORD *)self->_indexScore & v13;
  v16 = 0.0;
  do
  {
    v17 = ((2 * v14) << ~(_BYTE)v10) | (v15 >> v10);
    if ((v10 & 0x40) != 0)
      v17 = v14 >> v10;
    if ((v17 & 1) != 0)
      v16 = v16 + 1.0;
    ++v10;
  }
  while (v10 != 128);
  a5->var0[a5->var2] = v11;
  var1 = a5->var1;
  var2 = a5->var2;
  a5->var2 = var2 + 1;
  var1[var2] = v16;
  if (gShouldUpdateOnMax_block_invoke(a3[a4], v16))
    a3[a4] = v16;
}

void __82__PRSRankingItem_updateNumScoreDescriptorBundleFeatures_feature_featureScoreInfo___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[5];
  _QWORD v8[10];
  _QWORD v9[8];
  _QWORD v10[11];
  _QWORD v11[9];

  v11[8] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("kMDItemAuthorsOrRecipientsTokenizedPrefixMatch");
  v11[1] = CFSTR("kMDItemDescriptionTokenizedPrefixMatch");
  v11[2] = CFSTR("kMDItemAlbumTokenizedPrefixMatch");
  v11[3] = CFSTR("kMDItemComposerTokenizedPrefixMatch");
  v11[4] = CFSTR("kMDItemDisplayNameOrSubjectOrTitleTokenizedPrefixMatch");
  v11[5] = CFSTR("kMDItemArtistPrefixTokenized");
  v11[6] = CFSTR("kMDItemAuthorsPrefixTokenized");
  v11[7] = CFSTR("kMDItemRecipientsPrefixTokenized");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 8);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  updateNumScoreDescriptorBundleFeatures_feature_featureScoreInfo__prefixTokenizedMatchMask = maskFromRankingDescriptors(v0);
  *(_QWORD *)algn_1ED55F018 = 0;

  v10[0] = CFSTR("kMDItemLastSpaceAndTotalMatchAndDisplayNameOrSubjectOrTitleWordMatch");
  v10[1] = CFSTR("kMDItemAlbumPrefixWordMatch");
  v10[2] = CFSTR("kMDItemComposerPrefixWordMatch");
  v10[3] = CFSTR("kMDItemDescriptionPrefixWordMatch");
  v10[4] = CFSTR("kMDItemAuthorsOrRecipientsNonTokenizedPrefixMatch");
  v10[5] = CFSTR("kMDItemArtistPrefixWord");
  v10[6] = CFSTR("kMDItemAuthorsPrefixWord");
  v10[7] = CFSTR("kMDItemRecipientsPrefixWord");
  v10[8] = CFSTR("kMDItemDisplayNamePrefixWord");
  v10[9] = CFSTR("kMDItemSubjectPrefixWord");
  v10[10] = CFSTR("kMDItemTitlePrefixWord");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 11);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  updateNumScoreDescriptorBundleFeatures_feature_featureScoreInfo__prefixWordMatchMask = maskFromRankingDescriptors(v1);
  *(_QWORD *)algn_1ED55F028 = 0;

  v9[0] = CFSTR("kMDItemAuthorsOrRecipientsExactMatch");
  v9[1] = CFSTR("kMDItemDescriptionNonTokenizedWordMatch");
  v9[2] = CFSTR("kMDItemAlbumNonTokenizedWordMatch");
  v9[3] = CFSTR("kMDItemComposerNonTokenizedWordMatch");
  v9[4] = CFSTR("kMDItemAlternateNameNonTokenizedWordMatch");
  v9[5] = CFSTR("kMDItemDisplayNameOrSubjectOrTitleNonTokenizedWordMatch");
  v9[6] = CFSTR("kMDItemNamedLocationExactWord");
  v9[7] = CFSTR("kMDItemArtistExactWord");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  updateNumScoreDescriptorBundleFeatures_feature_featureScoreInfo__wordMatchMask = maskFromRankingDescriptors(v2);
  *(_QWORD *)algn_1ED55F048 = 0;

  v8[0] = CFSTR("kMDItemAuthorsOrRecipientsPrefixWordMatch");
  v8[1] = CFSTR("kMDItemDescriptionExactPrefixMatch");
  v8[2] = CFSTR("kMDItemAlbumNonTokenizedPrefixMatch");
  v8[3] = CFSTR("kMDItemComposerNonTokenizedPrefixMatch");
  v8[4] = CFSTR("kMDItemAlternateNamePrefixWordMatch");
  v8[5] = CFSTR("kMDItemDisplayNameOrSubjectOrTitleNonTokenizedPrefixMatch");
  v8[6] = CFSTR("kMDItemNamedLocationExactPrefix");
  v8[7] = CFSTR("kMDItemArtistExactPrefix");
  v8[8] = CFSTR("kMDItemAuthorsExactPrefix");
  v8[9] = CFSTR("kMDItemRecipientsExactPrefix");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  updateNumScoreDescriptorBundleFeatures_feature_featureScoreInfo__exactPrefixMatchMask = maskFromRankingDescriptors(v3);
  *(_QWORD *)algn_1ED55EFF8 = 0;

  v7[0] = CFSTR("kMDItemAlternateNameExactMatch");
  v7[1] = CFSTR("kMDItemDisplayNameOrSubjectOrTitleExactMatch");
  v7[2] = CFSTR("kMDItemNamedLocationExact");
  v7[3] = CFSTR("kMDItemAuthorsExact");
  v7[4] = CFSTR("kMDItemRecipientsExact");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  updateNumScoreDescriptorBundleFeatures_feature_featureScoreInfo__exactMatchMask = maskFromRankingDescriptors(v4);
  *(_QWORD *)algn_1ED55EFE8 = 0;

  v6 = CFSTR("kMDItemTextContentTokenizedMatch");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  updateNumScoreDescriptorBundleFeatures_feature_featureScoreInfo__textContentMatchMask = maskFromRankingDescriptors(v5);
  *(_QWORD *)algn_1ED55F038 = 0;

}

+ (id)rankingDescriptorForBundleFeature:(unint64_t)a3
{
  unint64_t v3;

  v3 = a3 - 24;
  if (a3 - 24 >= 0x17 || ((0x6601FFu >> v3) & 1) == 0)
    +[PRSRankingItem rankingDescriptorForBundleFeature:].cold.1();
  return *off_1E6E53050[v3];
}

- (void)updateScoreDescriptorBundleFeatures:(float *)a3 feature:(unint64_t)a4
{
  unint64_t v7;
  unint64_t v8;
  void *v9;
  char v10;
  __CFString *v11;
  uint64_t v12;
  BOOL v14;
  __CFString *v15;

  if (a3[a4] == 0.0)
  {
    +[PRSRankingItem rankingDescriptorForBundleFeature:](PRSRankingItem, "rankingDescriptorForBundleFeature:", a4);
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)&self->_indexScore[8];
    v8 = *(_QWORD *)self->_indexScore;
    objc_msgSend((id)sRankingQueryIndexDictionary, "objectForKeyedSubscript:", v15);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "unsignedIntegerValue");

    v11 = v15;
    v12 = ((2 * v7) << ~v10) | (v8 >> v10);
    if ((v10 & 0x40) != 0)
      v12 = v7 >> v10;
    if ((v12 & 1) != 0)
    {
      a3[a4] = 1.0;
      if (v15 == CFSTR("kMDItemShortcutRecent") || v15 == CFSTR("kMDItemShortcutWithinBagParamValue"))
      {
        v14 = -[PRSRankingItem hasShortCut](self, "hasShortCut");
        v11 = v15;
        if (!v14)
          a3[a4] = 0.0;
      }
    }

  }
}

- (void)updateAccumulatedBundleFeatures:(float *)a3 values:(float *)a4 feature:(unint64_t)a5
{
  unint64_t v5;
  _QWORD *v9;
  unsigned int (**v10)(_QWORD, float, float);
  double v11;
  float v12;
  double (**v13)(id, float *);

  v5 = a5 - 1;
  if (a5 - 1 >= 0x16)
    -[PRSRankingItem updateAccumulatedBundleFeatures:values:feature:].cold.1();
  v9 = off_1E6E531B8[v5];
  v13 = (double (**)(id, float *))MEMORY[0x1BCCB38DC](*off_1E6E53108[v5], a2);
  v10 = (unsigned int (**)(_QWORD, float, float))MEMORY[0x1BCCB38DC](*v9);
  v11 = v13[2](v13, a4);
  v12 = *(float *)&v11;
  if (v10[2](v10, a3[a5], *(float *)&v11))
    a3[a5] = v12;

}

- (void)updateBundleFeatures:(float *)a3 withArrValues:(float *)(a4 featureScoreInfo:
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  float v13;
  unint64_t v14;

  v9 = 0;
  v10 = sRequiredAttributesCount;
  do
  {
    switch(v9)
    {
      case 0:
      case 33:
      case 34:
      case 35:
      case 44:
        break;
      case 1:
      case 2:
      case 3:
      case 4:
      case 5:
      case 6:
      case 7:
      case 8:
      case 9:
      case 10:
      case 11:
      case 12:
      case 13:
      case 14:
      case 15:
      case 16:
      case 17:
      case 18:
      case 19:
      case 20:
      case 21:
      case 22:
        -[PRSRankingItem updateAccumulatedBundleFeatures:values:feature:](self, "updateAccumulatedBundleFeatures:values:feature:", a3, (char *)a4 + 4 * v9 * v10, v9);
        break;
      case 23:
        if (updateBundleFeatures_withArrValues_featureScoreInfo__onceToken != -1)
          dispatch_once(&updateBundleFeatures_withArrValues_featureScoreInfo__onceToken, &__block_literal_global_168);
        v11 = 0;
        v12 = *(_QWORD *)algn_1ED55EFC8 & *(_QWORD *)&self->_indexScore[8];
        v13 = 0.0;
        do
        {
          v14 = ((2 * v12) << ~(_BYTE)v11) | (((unint64_t)updateBundleFeatures_withArrValues_featureScoreInfo__exactMask & *(_QWORD *)self->_indexScore) >> v11);
          if ((v11 & 0x40) != 0)
            v14 = v12 >> v11;
          if ((v14 & 1) != 0)
            v13 = v13 + 1.0;
          ++v11;
        }
        while (v11 != 128);
        if (gShouldUpdateOnMax_block_invoke(a3[23], v13))
          a3[23] = v13;
        break;
      case 24:
      case 25:
      case 26:
      case 27:
      case 28:
      case 29:
      case 30:
      case 31:
      case 32:
      case 41:
      case 42:
      case 45:
        -[PRSRankingItem updateScoreDescriptorBundleFeatures:feature:](self, "updateScoreDescriptorBundleFeatures:feature:", a3, v9);
        break;
      case 36:
      case 37:
      case 38:
      case 39:
      case 40:
      case 43:
        -[PRSRankingItem updateNumScoreDescriptorBundleFeatures:feature:featureScoreInfo:](self, "updateNumScoreDescriptorBundleFeatures:feature:featureScoreInfo:", a3, v9, a5);
        break;
      default:
        -[PRSRankingItem updateBundleFeatures:withArrValues:featureScoreInfo:].cold.1();
    }
    ++v9;
  }
  while (v9 != 46);
}

void __70__PRSRankingItem_updateBundleFeatures_withArrValues_featureScoreInfo___block_invoke()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  void *v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  _QWORD v14[9];

  v14[8] = *MEMORY[0x1E0C80C00];
  v14[0] = CFSTR("kMDItemAuthorsExact");
  v14[1] = CFSTR("kMDItemRecipientsExact");
  v14[2] = CFSTR("kMDItemArtistExactWord");
  v14[3] = CFSTR("kMDItemNamedLocationExact");
  v14[4] = CFSTR("kMDItemNamedLocationExactWord");
  v14[5] = CFSTR("kMDItemDisplayNameOrSubjectOrTitleExactMatch");
  v14[6] = CFSTR("kMDItemAlternateNameExactMatch");
  v14[7] = CFSTR("kMDItemAuthorsOrRecipientsExactMatch");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 8);
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v0 = (id)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v1)
  {
    v2 = v1;
    v3 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v2; ++i)
      {
        if (*(_QWORD *)v10 != v3)
          objc_enumerationMutation(v0);
        objc_msgSend((id)sRankingQueryIndexDictionary, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i), (_QWORD)v9);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v5, "unsignedIntegerValue");
        v7 = 1 << v6;
        if ((v6 & 0x40) != 0)
          v8 = 1 << v6;
        else
          v8 = 0;
        if ((v6 & 0x40) != 0)
          v7 = 0;
        *(_OWORD *)&updateBundleFeatures_withArrValues_featureScoreInfo__exactMask += __PAIR128__(v8, v7);

      }
      v2 = objc_msgSend(v0, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v2);
  }

}

- (void)populateCrossAttributeDerivedFeaturesWithContext:(prs_feature_population_ctx_t *)a3 featureScoreInfo:(PRSL2FeatureScoreInfo *)a4
{
  uint64_t v7;
  float *var4;
  unsigned __int16 v9;
  float v10;
  float *var1;
  unint64_t var2;
  float var7;
  unint64_t v14;
  unsigned __int16 *var0;
  float var5;
  unint64_t v17;
  unsigned __int16 *v18;
  float var8;
  unint64_t v20;
  unsigned __int16 *v21;
  float var6;
  float *v23;
  unint64_t v24;

  v7 = 0;
  var4 = a3->var4;
  do
  {
    v9 = +[PRSRankingItem featureFromVirtualIdx:](PRSRankingItem, "featureFromVirtualIdx:", v7);
    v10 = var4[v7];
    a4->var0[a4->var2] = v9;
    var1 = a4->var1;
    var2 = a4->var2;
    a4->var2 = var2 + 1;
    var1[var2] = v10;
    ++v7;
  }
  while (v7 != 28);
  var7 = a3->var7;
  a4->var0[var2 + 1] = 406;
  v14 = a4->var2;
  var0 = a4->var0;
  a4->var1[v14++] = var7;
  a4->var2 = v14;
  var5 = a3->var5;
  var0[v14] = 408;
  v17 = a4->var2;
  v18 = a4->var0;
  a4->var1[v17++] = var5;
  a4->var2 = v17;
  var8 = a3->var8;
  v18[v17] = 407;
  v20 = a4->var2;
  v21 = a4->var0;
  a4->var1[v20++] = var8;
  a4->var2 = v20;
  var6 = a3->var6;
  v21[v20] = 409;
  v23 = a4->var1;
  v24 = a4->var2;
  a4->var2 = v24 + 1;
  v23[v24] = var6;
  self->_importantPropertiesWordMatched = a3->var11;
  self->_importantPropertiesPrefixMatched = a3->var10;
}

- (id)mailFreshnessDate
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x11DuLL);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x139uLL);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if (((objc_opt_isKindOfClass() & 1) != 0
       || (SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x13AuLL),
           v7 = (void *)objc_claimAutoreleasedReturnValue(),
           v6,
           objc_opt_class(),
           v6 = v7,
           (objc_opt_isKindOfClass() & 1) != 0))
      && (v8 = v6, (v7 = v8) != 0))
    {
      objc_msgSend(v8, "lastObject");
      v5 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x20uLL);
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  return v5;
}

- (void)populateOnlyPommesL1RankingFeaturesWithQueryTokenCount:(unint64_t)a3 queryID:(int64_t)a4
{
  NSNumber *retrievalType;
  NSNumber *v8;
  NSNumber *v9;
  void *v10;
  double v11;
  float v12;
  float v13;

  v13 = 0.0;
  if (SSCompactRankingAttrsGetFloat((uint64_t)self->_attributes, 0xA0uLL, &v13))
    self->_pommesL1Score = v13;
  retrievalType = self->_retrievalType;
  if (!retrievalType)
  {
    SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x69uLL);
    v8 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v9 = self->_retrievalType;
    self->_retrievalType = v8;

    retrievalType = self->_retrievalType;
  }
  if ((-[NSNumber integerValue](retrievalType, "integerValue") & 2) != 0)
  {
    SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x68uLL);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    self->_embeddingSimilarity = sqDistancesToCosine(v10);
    if ((SSSectionIsSyndicatedPhotos(self->_sectionBundleIdentifier) & 1) == 0)
    {
      *(float *)&v11 = self->_embeddingSimilarity;
      -[PRSRankingItem calibrateSemanticScore:queryTokenCount:queryID:](self, "calibrateSemanticScore:queryTokenCount:queryID:", a3, a4, v11);
      self->_embeddingSimilarity = v12;
    }

  }
}

- (void)populateOnlyPommesFeaturesForBundleID:(id)a3 queryTokenCount:(unint64_t)a4 queryID:(int64_t)a5
{
  id v8;
  NSNumber *retrievalType;
  NSNumber *v10;
  NSNumber *v11;
  void *v12;
  double v13;
  float v14;
  id v15;
  NSDate *v16;
  NSDate *mailDate;
  float v18;

  v8 = a3;
  -[PRSL2FeatureVector setBundleID:](self->_L2FeatureVector, "setBundleID:", v8);
  v18 = 0.0;
  if (SSCompactRankingAttrsGetFloat((uint64_t)self->_attributes, 0xA0uLL, &v18))
    self->_pommesL1Score = v18;
  retrievalType = self->_retrievalType;
  if (!retrievalType)
  {
    SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x69uLL);
    v10 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v11 = self->_retrievalType;
    self->_retrievalType = v10;

    retrievalType = self->_retrievalType;
  }
  if ((-[NSNumber integerValue](retrievalType, "integerValue") & 2) != 0)
  {
    SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x68uLL);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    self->_embeddingSimilarity = sqDistancesToCosine(v12);
    if ((SSSectionIsSyndicatedPhotos(self->_sectionBundleIdentifier) & 1) == 0)
    {
      *(float *)&v13 = self->_embeddingSimilarity;
      -[PRSRankingItem calibrateSemanticScore:queryTokenCount:queryID:](self, "calibrateSemanticScore:queryTokenCount:queryID:", a4, a5, v13);
      self->_embeddingSimilarity = v14;
    }

  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.mobilesafari")))
  {
    v15 = -[PRSRankingItem interestingDate](self, "interestingDate");
  }
  else
  {
    -[PRSRankingItem mailFreshnessDate](self, "mailFreshnessDate");
    v16 = (NSDate *)objc_claimAutoreleasedReturnValue();
    mailDate = self->_mailDate;
    self->_mailDate = v16;

  }
}

- (void)populateBundleSpecificFeatures:(PRSL2FeatureScoreInfo *)a3 currentTime:(double)a4
{
  NSString *v7;
  float *var1;
  unint64_t var2;
  int Float;
  float v11;
  float *v12;
  unint64_t v13;
  int v14;
  float v15;
  float *v16;
  unint64_t v17;
  int v18;
  float v19;
  float *v20;
  unint64_t v21;
  int v22;
  float v23;
  float *v24;
  unint64_t v25;
  float v26;
  float v27;

  v7 = self->_sectionBundleIdentifier;
  -[PRSL2FeatureVector setBundleID:](self->_L2FeatureVector, "setBundleID:", v7);
  if (SSPommesRankingForSectionBundle(v7))
  {
    v27 = 0.0;
    if (SSCompactRankingAttrsGetFloat((uint64_t)self->_attributes, 0xA0uLL, &v27))
      self->_pommesL1Score = v27;
  }
  if (-[NSString isEqualToString:](v7, "isEqualToString:", CFSTR("com.apple.MobileAddressBook")))
  {
    -[PRSRankingItem populateContactFeatures:currentTime:](self, "populateContactFeatures:currentTime:", a3, a4);
  }
  else if (-[NSString isEqualToString:](v7, "isEqualToString:", CFSTR("com.apple.application")))
  {
    a3->var0[a3->var2] = 326;
    var1 = a3->var1;
    var2 = a3->var2;
    a3->var2 = var2 + 1;
    var1[var2] = 1.0;
    v26 = 0.0;
    Float = SSCompactRankingAttrsGetFloat((uint64_t)self->_attributes, 0x110uLL, &v26);
    v11 = v26;
    if (!Float)
      v11 = 0.0;
    a3->var0[a3->var2] = 75;
    v12 = a3->var1;
    v13 = a3->var2;
    a3->var2 = v13 + 1;
    v12[v13] = v11;
    v14 = SSCompactRankingAttrsGetFloat((uint64_t)self->_attributes, 0x111uLL, &v26);
    v15 = v26;
    if (!v14)
      v15 = 0.0;
    a3->var0[a3->var2] = 74;
    v16 = a3->var1;
    v17 = a3->var2;
    a3->var2 = v17 + 1;
    v16[v17] = v15;
    v18 = SSCompactRankingAttrsGetFloat((uint64_t)self->_attributes, 0x112uLL, &v26);
    v19 = v26;
    if (!v18)
      v19 = 0.0;
    a3->var0[a3->var2] = 73;
    v20 = a3->var1;
    v21 = a3->var2;
    a3->var2 = v21 + 1;
    v20[v21] = v19;
    v22 = SSCompactRankingAttrsGetFloat((uint64_t)self->_attributes, 0x113uLL, &v26);
    v23 = v26;
    if (!v22)
      v23 = 0.0;
    a3->var0[a3->var2] = 72;
    v24 = a3->var1;
    v25 = a3->var2;
    a3->var2 = v25 + 1;
    v24[v25] = v23;
  }
  else if (-[NSString isEqualToString:](v7, "isEqualToString:", CFSTR("com.apple.mobilemail"))
         || -[NSString isEqualToString:](v7, "isEqualToString:", CFSTR("com.apple.pommesctl")))
  {
    -[PRSRankingItem populateMailFeatures:](self, "populateMailFeatures:", a3);
  }
  else if (-[NSString isEqualToString:](v7, "isEqualToString:", CFSTR("com.apple.MobileSMS")))
  {
    -[PRSRankingItem populateSMSFeatures:](self, "populateSMSFeatures:", a3);
  }

}

- (void)populateParsecBundleSpecificFeatures:(PRSL2FeatureScoreInfo *)a3 currentTime:(double)a4 forParsecResult:(id)a5
{
  void *v8;
  id v9;

  v9 = a5;
  objc_msgSend(v9, "sectionBundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRSL2FeatureVector setBundleID:](self->_L2FeatureVector, "setBundleID:", v8);
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.parsec.itunes.album")))
  {
    -[PRSRankingItem populateParsecAlbumFeatures:currentTime:forParsecResult:](self, "populateParsecAlbumFeatures:currentTime:forParsecResult:", a3, v9, a4);
  }
  else if (objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.parsec.itunes.iosSoftware")))
  {
    -[PRSRankingItem populateParsecAppFeatures:currentTime:forParsecResult:](self, "populateParsecAppFeatures:currentTime:forParsecResult:", a3, v9, a4);
  }
  else if (objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.parsec.itunes.epubBook")))
  {
    -[PRSRankingItem populateParsecEPubBookFeatures:currentTime:forParsecResult:](self, "populateParsecEPubBookFeatures:currentTime:forParsecResult:", a3, v9, a4);
  }
  else if (objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.parsec.ondemandmovies.movie")))
  {
    -[PRSRankingItem populateParsecMovieFeatures:currentTime:forParsecResult:](self, "populateParsecMovieFeatures:currentTime:forParsecResult:", a3, v9, a4);
  }
  else if (objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.parsec.itunes.podcast")))
  {
    -[PRSRankingItem populateParsecPodcastFeatures:currentTime:forParsecResult:](self, "populateParsecPodcastFeatures:currentTime:forParsecResult:", a3, v9, a4);
  }
  else if (objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.parsec.profiles.profile")))
  {
    -[PRSRankingItem populateParsecProfileFeatures:currentTime:forParsecResult:](self, "populateParsecProfileFeatures:currentTime:forParsecResult:", a3, v9, a4);
  }
  else if (objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.parsec.itunes.song")))
  {
    -[PRSRankingItem populateParsecSongFeatures:currentTime:forParsecResult:](self, "populateParsecSongFeatures:currentTime:forParsecResult:", a3, v9, a4);
  }
  else if (objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.parsec.tv.tvShow")))
  {
    -[PRSRankingItem populateParsecTvShowFeatures:currentTime:forParsecResult:](self, "populateParsecTvShowFeatures:currentTime:forParsecResult:", a3, v9, a4);
  }
  else if (objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.parsec.web_video")))
  {
    -[PRSRankingItem populateParsecWebVideoFeatures:currentTime:forParsecResult:](self, "populateParsecWebVideoFeatures:currentTime:forParsecResult:", a3, v9, a4);
  }
  -[PRSRankingItem populateParsecAnyFeatures:currentTime:forParsecResult:](self, "populateParsecAnyFeatures:currentTime:forParsecResult:", a3, v9, a4);

}

- (void)populateParsecRoundTripFeatures:(id)a3 forParsecResult:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (populateParsecRoundTripFeatures_forParsecResult__onceToken != -1)
      dispatch_once(&populateParsecRoundTripFeatures_forParsecResult__onceToken, &__block_literal_global_172);
    if (populateParsecRoundTripFeatures_forParsecResult__useServerFeatures)
    {
      objc_msgSend(v6, "performSelector:", sel_serverFeatures);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v7 && objc_msgSend(v7, "count"))
      {
        v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v8, "count"));
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        objc_msgSend(v8, "allKeys");
        obj = (id)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v21;
LABEL_9:
          v13 = 0;
          while (1)
          {
            if (*(_QWORD *)v21 != v12)
              objc_enumerationMutation(obj);
            v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v13);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0 || !objc_msgSend(v14, "length"))
              break;
            objc_msgSend(CFSTR("roundtrip_"), "stringByAppendingString:", v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "objectForKey:", v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            if (v16)
              goto LABEL_21;
            objc_msgSend(v8, "objectForKey:", v14);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {

LABEL_21:
              break;
            }
            v18 = (void *)objc_msgSend(v17, "copy");
            objc_msgSend(v9, "setObject:forKey:", v18, v15);

            if (v11 == ++v13)
            {
              v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
              if (v11)
                goto LABEL_9;
              break;
            }
          }
        }

        if (v9 && objc_msgSend(v9, "count"))
          objc_msgSend(v5, "setRoundTripFeatures:", v9);

      }
    }
    else
    {
      v8 = 0;
    }

  }
}

uint64_t __66__PRSRankingItem_populateParsecRoundTripFeatures_forParsecResult___block_invoke()
{
  uint64_t result;

  result = objc_msgSend((id)objc_opt_class(), "instancesRespondToSelector:", sel_serverFeatures);
  if ((_DWORD)result)
    result = objc_msgSend((id)objc_opt_class(), "instancesRespondToSelector:", sel_setServerFeatures_);
  populateParsecRoundTripFeatures_forParsecResult__useServerFeatures = result;
  return result;
}

- (void)populateMailFeatures:(PRSL2FeatureScoreInfo *)a3
{
  id v5;
  id v6;
  float v7;
  float *var1;
  unint64_t var2;
  void *v10;
  void *v11;
  float *v12;
  unint64_t v13;
  void *v14;
  unint64_t v15;
  unint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  void *v22;
  uint64_t i;
  uint64_t v24;
  NSMutableArray *matchedSenders;
  uint64_t v26;
  NSMutableArray *v27;
  void *v28;
  char v29;
  uint64_t v30;
  void *v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  PRSL2FeatureScoreInfo *v40;
  uint64_t j;
  uint64_t v42;
  NSMutableArray *matchedRecipients;
  char v44;
  uint64_t v45;
  NSMutableArray *v46;
  PRSRankingItem *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  NSDate *mailDate;
  float v54;
  float *v55;
  unint64_t v56;
  float v57;
  float *v58;
  unint64_t v59;
  float v60;
  float *v61;
  unint64_t v62;
  float v63;
  float *v64;
  unint64_t v65;
  float v66;
  float *v67;
  unint64_t v68;
  float v69;
  float *v70;
  unint64_t v71;
  double v72;
  float v73;
  float *v74;
  unint64_t v75;
  unint64_t v76;
  float v77;
  float v78;
  float *v79;
  unint64_t v80;
  float *v81;
  unint64_t v82;
  float *v83;
  unint64_t v84;
  float *v85;
  unint64_t v86;
  double v87;
  float *v88;
  unint64_t v89;
  char *v90;
  id v91;
  uint64_t v92;
  BOOL v93;
  _BOOL4 v94;
  float *v95;
  unint64_t v96;
  unint64_t v97;
  float *v98;
  unint64_t v99;
  void *v100;
  void *v101;
  int v102;
  float *v103;
  unint64_t v104;
  float *v105;
  unint64_t v106;
  void *v107;
  void *v108;
  int v109;
  float *v110;
  unint64_t v111;
  float *v112;
  unint64_t v113;
  void *v114;
  void *v115;
  int v116;
  float *v117;
  unint64_t v118;
  char v119;
  int v120;
  char v121;
  float *v122;
  unint64_t v123;
  uint64_t v124;
  unint64_t v125;
  float *v126;
  unint64_t v127;
  float v128;
  float *v129;
  unint64_t v130;
  void *v131;
  void *v132;
  char v133;
  void *v134;
  id v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t n;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  PRSL2FeatureScoreInfo *v145;
  float *v146;
  unint64_t v147;
  float v148;
  void *v149;
  void *v150;
  float *v151;
  unint64_t v152;
  float v153;
  void *v154;
  void *v155;
  float *v156;
  unint64_t v157;
  float v158;
  void *v159;
  void *v160;
  float *v161;
  unint64_t v162;
  float v163;
  void *v164;
  void *v165;
  float *v166;
  unint64_t v167;
  float v168;
  void *v169;
  void *v170;
  float *v171;
  unint64_t v172;
  float v173;
  void *v174;
  void *v175;
  float *v176;
  unint64_t v177;
  float v178;
  void *v179;
  void *v180;
  float v181;
  unsigned __int16 *var0;
  unint64_t v183;
  __int16 v184;
  char *v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t k;
  void *v190;
  id v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t m;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  float *v200;
  unint64_t v201;
  float v202;
  void *v203;
  void *v204;
  float *v205;
  unint64_t v206;
  float v207;
  void *v208;
  void *v209;
  float *v210;
  unint64_t v211;
  float v212;
  void *v213;
  void *v214;
  float *v215;
  unint64_t v216;
  float v217;
  void *v218;
  void *v219;
  float *v220;
  unint64_t v221;
  float v222;
  void *v223;
  void *v224;
  float *v225;
  unint64_t v226;
  float v227;
  void *v228;
  void *v229;
  float *v230;
  unint64_t v231;
  float v232;
  float *v233;
  unint64_t v234;
  char v235;
  __int128 v236;
  void *v237;
  void *v238;
  void *v239;
  void *v240;
  void *v241;
  PRSL2FeatureScoreInfo *v242;
  void *v243;
  void *v244;
  id v245;
  char v246;
  PRSRankingItem *v247;
  char *v248;
  id v249;
  __int128 v250;
  __int128 v251;
  __int128 v252;
  __int128 v253;
  __int128 v254;
  __int128 v255;
  __int128 v256;
  __int128 v257;
  __int128 v258;
  __int128 v259;
  __int128 v260;
  __int128 v261;
  float v262;
  uint64_t v263;
  uint64_t v264;
  uint64_t v265;
  __int128 v266;
  __int128 v267;
  __int128 v268;
  __int128 v269;
  __int128 v270;
  __int128 v271;
  __int128 v272;
  __int128 v273;
  float v274;
  _BYTE v275[128];
  _BYTE v276[128];
  _BYTE v277[128];
  _BYTE v278[128];
  _BYTE v279[128];
  uint64_t v280;

  v280 = *MEMORY[0x1E0C80C00];
  pthread_mutex_lock(&sVIPLock);
  v5 = (id)sVipList;
  v249 = (id)sVipEmails;
  v6 = (id)sMeEmailAddresses;
  pthread_mutex_unlock(&sVIPLock);
  v274 = 0.0;
  if (SSCompactRankingAttrsGetFloat((uint64_t)self->_attributes, 0x120uLL, &v274))
  {
    v7 = v274;
    a3->var0[a3->var2] = 1855;
    var1 = a3->var1;
    var2 = a3->var2;
    a3->var2 = var2 + 1;
    var1[var2] = v7;
  }
  v245 = v6;
  v241 = v5;
  v247 = self;
  SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x11FuLL);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10
    && (unint64_t)objc_msgSend(v10, "count") <= 4
    && objc_msgSend(v11, "containsObject:", *MEMORY[0x1E0CA5EB0]))
  {
    a3->var0[a3->var2] = 1856;
    v12 = a3->var1;
    v13 = a3->var2;
    a3->var2 = v13 + 1;
    v12[v13] = 1.0;
  }
  v242 = a3;
  v240 = v11;
  SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x23uLL);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *(_QWORD *)&self->_indexScore[8];
  v16 = *(_QWORD *)self->_indexScore;
  v270 = 0u;
  v271 = 0u;
  v272 = 0u;
  v273 = 0u;
  v17 = v14;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v270, v279, 16);
  if (v18)
  {
    v19 = v18;
    v20 = 0;
    v246 = 0;
    v21 = *(_QWORD *)v271;
    do
    {
      v22 = v17;
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v271 != v21)
          objc_enumerationMutation(v22);
        v24 = *(_QWORD *)(*((_QWORD *)&v270 + 1) + 8 * i);
        if (objc_msgSend(v249, "containsObject:", v24))
        {
          matchedSenders = v247->_matchedSenders;
          if (matchedSenders)
          {
            -[NSMutableArray addObject:](matchedSenders, "addObject:", v24);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v24);
            v26 = objc_claimAutoreleasedReturnValue();
            v27 = v247->_matchedSenders;
            v247->_matchedSenders = (NSMutableArray *)v26;

          }
          objc_msgSend((id)sRankingQueryIndexDictionary, "objectForKeyedSubscript:", CFSTR("kMDItemAuthorsPrefixWord"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v28, "unsignedIntegerValue");
          v30 = ((2 * v15) << ~v29) | (v16 >> v29);
          if ((v29 & 0x40) != 0)
            v30 = v15 >> v29;
          v246 = v30 & 1;

          v20 = 1;
        }
      }
      v17 = v22;
      v19 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v270, v279, 16);
    }
    while (v19);
  }
  else
  {
    v20 = 0;
    v246 = 0;
  }

  objc_msgSend((id)sRankingQueryIndexDictionary, "objectForKeyedSubscript:", CFSTR("kMDItemUserIsSender"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "unsignedIntegerValue");
  v33 = 1 << v32;
  if ((v32 & 0x40) != 0)
    v34 = 0;
  else
    v34 = 1 << v32;
  if ((v32 & 0x40) == 0)
    v33 = 0;
  *(_QWORD *)&v236 = v34 & v16;
  *((_QWORD *)&v236 + 1) = v33 & v15;
  v35 = v34 & v16 | v33 & v15;

  if (v35)
  {
    SSCompactRankingAttrsGetValue((int8x8_t *)v247->_attributes, 0x125uLL);
    v266 = 0u;
    v267 = 0u;
    v268 = 0u;
    v269 = 0u;
    v36 = (id)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v266, v278, 16);
    v38 = v245;
    if (v37)
    {
      v39 = *(_QWORD *)v267;
      v40 = v242;
      while (2)
      {
        for (j = 0; j != v37; ++j)
        {
          if (*(_QWORD *)v267 != v39)
            objc_enumerationMutation(v36);
          v42 = *(_QWORD *)(*((_QWORD *)&v266 + 1) + 8 * j);
          if (objc_msgSend(v249, "containsObject:", v42))
          {
            matchedRecipients = v247->_matchedRecipients;
            if (matchedRecipients)
            {
              -[NSMutableArray addObject:](matchedRecipients, "addObject:", v42);
            }
            else
            {
              v45 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v42, 0);
              v46 = v247->_matchedRecipients;
              v247->_matchedRecipients = (NSMutableArray *)v45;

            }
            LODWORD(v37) = 1;
            goto LABEL_44;
          }
        }
        v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v266, v278, 16);
        if (v37)
          continue;
        break;
      }
    }
    else
    {
      v40 = v242;
    }
LABEL_44:
    v44 = v20;

  }
  else
  {
    v44 = v20;
    LODWORD(v37) = 0;
    v38 = v245;
    v40 = v242;
  }
  v47 = v247;
  SSCompactRankingAttrsGetValue((int8x8_t *)v247->_attributes, 0x123uLL);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  SSCompactRankingAttrsGetValue((int8x8_t *)v247->_attributes, 0x11DuLL);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  SSCompactRankingAttrsGetValue((int8x8_t *)v247->_attributes, 0x20uLL);
  v239 = (void *)objc_claimAutoreleasedReturnValue();
  SSCompactRankingAttrsGetValue((int8x8_t *)v247->_attributes, 0x125uLL);
  v248 = (char *)objc_claimAutoreleasedReturnValue();
  SSCompactRankingAttrsGetValue((int8x8_t *)v47->_attributes, 0x126uLL);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  SSCompactRankingAttrsGetValue((int8x8_t *)v47->_attributes, 0x127uLL);
  v51 = objc_claimAutoreleasedReturnValue();
  SSCompactRankingAttrsGetValue((int8x8_t *)v47->_attributes, 0x128uLL);
  v244 = (void *)objc_claimAutoreleasedReturnValue();
  v264 = 0;
  v265 = 0;
  v263 = 0;
  v262 = 0.0;
  -[PRSRankingItem mailFreshnessDate](v47, "mailFreshnessDate");
  v52 = objc_claimAutoreleasedReturnValue();
  mailDate = v47->_mailDate;
  v47->_mailDate = (NSDate *)v52;

  if (SSCompactRankingAttrsGetFloat((uint64_t)v47->_attributes, 0x121uLL, (_DWORD *)&v265 + 1))
  {
    v54 = *((float *)&v265 + 1);
    v40->var0[v40->var2] = 1901;
    v55 = v40->var1;
    v56 = v40->var2;
    v40->var2 = v56 + 1;
    v55[v56] = v54;
  }
  if (SSCompactRankingAttrsGetFloat((uint64_t)v47->_attributes, 0x120uLL, &v265))
  {
    v57 = *(float *)&v265;
    v40->var0[v40->var2] = 1902;
    v58 = v40->var1;
    v59 = v40->var2;
    v40->var2 = v59 + 1;
    v58[v59] = v57;
  }
  if (SSCompactRankingAttrsGetFloat((uint64_t)v47->_attributes, 0x122uLL, (_DWORD *)&v264 + 1))
  {
    v60 = *((float *)&v264 + 1);
    v40->var0[v40->var2] = 1903;
    v61 = v40->var1;
    v62 = v40->var2;
    v40->var2 = v62 + 1;
    v61[v62] = v60;
  }
  if (SSCompactRankingAttrsGetFloat((uint64_t)v47->_attributes, 0x12BuLL, &v262))
  {
    v63 = v262;
    v40->var0[v40->var2] = 1906;
    v64 = v40->var1;
    v65 = v40->var2;
    v40->var2 = v65 + 1;
    v64[v65] = v63;
  }
  if (SSCompactRankingAttrsGetFloat((uint64_t)v47->_attributes, 0x129uLL, (_DWORD *)&v263 + 1))
  {
    v66 = *((float *)&v263 + 1);
    v40->var0[v40->var2] = 1904;
    v67 = v40->var1;
    v68 = v40->var2;
    v40->var2 = v68 + 1;
    v67[v68] = v66;
  }
  if (SSCompactRankingAttrsGetFloat((uint64_t)v47->_attributes, 0x12AuLL, &v263))
  {
    v69 = *(float *)&v263;
    v40->var0[v40->var2] = 1905;
    v70 = v40->var1;
    v71 = v40->var2;
    v40->var2 = v71 + 1;
    v70[v71] = v69;
  }
  if ((SSCompactRankingAttrsGetFloat((uint64_t)v47->_attributes, 0x11BuLL, &v264) & 1) != 0)
  {
    v73 = *(float *)&v264;
    v40->var0[v40->var2] = 1900;
    v74 = v40->var1;
    v75 = v40->var2;
    v76 = v75 + 1;
    v40->var2 = v75 + 1;
    v74[v75] = v73;
  }
  else
  {
    v76 = v40->var2;
  }
  v77 = 0.0;
  if ((v44 & 1) != 0)
    v78 = 1.0;
  else
    v78 = 0.0;
  v40->var0[v76] = 1852;
  v79 = v40->var1;
  v80 = v40->var2;
  v40->var2 = v80 + 1;
  v79[v80] = v78;
  if ((_DWORD)v37)
    v77 = 1.0;
  v40->var0[v80 + 1] = 1854;
  v81 = v40->var1;
  v82 = v40->var2;
  v40->var2 = v82 + 1;
  v81[v82] = v77;
  v40->var0[v82 + 1] = 1852;
  v83 = v40->var1;
  v84 = v40->var2;
  v40->var2 = v84 + 1;
  v83[v84] = v78;
  v40->var0[v84 + 1] = 1854;
  v85 = v40->var1;
  v86 = v40->var2;
  v40->var2 = v86 + 1;
  v85[v86] = v77;
  if (v48 && v49)
  {
    objc_msgSend(v48, "timeIntervalSinceDate:", v49);
    *(float *)&v87 = v87;
    +[PRSRankingUtilities floatValue:withSigFigs:](PRSRankingUtilities, "floatValue:withSigFigs:", 2, v87);
    v40->var0[v40->var2] = 1891;
    v88 = v40->var1;
    v89 = v40->var2;
    v40->var2 = v89 + 1;
    v88[v89] = *(float *)&v72;
  }
  v243 = v49;
  v90 = v248;
  v237 = (void *)v51;
  v238 = v48;
  if (v248 && objc_msgSend(v248, "count") && !v50 && !v51)
  {
    v91 = v17;
    v92 = objc_msgSend(v248, "count");
    v235 = 0;
    v93 = 0;
    v94 = 0;
    LODWORD(v72) = 0;
    if (v92 == 1)
      *(float *)&v72 = 1.0;
    v40->var0[v40->var2] = 1892;
    v95 = v40->var1;
    v96 = v40->var2;
    v97 = v96 + 1;
    v40->var2 = v96 + 1;
    v95[v96] = *(float *)&v72;
    goto LABEL_89;
  }
  v93 = v51 != 0;
  if (v51)
  {
    v40->var0[v40->var2] = 1893;
    v98 = v40->var1;
    v99 = v40->var2;
    v40->var2 = v99 + 1;
    v98[v99] = 1.0;
    if (v38)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v51);
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v38);
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      v102 = objc_msgSend(v100, "intersectsSet:", v101);

      v91 = v17;
      if (v102)
      {
        v40->var0[v40->var2] = 1894;
        v103 = v40->var1;
        v104 = v40->var2;
        v40->var2 = v104 + 1;
        v103[v104] = 1.0;
        LODWORD(v51) = 1;
      }
      else
      {
        LODWORD(v51) = 0;
      }
      v38 = v245;
      v49 = v243;
      v90 = v248;
    }
    else
    {
      v91 = v17;
      LODWORD(v51) = 0;
    }
  }
  else
  {
    v91 = v17;
  }
  v94 = v50 != 0;
  if (v50
    && (v40->var0[v40->var2] = 1895, v105 = v40->var1, v106 = v40->var2, v40->var2 = v106 + 1, v105[v106] = 1.0, v38))
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v50);
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v38);
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    v109 = objc_msgSend(v107, "intersectsSet:", v108);

    if (v109)
    {
      v40->var0[v40->var2] = 1896;
      v110 = v40->var1;
      v111 = v40->var2;
      v40->var2 = v111 + 1;
      v110[v111] = 1.0;
      LODWORD(v51) = v51 + 1;
      v235 = 1;
    }
    else
    {
      v235 = 0;
    }
    v38 = v245;
    v49 = v243;
    v90 = v248;
    if (!v248)
      goto LABEL_97;
  }
  else
  {
    v235 = 0;
    if (!v90)
    {
LABEL_97:
      v119 = 0;
      goto LABEL_98;
    }
  }
  v97 = v40->var2;
LABEL_89:
  v40->var0[v97] = 1897;
  v112 = v40->var1;
  v113 = v40->var2;
  v40->var2 = v113 + 1;
  v112[v113] = 1.0;
  if (v38)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v90);
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v38);
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    v116 = objc_msgSend(v114, "intersectsSet:", v115);

    if (v116)
    {
      v40->var0[v40->var2] = 1898;
      v117 = v40->var1;
      v118 = v40->var2;
      v40->var2 = v118 + 1;
      v117[v118] = 1.0;
      LODWORD(v51) = v51 + 1;
      v119 = 1;
    }
    else
    {
      v119 = 0;
    }
    v38 = v245;
    v49 = v243;
    v90 = v248;
  }
  else
  {
    v119 = 0;
    v49 = v243;
  }
LABEL_98:
  v120 = *((float *)&v263 + 1) != 0.0;
  LODWORD(v72) = v263;
  if (*(float *)&v263 != 0.0)
    v120 = 1;
  v121 = (v90 == 0) & ~(v93 || v94);
  if (!v49)
    v121 = 0;
  if ((v121 & 1) != 0 || (_DWORD)v51 == v120 << 31 >> 31)
  {
    v40->var0[v40->var2] = 1894;
    v122 = v40->var1;
    v123 = v40->var2;
    v40->var2 = v123 + 1;
    v122[v123] = 1.0;
  }
  v124 = objc_msgSend(v244, "count", v72);
  v125 = v40->var2;
  if (v124)
  {
    v40->var0[v125] = 1899;
    v126 = v40->var1;
    v127 = v40->var2;
    v125 = v127 + 1;
    v40->var2 = v127 + 1;
    v126[v127] = 1.0;
  }
  v128 = 0.0;
  if ((v246 & 1) != 0)
    v128 = 1.0;
  v40->var0[v125] = 1853;
  v129 = v40->var1;
  v130 = v40->var2;
  v40->var2 = v130 + 1;
  v129[v130] = v128;
  if (v236 != 0)
  {
    if (v90 && objc_msgSend(v90, "count"))
    {
LABEL_115:
      if (objc_msgSend(v90, "count"))
      {
        v90 = (char *)objc_msgSend(v90, "count");
        if (!v94)
          goto LABEL_141;
      }
      else
      {
        v90 = 0;
        if (!v94)
        {
LABEL_141:
          v134 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v90);
          v258 = 0u;
          v259 = 0u;
          v260 = 0u;
          v261 = 0u;
          v185 = v248;
          v186 = objc_msgSend(v185, "countByEnumeratingWithState:objects:count:", &v258, v277, 16);
          v131 = v91;
          v132 = v238;
          if (v186)
          {
            v187 = v186;
            v188 = *(_QWORD *)v259;
            do
            {
              for (k = 0; k != v187; ++k)
              {
                if (*(_QWORD *)v259 != v188)
                  objc_enumerationMutation(v185);
                v190 = (void *)_SICreateContactMailCounts();
                if (v190)
                  objc_msgSend(v134, "addObject:", v190);

              }
              v187 = objc_msgSend(v185, "countByEnumeratingWithState:objects:count:", &v258, v277, 16);
            }
            while (v187);
          }

          v256 = 0u;
          v257 = 0u;
          v254 = 0u;
          v255 = 0u;
          v191 = v50;
          v192 = objc_msgSend(v191, "countByEnumeratingWithState:objects:count:", &v254, v276, 16);
          if (v192)
          {
            v193 = v192;
            v194 = *(_QWORD *)v255;
            do
            {
              for (m = 0; m != v193; ++m)
              {
                if (*(_QWORD *)v255 != v194)
                  objc_enumerationMutation(v191);
                v196 = (void *)_SICreateContactMailCounts();
                if (v196)
                  objc_msgSend(v134, "addObject:", v196);

              }
              v193 = objc_msgSend(v191, "countByEnumeratingWithState:objects:count:", &v254, v276, 16);
            }
            while (v193);
          }

          objc_msgSend(v134, "sortedArrayWithOptions:usingComparator:", 1, &__block_literal_global_186);
          v197 = (void *)objc_claimAutoreleasedReturnValue();
          v142 = v197;
          if (!v197 || !objc_msgSend(v197, "count"))
            goto LABEL_163;
          objc_msgSend(v142, "objectAtIndexedSubscript:", 0);
          v198 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v198, "objectAtIndexedSubscript:", 0);
          v199 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v199, "floatValue");
          v145 = v242;
          v242->var0[v242->var2] = 2030;
          v200 = v242->var1;
          v201 = v242->var2;
          v242->var2 = v201 + 1;
          v200[v201] = v202;

          objc_msgSend(v142, "objectAtIndexedSubscript:", 0);
          v203 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v203, "objectAtIndexedSubscript:", 1);
          v204 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v204, "floatValue");
          v242->var0[v242->var2] = 2029;
          v205 = v242->var1;
          v206 = v242->var2;
          v242->var2 = v206 + 1;
          v205[v206] = v207;

          objc_msgSend(v142, "objectAtIndexedSubscript:", 0);
          v208 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v208, "objectAtIndexedSubscript:", 2);
          v209 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v209, "floatValue");
          v242->var0[v242->var2] = 2028;
          v210 = v242->var1;
          v211 = v242->var2;
          v242->var2 = v211 + 1;
          v210[v211] = v212;

          objc_msgSend(v142, "objectAtIndexedSubscript:", 0);
          v213 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v213, "objectAtIndexedSubscript:", 3);
          v214 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v214, "floatValue");
          v242->var0[v242->var2] = 2027;
          v215 = v242->var1;
          v216 = v242->var2;
          v242->var2 = v216 + 1;
          v215[v216] = v217;

          objc_msgSend(v142, "objectAtIndexedSubscript:", 0);
          v218 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v218, "objectAtIndexedSubscript:", 4);
          v219 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v219, "floatValue");
          v242->var0[v242->var2] = 2026;
          v220 = v242->var1;
          v221 = v242->var2;
          v242->var2 = v221 + 1;
          v220[v221] = v222;

          objc_msgSend(v142, "objectAtIndexedSubscript:", 0);
          v223 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v223, "objectAtIndexedSubscript:", 5);
          v224 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v224, "floatValue");
          v242->var0[v242->var2] = 2025;
          v225 = v242->var1;
          v226 = v242->var2;
          v242->var2 = v226 + 1;
          v225[v226] = v227;

          objc_msgSend(v142, "objectAtIndexedSubscript:", 0);
          v228 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v228, "objectAtIndexedSubscript:", 6);
          v229 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v229, "floatValue");
          v242->var0[v242->var2] = 2024;
          v230 = v242->var1;
          v231 = v242->var2;
          v242->var2 = v231 + 1;
          v230[v231] = v232;

          objc_msgSend(v142, "objectAtIndexedSubscript:", 0);
          v179 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v179, "objectAtIndexedSubscript:", 7);
          v180 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v180, "floatValue");
          var0 = v242->var0;
          v183 = v242->var2;
          v184 = 2023;
LABEL_162:
          var0[v183] = v184;
          v233 = v145->var1;
          v234 = v145->var2;
          v145->var2 = v234 + 1;
          v233[v234] = v181;

LABEL_163:
          v38 = v245;
          v49 = v243;
          v90 = v248;
          goto LABEL_164;
        }
      }
LABEL_139:
      if (objc_msgSend(v50, "count"))
        v90 += objc_msgSend(v50, "count");
      goto LABEL_141;
    }
    if (v94 && objc_msgSend(v50, "count"))
    {
      if (!v90)
        goto LABEL_139;
      goto LABEL_115;
    }
  }
  if ((v119 & 1) != 0)
  {
    v131 = v91;
    v132 = v238;
    if (!v131)
      goto LABEL_164;
  }
  else
  {
    v131 = v91;
    if (v91)
      v133 = v235;
    else
      v133 = 0;
    v132 = v238;
    if ((v133 & 1) == 0)
      goto LABEL_164;
  }
  if (objc_msgSend(v131, "count"))
  {
    v134 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v131, "count"));
    v250 = 0u;
    v251 = 0u;
    v252 = 0u;
    v253 = 0u;
    v135 = v131;
    v136 = objc_msgSend(v135, "countByEnumeratingWithState:objects:count:", &v250, v275, 16);
    if (v136)
    {
      v137 = v136;
      v138 = *(_QWORD *)v251;
      do
      {
        for (n = 0; n != v137; ++n)
        {
          if (*(_QWORD *)v251 != v138)
            objc_enumerationMutation(v135);
          v140 = (void *)_SICreateContactMailCounts();
          if (v140)
            objc_msgSend(v134, "addObject:", v140);

        }
        v137 = objc_msgSend(v135, "countByEnumeratingWithState:objects:count:", &v250, v275, 16);
      }
      while (v137);
    }

    objc_msgSend(v134, "sortedArrayWithOptions:usingComparator:", 1, &__block_literal_global_187);
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    v142 = v141;
    if (!v141 || !objc_msgSend(v141, "count"))
      goto LABEL_163;
    objc_msgSend(v142, "objectAtIndexedSubscript:", 0);
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v143, "objectAtIndexedSubscript:", 0);
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v144, "floatValue");
    v145 = v242;
    v242->var0[v242->var2] = 2022;
    v146 = v242->var1;
    v147 = v242->var2;
    v242->var2 = v147 + 1;
    v146[v147] = v148;

    objc_msgSend(v142, "objectAtIndexedSubscript:", 0);
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v149, "objectAtIndexedSubscript:", 1);
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v150, "floatValue");
    v242->var0[v242->var2] = 2021;
    v151 = v242->var1;
    v152 = v242->var2;
    v242->var2 = v152 + 1;
    v151[v152] = v153;

    objc_msgSend(v142, "objectAtIndexedSubscript:", 0);
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v154, "objectAtIndexedSubscript:", 2);
    v155 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v155, "floatValue");
    v242->var0[v242->var2] = 2020;
    v156 = v242->var1;
    v157 = v242->var2;
    v242->var2 = v157 + 1;
    v156[v157] = v158;

    objc_msgSend(v142, "objectAtIndexedSubscript:", 0);
    v159 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v159, "objectAtIndexedSubscript:", 3);
    v160 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v160, "floatValue");
    v242->var0[v242->var2] = 2019;
    v161 = v242->var1;
    v162 = v242->var2;
    v242->var2 = v162 + 1;
    v161[v162] = v163;

    objc_msgSend(v142, "objectAtIndexedSubscript:", 0);
    v164 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v164, "objectAtIndexedSubscript:", 4);
    v165 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v165, "floatValue");
    v242->var0[v242->var2] = 2018;
    v166 = v242->var1;
    v167 = v242->var2;
    v242->var2 = v167 + 1;
    v166[v167] = v168;

    objc_msgSend(v142, "objectAtIndexedSubscript:", 0);
    v169 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v169, "objectAtIndexedSubscript:", 5);
    v170 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v170, "floatValue");
    v242->var0[v242->var2] = 2017;
    v171 = v242->var1;
    v172 = v242->var2;
    v242->var2 = v172 + 1;
    v171[v172] = v173;

    objc_msgSend(v142, "objectAtIndexedSubscript:", 0);
    v174 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v174, "objectAtIndexedSubscript:", 6);
    v175 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v175, "floatValue");
    v242->var0[v242->var2] = 2016;
    v176 = v242->var1;
    v177 = v242->var2;
    v242->var2 = v177 + 1;
    v176[v177] = v178;

    objc_msgSend(v142, "objectAtIndexedSubscript:", 0);
    v179 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v179, "objectAtIndexedSubscript:", 7);
    v180 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v180, "floatValue");
    var0 = v242->var0;
    v183 = v242->var2;
    v184 = 2015;
    goto LABEL_162;
  }
LABEL_164:

}

uint64_t __39__PRSRankingItem_populateMailFeatures___block_invoke(uint64_t a1, void *a2, void *a3)
{
  return -(*((uint64_t (**)(uint64_t, void *, void *))countsArrayComparator + 2))((uint64_t)countsArrayComparator, a2, a3);
}

uint64_t __39__PRSRankingItem_populateMailFeatures___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  return -(*((uint64_t (**)(uint64_t, void *, void *))countsArrayComparator + 2))((uint64_t)countsArrayComparator, a2, a3);
}

- (void)populateSMSFeatures:(PRSL2FeatureScoreInfo *)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  float *var1;
  unint64_t var2;
  float v20;
  void *v21;
  void *v22;
  float *v23;
  unint64_t v24;
  float v25;
  void *v26;
  void *v27;
  float *v28;
  unint64_t v29;
  float v30;
  void *v31;
  void *v32;
  float *v33;
  unint64_t v34;
  float v35;
  void *v36;
  void *v37;
  float *v38;
  unint64_t v39;
  float v40;
  void *v41;
  void *v42;
  float *v43;
  unint64_t v44;
  float v45;
  void *v46;
  void *v47;
  float *v48;
  unint64_t v49;
  float v50;
  void *v51;
  void *v52;
  float *v53;
  unint64_t v54;
  float v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  float *v69;
  unint64_t v70;
  float v71;
  void *v72;
  void *v73;
  float *v74;
  unint64_t v75;
  float v76;
  void *v77;
  void *v78;
  float *v79;
  unint64_t v80;
  float v81;
  void *v82;
  void *v83;
  float *v84;
  unint64_t v85;
  float v86;
  void *v87;
  void *v88;
  float *v89;
  unint64_t v90;
  float v91;
  void *v92;
  void *v93;
  float *v94;
  unint64_t v95;
  float v96;
  void *v97;
  void *v98;
  float *v99;
  unint64_t v100;
  float v101;
  void *v102;
  void *v103;
  float *v104;
  unint64_t v105;
  float v106;
  void *v107;
  void *v108;
  float *v109;
  unint64_t v110;
  float v111;
  void *v112;
  float *v113;
  unint64_t v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  _BYTE v123[128];
  _BYTE v124[128];
  uint64_t v125;

  v125 = *MEMORY[0x1E0C80C00];
  SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x2FuLL);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && objc_msgSend(v5, "count") && (unint64_t)objc_msgSend(v6, "count") <= 4)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v6, "count"));
    v119 = 0u;
    v120 = 0u;
    v121 = 0u;
    v122 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v119, v124, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v120;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v120 != v11)
            objc_enumerationMutation(v8);
          v13 = (void *)_SICreateContactSMSCounts();
          if (v13)
            objc_msgSend(v7, "addObject:", v13);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v119, v124, 16);
      }
      while (v10);
    }

    objc_msgSend(v7, "sortedArrayWithOptions:usingComparator:", 1, &__block_literal_global_188);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14 && objc_msgSend(v14, "count"))
    {
      objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "floatValue");
      a3->var0[a3->var2] = 2038;
      var1 = a3->var1;
      var2 = a3->var2;
      a3->var2 = var2 + 1;
      var1[var2] = v20;

      objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectAtIndexedSubscript:", 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "floatValue");
      a3->var0[a3->var2] = 2037;
      v23 = a3->var1;
      v24 = a3->var2;
      a3->var2 = v24 + 1;
      v23[v24] = v25;

      objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "objectAtIndexedSubscript:", 2);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "floatValue");
      a3->var0[a3->var2] = 2036;
      v28 = a3->var1;
      v29 = a3->var2;
      a3->var2 = v29 + 1;
      v28[v29] = v30;

      objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "objectAtIndexedSubscript:", 3);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "floatValue");
      a3->var0[a3->var2] = 2035;
      v33 = a3->var1;
      v34 = a3->var2;
      a3->var2 = v34 + 1;
      v33[v34] = v35;

      objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "objectAtIndexedSubscript:", 4);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "floatValue");
      a3->var0[a3->var2] = 2034;
      v38 = a3->var1;
      v39 = a3->var2;
      a3->var2 = v39 + 1;
      v38[v39] = v40;

      objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "objectAtIndexedSubscript:", 5);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "floatValue");
      a3->var0[a3->var2] = 2033;
      v43 = a3->var1;
      v44 = a3->var2;
      a3->var2 = v44 + 1;
      v43[v44] = v45;

      objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "objectAtIndexedSubscript:", 6);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "floatValue");
      a3->var0[a3->var2] = 2032;
      v48 = a3->var1;
      v49 = a3->var2;
      a3->var2 = v49 + 1;
      v48[v49] = v50;

      objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "objectAtIndexedSubscript:", 7);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "floatValue");
      a3->var0[a3->var2] = 2031;
      v53 = a3->var1;
      v54 = a3->var2;
      a3->var2 = v54 + 1;
      v53[v54] = v55;

    }
  }
  SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x30uLL);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = v56;
  if (v56 && objc_msgSend(v56, "count") && (unint64_t)objc_msgSend(v57, "count") <= 4)
  {
    v58 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v57, "count"));
    v115 = 0u;
    v116 = 0u;
    v117 = 0u;
    v118 = 0u;
    v59 = v57;
    v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v115, v123, 16);
    if (v60)
    {
      v61 = v60;
      v62 = *(_QWORD *)v116;
      do
      {
        v63 = 0;
        do
        {
          if (*(_QWORD *)v116 != v62)
            objc_enumerationMutation(v59);
          v64 = (void *)_SICreateContactSMSCounts();
          if (v64)
            objc_msgSend(v58, "addObject:", v64, v115);

          ++v63;
        }
        while (v61 != v63);
        v61 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v115, v123, 16);
      }
      while (v61);
    }

    objc_msgSend(v58, "sortedArrayWithOptions:usingComparator:", 1, &__block_literal_global_189);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = v65;
    if (v65 && objc_msgSend(v65, "count"))
    {
      objc_msgSend(v66, "objectAtIndexedSubscript:", 0);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "objectAtIndexedSubscript:", 0);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "floatValue");
      a3->var0[a3->var2] = 2046;
      v69 = a3->var1;
      v70 = a3->var2;
      a3->var2 = v70 + 1;
      v69[v70] = v71;

      objc_msgSend(v66, "objectAtIndexedSubscript:", 0);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "objectAtIndexedSubscript:", 1);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "floatValue");
      a3->var0[a3->var2] = 2045;
      v74 = a3->var1;
      v75 = a3->var2;
      a3->var2 = v75 + 1;
      v74[v75] = v76;

      objc_msgSend(v66, "objectAtIndexedSubscript:", 0);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "objectAtIndexedSubscript:", 2);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "floatValue");
      a3->var0[a3->var2] = 2044;
      v79 = a3->var1;
      v80 = a3->var2;
      a3->var2 = v80 + 1;
      v79[v80] = v81;

      objc_msgSend(v66, "objectAtIndexedSubscript:", 0);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "objectAtIndexedSubscript:", 3);
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "floatValue");
      a3->var0[a3->var2] = 2043;
      v84 = a3->var1;
      v85 = a3->var2;
      a3->var2 = v85 + 1;
      v84[v85] = v86;

      objc_msgSend(v66, "objectAtIndexedSubscript:", 0);
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "objectAtIndexedSubscript:", 4);
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v88, "floatValue");
      a3->var0[a3->var2] = 2042;
      v89 = a3->var1;
      v90 = a3->var2;
      a3->var2 = v90 + 1;
      v89[v90] = v91;

      objc_msgSend(v66, "objectAtIndexedSubscript:", 0);
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v92, "objectAtIndexedSubscript:", 5);
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "floatValue");
      a3->var0[a3->var2] = 2041;
      v94 = a3->var1;
      v95 = a3->var2;
      a3->var2 = v95 + 1;
      v94[v95] = v96;

      objc_msgSend(v66, "objectAtIndexedSubscript:", 0);
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v97, "objectAtIndexedSubscript:", 6);
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v98, "floatValue");
      a3->var0[a3->var2] = 2040;
      v99 = a3->var1;
      v100 = a3->var2;
      a3->var2 = v100 + 1;
      v99[v100] = v101;

      objc_msgSend(v66, "objectAtIndexedSubscript:", 0);
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v102, "objectAtIndexedSubscript:", 7);
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v103, "floatValue");
      a3->var0[a3->var2] = 2039;
      v104 = a3->var1;
      v105 = a3->var2;
      a3->var2 = v105 + 1;
      v104[v105] = v106;

    }
  }
  SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x66uLL);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v108 = v107;
  if (v107)
  {
    objc_msgSend(v107, "floatValue");
    a3->var0[a3->var2] = 2385;
    v109 = a3->var1;
    v110 = a3->var2;
    a3->var2 = v110 + 1;
    v109[v110] = v111;
  }
  SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x32uLL);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v112, "isEqualToString:", CFSTR("attachmentDomain")))
  {
    a3->var0[a3->var2] = 2386;
    v113 = a3->var1;
    v114 = a3->var2;
    a3->var2 = v114 + 1;
    v113[v114] = 1.0;
  }

}

uint64_t __38__PRSRankingItem_populateSMSFeatures___block_invoke(uint64_t a1, void *a2, void *a3)
{
  return -(*((uint64_t (**)(uint64_t, void *, void *))countsArrayComparator + 2))((uint64_t)countsArrayComparator, a2, a3);
}

uint64_t __38__PRSRankingItem_populateSMSFeatures___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  return -(*((uint64_t (**)(uint64_t, void *, void *))countsArrayComparator + 2))((uint64_t)countsArrayComparator, a2, a3);
}

- (void)inferDateBinsFromDates:(id)a3 intoBins:(int *)a4
{
  id v5;
  double Current;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  int *v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  Current = CFAbsoluteTimeGetCurrent();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v11), "timeIntervalSinceReferenceDate", (_QWORD)v16);
        v13 = Current - v12;
        v14 = a4;
        if (v13 >= 86400.0)
        {
          v14 = a4 + 1;
          if (v13 >= 604800.0)
          {
            if (v13 >= 2592000.0)
              v15 = 3;
            else
              v15 = 2;
            v14 = &a4[v15];
          }
        }
        ++*v14;
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

}

- (void)populateTextContentDistanceMeasures:(PRSL2FeatureScoreInfo *)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  float *var1;
  unint64_t var2;
  float v9;
  void *v10;
  float *v11;
  unint64_t v12;
  float v13;
  void *v14;
  float *v15;
  unint64_t v16;
  float v17;
  void *v18;
  float *v19;
  unint64_t v20;
  float v21;
  id v22;

  SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x67uLL);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v22 = v4;
    v5 = objc_msgSend(v4, "count");
    v4 = v22;
    if (v5 >= 1)
    {
      objc_msgSend(v22, "objectAtIndexedSubscript:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      a3->var0[a3->var2] = 2381;
      objc_msgSend(v6, "floatValue");
      var1 = a3->var1;
      var2 = a3->var2;
      a3->var2 = var2 + 1;
      var1[var2] = v9;

      v4 = v22;
      if (v5 != 1)
      {
        objc_msgSend(v22, "objectAtIndexedSubscript:", 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        a3->var0[a3->var2] = 2382;
        objc_msgSend(v10, "floatValue");
        v11 = a3->var1;
        v12 = a3->var2;
        a3->var2 = v12 + 1;
        v11[v12] = v13;

        v4 = v22;
        if ((unint64_t)v5 >= 3)
        {
          objc_msgSend(v22, "objectAtIndexedSubscript:", 2);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          a3->var0[a3->var2] = 2383;
          objc_msgSend(v14, "floatValue");
          v15 = a3->var1;
          v16 = a3->var2;
          a3->var2 = v16 + 1;
          v15[v16] = v17;

          v4 = v22;
          if (v5 != 3)
          {
            objc_msgSend(v22, "objectAtIndexedSubscript:", 3);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            a3->var0[a3->var2] = 2384;
            objc_msgSend(v18, "floatValue");
            v19 = a3->var1;
            v20 = a3->var2;
            a3->var2 = v20 + 1;
            v19[v20] = v21;

            v4 = v22;
          }
        }
      }
    }
  }

}

- (float)bucketizeDenseScore:(float)a3 minScore:(float)a4 maxScore:(float)a5 highlyRelevantThresh:(float)a6 relevantThresh:(float)a7 queryID:(int64_t)a8
{
  NSObject *v12;
  double v13;
  double v14;
  float v18;
  float v19;
  int v20;
  int64_t v21;
  __int16 v22;
  double v23;
  __int16 v24;
  double v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (a3 <= 0.0)
    return a3;
  if (a3 > a6)
  {
    self->_itemDenseMatchStrengthType = 0;
    if (a5 == a6)
    {
      SSGeneralLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = a5;
        v14 = a6;
LABEL_19:
        v20 = 134218496;
        v21 = a8;
        v22 = 2048;
        v23 = v13;
        v24 = 2048;
        v25 = v14;
        _os_log_error_impl(&dword_1B86C5000, v12, OS_LOG_TYPE_ERROR, "qid=%ld - oldMax(%f) equals to oldMin(%f), division by zero encountered", (uint8_t *)&v20, 0x20u);
        goto LABEL_12;
      }
      goto LABEL_12;
    }
    v18 = (float)(a3 - a6) / (float)(a5 - a6);
    v19 = 0.8;
    return v19 + (float)(v18 * 0.2);
  }
  if (a3 > a7)
  {
    self->_itemDenseMatchStrengthType = 1;
    if (a6 == a7)
    {
      SSGeneralLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = a6;
        v14 = a7;
        goto LABEL_19;
      }
LABEL_12:

      return a3;
    }
    v18 = (float)(a3 - a7) / (float)(a6 - a7);
    v19 = 0.6;
    return v19 + (float)(v18 * 0.2);
  }
  self->_itemDenseMatchStrengthType = 2;
  if (a7 == a4)
  {
    SSGeneralLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = a7;
      v14 = a4;
      goto LABEL_19;
    }
    goto LABEL_12;
  }
  return (float)((float)((float)(a3 - a4) / (float)(a7 - a4)) * 0.6) + 0.0;
}

- (float)calibrateSemanticScore:(float)a3 queryTokenCount:(unint64_t)a4 queryID:(int64_t)a5
{
  uint64_t v9;
  NSObject *v10;
  uint64_t v14;
  unint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  NSObject *v21;
  float v22;

  self->_itemDenseMatchStrengthType = 3;
  v9 = objc_msgSend(MEMORY[0x1E0DA9B88], "version");
  if ((unint64_t)(v9 - 5) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    SSGeneralLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[PRSRankingItem calibrateSemanticScore:queryTokenCount:queryID:].cold.1();
    goto LABEL_4;
  }
  if (a3 > 0.0 && a3 < 1.0 && a4 != 0)
  {
    SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x108uLL);
    v14 = objc_claimAutoreleasedReturnValue();
    v10 = v14;
    if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v15 = -[NSObject unsignedIntegerValue](v10, "unsignedIntegerValue");
      if (v15)
      {
        if (v9 == 4)
        {
          *(float *)&v16 = calibrateMD4DenseScore(a4, v15, a3);
          LODWORD(v17) = 1.0;
          LODWORD(v18) = 1057813551;
          LODWORD(v19) = 1059709377;
          LODWORD(v20) = 1045462213;
        }
        else
        {
          *(float *)&v16 = calibrateMD3DenseScore(a4, v15, a5, a3);
          LODWORD(v18) = 1058703681;
          LODWORD(v19) = 1065895597;
          LODWORD(v17) = 1071636610;
          LODWORD(v20) = 1018796748;
        }
        -[PRSRankingItem bucketizeDenseScore:minScore:maxScore:highlyRelevantThresh:relevantThresh:queryID:](self, "bucketizeDenseScore:minScore:maxScore:highlyRelevantThresh:relevantThresh:queryID:", a5, v16, v20, v17, v19, v18);
        a3 = v22;
        goto LABEL_4;
      }
      SSGeneralLog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        -[PRSRankingItem calibrateSemanticScore:queryTokenCount:queryID:].cold.3();
    }
    else
    {
      SSGeneralLog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        -[PRSRankingItem calibrateSemanticScore:queryTokenCount:queryID:].cold.2(a5, v21);
    }

LABEL_4:
  }
  return a3;
}

- (id)getMatchInfoDictionaryWithKeyboardLanguage:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  SSTokenizedString *v22;
  void *v23;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v29 = a3;
  SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x4DuLL);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_new();
  v28 = (void *)objc_opt_new();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v31;
    v26 = v6;
    v27 = v5;
    v25 = *(_QWORD *)v31;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v31 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v12 = v11;
          if ((unint64_t)objc_msgSend(v12, "count") >= 2)
          {
            objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "objectForKeyedSubscript:", v13);
            v14 = objc_claimAutoreleasedReturnValue();
            if (v14)
            {
              v15 = (void *)v14;
              objc_msgSend(v28, "objectForKeyedSubscript:", v13);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v15 = (void *)objc_opt_new();
              v16 = (void *)objc_opt_new();
              objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, v13);
              objc_msgSend(v28, "setObject:forKeyedSubscript:", v16, v13);
            }
            if ((unint64_t)objc_msgSend(v12, "count") >= 2)
            {
              v17 = 1;
              do
              {
                objc_msgSend(v12, "objectAtIndexedSubscript:", v17);
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                v19 = objc_msgSend(v18, "length");

                objc_msgSend(v12, "objectAtIndexedSubscript:", v17);
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "substringToIndex:", v19);
                v21 = (void *)objc_claimAutoreleasedReturnValue();

                if (v21 && (objc_msgSend(v15, "containsObject:", v21) & 1) == 0)
                {
                  objc_msgSend(v15, "addObject:", v21);
                  v22 = -[SSTokenizedString initWithString:locale:]([SSTokenizedString alloc], "initWithString:locale:", v21, v29);
                  objc_msgSend(v16, "addObject:", v22);

                }
                ++v17;
              }
              while (v17 < objc_msgSend(v12, "count"));
            }

            v6 = v26;
            v5 = v27;
            v9 = v25;
          }

        }
        ++v10;
      }
      while (v10 != v8);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v8);
  }

  v23 = (void *)objc_msgSend(v28, "copy");
  return v23;
}

- (void)serializeAnonymousLogFeaturesToJSONWithWriter:(void *)a3 allowedAttributeSet:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  float v22;
  void *v23;
  float v24;
  id v25;
  float v26;
  void *v27;
  float v28;
  id v29;
  float v30;
  void *v31;
  float v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  void *v74;
  void *v75;
  void *v76;
  id v77;
  void *v78;
  void *v79;
  void *v80;
  id v81;
  void *v82;
  id v83;
  void *v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  id v92;
  void *v93;
  uint64_t v94;
  void *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  id v101;
  void *v102;
  uint64_t v103;
  void *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  id v110;
  void *v111;
  uint64_t v112;
  void *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  id v119;
  void *v120;
  PRSRankingItem *v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  _BYTE v142[128];
  _BYTE v143[128];
  _BYTE v144[128];
  _BYTE v145[128];
  _BYTE v146[128];
  uint64_t v147;

  v147 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v7, "setDateFormat:", CFSTR("yyyy-MM-dd HH"));
  objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v120 = v7;
  objc_msgSend(v7, "setTimeZone:", v8);

  v140 = 0u;
  v141 = 0u;
  v138 = 0u;
  v139 = 0u;
  -[PRSL2FeatureVector topicalityAnonFeatDict](self->_L2FeatureVector, "topicalityAnonFeatDict");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v138, v146, 16);
  v121 = self;
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v139;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v139 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v138 + 1) + 8 * i);
        if (objc_msgSend(v6, "containsObject:", v14))
        {
          -[PRSL2FeatureVector topicalityAnonFeatDict](self->_L2FeatureVector, "topicalityAnonFeatDict");
          v15 = v6;
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKeyedSubscript:", v14);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          v6 = v15;
          self = v121;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_MatchCounts"), v14);
          v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          json_writer_add_key((uint64_t)a3, (char *)objc_msgSend(v18, "UTF8String"), 0xFFFFFFFFFFFFFFFFLL, 1);

          json_writer_begin_array((uint64_t)a3);
          json_writer_add_int64((uint64_t)a3, objc_msgSend(v17, "countAttributeQUTokenMatch"));
          json_writer_add_int64((uint64_t)a3, objc_msgSend(v17, "countAttributeUnigramMatch"));
          json_writer_add_int64((uint64_t)a3, objc_msgSend(v17, "countAttributeBigramMatch"));
          json_writer_add_int64((uint64_t)a3, objc_msgSend(v17, "countAttributeNgramMatch"));
          json_writer_add_int64((uint64_t)a3, objc_msgSend(v17, "countAttributeQUPrefixMatch"));
          json_writer_add_int64((uint64_t)a3, objc_msgSend(v17, "countAttributeUnigramPrefixMatch"));
          json_writer_add_int64((uint64_t)a3, objc_msgSend(v17, "countAttributeBigramPrefixMatch"));
          json_writer_add_int64((uint64_t)a3, objc_msgSend(v17, "countAttributeNgramPrefixMatch"));
          json_writer_end_array((uint64_t)a3);

        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v138, v146, 16);
    }
    while (v11);
  }

  if (self->_embeddingSimilarity > 0.00000011921)
  {
    json_writer_add_key((uint64_t)a3, "EmbeddingSimilarity", 0xFFFFFFFFFFFFFFFFLL, 1);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%0.4f"), self->_embeddingSimilarity);
    v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    json_writer_add_string((uint64_t)a3, (char *)objc_msgSend(v19, "UTF8String"), 0xFFFFFFFFFFFFFFFFLL, 1);

  }
  -[PRSL2FeatureVector bundleId](self->_L2FeatureVector, "bundleId");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    json_writer_add_key((uint64_t)a3, "bundleID", 0xFFFFFFFFFFFFFFFFLL, 1);
    -[PRSL2FeatureVector bundleId](self->_L2FeatureVector, "bundleId");
    v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    json_writer_add_string((uint64_t)a3, (char *)objc_msgSend(v21, "UTF8String"), 0xFFFFFFFFFFFFFFFFLL, 1);

  }
  if (-[PRSL2FeatureVector textChunkTokenLength](self->_L2FeatureVector, "textChunkTokenLength"))
  {
    json_writer_add_key((uint64_t)a3, "textChunkTokenLength", 0xFFFFFFFFFFFFFFFFLL, 1);
    json_writer_add_int64((uint64_t)a3, -[PRSL2FeatureVector textChunkTokenLength](self->_L2FeatureVector, "textChunkTokenLength"));
  }
  -[PRSL2FeatureVector kMDMailRead](self->_L2FeatureVector, "kMDMailRead");
  if (v22 > 0.00000011921)
  {
    json_writer_add_key((uint64_t)a3, "MailRead", 0xFFFFFFFFFFFFFFFFLL, 1);
    v23 = (void *)MEMORY[0x1E0CB3940];
    -[PRSL2FeatureVector kMDMailRead](self->_L2FeatureVector, "kMDMailRead");
    objc_msgSend(v23, "stringWithFormat:", CFSTR("%0.4f"), v24);
    v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    json_writer_add_string((uint64_t)a3, (char *)objc_msgSend(v25, "UTF8String"), 0xFFFFFFFFFFFFFFFFLL, 1);

  }
  -[PRSL2FeatureVector kMDMailRepliedTo](self->_L2FeatureVector, "kMDMailRepliedTo");
  if (v26 > 0.00000011921)
  {
    json_writer_add_key((uint64_t)a3, "MailRepliedTo", 0xFFFFFFFFFFFFFFFFLL, 1);
    v27 = (void *)MEMORY[0x1E0CB3940];
    -[PRSL2FeatureVector kMDMailRepliedTo](self->_L2FeatureVector, "kMDMailRepliedTo");
    objc_msgSend(v27, "stringWithFormat:", CFSTR("%0.4f"), v28);
    v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    json_writer_add_string((uint64_t)a3, (char *)objc_msgSend(v29, "UTF8String"), 0xFFFFFFFFFFFFFFFFLL, 1);

  }
  -[PRSL2FeatureVector kMDMailFlagged](self->_L2FeatureVector, "kMDMailFlagged");
  if (v30 > 0.00000011921)
  {
    json_writer_add_key((uint64_t)a3, "MailFlagged", 0xFFFFFFFFFFFFFFFFLL, 1);
    v31 = (void *)MEMORY[0x1E0CB3940];
    -[PRSL2FeatureVector kMDMailFlagged](self->_L2FeatureVector, "kMDMailFlagged");
    objc_msgSend(v31, "stringWithFormat:", CFSTR("%0.4f"), v32);
    v33 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    json_writer_add_string((uint64_t)a3, (char *)objc_msgSend(v33, "UTF8String"), 0xFFFFFFFFFFFFFFFFLL, 1);

  }
  if (self->_isMailCategoryHighImpact)
  {
    json_writer_add_key((uint64_t)a3, "MailCategoryHighImpact", 0xFFFFFFFFFFFFFFFFLL, 1);
    json_writer_add_uint32((uint64_t)a3, self->_isMailCategoryHighImpact);
  }
  if (self->_isMailCategoryDefault)
  {
    json_writer_add_key((uint64_t)a3, "MailCategoryDefault", 0xFFFFFFFFFFFFFFFFLL, 1);
    json_writer_add_uint32((uint64_t)a3, self->_isMailCategoryDefault);
  }
  if (self->_isMailCategoryTransactions)
  {
    json_writer_add_key((uint64_t)a3, "MailCategoryTransactions", 0xFFFFFFFFFFFFFFFFLL, 1);
    json_writer_add_uint32((uint64_t)a3, self->_isMailCategoryTransactions);
  }
  if (self->_isMailCategoryUpdates)
  {
    json_writer_add_key((uint64_t)a3, "MailCategoryUpdates", 0xFFFFFFFFFFFFFFFFLL, 1);
    json_writer_add_uint32((uint64_t)a3, self->_isMailCategoryUpdates);
  }
  if (self->_isMailCategoryPromotions)
  {
    json_writer_add_key((uint64_t)a3, "MailCategoryPromotions", 0xFFFFFFFFFFFFFFFFLL, 1);
    json_writer_add_uint32((uint64_t)a3, self->_isMailCategoryPromotions);
  }
  -[PRSL2FeatureVector kMDMailReceivedDate](self->_L2FeatureVector, "kMDMailReceivedDate");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    -[PRSL2FeatureVector kMDMailReceivedDate](self->_L2FeatureVector, "kMDMailReceivedDate");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v120, "stringFromDate:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    json_writer_add_key((uint64_t)a3, "MailReceivedDate", 0xFFFFFFFFFFFFFFFFLL, 1);
    v37 = objc_retainAutorelease(v36);
    json_writer_add_string((uint64_t)a3, (char *)objc_msgSend(v37, "UTF8String"), 0xFFFFFFFFFFFFFFFFLL, 1);

  }
  -[PRSL2FeatureVector kMDMailLastViewedDate](self->_L2FeatureVector, "kMDMailLastViewedDate");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
  {
    -[PRSL2FeatureVector kMDMailLastViewedDate](self->_L2FeatureVector, "kMDMailLastViewedDate");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v120, "stringFromDate:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    json_writer_add_key((uint64_t)a3, "MailLastViewedDate", 0xFFFFFFFFFFFFFFFFLL, 1);
    v41 = objc_retainAutorelease(v40);
    json_writer_add_string((uint64_t)a3, (char *)objc_msgSend(v41, "UTF8String"), 0xFFFFFFFFFFFFFFFFLL, 1);

  }
  -[PRSL2FeatureVector kMDMailFreshnessDate](self->_L2FeatureVector, "kMDMailFreshnessDate");
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (v42)
  {
    -[PRSL2FeatureVector kMDMailFreshnessDate](self->_L2FeatureVector, "kMDMailFreshnessDate");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v120, "stringFromDate:", v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    json_writer_add_key((uint64_t)a3, "MailFreshnessDate", 0xFFFFFFFFFFFFFFFFLL, 1);
    v45 = objc_retainAutorelease(v44);
    json_writer_add_string((uint64_t)a3, (char *)objc_msgSend(v45, "UTF8String"), 0xFFFFFFFFFFFFFFFFLL, 1);

  }
  -[PRSL2FeatureVector kMDItemContentCreationDate](self->_L2FeatureVector, "kMDItemContentCreationDate");
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  if (v46)
  {
    -[PRSL2FeatureVector kMDItemContentCreationDate](self->_L2FeatureVector, "kMDItemContentCreationDate");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v120, "stringFromDate:", v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    json_writer_add_key((uint64_t)a3, "ItemContentCreationDate", 0xFFFFFFFFFFFFFFFFLL, 1);
    v49 = objc_retainAutorelease(v48);
    json_writer_add_string((uint64_t)a3, (char *)objc_msgSend(v49, "UTF8String"), 0xFFFFFFFFFFFFFFFFLL, 1);

  }
  -[PRSL2FeatureVector kMDItemLastUsedDate](self->_L2FeatureVector, "kMDItemLastUsedDate");
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  if (v50)
  {
    -[PRSL2FeatureVector kMDItemLastUsedDate](self->_L2FeatureVector, "kMDItemLastUsedDate");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v120, "stringFromDate:", v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    json_writer_add_key((uint64_t)a3, "ItemLastUsedDate", 0xFFFFFFFFFFFFFFFFLL, 1);
    v53 = objc_retainAutorelease(v52);
    json_writer_add_string((uint64_t)a3, (char *)objc_msgSend(v53, "UTF8String"), 0xFFFFFFFFFFFFFFFFLL, 1);

  }
  -[PRSL2FeatureVector kMDItemApplicationLastLaunchedDate](self->_L2FeatureVector, "kMDItemApplicationLastLaunchedDate");
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  if (v54)
  {
    -[PRSL2FeatureVector kMDItemApplicationLastLaunchedDate](self->_L2FeatureVector, "kMDItemApplicationLastLaunchedDate");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v120, "stringFromDate:", v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();

    json_writer_add_key((uint64_t)a3, "ItemApplicationLastLaunchedDate", 0xFFFFFFFFFFFFFFFFLL, 1);
    v57 = objc_retainAutorelease(v56);
    json_writer_add_string((uint64_t)a3, (char *)objc_msgSend(v57, "UTF8String"), 0xFFFFFFFFFFFFFFFFLL, 1);

  }
  -[PRSL2FeatureVector kMDItemContentModificationDate](self->_L2FeatureVector, "kMDItemContentModificationDate");
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  if (v58)
  {
    -[PRSL2FeatureVector kMDItemContentModificationDate](self->_L2FeatureVector, "kMDItemContentModificationDate");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v120, "stringFromDate:", v59);
    v60 = (void *)objc_claimAutoreleasedReturnValue();

    json_writer_add_key((uint64_t)a3, "ItemContentModificationDate", 0xFFFFFFFFFFFFFFFFLL, 1);
    v61 = objc_retainAutorelease(v60);
    json_writer_add_string((uint64_t)a3, (char *)objc_msgSend(v61, "UTF8String"), 0xFFFFFFFFFFFFFFFFLL, 1);

  }
  -[PRSL2FeatureVector kMDItemDueDate](self->_L2FeatureVector, "kMDItemDueDate");
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  if (v62)
  {
    -[PRSL2FeatureVector kMDItemDueDate](self->_L2FeatureVector, "kMDItemDueDate");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v120, "stringFromDate:", v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue();

    json_writer_add_key((uint64_t)a3, "ItemDueDate", 0xFFFFFFFFFFFFFFFFLL, 1);
    v65 = objc_retainAutorelease(v64);
    json_writer_add_string((uint64_t)a3, (char *)objc_msgSend(v65, "UTF8String"), 0xFFFFFFFFFFFFFFFFLL, 1);

  }
  -[PRSL2FeatureVector kMDItemCompletionDate](self->_L2FeatureVector, "kMDItemCompletionDate");
  v66 = (void *)objc_claimAutoreleasedReturnValue();

  if (v66)
  {
    -[PRSL2FeatureVector kMDItemCompletionDate](self->_L2FeatureVector, "kMDItemCompletionDate");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v120, "stringFromDate:", v67);
    v68 = (void *)objc_claimAutoreleasedReturnValue();

    json_writer_add_key((uint64_t)a3, "ItemCompletionDate", 0xFFFFFFFFFFFFFFFFLL, 1);
    v69 = objc_retainAutorelease(v68);
    json_writer_add_string((uint64_t)a3, (char *)objc_msgSend(v69, "UTF8String"), 0xFFFFFFFFFFFFFFFFLL, 1);

  }
  -[PRSL2FeatureVector kMDItemExpirationDate](self->_L2FeatureVector, "kMDItemExpirationDate");
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  if (v70)
  {
    -[PRSL2FeatureVector kMDItemExpirationDate](self->_L2FeatureVector, "kMDItemExpirationDate");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v120, "stringFromDate:", v71);
    v72 = (void *)objc_claimAutoreleasedReturnValue();

    json_writer_add_key((uint64_t)a3, "ItemExpirationDate", 0xFFFFFFFFFFFFFFFFLL, 1);
    v73 = objc_retainAutorelease(v72);
    json_writer_add_string((uint64_t)a3, (char *)objc_msgSend(v73, "UTF8String"), 0xFFFFFFFFFFFFFFFFLL, 1);

  }
  -[PRSL2FeatureVector kMDItemStartDate](self->_L2FeatureVector, "kMDItemStartDate");
  v74 = (void *)objc_claimAutoreleasedReturnValue();

  if (v74)
  {
    -[PRSL2FeatureVector kMDItemStartDate](self->_L2FeatureVector, "kMDItemStartDate");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v120, "stringFromDate:", v75);
    v76 = (void *)objc_claimAutoreleasedReturnValue();

    json_writer_add_key((uint64_t)a3, "ItemStartDate", 0xFFFFFFFFFFFFFFFFLL, 1);
    v77 = objc_retainAutorelease(v76);
    json_writer_add_string((uint64_t)a3, (char *)objc_msgSend(v77, "UTF8String"), 0xFFFFFFFFFFFFFFFFLL, 1);

  }
  -[PRSL2FeatureVector kMDItemEndDate](self->_L2FeatureVector, "kMDItemEndDate");
  v78 = (void *)objc_claimAutoreleasedReturnValue();

  if (v78)
  {
    -[PRSL2FeatureVector kMDItemEndDate](self->_L2FeatureVector, "kMDItemEndDate");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v120, "stringFromDate:", v79);
    v80 = (void *)objc_claimAutoreleasedReturnValue();

    json_writer_add_key((uint64_t)a3, "ItemEndDate", 0xFFFFFFFFFFFFFFFFLL, 1);
    v81 = objc_retainAutorelease(v80);
    json_writer_add_string((uint64_t)a3, (char *)objc_msgSend(v81, "UTF8String"), 0xFFFFFFFFFFFFFFFFLL, 1);

  }
  -[PRSL2FeatureVector kMDItemContentType](self->_L2FeatureVector, "kMDItemContentType");
  v82 = (void *)objc_claimAutoreleasedReturnValue();

  if (v82)
  {
    json_writer_add_key((uint64_t)a3, "ItemContentType", 0xFFFFFFFFFFFFFFFFLL, 1);
    -[PRSL2FeatureVector kMDItemContentType](self->_L2FeatureVector, "kMDItemContentType");
    v83 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    json_writer_add_string((uint64_t)a3, (char *)objc_msgSend(v83, "UTF8String"), 0xFFFFFFFFFFFFFFFFLL, 1);

  }
  -[PRSL2FeatureVector kMDItemUsedDates](self->_L2FeatureVector, "kMDItemUsedDates");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = objc_msgSend(v84, "count");

  if (v85)
  {
    json_writer_add_key((uint64_t)a3, "ItemUsedDates", 0xFFFFFFFFFFFFFFFFLL, 1);
    json_writer_begin_array((uint64_t)a3);
    v136 = 0u;
    v137 = 0u;
    v134 = 0u;
    v135 = 0u;
    -[PRSL2FeatureVector kMDItemUsedDates](self->_L2FeatureVector, "kMDItemUsedDates");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v134, v145, 16);
    if (v87)
    {
      v88 = v87;
      v89 = 0;
      v90 = *(_QWORD *)v135;
LABEL_61:
      v91 = 0;
      while (1)
      {
        if (*(_QWORD *)v135 != v90)
          objc_enumerationMutation(v86);
        objc_msgSend(v120, "stringFromDate:", *(_QWORD *)(*((_QWORD *)&v134 + 1) + 8 * v91));
        v92 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        json_writer_add_string((uint64_t)a3, (char *)objc_msgSend(v92, "UTF8String"), 0xFFFFFFFFFFFFFFFFLL, 1);

        if ((unint64_t)(v89 + v91 + 1) > 0x13)
          break;
        if (v88 == ++v91)
        {
          v88 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v134, v145, 16);
          v89 += v91;
          if (v88)
            goto LABEL_61;
          break;
        }
      }
    }

    json_writer_end_array((uint64_t)a3);
    self = v121;
  }
  -[PRSL2FeatureVector kMDItemRecentSpotlightEngagementDatesNonUnique](self->_L2FeatureVector, "kMDItemRecentSpotlightEngagementDatesNonUnique");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v94 = objc_msgSend(v93, "count");

  if (v94)
  {
    json_writer_add_key((uint64_t)a3, "ItemRecentSpotlightEngagementDatesNonUnique", 0xFFFFFFFFFFFFFFFFLL, 1);
    json_writer_begin_array((uint64_t)a3);
    v132 = 0u;
    v133 = 0u;
    v130 = 0u;
    v131 = 0u;
    -[PRSL2FeatureVector kMDItemRecentSpotlightEngagementDatesNonUnique](self->_L2FeatureVector, "kMDItemRecentSpotlightEngagementDatesNonUnique");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v96 = objc_msgSend(v95, "countByEnumeratingWithState:objects:count:", &v130, v144, 16);
    if (v96)
    {
      v97 = v96;
      v98 = 0;
      v99 = *(_QWORD *)v131;
LABEL_71:
      v100 = 0;
      while (1)
      {
        if (*(_QWORD *)v131 != v99)
          objc_enumerationMutation(v95);
        objc_msgSend(v120, "stringFromDate:", *(_QWORD *)(*((_QWORD *)&v130 + 1) + 8 * v100));
        v101 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        json_writer_add_string((uint64_t)a3, (char *)objc_msgSend(v101, "UTF8String"), 0xFFFFFFFFFFFFFFFFLL, 0);

        if ((unint64_t)(v98 + v100 + 1) > 0x13)
          break;
        if (v97 == ++v100)
        {
          v97 = objc_msgSend(v95, "countByEnumeratingWithState:objects:count:", &v130, v144, 16);
          v98 += v100;
          if (v97)
            goto LABEL_71;
          break;
        }
      }
    }

    json_writer_end_array((uint64_t)a3);
    self = v121;
  }
  -[PRSL2FeatureVector kMDItemRecentOutOfSpotlightEngagementDates](self->_L2FeatureVector, "kMDItemRecentOutOfSpotlightEngagementDates");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v103 = objc_msgSend(v102, "count");

  if (v103)
  {
    json_writer_add_key((uint64_t)a3, "ItemRecentOutOfSpotlightEngagementDates", 0xFFFFFFFFFFFFFFFFLL, 1);
    json_writer_begin_array((uint64_t)a3);
    v128 = 0u;
    v129 = 0u;
    v126 = 0u;
    v127 = 0u;
    -[PRSL2FeatureVector kMDItemRecentOutOfSpotlightEngagementDates](self->_L2FeatureVector, "kMDItemRecentOutOfSpotlightEngagementDates");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    v105 = objc_msgSend(v104, "countByEnumeratingWithState:objects:count:", &v126, v143, 16);
    if (v105)
    {
      v106 = v105;
      v107 = 0;
      v108 = *(_QWORD *)v127;
LABEL_81:
      v109 = 0;
      while (1)
      {
        if (*(_QWORD *)v127 != v108)
          objc_enumerationMutation(v104);
        objc_msgSend(v120, "stringFromDate:", *(_QWORD *)(*((_QWORD *)&v126 + 1) + 8 * v109));
        v110 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        json_writer_add_string((uint64_t)a3, (char *)objc_msgSend(v110, "UTF8String"), 0xFFFFFFFFFFFFFFFFLL, 1);

        if ((unint64_t)(v107 + v109 + 1) > 0x13)
          break;
        if (v106 == ++v109)
        {
          v106 = objc_msgSend(v104, "countByEnumeratingWithState:objects:count:", &v126, v143, 16);
          v107 += v109;
          if (v106)
            goto LABEL_81;
          break;
        }
      }
    }

    json_writer_end_array((uint64_t)a3);
    self = v121;
  }
  -[PRSL2FeatureVector kMDItemRecentAppSearchEngagementDates](self->_L2FeatureVector, "kMDItemRecentAppSearchEngagementDates");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v112 = objc_msgSend(v111, "count");

  if (v112)
  {
    json_writer_add_key((uint64_t)a3, "ItemRecentAppSearchEngagementDates", 0xFFFFFFFFFFFFFFFFLL, 1);
    json_writer_begin_array((uint64_t)a3);
    v124 = 0u;
    v125 = 0u;
    v122 = 0u;
    v123 = 0u;
    -[PRSL2FeatureVector kMDItemRecentAppSearchEngagementDates](self->_L2FeatureVector, "kMDItemRecentAppSearchEngagementDates");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    v114 = objc_msgSend(v113, "countByEnumeratingWithState:objects:count:", &v122, v142, 16);
    if (v114)
    {
      v115 = v114;
      v116 = 0;
      v117 = *(_QWORD *)v123;
LABEL_91:
      v118 = 0;
      while (1)
      {
        if (*(_QWORD *)v123 != v117)
          objc_enumerationMutation(v113);
        objc_msgSend(v120, "stringFromDate:", *(_QWORD *)(*((_QWORD *)&v122 + 1) + 8 * v118));
        v119 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        json_writer_add_string((uint64_t)a3, (char *)objc_msgSend(v119, "UTF8String"), 0xFFFFFFFFFFFFFFFFLL, 1);

        if ((unint64_t)(v116 + v118 + 1) > 0x13)
          break;
        if (v115 == ++v118)
        {
          v115 = objc_msgSend(v113, "countByEnumeratingWithState:objects:count:", &v122, v142, 16);
          v116 += v118;
          if (v115)
            goto LABEL_91;
          break;
        }
      }
    }

    json_writer_end_array((uint64_t)a3);
  }

}

- (void)populateAnonymousLogFeaturesWithEvaluator:(id)a3 currentTime:(double)a4 allowedAttributeSet:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  TopicalityAnonymousFeaturesForAttribute *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  id v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  int v34;
  int v35;
  int v36;
  void *v37;
  _BOOL4 v38;
  id v39;
  void *v40;
  unint64_t v41;
  void *v42;
  unint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  unint64_t v47;
  unint64_t v48;
  void *v49;
  char v50;
  void *v51;
  double v52;
  double v53;
  double v54;
  double v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  uint64_t v74;
  id v75;
  PRSRankingItem *v76;
  id v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  id obj;
  void *v82;
  int v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  _BYTE v92[128];
  _BYTE v93[128];
  uint64_t v94;

  v94 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  objc_msgSend(v7, "language");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRSRankingItem getMatchInfoDictionaryWithKeyboardLanguage:](self, "getMatchInfoDictionaryWithKeyboardLanguage:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "itemQPQUOutputTokenInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "valueForKey:", CFSTR("kQPQUOutputToken"));
  v82 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "itemQPQUOutputTokenInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "valueForKey:", CFSTR("kQPQUOutputTokenArgLabels"));
  v80 = (void *)objc_claimAutoreleasedReturnValue();

  v73 = v7;
  objc_msgSend(v7, "itemQPQUOutputTokenInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "valueForKey:", CFSTR("kQPQUOutputTokenArgScores"));
  v71 = objc_claimAutoreleasedReturnValue();

  v90 = 0u;
  v91 = 0u;
  v88 = 0u;
  v89 = 0u;
  v14 = v10;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v88, v93, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v89;
    v76 = self;
    v77 = v8;
    v74 = *(_QWORD *)v89;
    v75 = v14;
    do
    {
      v18 = 0;
      v78 = v16;
      do
      {
        if (*(_QWORD *)v89 != v17)
          objc_enumerationMutation(v14);
        v19 = *(_QWORD *)(*((_QWORD *)&v88 + 1) + 8 * v18);
        if (v19 && objc_msgSend(v8, "containsObject:", *(_QWORD *)(*((_QWORD *)&v88 + 1) + 8 * v18), v71))
        {
          v79 = v18;
          -[PRSL2FeatureVector topicalityAnonFeatDict](self->_L2FeatureVector, "topicalityAnonFeatDict");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "objectForKeyedSubscript:", v19);
          v21 = (TopicalityAnonymousFeaturesForAttribute *)objc_claimAutoreleasedReturnValue();

          if (!v21)
          {
            v21 = objc_alloc_init(TopicalityAnonymousFeaturesForAttribute);
            -[PRSL2FeatureVector topicalityAnonFeatDict](self->_L2FeatureVector, "topicalityAnonFeatDict");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "setObject:forKeyedSubscript:", v21, v19);

          }
          objc_msgSend(v14, "objectForKeyedSubscript:", v19);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v84 = 0u;
          v85 = 0u;
          v86 = 0u;
          v87 = 0u;
          obj = v23;
          v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v92, 16);
          if (v24)
          {
            v25 = v24;
            v26 = *(_QWORD *)v85;
            do
            {
              for (i = 0; i != v25; ++i)
              {
                if (*(_QWORD *)v85 != v26)
                  objc_enumerationMutation(obj);
                v28 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * i);
                objc_msgSend(v28, "original");
                v29 = (id)objc_claimAutoreleasedReturnValue();
                v30 = objc_msgSend(v29, "length");
                if (v30)
                {
                  v31 = v30;
                  v32 = 0;
                  v33 = v30 - 1;
                  do
                  {
                    while (1)
                    {
                      v34 = objc_msgSend(v29, "characterAtIndex:", v32);
                      if (v32 >= v33 || v34 != 92)
                        break;
                      v32 += 2;
                      if (v32 >= v31)
                        goto LABEL_24;
                    }
                    v35 = objc_msgSend(v29, "characterAtIndex:", v32++);
                  }
                  while (v32 < v31);
                  v36 = v35;

                  if (v36 != 42)
                  {
                    v38 = 0;
                    goto LABEL_26;
                  }
                  objc_msgSend(v28, "original");
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  v38 = (unint64_t)objc_msgSend(v37, "length") > 1;
                }
                else
                {
LABEL_24:
                  v38 = 0;
                  v37 = v29;
                }

LABEL_26:
                v39 = (id)objc_msgSend(v28, "tokenize");
                if (v38
                  && (objc_msgSend(v28, "tokens"),
                      v40 = (void *)objc_claimAutoreleasedReturnValue(),
                      v41 = objc_msgSend(v40, "count"),
                      v40,
                      v41 >= 2))
                {
                  objc_msgSend(v28, "tokens");
                  v42 = (void *)objc_claimAutoreleasedReturnValue();
                  v43 = objc_msgSend(v42, "count") - 1;
                }
                else
                {
                  objc_msgSend(v28, "tokens");
                  v42 = (void *)objc_claimAutoreleasedReturnValue();
                  v43 = objc_msgSend(v42, "count");
                }

                if (v43 == 2)
                {
                  if (v38)
                    -[TopicalityAnonymousFeaturesForAttribute setCountAttributeBigramPrefixMatch:](v21, "setCountAttributeBigramPrefixMatch:", -[TopicalityAnonymousFeaturesForAttribute countAttributeBigramPrefixMatch](v21, "countAttributeBigramPrefixMatch")+ 1);
                  else
                    -[TopicalityAnonymousFeaturesForAttribute setCountAttributeBigramMatch:](v21, "setCountAttributeBigramMatch:", -[TopicalityAnonymousFeaturesForAttribute countAttributeBigramMatch](v21, "countAttributeBigramMatch")+ 1);
                }
                else if (v43 == 1)
                {
                  if (v38)
                  {
                    -[TopicalityAnonymousFeaturesForAttribute setCountAttributeUnigramPrefixMatch:](v21, "setCountAttributeUnigramPrefixMatch:", -[TopicalityAnonymousFeaturesForAttribute countAttributeUnigramPrefixMatch](v21, "countAttributeUnigramPrefixMatch")+ 1);
                    if (!v82)
                      continue;
                    objc_msgSend(v28, "original");
                    v44 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v28, "original");
                    v45 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v44, "substringToIndex:", objc_msgSend(v45, "length") - 1);
                    v46 = (void *)objc_claimAutoreleasedReturnValue();

                  }
                  else
                  {
                    -[TopicalityAnonymousFeaturesForAttribute setCountAttributeUnigramMatch:](v21, "setCountAttributeUnigramMatch:", -[TopicalityAnonymousFeaturesForAttribute countAttributeUnigramMatch](v21, "countAttributeUnigramMatch")+ 1);
                    if (!v82)
                      continue;
                    objc_msgSend(v28, "original");
                    v46 = (void *)objc_claimAutoreleasedReturnValue();
                  }
                  v47 = objc_msgSend(v82, "indexOfObject:", v46);
                  if (v47 != 0x7FFFFFFFFFFFFFFFLL)
                  {
                    v48 = v47;
                    if (objc_msgSend(v80, "count") > v47)
                    {
                      objc_msgSend(v80, "objectAtIndexedSubscript:", v48);
                      v49 = (void *)objc_claimAutoreleasedReturnValue();
                      v50 = objc_msgSend(v49, "isEqualToString:", CFSTR("ARG_UNSPECIFIED"));

                      if ((v50 & 1) == 0)
                      {
                        if (v38)
                          -[TopicalityAnonymousFeaturesForAttribute setCountAttributeQUPrefixMatch:](v21, "setCountAttributeQUPrefixMatch:", -[TopicalityAnonymousFeaturesForAttribute countAttributeQUPrefixMatch](v21, "countAttributeQUPrefixMatch")+ 1);
                        else
                          -[TopicalityAnonymousFeaturesForAttribute setCountAttributeQUTokenMatch:](v21, "setCountAttributeQUTokenMatch:", -[TopicalityAnonymousFeaturesForAttribute countAttributeQUTokenMatch](v21, "countAttributeQUTokenMatch")+ 1);
                      }
                    }
                  }

                }
                else if (v43 >= 3)
                {
                  if (v38)
                    -[TopicalityAnonymousFeaturesForAttribute setCountAttributeNgramPrefixMatch:](v21, "setCountAttributeNgramPrefixMatch:", -[TopicalityAnonymousFeaturesForAttribute countAttributeNgramPrefixMatch](v21, "countAttributeNgramPrefixMatch")+ 1);
                  else
                    -[TopicalityAnonymousFeaturesForAttribute setCountAttributeNgramMatch:](v21, "setCountAttributeNgramMatch:", -[TopicalityAnonymousFeaturesForAttribute countAttributeNgramMatch](v21, "countAttributeNgramMatch")+ 1);
                }
              }
              v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v92, 16);
            }
            while (v25);
          }

          self = v76;
          v8 = v77;
          v17 = v74;
          v14 = v75;
          v16 = v78;
          v18 = v79;
        }
        ++v18;
      }
      while (v18 != v16);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v88, v93, 16);
    }
    while (v16);
  }

  -[PRSL2FeatureVector setTextChunkTokenLength:](self->_L2FeatureVector, "setTextChunkTokenLength:", 0);
  SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x108uLL);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  if (v51)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PRSL2FeatureVector setTextChunkTokenLength:](self->_L2FeatureVector, "setTextChunkTokenLength:", objc_msgSend(v51, "integerValue"));
  }
  v83 = 0;
  LODWORD(v52) = 0;
  -[PRSL2FeatureVector setKMDMailRead:](self->_L2FeatureVector, "setKMDMailRead:", v52, v71);
  if (SSCompactRankingAttrsGetFloat((uint64_t)self->_attributes, 0x121uLL, &v83))
  {
    LODWORD(v53) = v83;
    -[PRSL2FeatureVector setKMDMailRead:](self->_L2FeatureVector, "setKMDMailRead:", v53);
  }
  LODWORD(v53) = 0;
  -[PRSL2FeatureVector setKMDMailRepliedTo:](self->_L2FeatureVector, "setKMDMailRepliedTo:", v53);
  if (SSCompactRankingAttrsGetFloat((uint64_t)self->_attributes, 0x122uLL, &v83))
  {
    LODWORD(v54) = v83;
    -[PRSL2FeatureVector setKMDMailRepliedTo:](self->_L2FeatureVector, "setKMDMailRepliedTo:", v54);
  }
  LODWORD(v54) = 0;
  -[PRSL2FeatureVector setKMDMailFlagged:](self->_L2FeatureVector, "setKMDMailFlagged:", v54);
  if (SSCompactRankingAttrsGetFloat((uint64_t)self->_attributes, 0x120uLL, &v83))
  {
    LODWORD(v55) = v83;
    -[PRSL2FeatureVector setKMDMailFlagged:](self->_L2FeatureVector, "setKMDMailFlagged:", v55);
  }
  SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x11DuLL);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRSL2FeatureVector setKMDMailReceivedDate:](self->_L2FeatureVector, "setKMDMailReceivedDate:", v56);

  SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x11EuLL);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRSL2FeatureVector setKMDMailLastViewedDate:](self->_L2FeatureVector, "setKMDMailLastViewedDate:", v57);

  -[PRSRankingItem mailFreshnessDate](self, "mailFreshnessDate");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRSL2FeatureVector setKMDMailFreshnessDate:](self->_L2FeatureVector, "setKMDMailFreshnessDate:", v58);

  SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x20uLL);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRSL2FeatureVector setKMDItemContentCreationDate:](self->_L2FeatureVector, "setKMDItemContentCreationDate:", v59);

  SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 9uLL);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRSL2FeatureVector setKMDItemLastUsedDate:](self->_L2FeatureVector, "setKMDItemLastUsedDate:", v60);

  SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x11CuLL);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRSL2FeatureVector setKMDItemApplicationLastLaunchedDate:](self->_L2FeatureVector, "setKMDItemApplicationLastLaunchedDate:", v61);

  SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x19uLL);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRSL2FeatureVector setKMDItemContentModificationDate:](self->_L2FeatureVector, "setKMDItemContentModificationDate:", v62);

  SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x1DuLL);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRSL2FeatureVector setKMDItemDueDate:](self->_L2FeatureVector, "setKMDItemDueDate:", v63);

  SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x1CuLL);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRSL2FeatureVector setKMDItemCompletionDate:](self->_L2FeatureVector, "setKMDItemCompletionDate:", v64);

  SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x24uLL);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRSL2FeatureVector setKMDItemExpirationDate:](self->_L2FeatureVector, "setKMDItemExpirationDate:", v65);

  SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x11uLL);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRSL2FeatureVector setKMDItemStartDate:](self->_L2FeatureVector, "setKMDItemStartDate:", v66);

  SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x12uLL);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRSL2FeatureVector setKMDItemEndDate:](self->_L2FeatureVector, "setKMDItemEndDate:", v67);

  SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRSL2FeatureVector setKMDItemContentType:](self->_L2FeatureVector, "setKMDItemContentType:", v68);

  SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x3CuLL);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRSL2FeatureVector setKMDItemUsedDates:](self->_L2FeatureVector, "setKMDItemUsedDates:", v69);

  SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x6FuLL);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRSL2FeatureVector setKMDItemRecentSpotlightEngagementDatesNonUnique:](self->_L2FeatureVector, "setKMDItemRecentSpotlightEngagementDatesNonUnique:", v70);

}

- (void)populateOtherFeatures:(PRSL2FeatureScoreInfo *)a3 withEvaluator:(id)a4 currentTime:(double)a5 quParsedEvaluator:(id)a6 queryID:(int64_t)a7
{
  id v12;
  id v13;
  NSString *v14;
  NSString *v15;
  void *v16;
  NSNumber *v17;
  NSNumber *retrievalType;
  float v19;
  float v20;
  void *v21;
  float embeddingSimilarity;
  uint64_t v23;
  double v24;
  float v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  float *var1;
  unint64_t var2;
  void *v35;
  float v36;
  float *v37;
  unint64_t v38;
  float v39;
  float *v40;
  unint64_t v41;
  float v42;
  float *v43;
  unint64_t v44;
  float v45;
  float *v46;
  unint64_t v47;
  float *v48;
  unint64_t v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  int v53;
  int v54;
  float *v55;
  unint64_t v56;
  float v57;
  unint64_t v58;
  float v59;
  float v60;
  float v61;
  float v62;
  float v63;
  unint64_t v64;
  float v65;
  float v66;
  float v67;
  unint64_t v68;
  float v69;
  float v70;
  float v71;
  float v72;
  float v73;
  float v74;
  float v75;
  unint64_t v76;
  float v77;
  float v78;
  unint64_t v79;
  float *v80;
  float v81;
  float *v82;
  unint64_t v83;
  unint64_t bundleIDType;
  float *v85;
  unint64_t v86;
  float *v87;
  unint64_t v88;
  float *v89;
  unint64_t v90;
  float *v91;
  unint64_t v92;
  float *v93;
  unint64_t v94;
  float *v95;
  unint64_t v96;
  float *v97;
  unint64_t v98;
  float *v99;
  unint64_t v100;
  float *v101;
  unint64_t v102;
  float *v103;
  unint64_t v104;
  float *v105;
  unint64_t v106;
  float *v107;
  unint64_t v108;
  float *v109;
  unint64_t v110;
  float *v111;
  unint64_t v112;
  float *v113;
  unint64_t v114;
  float *v115;
  unint64_t v116;
  float *v117;
  unint64_t v118;
  float *v119;
  unint64_t v120;
  float *v121;
  unint64_t v122;
  float *v123;
  unint64_t v124;
  float *v125;
  unint64_t v126;
  float *v127;
  unint64_t v128;
  float v129;
  float v130;
  void *v131;
  void *v132;
  double v133;
  _BOOL4 v134;
  double v135;
  _BOOL4 v136;
  double v137;
  _BOOL4 v138;
  int v139;
  float *v140;
  unint64_t v141;
  float *v142;
  unint64_t v143;
  unint64_t v144;
  float *v145;
  unint64_t v146;
  float *v147;
  unint64_t v148;
  float *v149;
  unint64_t v150;
  float *v151;
  unint64_t v152;
  float *v153;
  unint64_t v154;
  unint64_t v155;
  float *v156;
  unint64_t v157;
  float *v158;
  unint64_t v159;
  float *v160;
  unint64_t v161;
  unint64_t v162;
  float *v163;
  unint64_t v164;
  float *v165;
  unint64_t v166;
  float *v167;
  unint64_t v168;
  float *v169;
  unint64_t v170;
  float *v171;
  unint64_t v172;
  unint64_t v173;
  float *v174;
  unint64_t v175;
  void *v176;
  void *v177;
  double v178;
  double v179;
  double v180;
  double v181;
  double v182;
  double v183;
  double v184;
  double v185;
  double v186;
  double v187;
  float *v188;
  unint64_t v189;
  float *v190;
  unint64_t v191;
  float *v192;
  unint64_t v193;
  float *v194;
  unint64_t v195;
  float *v196;
  unint64_t v197;
  float *v198;
  unint64_t v199;
  float *v200;
  unint64_t v201;
  float *v202;
  unint64_t v203;
  float *v204;
  unint64_t v205;
  float *v206;
  unint64_t v207;
  float *v208;
  float *v209;
  unint64_t v210;
  float *v211;
  unint64_t v212;
  float *v213;
  unint64_t v214;
  float *v215;
  unint64_t v216;
  float *v217;
  unint64_t v218;
  float *v219;
  unint64_t v220;
  float *v221;
  unint64_t v222;
  float *v223;
  unint64_t v224;
  float *v225;
  unint64_t v226;
  float *v227;
  unint64_t v228;
  float *v229;
  unint64_t v230;
  float *v231;
  unint64_t v232;
  float *v233;
  unint64_t v234;
  float *v235;
  unint64_t v236;
  unint64_t v237;
  float *v238;
  unint64_t v239;
  float *v240;
  unint64_t v241;
  float *v242;
  unint64_t v243;
  unint64_t v244;
  float *v245;
  unint64_t v246;
  float v247;
  float *v248;
  unint64_t v249;
  float v250;
  float *v251;
  unint64_t v252;
  float v253;
  float *v254;
  unint64_t v255;
  float v256;
  float *v257;
  unint64_t v258;
  float v259;
  float *v260;
  unint64_t v261;
  float v262;
  float *v263;
  unint64_t v264;
  float v265;
  float *v266;
  unint64_t v267;
  float v268;
  float *v269;
  unint64_t v270;
  unint64_t v271;
  void *v272;
  void *v273;
  double v274;
  int v275;
  float *v276;
  unint64_t v277;
  unint64_t v278;
  unint64_t v279;
  float v280;
  _BOOL4 v281;
  PRSL2FeatureVector *L2FeatureVector;
  void *v283;
  void *v284;
  void *v285;
  uint64_t v286;
  uint64_t v287;
  uint64_t v288;
  float v289;
  float *v290;
  unint64_t v291;
  void *v292;
  void *v293;
  void *v294;
  double v295;
  unint64_t v296;
  float *v297;
  unint64_t v298;
  float v299;
  float v300;
  float *v301;
  unint64_t v302;
  float v303;
  float *v304;
  unint64_t v305;
  float v306;
  float *v307;
  unint64_t v308;
  float v309;
  float *v310;
  unint64_t v311;
  float v312;
  float *v313;
  unint64_t v314;
  float v315;
  float *v316;
  unint64_t v317;
  float v318;
  float *v319;
  unint64_t v320;
  float v321;
  float *v322;
  unint64_t v323;
  float v324;
  float *v325;
  unint64_t v326;
  float v327;
  float *v328;
  unint64_t v329;
  float v330;
  float *v331;
  unint64_t v332;
  float v333;
  float *v334;
  unint64_t v335;
  float v336;
  float *v337;
  unint64_t v338;
  float v339;
  float *v340;
  unint64_t v341;
  float *v342;
  unint64_t v343;
  double Current;
  double v345;
  float v346;
  float v347;
  double v348;
  float v349;
  float v350;
  float *v351;
  unint64_t v352;
  float *v353;
  unint64_t v354;
  NSObject *v355;
  float v356;
  float *v357;
  unint64_t v358;
  float v359;
  float *v360;
  unint64_t v361;
  id v362;
  void *v363;
  int64_t v364;
  float v365;
  double v366;
  float v367;
  double v368;
  float v369;
  double v370;
  float v371;
  double v372;
  uint64_t v373;
  float *v374;
  unint64_t v375;
  uint64_t v376;
  float v377;
  uint64_t v378;
  float v379;
  float v380;
  NSString *v381;
  id v382;
  float v383;
  void *v384;
  float v385;
  float v386;
  void *v387;
  float v388;
  uint64_t v389;
  uint64_t v390;
  uint64_t v391;
  _BYTE buf[22];
  __int16 v393;
  void *v394;
  __int16 v395;
  NSString *v396;
  __int16 v397;
  uint64_t v398;
  __int16 v399;
  int64_t v400;
  __int16 v401;
  double v402;
  __int16 v403;
  double v404;
  __int16 v405;
  double v406;
  __int16 v407;
  double v408;
  __int16 v409;
  double v410;
  __int16 v411;
  uint64_t v412;
  _QWORD v413[10];

  v413[7] = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v13 = a6;
  v14 = self->_sectionBundleIdentifier;
  v381 = v14;
  v382 = v13;
  if (v14)
  {
    v15 = v14;
  }
  else
  {
    SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0xAuLL);
    v15 = (NSString *)(id)objc_claimAutoreleasedReturnValue();

  }
  -[PRSL2FeatureVector setBundleId:](self->_L2FeatureVector, "setBundleId:", v15);
  +[PRSL2FeatureVector allowedAttributeSetForAnonPipeline](PRSL2FeatureVector, "allowedAttributeSetForAnonPipeline");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRSRankingItem populateAnonymousLogFeaturesWithEvaluator:currentTime:allowedAttributeSet:](self, "populateAnonymousLogFeaturesWithEvaluator:currentTime:allowedAttributeSet:", v12, v16, a5);

  if (!self->_retrievalType)
  {
    SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x69uLL);
    v17 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    retrievalType = self->_retrievalType;
    self->_retrievalType = v17;

  }
  self->_itemSparseMatchStrengthType = -[PRSRankingItem itemSparseMatchStrengthTypeWithEvaluator:](self, "itemSparseMatchStrengthTypeWithEvaluator:", v12);
  -[PRSRankingItem computeCalibratedSparseScore](self, "computeCalibratedSparseScore");
  self->_pommesCalibratedL1Score = v19;
  v20 = 0.0;
  if ((-[NSNumber integerValue](self->_retrievalType, "integerValue") & 2) != 0)
  {
    SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x68uLL);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = sqDistancesToCosine(v21);
    self->_embeddingSimilarity = v20;
    if ((SSSectionIsSyndicatedPhotos(self->_sectionBundleIdentifier) & 1) == 0)
    {
      embeddingSimilarity = self->_embeddingSimilarity;
      v23 = objc_msgSend(v12, "queryTokenCount");
      *(float *)&v24 = embeddingSimilarity;
      -[PRSRankingItem calibrateSemanticScore:queryTokenCount:queryID:](self, "calibrateSemanticScore:queryTokenCount:queryID:", v23, a7, v24);
      self->_embeddingSimilarity = v25;
    }

  }
  if (self->_isInternal)
  {
    SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0xAuLL);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v26)
      goto LABEL_27;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      getpid();
      SimulateCrash();
    }
    if (-[NSString isEqualToString:](self->_sectionBundleIdentifier, "isEqualToString:", v26))
      goto LABEL_27;
    v413[0] = CFSTR("com.apple.CloudDocs.MobileDocumentsFileProvider");
    v413[1] = CFSTR("com.apple.FileProvider.LocalStorage");
    v413[2] = CFSTR("com.apple.DocumentsApp");
    v413[3] = CFSTR("com.apple.searchd.syndicatedLinks");
    v413[4] = CFSTR("com.apple.shortcuts");
    v413[5] = CFSTR("com.apple.MobileSMS");
    v413[6] = CFSTR("com.apple.mobilemail");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v413, 7);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v27, "containsObject:", self->_sectionBundleIdentifier) & 1) != 0)
      goto LABEL_26;
    if ((SSSectionIsSyndicatedPhotos(self->_sectionBundleIdentifier) & 1) != 0)
    {
      if ((objc_msgSend(v26, "isEqualToString:", CFSTR("com.apple.MobileSMS")) & 1) != 0
        || (objc_msgSend(v26, "isEqualToString:", CFSTR("com.apple.mobilenotes")) & 1) != 0
        || (objc_msgSend(v26, "isEqualToString:", CFSTR("com.apple.DocumentsApp")) & 1) != 0
        || (objc_msgSend(v26, "isEqualToString:", CFSTR("com.apple.FileProvider.LocalStorage")) & 1) != 0
        || (objc_msgSend(v26, "isEqualToString:", CFSTR("com.apple.CloudDocs.MobileDocumentsFileProvider")) & 1) != 0)
      {
        goto LABEL_26;
      }
      v28 = objc_msgSend(v26, "isEqualToString:", CFSTR("com.apple.mobileslideshow"));

      if ((v28 & 1) != 0)
        goto LABEL_27;
    }
    else
    {

    }
    getpid();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("section bundle not equal to compact value %@ and %@"), self->_sectionBundleIdentifier, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    SimulateCrash();
LABEL_26:

LABEL_27:
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && !-[NSString isEqualToString:](v15, "isEqualToString:", CFSTR("com.apple.application")))
  {
    SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0xBuLL);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0xEuLL);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v31;
    if (v29 && v30 && (objc_msgSend(v31, "hasPrefix:", CFSTR("com.apple.siri.")) & 1) == 0)
    {
      a3->var0[a3->var2] = 325;
      var1 = a3->var1;
      var2 = a3->var2;
      a3->var2 = var2 + 1;
      var1[var2] = 1.0;
      SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x43uLL);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if (v35)
      {
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = 0;
        -[PRSRankingItem inferDateBinsFromDates:intoBins:](self, "inferDateBinsFromDates:intoBins:", v35, buf);
        v36 = (float)*(int *)buf;
        a3->var0[a3->var2] = 71;
        v37 = a3->var1;
        v38 = a3->var2;
        a3->var2 = v38 + 1;
        v37[v38] = v36;
        v39 = (float)*(int *)&buf[4];
        a3->var0[v38 + 1] = 70;
        v40 = a3->var1;
        v41 = a3->var2;
        a3->var2 = v41 + 1;
        v40[v41] = v39;
        v42 = (float)*(int *)&buf[8];
        a3->var0[v41 + 1] = 69;
        v43 = a3->var1;
        v44 = a3->var2;
        a3->var2 = v44 + 1;
        v43[v44] = v42;
        v45 = (float)*(int *)&buf[12];
        a3->var0[v44 + 1] = 68;
        v46 = a3->var1;
        v47 = a3->var2;
        a3->var2 = v47 + 1;
        v46[v47] = v45;
      }

    }
  }
  v379 = v20;
  a3->var0[a3->var2] = 372;
  v48 = a3->var1;
  v49 = a3->var2;
  v50 = v49 + 1;
  a3->var2 = v49 + 1;
  v48[v49] = 0.0;
  v51 = *(_QWORD *)self->_inputToModelScore;
  v52 = *(_QWORD *)&self->_inputToModelScore[8];
  v53 = 0;
  v54 = 0;
  a3->var0[v50] = 391;
  v55 = a3->var1;
  v56 = a3->var2;
  v57 = 0.0;
  v58 = v56 + 1;
  a3->var2 = v56 + 1;
  v59 = 0.0;
  v60 = 0.0;
  v385 = 0.0;
  v55[v56] = (float)*(unsigned __int128 *)&v51;
  v61 = 0.0;
  v62 = 0.0;
  v63 = 0.0;
  v64 = *(_QWORD *)&self->_indexScore[8];
  v65 = 0.0;
  v66 = 0.0;
  v67 = 0.0;
  v68 = *(_QWORD *)self->_indexScore;
  v69 = 0.0;
  v70 = 0.0;
  v71 = 0.0;
  v386 = 0.0;
  v383 = 0.0;
  v72 = 0.0;
  v73 = 0.0;
  v74 = 0.0;
  v75 = 0.0;
  do
  {
    if ((v53 - 89) >= 6)
    {
      if ((v53 & 0x40) != 0)
        v76 = v64 >> v53;
      else
        v76 = ((2 * v64) << ~(_BYTE)v53) | (v68 >> v53);
      if ((v76 & 1) != 0)
        v77 = 1.0;
      else
        v77 = 0.0;
      if (v53 <= 73)
      {
        v78 = v77;
        switch(v53)
        {
          case ' ':
            break;
          case '"':
            v78 = v72;
            v383 = v77;
            break;
          case '#':
            v75 = v77;
            goto LABEL_58;
          case '$':
            v78 = v72;
            v386 = v77;
            break;
          case '%':
            v74 = v77;
            goto LABEL_58;
          case '&':
            v78 = v72;
            v71 = v77;
            break;
          case '\'':
            v73 = v77;
            goto LABEL_58;
          case '/':
            v78 = v72;
            v385 = v77;
            break;
          default:
LABEL_58:
            v78 = v72;
            break;
        }
      }
      else
      {
        switch(v53)
        {
          case 'J':
            v78 = v72;
            v70 = v77;
            break;
          case 'K':
          case 'L':
          case 'M':
          case 'N':
          case 'O':
          case 'P':
            goto LABEL_58;
          case 'Q':
            v78 = v72;
            v69 = v77;
            break;
          case 'R':
            v78 = v72;
            v67 = v77;
            break;
          case 'S':
            v78 = v72;
            v66 = v77;
            break;
          case 'T':
            v78 = v72;
            v65 = v77;
            break;
          case 'U':
            v78 = v72;
            v63 = v77;
            break;
          case 'V':
            v78 = v72;
            v62 = v77;
            break;
          case 'W':
            v78 = v72;
            v61 = v77;
            break;
          case 'X':
            v78 = v72;
            v60 = v77;
            break;
          default:
            if (v53 == 104)
            {
              v78 = v72;
              v59 = v77;
            }
            else
            {
              if (v53 != 114)
                goto LABEL_58;
              v78 = v72;
              v57 = v77;
            }
            break;
        }
      }
      a3->var0[v58] = sRankingBitsFeatures[v54];
      v80 = a3->var1;
      v79 = a3->var2;
      v58 = v79 + 1;
      a3->var2 = v79 + 1;
      v80[v79] = v77;
      ++v54;
      v72 = v78;
    }
    ++v53;
  }
  while (v53 != 123);
  v380 = v57;
  v81 = 1.0;
  if ((v64 & 0x800000000000000) == 0)
    v81 = 0.0;
  a3->var0[v58] = 2392;
  v82 = a3->var1;
  v83 = a3->var2;
  a3->var2 = v83 + 1;
  v82[v83] = v81;
  bundleIDType = self->_bundleIDType;
  if ((bundleIDType & 0x10) != 0)
  {
    a3->var0[v83 + 1] = 6;
    v85 = a3->var1;
    v86 = a3->var2;
    a3->var2 = v86 + 1;
    v85[v86] = 0.0;
    a3->var0[v86 + 1] = 8;
    v87 = a3->var1;
    v88 = a3->var2;
    a3->var2 = v88 + 1;
    v87[v88] = 0.0;
    a3->var0[v88 + 1] = 10;
    v89 = a3->var1;
    v90 = a3->var2;
    a3->var2 = v90 + 1;
    v89[v90] = 0.0;
    a3->var0[v90 + 1] = 2338;
    v91 = a3->var1;
    v92 = a3->var2;
    a3->var2 = v92 + 1;
    v91[v92] = v73;
    a3->var0[v92 + 1] = 2339;
    v93 = a3->var1;
    v94 = a3->var2;
    a3->var2 = v94 + 1;
    v93[v94] = v74;
    a3->var0[v94 + 1] = 2340;
    v95 = a3->var1;
    v96 = a3->var2;
    a3->var2 = v96 + 1;
    v95[v96] = v75;
    a3->var0[v96 + 1] = 1972;
    v97 = a3->var1;
    v98 = a3->var2;
    a3->var2 = v98 + 1;
    v97[v98] = 0.0;
    a3->var0[v98 + 1] = 1973;
    v99 = a3->var1;
    v100 = a3->var2;
    a3->var2 = v100 + 1;
    v99[v100] = 0.0;
    a3->var0[v100 + 1] = 1974;
    v101 = a3->var1;
    v102 = a3->var2;
    a3->var2 = v102 + 1;
    v101[v102] = 0.0;
    a3->var0[v102 + 1] = 1975;
    v103 = a3->var1;
    v104 = a3->var2;
    a3->var2 = v104 + 1;
    v103[v104] = 0.0;
    a3->var0[v104 + 1] = 1976;
    v105 = a3->var1;
    v106 = a3->var2;
    a3->var2 = v106 + 1;
    v105[v106] = 0.0;
    a3->var0[v106 + 1] = 1977;
    v107 = a3->var1;
    v108 = a3->var2;
    a3->var2 = v108 + 1;
    v107[v108] = 0.0;
    a3->var0[v108 + 1] = 1978;
    v109 = a3->var1;
    v110 = a3->var2;
    a3->var2 = v110 + 1;
    v109[v110] = 0.0;
    a3->var0[v110 + 1] = 1979;
    v111 = a3->var1;
    v112 = a3->var2;
    a3->var2 = v112 + 1;
    v111[v112] = 0.0;
    a3->var0[v112 + 1] = 2346;
    v113 = a3->var1;
    v114 = a3->var2;
    a3->var2 = v114 + 1;
    v113[v114] = v69;
    a3->var0[v114 + 1] = 2347;
    v115 = a3->var1;
    v116 = a3->var2;
    a3->var2 = v116 + 1;
    v115[v116] = v67;
    a3->var0[v116 + 1] = 2348;
    v117 = a3->var1;
    v118 = a3->var2;
    a3->var2 = v118 + 1;
    v117[v118] = v66;
    a3->var0[v118 + 1] = 2349;
    v119 = a3->var1;
    v120 = a3->var2;
    a3->var2 = v120 + 1;
    v119[v120] = v65;
    a3->var0[v120 + 1] = 2350;
    v121 = a3->var1;
    v122 = a3->var2;
    a3->var2 = v122 + 1;
    v121[v122] = v63;
    a3->var0[v122 + 1] = 2351;
    v123 = a3->var1;
    v124 = a3->var2;
    a3->var2 = v124 + 1;
    v123[v124] = v62;
    a3->var0[v124 + 1] = 2352;
    v125 = a3->var1;
    v126 = a3->var2;
    a3->var2 = v126 + 1;
    v125[v126] = v61;
    a3->var0[v126 + 1] = 2353;
    v127 = a3->var1;
    v128 = a3->var2;
    a3->var2 = v128 + 1;
    v127[v128] = v60;
    bundleIDType = self->_bundleIDType;
  }
  v129 = v71;
  v130 = v70;
  if ((bundleIDType & 2) != 0)
  {
    SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x19uLL);
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    v132 = v131;
    if (v131)
    {
      objc_msgSend(v131, "timeIntervalSinceReferenceDate");
      v134 = v133 - a5 > -604800.0;
      objc_msgSend(v132, "timeIntervalSinceReferenceDate");
      v136 = v135 - a5 > -2678400.0;
      objc_msgSend(v132, "timeIntervalSinceReferenceDate");
      v138 = v137 - a5 > -31536000.0;
    }
    else
    {
      v134 = 0;
      v136 = 0;
      v138 = 0;
    }
    if (v130 == 0.0 && v129 == 0.0 && v72 == 0.0 && !v134)
    {
      v139 = v386 != 0.0 || v136;
      if (v139 != 1)
      {
        if (v383 != 0.0)
          v138 = 1;
        if (!v138)
          goto LABEL_91;
        a3->var0[a3->var2] = 6;
        v225 = a3->var1;
        v226 = a3->var2;
        v155 = v226 + 1;
        a3->var2 = v226 + 1;
        v225[v226] = 1.0;
LABEL_90:
        a3->var0[v155] = 2340;
        v156 = a3->var1;
        v157 = a3->var2;
        a3->var2 = v157 + 1;
        v156[v157] = v75;
LABEL_91:

        v70 = v130;
        v71 = v129;
        bundleIDType = self->_bundleIDType;
        goto LABEL_92;
      }
      a3->var0[a3->var2] = 8;
      v140 = a3->var1;
      v141 = a3->var2;
      a3->var2 = v141 + 1;
      v140[v141] = 1.0;
      a3->var0[v141 + 1] = 6;
      v142 = a3->var1;
      v143 = a3->var2;
      v144 = v143 + 1;
      a3->var2 = v143 + 1;
      v142[v143] = 1.0;
    }
    else
    {
      a3->var0[a3->var2] = 10;
      v145 = a3->var1;
      v146 = a3->var2;
      a3->var2 = v146 + 1;
      v145[v146] = 1.0;
      a3->var0[v146 + 1] = 8;
      v147 = a3->var1;
      v148 = a3->var2;
      a3->var2 = v148 + 1;
      v147[v148] = 1.0;
      a3->var0[v148 + 1] = 6;
      v149 = a3->var1;
      v150 = a3->var2;
      a3->var2 = v150 + 1;
      v149[v150] = 1.0;
      a3->var0[v150 + 1] = 2338;
      v151 = a3->var1;
      v152 = a3->var2;
      v144 = v152 + 1;
      a3->var2 = v152 + 1;
      v151[v152] = v73;
    }
    a3->var0[v144] = 2339;
    v153 = a3->var1;
    v154 = a3->var2;
    v155 = v154 + 1;
    a3->var2 = v154 + 1;
    v153[v154] = v74;
    goto LABEL_90;
  }
LABEL_92:
  if ((bundleIDType & 4) == 0)
    goto LABEL_101;
  if (v70 != 0.0 || v71 != 0.0 || v72 != 0.0)
  {
    a3->var0[a3->var2] = 10;
    v163 = a3->var1;
    v164 = a3->var2;
    a3->var2 = v164 + 1;
    v163[v164] = 1.0;
    a3->var0[v164 + 1] = 8;
    v165 = a3->var1;
    v166 = a3->var2;
    a3->var2 = v166 + 1;
    v165[v166] = 1.0;
    a3->var0[v166 + 1] = 6;
    v167 = a3->var1;
    v168 = a3->var2;
    a3->var2 = v168 + 1;
    v167[v168] = 1.0;
    a3->var0[v168 + 1] = 2338;
    v169 = a3->var1;
    v170 = a3->var2;
    v162 = v170 + 1;
    a3->var2 = v170 + 1;
    v169[v170] = v73;
    goto LABEL_99;
  }
  if (v386 != 0.0)
  {
    a3->var0[a3->var2] = 8;
    v158 = a3->var1;
    v159 = a3->var2;
    a3->var2 = v159 + 1;
    v158[v159] = 1.0;
    a3->var0[v159 + 1] = 6;
    v160 = a3->var1;
    v161 = a3->var2;
    v162 = v161 + 1;
    a3->var2 = v161 + 1;
    v160[v161] = 1.0;
LABEL_99:
    a3->var0[v162] = 2339;
    v171 = a3->var1;
    v172 = a3->var2;
    v173 = v172 + 1;
    a3->var2 = v172 + 1;
    v171[v172] = v74;
LABEL_100:
    a3->var0[v173] = 2340;
    v174 = a3->var1;
    v175 = a3->var2;
    a3->var2 = v175 + 1;
    v174[v175] = v75;
    goto LABEL_101;
  }
  if (v383 != 0.0)
  {
    a3->var0[a3->var2] = 6;
    v227 = a3->var1;
    v228 = a3->var2;
    v173 = v228 + 1;
    a3->var2 = v228 + 1;
    v227[v228] = 1.0;
    goto LABEL_100;
  }
LABEL_101:
  if ((self->_bundleIDType & 0x200000000) == 0)
    goto LABEL_122;
  SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x136uLL);
  v176 = (void *)objc_claimAutoreleasedReturnValue();
  v177 = v176;
  if (v176)
  {
    v377 = v59;
    objc_msgSend(v176, "timeIntervalSinceReferenceDate");
    v178 = a5;
    v180 = v179 - a5;
    objc_msgSend(v177, "timeIntervalSinceReferenceDate");
    v182 = v181;
    objc_msgSend(v177, "timeIntervalSinceReferenceDate");
    v184 = v183;
    objc_msgSend(v177, "timeIntervalSinceReferenceDate");
    v186 = v185;
    objc_msgSend(v177, "timeIntervalSinceReferenceDate");
    if (v180 > -86400.0)
    {
      a3->var0[a3->var2] = 1874;
      v188 = a3->var1;
      v189 = a3->var2;
      a3->var2 = v189 + 1;
      v188[v189] = 1.0;
      a3->var0[v189 + 1] = 9;
      v190 = a3->var1;
      v191 = a3->var2;
      a3->var2 = v191 + 1;
      v190[v191] = 1.0;
      a3->var0[v191 + 1] = 3;
      v192 = a3->var1;
      v193 = a3->var2;
      a3->var2 = v193 + 1;
      v192[v193] = 1.0;
      a3->var0[v193 + 1] = 7;
      v194 = a3->var1;
      v195 = a3->var2;
      a3->var2 = v195 + 1;
      v194[v195] = 1.0;
      a3->var0[v195 + 1] = 5;
      v196 = a3->var1;
      v197 = a3->var2;
      a3->var2 = v197 + 1;
      v196[v197] = 1.0;
      a3->var0[v197 + 1] = 2341;
      v198 = a3->var1;
      v199 = a3->var2;
      a3->var2 = v199 + 1;
      v198[v199] = v130;
      a3->var0[v199 + 1] = 2342;
      v200 = a3->var1;
      v201 = a3->var2;
      a3->var2 = v201 + 1;
      v200[v201] = v129;
      a3->var0[v201 + 1] = 2343;
      v202 = a3->var1;
      v203 = a3->var2;
      a3->var2 = v203 + 1;
      v202[v203] = v72;
      a3->var0[v203 + 1] = 2344;
      v204 = a3->var1;
      v205 = a3->var2;
      a3->var2 = v205 + 1;
      v204[v205] = v386;
      a3->var0[v205 + 1] = 2345;
      v206 = a3->var1;
      v207 = a3->var2;
      a3->var2 = v207 + 1;
      v208 = &v206[v207];
      a5 = v178;
LABEL_107:
      v59 = v377;
LABEL_120:
      *v208 = v383;
      goto LABEL_121;
    }
    a5 = v178;
    if (v182 - v178 > -604800.0)
    {
      a3->var0[a3->var2] = 9;
      v209 = a3->var1;
      v210 = a3->var2;
      a3->var2 = v210 + 1;
      v209[v210] = 1.0;
      a3->var0[v210 + 1] = 3;
      v211 = a3->var1;
      v212 = a3->var2;
      a3->var2 = v212 + 1;
      v211[v212] = 1.0;
      a3->var0[v212 + 1] = 7;
      v213 = a3->var1;
      v214 = a3->var2;
      a3->var2 = v214 + 1;
      v213[v214] = 1.0;
      a3->var0[v214 + 1] = 5;
      v215 = a3->var1;
      v216 = a3->var2;
      a3->var2 = v216 + 1;
      v215[v216] = 1.0;
      a3->var0[v216 + 1] = 2342;
      v217 = a3->var1;
      v218 = a3->var2;
      a3->var2 = v218 + 1;
      v217[v218] = v129;
      a3->var0[v218 + 1] = 2343;
      v219 = a3->var1;
      v220 = a3->var2;
      a3->var2 = v220 + 1;
      v219[v220] = v72;
      a3->var0[v220 + 1] = 2344;
      v221 = a3->var1;
      v222 = a3->var2;
      a3->var2 = v222 + 1;
      v221[v222] = v386;
      a3->var0[v222 + 1] = 2345;
      v223 = a3->var1;
      v224 = a3->var2;
      a3->var2 = v224 + 1;
      v208 = &v223[v224];
      goto LABEL_107;
    }
    v59 = v377;
    if (v184 - a5 <= -1296000.0)
    {
      if (v186 - a5 <= -2678400.0)
      {
        if (v187 - a5 <= -31536000.0)
          goto LABEL_121;
        a3->var0[a3->var2] = 5;
        v374 = a3->var1;
        v375 = a3->var2;
        v244 = v375 + 1;
        a3->var2 = v375 + 1;
        v374[v375] = 1.0;
        goto LABEL_119;
      }
      a3->var0[a3->var2] = 7;
      v238 = a3->var1;
      v239 = a3->var2;
      a3->var2 = v239 + 1;
      v238[v239] = 1.0;
      a3->var0[v239 + 1] = 5;
      v240 = a3->var1;
      v241 = a3->var2;
      v237 = v241 + 1;
      a3->var2 = v241 + 1;
      v240[v241] = 1.0;
    }
    else
    {
      a3->var0[a3->var2] = 3;
      v229 = a3->var1;
      v230 = a3->var2;
      a3->var2 = v230 + 1;
      v229[v230] = 1.0;
      a3->var0[v230 + 1] = 7;
      v231 = a3->var1;
      v232 = a3->var2;
      a3->var2 = v232 + 1;
      v231[v232] = 1.0;
      a3->var0[v232 + 1] = 5;
      v233 = a3->var1;
      v234 = a3->var2;
      a3->var2 = v234 + 1;
      v233[v234] = 1.0;
      a3->var0[v234 + 1] = 2343;
      v235 = a3->var1;
      v236 = a3->var2;
      v237 = v236 + 1;
      a3->var2 = v236 + 1;
      v235[v236] = v72;
    }
    a3->var0[v237] = 2344;
    v242 = a3->var1;
    v243 = a3->var2;
    v244 = v243 + 1;
    a3->var2 = v243 + 1;
    v242[v243] = v386;
LABEL_119:
    a3->var0[v244] = 2345;
    v245 = a3->var1;
    v246 = a3->var2;
    a3->var2 = v246 + 1;
    v208 = &v245[v246];
    goto LABEL_120;
  }
LABEL_121:

LABEL_122:
  v390 = 0;
  v391 = 0;
  v389 = 0;
  if (SSCompactRankingAttrsGetFloat((uint64_t)self->_attributes, 0x75uLL, (_DWORD *)&v391 + 1))
  {
    v247 = *((float *)&v391 + 1);
    a3->var0[a3->var2] = 1881;
    v248 = a3->var1;
    v249 = a3->var2;
    a3->var2 = v249 + 1;
    v248[v249] = v247;
  }
  if (SSCompactRankingAttrsGetFloat((uint64_t)self->_attributes, 0x10uLL, &v391))
  {
    v250 = *(float *)&v391;
    a3->var0[a3->var2] = 1882;
    v251 = a3->var1;
    v252 = a3->var2;
    a3->var2 = v252 + 1;
    v251[v252] = v250;
  }
  if (SSCompactRankingAttrsGetFloat((uint64_t)self->_attributes, 0x116uLL, (_DWORD *)&v390 + 1))
  {
    v253 = *((float *)&v390 + 1);
    a3->var0[a3->var2] = 1883;
    v254 = a3->var1;
    v255 = a3->var2;
    a3->var2 = v255 + 1;
    v254[v255] = v253;
  }
  if (SSCompactRankingAttrsGetFloat((uint64_t)self->_attributes, 0x118uLL, &v390))
  {
    v256 = *(float *)&v390;
    a3->var0[a3->var2] = 1884;
    v257 = a3->var1;
    v258 = a3->var2;
    a3->var2 = v258 + 1;
    v257[v258] = v256;
  }
  if (SSCompactRankingAttrsGetFloat((uint64_t)self->_attributes, 0x117uLL, &v390))
  {
    v259 = *(float *)&v390;
    a3->var0[a3->var2] = 1885;
    v260 = a3->var1;
    v261 = a3->var2;
    a3->var2 = v261 + 1;
    v260[v261] = v259;
  }
  if (SSCompactRankingAttrsGetFloat((uint64_t)self->_attributes, 0x119uLL, &v390))
  {
    v262 = *(float *)&v390;
    a3->var0[a3->var2] = 1886;
    v263 = a3->var1;
    v264 = a3->var2;
    a3->var2 = v264 + 1;
    v263[v264] = v262;
  }
  if (SSCompactRankingAttrsGetFloat((uint64_t)self->_attributes, 0x11AuLL, (_DWORD *)&v389 + 1))
  {
    v265 = *((float *)&v389 + 1);
    a3->var0[a3->var2] = 1887;
    v266 = a3->var1;
    v267 = a3->var2;
    a3->var2 = v267 + 1;
    v266[v267] = v265;
  }
  if (SSCompactRankingAttrsGetFloat((uint64_t)self->_attributes, 0x11BuLL, &v389))
  {
    v268 = *(float *)&v389;
    a3->var0[a3->var2] = 1926;
    v269 = a3->var1;
    v270 = a3->var2;
    a3->var2 = v270 + 1;
    v269[v270] = v268;
  }
  v271 = self->_bundleIDType;
  if ((v271 & 4) != 0)
  {
    +[PRSRankingItemRanker phoneFavoritesCopy](PRSRankingItemRanker, "phoneFavoritesCopy");
    v272 = (void *)objc_claimAutoreleasedReturnValue();
    SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 2uLL);
    v273 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v274) = 0;
    if (v273)
    {
      if (v272)
      {
        v275 = objc_msgSend(v272, "containsObject:", v273, v274);
        LODWORD(v274) = 0;
        if (v275)
          *(float *)&v274 = 1.0;
      }
    }
    a3->var0[a3->var2] = 1877;
    v276 = a3->var1;
    v277 = a3->var2;
    a3->var2 = v277 + 1;
    v276[v277] = *(float *)&v274;

    v271 = self->_bundleIDType;
  }
  a3->var0[a3->var2] = 1982;
  v278 = a3->var2;
  v279 = v271 & 0x4000;
  v280 = 1.0;
  if (!v279)
    v280 = 0.0;
  a3->var1[v278] = v280;
  a3->var2 = v278 + 1;
  self->_isNonProgrammedSiriAction = v279 >> 14;
  v281 = -[NSString hasPrefix:](self->_identifier, "hasPrefix:", CFSTR("com.apple.siri.interaction."));
  L2FeatureVector = self->_L2FeatureVector;
  if (v281)
  {
    -[PRSL2FeatureVector setIsSiriAction:](L2FeatureVector, "setIsSiriAction:", 1);
    self->_shouldHideUnderShowMore = 1;
    *(_WORD *)&self->_recentForTopHit = 0;
  }
  else
  {
    -[PRSL2FeatureVector setIsSiriAction:](L2FeatureVector, "setIsSiriAction:", 0);
  }
  SSCompactRankingAttrsGetValue((int8x8_t *)-[PRSRankingItem attributes](self, "attributes"), 0x3AuLL);
  v283 = (void *)objc_claimAutoreleasedReturnValue();
  if (v283)
  {
    objc_msgSend(v12, "queryString");
    v284 = (void *)objc_claimAutoreleasedReturnValue();

    if (v284)
    {
      objc_msgSend(v12, "queryString");
      v285 = (void *)objc_claimAutoreleasedReturnValue();
      v286 = objc_msgSend(v283, "rangeOfString:options:", v285, 393);
      v288 = v287;

      if (v288 == objc_msgSend(v283, "length") && !v286)
        -[PRSRankingItem setHasShortCut:](self, "setHasShortCut:", 1);
    }
  }
  v388 = 0.0;
  if (SSCompactRankingAttrsGetFloat((uint64_t)self->_attributes, 0x138uLL, &v388))
  {
    v289 = v388;
    a3->var0[a3->var2] = 2395;
    v290 = a3->var1;
    v291 = a3->var2;
    a3->var2 = v291 + 1;
    v290[v291] = v289;
  }
  -[PRSRankingItem interestingDate](self, "interestingDate");
  v292 = (void *)objc_claimAutoreleasedReturnValue();
  v293 = v292;
  v294 = v382;
  if (v292)
  {
    objc_msgSend(v292, "timeIntervalSinceReferenceDate");
    v296 = (uint64_t)((v295 - a5) / 60.0);
    a3->var0[a3->var2] = 2396;
    v297 = a3->var1;
    v298 = a3->var2;
    a3->var2 = v298 + 1;
    v297[v298] = (float)(uint64_t)v296;
    if ((v296 & 0x8000000000000000) != 0)
      v296 = -(uint64_t)v296;
    v299 = 0.0;
    if (v296 >= 0x5A1)
      v300 = 0.0;
    else
      v300 = 1.0;
    a3->var0[v298 + 1] = 3100;
    v301 = a3->var1;
    v302 = a3->var2;
    a3->var2 = v302 + 1;
    v301[v302] = v300;
    if (v296 >= 0x10E1)
      v303 = 0.0;
    else
      v303 = 1.0;
    a3->var0[v302 + 1] = 3099;
    v304 = a3->var1;
    v305 = a3->var2;
    a3->var2 = v305 + 1;
    v304[v305] = v303;
    if (v296 >= 0x2761)
      v306 = 0.0;
    else
      v306 = 1.0;
    a3->var0[v305 + 1] = 3098;
    v307 = a3->var1;
    v308 = a3->var2;
    a3->var2 = v308 + 1;
    v307[v308] = v306;
    if (v296 >= 0x5461)
      v309 = 0.0;
    else
      v309 = 1.0;
    a3->var0[v308 + 1] = 3097;
    v310 = a3->var1;
    v311 = a3->var2;
    a3->var2 = v311 + 1;
    v310[v311] = v309;
    if (v296 >= 0xA8C1)
      v312 = 0.0;
    else
      v312 = 1.0;
    a3->var0[v311 + 1] = 3096;
    v313 = a3->var1;
    v314 = a3->var2;
    a3->var2 = v314 + 1;
    v313[v314] = v312;
    if (v296 >= 0x15181)
      v315 = 0.0;
    else
      v315 = 1.0;
    a3->var0[v314 + 1] = 3095;
    v316 = a3->var1;
    v317 = a3->var2;
    a3->var2 = v317 + 1;
    v316[v317] = v315;
    if (v296 >= 0x1FA41)
      v318 = 0.0;
    else
      v318 = 1.0;
    a3->var0[v317 + 1] = 3094;
    v319 = a3->var1;
    v320 = a3->var2;
    a3->var2 = v320 + 1;
    v319[v320] = v318;
    if (v296 >= 0x2A301)
      v321 = 0.0;
    else
      v321 = 1.0;
    a3->var0[v320 + 1] = 3093;
    v322 = a3->var1;
    v323 = a3->var2;
    a3->var2 = v323 + 1;
    v322[v323] = v321;
    if (v296 >= 0x3F481)
      v324 = 0.0;
    else
      v324 = 1.0;
    a3->var0[v323 + 1] = 3092;
    v325 = a3->var1;
    v326 = a3->var2;
    a3->var2 = v326 + 1;
    v325[v326] = v324;
    if (v296 >= 0x54601)
      v327 = 0.0;
    else
      v327 = 1.0;
    a3->var0[v326 + 1] = 3091;
    v328 = a3->var1;
    v329 = a3->var2;
    a3->var2 = v329 + 1;
    v328[v329] = v327;
    if (v296 >= 0x5EEC1)
      v330 = 0.0;
    else
      v330 = 1.0;
    a3->var0[v329 + 1] = 3090;
    v331 = a3->var1;
    v332 = a3->var2;
    a3->var2 = v332 + 1;
    v331[v332] = v330;
    if (v296 >= 0x80521)
      v333 = 0.0;
    else
      v333 = 1.0;
    a3->var0[v332 + 1] = 3089;
    v334 = a3->var1;
    v335 = a3->var2;
    a3->var2 = v335 + 1;
    v334[v335] = v333;
    if (v296 >= 0xA8C01)
      v336 = 0.0;
    else
      v336 = 1.0;
    a3->var0[v335 + 1] = 3088;
    v337 = a3->var1;
    v338 = a3->var2;
    a3->var2 = v338 + 1;
    v337[v338] = v336;
    if (v296 >= 0x100A41)
      v339 = 0.0;
    else
      v339 = 1.0;
    a3->var0[v338 + 1] = 3087;
    v340 = a3->var1;
    v341 = a3->var2;
    a3->var2 = v341 + 1;
    v340[v341] = v339;
    if (v296 < 0x151801)
      v299 = 1.0;
    a3->var0[v341 + 1] = 3086;
    v342 = a3->var1;
    v343 = a3->var2;
    a3->var2 = v343 + 1;
    v342[v343] = v299;
  }
  if (SSEnableSpotlightTopHitPersonalizedRanking())
  {
    Current = CFAbsoluteTimeGetCurrent();
    *(_DWORD *)buf = 0;
    SSCompactRankingAttrsGetFloat((uint64_t)self->_attributes, 0x41uLL, buf);
    LODWORD(v345) = *(_DWORD *)buf;
    if (*(float *)buf > 0.0)
      -[PRSRankingItem setWasEngaged:](self, "setWasEngaged:", 1, v345);
    -[PRSRankingItem topicalityScoreWithEvaluator:quParsedEvaluator:](self, "topicalityScoreWithEvaluator:quParsedEvaluator:", v12, v382, v345);
    v347 = v346;
    *(float *)&v348 = v346;
    -[PRSRankingItem engagementScoreWithEvaluator:currentTime:launchString:topicalityScore:](self, "engagementScoreWithEvaluator:currentTime:launchString:topicalityScore:", v12, v283, Current, v348);
    v350 = v349;
    -[PRSRankingItem setEngagementScore:](self, "setEngagementScore:", v349);
    -[PRSRankingItem setTopicalityScore:](self, "setTopicalityScore:", v347);
    a3->var0[a3->var2] = 3225;
    v351 = a3->var1;
    v352 = a3->var2;
    a3->var2 = v352 + 1;
    v351[v352] = v350;
    a3->var0[v352 + 1] = 3226;
    v353 = a3->var1;
    v354 = a3->var2;
    a3->var2 = v354 + 1;
    v353[v354] = v347;
  }
  SSGeneralLog();
  v355 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v355, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v12, "queryString");
    v387 = (void *)objc_claimAutoreleasedReturnValue();
    SSRedactString(v387, 1);
    v362 = (id)objc_claimAutoreleasedReturnValue();
    v378 = objc_msgSend(v12, "queryID");
    -[PRSRankingItem identifier](self, "identifier");
    v363 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRSRankingItem retrievalType](self, "retrievalType");
    v384 = (void *)objc_claimAutoreleasedReturnValue();
    v376 = objc_msgSend(v384, "integerValue");
    v364 = -[PRSRankingItem itemSparseMatchStrengthType](self, "itemSparseMatchStrengthType");
    -[PRSRankingItem pommesCalibratedL1Score](self, "pommesCalibratedL1Score");
    v366 = v365;
    -[PRSRankingItem pommesL1Score](self, "pommesL1Score");
    v368 = v367;
    -[PRSRankingItem embeddingSimilarity](self, "embeddingSimilarity");
    v370 = v369;
    -[PRSRankingItem keywordMatchScore](self, "keywordMatchScore");
    v372 = v371;
    -[PRSRankingItem topicalityScore](self, "topicalityScore");
    *(_DWORD *)buf = 138415106;
    *(_QWORD *)&buf[4] = v362;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v378;
    v393 = 2112;
    v394 = v363;
    v395 = 2112;
    v396 = v15;
    v397 = 2048;
    v398 = v376;
    v399 = 2048;
    v400 = v364;
    v401 = 2048;
    v402 = v366;
    v403 = 2048;
    v404 = v368;
    v405 = 2048;
    v406 = v370;
    v407 = 2048;
    v408 = v379;
    v409 = 2048;
    v410 = v372;
    v411 = 2048;
    v412 = v373;
    _os_log_debug_impl(&dword_1B86C5000, v355, OS_LOG_TYPE_DEBUG, "[SpotlightRanking]<CalibrationEval> query:%@, query_id:%ld, itemID:%@, bundleID:%@, retrievalType:%ld, SparseMatchStrength:%ld, pommesCalibratedL1Score:%f, pommesL1Score:%f, calibratedDenseScore:%f, originalDenseScore:%f, keywordMatchScore:%f, topicalityScore:%f", buf, 0x7Au);

    v294 = v382;
  }

  if ((self->_bundleIDType & 0x2040000) != 0)
  {
    *(_DWORD *)buf = 0;
    if (SSCompactRankingAttrsGetFloat((uint64_t)self->_attributes, 0x90uLL, buf))
    {
      v356 = *(float *)buf;
      a3->var0[a3->var2] = 2388;
      v357 = a3->var1;
      v358 = a3->var2;
      a3->var2 = v358 + 1;
      v357[v358] = v356;
    }
    if (SSCompactRankingAttrsGetFloat((uint64_t)self->_attributes, 0x91uLL, buf))
    {
      v359 = *(float *)buf;
      a3->var0[a3->var2] = 2389;
      v360 = a3->var1;
      v361 = a3->var2;
      a3->var2 = v361 + 1;
      v360[v361] = v359;
    }
    if (v385 == 1.0 || v380 == 1.0 || v59 == 1.0)
      self->_photosMatch = 1;
  }

}

- (void)populateRemainingFeaturesWithRanker:(id)a3
{
  uint64_t v3;
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  float v11;
  float v12;
  void *v13;
  float v14;
  float v15;
  void *v16;
  float v17;
  float v18;
  _BOOL4 v19;
  _BOOL4 v20;
  void *v21;
  float v22;
  float v23;
  BOOL v24;
  int v25;
  void *v26;
  float v27;
  float v28;
  float v29;
  float v30;
  float v31;
  int v32;
  float v33;
  float v34;
  float v35;
  BOOL v36;
  BOOL v37;
  unint64_t v38;
  void *v39;
  float v40;
  float v41;
  void *v42;
  float v43;
  float v44;
  BOOL v45;
  float v46;
  uint64_t v47;
  float v48;
  float v49;
  BOOL v50;
  float v52;
  void *v53;
  float v54;
  float v55;
  void *v56;
  float v57;
  float v58;
  void *v59;
  float v60;
  float v61;
  void *v63;
  float v64;
  float v65;
  float v66;
  void *v67;
  float v68;
  float v69;
  void *v70;
  float v71;
  float v72;
  void *v73;
  float v74;
  float v75;
  void *v76;
  __int16 v77;
  int v78;
  int v79;
  uint64_t v80;
  float v81;
  uint64_t v82;
  void *v83;
  int v84;
  int v85;
  uint64_t v86;
  void *v87;
  int v88;
  int v89;
  uint64_t v90;
  void *v91;
  float v92;
  float v93;
  void *v94;
  float v95;
  float v96;
  int v97;
  void *v98;
  float v99;
  float v100;
  uint64_t v101;
  void *v102;
  int v103;
  int v104;
  __int16 v105;
  void *v106;
  float v107;
  float v108;
  uint64_t v109;
  void *v110;
  int v111;
  void *v112;
  float v113;
  float v114;
  float v115;
  float v116;
  float v117;
  float v118;
  float v119;
  float v120;
  float v121;
  float v122;
  float v123;
  float v124;
  float v125;
  float v126;
  void *v127;
  void *v128;
  int v129;
  uint64_t v130;
  void *v131;
  void *v132;
  int v133;
  float v134;
  uint64_t v135;
  uint64_t v136;
  int v137;
  _DWORD *v138;
  int v139;
  int v140;
  int v141;
  int v142;
  int v143;
  int v144;
  float v145;
  float v146;
  float v147;
  float v148;
  float v149;
  void *v150;
  void *v151;
  uint64_t v152;
  double v153;
  void *v154;
  int v155;
  int v156;
  uint64_t v157;
  void *v158;
  int v159;
  int v160;
  uint64_t v161;
  void *v162;
  int v163;
  int v164;
  uint64_t v165;
  void *v166;
  int v167;
  int v168;
  int v169;
  int v170;
  int v171;
  int v172;
  int v173;
  int v174;
  int v175;
  int v176;
  int v177;
  int v178;
  int v179;
  int v180;
  int v181;
  int v182;
  int v183;
  int v184;
  int v185;
  int v186;
  int v187;
  int v188;
  int v189;
  int v190;
  int v191;
  int v192;
  int v193;
  int v194;
  int v195;
  int v196;
  int v197;
  int v198;
  int v199;
  int v200;
  void *v201;
  float v202;
  void *v203;
  int v204;
  int v205;
  _DWORD *v206;
  void *v207;
  int v208;
  int v209;
  void *v210;
  int v211;
  int v212;
  uint64_t v213;
  int v214;
  id v215;
  void *v216;
  int v217;
  _WORD v218[3235];
  _DWORD v219[3235];
  uint64_t v220;

  v3 = ((uint64_t (*)(PRSRankingItem *, SEL, id))MEMORY[0x1E0C80A78])(self, a2, a3);
  v220 = *MEMORY[0x1E0C80C00];
  v5 = v4;
  bzero(v219, 0x328CuLL);
  bzero(v218, 0x1946uLL);
  v6 = *(id *)(v3 + 208);
  v215 = v6;
  if (v6)
  {
    v7 = v6;
  }
  else
  {
    SSCompactRankingAttrsGetValue(*(int8x8_t **)(v3 + 288), 0xAuLL);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  if ((objc_msgSend((id)v3, "bundleIDType", v215) & 0x100) != 0)
  {
    v9 = objc_msgSend(v5, "queryTermCount");
    objc_msgSend((id)v3, "L2FeatureVector");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "scoreForFeature:", 33);
    v12 = v11;

    objc_msgSend((id)v3, "L2FeatureVector");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "scoreForFeature:", 1614);
    v15 = v14;

    objc_msgSend((id)v3, "L2FeatureVector");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "scoreForFeature:", 189);
    v18 = v17;

    v19 = v18 != 2147500000.0 && v15 == 0.0;
    v20 = v18 != -1.0 && v19;
    objc_msgSend((id)v3, "L2FeatureVector");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "scoreForFeature:", 165);
    v23 = v22;

    v24 = v23 != 0.0 || *(_BYTE *)(v3 + 58) == 0;
    v25 = !v24;
    objc_msgSend((id)v3, "L2FeatureVector");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "scoreForFeature:", 41);
    v28 = v27;

    if (!+[PRSRankingItemRanker isKeywordsHidingEnabled](PRSRankingItemRanker, "isKeywordsHidingEnabled"))
    {
      objc_msgSend(*(id *)(v3 + 240), "scoreForFeature:", 297);
      if (v9)
      {
        if (v29 < 2147500000.0)
        {
          v30 = ((double)v9 + 1.0) / (double)v9;
          if (v29 <= v30 && v29 > 0.0)
            *(_BYTE *)(v3 + 60) = 1;
        }
      }
    }
    if (v28 == 0.0)
    {
      v31 = 1.0;
      v32 = v12 == 1.0 || v20;
      if (((v32 | v25) & 1) == 0 && !*(_QWORD *)(v3 + 216) && !*(_BYTE *)(v3 + 60))
        v31 = 0.0;
      v218[0] = 2327;
      *(float *)v219 = v31;
      objc_msgSend(*(id *)(v3 + 240), "scoreForFeature:", 272);
      v34 = 0.0;
      if (v9 >= 2)
      {
        if (v33 > 0.0)
        {
          v35 = ((double)v9 + 1.0) / (double)v9;
          v36 = v33 > v35;
        }
        else
        {
          v36 = 1;
        }
        v37 = !v36 && v33 < 2147500000.0;
        v34 = 1.0;
        if (!v37)
          v34 = 0.0;
      }
      v218[1] = 2328;
      *(float *)&v219[1] = v34;
      v8 = 2;
    }
    else
    {
      v218[0] = 2327;
      v219[0] = 0;
      v8 = 1;
    }
  }
  else
  {
    v8 = 0;
  }
  if ((objc_msgSend((id)v3, "bundleIDType") & 4) != 0)
  {
    v38 = objc_msgSend(v5, "queryTermCount");
    objc_msgSend((id)v3, "L2FeatureVector");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "scoreForFeature:", 33);
    v41 = v40;

    objc_msgSend((id)v3, "L2FeatureVector");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "scoreForFeature:", 41);
    v44 = v43;

    v45 = v41 == 1.0 && v44 == 0.0;
    v218[v8] = 2327;
    if (v45)
      v46 = 1.0;
    else
      v46 = 0.0;
    v47 = v8 + 1;
    *(float *)&v219[v8] = v46;
    if (v44 == 0.0)
    {
      objc_msgSend(*(id *)(v3 + 240), "scoreForFeature:", 272);
      if (v48 > 0.0)
      {
        v49 = ((double)v38 + 1.0) / (double)v38;
        v50 = v48 > v49;
      }
      else
      {
        v50 = 1;
      }
      if (!v50 && v48 < 2147500000.0)
        v52 = 1.0;
      else
        v52 = 0.0;
      if (v38 < 2)
        v52 = 0.0;
      v218[v47] = 2328;
      v8 += 2;
      *(float *)&v219[v47] = v52;
    }
    else
    {
      ++v8;
    }
  }
  if (objc_msgSend(v7, "hasPrefix:", CFSTR("com.apple."))
    && (objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.CoreSuggestions")) & 1) == 0)
  {
    objc_msgSend((id)v3, "L2FeatureVector");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "scoreForFeature:", 41);
    v55 = v54;

    if ((objc_msgSend((id)v3, "bundleIDType") & 4) != 0 && v55 == 0.0)
    {
      objc_msgSend((id)v3, "L2FeatureVector");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "scoreForFeature:", 33);
      v58 = v57;

      objc_msgSend((id)v3, "L2FeatureVector");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "scoreForFeature:", 189);
      v61 = v60;

      if (v61 == 0.0 && v58 == 1.0)
        v55 = 1.0;
      if (v55 == 0.0)
      {
        objc_msgSend((id)v3, "L2FeatureVector");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "scoreForFeature:", 33);
        v65 = v64;

        if (v65 == 1.0)
          v55 = 1.0;
      }
    }
    v24 = (*(_QWORD *)(v3 + 384) & 0x2040000) == 0;
    v66 = 0.0;
    v218[v8] = 2329;
    if (v24)
      v66 = v55;
    *(float *)&v219[v8++] = v66;
  }
  if ((objc_msgSend((id)v3, "bundleIDType") & 0x20000) != 0)
  {
    objc_msgSend((id)v3, "L2FeatureVector");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "scoreForFeature:", 191);
    v75 = v74;

    if (v75 != 2147500000.0)
      *(_BYTE *)(v3 + 62) = 1;
  }
  else if ((objc_msgSend((id)v3, "bundleIDType") & 0x100) != 0)
  {
    objc_msgSend((id)v3, "L2FeatureVector");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "scoreForFeature:", 130);
    v69 = v68;

    if (v69 == 1.0)
    {
      objc_msgSend((id)v3, "L2FeatureVector");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "scoreForFeature:", 2329);
      v72 = v71;

      if (v72 == 0.0)
      {
        v218[v8] = 2329;
        v219[v8++] = 1065353216;
      }
    }
  }
  if (!objc_msgSend(v7, "hasPrefix:", CFSTR("com.apple."))
    || (objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.Preferences")) & 1) != 0
    || (objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.CoreSuggestions")) & 1) != 0)
  {
    objc_msgSend((id)v3, "L2FeatureVector");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = 1911;
    objc_msgSend(v76, "scoreForFeature:", 1911);
    v79 = v78;

    v218[v8] = 2355;
    v80 = v8 + 1;
    v219[v8] = v79;
    v81 = -1.0;
    v82 = 2;
LABEL_90:
    v218[v80] = v77;
    v8 += v82;
    *(float *)&v219[v80] = v81;
    goto LABEL_91;
  }
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.reminders")) & 1) == 0
    && (objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.Music")) & 1) == 0)
  {
    objc_msgSend((id)v3, "L2FeatureVector");
    v201 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v201, "scoreForFeature:", 131);
    v81 = v202;

    v77 = 2330;
    v82 = 1;
    v80 = v8;
    goto LABEL_90;
  }
LABEL_91:
  if ((objc_msgSend((id)v3, "bundleIDType") & 0x20) != 0)
  {
    objc_msgSend((id)v3, "L2FeatureVector");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "scoreForFeature:", 42);
    v85 = v84;

    v218[v8] = 2354;
    v219[v8] = v85;
    v86 = v8 + 1;
    v218[v8 + 1] = 42;
    v8 += 2;
    v219[v86] = 0;
  }
  if ((objc_msgSend((id)v3, "bundleIDType") & 2) != 0 || (objc_msgSend((id)v3, "bundleIDType") & 4) != 0)
  {
    objc_msgSend((id)v3, "L2FeatureVector");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "scoreForFeature:", 42);
    v89 = v88;

    v218[v8] = 2354;
    v219[v8] = v89;
    v90 = v8 + 1;
    v218[v8 + 1] = 42;
    v8 += 2;
    v219[v90] = 0;
  }
  objc_msgSend((id)v3, "L2FeatureVector");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "scoreForFeature:", 35);
  v93 = v92;

  if (v93 == 1.0 && (objc_msgSend((id)v3, "hasShortCut") & 1) == 0)
  {
    v218[v8] = 35;
    v219[v8++] = 0;
  }
  objc_msgSend((id)v3, "L2FeatureVector");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "scoreForFeature:", 48);
  v96 = v95;

  v97 = objc_msgSend((id)v3, "hasShortCut");
  if (v96 == 1.0)
  {
    if ((v97 & 1) == 0)
    {
      v218[v8] = 48;
      v219[v8++] = 0;
    }
  }
  else if (v97)
  {
    objc_msgSend((id)v3, "setHasShortCut:", 0);
  }
  if ((objc_msgSend((id)v3, "bundleIDType") & 0x10) != 0 || (objc_msgSend((id)v3, "bundleIDType") & 0x800) != 0)
  {
    objc_msgSend((id)v3, "L2FeatureVector");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "scoreForFeature:", 42);
    v100 = v99;

    if (v100 == 1.0)
    {
      *(_DWORD *)&v218[v8] = 2754866;
      v101 = v8;
      v8 += 2;
      *(_QWORD *)&v219[v101] = 1065353216;
    }
  }
  if ((objc_msgSend((id)v3, "bundleIDType") & 0x100) != 0)
  {
    objc_msgSend((id)v3, "L2FeatureVector");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "scoreForFeature:", 42);
    v108 = v107;

    if (v108 == 1.0)
    {
      *(_DWORD *)&v218[v8] = 2754866;
      v109 = v8;
      v8 += 2;
      *(_QWORD *)&v219[v109] = 1065353216;
    }
  }
  else
  {
    if ((objc_msgSend((id)v3, "bundleIDType") & 0x10) != 0)
    {
      objc_msgSend((id)v3, "L2FeatureVector");
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v110, "scoreForFeature:", 1887);
      v104 = v111;

      v105 = 2337;
      goto LABEL_116;
    }
    if ((objc_msgSend((id)v3, "bundleIDType") & 0x80) != 0)
    {
      objc_msgSend((id)v3, "L2FeatureVector");
      v203 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v203, "scoreForFeature:", 91);
      v205 = v204;

      v206 = &v219[v8];
      *v206 = v205;
      objc_msgSend((id)v3, "L2FeatureVector");
      v207 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v207, "scoreForFeature:", 109);
      v209 = v208;

      v206[1] = v209;
      objc_msgSend((id)v3, "L2FeatureVector");
      v210 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v210, "scoreForFeature:", 127);
      v212 = v211;

      v213 = v8 + 3;
      v206[2] = v212;
      v214 = objc_msgSend(*(id *)(v3 + 368), "isEqualToString:", CFSTR("com.apple.safari.bookmark"));
      *(_QWORD *)&v218[v8] = 0x9590920091F091ELL;
      v8 += 4;
      if (v214)
        v219[v213] = 1065353216;
      else
        v219[v213] = 0;
    }
    else if ((objc_msgSend((id)v3, "bundleIDType") & 8) != 0)
    {
      objc_msgSend((id)v3, "L2FeatureVector");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v102, "scoreForFeature:", 126);
      v104 = v103;

      v105 = 2333;
LABEL_116:
      v218[v8] = v105;
      v219[v8++] = v104;
    }
  }
  if ((*(_WORD *)(v3 + 386) & 0x204) != 0)
  {
    objc_msgSend((id)v3, "L2FeatureVector");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v112, "scoreForFeature:", 308);
    v114 = v113;

    if (v114 == 1.0)
    {
      v218[v8] = 2329;
      v219[v8++] = 1065353216;
    }
  }
  if ((*(_DWORD *)(v3 + 384) & 0x100008) != 0)
  {
    objc_msgSend(*(id *)(v3 + 240), "scoreForFeature:", 2367);
    v116 = v115;
    objc_msgSend(*(id *)(v3 + 240), "scoreForFeature:", 2368);
    v118 = v117;
    objc_msgSend(*(id *)(v3 + 240), "scoreForFeature:", 2372);
    v120 = v119;
    objc_msgSend(*(id *)(v3 + 240), "scoreForFeature:", 2373);
    v122 = v121;
    objc_msgSend(*(id *)(v3 + 240), "scoreForFeature:", 2375);
    v124 = v123;
    objc_msgSend(*(id *)(v3 + 240), "scoreForFeature:", 2376);
    v126 = 2.0;
    if (v120 != 0.0 || v122 != 0.0 || (v126 = 1.5, v116 != 0.0) || v118 != 0.0 || v124 != 0.0 || v125 != 0.0)
    {
      v218[v8] = 216;
      *(float *)&v219[v8++] = v126;
    }
  }
  if (objc_msgSend(v5, "isNLSearch"))
  {
    objc_msgSend(v5, "rankCategories");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v127, "firstObject");
    v128 = (void *)objc_claimAutoreleasedReturnValue();

    v129 = objc_msgSend((id)v3, "isInSectionWithRankCategory:", v128);
    v218[v8] = 2390;
    v130 = v8 + 1;
    if (v129)
    {
      v219[v8] = 1065353216;
      +[PRSRankingItem bundlesExcludedFromRankCategory](PRSRankingItem, "bundlesExcludedFromRankCategory");
      v131 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v131, "valueForKey:", v128);
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      v133 = objc_msgSend(v132, "isEqualToString:", *(_QWORD *)(v3 + 208));
      v134 = 0.0;
      if (v133)
        v134 = 1.0;
      v218[v130] = 2391;
      *(float *)&v219[v130] = v134;
      v130 = v8 + 2;

    }
    else
    {
      v219[v8] = 0;
    }
    v218[v130] = 365;
    v219[v130] = 1065353216;

    v8 = v130;
  }
  else
  {
    v218[v8] = 365;
    v219[v8] = 0;
  }
  v135 = v8 + 1;
  v136 = *(_QWORD *)(v3 + 384);
  if ((v136 & 0x2040000) != 0)
  {
    objc_msgSend(*(id *)(v3 + 240), "scoreForFeature:", 2728);
    v219[v135] = v137;
    objc_msgSend(*(id *)(v3 + 240), "scoreForFeature:", 2733);
    v138 = &v219[v8];
    v138[2] = v139;
    objc_msgSend(*(id *)(v3 + 240), "scoreForFeature:", 2778);
    v138[3] = v140;
    objc_msgSend(*(id *)(v3 + 240), "scoreForFeature:", 2783);
    v138[4] = v141;
    objc_msgSend(*(id *)(v3 + 240), "scoreForFeature:", 2678);
    v138[5] = v142;
    objc_msgSend(*(id *)(v3 + 240), "scoreForFeature:", 2683);
    v138[6] = v143;
    objc_msgSend(*(id *)(v3 + 240), "scoreForFeature:", 2733);
    v138[7] = v144;
    *(_OWORD *)&v218[v135] = xmmword_1B87DF880;
    v135 = v8 + 9;
    v138[8] = -1082130432;
    v136 = *(_QWORD *)(v3 + 384);
  }
  if ((v136 & 0x2000000) != 0)
  {
    v217 = 0;
    if (SSCompactRankingAttrsGetFloat(*(_QWORD *)(v3 + 288), 0x90uLL, &v217))
    {
      v218[v135] = 2388;
      v219[v135++] = v217;
    }
    if (SSCompactRankingAttrsGetFloat(*(_QWORD *)(v3 + 288), 0x91uLL, &v217))
    {
      v218[v135] = 2389;
      v219[v135++] = v217;
    }
    objc_msgSend(*(id *)(v3 + 240), "scoreForFeature:", 2367);
    v146 = v145;
    objc_msgSend(*(id *)(v3 + 240), "scoreForFeature:", 2362);
    v148 = v147;
    objc_msgSend(*(id *)(v3 + 240), "scoreForFeature:", 2366);
    if (v146 == 1.0 || v149 == 1.0 || v148 == 1.0)
      *(_BYTE *)(v3 + 62) = 1;
  }
  SSCompactRankingAttrsGetValue(*(int8x8_t **)(v3 + 288), 0xAFuLL);
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  v151 = v150;
  if (v150)
  {
    v152 = objc_msgSend(v150, "integerValue");
    LODWORD(v153) = 1.0;
    if (v152 > 0)
    {
LABEL_149:
      v218[v135] = 3101;
      v219[v135++] = LODWORD(v153);
      goto LABEL_151;
    }
    if (!objc_msgSend(v151, "integerValue", v153))
    {
      LODWORD(v153) = 0;
      goto LABEL_149;
    }
  }
LABEL_151:
  if ((objc_msgSend((id)v3, "bundleIDType") & 0x10) != 0)
  {
    objc_msgSend((id)v3, "L2FeatureVector");
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v154, "scoreForFeature:", 127);
    v156 = v155;

    v218[v135] = 3229;
    v157 = v135 + 1;
    v219[v135] = v156;
    objc_msgSend((id)v3, "L2FeatureVector");
    v158 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v158, "scoreForFeature:", 91);
    v160 = v159;

    v218[v157] = 3230;
    v161 = v135 + 2;
    v219[v157] = v160;
    objc_msgSend((id)v3, "L2FeatureVector");
    v162 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v162, "scoreForFeature:", 2469);
    v164 = v163;

    v218[v161] = 3231;
    v165 = v135 + 3;
    v219[v161] = v164;
    objc_msgSend((id)v3, "L2FeatureVector");
    v166 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v166, "scoreForFeature:", 2470);
    v168 = v167;

    v218[v165] = 3232;
    v135 += 4;
    v219[v165] = v168;
  }
  objc_msgSend(*(id *)(v3 + 240), "setScores:forFeatures:count:", v219, v218, v135);
  if ((*(_WORD *)(v3 + 386) & 0x204) != 0)
  {
    if (!*(_QWORD *)(v3 + 512))
      *(_QWORD *)(v3 + 512) = malloc_type_calloc(0x22uLL, 4uLL, 0x100004052888210uLL);
    objc_msgSend(*(id *)(v3 + 240), "scoreForFeature:", 158);
    **(_DWORD **)(v3 + 512) = v169;
    objc_msgSend(*(id *)(v3 + 240), "scoreForFeature:", 1373);
    *(_DWORD *)(*(_QWORD *)(v3 + 512) + 4) = v170;
    objc_msgSend(*(id *)(v3 + 240), "scoreForFeature:", 1086);
    *(_DWORD *)(*(_QWORD *)(v3 + 512) + 8) = v171;
    objc_msgSend(*(id *)(v3 + 240), "scoreForFeature:", 132);
    *(_DWORD *)(*(_QWORD *)(v3 + 512) + 12) = v172;
    objc_msgSend(*(id *)(v3 + 240), "scoreForFeature:", 156);
    *(_DWORD *)(*(_QWORD *)(v3 + 512) + 16) = v173;
    objc_msgSend(*(id *)(v3 + 240), "scoreForFeature:", 1537);
    *(_DWORD *)(*(_QWORD *)(v3 + 512) + 20) = v174;
    objc_msgSend(*(id *)(v3 + 240), "scoreForFeature:", 1496);
    *(_DWORD *)(*(_QWORD *)(v3 + 512) + 24) = v175;
    objc_msgSend(*(id *)(v3 + 240), "scoreForFeature:", 1578);
    *(_DWORD *)(*(_QWORD *)(v3 + 512) + 28) = v176;
    objc_msgSend(*(id *)(v3 + 240), "scoreForFeature:", 1332);
    *(_DWORD *)(*(_QWORD *)(v3 + 512) + 32) = v177;
    objc_msgSend(*(id *)(v3 + 240), "scoreForFeature:", 1250);
    *(_DWORD *)(*(_QWORD *)(v3 + 512) + 36) = v178;
    objc_msgSend(*(id *)(v3 + 240), "scoreForFeature:", 1127);
    *(_DWORD *)(*(_QWORD *)(v3 + 512) + 40) = v179;
    objc_msgSend(*(id *)(v3 + 240), "scoreForFeature:", 1414);
    *(_DWORD *)(*(_QWORD *)(v3 + 512) + 44) = v180;
    objc_msgSend(*(id *)(v3 + 240), "scoreForFeature:", 1455);
    *(_DWORD *)(*(_QWORD *)(v3 + 512) + 48) = v181;
    objc_msgSend(*(id *)(v3 + 240), "scoreForFeature:", 1291);
    *(_DWORD *)(*(_QWORD *)(v3 + 512) + 52) = v182;
    objc_msgSend(*(id *)(v3 + 240), "scoreForFeature:", 1168);
    *(_DWORD *)(*(_QWORD *)(v3 + 512) + 56) = v183;
    objc_msgSend(*(id *)(v3 + 240), "scoreForFeature:", 1209);
    *(_DWORD *)(*(_QWORD *)(v3 + 512) + 60) = v184;
    objc_msgSend(*(id *)(v3 + 240), "scoreForFeature:", 159);
    *(_DWORD *)(*(_QWORD *)(v3 + 512) + 64) = v185;
    objc_msgSend(*(id *)(v3 + 240), "scoreForFeature:", 1366);
    *(_DWORD *)(*(_QWORD *)(v3 + 512) + 68) = v186;
    objc_msgSend(*(id *)(v3 + 240), "scoreForFeature:", 1079);
    *(_DWORD *)(*(_QWORD *)(v3 + 512) + 72) = v187;
    objc_msgSend(*(id *)(v3 + 240), "scoreForFeature:", 133);
    *(_DWORD *)(*(_QWORD *)(v3 + 512) + 76) = v188;
    objc_msgSend(*(id *)(v3 + 240), "scoreForFeature:", 157);
    *(_DWORD *)(*(_QWORD *)(v3 + 512) + 80) = v189;
    objc_msgSend(*(id *)(v3 + 240), "scoreForFeature:", 1530);
    *(_DWORD *)(*(_QWORD *)(v3 + 512) + 84) = v190;
    objc_msgSend(*(id *)(v3 + 240), "scoreForFeature:", 1489);
    *(_DWORD *)(*(_QWORD *)(v3 + 512) + 88) = v191;
    objc_msgSend(*(id *)(v3 + 240), "scoreForFeature:", 1571);
    *(_DWORD *)(*(_QWORD *)(v3 + 512) + 92) = v192;
    objc_msgSend(*(id *)(v3 + 240), "scoreForFeature:", 1325);
    *(_DWORD *)(*(_QWORD *)(v3 + 512) + 96) = v193;
    objc_msgSend(*(id *)(v3 + 240), "scoreForFeature:", 1243);
    *(_DWORD *)(*(_QWORD *)(v3 + 512) + 100) = v194;
    objc_msgSend(*(id *)(v3 + 240), "scoreForFeature:", 1120);
    *(_DWORD *)(*(_QWORD *)(v3 + 512) + 104) = v195;
    objc_msgSend(*(id *)(v3 + 240), "scoreForFeature:", 1407);
    *(_DWORD *)(*(_QWORD *)(v3 + 512) + 108) = v196;
    objc_msgSend(*(id *)(v3 + 240), "scoreForFeature:", 1448);
    *(_DWORD *)(*(_QWORD *)(v3 + 512) + 112) = v197;
    objc_msgSend(*(id *)(v3 + 240), "scoreForFeature:", 1284);
    *(_DWORD *)(*(_QWORD *)(v3 + 512) + 116) = v198;
    objc_msgSend(*(id *)(v3 + 240), "scoreForFeature:", 1161);
    *(_DWORD *)(*(_QWORD *)(v3 + 512) + 120) = v199;
    objc_msgSend(*(id *)(v3 + 240), "scoreForFeature:", 1202);
    *(_DWORD *)(*(_QWORD *)(v3 + 512) + 124) = v200;
  }

}

- (void)populateParsecRemainingFeatures
{
  id *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  int v7;
  uint64_t v8;
  void *v9;
  int v10;
  int v11;
  void *v12;
  uint64_t v13;
  void *v14;
  __int16 v15;
  void *v16;
  int v17;
  __int16 v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  int v23;
  int v24;
  _WORD v25[3235];
  _DWORD v26[3235];
  uint64_t v27;

  v2 = (id *)((uint64_t (*)(PRSRankingItem *, SEL))MEMORY[0x1E0C80A78])(self, a2);
  v27 = *MEMORY[0x1E0C80C00];
  bzero(v26, 0x328CuLL);
  bzero(v25, 0x1946uLL);
  objc_msgSend(v2, "L2FeatureVector");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.parsec.web_index")))
  {
    objc_msgSend(v2, "L2FeatureVector");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "scoreForFeature:", 2178);
    v7 = v6;

    v25[0] = 2331;
    v26[0] = v7;
    v8 = 1;
  }
  else
  {
    v8 = 0;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.parsec.bing")))
  {
    objc_msgSend(v2, "L2FeatureVector");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "scoreForFeature:", 2178);
    v11 = v10;

    v25[v8] = 2332;
    v26[v8++] = v11;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.parsec.news")))
  {
    objc_msgSend(v2[30], "roundTripFeatures");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", CFSTR("roundtrip_result_age"));
    v13 = objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      objc_msgSend(v12, "objectForKey:", CFSTR("roundtrip_news_result_age"));
      v13 = objc_claimAutoreleasedReturnValue();
      if (!v13)
        goto LABEL_28;
    }
    v14 = (void *)v13;
    v15 = 2320;
    goto LABEL_26;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.parsec.maps")))
  {
    objc_msgSend(v2[30], "roundTripFeatures");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", CFSTR("roundtrip_distance"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      objc_msgSend(v12, "objectForKey:", CFSTR("roundtrip_maps_distance"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v16)
        goto LABEL_22;
    }
    objc_msgSend(v16, "floatValue");
    v18 = 2321;
  }
  else
  {
    if (!objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.parsec.itunes.iosSoftware")))
    {
      if (!objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.parsec.kg")))
        goto LABEL_29;
      objc_msgSend(v2[30], "roundTripFeatures");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKey:", CFSTR("roundtrip_prediction_score"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v14)
        goto LABEL_27;
      v15 = 2326;
      goto LABEL_26;
    }
    objc_msgSend(v2[30], "roundTripFeatures");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", CFSTR("roundtrip_user_rating_count"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19
      || (objc_msgSend(v12, "objectForKey:", CFSTR("roundtrip_apps_user_rating_count")),
          (v19 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend(v19, "floatValue");
      v25[v8] = 2322;
      v26[v8] = v20;

      ++v8;
    }
    objc_msgSend(v12, "objectForKey:", CFSTR("roundtrip_user_rating_value"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      objc_msgSend(v12, "objectForKey:", CFSTR("roundtrip_apps_user_rating_value"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v16)
        goto LABEL_22;
    }
    objc_msgSend(v16, "floatValue");
    v18 = 2323;
  }
  v25[v8] = v18;
  v26[v8] = v17;

  ++v8;
LABEL_22:
  objc_msgSend(v12, "objectForKey:", CFSTR("roundtrip_num_engaged"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v21)
  {
    objc_msgSend(v21, "floatValue");
    v25[v8] = 2324;
    v26[v8++] = v23;
  }
  objc_msgSend(v12, "objectForKey:", CFSTR("roundtrip_num_shown"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
    goto LABEL_27;
  v15 = 2325;
LABEL_26:
  objc_msgSend(v14, "floatValue");
  v25[v8] = v15;
  v26[v8++] = v24;
LABEL_27:

LABEL_28:
LABEL_29:
  objc_msgSend(v2[30], "setScores:forFeatures:count:", v26, v25, v8);

}

- (id)getBundleSpecificValue:(id)a3 forPropertyName:(id)a4 withQueryString:(id)a5 isCJK:(BOOL)a6 isBullseyeSearch:(BOOL)a7 withEvaluator:(id)a8 keyboardLanguage:(id)a9 seenAuthorEmail:(BOOL)a10 seenPrimaryRecipientEmail:(BOOL)a11
{
  unint64_t v12;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  unint64_t bundleIDType;
  id v24;
  id v25;
  uint64_t i;
  __CFString *v27;
  uint64_t v28;
  id v29;
  int v30;
  void *v31;
  id v32;
  unint64_t v33;
  uint64_t j;
  __CFString *v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  unint64_t v40;
  void *v41;
  void *v42;
  char v43;
  unint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  int v48;
  void *v49;
  uint64_t v50;
  id v51;
  unint64_t v52;
  id v53;
  uint64_t v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  id v67;
  int v68;
  void *v69;
  void *v70;
  __CFString *v71;
  uint64_t v72;
  void *v73;
  unint64_t k;
  void *v75;
  void *v76;
  id v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  id v81;
  unint64_t *v82;
  id v83;
  id v84;
  unint64_t *v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  const __CFString *v92;
  uint64_t v93;
  void *v94;
  uint64_t v95;
  id v96;
  uint64_t v97;
  void *v98;
  uint64_t v99;
  void *v100;
  uint64_t v101;
  void *v102;
  id v103;
  uint64_t v104;
  void *v105;
  uint64_t v106;
  void *v107;
  uint64_t v108;
  void *v109;
  id *v110;
  void *v111;
  id *v112;
  id v113;
  id v114;
  unint64_t *v115;
  unint64_t *v116;
  unint64_t *v117;
  unint64_t *v118;
  unint64_t *v119;
  unint64_t *v120;
  unint64_t v121;
  unint64_t *v122;
  unint64_t v123;
  unint64_t *v124;
  unint64_t *v125;
  void *v126;
  unint64_t *v127;
  unint64_t *v128;
  unint64_t *v129;
  void *v130;
  unint64_t *v131;
  unint64_t *v132;
  unint64_t *v133;
  unint64_t *v134;
  unint64_t *v135;
  uint64_t *v136;
  uint64_t *v137;
  unint64_t *v138;
  unint64_t *v139;
  unint64_t v140;
  uint64_t *v141;
  unint64_t *v142;
  unint64_t *v143;
  void *v144;
  unint64_t *v145;
  unint64_t *v146;
  unint64_t *v147;
  unint64_t *v148;
  unint64_t *v149;
  unint64_t *v150;
  unint64_t *v151;
  unint64_t *v152;
  void *v153;
  unint64_t *v154;
  void *v155;
  void *v156;
  void *v157;
  unint64_t *v158;
  void *v159;
  void *v160;
  id v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  id obj;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  uint64_t v172;
  void *v173;
  void *v174;
  void *v175;
  id v176;
  id v177;
  unint64_t v178[2];
  unint64_t v179[2];
  unint64_t v180[2];
  _QWORD v181[4];
  id v182;
  uint64_t *v183;
  __int128 *v184;
  __int128 v185;
  uint64_t v186;
  char v187;
  uint64_t v188;
  id *v189;
  uint64_t v190;
  uint64_t (*v191)(uint64_t, uint64_t);
  void (*v192)(uint64_t);
  id v193;

  v12 = a7;
  v16 = a10;
  v17 = (uint64_t)a9;
  v18 = a3;
  v19 = a4;
  v20 = a5;
  v177 = a8;
  v21 = a9;
  v188 = 0;
  v189 = (id *)&v188;
  v190 = 0x3032000000;
  v191 = __Block_byref_object_copy__9;
  v192 = __Block_byref_object_dispose__9;
  v193 = 0;
  v22 = v18;
  v193 = v22;
  bundleIDType = self->_bundleIDType;
  if ((bundleIDType & 0x200000) != 0)
  {
    if ((objc_msgSend(v19, "isEqualToString:", *MEMORY[0x1E0CA6968]) & 1) != 0)
      goto LABEL_6;
    bundleIDType = self->_bundleIDType;
  }
  if ((bundleIDType & 0x2040000) != 0 && (objc_msgSend(v19, "isEqualToString:", *MEMORY[0x1E0CA68D8]) & 1) != 0)
    goto LABEL_6;
  if (v22)
    goto LABEL_8;
  v40 = self->_bundleIDType;
  if ((v40 & 0x10) != 0)
  {
    if ((objc_msgSend(v19, "isEqualToString:", *MEMORY[0x1E0CA6158]) & 1) != 0)
      goto LABEL_8;
    v40 = self->_bundleIDType;
  }
  if ((v40 & 0x200000) != 0)
  {
    if ((objc_msgSend(v19, "isEqualToString:", *MEMORY[0x1E0CA6158]) & 1) == 0)
    {
      v40 = self->_bundleIDType;
      goto LABEL_43;
    }
LABEL_8:
    if ((-[PRSRankingItem bundleIDType](self, "bundleIDType") & 0x20) != 0
      && objc_msgSend(v19, "isEqualToString:", *MEMORY[0x1E0CA6968]))
    {
      v25 = v21;
      for (i = 0; i != 3; ++i)
      {
        v27 = sSeparatorList[i];
        if ((objc_msgSend(v20, "containsString:", v27) & 1) == 0)
        {
          objc_msgSend(v189[5], "stringByReplacingOccurrencesOfString:withString:", v27, CFSTR(" "));
          v28 = objc_claimAutoreleasedReturnValue();
          v29 = v189[5];
          v189[5] = (id)v28;

        }
      }
      v21 = v25;
      goto LABEL_35;
    }
    if ((-[PRSRankingItem bundleIDType](self, "bundleIDType") & 0x20) != 0)
    {
      v30 = objc_msgSend(v19, "isEqualToString:", *MEMORY[0x1E0CA6158]) ^ 1;
      if (v22)
        LOBYTE(v30) = 1;
      if ((v30 & 1) == 0)
      {
        SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0xCuLL);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v32 = v21;
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_storeStrong(v189 + 5, v31);
        v33 = (unint64_t)v31;
        for (j = 0; j != 3; ++j)
        {
          v35 = sSeparatorList[j];
          if ((objc_msgSend(v20, "containsString:", v35) & 1) == 0)
          {
            objc_msgSend(v189[5], "stringByReplacingOccurrencesOfString:withString:", v35, CFSTR(" "));
            v36 = objc_claimAutoreleasedReturnValue();
            v37 = v189[5];
            v189[5] = (id)v36;

          }
        }
        v21 = v32;
        goto LABEL_26;
      }
    }
    if ((-[PRSRankingItem bundleIDType](self, "bundleIDType") & 2) != 0
      && (objc_msgSend(v19, "isEqualToString:", *MEMORY[0x1E0CA6158]) & 1) != 0
      || (-[PRSRankingItem bundleIDType](self, "bundleIDType") & 0x40) != 0
      && objc_msgSend(v19, "isEqualToString:", *MEMORY[0x1E0CA6158]))
    {
      if ((objc_msgSend(v20, "containsString:", CFSTR(",")) & 1) == 0)
      {
        objc_msgSend(v189[5], "stringByReplacingOccurrencesOfString:withString:", CFSTR(","), CFSTR(" "));
        v38 = objc_claimAutoreleasedReturnValue();
LABEL_33:
        v12 = (unint64_t)v189[5];
        v189[5] = (id)v38;
        goto LABEL_34;
      }
      goto LABEL_35;
    }
    if ((self->_bundleIDType & 0x100) != 0 && objc_msgSend(v19, "isEqualToString:", *MEMORY[0x1E0CA6158]))
    {
      objc_msgSend(v189[5], "lowercaseString");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "lowercaseString");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v41, "hasPrefix:", v42);

      if ((v43 & 1) != 0)
        goto LABEL_35;
      SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x135uLL);
      v12 = objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v44 = v12;
        objc_msgSend(v189[5], "componentsSeparatedByString:", CFSTR(" "));
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v12, "componentsSeparatedByString:", CFSTR(" "));
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v46, "count"))
        {
          if ((unint64_t)objc_msgSend(v45, "count") >= 2)
          {
            objc_msgSend(v45, "objectAtIndex:", 0);
            v174 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "objectAtIndex:", 0);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            v48 = objc_msgSend(v174, "isEqualToString:", v47);

            if (v48)
            {
              objc_msgSend(v45, "subarrayWithRange:", 1, objc_msgSend(v45, "count") - 1);
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v49, "componentsJoinedByString:", CFSTR(" "));
              v50 = objc_claimAutoreleasedReturnValue();
              v51 = v189[5];
              v189[5] = (id)v50;

              self->_vendorNameIsDisplayNamePrefix = 1;
            }
          }
        }

        v12 = v44;
      }
      goto LABEL_34;
    }
    if ((-[PRSRankingItem bundleIDType](self, "bundleIDType") & 2) != 0
      && (objc_msgSend(v19, "isEqualToString:", *MEMORY[0x1E0CA6150]) & v12) == 1)
    {
      if ((unint64_t)objc_msgSend(v189[5], "length") >= 0x51)
      {
        objc_msgSend(v189[5], "substringToIndex:", 80);
        v38 = objc_claimAutoreleasedReturnValue();
        goto LABEL_33;
      }
LABEL_35:
      v24 = v189[5];
      goto LABEL_36;
    }
    if ((-[PRSRankingItem bundleIDType](self, "bundleIDType") & 4) != 0)
    {
      if (!objc_msgSend(v19, "isEqualToString:", *MEMORY[0x1E0CA6158])
        || !+[PRSRankingUtilities somePotentialPhoneNumbersInString:](PRSRankingUtilities, "somePotentialPhoneNumbersInString:", v20)|| +[PRSRankingUtilities somePotentialPhoneNumbersInString:](PRSRankingUtilities, "somePotentialPhoneNumbersInString:", v189[5]))
      {
        goto LABEL_35;
      }
      +[PRSRankingUtilities onlyPotentialPhoneNumbersInString:](PRSRankingUtilities, "onlyPotentialPhoneNumbersInString:", v20);
      v60 = objc_claimAutoreleasedReturnValue();

      if (!v60)
      {
        v20 = 0;
        goto LABEL_35;
      }
      SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x27uLL);
      v12 = objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v20 = (id)v60;
        goto LABEL_34;
      }
      v61 = objc_msgSend((id)v12, "count");
      v62 = (void *)v12;
      *(_QWORD *)&v185 = 0;
      *((_QWORD *)&v185 + 1) = &v185;
      v186 = 0x2020000000;
      v187 = 0;
      v63 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6AB8]), "initWithQuery:language:fuzzyThreshold:options:", v60, v21, 0, 0);
      objc_msgSend(v177, "setMatchOncePerTerm:", 0);
      v173 = (void *)v60;
      v176 = v21;
      if (v61)
      {
        v64 = 0;
        while (1)
        {
          objc_msgSend(v62, "objectAtIndex:", v64);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          +[PRSRankingUtilities onlyPotentialPhoneNumbersInString:](PRSRankingUtilities, "onlyPotentialPhoneNumbersInString:", v65);
          v66 = (void *)objc_claimAutoreleasedReturnValue();

          if (v66)
          {
            v181[0] = MEMORY[0x1E0C809B0];
            v181[1] = 3221225472;
            v181[2] = __169__PRSRankingItem_getBundleSpecificValue_forPropertyName_withQueryString_isCJK_isBullseyeSearch_withEvaluator_keyboardLanguage_seenAuthorEmail_seenPrimaryRecipientEmail___block_invoke;
            v181[3] = &unk_1E6E52EA8;
            v183 = &v188;
            v67 = v66;
            v182 = v67;
            v184 = &v185;
            objc_msgSend(v63, "evaluateAttribute:ignoreSubtokens:strongCompounds:skipTranscriptions:withHandler:", v67, 0, 1, 1, v181);
            v68 = *(unsigned __int8 *)(*((_QWORD *)&v185 + 1) + 24);

            if (v68)
              break;
          }

          if (v61 == ++v64)
            goto LABEL_209;
        }

      }
LABEL_209:

      _Block_object_dispose(&v185, 8);
      v20 = v173;
      v21 = v176;
      v12 = (unint64_t)v62;
      goto LABEL_34;
    }
    v52 = self->_bundleIDType;
    if ((v52 & 0x2040000) != 0)
    {
      if ((objc_msgSend(v19, "isEqualToString:", *MEMORY[0x1E0CA68D8]) & 1) != 0)
      {
        v175 = v21;
        v53 = v189[5];
        v189[5] = 0;

        objc_msgSend(v177, "queryTerms");
        v54 = objc_claimAutoreleasedReturnValue();
        v172 = objc_msgSend((id)v54, "count");

        *(_QWORD *)((char *)&v185 + 6) = 0;
        *(_QWORD *)&v185 = 0;
        memset(v180, 0, 14);
        memset(v179, 0, 14);
        memset(v178, 0, 14);
        SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x1FuLL);
        v170 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v12 = (unint64_t)v170;
          v54 = v170;
          (*((void (**)(uint64_t, void *, void *, void *, _WORD *))updateMatchCounts + 2))((uint64_t)updateMatchCounts, v177, v21, (void *)v54, &v185);
          if ((*((BOOL (**)(uint64_t, uint64_t, unint64_t, uint64_t, int, char, int))hasMatchWithCounts
                + 2))((uint64_t)hasMatchWithCounts, v172, v185, DWORD2(v185) | ((unint64_t)WORD6(v185) << 32), 1, 0, 1))
          {
            v55 = v189[5];
            v189[5] = (id)v54;

            v56 = 0;
            v159 = 0;
            v160 = 0;
            v163 = 0;
            v164 = 0;
            v165 = 0;
            v57 = 0;
            v58 = 0;
            v16 = 0;
            v168 = 0;
            v169 = 0;
            obj = 0;
            v162 = 0;
            v59 = 0;

LABEL_263:
LABEL_34:

            goto LABEL_35;
          }

        }
        SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x80uLL);
        v169 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v80 = objc_msgSend(v169, "count");
          v54 = 14 * v80;
          v16 = (uint64_t)malloc_type_malloc(14 * v80, 0x100004018756113uLL);
          bzero((void *)v16, 14 * v80);
          v154 = (unint64_t *)v16;
          if (v80)
          {
            v12 = 0;
            while (1)
            {
              objc_msgSend(v169, "objectAtIndex:", v12);
              v54 = objc_claimAutoreleasedReturnValue();
              (*((void (**)(uint64_t, void *, void *, void *, _WORD *))updateMatchCounts + 2))((uint64_t)updateMatchCounts, v177, v21, (void *)v54, (_WORD *)v16);
              v17 = v17 & 0xFFFF000000000000 | *(unsigned int *)(v16 + 8) | ((unint64_t)*(unsigned __int16 *)(v16 + 12) << 32);
              if ((*((BOOL (**)(uint64_t, uint64_t, unint64_t, uint64_t, int, char, int))hasMatchWithCounts
                    + 2))((uint64_t)hasMatchWithCounts, v172, *(_QWORD *)v16, v17, 1, 0, 1))
              {
                break;
              }

              ++v12;
              v16 += 14;
              if (v80 == v12)
                goto LABEL_112;
            }
            v159 = 0;
            v145 = 0;
            v146 = 0;
            v156 = 0;
            v161 = 0;
            v162 = 0;
            v149 = 0;
            v150 = 0;
            v164 = 0;
            v165 = 0;
            v166 = 0;
            obj = 0;
            v152 = 0;
            v153 = 0;
            v168 = 0;
            v82 = 0;
            v16 = 0;
            v57 = 0;
            v151 = 0;
            v147 = 0;
            v148 = 0;
            v163 = 0;
            v160 = 0;
            v144 = 0;
            v155 = 0;
            v84 = v189[5];
            v189[5] = (id)v54;
LABEL_122:

            v12 = (unint64_t)v170;
            v86 = v153;
            v85 = v154;
            goto LABEL_239;
          }
        }
        else
        {
          v154 = 0;
        }
LABEL_112:
        SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x79uLL);
        v158 = (unint64_t *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v16 = (uint64_t)v158;
          v54 = v158;
          (*((void (**)(uint64_t, void *, void *, void *, _WORD *))updateMatchCounts + 2))((uint64_t)updateMatchCounts, v177, v21, (void *)v54, v180);
          if ((*((BOOL (**)(uint64_t, uint64_t, unint64_t, uint64_t, int, char, int))hasMatchWithCounts
                + 2))((uint64_t)hasMatchWithCounts, v172, v180[0], LODWORD(v180[1]) | ((unint64_t)WORD2(v180[1]) << 32), 1, 0, 1))
          {
            v155 = 0;
            v144 = 0;
            v145 = 0;
            v159 = 0;
            v160 = 0;
            v147 = 0;
            v148 = 0;
            v163 = 0;
            v164 = 0;
            v165 = 0;
            v166 = 0;
            v151 = 0;
            v152 = 0;
            v57 = 0;
            v153 = 0;
            v12 = 0;
            v81 = 0;
            v82 = 0;
            v168 = 0;
            v149 = 0;
            v150 = 0;
            v162 = 0;
            v156 = 0;
            v146 = 0;
            v83 = v189[5];
            v189[5] = (id)v54;
LABEL_128:
            v85 = v154;
LABEL_237:

            v161 = (id)v12;
            obj = v81;
            goto LABEL_238;
          }

        }
        SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0xCuLL);
        obj = (id)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v81 = obj;
          (*((void (**)(uint64_t, void *, void *, void *, _WORD *))updateMatchCounts + 2))((uint64_t)updateMatchCounts, v177, v21, v81, v178);
          if ((*((BOOL (**)(uint64_t, uint64_t, unint64_t, uint64_t, int, char, int))hasMatchWithCounts
                + 2))((uint64_t)hasMatchWithCounts, v172, v178[0], LODWORD(v178[1]) | ((unint64_t)WORD2(v178[1]) << 32), 1, 0, 1))
          {
            v155 = 0;
            v156 = 0;
            v144 = 0;
            v145 = 0;
            v159 = 0;
            v160 = 0;
            v147 = 0;
            v148 = 0;
            v163 = 0;
            v164 = 0;
            v165 = 0;
            v166 = 0;
            v151 = 0;
            v152 = 0;
            v57 = 0;
            v153 = 0;
            v12 = 0;
            v82 = 0;
            v168 = 0;
            v149 = 0;
            v150 = 0;
            v162 = 0;
            v146 = 0;
            v83 = v189[5];
            v189[5] = v81;
LABEL_127:
            v16 = (uint64_t)v158;
            goto LABEL_128;
          }

        }
        SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 6uLL);
        v161 = (id)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v12 = (unint64_t)v161;
          (*((void (**)(uint64_t, void *, void *, void *, _WORD *))updateMatchCounts + 2))((uint64_t)updateMatchCounts, v177, v21, (void *)v12, v179);
          if ((*((BOOL (**)(uint64_t, uint64_t, unint64_t, uint64_t, int, char, int))hasMatchWithCounts
                + 2))((uint64_t)hasMatchWithCounts, v172, v179[0], LODWORD(v179[1]) | ((unint64_t)WORD2(v179[1]) << 32), 1, 0, 1))
          {
            v155 = 0;
            v156 = 0;
            v144 = 0;
            v145 = 0;
            v159 = 0;
            v160 = 0;
            v147 = 0;
            v148 = 0;
            v163 = 0;
            v164 = 0;
            v165 = 0;
            v166 = 0;
            v151 = 0;
            v152 = 0;
            v57 = 0;
            v153 = 0;
            v82 = 0;
            v168 = 0;
            v149 = 0;
            v150 = 0;
            v162 = 0;
            v146 = 0;
            v83 = v189[5];
            v189[5] = (id)v12;
            v81 = obj;
            goto LABEL_127;
          }

        }
        SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x87uLL);
        v168 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v87 = objc_msgSend(v168, "count");
          v54 = 14 * v87;
          v16 = (uint64_t)malloc_type_malloc(14 * v87, 0x100004018756113uLL);
          bzero((void *)v16, 14 * v87);
          v143 = (unint64_t *)v16;
          if (v87)
          {
            v12 = 0;
            while (1)
            {
              objc_msgSend(v168, "objectAtIndex:", v12);
              v54 = objc_claimAutoreleasedReturnValue();
              (*((void (**)(uint64_t, void *, void *, void *, _WORD *))updateMatchCounts + 2))((uint64_t)updateMatchCounts, v177, v21, (void *)v54, (_WORD *)v16);
              v17 = v17 & 0xFFFF000000000000 | *(unsigned int *)(v16 + 8) | ((unint64_t)*(unsigned __int16 *)(v16 + 12) << 32);
              if ((*((BOOL (**)(uint64_t, uint64_t, unint64_t, uint64_t, int, char, int))hasMatchWithCounts
                    + 2))((uint64_t)hasMatchWithCounts, v172, *(_QWORD *)v16, v17, 1, 0, 1))
              {
                break;
              }

              ++v12;
              v16 += 14;
              if (v87 == v12)
                goto LABEL_137;
            }
            v155 = 0;
            v156 = 0;
            v144 = 0;
            v145 = 0;
            v159 = 0;
            v160 = 0;
            v147 = 0;
            v148 = 0;
            v163 = 0;
            v164 = 0;
            v165 = 0;
            v166 = 0;
            v151 = 0;
            v152 = 0;
            v57 = 0;
            v153 = 0;
            v149 = 0;
            v150 = 0;
            v162 = 0;
            v146 = 0;
            v83 = v189[5];
            v189[5] = (id)v54;
            v12 = (unint64_t)v161;
            v81 = obj;
            v16 = (uint64_t)v158;
            goto LABEL_236;
          }
        }
        else
        {
          v143 = 0;
        }
LABEL_137:
        SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x86uLL);
        v157 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v88 = objc_msgSend(v157, "count");
          v54 = 14 * v88;
          v16 = (uint64_t)malloc_type_malloc(14 * v88, 0x100004018756113uLL);
          bzero((void *)v16, 14 * v88);
          v153 = (void *)v16;
          if (v88)
          {
            v12 = 0;
            while (1)
            {
              objc_msgSend(v157, "objectAtIndex:", v12);
              v54 = objc_claimAutoreleasedReturnValue();
              (*((void (**)(uint64_t, void *, void *, void *, _WORD *))updateMatchCounts + 2))((uint64_t)updateMatchCounts, v177, v21, (void *)v54, (_WORD *)v16);
              v17 = v17 & 0xFFFF000000000000 | *(unsigned int *)(v16 + 8) | ((unint64_t)*(unsigned __int16 *)(v16 + 12) << 32);
              if ((*((BOOL (**)(uint64_t, uint64_t, unint64_t, uint64_t, int, char, int))hasMatchWithCounts
                    + 2))((uint64_t)hasMatchWithCounts, v172, *(_QWORD *)v16, v17, 1, 0, 1))
              {
                break;
              }

              ++v12;
              v16 += 14;
              if (v88 == v12)
                goto LABEL_144;
            }
            v155 = 0;
            v144 = 0;
            v160 = 0;
            v147 = 0;
            v148 = 0;
            v163 = 0;
            v165 = 0;
            v166 = 0;
            v151 = 0;
            v152 = 0;
            goto LABEL_211;
          }
        }
        else
        {
          v153 = 0;
        }
LABEL_144:
        SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x88uLL);
        v166 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v89 = objc_msgSend(v166, "count");
          v54 = 14 * v89;
          v16 = (uint64_t)malloc_type_malloc(14 * v89, 0x100004018756113uLL);
          bzero((void *)v16, 14 * v89);
          v152 = (unint64_t *)v16;
          if (v89)
          {
            v12 = 0;
            while (1)
            {
              objc_msgSend(v166, "objectAtIndex:", v12);
              v54 = objc_claimAutoreleasedReturnValue();
              (*((void (**)(uint64_t, void *, void *, void *, _WORD *))updateMatchCounts + 2))((uint64_t)updateMatchCounts, v177, v21, (void *)v54, (_WORD *)v16);
              v17 = v17 & 0xFFFF000000000000 | *(unsigned int *)(v16 + 8) | ((unint64_t)*(unsigned __int16 *)(v16 + 12) << 32);
              if ((*((BOOL (**)(uint64_t, uint64_t, unint64_t, uint64_t, int, char, int))hasMatchWithCounts
                    + 2))((uint64_t)hasMatchWithCounts, v172, *(_QWORD *)v16, v17, 1, 0, 1))
              {
                break;
              }

              ++v12;
              v16 += 14;
              if (v89 == v12)
                goto LABEL_151;
            }
            v155 = 0;
            v144 = 0;
            v160 = 0;
            v147 = 0;
            v148 = 0;
            v163 = 0;
            v165 = 0;
            v151 = 0;
LABEL_211:
            v149 = 0;
            v150 = 0;
            v164 = 0;
            v162 = 0;
            v145 = 0;
            v146 = 0;
            v156 = 0;
            v159 = 0;
            v83 = v189[5];
            v189[5] = (id)v54;
LABEL_232:
            v12 = (unint64_t)v161;
LABEL_233:
            v81 = obj;
LABEL_234:
            v21 = v175;
LABEL_235:
            v57 = v157;
            v16 = (uint64_t)v158;
LABEL_236:
            v85 = v154;
            v82 = v143;
            goto LABEL_237;
          }
        }
        else
        {
          v152 = 0;
        }
LABEL_151:
        SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x7FuLL);
        v165 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v90 = objc_msgSend(v165, "count");
          v54 = 14 * v90;
          v16 = (uint64_t)malloc_type_malloc(14 * v90, 0x100004018756113uLL);
          bzero((void *)v16, 14 * v90);
          v151 = (unint64_t *)v16;
          if (v90)
          {
            v12 = 0;
            v54 = (uint64_t)&_SpotlightDefineRankingTypes_[268];
            while (1)
            {
              objc_msgSend(v165, "objectAtIndex:", v12);
              v91 = (void *)objc_claimAutoreleasedReturnValue();
              (*((void (**)(uint64_t, void *, void *, void *, _WORD *))updateMatchCounts + 2))((uint64_t)updateMatchCounts, v177, v175, v91, (_WORD *)v16);
              v17 = v17 & 0xFFFF000000000000 | *(unsigned int *)(v16 + 8) | ((unint64_t)*(unsigned __int16 *)(v16 + 12) << 32);
              if ((*((BOOL (**)(uint64_t, uint64_t, unint64_t, uint64_t, int, char, int))hasMatchWithCounts
                    + 2))((uint64_t)hasMatchWithCounts, v172, *(_QWORD *)v16, v17, 1, 0, 1))
              {
                break;
              }

              ++v12;
              v16 += 14;
              if (v90 == v12)
                goto LABEL_161;
            }
            objc_storeStrong(v189 + 5, v91);
            v83 = v91;
            v155 = 0;
            v144 = 0;
            v160 = 0;
            v147 = 0;
            v148 = 0;
            v163 = 0;
            v164 = 0;
            v149 = 0;
            goto LABEL_229;
          }
        }
        else
        {
          v151 = 0;
        }
LABEL_161:
        SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x7DuLL);
        v164 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v93 = objc_msgSend(v164, "count");
          v54 = 14 * v93;
          v16 = (uint64_t)malloc_type_malloc(14 * v93, 0x100004018756113uLL);
          bzero((void *)v16, 14 * v93);
          v149 = (unint64_t *)v16;
          if (v93)
          {
            v12 = 0;
            v54 = (uint64_t)&_SpotlightDefineRankingTypes_[268];
            while (1)
            {
              objc_msgSend(v164, "objectAtIndex:", v12);
              v94 = (void *)objc_claimAutoreleasedReturnValue();
              (*((void (**)(uint64_t, void *, void *, void *, _WORD *))updateMatchCounts + 2))((uint64_t)updateMatchCounts, v177, v175, v94, (_WORD *)v16);
              v17 = v17 & 0xFFFF000000000000 | *(unsigned int *)(v16 + 8) | ((unint64_t)*(unsigned __int16 *)(v16 + 12) << 32);
              if ((*((BOOL (**)(uint64_t, uint64_t, unint64_t, uint64_t, int, char, int))hasMatchWithCounts
                    + 2))((uint64_t)hasMatchWithCounts, v172, *(_QWORD *)v16, v17, 1, 0, 1))
              {
                break;
              }

              ++v12;
              v16 += 14;
              if (v93 == v12)
                goto LABEL_169;
            }
            objc_storeStrong(v189 + 5, v94);
            v83 = v94;
            v155 = 0;
            v144 = 0;
            v160 = 0;
            v147 = 0;
            v148 = 0;
            v163 = 0;
            goto LABEL_229;
          }
        }
        else
        {
          v149 = 0;
        }
LABEL_169:
        SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x7AuLL);
        v163 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v97 = objc_msgSend(v163, "count");
          v54 = 14 * v97;
          v16 = (uint64_t)malloc_type_malloc(14 * v97, 0x100004018756113uLL);
          bzero((void *)v16, 14 * v97);
          v147 = (unint64_t *)v16;
          if (v97)
          {
            v12 = 0;
            v54 = (uint64_t)&_SpotlightDefineRankingTypes_[268];
            while (1)
            {
              objc_msgSend(v163, "objectAtIndex:", v12);
              v98 = (void *)objc_claimAutoreleasedReturnValue();
              (*((void (**)(uint64_t, void *, void *, void *, _WORD *))updateMatchCounts + 2))((uint64_t)updateMatchCounts, v177, v175, v98, (_WORD *)v16);
              v17 = v17 & 0xFFFF000000000000 | *(unsigned int *)(v16 + 8) | ((unint64_t)*(unsigned __int16 *)(v16 + 12) << 32);
              if ((*((BOOL (**)(uint64_t, uint64_t, unint64_t, uint64_t, int, char, int))hasMatchWithCounts
                    + 2))((uint64_t)hasMatchWithCounts, v172, *(_QWORD *)v16, v17, 1, 0, 1))
              {
                break;
              }

              ++v12;
              v16 += 14;
              if (v97 == v12)
                goto LABEL_176;
            }
            objc_storeStrong(v189 + 5, v98);
            v83 = v98;
            v155 = 0;
            v144 = 0;
            v160 = 0;
            v148 = 0;
LABEL_229:
            v150 = 0;
            v162 = 0;
LABEL_230:
            v145 = 0;
            v156 = 0;
LABEL_231:
            v146 = 0;
            v159 = 0;
            goto LABEL_232;
          }
        }
        else
        {
          v147 = 0;
        }
LABEL_176:
        SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x81uLL);
        v162 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v99 = objc_msgSend(v162, "count");
          v54 = 14 * v99;
          v16 = (uint64_t)malloc_type_malloc(14 * v99, 0x100004018756113uLL);
          bzero((void *)v16, 14 * v99);
          v150 = (unint64_t *)v16;
          if (v99)
          {
            v12 = 0;
            v54 = (uint64_t)&_SpotlightDefineRankingTypes_[268];
            while (1)
            {
              objc_msgSend(v162, "objectAtIndex:", v12);
              v100 = (void *)objc_claimAutoreleasedReturnValue();
              (*((void (**)(uint64_t, void *, void *, void *, _WORD *))updateMatchCounts + 2))((uint64_t)updateMatchCounts, v177, v175, v100, (_WORD *)v16);
              v17 = v17 & 0xFFFF000000000000 | *(unsigned int *)(v16 + 8) | ((unint64_t)*(unsigned __int16 *)(v16 + 12) << 32);
              if ((*((BOOL (**)(uint64_t, uint64_t, unint64_t, uint64_t, int, char, int))hasMatchWithCounts
                    + 2))((uint64_t)hasMatchWithCounts, v172, *(_QWORD *)v16, v17, 1, 0, 1))
              {
                break;
              }

              ++v12;
              v16 += 14;
              if (v99 == v12)
                goto LABEL_183;
            }
            objc_storeStrong(v189 + 5, v100);
            v83 = v100;
            v155 = 0;
            v144 = 0;
            v160 = 0;
            v148 = 0;
            goto LABEL_230;
          }
        }
        else
        {
          v150 = 0;
        }
LABEL_183:
        SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x85uLL);
        v160 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v101 = objc_msgSend(v160, "count");
          v54 = 14 * v101;
          v16 = (uint64_t)malloc_type_malloc(14 * v101, 0x100004018756113uLL);
          bzero((void *)v16, 14 * v101);
          v148 = (unint64_t *)v16;
          if (v101)
          {
            v12 = 0;
            v54 = (uint64_t)&_SpotlightDefineRankingTypes_[268];
            while (1)
            {
              objc_msgSend(v160, "objectAtIndex:", v12);
              v102 = (void *)objc_claimAutoreleasedReturnValue();
              (*((void (**)(uint64_t, void *, void *, void *, _WORD *))updateMatchCounts + 2))((uint64_t)updateMatchCounts, v177, v175, v102, (_WORD *)v16);
              v17 = v17 & 0xFFFF000000000000 | *(unsigned int *)(v16 + 8) | ((unint64_t)*(unsigned __int16 *)(v16 + 12) << 32);
              if ((*((BOOL (**)(uint64_t, uint64_t, unint64_t, uint64_t, int, char, int))hasMatchWithCounts
                    + 2))((uint64_t)hasMatchWithCounts, v172, *(_QWORD *)v16, v17, 1, 0, 1))
              {
                break;
              }

              ++v12;
              v16 += 14;
              if (v101 == v12)
                goto LABEL_194;
            }
            objc_storeStrong(v189 + 5, v102);
            v83 = v102;
            v155 = 0;
            v144 = 0;
            goto LABEL_230;
          }
        }
        else
        {
          v148 = 0;
        }
LABEL_194:
        SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x7EuLL);
        v156 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v104 = objc_msgSend(v156, "count");
          v54 = 14 * v104;
          v16 = (uint64_t)malloc_type_malloc(14 * v104, 0x100004018756113uLL);
          bzero((void *)v16, 14 * v104);
          v145 = (unint64_t *)v16;
          if (v104)
          {
            v12 = 0;
            v54 = (uint64_t)&_SpotlightDefineRankingTypes_[268];
            while (1)
            {
              objc_msgSend(v156, "objectAtIndex:", v12);
              v105 = (void *)objc_claimAutoreleasedReturnValue();
              (*((void (**)(uint64_t, void *, void *, void *, _WORD *))updateMatchCounts + 2))((uint64_t)updateMatchCounts, v177, v175, v105, (_WORD *)v16);
              v17 = v17 & 0xFFFF000000000000 | *(unsigned int *)(v16 + 8) | ((unint64_t)*(unsigned __int16 *)(v16 + 12) << 32);
              if ((*((BOOL (**)(uint64_t, uint64_t, unint64_t, uint64_t, int, char, int))hasMatchWithCounts
                    + 2))((uint64_t)hasMatchWithCounts, v172, *(_QWORD *)v16, v17, 1, 0, 1))
              {
                break;
              }

              ++v12;
              v16 += 14;
              if (v104 == v12)
                goto LABEL_202;
            }
            objc_storeStrong(v189 + 5, v105);
            v83 = v105;
            v155 = 0;
            v144 = 0;
            goto LABEL_231;
          }
        }
        else
        {
          v145 = 0;
        }
LABEL_202:
        SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x7BuLL);
        v155 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v106 = objc_msgSend(v155, "count");
          v54 = 14 * v106;
          v16 = (uint64_t)malloc_type_malloc(14 * v106, 0x100004018756113uLL);
          bzero((void *)v16, 14 * v106);
          v144 = (void *)v16;
          if (v106)
          {
            v12 = 0;
            v54 = (uint64_t)&_SpotlightDefineRankingTypes_[268];
            while (1)
            {
              objc_msgSend(v155, "objectAtIndex:", v12);
              v107 = (void *)objc_claimAutoreleasedReturnValue();
              (*((void (**)(uint64_t, void *, void *, void *, _WORD *))updateMatchCounts + 2))((uint64_t)updateMatchCounts, v177, v175, v107, (_WORD *)v16);
              v17 = v17 & 0xFFFF000000000000 | *(unsigned int *)(v16 + 8) | ((unint64_t)*(unsigned __int16 *)(v16 + 12) << 32);
              if ((*((BOOL (**)(uint64_t, uint64_t, unint64_t, uint64_t, int, char, int))hasMatchWithCounts
                    + 2))((uint64_t)hasMatchWithCounts, v172, *(_QWORD *)v16, v17, 1, 0, 1))
              {
                break;
              }

              ++v12;
              v16 += 14;
              if (v106 == v12)
                goto LABEL_213;
            }
            objc_storeStrong(v189 + 5, v107);
            v83 = v107;
            goto LABEL_231;
          }
        }
        else
        {
          v144 = 0;
        }
LABEL_213:
        SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x7CuLL);
        v159 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v108 = objc_msgSend(v159, "count");
          v54 = 14 * v108;
          v16 = (uint64_t)malloc_type_malloc(14 * v108, 0x100004018756113uLL);
          bzero((void *)v16, 14 * v108);
          v146 = (unint64_t *)v16;
          if (v108)
          {
            v12 = 0;
            v54 = (uint64_t)&_SpotlightDefineRankingTypes_[268];
            while (1)
            {
              objc_msgSend(v159, "objectAtIndex:", v12);
              v109 = (void *)objc_claimAutoreleasedReturnValue();
              (*((void (**)(uint64_t, void *, void *, void *, _WORD *))updateMatchCounts + 2))((uint64_t)updateMatchCounts, v177, v175, v109, (_WORD *)v16);
              v17 = v17 & 0xFFFF000000000000 | *(unsigned int *)(v16 + 8) | ((unint64_t)*(unsigned __int16 *)(v16 + 12) << 32);
              if ((*((BOOL (**)(uint64_t, uint64_t, unint64_t, uint64_t, int, char, int))hasMatchWithCounts
                    + 2))((uint64_t)hasMatchWithCounts, v172, *(_QWORD *)v16, v17, 1, 0, 1))
              {
                break;
              }

              ++v12;
              v16 += 14;
              if (v108 == v12)
                goto LABEL_221;
            }
LABEL_485:
            objc_storeStrong(v189 + 5, v109);
            v83 = v109;
            self->_topHitReason = 16;
            goto LABEL_232;
          }
        }
        else
        {
          v146 = 0;
        }
LABEL_221:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v142 = v170;
          if (!WORD6(v185))
            (*((void (**)(uint64_t, void *, void *, void *, _WORD *))updateMatchCounts + 2))((uint64_t)updateMatchCounts, v177, v175, v142, &v185);
          if ((*((BOOL (**)(uint64_t, uint64_t, unint64_t, uint64_t, int, char, int))hasMatchWithCounts
                + 2))((uint64_t)hasMatchWithCounts, v172, v185, DWORD2(v185) | ((unint64_t)WORD6(v185) << 32), 1, 1, 0))
          {
            v110 = v189 + 5;
            v111 = v170;
LABEL_226:
            objc_storeStrong(v110, v111);
            v12 = (unint64_t)v161;
            v81 = obj;
            v21 = v175;
            v16 = (uint64_t)v158;
LABEL_281:
            v85 = v154;
            v83 = v142;
            v82 = v143;
            v57 = v157;
            goto LABEL_237;
          }

        }
        objc_opt_class();
        v21 = v175;
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v12 = 0;
          v54 = (uint64_t)&_SpotlightDefineRankingTypes_[268];
          v17 = (uint64_t)v154;
          while (v12 < objc_msgSend(v169, "count", v142))
          {
            objc_msgSend(v169, "objectAtIndex:", v12);
            v84 = (id)objc_claimAutoreleasedReturnValue();
            if (!*(_WORD *)(v17 + 12))
              (*((void (**)(uint64_t, void *, void *, void *, _WORD *))updateMatchCounts + 2))((uint64_t)updateMatchCounts, v177, v175, v84, (_WORD *)v17);
            v16 = v16 & 0xFFFF000000000000 | *(unsigned int *)(v17 + 8) | ((unint64_t)*(unsigned __int16 *)(v17 + 12) << 32);
            if ((*((BOOL (**)(uint64_t, uint64_t, unint64_t, uint64_t, int, char, int))hasMatchWithCounts
                  + 2))((uint64_t)hasMatchWithCounts, v172, *(_QWORD *)v17, v16, 1, 1, 0))
            {
              objc_storeStrong(v189 + 5, v84);
LABEL_284:
              v57 = v157;
              v16 = (uint64_t)v158;
              v82 = v143;
              goto LABEL_122;
            }

            ++v12;
            v17 += 14;
          }
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v16 = (uint64_t)v158;
          v142 = v158;
          if (!WORD2(v180[1]))
            (*((void (**)(uint64_t, void *, void *, void *, _WORD *))updateMatchCounts + 2))((uint64_t)updateMatchCounts, v177, v175, v142, v180);
          if ((*((BOOL (**)(uint64_t, uint64_t, unint64_t, uint64_t, int, char, int))hasMatchWithCounts
                + 2))((uint64_t)hasMatchWithCounts, v172, v180[0], LODWORD(v180[1]) | ((unint64_t)WORD2(v180[1]) << 32), 1, 1, 0))
          {
            v112 = v189 + 5;
LABEL_280:
            objc_storeStrong(v112, (id)v16);
            v12 = (unint64_t)v161;
            v81 = obj;
            v21 = v175;
            goto LABEL_281;
          }

        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v113 = obj;
          if (!WORD2(v178[1]))
            (*((void (**)(uint64_t, void *, void *, void *, _WORD *))updateMatchCounts + 2))((uint64_t)updateMatchCounts, v177, v175, v113, v178);
          if ((*((BOOL (**)(uint64_t, uint64_t, unint64_t, uint64_t, int, char, int))hasMatchWithCounts
                + 2))((uint64_t)hasMatchWithCounts, v172, v178[0], LODWORD(v178[1]) | ((unint64_t)WORD2(v178[1]) << 32), 1, 1, 0))
          {
            goto LABEL_290;
          }

        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v114 = v161;
          if (!WORD2(v179[1]))
            (*((void (**)(uint64_t, void *, void *, void *, _WORD *))updateMatchCounts + 2))((uint64_t)updateMatchCounts, v177, v175, v114, v179);
          if ((*((BOOL (**)(uint64_t, uint64_t, unint64_t, uint64_t, int, char, int))hasMatchWithCounts
                + 2))((uint64_t)hasMatchWithCounts, v172, v179[0], LODWORD(v179[1]) | ((unint64_t)WORD2(v179[1]) << 32), 1, 1, 0))
          {
            objc_storeStrong(v189 + 5, v161);
            v83 = v114;
            v12 = (unint64_t)v114;
            goto LABEL_233;
          }

        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && (v142 = (unint64_t *)objc_msgSend(v168, "count"), v21 = v175, v142))
        {
          v115 = 0;
          v17 = (uint64_t)&_SpotlightDefineRankingTypes_[268];
          v16 = (uint64_t)v143;
          while (1)
          {
            objc_msgSend(v168, "objectAtIndex:", v115, v142);
            v12 = objc_claimAutoreleasedReturnValue();
            if (!*(_WORD *)(v16 + 12))
              (*((void (**)(uint64_t, void *, void *, void *, _WORD *))updateMatchCounts + 2))((uint64_t)updateMatchCounts, v177, v175, (void *)v12, (_WORD *)v16);
            v54 = v54 & 0xFFFF000000000000 | *(unsigned int *)(v16 + 8) | ((unint64_t)*(unsigned __int16 *)(v16 + 12) << 32);
            if ((*((BOOL (**)(uint64_t, uint64_t, unint64_t, uint64_t, int, char, int))hasMatchWithCounts
                  + 2))((uint64_t)hasMatchWithCounts, v172, *(_QWORD *)v16, v54, 1, 1, 0))
            {
              break;
            }

            v115 = (unint64_t *)((char *)v115 + 1);
            v16 += 14;
            if (v142 == v115)
              goto LABEL_305;
          }
        }
        else
        {
LABEL_305:
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0
            && (v142 = (unint64_t *)objc_msgSend(v157, "count"), v21 = v175, v142))
          {
            v116 = 0;
            v17 = (uint64_t)&_SpotlightDefineRankingTypes_[268];
            v16 = (uint64_t)v153;
            while (1)
            {
              objc_msgSend(v157, "objectAtIndex:", v116, v142);
              v12 = objc_claimAutoreleasedReturnValue();
              if (!*(_WORD *)(v16 + 12))
                (*((void (**)(uint64_t, void *, void *, void *, _WORD *))updateMatchCounts + 2))((uint64_t)updateMatchCounts, v177, v175, (void *)v12, (_WORD *)v16);
              v54 = v54 & 0xFFFF000000000000 | *(unsigned int *)(v16 + 8) | ((unint64_t)*(unsigned __int16 *)(v16 + 12) << 32);
              if ((*((BOOL (**)(uint64_t, uint64_t, unint64_t, uint64_t, int, char, int))hasMatchWithCounts
                    + 2))((uint64_t)hasMatchWithCounts, v172, *(_QWORD *)v16, v54, 1, 1, 0))
              {
                break;
              }

              v116 = (unint64_t *)((char *)v116 + 1);
              v16 += 14;
              if (v142 == v116)
                goto LABEL_312;
            }
          }
          else
          {
LABEL_312:
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0
              && (v142 = (unint64_t *)objc_msgSend(v166, "count"), v21 = v175, v142))
            {
              v117 = 0;
              v17 = (uint64_t)&_SpotlightDefineRankingTypes_[268];
              v16 = (uint64_t)v152;
              while (1)
              {
                objc_msgSend(v166, "objectAtIndex:", v117, v142);
                v12 = objc_claimAutoreleasedReturnValue();
                if (!*(_WORD *)(v16 + 12))
                  (*((void (**)(uint64_t, void *, void *, void *, _WORD *))updateMatchCounts + 2))((uint64_t)updateMatchCounts, v177, v175, (void *)v12, (_WORD *)v16);
                v54 = v54 & 0xFFFF000000000000 | *(unsigned int *)(v16 + 8) | ((unint64_t)*(unsigned __int16 *)(v16 + 12) << 32);
                if ((*((BOOL (**)(uint64_t, uint64_t, unint64_t, uint64_t, int, char, int))hasMatchWithCounts
                      + 2))((uint64_t)hasMatchWithCounts, v172, *(_QWORD *)v16, v54, 1, 1, 0))
                {
                  break;
                }

                v117 = (unint64_t *)((char *)v117 + 1);
                v16 += 14;
                if (v142 == v117)
                  goto LABEL_319;
              }
            }
            else
            {
LABEL_319:
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0
                && (v142 = (unint64_t *)objc_msgSend(v165, "count"), v21 = v175, v142))
              {
                v118 = 0;
                v17 = (uint64_t)&_SpotlightDefineRankingTypes_[268];
                v16 = (uint64_t)v151;
                while (1)
                {
                  objc_msgSend(v165, "objectAtIndex:", v118, v142);
                  v12 = objc_claimAutoreleasedReturnValue();
                  if (!*(_WORD *)(v16 + 12))
                    (*((void (**)(uint64_t, void *, void *, void *, _WORD *))updateMatchCounts + 2))((uint64_t)updateMatchCounts, v177, v175, (void *)v12, (_WORD *)v16);
                  v54 = v54 & 0xFFFF000000000000 | *(unsigned int *)(v16 + 8) | ((unint64_t)*(unsigned __int16 *)(v16 + 12) << 32);
                  if ((*((BOOL (**)(uint64_t, uint64_t, unint64_t, uint64_t, int, char, int))hasMatchWithCounts
                        + 2))((uint64_t)hasMatchWithCounts, v172, *(_QWORD *)v16, v54, 1, 1, 0))
                  {
                    break;
                  }

                  v118 = (unint64_t *)((char *)v118 + 1);
                  v16 += 14;
                  if (v142 == v118)
                    goto LABEL_326;
                }
              }
              else
              {
LABEL_326:
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0
                  && (v142 = (unint64_t *)objc_msgSend(v164, "count"), v21 = v175, v142))
                {
                  v119 = 0;
                  v17 = (uint64_t)&_SpotlightDefineRankingTypes_[268];
                  v16 = (uint64_t)v149;
                  while (1)
                  {
                    objc_msgSend(v164, "objectAtIndex:", v119, v142);
                    v12 = objc_claimAutoreleasedReturnValue();
                    if (!*(_WORD *)(v16 + 12))
                      (*((void (**)(uint64_t, void *, void *, void *, _WORD *))updateMatchCounts + 2))((uint64_t)updateMatchCounts, v177, v175, (void *)v12, (_WORD *)v16);
                    v54 = v54 & 0xFFFF000000000000 | *(unsigned int *)(v16 + 8) | ((unint64_t)*(unsigned __int16 *)(v16 + 12) << 32);
                    if ((*((BOOL (**)(uint64_t, uint64_t, unint64_t, uint64_t, int, char, int))hasMatchWithCounts
                          + 2))((uint64_t)hasMatchWithCounts, v172, *(_QWORD *)v16, v54, 1, 1, 0))
                    {
                      break;
                    }

                    v119 = (unint64_t *)((char *)v119 + 1);
                    v16 += 14;
                    if (v142 == v119)
                      goto LABEL_333;
                  }
                }
                else
                {
LABEL_333:
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0
                    || (v142 = (unint64_t *)objc_msgSend(v163, "count"), v21 = v175, !v142))
                  {
LABEL_340:
                    objc_opt_class();
                    v21 = v175;
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v121 = 0;
                      v17 = (uint64_t)&_SpotlightDefineRankingTypes_[268];
                      v122 = v150;
                      while (v121 < objc_msgSend(v162, "count", v142))
                      {
                        objc_msgSend(v162, "objectAtIndex:", v121);
                        v12 = objc_claimAutoreleasedReturnValue();
                        if (!*((_WORD *)v122 + 6))
                          (*((void (**)(uint64_t, void *, void *, void *, _WORD *))updateMatchCounts + 2))((uint64_t)updateMatchCounts, v177, v175, (void *)v12, v122);
                        v16 = v16 & 0xFFFF000000000000 | *((unsigned int *)v122 + 2) | ((unint64_t)*((unsigned __int16 *)v122 + 6) << 32);
                        if ((*((BOOL (**)(uint64_t, uint64_t, unint64_t, uint64_t, int, char, int))hasMatchWithCounts
                              + 2))((uint64_t)hasMatchWithCounts, v172, *v122, v16, 1, 1, 0))
                        {
                          goto LABEL_354;
                        }

                        ++v121;
                        v122 = (unint64_t *)((char *)v122 + 14);
                      }
                    }
                    objc_opt_class();
                    v21 = v175;
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v123 = 0;
                      v17 = (uint64_t)&_SpotlightDefineRankingTypes_[268];
                      v124 = v148;
                      while (v123 < objc_msgSend(v160, "count", v142))
                      {
                        objc_msgSend(v160, "objectAtIndex:", v123);
                        v12 = objc_claimAutoreleasedReturnValue();
                        if (!*((_WORD *)v124 + 6))
                          (*((void (**)(uint64_t, void *, void *, void *, _WORD *))updateMatchCounts + 2))((uint64_t)updateMatchCounts, v177, v175, (void *)v12, v124);
                        v16 = v16 & 0xFFFF000000000000 | *((unsigned int *)v124 + 2) | ((unint64_t)*((unsigned __int16 *)v124 + 6) << 32);
                        if ((*((BOOL (**)(uint64_t, uint64_t, unint64_t, uint64_t, int, char, int))hasMatchWithCounts
                              + 2))((uint64_t)hasMatchWithCounts, v172, *v124, v16, 1, 1, 0))
                        {
                          goto LABEL_354;
                        }

                        ++v123;
                        v124 = (unint64_t *)((char *)v124 + 14);
                      }
                    }
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0
                      && (v142 = (unint64_t *)objc_msgSend(v156, "count")) != 0)
                    {
                      v125 = 0;
                      v17 = (uint64_t)&_SpotlightDefineRankingTypes_[268];
                      v16 = (uint64_t)v145;
                      while (1)
                      {
                        objc_msgSend(v156, "objectAtIndex:", v125, v142);
                        v126 = (void *)objc_claimAutoreleasedReturnValue();
                        if (!*(_WORD *)(v16 + 12))
                          (*((void (**)(uint64_t, void *, void *, void *, _WORD *))updateMatchCounts + 2))((uint64_t)updateMatchCounts, v177, v175, v126, (_WORD *)v16);
                        v12 = v12 & 0xFFFF000000000000 | *(unsigned int *)(v16 + 8) | ((unint64_t)*(unsigned __int16 *)(v16 + 12) << 32);
                        if ((*((BOOL (**)(uint64_t, uint64_t, unint64_t, uint64_t, int, char, int))hasMatchWithCounts
                              + 2))((uint64_t)hasMatchWithCounts, v172, *(_QWORD *)v16, v12, 1, 1, 0))
                        {
                          break;
                        }

                        v125 = (unint64_t *)((char *)v125 + 1);
                        v16 += 14;
                        if (v142 == v125)
                          goto LABEL_362;
                      }
                    }
                    else
                    {
LABEL_362:
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) == 0
                        || (v142 = (unint64_t *)objc_msgSend(v155, "count")) == 0)
                      {
LABEL_369:
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0)
                        {
                          v12 = 0;
                          v17 = (uint64_t)&_SpotlightDefineRankingTypes_[268];
                          v128 = v146;
                          while (v12 < objc_msgSend(v159, "count", v142))
                          {
                            objc_msgSend(v159, "objectAtIndex:", v12);
                            v109 = (void *)objc_claimAutoreleasedReturnValue();
                            if (!*((_WORD *)v128 + 6))
                              (*((void (**)(uint64_t, void *, void *, void *, _WORD *))updateMatchCounts + 2))((uint64_t)updateMatchCounts, v177, v175, v109, v128);
                            v16 = v16 & 0xFFFF000000000000 | *((unsigned int *)v128 + 2) | ((unint64_t)*((unsigned __int16 *)v128 + 6) << 32);
                            if ((*((BOOL (**)(uint64_t, uint64_t, unint64_t, uint64_t, int, char, int))hasMatchWithCounts
                                  + 2))((uint64_t)hasMatchWithCounts, v172, *v128, v16, 1, 1, 0))
                            {
                              goto LABEL_485;
                            }

                            ++v12;
                            v128 = (unint64_t *)((char *)v128 + 14);
                          }
                        }
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0)
                        {
                          v142 = v170;
                          if (!WORD6(v185))
                            (*((void (**)(uint64_t, void *, void *, void *, _WORD *))updateMatchCounts + 2))((uint64_t)updateMatchCounts, v177, v175, v142, &v185);
                          if ((*((unsigned int (**)(uint64_t, uint64_t, uint64_t, int))hasAsTypedMatchWithCounts
                                + 2))((uint64_t)hasAsTypedMatchWithCounts, v172, v185, SDWORD2(v185)))
                          {
                            v110 = v189 + 5;
                            v111 = v170;
                            goto LABEL_226;
                          }

                        }
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0)
                        {
                          v12 = 0;
                          v16 = (uint64_t)v154;
                          while (v12 < objc_msgSend(v169, "count", v142))
                          {
                            objc_msgSend(v169, "objectAtIndex:", v12);
                            v84 = (id)objc_claimAutoreleasedReturnValue();
                            if (!*(_WORD *)(v16 + 12))
                              (*((void (**)(uint64_t, void *, void *, void *, _WORD *))updateMatchCounts + 2))((uint64_t)updateMatchCounts, v177, v175, v84, (_WORD *)v16);
                            v17 = v17 & 0xFFFF000000000000 | *(unsigned int *)(v16 + 8) | ((unint64_t)*(unsigned __int16 *)(v16 + 12) << 32);
                            if ((*((unsigned int (**)(uint64_t, uint64_t, uint64_t, int))hasAsTypedMatchWithCounts
                                  + 2))((uint64_t)hasAsTypedMatchWithCounts, v172, *(_QWORD *)v16, v17))
                            {
                              objc_storeStrong(v189 + 5, v84);
                              v21 = v175;
                              goto LABEL_284;
                            }

                            ++v12;
                            v16 += 14;
                          }
                        }
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0)
                        {
                          v142 = v158;
                          if (!WORD2(v180[1]))
                            (*((void (**)(uint64_t, void *, void *, void *, _WORD *))updateMatchCounts + 2))((uint64_t)updateMatchCounts, v177, v175, v142, v180);
                          if ((*((unsigned int (**)(uint64_t, uint64_t, uint64_t, int))hasAsTypedMatchWithCounts
                                + 2))((uint64_t)hasAsTypedMatchWithCounts, v172, v180[0], v180[1]))
                          {
                            v112 = v189 + 5;
                            v16 = (uint64_t)v158;
                            goto LABEL_280;
                          }

                        }
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0)
                        {
                          v113 = obj;
                          if (!WORD2(v178[1]))
                            (*((void (**)(uint64_t, void *, void *, void *, _WORD *))updateMatchCounts + 2))((uint64_t)updateMatchCounts, v177, v175, v113, v178);
                          if ((*((unsigned int (**)(uint64_t, uint64_t, uint64_t, int))hasAsTypedMatchWithCounts
                                + 2))((uint64_t)hasAsTypedMatchWithCounts, v172, v178[0], v178[1]))
                          {
LABEL_290:
                            objc_storeStrong(v189 + 5, obj);
                            v12 = (unint64_t)v161;
                            v83 = v113;
                            v81 = v113;
                            goto LABEL_234;
                          }

                        }
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0)
                        {
                          v12 = (unint64_t)v161;
                          if (!WORD2(v179[1]))
                            (*((void (**)(uint64_t, void *, void *, void *, _WORD *))updateMatchCounts + 2))((uint64_t)updateMatchCounts, v177, v175, (void *)v12, v179);
                          if ((*((unsigned int (**)(uint64_t, uint64_t, uint64_t, int))hasAsTypedMatchWithCounts
                                + 2))((uint64_t)hasAsTypedMatchWithCounts, v172, v179[0], v179[1]))
                          {
                            objc_storeStrong(v189 + 5, v161);
                            v83 = (id)v12;
                            goto LABEL_233;
                          }

                        }
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0
                          && (v142 = (unint64_t *)objc_msgSend(v168, "count")) != 0)
                        {
                          v129 = 0;
                          v16 = (uint64_t)v143;
                          while (1)
                          {
                            objc_msgSend(v168, "objectAtIndex:", v129, v142);
                            v130 = (void *)objc_claimAutoreleasedReturnValue();
                            if (!*(_WORD *)(v16 + 12))
                              (*((void (**)(uint64_t, void *, void *, void *, _WORD *))updateMatchCounts + 2))((uint64_t)updateMatchCounts, v177, v175, v130, (_WORD *)v16);
                            v12 = v12 & 0xFFFF000000000000 | *(unsigned int *)(v16 + 8) | ((unint64_t)*(unsigned __int16 *)(v16 + 12) << 32);
                            if ((*((unsigned int (**)(uint64_t, uint64_t, uint64_t, int))hasAsTypedMatchWithCounts
                                  + 2))((uint64_t)hasAsTypedMatchWithCounts, v172, *(_QWORD *)v16, v12))
                            {
                              break;
                            }

                            v129 = (unint64_t *)((char *)v129 + 1);
                            v16 += 14;
                            if (v142 == v129)
                              goto LABEL_414;
                          }
                        }
                        else
                        {
LABEL_414:
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) != 0
                            && (v142 = (unint64_t *)objc_msgSend(v157, "count")) != 0)
                          {
                            v131 = 0;
                            v16 = (uint64_t)v153;
                            while (1)
                            {
                              objc_msgSend(v157, "objectAtIndex:", v131, v142);
                              v130 = (void *)objc_claimAutoreleasedReturnValue();
                              if (!*(_WORD *)(v16 + 12))
                                (*((void (**)(uint64_t, void *, void *, void *, _WORD *))updateMatchCounts + 2))((uint64_t)updateMatchCounts, v177, v175, v130, (_WORD *)v16);
                              v12 = v12 & 0xFFFF000000000000 | *(unsigned int *)(v16 + 8) | ((unint64_t)*(unsigned __int16 *)(v16 + 12) << 32);
                              if ((*((unsigned int (**)(uint64_t, uint64_t, uint64_t, int))hasAsTypedMatchWithCounts
                                    + 2))((uint64_t)hasAsTypedMatchWithCounts, v172, *(_QWORD *)v16, v12))
                              {
                                break;
                              }

                              v131 = (unint64_t *)((char *)v131 + 1);
                              v16 += 14;
                              if (v142 == v131)
                                goto LABEL_421;
                            }
                          }
                          else
                          {
LABEL_421:
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) != 0
                              && (v142 = (unint64_t *)objc_msgSend(v166, "count")) != 0)
                            {
                              v132 = 0;
                              v16 = (uint64_t)v152;
                              while (1)
                              {
                                objc_msgSend(v166, "objectAtIndex:", v132, v142);
                                v130 = (void *)objc_claimAutoreleasedReturnValue();
                                if (!*(_WORD *)(v16 + 12))
                                  (*((void (**)(uint64_t, void *, void *, void *, _WORD *))updateMatchCounts
                                   + 2))((uint64_t)updateMatchCounts, v177, v175, v130, (_WORD *)v16);
                                v12 = v12 & 0xFFFF000000000000 | *(unsigned int *)(v16 + 8) | ((unint64_t)*(unsigned __int16 *)(v16 + 12) << 32);
                                if ((*((unsigned int (**)(uint64_t, uint64_t, uint64_t, int))hasAsTypedMatchWithCounts
                                      + 2))((uint64_t)hasAsTypedMatchWithCounts, v172, *(_QWORD *)v16, v12))
                                {
                                  break;
                                }

                                v132 = (unint64_t *)((char *)v132 + 1);
                                v16 += 14;
                                if (v142 == v132)
                                  goto LABEL_428;
                              }
                            }
                            else
                            {
LABEL_428:
                              objc_opt_class();
                              if ((objc_opt_isKindOfClass() & 1) != 0
                                && (v142 = (unint64_t *)objc_msgSend(v165, "count")) != 0)
                              {
                                v133 = 0;
                                v16 = (uint64_t)v151;
                                while (1)
                                {
                                  objc_msgSend(v165, "objectAtIndex:", v133, v142);
                                  v130 = (void *)objc_claimAutoreleasedReturnValue();
                                  if (!*(_WORD *)(v16 + 12))
                                    (*((void (**)(uint64_t, void *, void *, void *, _WORD *))updateMatchCounts
                                     + 2))((uint64_t)updateMatchCounts, v177, v175, v130, (_WORD *)v16);
                                  v12 = v12 & 0xFFFF000000000000 | *(unsigned int *)(v16 + 8) | ((unint64_t)*(unsigned __int16 *)(v16 + 12) << 32);
                                  if ((*((unsigned int (**)(uint64_t, uint64_t, uint64_t, int))hasAsTypedMatchWithCounts
                                        + 2))((uint64_t)hasAsTypedMatchWithCounts, v172, *(_QWORD *)v16, v12))
                                  {
                                    break;
                                  }

                                  v133 = (unint64_t *)((char *)v133 + 1);
                                  v16 += 14;
                                  if (v142 == v133)
                                    goto LABEL_435;
                                }
                              }
                              else
                              {
LABEL_435:
                                objc_opt_class();
                                if ((objc_opt_isKindOfClass() & 1) != 0
                                  && (v142 = (unint64_t *)objc_msgSend(v164, "count")) != 0)
                                {
                                  v134 = 0;
                                  v16 = (uint64_t)v149;
                                  while (1)
                                  {
                                    objc_msgSend(v164, "objectAtIndex:", v134, v142);
                                    v130 = (void *)objc_claimAutoreleasedReturnValue();
                                    if (!*(_WORD *)(v16 + 12))
                                      (*((void (**)(uint64_t, void *, void *, void *, _WORD *))updateMatchCounts
                                       + 2))((uint64_t)updateMatchCounts, v177, v175, v130, (_WORD *)v16);
                                    v12 = v12 & 0xFFFF000000000000 | *(unsigned int *)(v16 + 8) | ((unint64_t)*(unsigned __int16 *)(v16 + 12) << 32);
                                    if ((*((unsigned int (**)(uint64_t, uint64_t, uint64_t, int))hasAsTypedMatchWithCounts
                                          + 2))((uint64_t)hasAsTypedMatchWithCounts, v172, *(_QWORD *)v16, v12))
                                    {
                                      break;
                                    }

                                    v134 = (unint64_t *)((char *)v134 + 1);
                                    v16 += 14;
                                    if (v142 == v134)
                                      goto LABEL_442;
                                  }
                                }
                                else
                                {
LABEL_442:
                                  objc_opt_class();
                                  if ((objc_opt_isKindOfClass() & 1) != 0
                                    && (v142 = (unint64_t *)objc_msgSend(v163, "count")) != 0)
                                  {
                                    v135 = 0;
                                    v16 = (uint64_t)v147;
                                    while (1)
                                    {
                                      objc_msgSend(v163, "objectAtIndex:", v135, v142);
                                      v130 = (void *)objc_claimAutoreleasedReturnValue();
                                      if (!*(_WORD *)(v16 + 12))
                                        (*((void (**)(uint64_t, void *, void *, void *, _WORD *))updateMatchCounts
                                         + 2))((uint64_t)updateMatchCounts, v177, v175, v130, (_WORD *)v16);
                                      v12 = v12 & 0xFFFF000000000000 | *(unsigned int *)(v16 + 8) | ((unint64_t)*(unsigned __int16 *)(v16 + 12) << 32);
                                      if ((*((unsigned int (**)(uint64_t, uint64_t, uint64_t, int))hasAsTypedMatchWithCounts
                                            + 2))((uint64_t)hasAsTypedMatchWithCounts, v172, *(_QWORD *)v16, v12))
                                      {
                                        break;
                                      }

                                      v135 = (unint64_t *)((char *)v135 + 1);
                                      v16 += 14;
                                      if (v142 == v135)
                                        goto LABEL_449;
                                    }
                                  }
                                  else
                                  {
LABEL_449:
                                    objc_opt_class();
                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                    {
                                      v12 = 0;
                                      v136 = (uint64_t *)v150;
                                      while (v12 < objc_msgSend(v162, "count", v142))
                                      {
                                        objc_msgSend(v162, "objectAtIndex:", v12);
                                        v126 = (void *)objc_claimAutoreleasedReturnValue();
                                        if (!*((_WORD *)v136 + 6))
                                          (*((void (**)(uint64_t, void *, void *, void *, _WORD *))updateMatchCounts
                                           + 2))((uint64_t)updateMatchCounts, v177, v175, v126, v136);
                                        v16 = v16 & 0xFFFF000000000000 | *((unsigned int *)v136 + 2) | ((unint64_t)*((unsigned __int16 *)v136 + 6) << 32);
                                        if ((*((unsigned int (**)(uint64_t, uint64_t, uint64_t, int))hasAsTypedMatchWithCounts
                                              + 2))((uint64_t)hasAsTypedMatchWithCounts, v172, *v136, v16))
                                        {
                                          goto LABEL_463;
                                        }

                                        ++v12;
                                        v136 = (uint64_t *)((char *)v136 + 14);
                                      }
                                    }
                                    objc_opt_class();
                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                    {
                                      v12 = 0;
                                      v137 = (uint64_t *)v148;
                                      while (v12 < objc_msgSend(v160, "count", v142))
                                      {
                                        objc_msgSend(v160, "objectAtIndex:", v12);
                                        v126 = (void *)objc_claimAutoreleasedReturnValue();
                                        if (!*((_WORD *)v137 + 6))
                                          (*((void (**)(uint64_t, void *, void *, void *, _WORD *))updateMatchCounts
                                           + 2))((uint64_t)updateMatchCounts, v177, v175, v126, v137);
                                        v16 = v16 & 0xFFFF000000000000 | *((unsigned int *)v137 + 2) | ((unint64_t)*((unsigned __int16 *)v137 + 6) << 32);
                                        if ((*((unsigned int (**)(uint64_t, uint64_t, uint64_t, int))hasAsTypedMatchWithCounts
                                              + 2))((uint64_t)hasAsTypedMatchWithCounts, v172, *v137, v16))
                                        {
                                          goto LABEL_463;
                                        }

                                        ++v12;
                                        v137 = (uint64_t *)((char *)v137 + 14);
                                      }
                                    }
                                    objc_opt_class();
                                    if ((objc_opt_isKindOfClass() & 1) != 0
                                      && (v142 = (unint64_t *)objc_msgSend(v156, "count")) != 0)
                                    {
                                      v138 = 0;
                                      v16 = (uint64_t)v145;
                                      while (1)
                                      {
                                        objc_msgSend(v156, "objectAtIndex:", v138, v142);
                                        v130 = (void *)objc_claimAutoreleasedReturnValue();
                                        if (!*(_WORD *)(v16 + 12))
                                          (*((void (**)(uint64_t, void *, void *, void *, _WORD *))updateMatchCounts
                                           + 2))((uint64_t)updateMatchCounts, v177, v175, v130, (_WORD *)v16);
                                        v12 = v12 & 0xFFFF000000000000 | *(unsigned int *)(v16 + 8) | ((unint64_t)*(unsigned __int16 *)(v16 + 12) << 32);
                                        if ((*((unsigned int (**)(uint64_t, uint64_t, uint64_t, int))hasAsTypedMatchWithCounts
                                              + 2))((uint64_t)hasAsTypedMatchWithCounts, v172, *(_QWORD *)v16, v12))
                                        {
                                          break;
                                        }

                                        v138 = (unint64_t *)((char *)v138 + 1);
                                        v16 += 14;
                                        if (v142 == v138)
                                          goto LABEL_471;
                                      }
                                    }
                                    else
                                    {
LABEL_471:
                                      objc_opt_class();
                                      if ((objc_opt_isKindOfClass() & 1) == 0
                                        || (v142 = (unint64_t *)objc_msgSend(v155, "count")) == 0)
                                      {
LABEL_478:
                                        objc_opt_class();
                                        if ((objc_opt_isKindOfClass() & 1) != 0)
                                        {
                                          v140 = 0;
                                          v141 = (uint64_t *)v146;
                                          while (v140 < objc_msgSend(v159, "count", v142))
                                          {
                                            objc_msgSend(v159, "objectAtIndex:", v140);
                                            v109 = (void *)objc_claimAutoreleasedReturnValue();
                                            if (!*((_WORD *)v141 + 6))
                                              (*((void (**)(uint64_t, void *, void *, void *, _WORD *))updateMatchCounts
                                               + 2))((uint64_t)updateMatchCounts, v177, v175, v109, v141);
                                            v16 = v16 & 0xFFFF000000000000 | *((unsigned int *)v141 + 2) | ((unint64_t)*((unsigned __int16 *)v141 + 6) << 32);
                                            if ((*((unsigned int (**)(uint64_t, uint64_t, uint64_t, int))hasAsTypedMatchWithCounts
                                                  + 2))((uint64_t)hasAsTypedMatchWithCounts, v172, *v141, v16))
                                            {
                                              goto LABEL_485;
                                            }

                                            ++v140;
                                            v141 = (uint64_t *)((char *)v141 + 14);
                                          }
                                        }
                                        v21 = v175;
                                        v57 = v157;
                                        v16 = (uint64_t)v158;
                                        v85 = v154;
                                        v82 = v143;
LABEL_238:
                                        v12 = (unint64_t)v170;
                                        v86 = v153;
                                        if (!v85)
                                        {
LABEL_240:
                                          if (v150)
                                            free(v150);
                                          v58 = v161;
                                          if (v148)
                                            free(v148);
                                          if (v146)
                                            free(v146);
                                          if (v147)
                                            free(v147);
                                          if (v144)
                                            free(v144);
                                          if (v149)
                                            free(v149);
                                          if (v145)
                                            free(v145);
                                          if (v151)
                                            free(v151);
                                          if (v86)
                                            free(v86);
                                          if (v82)
                                            free(v82);
                                          v59 = v156;
                                          if (v152)
                                            free(v152);
                                          v56 = v155;

                                          goto LABEL_263;
                                        }
LABEL_239:
                                        free(v85);
                                        goto LABEL_240;
                                      }
                                      v139 = 0;
                                      v16 = (uint64_t)v144;
                                      while (1)
                                      {
                                        objc_msgSend(v155, "objectAtIndex:", v139, v142);
                                        v130 = (void *)objc_claimAutoreleasedReturnValue();
                                        if (!*(_WORD *)(v16 + 12))
                                          (*((void (**)(uint64_t, void *, void *, void *, _WORD *))updateMatchCounts
                                           + 2))((uint64_t)updateMatchCounts, v177, v175, v130, (_WORD *)v16);
                                        v12 = v12 & 0xFFFF000000000000 | *(unsigned int *)(v16 + 8) | ((unint64_t)*(unsigned __int16 *)(v16 + 12) << 32);
                                        if ((*((unsigned int (**)(uint64_t, uint64_t, uint64_t, int))hasAsTypedMatchWithCounts
                                              + 2))((uint64_t)hasAsTypedMatchWithCounts, v172, *(_QWORD *)v16, v12))
                                        {
                                          break;
                                        }

                                        v139 = (unint64_t *)((char *)v139 + 1);
                                        v16 += 14;
                                        if (v142 == v139)
                                          goto LABEL_478;
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                        objc_storeStrong(v189 + 5, v130);
                        v83 = v130;
                        goto LABEL_232;
                      }
                      v127 = 0;
                      v17 = (uint64_t)&_SpotlightDefineRankingTypes_[268];
                      v16 = (uint64_t)v144;
                      while (1)
                      {
                        objc_msgSend(v155, "objectAtIndex:", v127, v142);
                        v126 = (void *)objc_claimAutoreleasedReturnValue();
                        if (!*(_WORD *)(v16 + 12))
                          (*((void (**)(uint64_t, void *, void *, void *, _WORD *))updateMatchCounts + 2))((uint64_t)updateMatchCounts, v177, v175, v126, (_WORD *)v16);
                        v12 = v12 & 0xFFFF000000000000 | *(unsigned int *)(v16 + 8) | ((unint64_t)*(unsigned __int16 *)(v16 + 12) << 32);
                        if ((*((BOOL (**)(uint64_t, uint64_t, unint64_t, uint64_t, int, char, int))hasMatchWithCounts
                              + 2))((uint64_t)hasMatchWithCounts, v172, *(_QWORD *)v16, v12, 1, 1, 0))
                        {
                          break;
                        }

                        v127 = (unint64_t *)((char *)v127 + 1);
                        v16 += 14;
                        if (v142 == v127)
                          goto LABEL_369;
                      }
                    }
LABEL_463:
                    objc_storeStrong(v189 + 5, v126);
                    v83 = v126;
                    goto LABEL_232;
                  }
                  v120 = 0;
                  v17 = (uint64_t)&_SpotlightDefineRankingTypes_[268];
                  v16 = (uint64_t)v147;
                  while (1)
                  {
                    objc_msgSend(v163, "objectAtIndex:", v120, v142);
                    v12 = objc_claimAutoreleasedReturnValue();
                    if (!*(_WORD *)(v16 + 12))
                      (*((void (**)(uint64_t, void *, void *, void *, _WORD *))updateMatchCounts + 2))((uint64_t)updateMatchCounts, v177, v175, (void *)v12, (_WORD *)v16);
                    v54 = v54 & 0xFFFF000000000000 | *(unsigned int *)(v16 + 8) | ((unint64_t)*(unsigned __int16 *)(v16 + 12) << 32);
                    if ((*((BOOL (**)(uint64_t, uint64_t, unint64_t, uint64_t, int, char, int))hasMatchWithCounts
                          + 2))((uint64_t)hasMatchWithCounts, v172, *(_QWORD *)v16, v54, 1, 1, 0))
                    {
                      break;
                    }

                    v120 = (unint64_t *)((char *)v120 + 1);
                    v16 += 14;
                    if (v142 == v120)
                      goto LABEL_340;
                  }
                }
              }
            }
          }
        }
LABEL_354:
        objc_storeStrong(v189 + 5, (id)v12);
        v83 = (id)v12;
        v12 = (unint64_t)v161;
        v81 = obj;
        goto LABEL_235;
      }
      v52 = self->_bundleIDType;
    }
    if ((v52 & 0x100000) == 0)
    {
LABEL_78:
      if (v189[5]
        || (self->_bundleIDType & 0x200000) == 0
        || !objc_msgSend(v19, "isEqualToString:", *MEMORY[0x1E0CA6158]))
      {
        goto LABEL_35;
      }
      SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0xCuLL);
      v12 = objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_storeStrong(v189 + 5, (id)v12);
      goto LABEL_34;
    }
    if (objc_msgSend(v19, "isEqualToString:", *MEMORY[0x1E0CA6030]))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_35;
      objc_msgSend(v189[5], "componentsSeparatedByString:", CFSTR(" "));
      v12 = objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend((id)v12, "count"))
        goto LABEL_34;
      objc_msgSend((id)v12, "firstObject");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v12;
      objc_msgSend(v69, "componentsSeparatedByString:", CFSTR("@"));
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = v69;
      if (a10)
      {
        if ((unint64_t)objc_msgSend(v70, "count") < 2)
        {
          v92 = &stru_1E6E549F0;
          goto LABEL_190;
        }
        objc_msgSend(v70, "objectAtIndex:", 1);
        v72 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v92 = v71;
        if (!objc_msgSend(v70, "count"))
        {
LABEL_191:
          v103 = v189[5];
          v189[5] = (id)v92;

LABEL_26:
          v12 = v33;
          goto LABEL_34;
        }
        objc_msgSend(v70, "firstObject");
        v72 = objc_claimAutoreleasedReturnValue();
      }
      v92 = (const __CFString *)v72;
LABEL_190:

      goto LABEL_191;
    }
    if ((self->_bundleIDType & 0x100000) == 0
      || !objc_msgSend(v19, "isEqualToString:", *MEMORY[0x1E0CA66F8]))
    {
      goto LABEL_78;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_35;
    objc_msgSend(v189[5], "componentsSeparatedByString:", CFSTR(" "));
    v171 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v171, "count"));
    for (k = 0; ; ++k)
    {
      if (k >= objc_msgSend(v171, "count"))
      {
        objc_msgSend(v73, "componentsJoinedByString:", CFSTR(" "));
        v95 = objc_claimAutoreleasedReturnValue();
        v96 = v189[5];
        v189[5] = (id)v95;

        v12 = (unint64_t)v171;
        goto LABEL_34;
      }
      objc_msgSend(v171, "objectAtIndex:", k);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "componentsSeparatedByString:", CFSTR("@"));
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = v75;
      if (a11)
      {
        if ((unint64_t)objc_msgSend(v76, "count") < 2)
        {

          v79 = 0;
          goto LABEL_103;
        }
        objc_msgSend(v76, "objectAtIndex:", 1);
        v78 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v79 = v77;
        if (!objc_msgSend(v76, "count"))
          goto LABEL_100;
        objc_msgSend(v76, "firstObject");
        v78 = objc_claimAutoreleasedReturnValue();
      }
      v79 = (void *)v78;

LABEL_100:
      if (v79)
        objc_msgSend(v73, "addObject:", v79);
LABEL_103:

    }
  }
LABEL_43:
  if ((v40 & 0x20) != 0 && objc_msgSend(v19, "isEqualToString:", *MEMORY[0x1E0CA6158]))
    goto LABEL_8;
LABEL_6:
  v24 = 0;
LABEL_36:
  _Block_object_dispose(&v188, 8);

  return v24;
}

void __169__PRSRankingItem_getBundleSpecificValue_forPropertyName_withQueryString_isCJK_isBullseyeSearch_withEvaluator_keyboardLanguage_seenAuthorEmail_seenPrimaryRecipientEmail___block_invoke(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, _BYTE *a8)
{
  if ((a2 & 7) == 1)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(a1 + 32));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    *a8 = 1;
  }
}

- (void)populateFeaturesWithEvaluator:(uint64_t)a1 updatingBundleFeatures:(uint64_t)a2 withContext:(uint64_t)a3 keyboardLanguage:(uint64_t)a4 isCJK:(uint64_t)a5 currentTime:(uint64_t)a6 withRanker:(uint64_t)a7 attributeHolder:(uint64_t)a8 quParsedEvaluator:(void *)a9
{
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  unsigned int v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  _BYTE *v23;
  uint64_t v24;
  int64x2_t v25;
  int64x2_t v26;
  uint64_t v27;
  int64x2_t v28;
  uint64x2_t v29;
  int8x16_t v30;
  int64x2_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  size_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  size_t v44;
  _DWORD *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  _BOOL4 v49;
  void *v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t i;
  void *v55;
  void *v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t j;
  void *v61;
  void *v62;
  id v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  size_t v71;
  char *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  unsigned __int16 *v78;
  size_t v79;
  uint64_t v81;
  BOOL (*v82)(uint64_t, uint64_t, unint64_t, uint64_t, int, char, int);
  uint64_t v83;
  BOOL (*v84)(uint64_t, uint64_t, unint64_t, uint64_t, int, char, int);
  BOOL (*v85)(uint64_t, uint64_t, unint64_t, uint64_t, int, char, int);
  uint64_t v86;
  id v87;
  uint64_t v88;
  unsigned __int16 *v89;
  uint64_t v90;
  void *v91;
  unint64_t *v92;
  void *v93;
  BOOL (*v94)(uint64_t, uint64_t, unint64_t, uint64_t, int, char, int);
  unint64_t v95;
  uint64_t v96;
  _WORD *v97;
  void *v98;
  BOOL (*v99)(uint64_t, uint64_t, unint64_t, uint64_t, int, char, int);
  unint64_t v100;
  uint64_t v101;
  unsigned __int16 *v102;
  void *v103;
  unsigned int (*v104)(uint64_t, uint64_t, uint64_t, int);
  uint64_t v105;
  unsigned int v106;
  BOOL (*v107)(uint64_t, uint64_t, unint64_t, uint64_t, int, char, int);
  unint64_t v108;
  _QWORD *v109;
  unsigned int (*v110)(uint64_t, uint64_t, uint64_t, int);
  unint64_t v111;
  unsigned int (*v112)(uint64_t, uint64_t, uint64_t, int);
  size_t v113;
  unint64_t v114;
  unint64_t *v115;
  void *v116;
  BOOL (*v117)(uint64_t, uint64_t, unint64_t, uint64_t, int, char, int);
  unint64_t v118;
  size_t v119;
  void *v120;
  uint64_t v121;
  unint64_t *v122;
  void *v123;
  BOOL (*v124)(uint64_t, uint64_t, unint64_t, uint64_t, int, char, int);
  unint64_t v125;
  _BOOL4 v126;
  void *v127;
  unint64_t v128;
  void *v129;
  uint64_t v130;
  void *v131;
  unint64_t v132;
  BOOL v133;
  BOOL v134;
  size_t v135;
  void *v136;
  unint64_t v137;
  unint64_t *v138;
  void *v139;
  BOOL (*v140)(uint64_t, uint64_t, unint64_t, uint64_t, int, char, int);
  unint64_t v141;
  uint64_t v142;
  unsigned __int16 *v143;
  unint64_t v144;
  void *v145;
  unint64_t *v146;
  void *v147;
  BOOL (*v148)(uint64_t, uint64_t, unint64_t, uint64_t, int, char, int);
  unint64_t v149;
  _WORD *v150;
  void *v151;
  BOOL (*v152)(uint64_t, uint64_t, unint64_t, uint64_t, int, char, int);
  unint64_t v153;
  unsigned __int16 *v154;
  void *v155;
  unsigned int (*v156)(uint64_t, uint64_t, uint64_t, int);
  uint64_t v157;
  unsigned int v158;
  unint64_t v159;
  _QWORD *v160;
  void *v161;
  _BOOL4 v162;
  uint64_t v163;
  void *v164;
  void *v165;
  _BOOL4 v166;
  void *v167;
  void *v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  void *v172;
  _BOOL4 v174;
  uint64_t v175;
  void *v176;
  void *v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  void *v181;
  BOOL v182;
  BOOL v183;
  void *v184;
  _BOOL4 v185;
  uint64_t v186;
  id v187;
  void *v188;
  void *v189;
  void *v190;
  uint64_t v191;
  int v192;
  void *v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  char v201;
  size_t v202;
  unint64_t v203;
  _WORD *k;
  void *v205;
  BOOL (*v206)(uint64_t, uint64_t, unint64_t, uint64_t, int, char, int);
  unint64_t v207;
  void *v208;
  _BOOL4 v209;
  uint64_t v210;
  _BOOL8 v211;
  void *v212;
  void *v213;
  void *v214;
  void *v215;
  id v216;
  void *v217;
  uint64_t v218;
  uint64_t v219;
  char v220;
  int v221;
  char *v222;
  void *v223;
  void *v224;
  void *v225;
  void *v226;
  void *v227;
  void *v228;
  void *v229;
  void *v230;
  void *v231;
  uint64_t v232;
  void *v233;
  unint64_t v234;
  uint64_t v235;
  int v236;
  uint64_t v237;
  float v238;
  void *v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  unint64_t v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  unint64_t v248;
  unint64_t v249;
  unint64_t *v250;
  id *v251;
  unint64_t v252;
  id *v253;
  uint64_t v254;
  unint64_t v255;
  const __CFString *v256;
  size_t v257;
  unint64_t v258;
  id v259;
  _QWORD *v260;
  unint64_t v261;
  id v262;
  _QWORD *v263;
  _QWORD *v264;
  unint64_t v265;
  unint64_t v266;
  char *v267;
  id v268;
  unint64_t v269;
  uint64_t v270;
  uint64_t v271;
  uint64_t v272;
  id v273;
  uint64_t v274;
  unint64_t v275;
  unint64_t v276;
  unint64_t v277;
  uint64_t v278;
  _BOOL4 v279;
  id v280;
  unint64_t v281;
  unsigned int v282;
  void *v283;
  uint64_t v284;
  uint64_t v285;
  unint64_t v286;
  unint64_t v287;
  int v288;
  id v289;
  uint64_t v290;
  int v291;
  unint64_t v292;
  id v293;
  size_t v294;
  __CFString *v295;
  id v296;
  char *v297;
  _QWORD v298[5];
  _QWORD v299[5];
  __int128 v300;
  uint64_t v301;
  char *v302;
  __int128 v303;
  __int128 v304;
  __int128 v305;
  __int128 v306;
  __int128 v307;
  __int128 v308;
  __int128 v309;
  __int128 v310;
  void *v311[2];
  _BYTE *v312;
  _BYTE *v313;
  __int128 v314;
  _BYTE v315[128];
  _BYTE v316[134];
  _BYTE v317[6470];
  _BYTE v318[12956];

  v9 = MEMORY[0x1E0C80A78](a1, a2, a3, a4, a5, a6, a7, a8);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v282 = v16;
  v18 = v17;
  v284 = v19;
  v254 = v20;
  v21 = (void *)v9;
  *(_QWORD *)&v318[12940] = *MEMORY[0x1E0C80C00];
  v296 = v22;
  v293 = v18;
  v289 = v13;
  v259 = v11;
  v262 = a9;
  if (!v21)
    goto LABEL_350;
  v23 = v21;
  objc_sync_enter(v23);
  if (v23[74])
  {
    objc_sync_exit(v23);

    goto LABEL_350;
  }
  v23[74] = 1;
  objc_sync_exit(v23);
  v297 = v23;

  v279 = SSEnableSpotlightTopHitPersonalizedRanking();
  v24 = v284;
  *(_DWORD *)(v284 + 156) = 0;
  *(_OWORD *)(v24 + 140) = xmmword_1B87DF890;
  v25 = (int64x2_t)xmmword_1B87DF3B0;
  v26 = (int64x2_t)xmmword_1B87DF3C0;
  v27 = 28;
  v28 = vdupq_n_s64(0xFFFFFFFFFFFFFFEELL);
  v29 = (uint64x2_t)vdupq_n_s64(0xAuLL);
  v30.i64[0] = 0x4F0000004F000000;
  v30.i64[1] = 0x4F0000004F000000;
  v31 = vdupq_n_s64(4uLL);
  do
  {
    *(int8x16_t *)(v24 + v27) = vandq_s8(v30, (int8x16_t)vuzp1q_s32((int32x4_t)vcgtq_u64(v29, (uint64x2_t)vaddq_s64(v26, v28)), (int32x4_t)vcgtq_u64(v29, (uint64x2_t)vaddq_s64(v25, v28))));
    v25 = vaddq_s64(v25, v31);
    v26 = vaddq_s64(v26, v31);
    v27 += 16;
  }
  while (v27 != 140);
  *(_QWORD *)(v24 + 160) = 0;
  *(_QWORD *)(v24 + 168) = 0;
  bzero(v318, 0x328CuLL);
  bzero(v317, 0x1946uLL);
  v312 = v317;
  v313 = v318;
  v314 = xmmword_1B87DF8A0;
  requiredTextFeatureAttributes();
  v280 = (id)objc_claimAutoreleasedReturnValue();
  v250 = &v244;
  v32 = sRequiredAttributesCount;
  MEMORY[0x1E0C80A78](v280, 184 * sRequiredAttributesCount + 184, v33, v34, v35, v36, v37, v38);
  v267 = (char *)&v244 - v39;
  bzero((char *)&v244 - v39, v40);
  v294 = objc_msgSend(v289, "queryTermCount");
  v311[1] = 0;
  v311[0] = 0;
  (*((void (**)(uint64_t, uint64_t, uint64_t))initQueryTermMatchCounts + 2))((uint64_t)initQueryTermMatchCounts, v294, (uint64_t)v311);
  v41 = 0;
  v42 = sRequiredAttributesCount;
  v43 = 4 * v32 + 4;
  v44 = 4 * sRequiredAttributesCount + 4;
  v45 = v267;
  do
  {
    if (v42 != -1)
      memset_pattern16(v45, &unk_1B87DF8B0, v44);
    if (v41 <= 0x16 && ((1 << v41) & 0x7F9860) != 0)
      *v45 = 1325400064;
    ++v41;
    v45 = (_DWORD *)((char *)v45 + v43);
  }
  while (v41 != 46);
  if (!v42)
    goto LABEL_321;
  v46 = 0;
  v288 = 0;
  v291 = 0;
  v253 = (id *)(v297 + 232);
  v257 = 2 * v294;
  v260 = v297 + 488;
  v263 = v297 + 496;
  v264 = v297 + 504;
  v251 = (id *)(v297 + 216);
  v275 = 0x834 / v42;
  v285 = *MEMORY[0x1E0CA6158];
  v271 = *MEMORY[0x1E0CA6428];
  v272 = *MEMORY[0x1E0CA5F90];
  v247 = *MEMORY[0x1E0CA65D8];
  v47 = *MEMORY[0x1E0CA65E8];
  v245 = *MEMORY[0x1E0CA6678];
  v246 = v47;
  v256 = CFSTR("com.apple.CoreSuggestions");
  v278 = *MEMORY[0x1E0CA6030];
  v270 = *MEMORY[0x1E0CA66F8];
  v274 = 1;
  do
  {
    v290 = v46;
    objc_msgSend(v280, "objectAtIndexedSubscript:");
    v295 = (__CFString *)objc_claimAutoreleasedReturnValue();
    SSCompactRankingAttrsGetValue(*((int8x8_t **)v297 + 36), requiredTextFeatureAttributesIndexes_attrs[v290]);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v297[385] & 1) != 0)
    {
      if (-[__CFString isEqualToString:](v295, "isEqualToString:", v285))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v268 = (id)_MDStringCopyAbbreviations();
          if (objc_msgSend(v268, "count"))
          {
            objc_msgSend(v296, "queryString");
            v283 = (void *)objc_claimAutoreleasedReturnValue();
            v49 = +[PRSRankingUtilities userQueryHasOnlySingleCharacterTerms:](PRSRankingUtilities, "userQueryHasOnlySingleCharacterTerms:", v283);
            objc_msgSend(v283, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_1E6E549F0);
            v273 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v273, "lowercaseString");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            v309 = 0u;
            v310 = 0u;
            v307 = 0u;
            v308 = 0u;
            v51 = v268;
            v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v307, v316, 16);
            if (v52)
            {
              v53 = *(_QWORD *)v308;
              while (2)
              {
                for (i = 0; i != v52; ++i)
                {
                  if (*(_QWORD *)v308 != v53)
                    objc_enumerationMutation(v51);
                  v55 = *(void **)(*((_QWORD *)&v307 + 1) + 8 * i);
                  if (+[PRSRankingUtilities caseAndDiacriticInsensitiveLocalizedString:isEqualToString:](PRSRankingUtilities, "caseAndDiacriticInsensitiveLocalizedString:isEqualToString:", v283, v55)|| v49&& +[PRSRankingUtilities caseAndDiacriticInsensitiveLocalizedString:isEqualToString:](PRSRankingUtilities, "caseAndDiacriticInsensitiveLocalizedString:isEqualToString:", v273, v55))
                  {
                    objc_storeStrong(v253, v55);
                    goto LABEL_31;
                  }
                }
                v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v307, v316, 16);
                if (v52)
                  continue;
                break;
              }
            }
LABEL_31:

            if (!*v253)
            {
              objc_msgSend(v283, "lowercaseString");
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              v305 = 0u;
              v306 = 0u;
              v303 = 0u;
              v304 = 0u;
              v57 = v51;
              v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v303, v315, 16);
              if (v58)
              {
                v59 = *(_QWORD *)v304;
                do
                {
                  for (j = 0; j != v58; ++j)
                  {
                    if (*(_QWORD *)v304 != v59)
                      objc_enumerationMutation(v57);
                    objc_msgSend(*(id *)(*((_QWORD *)&v303 + 1) + 8 * j), "lowercaseString");
                    v61 = (void *)objc_claimAutoreleasedReturnValue();
                    v62 = v61;
                    if (v56 && (objc_msgSend(v61, "hasPrefix:", v56) & 1) != 0
                      || v50 && objc_msgSend(v62, "hasPrefix:", v50))
                    {
                      v297[56] = 1;
                    }

                  }
                  v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v303, v315, 16);
                }
                while (v58);
              }

            }
          }

        }
      }
    }
    if ((v297[385] & 1) == 0)
      goto LABEL_65;
    if (!-[__CFString isEqualToString:](v295, "isEqualToString:", v271))
      goto LABEL_65;
    if (+[PRSRankingItemRanker isKeywordsHidingEnabled](PRSRankingItemRanker, "isKeywordsHidingEnabled"))
      goto LABEL_65;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_65;
    v63 = v48;
    objc_msgSend(v63, "componentsSeparatedByString:", CFSTR(","));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x1E0C80A78](v64, v257, v65, v66, v67, v68, v69, v70);
    v72 = (char *)&v244 - ((v71 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v72, v71);
    if (!objc_msgSend(v64, "count"))
      goto LABEL_64;
    v73 = 0;
    while (1)
    {
      objc_msgSend(v64, "objectAtIndex:", v73);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "stringByTrimmingCharactersInSet:", v75);
      v76 = (void *)objc_claimAutoreleasedReturnValue();

      if (!+[PRSRankingUtilities aToZInString:](PRSRankingUtilities, "aToZInString:", v76))
        break;
LABEL_61:

      if (++v73 >= (unint64_t)objc_msgSend(v64, "count"))
        goto LABEL_64;
    }
    bzero(v72, v257);
    *(_QWORD *)&v300 = 0;
    *((_QWORD *)&v300 + 1) = &v300;
    v301 = 0x2020000000;
    v302 = v72;
    v299[0] = MEMORY[0x1E0C809B0];
    v299[1] = 3221225472;
    v299[2] = __163__PRSRankingItem_populateFeaturesWithEvaluator_updatingBundleFeatures_withContext_keyboardLanguage_isCJK_currentTime_withRanker_attributeHolder_quParsedEvaluator___block_invoke;
    v299[3] = &unk_1E6E45008;
    v299[4] = &v300;
    v77 = objc_msgSend(v296, "evaluateAttribute:ignoreSubtokens:strongCompounds:skipTranscriptions:withHandler:", v76, 0, 1, 0, v299);
    if (v77 != v294)
      goto LABEL_60;
    if (v294)
    {
      v78 = *(unsigned __int16 **)(*((_QWORD *)&v300 + 1) + 24);
      v79 = v294;
      while (*v78++)
      {
        if (!--v79)
          goto LABEL_63;
      }
LABEL_60:
      _Block_object_dispose(&v300, 8);
      goto LABEL_61;
    }
LABEL_63:
    objc_msgSend(v297, "setWordMatchedKeyword:", 1);
    _Block_object_dispose(&v300, 8);

LABEL_64:
LABEL_65:
    v81 = objc_msgSend(v297, "attrType:seenAuthorEmail:seenPrimaryRecipientEmail:", v295, v288 & 1, v291 & 1);
    if ((*((_WORD *)v297 + 193) & 0x204) != 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && (-[__CFString isEqualToString:](v295, "isEqualToString:", v285) & 1) == 0)
      {
        *(_QWORD *)((char *)&v300 + 6) = 0;
        *(_QWORD *)&v300 = 0;
        (*((void (**)(uint64_t, void *, void *, void *, _WORD *, uint64_t))updateMatchCountsQueryMatchCounts + 2))((uint64_t)updateMatchCountsQueryMatchCounts, v296, v293, v48, &v300, (uint64_t)v311);
        v82 = (BOOL (*)(uint64_t, uint64_t, unint64_t, uint64_t, int, char, int))*((_QWORD *)hasMatchWithCounts
                                                                                                + 2);
        v261 = v261 & 0xFFFF000000000000 | DWORD2(v300) | ((unint64_t)WORD6(v300) << 32);
        if (v82((uint64_t)hasMatchWithCounts, v294, v300, v261, 1, 0, 1))
        {
          if ((v81 & 0x10000000000) == 0)
            v297[63] = 1;
          v83 = v81 & 0x10000000000;
          *v260 |= v81;
          if ((v81 & 0x10000000000) == 0)
LABEL_72:
            v297[62] = 1;
LABEL_73:
          *v263 |= v81;
          if (!v83)
LABEL_74:
            v297[62] = 1;
LABEL_75:
          *v264 |= v81;
        }
        else
        {
          if (!WORD6(v300))
            (*((void (**)(uint64_t, void *, void *, void *, _WORD *, uint64_t))updateMatchCountsQueryMatchCounts
             + 2))((uint64_t)updateMatchCountsQueryMatchCounts, v296, v293, v48, &v300, (uint64_t)v311);
          v107 = (BOOL (*)(uint64_t, uint64_t, unint64_t, uint64_t, int, char, int))*((_QWORD *)hasMatchWithCounts + 2);
          v252 = v252 & 0xFFFF000000000000 | DWORD2(v300) | ((unint64_t)WORD6(v300) << 32);
          if (v107((uint64_t)hasMatchWithCounts, v294, v300, v252, 1, 1, 0))
          {
            v83 = v81 & 0x10000000000;
            if ((v81 & 0x10000000000) == 0)
              goto LABEL_72;
            goto LABEL_73;
          }
          v111 = v248;
          if (!WORD6(v300))
          {
            (*((void (**)(uint64_t, void *, void *, void *, _WORD *, uint64_t))updateMatchCountsQueryMatchCounts
             + 2))((uint64_t)updateMatchCountsQueryMatchCounts, v296, v293, v48, &v300, (uint64_t)v311);
            v111 = v248;
          }
          v112 = (unsigned int (*)(uint64_t, uint64_t, uint64_t, int))*((_QWORD *)hasAsTypedMatchWithCounts + 2);
          v248 = v111 & 0xFFFF000000000000 | DWORD2(v300) | ((unint64_t)WORD6(v300) << 32);
          if (v112((uint64_t)hasAsTypedMatchWithCounts, v294, v300, SDWORD2(v300)))
          {
            if ((v81 & 0x10000000000) == 0)
              goto LABEL_74;
            goto LABEL_75;
          }
        }
      }
    }
    if ((*((_WORD *)v297 + 193) & 0x204) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        *(_QWORD *)((char *)&v300 + 6) = 0;
        *(_QWORD *)&v300 = 0;
        (*((void (**)(uint64_t, void *, void *, void *, _WORD *, uint64_t))updateMatchCountsQueryMatchCounts + 2))((uint64_t)updateMatchCountsQueryMatchCounts, v296, v293, v48, &v300, (uint64_t)v311);
        v84 = (BOOL (*)(uint64_t, uint64_t, unint64_t, uint64_t, int, char, int))*((_QWORD *)hasMatchWithCounts
                                                                                                + 2);
        v266 = v266 & 0xFFFF000000000000 | DWORD2(v300) | ((unint64_t)WORD6(v300) << 32);
        if (v84((uint64_t)hasMatchWithCounts, v294, v300, v266, 1, 0, 1))
        {
          *v260 |= v81;
          goto LABEL_83;
        }
        if (!WORD6(v300))
          (*((void (**)(uint64_t, void *, void *, void *, _WORD *, uint64_t))updateMatchCountsQueryMatchCounts
           + 2))((uint64_t)updateMatchCountsQueryMatchCounts, v296, v293, v48, &v300, (uint64_t)v311);
        v85 = (BOOL (*)(uint64_t, uint64_t, unint64_t, uint64_t, int, char, int))*((_QWORD *)hasMatchWithCounts
                                                                                                + 2);
        v255 = v255 & 0xFFFF000000000000 | DWORD2(v300) | ((unint64_t)WORD6(v300) << 32);
        if (v85((uint64_t)hasMatchWithCounts, v294, v300, v255, 1, 1, 0))
        {
LABEL_83:
          *v263 |= v81;
          goto LABEL_84;
        }
        if (!WORD6(v300))
          (*((void (**)(uint64_t, void *, void *, void *, _WORD *, uint64_t))updateMatchCountsQueryMatchCounts
           + 2))((uint64_t)updateMatchCountsQueryMatchCounts, v296, v293, v48, &v300, (uint64_t)v311);
        v110 = (unsigned int (*)(uint64_t, uint64_t, uint64_t, int))*((_QWORD *)hasAsTypedMatchWithCounts + 2);
        v249 = v249 & 0xFFFF000000000000 | DWORD2(v300) | ((unint64_t)WORD6(v300) << 32);
        if (v110((uint64_t)hasAsTypedMatchWithCounts, v294, v300, SDWORD2(v300)))
LABEL_84:
          *v264 |= v81;
      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v87 = v48;
      goto LABEL_294;
    }
    v86 = *((_QWORD *)v297 + 48);
    if ((v86 & 0x2040000) != 0)
    {
      if ((v86 & 0x100) == 0)
        goto LABEL_88;
LABEL_135:
      if ((-[__CFString isEqualToString:](v295, "isEqualToString:", v272) & 1) != 0)
      {
        v113 = 14 * objc_msgSend(v48, "count");
        v283 = malloc_type_malloc(v113, 0x100004018756113uLL);
        bzero(v283, v113);
        if (!objc_msgSend(v48, "count"))
          goto LABEL_210;
        v114 = 0;
        v115 = (unint64_t *)v283;
        while (1)
        {
          objc_msgSend(v48, "objectAtIndex:", v114);
          v116 = (void *)objc_claimAutoreleasedReturnValue();
          if (v279)
          {
            if (v114 > 0xA)
              goto LABEL_209;
            if ((objc_msgSend(v297, "isGoodMatchAlternateName:withEvaluator:", v116, v296) & 1) != 0)
            {
LABEL_208:
              objc_storeStrong(v251, v116);
LABEL_209:

LABEL_210:
              if (objc_msgSend(v48, "count"))
              {
                objc_msgSend(v297, "firstMatchedAltName");
                v165 = (void *)objc_claimAutoreleasedReturnValue();
                v166 = v165 == 0;

                if (v166)
                {
                  SSCompactRankingAttrsGetValue(*((int8x8_t **)v297 + 36), 0x135uLL);
                  v167 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    v273 = v167;
                    objc_msgSend(v296, "queryString");
                    v168 = (void *)objc_claimAutoreleasedReturnValue();
                    v169 = objc_msgSend(v273, "rangeOfString:options:", v168, 393);
                    v171 = v170;

                    objc_msgSend(v296, "queryString");
                    v172 = (void *)objc_claimAutoreleasedReturnValue();
                    v174 = v171 == objc_msgSend(v172, "length") && v169 == 0;

                    if (v174 && objc_msgSend(v48, "count"))
                    {
                      v175 = 0;
                      while (1)
                      {
                        objc_msgSend(v48, "objectAtIndex:", v175);
                        v176 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v296, "queryString");
                        v177 = (void *)objc_claimAutoreleasedReturnValue();
                        v178 = objc_msgSend(v176, "rangeOfString:options:", v177, 385);
                        v180 = v179;

                        objc_msgSend(v296, "queryString");
                        v181 = (void *)objc_claimAutoreleasedReturnValue();
                        v182 = v180 != objc_msgSend(v181, "length") || v178 == 0x7FFFFFFFFFFFFFFFLL;
                        v183 = v182;

                        if (!v183)
                          break;

                        if (++v175 >= (unint64_t)objc_msgSend(v48, "count"))
                          goto LABEL_267;
                      }
                      objc_msgSend(v297, "setFirstMatchedAltName:", v176);

                    }
LABEL_267:
                    if (objc_msgSend(v48, "count"))
                    {
                      objc_msgSend(v297, "firstMatchedAltName");
                      v193 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v193)
                      {

                      }
                      else
                      {
                        v201 = v294 < 2 || v174;
                        if ((v201 & 1) == 0)
                        {
                          v202 = v257;
                          MEMORY[0x1E0C80A78](0, v194, v195, v196, v197, v198, v199, v200);
                          bzero((char *)&v244 - ((v202 + 15) & 0xFFFFFFFFFFFFFFF0), v202);
                          bzero((char *)&v244 - ((v202 + 15) & 0xFFFFFFFFFFFFFFF0), v202);
                          *(_QWORD *)&v300 = 0;
                          *((_QWORD *)&v300 + 1) = &v300;
                          v301 = 0x2020000000;
                          v302 = (char *)&v244 - ((v202 + 15) & 0xFFFFFFFFFFFFFFF0);
                          v298[0] = MEMORY[0x1E0C809B0];
                          v298[1] = 3221225472;
                          v298[2] = __163__PRSRankingItem_populateFeaturesWithEvaluator_updatingBundleFeatures_withContext_keyboardLanguage_isCJK_currentTime_withRanker_attributeHolder_quParsedEvaluator___block_invoke_2;
                          v298[3] = &unk_1E6E45008;
                          v298[4] = &v300;
                          if (objc_msgSend(v296, "evaluateAttribute:ignoreSubtokens:strongCompounds:skipTranscriptions:withHandler:", v273, 1, 1, 0, v298)&& **(_WORD **)(*((_QWORD *)&v300 + 1) + 24))
                          {
                            v203 = 0;
                            for (k = v283; ; k += 7)
                            {
                              if (v203 >= objc_msgSend(v48, "count"))
                                goto LABEL_284;
                              objc_msgSend(v48, "objectAtIndex:", v203);
                              v205 = (void *)objc_claimAutoreleasedReturnValue();
                              if (!k[6])
                                (*((void (**)(uint64_t, void *, void *, void *, _WORD *))updateMatchCounts + 2))((uint64_t)updateMatchCounts, v296, v293, v205, k);
                              v206 = (BOOL (*)(uint64_t, uint64_t, unint64_t, uint64_t, int, char, int))*((_QWORD *)hasMatchWithCounts + 2);
                              v207 = *(_QWORD *)k;
                              v244 = v244 & 0xFFFF000000000000 | *((unsigned int *)k + 2) | ((unint64_t)(unsigned __int16)k[6] << 32);
                              if (v206((uint64_t)hasMatchWithCounts, v294, v207, v244, 0, 1, 0))
                                break;

                              ++v203;
                            }
                            objc_msgSend(v297, "setFirstMatchedAltName:", v205);

                          }
LABEL_284:
                          _Block_object_dispose(&v300, 8);
                        }
                      }
                    }

                  }
                }
              }
              objc_msgSend(v297, "firstMatchedAltName");
              v208 = (void *)objc_claimAutoreleasedReturnValue();
              v209 = v208 == 0;

              if (!v209)
              {
                objc_msgSend(v297, "firstMatchedAltName");
                v210 = objc_claimAutoreleasedReturnValue();
                goto LABEL_291;
              }
              if (objc_msgSend(v48, "count"))
              {
                objc_msgSend(v48, "stringRepresentation");
                v210 = objc_claimAutoreleasedReturnValue();
LABEL_291:
                v87 = (id)v210;
              }
              else
              {
                v87 = 0;
              }

              v164 = v283;
              if (!v283)
                goto LABEL_294;
LABEL_293:
              free(v164);
              goto LABEL_294;
            }
          }
          else
          {
            (*((void (**)(uint64_t, void *, void *, void *, _WORD *))updateMatchCounts + 2))((uint64_t)updateMatchCounts, v296, v293, v116, v115);
            v117 = (BOOL (*)(uint64_t, uint64_t, unint64_t, uint64_t, int, char, int))*((_QWORD *)hasMatchWithCounts + 2);
            v118 = *v115;
            v277 = v277 & 0xFFFF000000000000 | *((unsigned int *)v115 + 2) | ((unint64_t)*((unsigned __int16 *)v115
                                                                                                  + 6) << 32);
            if (v117((uint64_t)hasMatchWithCounts, v294, v118, v277, 1, 1, 0))
              goto LABEL_208;
          }

          ++v114;
          v115 = (unint64_t *)((char *)v115 + 14);
          if (v114 >= objc_msgSend(v48, "count"))
            goto LABEL_210;
        }
      }
      v86 = *((_QWORD *)v297 + 48);
      if ((v86 & 4) != 0)
        goto LABEL_146;
LABEL_89:
      if ((v86 & 0x200000) == 0)
      {
LABEL_176:
        if ((v86 & 0x2040000) == 0)
        {
          objc_msgSend(v48, "stringRepresentation");
          v87 = (id)objc_claimAutoreleasedReturnValue();

          goto LABEL_294;
        }
        v142 = objc_msgSend(v48, "count");
        v143 = (unsigned __int16 *)malloc_type_malloc(14 * v142, 0x100004018756113uLL);
        bzero(v143, 14 * v142);
        if (v142)
        {
          v144 = 0;
          v145 = 0;
          v146 = (unint64_t *)v143;
          while (1)
          {
            objc_msgSend(v48, "objectAtIndex:", v144);
            v147 = (void *)objc_claimAutoreleasedReturnValue();

            (*((void (**)(uint64_t, void *, void *, void *, _WORD *, uint64_t))updateMatchCountsQueryMatchCounts
             + 2))((uint64_t)updateMatchCountsQueryMatchCounts, v296, v293, v147, v146, (uint64_t)v311);
            v148 = (BOOL (*)(uint64_t, uint64_t, unint64_t, uint64_t, int, char, int))*((_QWORD *)hasMatchWithCounts + 2);
            v149 = *v146;
            v287 = v287 & 0xFFFF000000000000 | *((unsigned int *)v146 + 2) | ((unint64_t)*((unsigned __int16 *)v146
                                                                                                  + 6) << 32);
            if (v148((uint64_t)hasMatchWithCounts, v294, v149, v287, 1, 0, 1))
              break;
            v146 = (unint64_t *)((char *)v146 + 14);
            ++v144;
            v145 = v147;
            if (v142 == v144)
            {
              v144 = 0;
              v150 = v143;
              v151 = v147;
              do
              {
                objc_msgSend(v48, "objectAtIndex:", v144);
                v147 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v150[6])
                  (*((void (**)(uint64_t, void *, void *, void *, _WORD *, uint64_t))updateMatchCountsQueryMatchCounts
                   + 2))((uint64_t)updateMatchCountsQueryMatchCounts, v296, v293, v147, v150, (uint64_t)v311);
                v152 = (BOOL (*)(uint64_t, uint64_t, unint64_t, uint64_t, int, char, int))*((_QWORD *)hasMatchWithCounts + 2);
                v153 = *(_QWORD *)v150;
                v276 = v276 & 0xFFFF000000000000 | *((unsigned int *)v150 + 2) | ((unint64_t)(unsigned __int16)v150[6] << 32);
                if (v152((uint64_t)hasMatchWithCounts, v294, v153, v276, 1, 1, 0))
                {
                  v297[62] = 1;
                  if (v81 == 0x2000000000 || v81 == 0x200000)
                  {
                    v159 = objc_msgSend(v147, "length");
                    v160 = v263;
                    goto LABEL_250;
                  }
                  v160 = v263;
                  goto LABEL_251;
                }
                ++v144;
                v150 += 7;
                v151 = v147;
              }
              while (v142 != v144);
              v144 = 0;
              v154 = v143;
              v155 = v147;
              while (1)
              {
                objc_msgSend(v48, "objectAtIndex:", v144);
                v147 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v154[6])
                  (*((void (**)(uint64_t, void *, void *, void *, _WORD *, uint64_t))updateMatchCountsQueryMatchCounts
                   + 2))((uint64_t)updateMatchCountsQueryMatchCounts, v296, v293, v147, v154, (uint64_t)v311);
                v156 = (unsigned int (*)(uint64_t, uint64_t, uint64_t, int))*((_QWORD *)hasAsTypedMatchWithCounts
                                                                                    + 2);
                v157 = *(_QWORD *)v154;
                v158 = *((_DWORD *)v154 + 2);
                v258 = v258 & 0xFFFF000000000000 | v158 | ((unint64_t)v154[6] << 32);
                if (v156((uint64_t)hasAsTypedMatchWithCounts, v294, v157, v158))
                  break;
                ++v144;
                v154 += 7;
                v155 = v147;
                if (v142 == v144)
                  goto LABEL_194;
              }
              v297[62] = 1;
              if (v81 == 0x2000000000 || v81 == 0x200000)
              {
                v159 = objc_msgSend(v147, "length");
                v160 = v264;
                goto LABEL_250;
              }
              v160 = v264;
              goto LABEL_251;
            }
          }
          v297[63] = 1;
          if (v81 != 0x200000 && v81 != 0x200000000000 && v81 != 0x2000000000)
          {
            v160 = v260;
LABEL_251:
            *v160 |= v81;
            goto LABEL_252;
          }
          v159 = objc_msgSend(v147, "length");
          v160 = v260;
LABEL_250:
          if (v159 > 2)
            goto LABEL_251;
LABEL_252:
          v87 = v147;

          if (-[__CFString isEqualToString:](v295, "isEqualToString:", v247)
            || -[__CFString isEqualToString:](v295, "isEqualToString:", v246))
          {
            v187 = v87;
            v188 = (void *)*((_QWORD *)v297 + 28);
            *((_QWORD *)v297 + 28) = v187;
            goto LABEL_255;
          }
          if (-[__CFString isEqualToString:](v295, "isEqualToString:", v245))
          {
            SSCompactRankingAttrsGetValue(*((int8x8_t **)v297 + 36), 0x84uLL);
            v188 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0 && v144 < objc_msgSend(v188, "count"))
            {
              objc_msgSend(v188, "objectAtIndex:", v144);
              v189 = (void *)objc_claimAutoreleasedReturnValue();
              v190 = v189;
              if (v189)
              {
                objc_msgSend(v189, "floatValue");
                *(_WORD *)&v312[2 * v314] = 2394;
                v191 = v314;
                *(_QWORD *)&v314 = v314 + 1;
                *(_DWORD *)&v313[4 * v191] = v192;
              }

            }
LABEL_255:

          }
          v147 = v87;
LABEL_257:
          free(v143);
        }
        else
        {
          v147 = 0;
LABEL_194:
          objc_msgSend(v48, "stringRepresentation");
          v87 = (id)objc_claimAutoreleasedReturnValue();

          if (v143)
            goto LABEL_257;
        }

        goto LABEL_294;
      }
LABEL_165:
      if ((-[__CFString isEqualToString:](v295, "isEqualToString:", v272) & 1) == 0)
      {
        v86 = *((_QWORD *)v297 + 48);
        goto LABEL_176;
      }
      v135 = 14 * objc_msgSend(v48, "count");
      v136 = malloc_type_malloc(v135, 0x100004018756113uLL);
      bzero(v136, v135);
      if (objc_msgSend(v48, "count"))
      {
        v137 = 0;
        v138 = (unint64_t *)v136;
        while (1)
        {
          objc_msgSend(v48, "objectAtIndex:", v137);
          v139 = (void *)objc_claimAutoreleasedReturnValue();
          if (v137 == 11)
            break;
          if (v294 < 2)
          {
            (*((void (**)(uint64_t, void *, void *, void *, _WORD *))updateMatchCounts + 2))((uint64_t)updateMatchCounts, v296, v293, v139, v138);
            v140 = (BOOL (*)(uint64_t, uint64_t, unint64_t, uint64_t, int, char, int))*((_QWORD *)hasMatchWithCounts + 2);
            v141 = *v138;
            v269 = v269 & 0xFFFF000000000000 | *((unsigned int *)v138 + 2) | ((unint64_t)*((unsigned __int16 *)v138
                                                                                                  + 6) << 32);
            if (v140((uint64_t)hasMatchWithCounts, v294, v141, v269, 1, 1, 0))
            {
LABEL_231:
              objc_storeStrong(v251, v139);
              break;
            }
          }
          else if ((objc_msgSend(v297, "isGoodMatchAlternateName:withEvaluator:", v139, v296) & 1) != 0)
          {
            goto LABEL_231;
          }

          ++v137;
          v138 = (unint64_t *)((char *)v138 + 14);
          if (v137 >= objc_msgSend(v48, "count"))
            goto LABEL_233;
        }

      }
LABEL_233:
      objc_msgSend(v297, "firstMatchedAltName");
      v184 = (void *)objc_claimAutoreleasedReturnValue();
      v185 = v184 == 0;

      if (!v185)
      {
        objc_msgSend(v297, "firstMatchedAltName");
        v186 = objc_claimAutoreleasedReturnValue();
        goto LABEL_237;
      }
      if (objc_msgSend(v48, "count"))
      {
        objc_msgSend(v48, "stringRepresentation");
        v186 = objc_claimAutoreleasedReturnValue();
LABEL_237:
        v87 = (id)v186;
      }
      else
      {
        v87 = 0;
      }

      if (!v136)
        goto LABEL_294;
      v164 = v136;
      goto LABEL_293;
    }
    v88 = objc_msgSend(v48, "count");
    v89 = (unsigned __int16 *)malloc_type_malloc(14 * v88, 0x100004018756113uLL);
    bzero(v89, 14 * v88);
    if (v88)
    {
      v90 = 0;
      v91 = 0;
      v92 = (unint64_t *)v89;
      while (1)
      {
        objc_msgSend(v48, "objectAtIndex:", v90);
        v93 = (void *)objc_claimAutoreleasedReturnValue();

        v91 = v93;
        (*((void (**)(uint64_t, void *, void *, void *, _WORD *, uint64_t))updateMatchCountsQueryMatchCounts + 2))((uint64_t)updateMatchCountsQueryMatchCounts, v296, v293, v93, v92, (uint64_t)v311);
        v94 = (BOOL (*)(uint64_t, uint64_t, unint64_t, uint64_t, int, char, int))*((_QWORD *)hasMatchWithCounts
                                                                                                + 2);
        v95 = *v92;
        v292 = v292 & 0xFFFF000000000000 | *((unsigned int *)v92 + 2) | ((unint64_t)*((unsigned __int16 *)v92
                                                                                             + 6) << 32);
        if (v94((uint64_t)hasMatchWithCounts, v294, v95, v292, 1, 0, 1))
          break;
        v92 = (unint64_t *)((char *)v92 + 14);
        if (v88 == ++v90)
        {
          v96 = 0;
          v97 = v89;
          do
          {
            objc_msgSend(v48, "objectAtIndex:", v96);
            v98 = (void *)objc_claimAutoreleasedReturnValue();

            v91 = v98;
            if (!v97[6])
              (*((void (**)(uint64_t, void *, void *, void *, _WORD *, uint64_t))updateMatchCountsQueryMatchCounts
               + 2))((uint64_t)updateMatchCountsQueryMatchCounts, v296, v293, v98, v97, (uint64_t)v311);
            v99 = (BOOL (*)(uint64_t, uint64_t, unint64_t, uint64_t, int, char, int))*((_QWORD *)hasMatchWithCounts + 2);
            v100 = *(_QWORD *)v97;
            v281 = v281 & 0xFFFF000000000000 | *((unsigned int *)v97 + 2) | ((unint64_t)(unsigned __int16)v97[6] << 32);
            if (v99((uint64_t)hasMatchWithCounts, v294, v100, v281, 1, 1, 0))
            {
              if (v81 == 0x200000)
              {
                v108 = objc_msgSend(v98, "length");
                v109 = v263;
                goto LABEL_131;
              }
              v109 = v263;
              goto LABEL_132;
            }
            ++v96;
            v97 += 7;
          }
          while (v88 != v96);
          v101 = 0;
          v102 = v89;
          while (1)
          {
            objc_msgSend(v48, "objectAtIndex:", v101);
            v103 = (void *)objc_claimAutoreleasedReturnValue();

            v91 = v103;
            if (!v102[6])
              (*((void (**)(uint64_t, void *, void *, void *, _WORD *, uint64_t))updateMatchCountsQueryMatchCounts
               + 2))((uint64_t)updateMatchCountsQueryMatchCounts, v296, v293, v103, v102, (uint64_t)v311);
            v104 = (unsigned int (*)(uint64_t, uint64_t, uint64_t, int))*((_QWORD *)hasAsTypedMatchWithCounts + 2);
            v105 = *(_QWORD *)v102;
            v106 = *((_DWORD *)v102 + 2);
            v265 = v265 & 0xFFFF000000000000 | v106 | ((unint64_t)v102[6] << 32);
            if (v104((uint64_t)hasAsTypedMatchWithCounts, v294, v105, v106))
              break;
            ++v101;
            v102 += 7;
            if (v88 == v101)
              goto LABEL_133;
          }
          if (v81 == 0x200000)
          {
            v108 = objc_msgSend(v103, "length");
            v109 = v264;
            goto LABEL_131;
          }
          v109 = v264;
          goto LABEL_132;
        }
      }
      if (v81 != 0x200000)
      {
        v109 = v260;
LABEL_132:
        *v109 |= v81;
        goto LABEL_133;
      }
      v108 = objc_msgSend(v93, "length");
      v109 = v260;
LABEL_131:
      if (v108 > 2)
        goto LABEL_132;
LABEL_133:
      free(v89);

    }
    else if (v89)
    {
      v91 = 0;
      goto LABEL_133;
    }
    v86 = *((_QWORD *)v297 + 48);
    if ((v86 & 0x100) != 0)
      goto LABEL_135;
LABEL_88:
    if ((v86 & 4) == 0)
      goto LABEL_89;
LABEL_146:
    if ((-[__CFString isEqualToString:](v295, "isEqualToString:", v272) & 1) == 0)
    {
      v86 = *((_QWORD *)v297 + 48);
      if ((v86 & 0x200000) == 0)
        goto LABEL_176;
      goto LABEL_165;
    }
    v119 = 14 * objc_msgSend(v48, "count");
    v120 = malloc_type_malloc(v119, 0x100004018756113uLL);
    bzero(v120, v119);
    if (!objc_msgSend(v48, "count"))
      goto LABEL_201;
    v121 = 0;
    v122 = (unint64_t *)v120;
    while (2)
    {
      objc_msgSend(v48, "objectAtIndex:", v121);
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(uint64_t, void *, void *, void *, _WORD *))updateMatchCounts + 2))((uint64_t)updateMatchCounts, v296, v293, v123, v122);
      v124 = (BOOL (*)(uint64_t, uint64_t, unint64_t, uint64_t, int, char, int))*((_QWORD *)hasMatchWithCounts
                                                                                               + 2);
      v125 = *v122;
      v286 = v286 & 0xFFFF000000000000 | *((unsigned int *)v122 + 2) | ((unint64_t)*((unsigned __int16 *)v122
                                                                                            + 6) << 32);
      v126 = v124((uint64_t)hasMatchWithCounts, v294, v125, v286, 1, 1, 0);
      if (v121)
      {
        if (v126)
          break;
        goto LABEL_162;
      }
      if (!v126)
        goto LABEL_162;
      +[PRSRankingUtilities hyphensCharacterSet](PRSRankingUtilities, "hyphensCharacterSet");
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      v128 = objc_msgSend(v123, "rangeOfCharacterFromSet:", v127);

      if (v128)
      {
        if (v128 != 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v296, "queryString");
          v129 = (void *)objc_claimAutoreleasedReturnValue();
          v130 = objc_msgSend(v123, "length");
          objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
          v131 = (void *)objc_claimAutoreleasedReturnValue();
          v132 = objc_msgSend(v123, "rangeOfString:options:range:locale:", v129, 129, 0, v130, v131);

          v133 = v132 != 0x7FFFFFFFFFFFFFFFLL && v132 > v128;
          v134 = !v133;

          if (!v134)
          {
LABEL_162:

            v122 = (unint64_t *)((char *)v122 + 14);
            if (++v121 >= (unint64_t)objc_msgSend(v48, "count"))
              goto LABEL_201;
            continue;
          }
        }
      }
      break;
    }
    objc_storeStrong(v251, v123);

LABEL_201:
    objc_msgSend(v297, "firstMatchedAltName");
    v161 = (void *)objc_claimAutoreleasedReturnValue();
    v162 = v161 == 0;

    if (!v162)
    {
      objc_msgSend(v297, "firstMatchedAltName");
      v163 = objc_claimAutoreleasedReturnValue();
      goto LABEL_205;
    }
    if (objc_msgSend(v48, "count"))
    {
      objc_msgSend(v48, "stringRepresentation");
      v163 = objc_claimAutoreleasedReturnValue();
LABEL_205:
      v87 = (id)v163;
    }
    else
    {
      v87 = 0;
    }

    if (v120)
    {
      v164 = v120;
      goto LABEL_293;
    }
LABEL_294:
    v211 = objc_msgSend(v289, "queryKind") == 2 || (unint64_t)(objc_msgSend(v289, "queryKind") - 5) < 4;
    objc_msgSend(v296, "queryString");
    v212 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v289, "keyboardLanguage");
    v213 = (void *)objc_claimAutoreleasedReturnValue();
    BYTE1(v243) = v291 & 1;
    LOBYTE(v243) = v288 & 1;
    objc_msgSend(v297, "getBundleSpecificValue:forPropertyName:withQueryString:isCJK:isBullseyeSearch:withEvaluator:keyboardLanguage:seenAuthorEmail:seenPrimaryRecipientEmail:", v87, v295, v212, v282, v211, v296, v213, v243);
    v214 = (void *)objc_claimAutoreleasedReturnValue();

    if ((v297[384] & 8) == 0
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && objc_msgSend(v214, "length")
      || !-[__CFString isEqualToString:](v295, "isEqualToString:", v285))
    {
      v217 = v214;
    }
    else
    {
      SSCompactRankingAttrsGetValue(*((int8x8_t **)v297 + 36), 5uLL);
      v215 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v216 = v215;
        goto LABEL_317;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v215, "stringRepresentation");
        v216 = (id)objc_claimAutoreleasedReturnValue();
LABEL_317:
        v217 = v216;

      }
      else
      {
        v217 = v214;
      }

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && objc_msgSend(v217, "length")
      && (!-[__CFString isEqualToString:](v295, "isEqualToString:", v285)
       || (objc_msgSend(*((id *)v297 + 26), "isEqualToString:", v256) & 1) == 0))
    {
      prs_feature_population_ctx_reset_for_property(v284, v295, (*((_QWORD *)v297 + 48) & 0x4000) == 0);
      v220 = -[__CFString isEqualToString:](v295, "isEqualToString:", v285);
      BYTE1(v242) = v291 & 1;
      LOBYTE(v242) = v288 & 1;
      LOBYTE(v241) = v282;
      LOBYTE(v240) = v220;
      objc_msgSend(v297, "populateTextFeatureValuesForProperty:updatingBundleFeatureValues:propertyIndex:withEvaluator:withContext:featureScoreInfo:propertyCanFuzzyMatch:keyboardLanguage:isCJK:propertyName:seenAuthorEmail:seenPrimaryRecipientEmail:", v217, v267, v274++, v296, v284, &v312, v240, v293, v241, v295, v242);
    }
    else
    {
      v218 = v284;
      *(_WORD *)&v312[2 * v314] = sFeatureList[*(_DWORD *)(v284 + 156) + 2];
      v219 = v314;
      *(_QWORD *)&v314 = v314 + 1;
      *(_DWORD *)&v313[4 * v219] = 0;
      *(_DWORD *)(v218 + 156) += v275;
    }
    if ((-[__CFString isEqualToString:](v295, "isEqualToString:", v278) & 1) != 0)
    {
      v288 = 1;
    }
    else
    {
      v221 = -[__CFString isEqualToString:](v295, "isEqualToString:", v270);
      v291 |= v221;
    }

    v46 = v290 + 1;
  }
  while (sRequiredAttributesCount > (unint64_t)(v290 + 1));
LABEL_321:
  v222 = v297;
  if (v294)
  {
    if (!*((_QWORD *)v297 + 52))
    {
      v223 = malloc_type_calloc(v294, 8uLL, 0x100004000313F17uLL);
      v222 = v297;
      *((_QWORD *)v297 + 52) = v223;
    }
    if (!*((_QWORD *)v222 + 55))
    {
      v224 = malloc_type_calloc(v294, 8uLL, 0x100004000313F17uLL);
      v222 = v297;
      *((_QWORD *)v297 + 55) = v224;
    }
    if (!*((_QWORD *)v222 + 58))
    {
      v225 = malloc_type_calloc(v294, 8uLL, 0x100004000313F17uLL);
      v222 = v297;
      *((_QWORD *)v297 + 58) = v225;
    }
    if (!*((_QWORD *)v222 + 53))
    {
      v226 = malloc_type_calloc(v294, 8uLL, 0x100004000313F17uLL);
      v222 = v297;
      *((_QWORD *)v297 + 53) = v226;
    }
    if (!*((_QWORD *)v222 + 56))
    {
      v227 = malloc_type_calloc(v294, 8uLL, 0x100004000313F17uLL);
      v222 = v297;
      *((_QWORD *)v297 + 56) = v227;
    }
    if (!*((_QWORD *)v222 + 59))
    {
      v228 = malloc_type_calloc(v294, 8uLL, 0x100004000313F17uLL);
      v222 = v297;
      *((_QWORD *)v297 + 59) = v228;
    }
    if (!*((_QWORD *)v222 + 54))
    {
      v229 = malloc_type_calloc(v294, 8uLL, 0x100004000313F17uLL);
      v222 = v297;
      *((_QWORD *)v297 + 54) = v229;
    }
    if (!*((_QWORD *)v222 + 57))
    {
      v230 = malloc_type_calloc(v294, 8uLL, 0x100004000313F17uLL);
      v222 = v297;
      *((_QWORD *)v297 + 57) = v230;
    }
    if (!*((_QWORD *)v222 + 60))
    {
      v231 = malloc_type_calloc(v294, 8uLL, 0x100004000313F17uLL);
      v222 = v297;
      *((_QWORD *)v297 + 60) = v231;
    }
    if ((*((_QWORD *)v222 + 51) & 0x8000000000000000) != 0)
      *((_QWORD *)v222 + 51) = v294;
  }
  if ((*((_WORD *)v222 + 193) & 0x204) != 0
    && !v222[62]
    && !v222[63]
    && (*((BOOL (**)(uint64_t, uint64_t, unsigned __int16 **))hasAllQueryTermMatchCounts + 2))((uint64_t)hasAllQueryTermMatchCounts, v294, (unsigned __int16 **)v311))
  {
    v297[62] = 1;
  }
  (*((void (**)(uint64_t, uint64_t, void **))destroyQueryTermMatchCounts + 2))((uint64_t)destroyQueryTermMatchCounts, v294, v311);
  objc_msgSend(v297, "populateTextContentDistanceMeasures:", &v312);
  objc_msgSend(v297, "populateCrossAttributeDerivedFeaturesWithContext:featureScoreInfo:", v284, &v312);
  objc_msgSend(v297, "populateBundleSpecificFeatures:currentTime:", &v312, v15);
  v232 = objc_msgSend(v296, "queryID");
  objc_msgSend(v297, "populateOtherFeatures:withEvaluator:currentTime:quParsedEvaluator:queryID:", &v312, v296, v262, v232, v15);
  objc_msgSend(v297, "updateBundleFeatures:withArrValues:featureScoreInfo:", v254, v267, &v312);
  objc_msgSend(v296, "queryTerms");
  v233 = (void *)objc_claimAutoreleasedReturnValue();
  v234 = objc_msgSend(v233, "count");
  *(_WORD *)&v312[2 * v314] = 363;
  v235 = v314;
  *(_QWORD *)&v314 = v314 + 1;
  *(float *)&v313[4 * v235] = (float)v234;

  v236 = objc_msgSend(v289, "isPeopleSearch");
  *(_WORD *)&v312[2 * v314] = 364;
  v237 = v314;
  v238 = 0.0;
  if (v236)
    v238 = 1.0;
  *(float *)&v313[4 * v314] = v238;
  *(_QWORD *)&v314 = v237 + 1;
  objc_msgSend(*((id *)v297 + 30), "setScores:forFeatures:count:");
  v239 = (void *)*((_QWORD *)v297 + 45);
  *((_QWORD *)v297 + 45) = 0;

  objc_msgSend(v297, "populateRemainingFeaturesWithRanker:", v289);
LABEL_350:

}

uint64_t __163__PRSRankingItem_populateFeaturesWithEvaluator_updatingBundleFeatures_withContext_keyboardLanguage_isCJK_currentTime_withRanker_attributeHolder_quParsedEvaluator___block_invoke(uint64_t result, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;

  if ((a2 & 6) == 2)
  {
    v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
    ++*(_WORD *)(v6 + 2 * a6);
  }
  return result;
}

uint64_t __163__PRSRankingItem_populateFeaturesWithEvaluator_updatingBundleFeatures_withContext_keyboardLanguage_isCJK_currentTime_withRanker_attributeHolder_quParsedEvaluator___block_invoke_2(uint64_t result, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unint64_t a7)
{
  uint64_t v7;

  if ((a2 & 2) != 0 && !(a2 & 4 | a7))
  {
    v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
    ++*(_WORD *)(v7 + 2 * a6);
  }
  return result;
}

- (void)populateTextFeatureValuesForProperty:(id)a3 updatingBundleFeatureValues:(float *)(a4 propertyIndex:withEvaluator:withContext:featureScoreInfo:propertyCanFuzzyMatch:keyboardLanguage:isCJK:propertyName:seenAuthorEmail:seenPrimaryRecipientEmail:
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  LOWORD(v16) = __PAIR16__(a14, a13);
  LOBYTE(v15) = a11;
  LOBYTE(v14) = a9;
  -[PRSRankingItem populateTextFeatureValuesForProperty:updatingBundleFeatureValues:propertyIndex:withEvaluator:withContext:featureScoreInfo:propertyCanFuzzyMatch:keyboardLanguage:isCJK:featureList:propertyName:seenAuthorEmail:seenPrimaryRecipientEmail:](self, "populateTextFeatureValuesForProperty:updatingBundleFeatureValues:propertyIndex:withEvaluator:withContext:featureScoreInfo:propertyCanFuzzyMatch:keyboardLanguage:isCJK:featureList:propertyName:seenAuthorEmail:seenPrimaryRecipientEmail:", a3, a4, a5, a6, a7, a8, v14, a10, v15, &sFeatureList, a12, v16);
}

- (void)populateTextFeatureValuesForProperty:(id)a3 updatingBundleFeatureValues:(float *)(a4 propertyIndex:withEvaluator:withContext:featureScoreInfo:propertyCanFuzzyMatch:keyboardLanguage:isCJK:featureList:propertyName:seenAuthorEmail:seenPrimaryRecipientEmail:
{
  id v18;
  char *v19;
  id v20;
  void *v21;
  prs_feature_population_ctx_t *v22;
  uint64_t v23;
  unint64_t var3;
  __CFArray *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  __CFArray *v52;
  uint64_t v53;
  unint64_t v54;
  id v55;
  void *v56;
  prs_feature_population_ctx_t *v57;
  unint64_t var13;
  unint64_t v59;
  __CFArray *v60;
  id v61;
  __CFArray *v62;
  uint64_t *v63;
  unsigned __int16 *v64;
  unsigned __int16 *v65;
  int v66;
  unint64_t v67;
  int v68;
  int v69;
  int v70;
  float v71;
  float v72;
  __CFArray *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t i;
  __CFArray *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t j;
  BOOL v85;
  PRSRankingItem *v86;
  unint64_t v87;
  float v88;
  float v89;
  prs_feature_population_ctx_t *v90;
  unsigned int *p_var9;
  unsigned int var9;
  float *var1;
  unint64_t var2;
  uint64_t v95;
  float *v96;
  unint64_t v97;
  uint64_t v98;
  float *v99;
  unint64_t v100;
  uint64_t v101;
  unsigned __int16 v102;
  float *v103;
  unint64_t v104;
  float v105;
  uint64_t v106;
  unsigned __int16 v107;
  float *v108;
  unint64_t v109;
  float v110;
  float var5;
  float maxCoverage;
  float v113;
  uint64_t v114;
  float *v115;
  unint64_t v116;
  float v117;
  uint64_t v118;
  float *v119;
  unint64_t v120;
  uint64_t v121;
  unsigned __int16 v122;
  float *v123;
  unint64_t v124;
  float v125;
  uint64_t v126;
  unsigned __int16 v127;
  float *v128;
  unint64_t v129;
  float v130;
  float v131;
  float v132;
  int v133;
  int v134;
  int v135;
  int v136;
  uint64_t v137;
  float v138;
  float *v139;
  unint64_t v140;
  uint64_t v141;
  float v142;
  float *v143;
  unint64_t v144;
  uint64_t v145;
  unsigned __int16 v146;
  unsigned int v147;
  float *v148;
  unint64_t v149;
  uint64_t v150;
  unsigned __int16 v151;
  float v152;
  float *v153;
  unint64_t v154;
  float v155;
  float v156;
  float v157;
  void *v158;
  uint64_t v159;
  void *v160;
  uint64_t v161;
  unsigned __int16 v162;
  unsigned int v163;
  float *v164;
  unint64_t v165;
  uint64_t v166;
  unsigned __int16 v167;
  unsigned int v168;
  float *v169;
  unint64_t v170;
  uint64_t v171;
  unsigned __int16 v172;
  float *v173;
  unint64_t v174;
  float v175;
  uint64_t v176;
  unsigned __int16 v177;
  float *v178;
  unint64_t v179;
  float v180;
  float var6;
  uint64_t v182;
  float *v183;
  unint64_t v184;
  uint64_t v185;
  float *v186;
  unint64_t v187;
  uint64_t v188;
  unsigned __int16 v189;
  float *v190;
  unint64_t v191;
  float v192;
  uint64_t v193;
  unsigned __int16 v194;
  float *v195;
  unint64_t v196;
  float v197;
  float v198;
  float v199;
  int v200;
  int v201;
  int v202;
  int v203;
  uint64_t v204;
  float v205;
  float *v206;
  unint64_t v207;
  uint64_t v208;
  unsigned __int16 v209;
  unsigned int v210;
  float *v211;
  unint64_t v212;
  uint64_t v213;
  unsigned __int16 v214;
  double v215;
  double v216;
  double v217;
  float v218;
  double v219;
  double v220;
  double v221;
  float *v222;
  unint64_t v223;
  float v224;
  float v225;
  unint64_t v226;
  double v227;
  double v228;
  uint64_t v229;
  double v230;
  double v231;
  float *v232;
  unint64_t v233;
  uint64_t v234;
  float *v235;
  unint64_t v236;
  uint64_t v237;
  double v238;
  float v239;
  float *v240;
  unint64_t v241;
  uint64_t v242;
  float *v243;
  unint64_t v244;
  uint64_t v245;
  double v246;
  float *v247;
  unint64_t v248;
  unint64_t v249;
  float (*v250)[];
  unint64_t v251;
  uint64_t v252;
  float *v253;
  uint64_t v254;
  float v255;
  float *v256;
  unint64_t v257;
  uint64_t v258;
  float v259;
  float *v260;
  unint64_t v261;
  uint64_t v262;
  float v263;
  float *v264;
  unint64_t v265;
  uint64_t v266;
  float v267;
  float *v268;
  unint64_t v269;
  uint64_t v270;
  double v271;
  float *v272;
  unint64_t v273;
  unint64_t v274;
  unint64_t v275;
  double v276;
  double v277;
  float v278;
  double v279;
  double v280;
  double v281;
  uint64_t v282;
  uint64_t v283;
  uint64_t v284;
  uint64_t v285;
  uint64_t v286;
  uint64_t v287;
  uint64_t v288;
  uint64_t v289;
  uint64_t v290;
  float *v291;
  unint64_t v292;
  uint64_t v293;
  float *v294;
  unint64_t v295;
  uint64_t v296;
  uint64_t v297;
  float *v298;
  unint64_t v299;
  uint64_t v300;
  float *v301;
  unint64_t v302;
  uint64_t v303;
  float v304;
  float *v305;
  unint64_t v306;
  float (*v307)[];
  unint64_t v308;
  float (*v309)[];
  unint64_t v310;
  uint64_t v311;
  prs_feature_population_ctx_t *v312;
  uint64_t v313;
  size_t v314;
  double v315;
  double v316;
  double v317;
  float v318;
  double v319;
  double v320;
  double v321;
  unint64_t v322;
  unsigned __int16 *v323;
  char *v324;
  unint64_t v325;
  int v326;
  uint64_t v327;
  uint64_t v328;
  float *v329;
  unint64_t v330;
  uint64_t v331;
  float *v332;
  unint64_t v333;
  uint64_t v334;
  uint64_t v335;
  float *v336;
  unint64_t v337;
  uint64_t v338;
  float *v339;
  unint64_t v340;
  uint64_t v341;
  float v342;
  float *v343;
  unint64_t v344;
  PRSRankingItem *v345;
  prs_feature_population_ctx_t *v346;
  float (*v347)[];
  unint64_t v348;
  uint64_t v349;
  uint64_t v350;
  unint64_t v351;
  char *v352;
  uint64_t v353;
  uint64_t v354;
  uint64_t v355;
  uint64_t v356;
  uint64_t v357;
  uint64_t v358;
  uint64_t v359;
  uint64_t v360;
  uint64_t v361;
  char *v362;
  size_t v363;
  double v364;
  double v365;
  double v366;
  float v367;
  double v368;
  double v369;
  double v370;
  unsigned __int16 *v371;
  char *v372;
  unint64_t v373;
  int v374;
  uint64_t v375;
  float v376;
  float v377;
  float *v378;
  unint64_t v379;
  uint64_t v380;
  float *v381;
  unint64_t v382;
  uint64_t v383;
  float v384;
  float v385;
  float *v386;
  unint64_t v387;
  uint64_t v388;
  float *v389;
  unint64_t v390;
  uint64_t v391;
  float v392;
  float *v393;
  unint64_t v394;
  float *v395;
  float (*v396)[];
  unint64_t v397;
  uint64_t v398;
  PRSRankingItem *v399;
  unint64_t v400;
  unint64_t attrExact;
  uint64_t v402;
  unint64_t v403;
  float v404;
  float v405;
  unint64_t v406;
  unint64_t attrStrong;
  uint64_t v408;
  unint64_t v409;
  float v410;
  unint64_t v411;
  unint64_t attrAsTyped;
  uint64_t v413;
  unint64_t v414;
  id v415;
  id v416;
  char *v417;
  id v418;
  id *v419;
  id v420;
  uint64_t v421;
  id v422;
  PRSRankingItem *v423;
  char *v424;
  unint64_t v425;
  uint64_t v426;
  unint64_t v427;
  prs_feature_population_ctx_t *v428;
  float (*v429)[];
  uint64_t v430;
  uint64_t v431;
  float v432;
  float v433;
  uint64_t v434;
  uint64_t v435;
  __int128 v436;
  __int128 v437;
  __int128 v438;
  __int128 v439;
  __int128 v440;
  __int128 v441;
  __int128 v442;
  __int128 v443;
  _QWORD v444[4];
  __CFArray *v445;
  id v446;
  id v447;
  char *v448;
  id v449;
  __CFArray *v450;
  uint64_t *v451;
  uint64_t *v452;
  uint64_t *v453;
  uint64_t *v454;
  uint64_t *v455;
  uint64_t *v456;
  unint64_t v457;
  unint64_t v458;
  prs_feature_population_ctx_t *v459;
  uint64_t v460;
  float *v461;
  uint64_t v462;
  int v463;
  uint64_t v464;
  float *v465;
  uint64_t v466;
  int v467;
  uint64_t v468;
  float *v469;
  uint64_t v470;
  int v471;
  uint64_t v472;
  uint64_t *v473;
  uint64_t v474;
  char *v475;
  uint64_t v476;
  uint64_t *v477;
  uint64_t v478;
  char *v479;
  uint64_t v480;
  uint64_t *v481;
  uint64_t v482;
  char *v483;
  _BYTE v484[128];
  _BYTE v485[128];
  uint64_t v486;

  v427 = a5;
  v428 = a7;
  v429 = a4;
  v486 = *MEMORY[0x1E0C80C00];
  v18 = a3;
  v422 = a6;
  v19 = (char *)a10;
  v20 = a13;
  if (!self->_spanCalculator)
    -[PRSRankingItem populateTextFeatureValuesForProperty:updatingBundleFeatureValues:propertyIndex:withEvaluator:withContext:featureScoreInfo:propertyCanFuzzyMatch:keyboardLanguage:isCJK:featureList:propertyName:seenAuthorEmail:seenPrimaryRecipientEmail:].cold.1();
  v21 = v20;
  v426 = sRequiredAttributesCount;
  v423 = self;
  v424 = v19;
  v420 = v20;
  if ((unint64_t)objc_msgSend(v18, "length") < 0x65)
    goto LABEL_8;
  v22 = v428;
  if ((+[PRSRankingItemRanker isKeywordsHidingEnabled](PRSRankingItemRanker, "isKeywordsHidingEnabled")
     || (self->_bundleIDType & 0x100) == 0
     || (objc_msgSend(v21, "isEqualToString:", *MEMORY[0x1E0CA6428]) & 1) == 0)
    && (objc_msgSend(v21, "isEqualToString:", *MEMORY[0x1E0CA60F0]) & 1) == 0)
  {
    objc_msgSend(v18, "substringToIndex:", 100);
    v23 = objc_claimAutoreleasedReturnValue();

    v18 = (id)v23;
LABEL_8:
    v22 = v428;
  }
  var3 = v22->var3;
  v25 = v22->var0;
  v419 = &v415;
  MEMORY[0x1E0C80A78](v25, v26, v27, v28, v29, v30, v31, v32);
  v34 = (char *)&v415 - v33;
  bzero((char *)&v415 - v33, 4 * var3);
  bzero(v34, 4 * var3);
  v480 = 0;
  v481 = &v480;
  v482 = 0x2020000000;
  v483 = v34;
  MEMORY[0x1E0C80A78](v35, v36, v37, v38, v39, v40, v41, v42);
  v43 = (2 * (int)var3 + 15) & 0x3F0;
  bzero((char *)&v415 - v43, 2 * var3);
  bzero((char *)&v415 - v43, 2 * var3);
  MEMORY[0x1E0C80A78](v44, v45, v46, v47, v48, v49, v50, v51);
  bzero((char *)&v415 - v43, 2 * var3);
  v421 = 2 * var3;
  bzero((char *)&v415 - v43, 2 * var3);
  v476 = 0;
  v477 = &v476;
  v478 = 0x2020000000;
  v479 = (char *)&v415 - v43;
  v472 = 0;
  v473 = &v472;
  v474 = 0x2020000000;
  v475 = (char *)&v415 - v43;
  v52 = v22->var1;
  v425 = var3;
  if (var3)
  {
    v53 = *MEMORY[0x1E0C9B0D0];
    v54 = v425;
    do
    {
      -[__CFArray addObject:](v25, "addObject:", v53);
      -[__CFArray addObject:](v52, "addObject:", v53);
      --v54;
    }
    while (v54);
  }
  v55 = v422;
  objc_msgSend(v422, "queryTerms");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = v428;
  var13 = v428->var13;
  v468 = 0;
  v469 = (float *)&v468;
  v470 = 0x2020000000;
  v471 = 0;
  v464 = 0;
  v465 = (float *)&v464;
  v466 = 0x2020000000;
  v467 = 0;
  v460 = 0;
  v461 = (float *)&v460;
  v462 = 0x2020000000;
  v463 = 0;
  v444[0] = MEMORY[0x1E0C809B0];
  v444[1] = 3221225472;
  v444[2] = __252__PRSRankingItem_populateTextFeatureValuesForProperty_updatingBundleFeatureValues_propertyIndex_withEvaluator_withContext_featureScoreInfo_propertyCanFuzzyMatch_keyboardLanguage_isCJK_featureList_propertyName_seenAuthorEmail_seenPrimaryRecipientEmail___block_invoke;
  v444[3] = &unk_1E6E52ED0;
  v59 = v425;
  v457 = var13;
  v458 = v425;
  v60 = v25;
  v445 = v60;
  v420 = v420;
  v446 = v420;
  v61 = v18;
  v447 = v61;
  v417 = v424;
  v448 = v417;
  v451 = &v468;
  v452 = &v464;
  v418 = v56;
  v449 = v418;
  v453 = &v476;
  v454 = &v480;
  v459 = v57;
  v62 = v52;
  v450 = v62;
  v455 = &v460;
  v456 = &v472;
  v416 = v61;
  v424 = (char *)objc_msgSend(v55, "evaluateAttribute:ignoreSubtokens:strongCompounds:skipTranscriptions:withHandler:", v61, 0, 1, 0, v444);
  v63 = (uint64_t *)MEMORY[0x1E0C9B0D0];
  if ((_DWORD)v59)
  {
    v64 = (unsigned __int16 *)v477[3];
    v65 = (unsigned __int16 *)v473[3];
    LOBYTE(v66) = 1;
    v67 = v59;
    LOBYTE(v68) = 1;
    do
    {
      v69 = *v64++;
      v68 = v68 & (v69 != 0);
      v70 = *v65++;
      v66 = (v70 != 0) & v66;
      if ((v68 & 1) == 0 && (v66 & 1) == 0)
      {
        v71 = 0.0;
        v72 = 0.0;
        goto LABEL_27;
      }
      --v67;
    }
    while (v67);
    if (v68)
      goto LABEL_20;
LABEL_21:
    v71 = 0.0;
    v72 = 0.0;
    if (!v66)
      goto LABEL_27;
    goto LABEL_25;
  }
  v66 = 1;
LABEL_20:
  if ((-[__CFArray containsObject:](v60, "containsObject:", *MEMORY[0x1E0C9B0D0]) & 1) != 0)
    goto LABEL_21;
  v71 = (float)v59 / (float)(unint64_t)v424;
  v72 = 0.0;
  if ((v66 & 1) == 0)
    goto LABEL_27;
LABEL_25:
  if ((-[__CFArray containsObject:](v62, "containsObject:", *v63) & 1) == 0)
    v72 = (float)v59 / (float)(unint64_t)v424;
LABEL_27:
  v442 = 0u;
  v443 = 0u;
  v440 = 0u;
  v441 = 0u;
  v73 = v60;
  v74 = 0;
  v75 = -[__CFArray countByEnumeratingWithState:objects:count:](v73, "countByEnumeratingWithState:objects:count:", &v440, v485, 16);
  if (v75)
  {
    v76 = *(_QWORD *)v441;
    v77 = *v63;
    do
    {
      for (i = 0; i != v75; ++i)
      {
        if (*(_QWORD *)v441 != v76)
          objc_enumerationMutation(v73);
        v74 += objc_msgSend(*(id *)(*((_QWORD *)&v440 + 1) + 8 * i), "isEqual:", v77);
      }
      v75 = -[__CFArray countByEnumeratingWithState:objects:count:](v73, "countByEnumeratingWithState:objects:count:", &v440, v485, 16);
    }
    while (v75);
  }

  v438 = 0u;
  v439 = 0u;
  v436 = 0u;
  v437 = 0u;
  v79 = v62;
  v80 = 0;
  v81 = -[__CFArray countByEnumeratingWithState:objects:count:](v79, "countByEnumeratingWithState:objects:count:", &v436, v484, 16);
  if (v81)
  {
    v82 = *(_QWORD *)v437;
    v83 = *MEMORY[0x1E0C9B0D0];
    do
    {
      for (j = 0; j != v81; ++j)
      {
        if (*(_QWORD *)v437 != v82)
          objc_enumerationMutation(v79);
        v80 += objc_msgSend(*(id *)(*((_QWORD *)&v436 + 1) + 8 * j), "isEqual:", v83);
      }
      v81 = -[__CFArray countByEnumeratingWithState:objects:count:](v79, "countByEnumeratingWithState:objects:count:", &v436, v484, 16);
    }
    while (v81);
  }
  v85 = v429 == 0;

  v86 = v423;
  v87 = v425;
  v88 = (float)(v87 - v74) / (float)v87;
  v89 = (float)(v87 - v80) / (float)v87;
  v90 = v428;
  var9 = v428->var9;
  p_var9 = &v428->var9;
  v428->var9 = var9 + 1;
  a8->var0[a8->var2] = a12[var9];
  var1 = a8->var1;
  var2 = a8->var2;
  a8->var2 = var2 + 1;
  var1[var2] = v88;
  v95 = *p_var9;
  *p_var9 = v95 + 1;
  a8->var0[var2 + 1] = a12[v95];
  v96 = a8->var1;
  v97 = a8->var2;
  a8->var2 = v97 + 1;
  v96[v97] = v89;
  if (!v85)
  {
    if (v90->var4[16] < v88)
      v90->var4[16] = v88;
    if (v90->var4[17] < v89)
      v90->var4[17] = v89;
  }
  v98 = *p_var9;
  *p_var9 = v98 + 1;
  a8->var0[v97 + 1] = a12[v98];
  v99 = a8->var1;
  v100 = a8->var2;
  a8->var2 = v100 + 1;
  v99[v100] = 1.0;
  -[PRSRankingSpanCalculator updateWithTermPositions:queryTermCount:tokenCount:](v86->_spanCalculator, "updateWithTermPositions:queryTermCount:tokenCount:", v73);
  v101 = *p_var9;
  *p_var9 = v101 + 1;
  v102 = a12[v101];
  -[PRSRankingSpanCalculator unordered](v86->_spanCalculator, "unordered");
  a8->var0[a8->var2] = v102;
  v103 = a8->var1;
  v104 = a8->var2;
  a8->var2 = v104 + 1;
  v103[v104] = v105;
  v106 = *p_var9;
  *p_var9 = v106 + 1;
  v107 = a12[v106];
  -[PRSRankingSpanCalculator ordered](v86->_spanCalculator, "ordered");
  a8->var0[a8->var2] = v107;
  v108 = a8->var1;
  v109 = a8->var2;
  a8->var2 = v109 + 1;
  v108[v109] = v110;
  if (-[PRSRankingSpanCalculator pathExists](v86->_spanCalculator, "pathExists"))
  {
    if (v71 > 0.0)
    {
      var5 = v428->var5;
      if (v71 >= var5)
        var5 = v71;
      v428->var5 = var5;
      maxCoverage = v86->_maxCoverage;
      if (v71 <= maxCoverage)
      {
        if (v71 != maxCoverage)
          goto LABEL_59;
        -[PRSRankingSpanCalculator firstTermPosition](v86->_spanCalculator, "firstTermPosition");
        if (v117 >= v86->_firstPosition)
          goto LABEL_59;
        -[PRSRankingSpanCalculator firstTermPosition](v86->_spanCalculator, "firstTermPosition");
      }
      else
      {
        v86->_maxCoverage = v71;
        -[PRSRankingSpanCalculator firstTermPosition](v86->_spanCalculator, "firstTermPosition");
      }
      v86->_firstPosition = v113;
    }
LABEL_59:
    if (v429)
      *((float *)v429 + 13 * v426 + v427) = v71;
    v118 = *p_var9;
    *p_var9 = v118 + 1;
    a8->var0[a8->var2] = a12[v118];
    v119 = a8->var1;
    v120 = a8->var2;
    a8->var2 = v120 + 1;
    v119[v120] = v71;
    goto LABEL_62;
  }
  if (v429)
    *((_DWORD *)v429 + 13 * v426 + v427) = 0;
  v114 = *p_var9;
  *p_var9 = v114 + 1;
  a8->var0[a8->var2] = a12[v114];
  v115 = a8->var1;
  v116 = a8->var2;
  a8->var2 = v116 + 1;
  v115[v116] = 0.0;
LABEL_62:
  v121 = *p_var9;
  *p_var9 = v121 + 1;
  v122 = a12[v121];
  -[PRSRankingSpanCalculator pairDist](v86->_spanCalculator, "pairDist");
  a8->var0[a8->var2] = v122;
  v123 = a8->var1;
  v124 = a8->var2;
  a8->var2 = v124 + 1;
  v123[v124] = v125;
  v126 = *p_var9;
  *p_var9 = v126 + 1;
  v127 = a12[v126];
  -[PRSRankingSpanCalculator firstTermPosition](v86->_spanCalculator, "firstTermPosition");
  a8->var0[a8->var2] = v127;
  v128 = a8->var1;
  v129 = a8->var2;
  a8->var2 = v129 + 1;
  v128[v129] = v130;
  -[PRSRankingSpanCalculator firstTermPosition](v86->_spanCalculator, "firstTermPosition");
  if (v131 < v428->var7)
  {
    -[PRSRankingSpanCalculator firstTermPosition](v86->_spanCalculator, "firstTermPosition");
    v428->var7 = v132;
  }
  if (v429)
  {
    -[PRSRankingSpanCalculator unordered](v86->_spanCalculator, "unordered");
    *((_DWORD *)v429 + 17 * v426 + v427) = v133;
    -[PRSRankingSpanCalculator ordered](v86->_spanCalculator, "ordered");
    *((_DWORD *)v429 + 19 * v426 + v427) = v134;
    -[PRSRankingSpanCalculator pairDist](v86->_spanCalculator, "pairDist");
    *((_DWORD *)v429 + 21 * v426 + v427) = v135;
    -[PRSRankingSpanCalculator firstTermPosition](v86->_spanCalculator, "firstTermPosition");
    *((_DWORD *)v429 + 15 * v426 + v427) = v136;
  }
  v137 = *p_var9;
  *p_var9 = v137 + 1;
  v138 = v469[6];
  a8->var0[a8->var2] = a12[v137];
  v139 = a8->var1;
  v140 = a8->var2;
  a8->var2 = v140 + 1;
  v139[v140] = v138;
  v141 = *p_var9;
  *p_var9 = v141 + 1;
  v142 = v465[6];
  a8->var0[v140 + 1] = a12[v141];
  v143 = a8->var1;
  v144 = a8->var2;
  a8->var2 = v144 + 1;
  v143[v144] = v142;
  v145 = *p_var9;
  *p_var9 = v145 + 1;
  v146 = a12[v145];
  v147 = -[PRSRankingSpanCalculator n2Exists](v86->_spanCalculator, "n2Exists");
  a8->var0[a8->var2] = v146;
  v148 = a8->var1;
  v149 = a8->var2;
  a8->var2 = v149 + 1;
  v148[v149] = (float)v147;
  v150 = *p_var9;
  *p_var9 = v150 + 1;
  v151 = a12[v150];
  v152 = (float)-[PRSRankingSpanCalculator n3Exists](v86->_spanCalculator, "n3Exists");
  a8->var0[a8->var2] = v151;
  v153 = a8->var1;
  v154 = a8->var2;
  a8->var2 = v154 + 1;
  v153[v154] = v152;
  if (v429)
  {
    -[PRSRankingSpanCalculator unordered](v86->_spanCalculator, "unordered");
    if (v428->var4[22] > v155)
      v428->var4[22] = v155;
    -[PRSRankingSpanCalculator ordered](v86->_spanCalculator, "ordered");
    if (v428->var4[24] > v156)
      v428->var4[24] = v156;
    -[PRSRankingSpanCalculator pairDist](v86->_spanCalculator, "pairDist");
    if (v428->var4[26] > v157)
      v428->var4[26] = v157;
  }
  v158 = (void *)-[__CFArray mutableCopy](v79, "mutableCopy");
  if (objc_msgSend(v158, "count"))
  {
    v159 = objc_msgSend(v158, "count");
    if (v159 == -[__CFArray count](v73, "count"))
    {
      objc_msgSend(v158, "removeLastObject");
      -[__CFArray lastObject](v73, "lastObject");
      v160 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v158, "addObject:", v160);

    }
  }
  -[PRSRankingSpanCalculator updateWithTermPositions:queryTermCount:tokenCount:](v86->_spanCalculator, "updateWithTermPositions:queryTermCount:tokenCount:", v158, v425, v424);
  v161 = *p_var9;
  *p_var9 = v161 + 1;
  v162 = a12[v161];
  v163 = -[PRSRankingSpanCalculator n2Exists](v86->_spanCalculator, "n2Exists");
  a8->var0[a8->var2] = v162;
  v164 = a8->var1;
  v165 = a8->var2;
  a8->var2 = v165 + 1;
  v164[v165] = (float)v163;
  v166 = *p_var9;
  *p_var9 = v166 + 1;
  v167 = a12[v166];
  v168 = -[PRSRankingSpanCalculator n3Exists](v86->_spanCalculator, "n3Exists");
  a8->var0[a8->var2] = v167;
  v169 = a8->var1;
  v170 = a8->var2;
  a8->var2 = v170 + 1;
  v169[v170] = (float)v168;
  -[PRSRankingSpanCalculator updateWithTermPositions:queryTermCount:tokenCount:](v86->_spanCalculator, "updateWithTermPositions:queryTermCount:tokenCount:", v79, v425, v424);
  v171 = *p_var9;
  *p_var9 = v171 + 1;
  v172 = a12[v171];
  -[PRSRankingSpanCalculator unordered](v86->_spanCalculator, "unordered");
  a8->var0[a8->var2] = v172;
  v173 = a8->var1;
  v174 = a8->var2;
  a8->var2 = v174 + 1;
  v173[v174] = v175;
  v176 = *p_var9;
  *p_var9 = v176 + 1;
  v177 = a12[v176];
  -[PRSRankingSpanCalculator ordered](v86->_spanCalculator, "ordered");
  a8->var0[a8->var2] = v177;
  v178 = a8->var1;
  v179 = a8->var2;
  a8->var2 = v179 + 1;
  v178[v179] = v180;
  if (-[PRSRankingSpanCalculator pathExists](v86->_spanCalculator, "pathExists"))
  {
    if (v72 > 0.0)
    {
      var6 = v428->var6;
      if (v72 >= var6)
        var6 = v72;
      v428->var6 = var6;
    }
    if (v429)
      *((float *)v429 + 14 * v426 + v427) = v72;
    v182 = *p_var9;
    *p_var9 = v182 + 1;
    a8->var0[a8->var2] = a12[v182];
    v183 = a8->var1;
    v184 = a8->var2;
    a8->var2 = v184 + 1;
    v183[v184] = v72;
  }
  else
  {
    if (v429)
      *((_DWORD *)v429 + 14 * v426 + v427) = 0;
    v185 = *p_var9;
    *p_var9 = v185 + 1;
    a8->var0[a8->var2] = a12[v185];
    v186 = a8->var1;
    v187 = a8->var2;
    a8->var2 = v187 + 1;
    v186[v187] = 0.0;
  }
  v188 = *p_var9;
  *p_var9 = v188 + 1;
  v189 = a12[v188];
  -[PRSRankingSpanCalculator pairDist](v86->_spanCalculator, "pairDist");
  a8->var0[a8->var2] = v189;
  v190 = a8->var1;
  v191 = a8->var2;
  a8->var2 = v191 + 1;
  v190[v191] = v192;
  v193 = *p_var9;
  *p_var9 = v193 + 1;
  v194 = a12[v193];
  -[PRSRankingSpanCalculator firstTermPosition](v86->_spanCalculator, "firstTermPosition");
  a8->var0[a8->var2] = v194;
  v195 = a8->var1;
  v196 = a8->var2;
  a8->var2 = v196 + 1;
  v195[v196] = v197;
  -[PRSRankingSpanCalculator firstTermPosition](v86->_spanCalculator, "firstTermPosition");
  if (v198 < v428->var8)
  {
    -[PRSRankingSpanCalculator firstTermPosition](v86->_spanCalculator, "firstTermPosition");
    v428->var8 = v199;
  }
  if (v429)
  {
    -[PRSRankingSpanCalculator unordered](v86->_spanCalculator, "unordered");
    *((_DWORD *)v429 + 18 * v426 + v427) = v200;
    -[PRSRankingSpanCalculator ordered](v86->_spanCalculator, "ordered");
    *((_DWORD *)v429 + 20 * v426 + v427) = v201;
    -[PRSRankingSpanCalculator pairDist](v86->_spanCalculator, "pairDist");
    *((_DWORD *)v429 + 22 * v426 + v427) = v202;
    -[PRSRankingSpanCalculator firstTermPosition](v86->_spanCalculator, "firstTermPosition");
    *((_DWORD *)v429 + 16 * v426 + v427) = v203;
  }
  v204 = *p_var9;
  *p_var9 = v204 + 1;
  v205 = v461[6];
  a8->var0[a8->var2] = a12[v204];
  v206 = a8->var1;
  v207 = a8->var2;
  a8->var2 = v207 + 1;
  v206[v207] = v205;
  v208 = *p_var9;
  *p_var9 = v208 + 1;
  v209 = a12[v208];
  v210 = -[PRSRankingSpanCalculator n2Exists](v86->_spanCalculator, "n2Exists");
  a8->var0[a8->var2] = v209;
  v211 = a8->var1;
  v212 = a8->var2;
  a8->var2 = v212 + 1;
  v211[v212] = (float)v210;
  v213 = *p_var9;
  *p_var9 = v213 + 1;
  v214 = a12[v213];
  *(float *)&v215 = (float)-[PRSRankingSpanCalculator n3Exists](v86->_spanCalculator, "n3Exists");
  a8->var0[a8->var2] = v214;
  v222 = a8->var1;
  v223 = a8->var2;
  a8->var2 = v223 + 1;
  v222[v223] = *(float *)&v215;
  if (v429)
  {
    -[PRSRankingSpanCalculator unordered](v86->_spanCalculator, "unordered");
    if (v428->var4[23] > v224)
      v428->var4[23] = v224;
    -[PRSRankingSpanCalculator ordered](v86->_spanCalculator, "ordered");
    if (v428->var4[25] > v225)
      v428->var4[25] = v225;
    -[PRSRankingSpanCalculator pairDist](v86->_spanCalculator, "pairDist");
    *(float *)&v216 = v428->var4[27];
    if (*(float *)&v216 > *(float *)&v215)
      v428->var4[27] = *(float *)&v215;
  }
  v434 = 0;
  v435 = 0;
  v433 = 0.0;
  v226 = v425;
  statisticsFromValues(v477[3], v425, (float *)&v435 + 1, (float *)&v435, (float *)&v434 + 1, (float *)&v434, &v433, 0, v215, v216, v217, v218, v219, v220, v221);
  v229 = *p_var9;
  *p_var9 = v229 + 1;
  LODWORD(v230) = HIDWORD(v435);
  LODWORD(v231) = v435;
  a8->var0[a8->var2] = a12[v229];
  v232 = a8->var1;
  v233 = a8->var2;
  a8->var2 = v233 + 1;
  v232[v233] = *(float *)&v230;
  v234 = *p_var9;
  *p_var9 = v234 + 1;
  a8->var0[v233 + 1] = a12[v234];
  v235 = a8->var1;
  v236 = a8->var2;
  a8->var2 = v236 + 1;
  v235[v236] = *(float *)&v231;
  v237 = *p_var9;
  *p_var9 = v237 + 1;
  LODWORD(v238) = HIDWORD(v434);
  v239 = *(float *)&v434;
  a8->var0[v236 + 1] = a12[v237];
  v240 = a8->var1;
  v241 = a8->var2;
  a8->var2 = v241 + 1;
  v240[v241] = *(float *)&v238;
  v242 = *p_var9;
  *p_var9 = v242 + 1;
  a8->var0[v241 + 1] = a12[v242];
  v243 = a8->var1;
  v244 = a8->var2;
  a8->var2 = v244 + 1;
  v243[v244] = v239;
  v245 = *p_var9;
  *p_var9 = v245 + 1;
  *(float *)&v246 = v433;
  a8->var0[v244 + 1] = a12[v245];
  v247 = a8->var1;
  v248 = a8->var2;
  v249 = v248 + 1;
  a8->var2 = v248 + 1;
  v247[v248] = *(float *)&v246;
  v250 = v429;
  if (v429)
  {
    v252 = v426;
    v251 = v427;
    *((_DWORD *)v429 + v426 + v427) = LODWORD(v231);
    *((_DWORD *)v250 + 2 * v252 + v251) = LODWORD(v230);
    *((_DWORD *)v250 + 5 * v252 + v251) = LODWORD(v238);
    v253 = (float *)v428;
    *(float *)&v227 = v428->var4[0];
    if (*(float *)&v227 < *(float *)&v230)
      v428->var4[0] = *(float *)&v230;
    if (v253[9] < *(float *)&v231)
      v253[9] = *(float *)&v231;
    if (v253[13] < *(float *)&v246)
      v253[13] = *(float *)&v246;
    if (v253[25] > *(float *)&v238)
      v253[25] = *(float *)&v238;
    *(float *)&v230 = v253[11];
    if (*(float *)&v230 < v239)
      v428->var4[4] = v239;
  }
  statisticsFromValues(v481[3], v226, (float *)&v435 + 1, (float *)&v435, (float *)&v434 + 1, (float *)&v434, &v433, 1, v230, v231, v238, v239, v246, v227, v228);
  v254 = *p_var9;
  *p_var9 = v254 + 1;
  v255 = *((float *)&v435 + 1);
  a8->var0[v249] = a12[v254];
  v256 = a8->var1;
  v257 = a8->var2;
  a8->var2 = v257 + 1;
  v256[v257] = v255;
  v258 = *p_var9;
  *p_var9 = v258 + 1;
  v259 = *(float *)&v435;
  a8->var0[v257 + 1] = a12[v258];
  v260 = a8->var1;
  v261 = a8->var2;
  a8->var2 = v261 + 1;
  v260[v261] = v259;
  v262 = *p_var9;
  *p_var9 = v262 + 1;
  v263 = *((float *)&v434 + 1);
  a8->var0[v261 + 1] = a12[v262];
  v264 = a8->var1;
  v265 = a8->var2;
  a8->var2 = v265 + 1;
  v264[v265] = v263;
  v266 = *p_var9;
  *p_var9 = v266 + 1;
  v267 = *(float *)&v434;
  a8->var0[v265 + 1] = a12[v266];
  v268 = a8->var1;
  v269 = a8->var2;
  a8->var2 = v269 + 1;
  v268[v269] = v267;
  v270 = *p_var9;
  *p_var9 = v270 + 1;
  *(float *)&v271 = v433;
  a8->var0[v269 + 1] = a12[v270];
  v272 = a8->var1;
  v273 = a8->var2;
  v274 = v226;
  v275 = v273 + 1;
  a8->var2 = v273 + 1;
  v272[v273] = *(float *)&v271;
  v282 = statisticsFromValues(v473[3], v274, (float *)&v435 + 1, (float *)&v435, (float *)&v434 + 1, (float *)&v434, &v433, 0, v271, v276, v277, v278, v279, v280, v281);
  v289 = *p_var9;
  *p_var9 = v289 + 1;
  v290 = v435;
  a8->var0[v275] = a12[v289];
  v291 = a8->var1;
  v292 = a8->var2;
  a8->var2 = v292 + 1;
  v291[v292] = *((float *)&v290 + 1);
  v293 = *p_var9;
  *p_var9 = v293 + 1;
  a8->var0[v292 + 1] = a12[v293];
  v294 = a8->var1;
  v295 = a8->var2;
  a8->var2 = v295 + 1;
  LODWORD(v294[v295]) = v290;
  v296 = *p_var9;
  *p_var9 = v296 + 1;
  v297 = v434;
  a8->var0[v295 + 1] = a12[v296];
  v298 = a8->var1;
  v299 = a8->var2;
  a8->var2 = v299 + 1;
  v298[v299] = *((float *)&v297 + 1);
  v300 = *p_var9;
  *p_var9 = v300 + 1;
  a8->var0[v299 + 1] = a12[v300];
  v301 = a8->var1;
  v302 = a8->var2;
  a8->var2 = v302 + 1;
  LODWORD(v301[v302]) = v297;
  v303 = *p_var9;
  *p_var9 = v303 + 1;
  v304 = v433;
  a8->var0[v302 + 1] = a12[v303];
  v305 = a8->var1;
  v306 = a8->var2;
  v307 = v250;
  v308 = v306 + 1;
  a8->var2 = v306 + 1;
  v305[v306] = v304;
  if (v307)
  {
    v309 = v429;
    v311 = v426;
    v310 = v427;
    *((_DWORD *)v429 + 3 * v426 + v427) = v290;
    *((_DWORD *)v309 + 4 * v311 + v310) = HIDWORD(v290);
    *((_DWORD *)v309 + 6 * v311 + v310) = HIDWORD(v297);
    v312 = v428;
    if (v428->var4[1] < *((float *)&v290 + 1))
      v428->var4[1] = *((float *)&v290 + 1);
    if (v312->var4[3] < *(float *)&v290)
      LODWORD(v312->var4[3]) = v290;
    if (v312->var4[7] < v304)
      v312->var4[7] = v304;
    if (v312->var4[19] > *((float *)&v297 + 1))
      v312->var4[19] = *((float *)&v297 + 1);
    if (v312->var4[5] < *(float *)&v297)
      LODWORD(v428->var4[5]) = v297;
  }
  v415 = v158;
  MEMORY[0x1E0C80A78](v282, v421, v283, v284, v285, v286, v287, v288);
  v424 = (char *)&v415 - v313;
  bzero((char *)&v415 - v313, v314);
  v322 = v425;
  if ((_DWORD)v425)
  {
    v323 = (unsigned __int16 *)v473[3];
    v324 = v424;
    v325 = v425;
    do
    {
      v326 = *v323++;
      *(_WORD *)v324 = v326 != 0;
      v324 += 2;
      --v325;
    }
    while (v325);
  }
  statisticsFromValues((uint64_t)v424, v322, (float *)&v435 + 1, (float *)&v435, (float *)&v434 + 1, (float *)&v434, &v433, 0, v315, v316, v317, v318, v319, v320, v321);
  v327 = *p_var9;
  *p_var9 = v327 + 1;
  v328 = v435;
  a8->var0[v308] = a12[v327];
  v329 = a8->var1;
  v330 = a8->var2;
  a8->var2 = v330 + 1;
  v329[v330] = *((float *)&v328 + 1);
  v331 = *p_var9;
  *p_var9 = v331 + 1;
  a8->var0[v330 + 1] = a12[v331];
  v332 = a8->var1;
  v333 = a8->var2;
  a8->var2 = v333 + 1;
  LODWORD(v332[v333]) = v328;
  v334 = *p_var9;
  *p_var9 = v334 + 1;
  v335 = v434;
  a8->var0[v333 + 1] = a12[v334];
  v336 = a8->var1;
  v337 = a8->var2;
  a8->var2 = v337 + 1;
  v336[v337] = *((float *)&v335 + 1);
  v338 = *p_var9;
  *p_var9 = v338 + 1;
  a8->var0[v337 + 1] = a12[v338];
  v339 = a8->var1;
  v340 = a8->var2;
  a8->var2 = v340 + 1;
  LODWORD(v339[v340]) = v335;
  v341 = *p_var9;
  *p_var9 = v341 + 1;
  v342 = v433;
  a8->var0[v340 + 1] = a12[v341];
  v343 = a8->var1;
  v344 = a8->var2;
  a8->var2 = v344 + 1;
  v343[v344] = v342;
  v345 = v423;
  v346 = v428;
  v347 = v429;
  if (v429)
  {
    if (v428->var4[9] < *((float *)&v328 + 1))
      v428->var4[9] = *((float *)&v328 + 1);
    if (v346->var4[11] < *(float *)&v328)
      LODWORD(v346->var4[11]) = v328;
    if (v346->var4[15] < v342)
      v346->var4[15] = v342;
    if (v346->var4[13] < *(float *)&v335)
      LODWORD(v346->var4[13]) = v335;
    if (v346->var4[21] > *((float *)&v335 + 1))
      v346->var4[21] = *((float *)&v335 + 1);
    v349 = v426;
    v348 = v427;
    *((_DWORD *)v347 + 8 * v426 + v427) = v328;
    *((_DWORD *)v347 + 10 * v349 + v348) = HIDWORD(v328);
    *((_DWORD *)v347 + 12 * v349 + v348) = HIDWORD(v335);
  }
  v350 = -[PRSRankingItem attrType:seenAuthorEmail:seenPrimaryRecipientEmail:](v345, "attrType:seenAuthorEmail:seenPrimaryRecipientEmail:", v420, a14, a15);
  v352 = v424;
  v351 = v425;
  v353 = v350;
  -[PRSRankingItem updateAttrCountsWord:queryTermCount:attrType:](v345, "updateAttrCountsWord:queryTermCount:attrType:", v424, v425, v350);
  -[PRSRankingItem updateAttrCountsWord2:queryTermCount:attrType:](v345, "updateAttrCountsWord2:queryTermCount:attrType:", v352, v351, v353);
  v354 = -[PRSRankingItem updateAttrCountsWord3:queryTermCount:attrType:](v345, "updateAttrCountsWord3:queryTermCount:attrType:", v352, v351, v353);
  MEMORY[0x1E0C80A78](v354, v421, v355, v356, v357, v358, v359, v360);
  v362 = (char *)&v415 - v361;
  bzero((char *)&v415 - v361, v363);
  if ((_DWORD)v351)
  {
    v371 = (unsigned __int16 *)v477[3];
    v372 = v362;
    v373 = v351;
    do
    {
      v374 = *v371++;
      *(_WORD *)v372 = v374 != 0;
      v372 += 2;
      --v373;
    }
    while (v373);
  }
  v432 = 0.0;
  v430 = 0;
  v431 = 0;
  statisticsFromValues((uint64_t)v362, v351, &v432, (float *)&v431 + 1, (float *)&v431, (float *)&v430 + 1, (float *)&v430, 0, v364, v365, v366, v367, v368, v369, v370);
  v375 = *p_var9;
  *p_var9 = v375 + 1;
  v377 = *((float *)&v431 + 1);
  v376 = v432;
  a8->var0[a8->var2] = a12[v375];
  v378 = a8->var1;
  v379 = a8->var2;
  a8->var2 = v379 + 1;
  v378[v379] = v376;
  v380 = *p_var9;
  *p_var9 = v380 + 1;
  a8->var0[v379 + 1] = a12[v380];
  v381 = a8->var1;
  v382 = a8->var2;
  a8->var2 = v382 + 1;
  v381[v382] = v377;
  v383 = *p_var9;
  *p_var9 = v383 + 1;
  v385 = *((float *)&v430 + 1);
  v384 = *(float *)&v431;
  a8->var0[v382 + 1] = a12[v383];
  v386 = a8->var1;
  v387 = a8->var2;
  a8->var2 = v387 + 1;
  v386[v387] = v384;
  v388 = *p_var9;
  *p_var9 = v388 + 1;
  a8->var0[v387 + 1] = a12[v388];
  v389 = a8->var1;
  v390 = a8->var2;
  a8->var2 = v390 + 1;
  v389[v390] = v385;
  v391 = *p_var9;
  *p_var9 = v391 + 1;
  v392 = *(float *)&v430;
  a8->var0[v390 + 1] = a12[v391];
  v393 = a8->var1;
  v394 = a8->var2;
  a8->var2 = v394 + 1;
  v393[v394] = v392;
  if (v429)
  {
    v395 = (float *)v428;
    if (v428->var4[8] < v376)
      v428->var4[8] = v376;
    if (v395[17] < v377)
      v395[17] = v377;
    if (v395[21] < v392)
      v395[21] = v392;
    if (v395[19] < v385)
      v395[19] = v385;
    if (v395[27] > v384)
      v395[27] = v384;
    v396 = v429;
    v398 = v426;
    v397 = v427;
    *((float *)v429 + 7 * v426 + v427) = v377;
    *((float *)v396 + 9 * v398 + v397) = v376;
    *((float *)v396 + 11 * v398 + v397) = v384;
  }
  v399 = v423;
  v400 = v425;
  -[PRSRankingItem updateAttrCountsPrefix:queryTermCount:attrType:](v423, "updateAttrCountsPrefix:queryTermCount:attrType:", v362, v425, v353);
  -[PRSRankingItem updateAttrCountsPrefix2:queryTermCount:attrType:](v399, "updateAttrCountsPrefix2:queryTermCount:attrType:", v362, v400, v353);
  -[PRSRankingItem updateAttrCountsPrefix3:queryTermCount:attrType:](v399, "updateAttrCountsPrefix3:queryTermCount:attrType:", v362, v400, v353);
  -[PRSRankingItem updateAttrCountsPrefixLast:termsDidMatchPrefix:queryTermCount:attrType:](v399, "updateAttrCountsPrefixLast:termsDidMatchPrefix:queryTermCount:attrType:", v424, v362, v400, v353);
  -[PRSRankingItem updateAttrCountsPrefixLast2:termsDidMatchPrefix:queryTermCount:attrType:](v399, "updateAttrCountsPrefixLast2:termsDidMatchPrefix:queryTermCount:attrType:", v424, v362, v400, v353);
  -[PRSRankingItem updateAttrCountsPrefixLast3:termsDidMatchPrefix:queryTermCount:attrType:](v399, "updateAttrCountsPrefixLast3:termsDidMatchPrefix:queryTermCount:attrType:", v424, v362, v400, v353);
  attrExact = v399->_attrExact;
  v402 = *p_var9;
  *p_var9 = v402 + 1;
  a8->var0[a8->var2] = a12[v402];
  v403 = a8->var2;
  v404 = 1.0;
  if ((attrExact & v353) != 0)
    v405 = 1.0;
  else
    v405 = 0.0;
  a8->var1[v403] = v405;
  v406 = v403 + 1;
  a8->var2 = v403 + 1;
  attrStrong = v399->_attrStrong;
  v408 = *p_var9;
  *p_var9 = v408 + 1;
  a8->var0[v406] = a12[v408];
  v409 = a8->var2;
  if ((attrStrong & v353) != 0)
    v410 = 1.0;
  else
    v410 = 0.0;
  a8->var1[v409] = v410;
  v411 = v409 + 1;
  a8->var2 = v409 + 1;
  attrAsTyped = v399->_attrAsTyped;
  v413 = *p_var9;
  *p_var9 = v413 + 1;
  a8->var0[v411] = a12[v413];
  v414 = a8->var2;
  if ((attrAsTyped & v353) == 0)
    v404 = 0.0;
  a8->var1[v414] = v404;
  a8->var2 = v414 + 1;

  _Block_object_dispose(&v460, 8);
  _Block_object_dispose(&v464, 8);
  _Block_object_dispose(&v468, 8);

  _Block_object_dispose(&v472, 8);
  _Block_object_dispose(&v476, 8);
  _Block_object_dispose(&v480, 8);

}

void __252__PRSRankingItem_populateTextFeatureValuesForProperty_updatingBundleFeatureValues_propertyIndex_withEvaluator_withContext_featureScoreInfo_propertyCanFuzzyMatch_keyboardLanguage_isCJK_featureList_propertyName_seenAuthorEmail_seenPrimaryRecipientEmail___block_invoke(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, uint64_t a7)
{
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  unint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  unint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char v42;
  char v43;
  char v44;
  uint8_t buf[4];
  unint64_t v46;
  __int16 v47;
  uint64_t v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  uint64_t v52;
  __int16 v53;
  uint64_t v54;
  __int16 v55;
  uint64_t v56;
  __int16 v57;
  unint64_t v58;
  __int16 v59;
  unint64_t v60;
  __int16 v61;
  unint64_t v62;
  __int16 v63;
  unint64_t v64;
  __int16 v65;
  uint64_t v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v15 = *(_QWORD *)(a1 + 128);
  v14 = *(NSObject **)(a1 + 136);
  if ((a2 & 7) == 1)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "count") <= a6)
    {
      v42 = v15;
      v43 = (char)v14;
      PRSLogCategoryDefault();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v33 = objc_msgSend(*(id *)(a1 + 32), "count");
        v34 = *(_QWORD *)(a1 + 136);
        v41 = *(_QWORD *)(a1 + 40);
        v35 = objc_msgSend(*(id *)(a1 + 48), "length");
        v36 = *(_QWORD *)(a1 + 56);
        *(_DWORD *)buf = 134220546;
        v46 = a6;
        v47 = 2048;
        v48 = v33;
        v49 = 2048;
        v50 = v34;
        v51 = 2112;
        v52 = v41;
        v53 = 2048;
        v54 = v35;
        v55 = 2112;
        v56 = v36;
        v57 = 2048;
        v58 = a2;
        v59 = 2048;
        v60 = a3;
        v61 = 2048;
        v62 = a4;
        v63 = 2048;
        v64 = a5;
        v65 = 2048;
        v66 = a7;
        _os_log_error_impl(&dword_1B86C5000, v14, OS_LOG_TYPE_ERROR, "matchedQueryTermIndex (%lu) >= prefixMatchIndicies.count (%lu), queryTermCount = %lu, propertyName = %@, propertyValue.length = %lu, keyboardLanguage = %@, matchedType = %lu, attributeRange.location = %lu, attributeRange.length = %lu, tokenType = %lu, matchedTokenIndex: %lu", buf, 0x70u);
      }

      getpid();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("matchedQueryTermIndex (%lu) >= prefixMatchIndicies.count (%lu), queryTermCount = %lu, propertyName = %@, propertyValue.length = %lu, keyboardLanguage = %@, matchedType = %lu, attributeRange.location = %lu, attributeRange.length = %lu, tokenType = %lu, matchedTokenIndex: %lu"), a6, objc_msgSend(*(id *)(a1 + 32), "count"), *(_QWORD *)(a1 + 136), *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "length"), *(_QWORD *)(a1 + 56), a2, a3, a4, a5, a7);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      SimulateCrash();

      LOBYTE(v15) = v42;
      LOBYTE(v14) = v43;
    }
    if (objc_msgSend(*(id *)(a1 + 32), "count") && objc_msgSend(*(id *)(a1 + 32), "count") > a6)
    {
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a6);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17 == (void *)*MEMORY[0x1E0C9B0D0])
      {
        v18 = a4;
        v19 = objc_opt_new();

        objc_msgSend(*(id *)(a1 + 32), "setObject:atIndexedSubscript:", v19, a6);
        v17 = (void *)v19;
        a4 = v18;
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a7);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addObject:", v20);

      *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8)
                                                                            + 24)
                                                                 + 1.0;
      objc_msgSend(*(id *)(a1 + 64), "objectAtIndexedSubscript:", a6);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = (float)((float)(unint64_t)objc_msgSend(v21, "length")
                                                                         / (float)a4)
                                                                 + *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8)
                                                                            + 24);

      v22 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24);
      ++*(_WORD *)(v22 + 2 * a6);
      objc_msgSend(*(id *)(a1 + 64), "objectAtIndexedSubscript:", a6);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "length");
      v25 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24);
      *(float *)(v25 + 4 * a6) = (float)((float)v24 / (float)a4) + *(float *)(v25 + 4 * a6);

      if (*(_QWORD *)(a1 + 128) == 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_24;
      v26 = (_QWORD *)(*(_QWORD *)(a1 + 144) + 160);
LABEL_23:
      *v26 |= 1 << (a6 + v14 * v15);
LABEL_24:

    }
  }
  else if ((a2 & 6) == 2)
  {
    if (objc_msgSend(*(id *)(a1 + 72), "count") <= a6)
    {
      v44 = (char)v14;
      PRSLogCategoryDefault();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v37 = objc_msgSend(*(id *)(a1 + 72), "count");
        v38 = *(_QWORD *)(a1 + 136);
        v39 = *(_QWORD *)(a1 + 40);
        v40 = *(_QWORD *)(a1 + 56);
        *(_DWORD *)buf = 134220290;
        v46 = a6;
        v47 = 2048;
        v48 = v37;
        v49 = 2048;
        v50 = v38;
        v51 = 2112;
        v52 = v39;
        v53 = 2112;
        v54 = v40;
        v55 = 2048;
        v56 = a2;
        v57 = 2048;
        v58 = a3;
        v59 = 2048;
        v60 = a4;
        v61 = 2048;
        v62 = a5;
        v63 = 2048;
        v64 = a7;
        _os_log_error_impl(&dword_1B86C5000, v14, OS_LOG_TYPE_ERROR, "matchedQueryTermIndex %lu >= wordMatchIndices.count %lu, queryTermCount = %lu, propertyName = %@, keyboardLanguage = %@, matchedType = %lu, attributeRange.location = %lu, attributeRange.length = %lu, tokenType = %lu, matchedTokenIndex: %lu", buf, 0x66u);
      }

      getpid();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("matchedQueryTermIndex %lu >= wordMatchIndices.count %lu, queryTermCount = %lu, propertyName = %@, keyboardLanguage = %@, matchedType = %lu, attributeRange.location = %lu, attributeRange.length = %lu, tokenType = %lu, matchedTokenIndex: %lu"), a6, objc_msgSend(*(id *)(a1 + 72), "count"), *(_QWORD *)(a1 + 136), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), a2, a3, a4, a5, a7);
      v27 = a7;
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      SimulateCrash();

      a7 = v27;
      LOBYTE(v14) = v44;
    }
    if (objc_msgSend(*(id *)(a1 + 72), "count") && objc_msgSend(*(id *)(a1 + 72), "count") > a6)
    {
      objc_msgSend(*(id *)(a1 + 72), "objectAtIndexedSubscript:", a6);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17 == (void *)*MEMORY[0x1E0C9B0D0])
      {
        v29 = a7;
        v30 = objc_opt_new();

        objc_msgSend(*(id *)(a1 + 72), "setObject:atIndexedSubscript:", v30, a6);
        v17 = (void *)v30;
        a7 = v29;
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a7);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addObject:", v31);

      *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24) = *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8)
                                                                             + 24)
                                                                  + 1.0;
      v32 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 24);
      ++*(_WORD *)(v32 + 2 * a6);
      if (*(_QWORD *)(a1 + 128) == 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_24;
      v26 = (_QWORD *)(*(_QWORD *)(a1 + 144) + 168);
      goto LABEL_23;
    }
  }
}

- (void)populateFeaturesWithEvaluator:(uint64_t)a3 withContext:(uint64_t)a4 keyboardLanguage:(uint64_t)a5 isCJK:(uint64_t)a6 currentTime:(uint64_t)a7 forParsecResult:(uint64_t)a8
{
  uint64_t v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  char v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  id *v21;
  int64x2_t v22;
  int64x2_t v23;
  uint64_t v24;
  int64x2_t v25;
  uint64x2_t v26;
  int8x16_t v27;
  int64x2_t v28;
  id v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  __CFString *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  unint64_t v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char v45;
  id v46;
  id v47;
  _BYTE *v48;
  _BYTE *v49;
  __int128 v50;
  _BYTE v51[6470];
  _BYTE v52[12956];

  v8 = MEMORY[0x1E0C80A78](a1, a2, a3, a4, a5, a6, a7, a8);
  v10 = v9;
  v12 = v11;
  v45 = v13;
  v15 = v14;
  v17 = v16;
  v18 = (void *)v8;
  *(_QWORD *)&v52[12940] = *MEMORY[0x1E0C80C00];
  v47 = v19;
  v46 = v15;
  v20 = v10;
  if (v18)
  {
    v21 = v18;
    objc_sync_enter(v21);
    if (*((_BYTE *)v21 + 74))
    {
      objc_sync_exit(v21);

    }
    else
    {
      *((_BYTE *)v21 + 74) = 1;
      objc_sync_exit(v21);

      *(_DWORD *)(v17 + 156) = 0;
      *(_OWORD *)(v17 + 140) = xmmword_1B87DF890;
      v22 = (int64x2_t)xmmword_1B87DF3B0;
      v23 = (int64x2_t)xmmword_1B87DF3C0;
      v24 = 28;
      v25 = vdupq_n_s64(0xFFFFFFFFFFFFFFEELL);
      v26 = (uint64x2_t)vdupq_n_s64(0xAuLL);
      v27.i64[0] = 0x4F0000004F000000;
      v27.i64[1] = 0x4F0000004F000000;
      v28 = vdupq_n_s64(4uLL);
      do
      {
        *(int8x16_t *)(v17 + v24) = vandq_s8(v27, (int8x16_t)vuzp1q_s32((int32x4_t)vcgtq_u64(v26, (uint64x2_t)vaddq_s64(v23, v25)), (int32x4_t)vcgtq_u64(v26, (uint64x2_t)vaddq_s64(v22, v25))));
        v22 = vaddq_s64(v22, v28);
        v23 = vaddq_s64(v23, v28);
        v24 += 16;
      }
      while (v24 != 140);
      *(_QWORD *)(v17 + 160) = 0;
      *(_QWORD *)(v17 + 168) = 0;
      bzero(v52, 0x328CuLL);
      bzero(v51, 0x1946uLL);
      v48 = v51;
      v49 = v52;
      v50 = xmmword_1B87DF8A0;
      if (requiredParsecTextFeatureAttributes_onceToken != -1)
        dispatch_once(&requiredParsecTextFeatureAttributes_onceToken, &__block_literal_global_939);
      v29 = (id)requiredParsecTextFeatureAttributes_attrs;
      v30 = objc_msgSend(v29, "count");
      if (v30)
      {
        v31 = v30;
        v32 = 0;
        v33 = 1;
        v34 = 0xFA / v30;
        do
        {
          objc_msgSend(v29, "objectAtIndexedSubscript:", v32);
          v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
          getResultPropertyValue(v20, sParsecTextTypesList[v32]);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v36, "length"))
          {
            prs_feature_population_ctx_reset_for_property(v17, v35, 1);
            LOWORD(v44) = 0;
            LOBYTE(v43) = v45;
            LOBYTE(v42) = 0;
            objc_msgSend(v21, "populateTextFeatureValuesForProperty:updatingBundleFeatureValues:propertyIndex:withEvaluator:withContext:featureScoreInfo:propertyCanFuzzyMatch:keyboardLanguage:isCJK:featureList:propertyName:seenAuthorEmail:seenPrimaryRecipientEmail:", v36, 0, v33++, v47, v17, &v48, v42, v46, v43, sParsecFeatureList, v35, v44);
          }
          else
          {
            *(_WORD *)&v48[2 * v50] = sParsecFeatureList[*(_DWORD *)(v17 + 156) + 2];
            v37 = v50;
            *(_QWORD *)&v50 = v50 + 1;
            *(_DWORD *)&v49[4 * v37] = 0;
            *(_DWORD *)(v17 + 156) += v34;
          }

          ++v32;
        }
        while (v31 != v32);
      }
      objc_msgSend(v21, "populateParsecBundleSpecificFeatures:currentTime:forParsecResult:", &v48, v20, v12);
      objc_msgSend(v21, "populateParsecRoundTripFeatures:forParsecResult:", v21[30], v20);
      objc_msgSend(v47, "queryTerms");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v38, "count");
      *(_WORD *)&v48[2 * v50] = 2296;
      v40 = v50;
      *(_QWORD *)&v50 = v50 + 1;
      *(float *)&v49[4 * v40] = (float)v39;

      objc_msgSend(v21[30], "setScores:forFeatures:count:", v49, v48, (_QWORD)v50);
      v41 = v21[45];
      v21[45] = 0;

      objc_msgSend(v21, "populateParsecRemainingFeatures");
    }
  }

}

+ (unsigned)featureFromVirtualIdx:(unint64_t)a3
{
  if (a3 >= 0x1C)
    +[PRSRankingItem featureFromVirtualIdx:].cold.1();
  return word_1B87E0D8C[a3];
}

- (id)dueDate
{
  return SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x1DuLL);
}

- (NSDate)interestingDate
{
  NSDate *interestingDate;
  NSDate *v3;
  void *v5;
  void *v6;
  uint64_t v7;
  NSDate **p_interestingDate;
  void *v9;
  unint64_t v10;
  void *v11;
  NSDate *v12;
  NSDate *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v19;
  unint64_t bundleIDType;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;

  interestingDate = self->_interestingDate;
  if (!interestingDate)
  {
    SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 9uLL);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x52uLL);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[PRSRankingItem moreRecentDateFromDate1:date2:](self, "moreRecentDateFromDate1:date2:", v5, v6);
      v7 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v7;
    }
    p_interestingDate = &self->_interestingDate;
    if (v6 && (self->_bundleIDType & 0x100008) == 0)
    {
      SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x20uLL);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x19uLL);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRSRankingItem moreRecentDateFromDate1:date2:](self, "moreRecentDateFromDate1:date2:", v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        -[PRSRankingItem moreRecentDateFromDate1:date2:](self, "moreRecentDateFromDate1:date2:", v16, v6);
        v17 = objc_claimAutoreleasedReturnValue();

        v6 = (void *)v17;
      }
      objc_storeStrong((id *)p_interestingDate, v6);
      v13 = v6;

      v3 = v13;
      goto LABEL_19;
    }
    SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x11uLL);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9 || (v10 = self->_bundleIDType, (v10 & 0x20) != 0))
    {
      v12 = v9;
    }
    else
    {
      if ((v10 & 0x20000000000000) != 0)
      {
        v3 = 0;
        v13 = *p_interestingDate;
        *p_interestingDate = 0;
        goto LABEL_19;
      }
      SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x1CuLL);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
        SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x1DuLL);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v11)
        {
          if ((-[PRSRankingItem bundleIDType](self, "bundleIDType") & 0x100) == 0
            || (SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x11CuLL),
                (v11 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
          {
            SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x20uLL);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            bundleIDType = self->_bundleIDType;
            if ((bundleIDType & 0x200842) != 0)
            {
              SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x19uLL);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = v21;
              if (v21)
              {
                v23 = v21;

                v19 = v23;
              }

              bundleIDType = self->_bundleIDType;
            }
            if (v19)
            {
              if ((bundleIDType & 0x100000) == 0)
                goto LABEL_29;
LABEL_37:
              SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x139uLL);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v27 = v26;
              }
              else
              {
                SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x13AuLL);
                v27 = (void *)objc_claimAutoreleasedReturnValue();

                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                  goto LABEL_42;
              }
              v28 = v27;
              v27 = v28;
              if (v28)
              {
                objc_msgSend(v28, "lastObject");
                v29 = objc_claimAutoreleasedReturnValue();

                v19 = (void *)v29;
              }
LABEL_42:

              if (!v19)
                goto LABEL_43;
              goto LABEL_46;
            }
            if ((bundleIDType & 0x200000000) != 0)
            {
              SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x136uLL);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = v24;
              if (v24)
                v25 = v24;

              if ((self->_bundleIDType & 0x100000) != 0)
                goto LABEL_37;
            }
            else
            {
              v19 = 0;
              if ((bundleIDType & 0x100000) != 0)
                goto LABEL_37;
            }
LABEL_29:
            if (!v19)
            {
LABEL_43:
              if ((self->_bundleIDType & 0x80) != 0)
              {
                SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x21uLL);
                v19 = (void *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v19 = 0;
              }
            }
LABEL_46:
            v12 = v19;
            goto LABEL_14;
          }
        }
      }
      v12 = v11;
    }
LABEL_14:
    v3 = v12;
    v13 = *p_interestingDate;
    *p_interestingDate = v12;
LABEL_19:

    return v3;
  }
  v3 = interestingDate;
  return v3;
}

- (NSDate)lastAccessDate
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unint64_t bundleIDType;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v21;
  id v22;

  SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 9uLL);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x52uLL);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PRSRankingItem moreRecentDateFromDate1:date2:](self, "moreRecentDateFromDate1:date2:", v3, v4);
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v5;
  }
  if (!v4 || (self->_bundleIDType & 0x100008) != 0)
  {
    if ((-[PRSRankingItem bundleIDType](self, "bundleIDType") & 0x100) != 0)
    {
      SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x11CuLL);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
        goto LABEL_25;
      v4 = 0;
    }
    SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x20uLL);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    bundleIDType = self->_bundleIDType;
    if ((bundleIDType & 0x842) != 0)
    {
      SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x19uLL);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8)
      {
        v10 = v8;

        v6 = v10;
      }

      bundleIDType = self->_bundleIDType;
    }
    if (!v6)
    {
      if ((bundleIDType & 0x200000000) != 0)
      {
        SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x136uLL);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v21;
        if (v21)
          v22 = v21;

        if ((self->_bundleIDType & 0x100000) == 0)
          goto LABEL_25;
LABEL_16:
        SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x139uLL);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v12 = v11;
        }
        else
        {
          SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x13AuLL);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
LABEL_24:

            goto LABEL_25;
          }
        }
        v18 = v12;
        v12 = v18;
        if (v18)
        {
          objc_msgSend(v18, "lastObject");
          v19 = objc_claimAutoreleasedReturnValue();

          v6 = (void *)v19;
        }
        goto LABEL_24;
      }
      v6 = 0;
    }
    if ((bundleIDType & 0x100000) != 0)
      goto LABEL_16;
LABEL_25:
    v17 = v6;
    goto LABEL_26;
  }
  SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x20uLL);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x19uLL);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRSRankingItem moreRecentDateFromDate1:date2:](self, "moreRecentDateFromDate1:date2:", v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    -[PRSRankingItem moreRecentDateFromDate1:date2:](self, "moreRecentDateFromDate1:date2:", v15, v4);
    v16 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v16;
  }
  v17 = v4;

LABEL_26:
  return (NSDate *)v17;
}

- (id)moreRecentDateFromDate1:(id)a3 date2:(id)a4
{
  id v5;
  id v6;
  char isKindOfClass;
  char v8;
  char v9;
  void *v10;
  id v11;

  v5 = a3;
  v6 = a4;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  objc_opt_class();
  v8 = objc_opt_isKindOfClass();
  v9 = v8;
  if ((isKindOfClass & 1) != 0)
  {
    v10 = v5;
    if ((v9 & 1) != 0)
    {
      if (objc_msgSend(v5, "compare:", v6) == 1)
        v10 = v5;
      else
        v10 = v6;
    }
  }
  else if ((v8 & 1) != 0)
  {
    v10 = v6;
  }
  else
  {
    v10 = 0;
  }
  v11 = v10;

  return v11;
}

- (uint64_t)compareWithDatesPlus:(int)a3 currentTime:(uint64_t)a4 hasCategory:(uint64_t)a5 topBit:(char)a6 upperBit:(double)a7 lowerBit:
{
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  float v17;
  uint64_t v18;
  uint64_t v19;
  float v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  void *v37;
  id v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  unint64_t v60;
  uint64_t v61;
  unint64_t v62;
  uint64_t v63;
  unint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  unint64_t v68;
  uint64_t v69;
  void *v70;
  void *v71;
  double v72;
  double v73;
  double v74;
  double v75;
  unint64_t v76;
  unint64_t v77;
  uint64_t v78;
  _QWORD block[4];
  id v81;

  v13 = a2;
  v14 = v13;
  if (!a1)
    goto LABEL_93;
  if (a3)
  {
    v15 = *(_QWORD *)(a1 + 552) & 0x800000000000000;
    v16 = 0;
    v17 = (float)*(unsigned __int128 *)(&v15 - 1);
    if (v14)
    {
      v18 = v14[69] & 0x800000000000000;
      v19 = 0;
      v20 = (float)*(unsigned __int128 *)(&v18 - 1);
    }
    else
    {
      v20 = 0.0;
    }
    if (v20 >= v17)
    {
      if (v20 <= v17)
        goto LABEL_80;
LABEL_75:
      a1 = -1;
      goto LABEL_93;
    }
LABEL_73:
    a1 = 1;
    goto LABEL_93;
  }
  if ((*(_BYTE *)(a1 + 386) & 0x10) == 0 && (objc_msgSend(v13, "bundleIDType") & 0x100000) == 0)
  {
    a1 = -[PRSRankingItem compareWithDates:currentTime:](a1, v14, a7);
    goto LABEL_93;
  }
  v21 = -1 << a4;
  v22 = (-1 << a4) | (0x7FFFFFFFFFFFFFFFuLL >> ~(_BYTE)a4);
  if ((a4 & 0x40) != 0)
  {
    v22 = -1 << a4;
    v21 = 0;
  }
  if (a4 >= 0)
    v23 = ~v22;
  else
    v23 = -1;
  if (a4 >= 0)
    v24 = ~v21;
  else
    v24 = -1;
  v25 = *(_QWORD *)(a1 + 552);
  v26 = *(_QWORD *)(a1 + 544);
  if (a5 < 0)
  {
    v60 = (-1 << a6) | (0x7FFFFFFFFFFFFFFFuLL >> ~a6);
    if ((a6 & 0x40) != 0)
    {
      v60 = -1 << a6;
      v61 = 0;
    }
    else
    {
      v61 = -1 << a6;
    }
    v62 = v60 & v23;
    v63 = v61 & v24;
    v64 = v25 & v62;
    v65 = v26 & v61 & v24;
    if (v14)
    {
      v66 = v14[69];
      v67 = v14[68];
    }
    else
    {
      v67 = 0;
      v66 = 0;
    }
    v68 = v66 & v62;
    v69 = v67 & v63;
    if (__PAIR128__(v68, v69) < __PAIR128__(v64, v65))
      goto LABEL_73;
    if (__PAIR128__(v64, v65) < __PAIR128__(v68, v69))
      goto LABEL_75;
  }
  else
  {
    v27 = (-1 << a5) | (0x7FFFFFFFFFFFFFFFuLL >> ~(_BYTE)a5);
    if ((a5 & 0x40) != 0)
    {
      v27 = -1 << a5;
      v28 = 0;
    }
    else
    {
      v28 = -1 << a5;
    }
    v29 = v27 & v23;
    v30 = v28 & v24;
    v31 = v25 & v29;
    v32 = v26 & v28 & v24;
    if (v14)
    {
      v33 = v14[69];
      v34 = v14[68];
    }
    else
    {
      v34 = 0;
      v33 = 0;
    }
    v35 = v33 & v29;
    v36 = v34 & v30;
    if (__PAIR128__(v35, v36) < __PAIR128__(v31, v32))
      goto LABEL_73;
    if (__PAIR128__(v31, v32) < __PAIR128__(v35, v36))
      goto LABEL_75;
    PRSRankingQueryIndexDictionary();
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __88__PRSRankingItem_compareWithDatesPlus_currentTime_hasCategory_topBit_upperBit_lowerBit___block_invoke;
    block[3] = &unk_1E6E42FD8;
    v38 = v37;
    v81 = v38;
    if (compareWithDatesPlus_currentTime_hasCategory_topBit_upperBit_lowerBit__onceToken != -1)
      dispatch_once(&compareWithDatesPlus_currentTime_hasCategory_topBit_upperBit_lowerBit__onceToken, block);
    v39 = *(_QWORD *)(a1 + 544);
    v40 = *(_QWORD *)(a1 + 552);
    if ((compareWithDatesPlus_currentTime_hasCategory_topBit_upperBit_lowerBit__bit2 & 0x40) != 0)
      v41 = 0;
    else
      v41 = 1 << compareWithDatesPlus_currentTime_hasCategory_topBit_upperBit_lowerBit__bit2;
    if ((compareWithDatesPlus_currentTime_hasCategory_topBit_upperBit_lowerBit__bit2 & 0x40) != 0)
      v42 = 1 << compareWithDatesPlus_currentTime_hasCategory_topBit_upperBit_lowerBit__bit2;
    else
      v42 = 0;
    if ((compareWithDatesPlus_currentTime_hasCategory_topBit_upperBit_lowerBit__bit3 & 0x40) != 0)
      v43 = 0;
    else
      v43 = 1 << compareWithDatesPlus_currentTime_hasCategory_topBit_upperBit_lowerBit__bit3;
    if ((compareWithDatesPlus_currentTime_hasCategory_topBit_upperBit_lowerBit__bit3 & 0x40) != 0)
      v44 = 1 << compareWithDatesPlus_currentTime_hasCategory_topBit_upperBit_lowerBit__bit3;
    else
      v44 = 0;
    v45 = 1 << compareWithDatesPlus_currentTime_hasCategory_topBit_upperBit_lowerBit__bit4;
    if ((compareWithDatesPlus_currentTime_hasCategory_topBit_upperBit_lowerBit__bit4 & 0x40) != 0)
      v46 = 0;
    else
      v46 = 1 << compareWithDatesPlus_currentTime_hasCategory_topBit_upperBit_lowerBit__bit4;
    if ((compareWithDatesPlus_currentTime_hasCategory_topBit_upperBit_lowerBit__bit4 & 0x40) == 0)
      v45 = 0;
    if ((compareWithDatesPlus_currentTime_hasCategory_topBit_upperBit_lowerBit__bit5 & 0x40) != 0)
      v47 = 0;
    else
      v47 = 1 << compareWithDatesPlus_currentTime_hasCategory_topBit_upperBit_lowerBit__bit5;
    if ((compareWithDatesPlus_currentTime_hasCategory_topBit_upperBit_lowerBit__bit5 & 0x40) != 0)
      v48 = 1 << compareWithDatesPlus_currentTime_hasCategory_topBit_upperBit_lowerBit__bit5;
    else
      v48 = 0;
    if ((compareWithDatesPlus_currentTime_hasCategory_topBit_upperBit_lowerBit__bit1 & 0x40) != 0)
      v49 = v40 >> compareWithDatesPlus_currentTime_hasCategory_topBit_upperBit_lowerBit__bit1;
    else
      v49 = ((2 * v40) << ~(_BYTE)compareWithDatesPlus_currentTime_hasCategory_topBit_upperBit_lowerBit__bit1) | (v39 >> compareWithDatesPlus_currentTime_hasCategory_topBit_upperBit_lowerBit__bit1);
    if ((v49 & 1) == 0
      && !(v41 & v39 | v42 & v40)
      && !(v43 & v39 | v44 & v40)
      && !(v46 & v39 | v45 & v40)
      && !(v47 & v39 | v48 & v40))
    {
      v50 = (-1 << a6) | (0x7FFFFFFFFFFFFFFFuLL >> ~a6);
      if ((a6 & 0x40) != 0)
      {
        v50 = -1 << a6;
        v51 = 0;
      }
      else
      {
        v51 = -1 << a6;
      }
      v52 = v50 & v23;
      v53 = v51 & v24;
      v54 = v40 & v52;
      v55 = v39 & v51 & v24;
      if (v14)
      {
        v56 = v14[69];
        v57 = v14[68];
      }
      else
      {
        v57 = 0;
        v56 = 0;
      }
      v58 = v56 & v52;
      v59 = v57 & v53;
      if (__PAIR128__(v58, v59) < __PAIR128__(v54, v55))
      {
        a1 = 1;
LABEL_78:

        goto LABEL_93;
      }
      if (__PAIR128__(v54, v55) < __PAIR128__(v58, v59))
      {
        a1 = -1;
        goto LABEL_78;
      }
    }

  }
LABEL_80:
  objc_msgSend((id)a1, "interestingDate");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "interestingDate");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "timeIntervalSinceReferenceDate");
  v73 = v72 - a7;
  objc_msgSend(v71, "timeIntervalSinceReferenceDate");
  v75 = v74 - a7;
  if (v73 <= v75)
  {
    if (v73 >= v75)
    {
      if (v14)
      {
        v76 = v14[69];
        v77 = v14[68];
      }
      else
      {
        v77 = 0;
        v76 = 0;
      }
      if (*(_OWORD *)(a1 + 544) >= __PAIR128__(v76, v77))
        v78 = 0;
      else
        v78 = -1;
      if (__PAIR128__(v76, v77) < *(_OWORD *)(a1 + 544))
        a1 = 1;
      else
        a1 = v78;
    }
    else
    {
      a1 = -1;
    }
  }
  else
  {
    a1 = 1;
  }

LABEL_93:
  return a1;
}

- (uint64_t)compareWithDates:(double)a3 currentTime:
{
  id v5;
  id v6;
  int8x8_t *v7;
  unsigned int v8;
  void *v9;
  char v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _BOOL4 v37;
  uint64_t v38;
  void *v39;
  void *v40;
  int v41;
  int v42;
  int v43;
  int v44;
  uint64_t v45;
  uint64_t v46;
  float v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  float v52;
  float v53;
  void *v54;
  _QWORD *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  float v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  uint64_t v73;
  id v74;
  uint64_t v75;
  uint64_t v76;
  float v77;
  float v78;
  void *v79;
  float v80;
  void *v81;
  float v82;
  uint64_t v83;
  uint64_t v84;
  float v85;
  float v86;
  void *v87;
  float v88;
  void *v89;
  float v90;
  uint64_t v91;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  float v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  float *v103;
  float *v104;
  float v105;
  float v106;
  void *v107;
  float v108;
  void *v109;
  float v110;
  uint64_t v111;
  uint64_t v112;
  float v113;
  float v114;
  void *v115;
  float v116;
  void *v117;
  float v118;
  uint64_t v119;
  uint64_t v120;
  float v121;
  float v122;
  void *v123;
  float v124;
  void *v125;
  float v126;
  uint64_t v127;
  uint64_t v128;
  float v129;
  float v130;
  void *v131;
  float v132;
  void *v133;
  float v134;
  uint64_t v135;
  uint64_t v136;
  float v137;
  float v138;
  void *v139;
  float v140;
  void *v141;
  float v142;
  uint64_t v143;
  uint64_t v144;
  float v145;
  float v146;
  void *v147;
  float v148;
  void *v149;
  float v150;
  uint64_t v151;
  uint64_t v152;
  float v153;
  float v154;
  void *v155;
  float v156;
  void *v157;
  float v158;
  uint64_t v159;
  uint64_t v160;
  float v161;
  float v162;
  void *v163;
  float v164;
  void *v165;
  float v166;
  uint64_t v167;
  uint64_t v168;
  float v169;
  float v170;
  void *v171;
  float v172;
  void *v173;
  float v174;
  uint64_t v175;
  uint64_t v176;
  float v177;
  float v178;
  void *v179;
  float v180;
  void *v181;
  float v182;
  uint64_t v183;
  uint64_t v184;
  float v185;
  float v186;
  void *v187;
  float v188;
  void *v189;
  float v190;
  uint64_t v191;
  uint64_t v192;
  float v193;
  float v194;
  void *v195;
  float v196;
  void *v197;
  float v198;
  uint64_t v199;
  uint64_t v200;
  float v201;
  float v202;
  void *v203;
  float v204;
  void *v205;
  float v206;
  uint64_t v207;
  uint64_t v208;
  float v209;
  float v210;
  void *v211;
  float v212;
  void *v213;
  float v214;
  uint64_t v215;
  uint64_t v216;
  float v217;
  float v218;
  void *v219;
  float v220;
  void *v221;
  float v222;
  uint64_t v223;
  uint64_t v224;
  float v225;
  float v226;
  void *v227;
  float v228;
  void *v229;
  float v230;
  _QWORD *v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  float v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  _BOOL4 v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  float v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  float v256;
  uint64_t v257;
  uint64_t v258;
  uint64_t v259;
  uint64_t v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t v264;
  float v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  uint64_t v270;
  uint64_t v271;
  float v272;
  float v273;
  void *v274;
  float v275;
  void *v276;
  float v277;
  uint64_t v278;
  uint64_t v279;
  float v280;
  float v281;
  void *v282;
  float v283;
  void *v284;
  float v285;
  uint64_t v286;
  uint64_t v287;
  float v288;
  float v289;
  void *v290;
  float v291;
  void *v292;
  float v293;
  uint64_t v294;
  uint64_t v295;
  float v296;
  float v297;
  void *v298;
  float v299;
  void *v300;
  float v301;
  uint64_t v302;
  uint64_t v303;
  float v304;
  float v305;
  void *v306;
  float v307;
  void *v308;
  float v309;
  uint64_t v310;
  uint64_t v311;
  float v312;
  float v313;
  void *v314;
  float v315;
  void *v316;
  float v317;
  uint64_t v318;
  uint64_t v319;
  float v320;
  float v321;
  void *v322;
  float v323;
  void *v324;
  float v325;
  uint64_t v326;
  uint64_t v327;
  float v328;
  float v329;
  void *v330;
  float v331;
  void *v332;
  float v333;
  uint64_t v334;
  uint64_t v335;
  float v336;
  float v337;
  void *v338;
  float v339;
  void *v340;
  float v341;
  uint64_t v342;
  uint64_t v343;
  float v344;
  float v345;
  void *v346;
  float v347;
  void *v348;
  float v349;
  uint64_t v350;
  uint64_t v351;
  float v352;
  float v353;
  void *v354;
  float v355;
  void *v356;
  float v357;
  uint64_t v358;
  uint64_t v359;
  float v360;
  float v361;
  void *v362;
  float v363;
  void *v364;
  float v365;
  uint64_t v366;
  uint64_t v367;
  float v368;
  float v369;
  void *v370;
  float v371;
  void *v372;
  float v373;
  uint64_t v374;
  uint64_t v375;
  float v376;
  float v377;
  void *v378;
  float v379;
  void *v380;
  float v381;
  uint64_t v382;
  uint64_t v383;
  float v384;
  float v385;
  void *v386;
  float v387;
  void *v388;
  float v389;
  uint64_t v390;
  uint64_t v391;
  float v392;
  float v393;
  void *v394;
  float v395;
  void *v396;
  float v397;
  _QWORD *v398;
  uint64_t v399;
  uint64_t v400;
  uint64_t v401;
  uint64_t v402;
  uint64_t v403;
  float v404;
  uint64_t v405;
  uint64_t v406;
  uint64_t v407;
  uint64_t v408;
  uint64_t v409;
  uint64_t v410;
  uint64_t v411;
  uint64_t v412;
  float v413;
  uint64_t v414;
  uint64_t v415;
  uint64_t v416;
  uint64_t v417;
  float v418;
  uint64_t v419;
  void *v420;
  void *v421;
  uint64_t v422;
  void *v423;
  id v424;
  id v425;
  _QWORD v426[4];
  id v427;
  _QWORD v428[4];
  id v429;
  _QWORD v430[4];
  id v431;

  v5 = a2;
  v6 = v5;
  if (!a1)
  {
    v12 = 0;
    goto LABEL_207;
  }
  v7 = (int8x8_t *)objc_msgSend(v5, "attributes");
  if ((objc_msgSend(*(id *)(a1 + 240), "isSiriAction") & 1) != 0)
  {
    v8 = 2;
  }
  else if (*(_BYTE *)(a1 + 75))
  {
    v8 = 4;
  }
  else
  {
    v8 = 8;
  }
  objc_msgSend(v6, "L2FeatureVector");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isSiriAction");

  if ((v10 & 1) != 0)
  {
    v11 = 2;
  }
  else
  {
    v11 = 8;
    if (v6)
    {
      if (*((_BYTE *)v6 + 75))
        v11 = 4;
      else
        v11 = 8;
    }
  }
  if (v8 > v11)
  {
    v12 = 1;
    goto LABEL_207;
  }
  if (v8 < v11)
  {
    v12 = -1;
    goto LABEL_207;
  }
  if ((*(_BYTE *)(a1 + 384) & 0x10) != 0 && (objc_msgSend(v6, "bundleIDType") & 0x10) != 0)
  {
    v12 = (*((uint64_t (**)(uint64_t, void *, void *))comparePreferences + 2))((uint64_t)comparePreferences, (void *)a1, v6);
    if (v12)
      goto LABEL_207;
  }
  if ((*(_BYTE *)(a1 + 384) & 0x80) != 0 && (objc_msgSend(v6, "bundleIDType") & 0x80) != 0)
  {
    v12 = (*((uint64_t (**)(uint64_t, void *, void *))compareSafariResults + 2))((uint64_t)compareSafariResults, (void *)a1, v6);
    if (v12)
      goto LABEL_207;
  }
  if ((*(_BYTE *)(a1 + 384) & 8) != 0
    || (objc_msgSend(v6, "bundleIDType") & 8) != 0
    || (*(_BYTE *)(a1 + 386) & 0x10) != 0
    || (objc_msgSend(v6, "bundleIDType") & 0x100000) != 0)
  {
    goto LABEL_34;
  }
  v13 = *(_QWORD *)(a1 + 384);
  if ((v13 & 0x800) != 0)
  {
    if ((objc_msgSend(v6, "bundleIDType") & 0x800) != 0)
      goto LABEL_34;
    v13 = *(_QWORD *)(a1 + 384);
  }
  if ((v13 & 0x800000) != 0)
  {
    if ((objc_msgSend(v6, "bundleIDType") & 0x800000) != 0)
      goto LABEL_34;
    v13 = *(_QWORD *)(a1 + 384);
  }
  if ((v13 & 0x1000006) == 0)
  {
    if ((v13 & 0x40000) != 0)
    {
      if ((objc_msgSend(v6, "bundleIDType") & 0x40000) != 0)
        goto LABEL_34;
      v13 = *(_QWORD *)(a1 + 384);
      if ((v13 & 0x40000) != 0)
      {
        if ((objc_msgSend(v6, "bundleIDType") & 0x2000000) != 0)
          goto LABEL_34;
        v13 = *(_QWORD *)(a1 + 384);
      }
    }
    if ((v13 & 0x2000000) == 0
      || (objc_msgSend(v6, "bundleIDType") & 0x40000) == 0
      && ((*(_BYTE *)(a1 + 387) & 2) == 0 || (objc_msgSend(v6, "bundleIDType") & 0x2000000) == 0))
    {
      SSCompactRankingAttrsGetValue(*(int8x8_t **)(a1 + 288), 0x11CuLL);
      v27 = objc_claimAutoreleasedReturnValue();
      SSCompactRankingAttrsGetValue(v7, 0x11CuLL);
      v28 = objc_claimAutoreleasedReturnValue();
      SSCompactRankingAttrsGetValue(*(int8x8_t **)(a1 + 288), 0x11DuLL);
      v29 = objc_claimAutoreleasedReturnValue();
      SSCompactRankingAttrsGetValue(*(int8x8_t **)(a1 + 288), 9uLL);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v420 = (void *)v29;
      objc_msgSend((id)a1, "moreRecentDateFromDate1:date2:", v29, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v423 = (void *)v27;
      objc_msgSend((id)a1, "moreRecentDateFromDate1:date2:", v31, v27);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      SSCompactRankingAttrsGetValue(v7, 0x11DuLL);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      SSCompactRankingAttrsGetValue(v7, 9uLL);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)a1, "moreRecentDateFromDate1:date2:", v33, v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v421 = (void *)v28;
      objc_msgSend((id)a1, "moreRecentDateFromDate1:date2:", v35, v28);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      if (v32 && v36)
      {
        v14 = objc_msgSend(v32, "compare:", v36);
        v37 = 0;
      }
      else if (v32)
      {
        v37 = 0;
        v14 = 1;
      }
      else
      {
        v37 = v36 == 0;
        if (v36)
          v14 = -1;
        else
          v14 = 0;
      }

      v12 = v14;
      if (!v37)
        goto LABEL_207;
      goto LABEL_35;
    }
  }
LABEL_34:
  v14 = 0;
LABEL_35:
  if ((*(_BYTE *)(a1 + 385) & 1) == 0
    || (objc_msgSend(v6, "bundleIDType") & 0x100) == 0
    || (v12 = (*((uint64_t (**)(uint64_t, void *, void *))compareApplications + 2))((uint64_t)compareApplications, (void *)a1, v6)) == 0)
  {
    SSCompactRankingAttrsGetValue(*(int8x8_t **)(a1 + 288), 0x1CuLL);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    SSCompactRankingAttrsGetValue(v7, 0x1CuLL);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v16;
    if (v15)
    {
      if (v16)
      {
        v12 = objc_msgSend(v15, "compare:", v16);
        if (v12)
          goto LABEL_206;
      }
    }
    objc_msgSend((id)a1, "interestingDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "interestingDate");
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)v19;
    if (v18 && v19)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if ((*(_BYTE *)(a1 + 384) & 0x20) != 0 && (objc_msgSend(v6, "bundleIDType") & 0x20) != 0)
          {
            objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", a3);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_alloc(MEMORY[0x1E0C99D48]);
            v23 = (void *)objc_msgSend(v22, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
            if (objc_msgSend(v23, "isDate:inSameDayAsDate:", v18, v21)
              && !objc_msgSend(v23, "isDate:inSameDayAsDate:", v20, v21))
            {
LABEL_54:
              v12 = 1;
LABEL_135:

              goto LABEL_205;
            }
            if (objc_msgSend(v23, "isDate:inSameDayAsDate:", v20, v21)
              && !objc_msgSend(v23, "isDate:inSameDayAsDate:", v18, v21))
            {
              v12 = -1;
              goto LABEL_135;
            }
            if (objc_msgSend(v23, "isDate:inSameDayAsDate:", v18, v21)
              && objc_msgSend(v23, "isDate:inSameDayAsDate:", v20, v21))
            {
              objc_msgSend(v18, "timeIntervalSinceReferenceDate");
              v25 = v24;
              objc_msgSend(v20, "timeIntervalSinceReferenceDate");
              if (v25 >= v26)
              {
                objc_msgSend(v18, "timeIntervalSinceReferenceDate");
                v67 = v66;
                objc_msgSend(v20, "timeIntervalSinceReferenceDate");
                if (v67 <= v68)
                  v12 = 0;
                else
                  v12 = -1;
                goto LABEL_135;
              }
              goto LABEL_54;
            }

          }
          v38 = *(_QWORD *)(a1 + 384);
          if ((v38 & 0x40000) != 0)
          {
            if ((objc_msgSend(v6, "bundleIDType") & 0x40000) != 0)
              goto LABEL_92;
            v38 = *(_QWORD *)(a1 + 384);
            if ((v38 & 0x40000) != 0)
            {
              if ((objc_msgSend(v6, "bundleIDType") & 0x2000000) != 0)
                goto LABEL_92;
              v38 = *(_QWORD *)(a1 + 384);
            }
          }
          if ((v38 & 0x2000000) == 0
            || (objc_msgSend(v6, "bundleIDType") & 0x40000) == 0
            && ((*(_BYTE *)(a1 + 387) & 2) == 0 || (objc_msgSend(v6, "bundleIDType") & 0x2000000) == 0))
          {
LABEL_69:
            if ((*(_BYTE *)(a1 + 386) & 0x80) != 0 && (objc_msgSend(v6, "bundleIDType") & 0x800000) != 0)
            {
              SSCompactRankingAttrsGetValue(*(int8x8_t **)(a1 + 288), 0x99uLL);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(v6, "attributes"), 0x99uLL);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v41 = objc_msgSend(v39, "unsignedIntValue");
                  v42 = objc_msgSend(v40, "unsignedIntValue");
                  if (v41 == 1 && v42 != 1)
                    goto LABEL_84;
                  if (v42 == 1 && v41 != 1)
                    goto LABEL_143;
                }
              }

            }
            if ((*(_BYTE *)(a1 + 387) & 1) != 0 && (objc_msgSend(v6, "bundleIDType") & 0x1000000) != 0)
            {
              SSCompactRankingAttrsGetValue(*(int8x8_t **)(a1 + 288), 0x99uLL);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(v6, "attributes"), 0x99uLL);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v43 = objc_msgSend(v39, "unsignedIntValue");
                  v44 = objc_msgSend(v40, "unsignedIntValue");
                  if (v43 == 1 && v44 != 1)
                  {
LABEL_84:
                    v12 = 1;
LABEL_144:

LABEL_179:
                    goto LABEL_205;
                  }
                  if (v44 == 1 && v43 != 1)
                  {
LABEL_143:
                    v12 = -1;
                    goto LABEL_144;
                  }
                }
              }

            }
            if ((*(_BYTE *)(a1 + 386) & 0x20) != 0 && (objc_msgSend(v6, "bundleIDType") & 0x200000) != 0)
            {
              v12 = (*((uint64_t (**)(uint64_t, void *, void *))compareShortcutsNames + 2))((uint64_t)compareShortcutsNames, (void *)a1, v6);
              if (v12)
                goto LABEL_205;
            }
            objc_msgSend(v18, "timeIntervalSinceReferenceDate");
            v70 = v69 - a3;
            objc_msgSend(v20, "timeIntervalSinceReferenceDate");
            v72 = v71 - a3;
            if ((v70 < 0.0 || v72 < 0.0) && (v70 > 0.0 || v72 > 0.0))
              goto LABEL_208;
            v73 = *(_QWORD *)(a1 + 384);
            if ((v73 & 0x40000) != 0)
            {
              if ((objc_msgSend(v6, "bundleIDType") & 0x40000) != 0)
                goto LABEL_163;
              v73 = *(_QWORD *)(a1 + 384);
              if ((v73 & 0x40000) != 0)
              {
                if ((objc_msgSend(v6, "bundleIDType") & 0x2000000) != 0)
                  goto LABEL_163;
                v73 = *(_QWORD *)(a1 + 384);
              }
            }
            if ((v73 & 0x2000000) == 0
              || (objc_msgSend(v6, "bundleIDType") & 0x40000) == 0
              && ((*(_BYTE *)(a1 + 387) & 2) == 0 || (objc_msgSend(v6, "bundleIDType") & 0x2000000) == 0))
            {
LABEL_194:
              v70 = fabs(v70);
              v72 = fabs(v72);
              if (v70 >= v72)
              {
                if (v70 <= v72)
                {
                  if (v70 == v72)
                    goto LABEL_197;
LABEL_208:
                  if (v72 >= 0.0 || v70 <= 0.0)
                    v12 = -1;
                  else
                    v12 = 1;
                  goto LABEL_205;
                }
                goto LABEL_60;
              }
LABEL_57:
              v12 = 1;
LABEL_205:

LABEL_206:
              goto LABEL_207;
            }
LABEL_163:
            v74 = objc_alloc(MEMORY[0x1E0C99D48]);
            v39 = (void *)objc_msgSend(v74, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
            if (!objc_msgSend(v39, "isDate:inSameDayAsDate:", v18, v20))
              goto LABEL_193;
            if (v6 && (v75 = *(_QWORD *)(a1 + 512)) != 0 && (v76 = *((_QWORD *)v6 + 64)) != 0)
            {
              v77 = *(float *)(v75 + 128);
              v78 = *(float *)(v76 + 128);
            }
            else
            {
              objc_msgSend((id)a1, "L2FeatureVector");
              v79 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v79, "scoreForFeature:", 2388);
              v77 = v80;

              objc_msgSend(v6, "L2FeatureVector");
              v81 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v81, "scoreForFeature:", 2388);
              v78 = v82;

            }
            if (v77 > 0.0 && v78 > 0.0)
            {
              if (v77 > v78)
                goto LABEL_175;
              if (v77 < v78)
                goto LABEL_178;
            }
            if (v77 > 0.0 && v78 <= 0.0)
              goto LABEL_175;
            if (v77 <= 0.0 && v78 > 0.0)
            {
LABEL_178:
              v12 = -1;
              goto LABEL_179;
            }
            if (v6 && (v83 = *(_QWORD *)(a1 + 512)) != 0 && (v84 = *((_QWORD *)v6 + 64)) != 0)
            {
              v85 = *(float *)(v83 + 132);
              v86 = *(float *)(v84 + 132);
            }
            else
            {
              objc_msgSend((id)a1, "L2FeatureVector");
              v87 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v87, "scoreForFeature:", 2389);
              v85 = v88;

              objc_msgSend(v6, "L2FeatureVector");
              v89 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v89, "scoreForFeature:", 2389);
              v86 = v90;

            }
            if (v85 > 0.0 && v86 > 0.0)
            {
              if (v85 > v86)
                goto LABEL_175;
              if (v85 < v86)
                goto LABEL_178;
            }
            if (v85 <= 0.0 || v86 > 0.0)
            {
              if (v85 <= 0.0 && v86 > 0.0)
                goto LABEL_178;
LABEL_193:

              goto LABEL_194;
            }
LABEL_175:
            v12 = 1;
            goto LABEL_179;
          }
LABEL_92:
          v45 = *(_QWORD *)(a1 + 552) & 0x800000000000000;
          v46 = 0;
          v47 = (float)*(unsigned __int128 *)(&v45 - 1);
          if (v6)
            v48 = *((_QWORD *)v6 + 69);
          else
            v48 = 0;
          v49 = v48 & 0x800000000000000;
          v50 = 0;
          if (v47 > (float)*(unsigned __int128 *)&v50)
            goto LABEL_57;
          if (v47 < (float)*(unsigned __int128 *)&v50)
            goto LABEL_60;
          if (*(_QWORD *)(a1 + 488))
          {
            if (!v6)
              goto LABEL_57;
            v51 = *((_QWORD *)v6 + 61);
          }
          else
          {
            if (!v6)
            {
              if (*(_QWORD *)(a1 + 496))
                goto LABEL_57;
              if (*(_QWORD *)(a1 + 504))
                goto LABEL_57;
              v52 = *(float *)(a1 + 124);
              v53 = 0.0;
              if (v52 > 0.0)
                goto LABEL_57;
              goto LABEL_101;
            }
            if (*((_QWORD *)v6 + 61))
              goto LABEL_60;
            v51 = *((_QWORD *)v6 + 62);
            if (!*(_QWORD *)(a1 + 496))
            {
              if (v51)
                goto LABEL_60;
              v51 = *((_QWORD *)v6 + 63);
              if (!*(_QWORD *)(a1 + 504))
              {
                if (v51)
                  goto LABEL_60;
                goto LABEL_100;
              }
            }
          }
          if (!v51)
            goto LABEL_57;
LABEL_100:
          v52 = *(float *)(a1 + 124);
          v53 = *((float *)v6 + 31);
          if (v52 > v53)
            goto LABEL_57;
LABEL_101:
          if (v52 >= v53)
          {
            PRSRankingQueryIndexDictionary();
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            v430[0] = MEMORY[0x1E0C809B0];
            v430[1] = 3221225472;
            v430[2] = __47__PRSRankingItem_compareWithDates_currentTime___block_invoke;
            v430[3] = &unk_1E6E42FD8;
            v424 = v54;
            v431 = v424;
            v55 = v430;
            if (compareWithDates_currentTime__onceToken1 != -1)
              dispatch_once(&compareWithDates_currentTime__onceToken1, v55);

            v56 = *(_QWORD *)(a1 + 544);
            if ((compareWithDates_currentTime__policyFieldsExactPhraseMatchBit & 0x40) != 0)
              v57 = 1 << compareWithDates_currentTime__policyFieldsExactPhraseMatchBit;
            else
              v57 = 0;
            if ((compareWithDates_currentTime__policyFieldsExactPhraseMatchBit & 0x40) != 0)
              v58 = 0;
            else
              v58 = 1 << compareWithDates_currentTime__policyFieldsExactPhraseMatchBit;
            v59 = v58 & v56;
            v60 = v57 & *(_QWORD *)(a1 + 552);
            v61 = (float)*(unsigned __int128 *)&v59;
            if (v6)
            {
              v62 = *((_QWORD *)v6 + 69);
              v63 = *((_QWORD *)v6 + 68);
            }
            else
            {
              v63 = 0;
              v62 = 0;
            }
            v64 = v63 & v58;
            v65 = v62 & v57;
            if (v61 > (float)*(unsigned __int128 *)&v64)
              goto LABEL_113;
            if (v61 < (float)*(unsigned __int128 *)&v64)
            {
LABEL_215:
              v12 = -1;
              goto LABEL_216;
            }
            if ((compareWithDates_currentTime__policyFieldsMostlyExactPhraseMatchBit & 0x40) != 0)
              v94 = 1 << compareWithDates_currentTime__policyFieldsMostlyExactPhraseMatchBit;
            else
              v94 = 0;
            if ((compareWithDates_currentTime__policyFieldsMostlyExactPhraseMatchBit & 0x40) != 0)
              v95 = 0;
            else
              v95 = 1 << compareWithDates_currentTime__policyFieldsMostlyExactPhraseMatchBit;
            v96 = v95 & v56;
            v97 = v94 & *(_QWORD *)(a1 + 552);
            v98 = (float)*(unsigned __int128 *)&v96;
            if (v6)
            {
              v99 = *((_QWORD *)v6 + 69);
              v100 = *((_QWORD *)v6 + 68);
            }
            else
            {
              v100 = 0;
              v99 = 0;
            }
            v101 = v100 & v95;
            v102 = v99 & v94;
            if (v98 > (float)*(unsigned __int128 *)&v101)
              goto LABEL_113;
            if (v98 < (float)*(unsigned __int128 *)&v101)
              goto LABEL_215;
            if (v6 && (v103 = *(float **)(a1 + 512)) != 0 && (v104 = (float *)*((_QWORD *)v6 + 64)) != 0)
            {
              v105 = *v103;
              v106 = *v104;
            }
            else
            {
              objc_msgSend((id)a1, "L2FeatureVector");
              v107 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v107, "scoreForFeature:", 158);
              v105 = v108;

              objc_msgSend(v6, "L2FeatureVector");
              v109 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v109, "scoreForFeature:", 158);
              v106 = v110;

            }
            if (v105 > 0.0 && v105 > v106)
              goto LABEL_113;
            if (v106 > 0.0 && v106 > v105)
              goto LABEL_215;
            if (v6 && (v111 = *(_QWORD *)(a1 + 512)) != 0 && (v112 = *((_QWORD *)v6 + 64)) != 0)
            {
              v113 = *(float *)(v111 + 4);
              v114 = *(float *)(v112 + 4);
            }
            else
            {
              objc_msgSend((id)a1, "L2FeatureVector");
              v115 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v115, "scoreForFeature:", 1373);
              v113 = v116;

              objc_msgSend(v6, "L2FeatureVector");
              v117 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v117, "scoreForFeature:", 1373);
              v114 = v118;

            }
            if (v113 > 0.0 && v113 > v114)
              goto LABEL_113;
            if (v114 > 0.0 && v114 > v113)
              goto LABEL_215;
            if (v6 && (v119 = *(_QWORD *)(a1 + 512)) != 0 && (v120 = *((_QWORD *)v6 + 64)) != 0)
            {
              v121 = *(float *)(v119 + 8);
              v122 = *(float *)(v120 + 8);
            }
            else
            {
              objc_msgSend((id)a1, "L2FeatureVector");
              v123 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v123, "scoreForFeature:", 1086);
              v121 = v124;

              objc_msgSend(v6, "L2FeatureVector");
              v125 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v125, "scoreForFeature:", 1086);
              v122 = v126;

            }
            if (v121 > 0.0 && v121 > v122)
              goto LABEL_113;
            if (v122 > 0.0 && v122 > v121)
              goto LABEL_215;
            if (v6 && (v127 = *(_QWORD *)(a1 + 512)) != 0 && (v128 = *((_QWORD *)v6 + 64)) != 0)
            {
              v129 = *(float *)(v127 + 12);
              v130 = *(float *)(v128 + 12);
            }
            else
            {
              objc_msgSend((id)a1, "L2FeatureVector");
              v131 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v131, "scoreForFeature:", 132);
              v129 = v132;

              objc_msgSend(v6, "L2FeatureVector");
              v133 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v133, "scoreForFeature:", 132);
              v130 = v134;

            }
            if (v129 > 0.0 && v129 > v130)
              goto LABEL_113;
            if (v130 > 0.0 && v130 > v129)
              goto LABEL_215;
            if (v6 && (v135 = *(_QWORD *)(a1 + 512)) != 0 && (v136 = *((_QWORD *)v6 + 64)) != 0)
            {
              v137 = *(float *)(v135 + 16);
              v138 = *(float *)(v136 + 16);
            }
            else
            {
              objc_msgSend((id)a1, "L2FeatureVector");
              v139 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v139, "scoreForFeature:", 156);
              v137 = v140;

              objc_msgSend(v6, "L2FeatureVector");
              v141 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v141, "scoreForFeature:", 156);
              v138 = v142;

            }
            if (v137 > 0.0 && v137 > v138)
              goto LABEL_113;
            if (v138 > 0.0 && v138 > v137)
              goto LABEL_215;
            if (v6 && (v143 = *(_QWORD *)(a1 + 512)) != 0 && (v144 = *((_QWORD *)v6 + 64)) != 0)
            {
              v145 = *(float *)(v143 + 20);
              v146 = *(float *)(v144 + 20);
            }
            else
            {
              objc_msgSend((id)a1, "L2FeatureVector");
              v147 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v147, "scoreForFeature:", 1537);
              v145 = v148;

              objc_msgSend(v6, "L2FeatureVector");
              v149 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v149, "scoreForFeature:", 1537);
              v146 = v150;

            }
            if (v145 > 0.0 && v145 > v146)
              goto LABEL_113;
            if (v146 > 0.0 && v146 > v145)
              goto LABEL_215;
            if (v6 && (v151 = *(_QWORD *)(a1 + 512)) != 0 && (v152 = *((_QWORD *)v6 + 64)) != 0)
            {
              v153 = *(float *)(v151 + 24);
              v154 = *(float *)(v152 + 24);
            }
            else
            {
              objc_msgSend((id)a1, "L2FeatureVector");
              v155 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v155, "scoreForFeature:", 1496);
              v153 = v156;

              objc_msgSend(v6, "L2FeatureVector");
              v157 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v157, "scoreForFeature:", 1496);
              v154 = v158;

            }
            if (v153 > 0.0 && v153 > v154)
              goto LABEL_113;
            if (v154 > 0.0 && v154 > v153)
              goto LABEL_215;
            if (v6 && (v159 = *(_QWORD *)(a1 + 512)) != 0 && (v160 = *((_QWORD *)v6 + 64)) != 0)
            {
              v161 = *(float *)(v159 + 28);
              v162 = *(float *)(v160 + 28);
            }
            else
            {
              objc_msgSend((id)a1, "L2FeatureVector");
              v163 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v163, "scoreForFeature:", 1578);
              v161 = v164;

              objc_msgSend(v6, "L2FeatureVector");
              v165 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v165, "scoreForFeature:", 1578);
              v162 = v166;

            }
            if (v161 > 0.0 && v161 > v162)
              goto LABEL_113;
            if (v162 > 0.0 && v162 > v161)
              goto LABEL_215;
            if (v6 && (v167 = *(_QWORD *)(a1 + 512)) != 0 && (v168 = *((_QWORD *)v6 + 64)) != 0)
            {
              v169 = *(float *)(v167 + 32);
              v170 = *(float *)(v168 + 32);
            }
            else
            {
              objc_msgSend((id)a1, "L2FeatureVector");
              v171 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v171, "scoreForFeature:", 1332);
              v169 = v172;

              objc_msgSend(v6, "L2FeatureVector");
              v173 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v173, "scoreForFeature:", 1332);
              v170 = v174;

            }
            if (v169 > 0.0 && v169 > v170)
              goto LABEL_113;
            if (v170 > 0.0 && v170 > v169)
              goto LABEL_215;
            if (v6 && (v175 = *(_QWORD *)(a1 + 512)) != 0 && (v176 = *((_QWORD *)v6 + 64)) != 0)
            {
              v177 = *(float *)(v175 + 36);
              v178 = *(float *)(v176 + 36);
            }
            else
            {
              objc_msgSend((id)a1, "L2FeatureVector");
              v179 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v179, "scoreForFeature:", 1250);
              v177 = v180;

              objc_msgSend(v6, "L2FeatureVector");
              v181 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v181, "scoreForFeature:", 1250);
              v178 = v182;

            }
            if (v177 > 0.0 && v177 > v178)
              goto LABEL_113;
            if (v178 > 0.0 && v178 > v177)
              goto LABEL_215;
            if (v6 && (v183 = *(_QWORD *)(a1 + 512)) != 0 && (v184 = *((_QWORD *)v6 + 64)) != 0)
            {
              v185 = *(float *)(v183 + 40);
              v186 = *(float *)(v184 + 40);
            }
            else
            {
              objc_msgSend((id)a1, "L2FeatureVector");
              v187 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v187, "scoreForFeature:", 1127);
              v185 = v188;

              objc_msgSend(v6, "L2FeatureVector");
              v189 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v189, "scoreForFeature:", 1127);
              v186 = v190;

            }
            if (v185 > 0.0 && v185 > v186)
              goto LABEL_113;
            if (v186 > 0.0 && v186 > v185)
              goto LABEL_215;
            if (v6 && (v191 = *(_QWORD *)(a1 + 512)) != 0 && (v192 = *((_QWORD *)v6 + 64)) != 0)
            {
              v193 = *(float *)(v191 + 44);
              v194 = *(float *)(v192 + 44);
            }
            else
            {
              objc_msgSend((id)a1, "L2FeatureVector");
              v195 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v195, "scoreForFeature:", 1414);
              v193 = v196;

              objc_msgSend(v6, "L2FeatureVector");
              v197 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v197, "scoreForFeature:", 1414);
              v194 = v198;

            }
            if (v193 > 0.0 && v193 > v194)
              goto LABEL_113;
            if (v194 > 0.0 && v194 > v193)
              goto LABEL_215;
            if (v6 && (v199 = *(_QWORD *)(a1 + 512)) != 0 && (v200 = *((_QWORD *)v6 + 64)) != 0)
            {
              v201 = *(float *)(v199 + 48);
              v202 = *(float *)(v200 + 48);
            }
            else
            {
              objc_msgSend((id)a1, "L2FeatureVector");
              v203 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v203, "scoreForFeature:", 1455);
              v201 = v204;

              objc_msgSend(v6, "L2FeatureVector");
              v205 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v205, "scoreForFeature:", 1455);
              v202 = v206;

            }
            if (v201 > 0.0 && v201 > v202)
              goto LABEL_113;
            if (v202 > 0.0 && v202 > v201)
              goto LABEL_215;
            if (v6 && (v207 = *(_QWORD *)(a1 + 512)) != 0 && (v208 = *((_QWORD *)v6 + 64)) != 0)
            {
              v209 = *(float *)(v207 + 52);
              v210 = *(float *)(v208 + 52);
            }
            else
            {
              objc_msgSend((id)a1, "L2FeatureVector");
              v211 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v211, "scoreForFeature:", 1291);
              v209 = v212;

              objc_msgSend(v6, "L2FeatureVector");
              v213 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v213, "scoreForFeature:", 1291);
              v210 = v214;

            }
            if (v209 > 0.0 && v209 > v210)
              goto LABEL_113;
            if (v210 > 0.0 && v210 > v209)
              goto LABEL_215;
            if (v6 && (v215 = *(_QWORD *)(a1 + 512)) != 0 && (v216 = *((_QWORD *)v6 + 64)) != 0)
            {
              v217 = *(float *)(v215 + 56);
              v218 = *(float *)(v216 + 56);
            }
            else
            {
              objc_msgSend((id)a1, "L2FeatureVector");
              v219 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v219, "scoreForFeature:", 1168);
              v217 = v220;

              objc_msgSend(v6, "L2FeatureVector");
              v221 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v221, "scoreForFeature:", 1168);
              v218 = v222;

            }
            if (v217 > 0.0 && v217 > v218)
              goto LABEL_113;
            if (v218 > 0.0 && v218 > v217)
              goto LABEL_215;
            if (v6 && (v223 = *(_QWORD *)(a1 + 512)) != 0 && (v224 = *((_QWORD *)v6 + 64)) != 0)
            {
              v225 = *(float *)(v223 + 60);
              v226 = *(float *)(v224 + 60);
            }
            else
            {
              objc_msgSend((id)a1, "L2FeatureVector");
              v227 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v227, "scoreForFeature:", 1209);
              v225 = v228;

              objc_msgSend(v6, "L2FeatureVector");
              v229 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v229, "scoreForFeature:", 1209);
              v226 = v230;

            }
            if (v225 > 0.0 && v225 > v226)
            {
LABEL_113:
              v12 = 1;
LABEL_216:

              goto LABEL_205;
            }
            if (v226 > 0.0 && v226 > v225)
              goto LABEL_215;
            v428[0] = MEMORY[0x1E0C809B0];
            v428[1] = 3221225472;
            v428[2] = __47__PRSRankingItem_compareWithDates_currentTime___block_invoke_2;
            v428[3] = &unk_1E6E42FD8;
            v425 = v424;
            v429 = v425;
            v231 = v428;
            if (compareWithDates_currentTime__onceToken2 != -1)
              dispatch_once(&compareWithDates_currentTime__onceToken2, v231);

            v232 = *(_QWORD *)(a1 + 544);
            if ((compareWithDates_currentTime__tcExactOrderedPhraseMatch & 0x40) != 0)
              v233 = 1 << compareWithDates_currentTime__tcExactOrderedPhraseMatch;
            else
              v233 = 0;
            if ((compareWithDates_currentTime__tcExactOrderedPhraseMatch & 0x40) != 0)
              v234 = 0;
            else
              v234 = 1 << compareWithDates_currentTime__tcExactOrderedPhraseMatch;
            v235 = v234 & v232;
            v422 = *(_QWORD *)(a1 + 552);
            v236 = v233 & v422;
            v237 = (float)*(unsigned __int128 *)&v235;
            if (v6)
            {
              v238 = *((_QWORD *)v6 + 69);
              v239 = *((_QWORD *)v6 + 68);
            }
            else
            {
              v239 = 0;
              v238 = 0;
            }
            v240 = v239 & v234;
            v241 = v238 & v233;
            if (v237 > (float)*(unsigned __int128 *)&v240)
            {
              v242 = 1;
              v12 = 1;
              goto LABEL_423;
            }
            if (v237 < (float)*(unsigned __int128 *)&v240)
              goto LABEL_392;
            if ((compareWithDates_currentTime__tcMostlyExactOrderedPhraseMatch & 0x40) != 0)
              v243 = 1 << compareWithDates_currentTime__tcMostlyExactOrderedPhraseMatch;
            else
              v243 = 0;
            if ((compareWithDates_currentTime__tcMostlyExactOrderedPhraseMatch & 0x40) != 0)
              v244 = 0;
            else
              v244 = 1 << compareWithDates_currentTime__tcMostlyExactOrderedPhraseMatch;
            v245 = v244 & v232;
            v246 = v243 & v422;
            v247 = (float)*(unsigned __int128 *)&v245;
            if (v6)
            {
              v248 = *((_QWORD *)v6 + 69);
              v249 = *((_QWORD *)v6 + 68);
            }
            else
            {
              v249 = 0;
              v248 = 0;
            }
            v250 = v249 & v244;
            v251 = v248 & v243;
            if (v247 > (float)*(unsigned __int128 *)&v250)
              goto LABEL_422;
            if (v247 >= (float)*(unsigned __int128 *)&v250)
            {
              if ((compareWithDates_currentTime__tcExactOrderedMatch & 0x40) != 0)
                v252 = 1 << compareWithDates_currentTime__tcExactOrderedMatch;
              else
                v252 = 0;
              if ((compareWithDates_currentTime__tcExactOrderedMatch & 0x40) != 0)
                v253 = 0;
              else
                v253 = 1 << compareWithDates_currentTime__tcExactOrderedMatch;
              v254 = v253 & v232;
              v255 = v252 & v422;
              v256 = (float)*(unsigned __int128 *)&v254;
              if (v6)
              {
                v257 = *((_QWORD *)v6 + 69);
                v258 = *((_QWORD *)v6 + 68);
              }
              else
              {
                v258 = 0;
                v257 = 0;
              }
              v259 = v258 & v253;
              v260 = v257 & v252;
              if (v256 > (float)*(unsigned __int128 *)&v259)
                goto LABEL_422;
              if (v256 >= (float)*(unsigned __int128 *)&v259)
              {
                if ((compareWithDates_currentTime__policyFieldsPhraseMatchBit & 0x40) != 0)
                  v261 = 1 << compareWithDates_currentTime__policyFieldsPhraseMatchBit;
                else
                  v261 = 0;
                if ((compareWithDates_currentTime__policyFieldsPhraseMatchBit & 0x40) != 0)
                  v262 = 0;
                else
                  v262 = 1 << compareWithDates_currentTime__policyFieldsPhraseMatchBit;
                v263 = v262 & v232;
                v264 = v261 & v422;
                v265 = (float)*(unsigned __int128 *)&v263;
                if (v6)
                {
                  v266 = *((_QWORD *)v6 + 69);
                  v267 = *((_QWORD *)v6 + 68);
                }
                else
                {
                  v267 = 0;
                  v266 = 0;
                }
                v268 = v267 & v262;
                v269 = v266 & v261;
                if (v265 > (float)*(unsigned __int128 *)&v268)
                {
LABEL_422:
                  v12 = 1;
                  v242 = 1;
                  goto LABEL_423;
                }
                if (v265 >= (float)*(unsigned __int128 *)&v268)
                {
                  if (v6 && (v270 = *(_QWORD *)(a1 + 512)) != 0 && (v271 = *((_QWORD *)v6 + 64)) != 0)
                  {
                    v272 = *(float *)(v270 + 64);
                    v273 = *(float *)(v271 + 64);
                  }
                  else
                  {
                    objc_msgSend((id)a1, "L2FeatureVector");
                    v274 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v274, "scoreForFeature:", 159);
                    v272 = v275;

                    objc_msgSend(v6, "L2FeatureVector");
                    v276 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v276, "scoreForFeature:", 159);
                    v273 = v277;

                  }
                  if (v272 > 0.0 && v272 > v273)
                    goto LABEL_422;
                  if (v273 <= 0.0 || v273 <= v272)
                  {
                    if (v6 && (v278 = *(_QWORD *)(a1 + 512)) != 0 && (v279 = *((_QWORD *)v6 + 64)) != 0)
                    {
                      v280 = *(float *)(v278 + 68);
                      v281 = *(float *)(v279 + 68);
                    }
                    else
                    {
                      objc_msgSend((id)a1, "L2FeatureVector");
                      v282 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v282, "scoreForFeature:", 1366);
                      v280 = v283;

                      objc_msgSend(v6, "L2FeatureVector");
                      v284 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v284, "scoreForFeature:", 1366);
                      v281 = v285;

                    }
                    if (v280 > 0.0 && v280 > v281)
                      goto LABEL_422;
                    if (v281 <= 0.0 || v281 <= v280)
                    {
                      if (v6 && (v286 = *(_QWORD *)(a1 + 512)) != 0 && (v287 = *((_QWORD *)v6 + 64)) != 0)
                      {
                        v288 = *(float *)(v286 + 72);
                        v289 = *(float *)(v287 + 72);
                      }
                      else
                      {
                        objc_msgSend((id)a1, "L2FeatureVector");
                        v290 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v290, "scoreForFeature:", 1079);
                        v288 = v291;

                        objc_msgSend(v6, "L2FeatureVector");
                        v292 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v292, "scoreForFeature:", 1079);
                        v289 = v293;

                      }
                      if (v288 > 0.0 && v288 > v289)
                        goto LABEL_422;
                      if (v289 <= 0.0 || v289 <= v288)
                      {
                        if (v6 && (v294 = *(_QWORD *)(a1 + 512)) != 0 && (v295 = *((_QWORD *)v6 + 64)) != 0)
                        {
                          v296 = *(float *)(v294 + 76);
                          v297 = *(float *)(v295 + 76);
                        }
                        else
                        {
                          objc_msgSend((id)a1, "L2FeatureVector");
                          v298 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v298, "scoreForFeature:", 133);
                          v296 = v299;

                          objc_msgSend(v6, "L2FeatureVector");
                          v300 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v300, "scoreForFeature:", 133);
                          v297 = v301;

                        }
                        if (v296 > 0.0 && v296 > v297)
                          goto LABEL_422;
                        if (v297 <= 0.0 || v297 <= v296)
                        {
                          if (v6 && (v302 = *(_QWORD *)(a1 + 512)) != 0 && (v303 = *((_QWORD *)v6 + 64)) != 0)
                          {
                            v304 = *(float *)(v302 + 80);
                            v305 = *(float *)(v303 + 80);
                          }
                          else
                          {
                            objc_msgSend((id)a1, "L2FeatureVector");
                            v306 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v306, "scoreForFeature:", 157);
                            v304 = v307;

                            objc_msgSend(v6, "L2FeatureVector");
                            v308 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v308, "scoreForFeature:", 157);
                            v305 = v309;

                          }
                          if (v304 > 0.0 && v304 > v305)
                            goto LABEL_422;
                          if (v305 <= 0.0 || v305 <= v304)
                          {
                            if (v6 && (v310 = *(_QWORD *)(a1 + 512)) != 0 && (v311 = *((_QWORD *)v6 + 64)) != 0)
                            {
                              v312 = *(float *)(v310 + 84);
                              v313 = *(float *)(v311 + 84);
                            }
                            else
                            {
                              objc_msgSend((id)a1, "L2FeatureVector");
                              v314 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v314, "scoreForFeature:", 1530);
                              v312 = v315;

                              objc_msgSend(v6, "L2FeatureVector");
                              v316 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v316, "scoreForFeature:", 1530);
                              v313 = v317;

                            }
                            if (v312 > 0.0 && v312 > v313)
                              goto LABEL_422;
                            if (v313 <= 0.0 || v313 <= v312)
                            {
                              if (v6 && (v318 = *(_QWORD *)(a1 + 512)) != 0 && (v319 = *((_QWORD *)v6 + 64)) != 0)
                              {
                                v320 = *(float *)(v318 + 88);
                                v321 = *(float *)(v319 + 88);
                              }
                              else
                              {
                                objc_msgSend((id)a1, "L2FeatureVector");
                                v322 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(v322, "scoreForFeature:", 1489);
                                v320 = v323;

                                objc_msgSend(v6, "L2FeatureVector");
                                v324 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(v324, "scoreForFeature:", 1489);
                                v321 = v325;

                              }
                              if (v320 > 0.0 && v320 > v321)
                                goto LABEL_422;
                              if (v321 <= 0.0 || v321 <= v320)
                              {
                                if (v6 && (v326 = *(_QWORD *)(a1 + 512)) != 0 && (v327 = *((_QWORD *)v6 + 64)) != 0)
                                {
                                  v328 = *(float *)(v326 + 92);
                                  v329 = *(float *)(v327 + 92);
                                }
                                else
                                {
                                  objc_msgSend((id)a1, "L2FeatureVector");
                                  v330 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_msgSend(v330, "scoreForFeature:", 1571);
                                  v328 = v331;

                                  objc_msgSend(v6, "L2FeatureVector");
                                  v332 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_msgSend(v332, "scoreForFeature:", 1571);
                                  v329 = v333;

                                }
                                if (v328 > 0.0 && v328 > v329)
                                  goto LABEL_422;
                                if (v329 <= 0.0 || v329 <= v328)
                                {
                                  if (v6 && (v334 = *(_QWORD *)(a1 + 512)) != 0 && (v335 = *((_QWORD *)v6 + 64)) != 0)
                                  {
                                    v336 = *(float *)(v334 + 96);
                                    v337 = *(float *)(v335 + 96);
                                  }
                                  else
                                  {
                                    objc_msgSend((id)a1, "L2FeatureVector");
                                    v338 = (void *)objc_claimAutoreleasedReturnValue();
                                    objc_msgSend(v338, "scoreForFeature:", 1325);
                                    v336 = v339;

                                    objc_msgSend(v6, "L2FeatureVector");
                                    v340 = (void *)objc_claimAutoreleasedReturnValue();
                                    objc_msgSend(v340, "scoreForFeature:", 1325);
                                    v337 = v341;

                                  }
                                  if (v336 > 0.0 && v336 > v337)
                                    goto LABEL_422;
                                  if (v337 <= 0.0 || v337 <= v336)
                                  {
                                    if (v6 && (v342 = *(_QWORD *)(a1 + 512)) != 0 && (v343 = *((_QWORD *)v6 + 64)) != 0)
                                    {
                                      v344 = *(float *)(v342 + 100);
                                      v345 = *(float *)(v343 + 100);
                                    }
                                    else
                                    {
                                      objc_msgSend((id)a1, "L2FeatureVector");
                                      v346 = (void *)objc_claimAutoreleasedReturnValue();
                                      objc_msgSend(v346, "scoreForFeature:", 1243);
                                      v344 = v347;

                                      objc_msgSend(v6, "L2FeatureVector");
                                      v348 = (void *)objc_claimAutoreleasedReturnValue();
                                      objc_msgSend(v348, "scoreForFeature:", 1243);
                                      v345 = v349;

                                    }
                                    if (v344 > 0.0 && v344 > v345)
                                      goto LABEL_422;
                                    if (v345 <= 0.0 || v345 <= v344)
                                    {
                                      if (v6
                                        && (v350 = *(_QWORD *)(a1 + 512)) != 0
                                        && (v351 = *((_QWORD *)v6 + 64)) != 0)
                                      {
                                        v352 = *(float *)(v350 + 104);
                                        v353 = *(float *)(v351 + 104);
                                      }
                                      else
                                      {
                                        objc_msgSend((id)a1, "L2FeatureVector");
                                        v354 = (void *)objc_claimAutoreleasedReturnValue();
                                        objc_msgSend(v354, "scoreForFeature:", 1120);
                                        v352 = v355;

                                        objc_msgSend(v6, "L2FeatureVector");
                                        v356 = (void *)objc_claimAutoreleasedReturnValue();
                                        objc_msgSend(v356, "scoreForFeature:", 1120);
                                        v353 = v357;

                                      }
                                      if (v352 > 0.0 && v352 > v353)
                                        goto LABEL_422;
                                      if (v353 <= 0.0 || v353 <= v352)
                                      {
                                        if (v6
                                          && (v358 = *(_QWORD *)(a1 + 512)) != 0
                                          && (v359 = *((_QWORD *)v6 + 64)) != 0)
                                        {
                                          v360 = *(float *)(v358 + 108);
                                          v361 = *(float *)(v359 + 108);
                                        }
                                        else
                                        {
                                          objc_msgSend((id)a1, "L2FeatureVector");
                                          v362 = (void *)objc_claimAutoreleasedReturnValue();
                                          objc_msgSend(v362, "scoreForFeature:", 1407);
                                          v360 = v363;

                                          objc_msgSend(v6, "L2FeatureVector");
                                          v364 = (void *)objc_claimAutoreleasedReturnValue();
                                          objc_msgSend(v364, "scoreForFeature:", 1407);
                                          v361 = v365;

                                        }
                                        if (v360 > 0.0 && v360 > v361)
                                          goto LABEL_422;
                                        if (v361 <= 0.0 || v361 <= v360)
                                        {
                                          if (v6
                                            && (v366 = *(_QWORD *)(a1 + 512)) != 0
                                            && (v367 = *((_QWORD *)v6 + 64)) != 0)
                                          {
                                            v368 = *(float *)(v366 + 112);
                                            v369 = *(float *)(v367 + 112);
                                          }
                                          else
                                          {
                                            objc_msgSend((id)a1, "L2FeatureVector");
                                            v370 = (void *)objc_claimAutoreleasedReturnValue();
                                            objc_msgSend(v370, "scoreForFeature:", 1448);
                                            v368 = v371;

                                            objc_msgSend(v6, "L2FeatureVector");
                                            v372 = (void *)objc_claimAutoreleasedReturnValue();
                                            objc_msgSend(v372, "scoreForFeature:", 1448);
                                            v369 = v373;

                                          }
                                          if (v368 > 0.0 && v368 > v369)
                                            goto LABEL_422;
                                          if (v369 <= 0.0 || v369 <= v368)
                                          {
                                            if (v6
                                              && (v374 = *(_QWORD *)(a1 + 512)) != 0
                                              && (v375 = *((_QWORD *)v6 + 64)) != 0)
                                            {
                                              v376 = *(float *)(v374 + 116);
                                              v377 = *(float *)(v375 + 116);
                                            }
                                            else
                                            {
                                              objc_msgSend((id)a1, "L2FeatureVector");
                                              v378 = (void *)objc_claimAutoreleasedReturnValue();
                                              objc_msgSend(v378, "scoreForFeature:", 1284);
                                              v376 = v379;

                                              objc_msgSend(v6, "L2FeatureVector");
                                              v380 = (void *)objc_claimAutoreleasedReturnValue();
                                              objc_msgSend(v380, "scoreForFeature:", 1284);
                                              v377 = v381;

                                            }
                                            if (v376 > 0.0 && v376 > v377)
                                              goto LABEL_422;
                                            if (v377 <= 0.0 || v377 <= v376)
                                            {
                                              if (v6
                                                && (v382 = *(_QWORD *)(a1 + 512)) != 0
                                                && (v383 = *((_QWORD *)v6 + 64)) != 0)
                                              {
                                                v384 = *(float *)(v382 + 120);
                                                v385 = *(float *)(v383 + 120);
                                              }
                                              else
                                              {
                                                objc_msgSend((id)a1, "L2FeatureVector");
                                                v386 = (void *)objc_claimAutoreleasedReturnValue();
                                                objc_msgSend(v386, "scoreForFeature:", 1161);
                                                v384 = v387;

                                                objc_msgSend(v6, "L2FeatureVector");
                                                v388 = (void *)objc_claimAutoreleasedReturnValue();
                                                objc_msgSend(v388, "scoreForFeature:", 1161);
                                                v385 = v389;

                                              }
                                              if (v384 > 0.0 && v384 > v385)
                                                goto LABEL_422;
                                              if (v385 <= 0.0 || v385 <= v384)
                                              {
                                                if (v6
                                                  && (v390 = *(_QWORD *)(a1 + 512)) != 0
                                                  && (v391 = *((_QWORD *)v6 + 64)) != 0)
                                                {
                                                  v392 = *(float *)(v390 + 124);
                                                  v393 = *(float *)(v391 + 124);
                                                }
                                                else
                                                {
                                                  objc_msgSend((id)a1, "L2FeatureVector");
                                                  v394 = (void *)objc_claimAutoreleasedReturnValue();
                                                  objc_msgSend(v394, "scoreForFeature:", 1202);
                                                  v392 = v395;

                                                  objc_msgSend(v6, "L2FeatureVector");
                                                  v396 = (void *)objc_claimAutoreleasedReturnValue();
                                                  objc_msgSend(v396, "scoreForFeature:", 1202);
                                                  v393 = v397;

                                                }
                                                if (v392 > 0.0 && v392 > v393)
                                                  goto LABEL_422;
                                                if (v393 <= 0.0 || v393 <= v392)
                                                {
                                                  v426[0] = MEMORY[0x1E0C809B0];
                                                  v426[1] = 3221225472;
                                                  v426[2] = __47__PRSRankingItem_compareWithDates_currentTime___block_invoke_3;
                                                  v426[3] = &unk_1E6E42FD8;
                                                  v427 = v425;
                                                  v398 = v426;
                                                  if (compareWithDates_currentTime__onceToken3[0] != -1)
                                                    dispatch_once(compareWithDates_currentTime__onceToken3, v398);

                                                  v399 = *(_QWORD *)(a1 + 544);
                                                  if ((compareWithDates_currentTime__tcOrderedPhraseMatch & 0x40) != 0)
                                                    v400 = 1 << compareWithDates_currentTime__tcOrderedPhraseMatch;
                                                  else
                                                    v400 = 0;
                                                  if ((compareWithDates_currentTime__tcOrderedPhraseMatch & 0x40) != 0)
                                                    v401 = 0;
                                                  else
                                                    v401 = 1 << compareWithDates_currentTime__tcOrderedPhraseMatch;
                                                  v402 = v401 & v399;
                                                  v403 = v400 & *(_QWORD *)(a1 + 552);
                                                  v404 = (float)*(unsigned __int128 *)&v402;
                                                  if (v6)
                                                  {
                                                    v405 = *((_QWORD *)v6 + 69);
                                                    v406 = *((_QWORD *)v6 + 68);
                                                  }
                                                  else
                                                  {
                                                    v406 = 0;
                                                    v405 = 0;
                                                  }
                                                  v407 = v406 & v401;
                                                  v408 = v405 & v400;
                                                  if (v404 <= (float)*(unsigned __int128 *)&v407)
                                                  {
                                                    if (v404 >= (float)*(unsigned __int128 *)&v407)
                                                    {
                                                      if ((compareWithDates_currentTime__tcOrderedMatch & 0x40) != 0)
                                                        v409 = 1 << compareWithDates_currentTime__tcOrderedMatch;
                                                      else
                                                        v409 = 0;
                                                      if ((compareWithDates_currentTime__tcOrderedMatch & 0x40) != 0)
                                                        v410 = 0;
                                                      else
                                                        v410 = 1 << compareWithDates_currentTime__tcOrderedMatch;
                                                      v411 = v410 & v399;
                                                      v412 = v409 & *(_QWORD *)(a1 + 552);
                                                      v413 = (float)*(unsigned __int128 *)&v411;
                                                      if (v6)
                                                      {
                                                        v414 = *((_QWORD *)v6 + 69);
                                                        v415 = *((_QWORD *)v6 + 68);
                                                      }
                                                      else
                                                      {
                                                        v415 = 0;
                                                        v414 = 0;
                                                      }
                                                      v416 = v415 & v410;
                                                      v417 = v414 & v409;
                                                      v418 = (float)*(unsigned __int128 *)&v416;
                                                      if (v413 < (float)*(unsigned __int128 *)&v416)
                                                        v419 = -1;
                                                      else
                                                        v419 = v14;
                                                      v242 = v413 > v418 || v413 < v418;
                                                      if (v413 > v418)
                                                        v12 = 1;
                                                      else
                                                        v12 = v419;
                                                    }
                                                    else
                                                    {
                                                      v12 = -1;
                                                      v242 = 1;
                                                    }
                                                  }
                                                  else
                                                  {
                                                    v12 = 1;
                                                    v242 = 1;
                                                  }

LABEL_423:
                                                  if (v242)
                                                    goto LABEL_205;
                                                  goto LABEL_69;
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
LABEL_392:
            v12 = -1;
            v242 = 1;
            goto LABEL_423;
          }
LABEL_60:
          v12 = -1;
          goto LABEL_205;
        }
      }
    }
    else
    {
      if (v18 && !v19)
        goto LABEL_57;
      if (!v18 && v19)
        goto LABEL_60;
    }
LABEL_197:
    v91 = *(_QWORD *)(a1 + 384);
    if ((v91 & 0x200000) != 0)
    {
      if ((objc_msgSend(v6, "bundleIDType") & 0x200000) != 0)
      {
        v12 = (*((uint64_t (**)(uint64_t, void *, void *))compareShortcuts + 2))((uint64_t)compareShortcuts, (void *)a1, v6);
        goto LABEL_205;
      }
      v91 = *(_QWORD *)(a1 + 384);
    }
    if ((v91 & 0x10) == 0
      || (objc_msgSend(v6, "bundleIDType") & 0x10) == 0
      || (v12 = (*((uint64_t (**)(uint64_t, void *, void *))comparePreferences + 2))((uint64_t)comparePreferences, (void *)a1, v6)) == 0)
    {
      v12 = 0;
    }
    goto LABEL_205;
  }
LABEL_207:

  return v12;
}

void __88__PRSRankingItem_compareWithDatesPlus_currentTime_hasCategory_topBit_upperBit_lowerBit___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("PRSPolicyFieldsExactPhraseMatchBit"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  compareWithDatesPlus_currentTime_hasCategory_topBit_upperBit_lowerBit__bit1 = objc_msgSend(v2, "integerValue");

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("PRSPolicyFieldsMostlyExactPhraseMatchBit"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  compareWithDatesPlus_currentTime_hasCategory_topBit_upperBit_lowerBit__bit2 = objc_msgSend(v3, "integerValue");

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("exact_policy_flag_bit"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  compareWithDatesPlus_currentTime_hasCategory_topBit_upperBit_lowerBit__bit3 = objc_msgSend(v4, "integerValue");

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("PRSPolicyFieldsPhraseMatchBit"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  compareWithDatesPlus_currentTime_hasCategory_topBit_upperBit_lowerBit__bit4 = objc_msgSend(v5, "integerValue");

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("PRSPolicyFieldsPrefixMatch"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  compareWithDatesPlus_currentTime_hasCategory_topBit_upperBit_lowerBit__bit5 = objc_msgSend(v6, "integerValue");

}

- (uint64_t)comparePhotosOnlyWithDates:(double)a3 currentTime:
{
  _BYTE *v5;
  unsigned int v6;
  void *v7;
  char v8;
  unsigned int v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  BOOL v18;
  uint64_t v19;

  v5 = a2;
  if (!a1)
  {
    v10 = 0;
    goto LABEL_39;
  }
  if ((objc_msgSend(*(id *)(a1 + 240), "isSiriAction") & 1) != 0)
  {
    v6 = 2;
  }
  else if (*(_BYTE *)(a1 + 75))
  {
    v6 = 4;
  }
  else
  {
    v6 = 8;
  }
  objc_msgSend(v5, "L2FeatureVector");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isSiriAction");

  if ((v8 & 1) != 0)
  {
    v9 = 2;
  }
  else
  {
    v9 = 8;
    if (v5)
    {
      if (v5[75])
        v9 = 4;
      else
        v9 = 8;
    }
  }
  if (v6 <= v9)
  {
    if (v6 < v9)
    {
      v10 = -1;
      goto LABEL_39;
    }
    objc_msgSend((id)a1, "interestingDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "interestingDate");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v11 && v12)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v11, "timeIntervalSinceReferenceDate");
          v15 = v14 - a3;
          objc_msgSend(v13, "timeIntervalSinceReferenceDate");
          v17 = v16 - a3;
          if ((v15 < 0.0 || v17 < 0.0) && (v15 > 0.0 || v17 > 0.0))
            goto LABEL_42;
          v15 = fabs(v15);
          v17 = fabs(v17);
          if (v15 >= v17)
          {
            if (v15 > v17)
            {
              v10 = -1;
LABEL_38:

              goto LABEL_39;
            }
            if (v15 == v17)
            {
              v10 = 0;
              goto LABEL_38;
            }
LABEL_42:
            if (v17 >= 0.0 || v15 <= 0.0)
              v10 = -1;
            else
              v10 = 1;
            goto LABEL_38;
          }
LABEL_30:
          v10 = 1;
          goto LABEL_38;
        }
      }
    }
    else if (v11 && !v12)
    {
      goto LABEL_30;
    }
    if (v11)
      v18 = 1;
    else
      v18 = v13 == 0;
    v19 = !v18;
    v10 = v19 << 63 >> 63;
    goto LABEL_38;
  }
  v10 = 1;
LABEL_39:

  return v10;
}

void __47__PRSRankingItem_compareWithDates_currentTime___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("PRSPolicyFieldsExactPhraseMatchBit"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  compareWithDates_currentTime__policyFieldsExactPhraseMatchBit = objc_msgSend(v2, "integerValue");

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("PRSPolicyFieldsMostlyExactPhraseMatchBit"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  compareWithDates_currentTime__policyFieldsMostlyExactPhraseMatchBit = objc_msgSend(v3, "integerValue");

}

void __47__PRSRankingItem_compareWithDates_currentTime___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("PRSRankingTCExactOrderedPhraseMatch"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  compareWithDates_currentTime__tcExactOrderedPhraseMatch = objc_msgSend(v2, "integerValue");

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("PRSRankingTCMostlyExactOrderedPhraseMatch"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  compareWithDates_currentTime__tcMostlyExactOrderedPhraseMatch = objc_msgSend(v3, "integerValue");

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("PRSRankingTCExactOrderedMatch"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  compareWithDates_currentTime__tcExactOrderedMatch = objc_msgSend(v4, "integerValue");

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("PRSPolicyFieldsPhraseMatchBit"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  compareWithDates_currentTime__policyFieldsPhraseMatchBit = objc_msgSend(v5, "integerValue");

}

void __47__PRSRankingItem_compareWithDates_currentTime___block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("PRSRankingTCOrderedPhraseMatch"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  compareWithDates_currentTime__tcOrderedPhraseMatch = objc_msgSend(v2, "integerValue");

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("PRSRankingTCOrderedMatch"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  compareWithDates_currentTime__tcOrderedMatch = objc_msgSend(v3, "integerValue");

}

- (int64_t)compare:(id)a3 currentTime:(double)a4
{
  _QWORD *v6;
  NSString *v7;
  void *v8;
  float v9;
  float v10;
  float withinBundleScore;
  void *v12;
  uint64_t v13;
  void *v14;
  int64_t v15;
  void *v16;
  float v17;
  float v18;
  uint64_t v19;
  int ArrayInt64;
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  void *v31;
  void *v32;
  _OWORD v33[2];
  _OWORD __dst[2];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = self->_sectionBundleIdentifier;
  objc_msgSend(v6, "sectionBundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[NSString isEqualToString:](v7, "isEqualToString:", v8)
    && (!SSSectionIsSyndicatedPhotos(v7) || !SSSectionIsSyndicatedPhotos(v8)))
  {
    objc_msgSend(v6, "L2FeatureVector");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "originalL2Score");
    v10 = v17;

    -[PRSL2FeatureVector originalL2Score](self->_L2FeatureVector, "originalL2Score");
    withinBundleScore = v18;
    goto LABEL_12;
  }
  objc_msgSend(v6, "withinBundleScore");
  v10 = v9;
  withinBundleScore = self->_withinBundleScore;
  if ((self->_bundleIDType & 0x80) == 0)
    goto LABEL_12;
  SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0xDuLL);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(v6, "attributes"), 0xDuLL);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v12 && v13)
  {
    if ((objc_msgSend(v12, "hasPrefix:", v13) & 1) != 0)
    {
      v15 = -1;
LABEL_27:

      goto LABEL_28;
    }
    if (objc_msgSend(v14, "hasPrefix:", v12))
    {
      v15 = 1;
      goto LABEL_27;
    }
  }
  else
  {
    NSLog(CFSTR("Error: couldn't compare URLs for safari items: selfURL=%p, itemURL=%p"), v12, v13);
  }

LABEL_12:
  if (withinBundleScore > v10)
  {
LABEL_13:
    v15 = 1;
    goto LABEL_28;
  }
  if (withinBundleScore < v10)
    goto LABEL_16;
  v19 = -[PRSRankingItem compareWithDates:currentTime:]((uint64_t)self, v6, a4);
  v15 = v19;
  if (v19)
    goto LABEL_28;
  memset(__dst, 0, sizeof(__dst));
  memset(v33, 0, sizeof(v33));
  ArrayInt64 = SSCompactRankingAttrsGetArrayInt64((uint64_t)self->_attributes, 0x115uLL, __dst, 4);
  v21 = SSCompactRankingAttrsGetArrayInt64(objc_msgSend(v6, "attributes"), 0x115uLL, v33, 4);
  if (!ArrayInt64 || !v21)
  {
    v26 = ArrayInt64 | v21;
    if (ArrayInt64)
      v15 = 1;
    else
      v15 = -1;
    if ((v26 & 1) != 0)
      goto LABEL_28;
    v27 = *(_QWORD *)&self->_indexScore[8];
    v28 = *(_QWORD *)self->_indexScore;
    if (v6)
    {
      v29 = v6[69];
      v30 = v6[68];
    }
    else
    {
      v30 = 0;
      v29 = 0;
    }
    if (__PAIR128__(v29, v30) < __PAIR128__(v27, v28))
      goto LABEL_13;
    if (__PAIR128__(v27, v28) >= __PAIR128__(v29, v30))
    {
      -[PRSRankingItem likelyDisplayTitle](self, "likelyDisplayTitle");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "likelyDisplayTitle");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v31, "length") && objc_msgSend(v32, "length"))
      {
        v15 = objc_msgSend(v31, "compare:", v32);
      }
      else if (objc_msgSend(v31, "length"))
      {
        v15 = 1;
      }
      else if (objc_msgSend(v32, "length"))
      {
        v15 = -1;
      }
      else
      {
        v15 = 0;
      }

      goto LABEL_28;
    }
LABEL_16:
    v15 = -1;
    goto LABEL_28;
  }
  v22 = 0;
  v15 = 1;
  while (1)
  {
    v23 = *(_QWORD *)((char *)__dst + v22);
    v24 = *(_QWORD *)((char *)v33 + v22);
    if (v23 > v24)
      break;
    if (v23 < v24)
      goto LABEL_16;
    v22 += 8;
    if (v22 == 32)
    {
      v15 = 0;
      break;
    }
  }
LABEL_28:

  return v15;
}

- (id)displayName
{
  return SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 7uLL);
}

- (id)likelyDisplayTitle
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v8;
  void *v9;

  SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 7uLL);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    v4 = v3;
  }
  else
  {
    SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0xCuLL);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v5, "length"))
    {
      SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 5uLL);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "componentsJoinedByString:", CFSTR(" "));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v6 = v9;
      goto LABEL_6;
    }
    v4 = v5;
  }
  v6 = v4;
LABEL_6:

  return v6;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  NSString *sectionBundleIdentifier;
  double pommesL1Score;
  double l2Score;
  void *v9;
  void *v10;
  float v11;
  void *v12;
  objc_super v14;

  SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 2uLL);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  v14.receiver = self;
  v14.super_class = (Class)PRSRankingItem;
  -[PRSRankingItem description](&v14, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  sectionBundleIdentifier = self->_sectionBundleIdentifier;
  pommesL1Score = self->_pommesL1Score;
  l2Score = self->_l2Score;
  -[PRSRankingItem likelyDisplayTitle](self, "likelyDisplayTitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRSRankingItem interestingDate](self, "interestingDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRSL2FeatureVector originalL2Score](self->_L2FeatureVector, "originalL2Score");
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ %@ identifier:%@ L1:%f L2:%f displayTitle:\"%@\" interestingDate:\"%@\" (originalL2=%f, score=%f)"), v5, sectionBundleIdentifier, v3, *(_QWORD *)&pommesL1Score, *(_QWORD *)&l2Score, v9, v10, v11, self->_score);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
}

- (id)dataCollectionBundle
{
  return self->_sectionBundleIdentifier;
}

- (id)contentType
{
  return self->_contentType;
}

- (BOOL)serializeToJSON:(void *)a3 valuesOnly:(BOOL)a4
{
  PRSL2FeatureVector *L2FeatureVector;
  NSUInteger v7;
  size_t v9;
  char *v10;
  char *v11;
  char *v12;
  size_t v13;
  uint64_t v14;
  char *v15;
  unsigned int v16;
  int v17;
  unint64_t v18;
  BOOL v19;
  char *v20;
  char *v21;
  unsigned int v22;
  int v23;
  void *v25;
  char *v26;

  L2FeatureVector = self->_L2FeatureVector;
  if (!L2FeatureVector)
  {
    v7 = -[NSData length](self->_serverFeaturesJSON, "length");
    if (!v7)
      return v7;
    v9 = v7;
    v10 = -[NSData bytes](self->_serverFeaturesJSON, "bytes");
    v11 = v10;
    if (a4)
    {
      v12 = &v10[v9];
      v13 = v9 - 1;
      v14 = MEMORY[0x1E0C80978];
      v15 = v10;
      do
      {
        v16 = *v15;
        if ((v16 & 0x80000000) != 0)
          v17 = __maskrune(*v15, 0x4000uLL);
        else
          v17 = *(_DWORD *)(v14 + 4 * v16 + 60) & 0x4000;
        v18 = (unint64_t)(v15 + 1);
        --v13;
        if (v17)
          v19 = v15 >= v12;
        else
          v19 = 1;
        ++v15;
      }
      while (!v19);
      if (v16 != 123)
        goto LABEL_25;
      v20 = &v11[v9 - 1];
      do
      {
        v21 = v20;
        v9 = v13;
        if ((unint64_t)(v20 + 1) <= v18)
          break;
        v22 = *v20;
        v23 = (v22 & 0x80000000) != 0 ? __maskrune(v22, 0x4000uLL) : *(_DWORD *)(v14 + 4 * v22 + 60) & 0x4000;
        v20 = v21 - 1;
        --v13;
      }
      while (v23);
      if (*v21 != 125 || (unint64_t)v21 <= v18)
      {
LABEL_25:
        LOBYTE(v7) = 0;
        return v7;
      }
      v25 = a3;
      v26 = (char *)v18;
    }
    else
    {
      v25 = a3;
      v26 = v11;
    }
    json_writer_add_raw_value((uint64_t)v25, v26, v9);
    LOBYTE(v7) = 1;
    return v7;
  }
  LOBYTE(v7) = -[PRSL2FeatureVector serializeToJSON:options:](L2FeatureVector, "serializeToJSON:options:", a3, 1);
  return v7;
}

- (uint64_t)recencyTestForVisibilityWithCurrentTime:(uint64_t)a1
{
  uint64_t v2;
  id v4;
  __CFString *v5;
  uint64_t v6;
  void *v8;
  const __CFString *v9;
  __CFString *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  double v15;
  uint64_t v16;
  void *v17;
  BOOL v18;
  unint64_t v19;

  v2 = a1;
  if (a1)
  {
    v4 = *(id *)(a1 + 208);
    v5 = CFSTR("public.message");
    v6 = *(_QWORD *)(v2 + 384);
    if ((v6 & 0x30900) != 0 || (v6 & 0x2040000) != 0 && (*(_BYTE *)(v2 + 62) || *(_BYTE *)(v2 + 63)))
    {
      v2 = 1;
LABEL_4:

      return v2;
    }
    objc_msgSend((id)v2, "interestingDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      v12 = *(_QWORD *)(v2 + 384);
      v13 = -1;
      if ((v12 & 0x40) != 0)
        v13 = 1;
      if ((v12 & 0x20) != 0)
        v2 = 0;
      else
        v2 = v13;
      goto LABEL_24;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v2 = -1;
LABEL_24:

      goto LABEL_4;
    }
    if ((*(_BYTE *)(v2 + 385) & 0x40) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 14.0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = +[SSRankingManager getRecencyIntervalForBundleType:intervalType:indexRequired:]((uint64_t)SSRankingManager, v14, 3, 0xFFFFFFFFFFFFFFFFLL);

    }
    else
    {
      v9 = CFSTR("public.contact");
      if (objc_msgSend(*(id *)(v2 + 368), "isEqualToString:", CFSTR("public.contact"))
        || (v9 = CFSTR("public.email-message"),
            objc_msgSend(*(id *)(v2 + 368), "isEqualToString:", CFSTR("public.email-message"))))
      {
        v10 = (__CFString *)v9;
      }
      else if (objc_msgSend(*(id *)(v2 + 368), "isEqualToString:", v5))
      {
        v10 = v5;
      }
      else
      {
        if (objc_msgSend(*(id *)(v2 + 368), "isEqualToString:", CFSTR("public.to-do-item")))
        {
          objc_msgSend((id)v2, "dueDate");
          v16 = objc_claimAutoreleasedReturnValue();
          v17 = (void *)v16;
          if (v16)
            v18 = v16 == (_QWORD)v8;
          else
            v18 = 0;
          v19 = !v18;
          v11 = +[SSRankingManager getRecencyIntervalForBundleId:intervalType:indexRequired:]((uint64_t)SSRankingManager, CFSTR("public.to-do-item"), 3, v19);

          goto LABEL_23;
        }
        if (objc_msgSend(*(id *)(v2 + 368), "isEqualToString:", CFSTR("public.calendar-event")))
          v10 = CFSTR("public.calendar-event");
        else
          v10 = CFSTR("default");
      }
      v11 = +[SSRankingManager getRecencyIntervalForBundleId:intervalType:indexRequired:]((uint64_t)SSRankingManager, v10, 3, 0xFFFFFFFFFFFFFFFFLL);
    }
LABEL_23:
    objc_msgSend(v8, "timeIntervalSinceReferenceDate");
    v2 = v15 - a2 > (double)v11;
    goto LABEL_24;
  }
  return v2;
}

- (uint64_t)recencyTestForTopHitWithCurrentTime:(uint64_t)a1
{
  uint64_t v2;
  id v4;
  void *v5;
  const __CFString *v6;
  __CFString *v7;
  uint64_t v8;
  double v9;
  void *v11;
  float v12;
  float v13;
  void *v14;
  void *v15;
  unint64_t v16;

  v2 = a1;
  if (a1)
  {
    v4 = *(id *)(a1 + 208);
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.application")) & 1) != 0)
    {
      v2 = 1;
LABEL_17:

      return v2;
    }
    objc_msgSend((id)v2, "interestingDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v2 = 0;
      goto LABEL_16;
    }
    v6 = CFSTR("public.contact");
    if (objc_msgSend(*(id *)(v2 + 368), "isEqualToString:", CFSTR("public.contact"))
      || (v6 = CFSTR("public.email-message"),
          objc_msgSend(*(id *)(v2 + 368), "isEqualToString:", CFSTR("public.email-message")))
      || objc_msgSend(*(id *)(v2 + 368), "isEqualToString:", CFSTR("public.message"))
      || objc_msgSend(*(id *)(v2 + 368), "isEqualToString:", CFSTR("public.to-do-item"))
      || objc_msgSend(*(id *)(v2 + 368), "isEqualToString:", CFSTR("public.calendar-event"))
      || objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.Preferences")))
    {
      v7 = (__CFString *)v6;
    }
    else
    {
      if ((*(_BYTE *)(v2 + 385) & 2) != 0)
      {
        objc_msgSend((id)v2, "L2FeatureVector");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "scoreForFeature:", 1881);
        v13 = v12;

        if (v13 <= 10.0)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 9.0);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v14;
          if (v13 <= 1.0)
            v16 = 2;
          else
            v16 = 1;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 9.0);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v14;
          v16 = 0;
        }
        v8 = +[SSRankingManager getRecencyIntervalForBundleType:intervalType:indexRequired:]((uint64_t)SSRankingManager, v15, 2, v16);

        goto LABEL_14;
      }
      v7 = CFSTR("default");
    }
    v8 = +[SSRankingManager getRecencyIntervalForBundleId:intervalType:indexRequired:]((uint64_t)SSRankingManager, v7, 2, 0xFFFFFFFFFFFFFFFFLL);
LABEL_14:
    objc_msgSend(v5, "timeIntervalSinceReferenceDate");
    v2 = v9 - a2 > (double)v8;
LABEL_16:

    goto LABEL_17;
  }
  return v2;
}

- (uint64_t)recencyTestForAboveThresholdTopHitWithCurrentTime:(_QWORD *)a1
{
  _BOOL8 v2;
  uint64_t v4;
  void *v6;
  void *v7;
  float v8;
  uint64_t v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  double v14;
  unint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  float v23;
  uint64_t v24;
  void *v25;
  void *v26;
  unint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;

  v2 = (_BOOL8)a1;
  if (!a1)
    return v2;
  v4 = a1[48];
  if ((v4 & 0x200) != 0)
  {
    objc_msgSend(a1, "interestingDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v2, "L2FeatureVector");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "scoreForFeature:", 1881);
    v9 = (uint64_t)v8;

    if (v9 < 51)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 9.0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v9 < 6)
        v12 = 2;
      else
        v12 = 1;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 9.0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      v12 = 0;
    }
    v18 = +[SSRankingManager getRecencyIntervalForBundleType:intervalType:indexRequired:]((uint64_t)SSRankingManager, v11, 0, v12);

    v14 = (double)v18;
    goto LABEL_15;
  }
  if ((v4 & 8) != 0)
  {
    objc_msgSend(a1, "interestingDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 3.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (double)+[SSRankingManager getRecencyIntervalForBundleType:intervalType:indexRequired:]((uint64_t)SSRankingManager, v13, 0, 0xFFFFFFFFFFFFFFFFLL);

LABEL_15:
    objc_msgSend(v6, "timeIntervalSinceReferenceDate");
    v2 = v19 - a2 > v14;

    return v2;
  }
  if ((v4 & 0x800) != 0)
  {
    objc_msgSend(a1, "interestingDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = sIsiPad == 0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 11.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = +[SSRankingManager getRecencyIntervalForBundleType:intervalType:indexRequired:]((uint64_t)SSRankingManager, v16, 0, v15);

    v14 = (double)v17;
    goto LABEL_15;
  }
  if ((v4 & 0x100) == 0)
    return -[PRSRankingItem recencyTestForVisibilityWithCurrentTime:](v2, a2);
  objc_msgSend(a1, "mostRecentUsedDate");
  v21 = v20;
  objc_msgSend((id)v2, "L2FeatureVector");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "scoreForFeature:", 326);
  v24 = (uint64_t)v23;

  if (v24 <= 10)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 8.0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    v27 = v24 < 2 ? 2 : 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 8.0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    v27 = 0;
  }
  v28 = +[SSRankingManager getRecencyIntervalForBundleType:intervalType:indexRequired:]((uint64_t)SSRankingManager, v26, 0, v27);

  if (v21 - a2 <= (double)v28)
  {
    objc_msgSend((id)v2, "interestingDate", (double)v28, v21 - a2);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 8.0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (double)+[SSRankingManager getRecencyIntervalForBundleType:intervalType:indexRequired:]((uint64_t)SSRankingManager, v30, 0, 3uLL);

    objc_msgSend(v29, "timeIntervalSinceReferenceDate");
    v33 = v32 - a2;

    if (v33 <= v31)
      return -[PRSRankingItem recencyTestForVisibilityWithCurrentTime:](v2, a2);
  }
  return 1;
}

- (void)setSuggestionBundleIDType
{
  self->_bundleIDType |= 0x80000uLL;
}

- (BOOL)isInSectionWithRankCategory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  NSString *sectionBundleIdentifier;
  char IsSyndicatedPhotos;
  int v10;
  void *v11;
  unint64_t v12;
  void *v13;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    if ((objc_msgSend(v4, "hasPrefix:", CFSTR("__bundle_id__")) & 1) != 0)
    {
      objc_msgSend(v5, "substringFromIndex:", objc_msgSend(CFSTR("__bundle_id__"), "length"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.mobileslideshow"));
      sectionBundleIdentifier = self->_sectionBundleIdentifier;
      if (v7)
        IsSyndicatedPhotos = SSSectionIsSyndicatedPhotos(sectionBundleIdentifier);
      else
        IsSyndicatedPhotos = -[NSString isEqualToString:](sectionBundleIdentifier, "isEqualToString:", v6);
      LOBYTE(v10) = IsSyndicatedPhotos;
      v5 = v6;
    }
    else if (-[NSString isEqualToString:](self->_contentType, "isEqualToString:", v5))
    {
      LOBYTE(v10) = 1;
    }
    else
    {
      SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x1BuLL);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v11, "count"))
      {
        v12 = 0;
        do
        {
          objc_msgSend(v11, "objectAtIndex:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v13, "isEqualToString:", v5);

          if (v10)
            break;
          ++v12;
        }
        while (v12 < objc_msgSend(v11, "count"));
      }
      else
      {
        LOBYTE(v10) = 0;
      }

    }
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (id)rankingFeedbackBundleID
{
  NSString *p_isa;
  __CFString *v4;
  unint64_t bundleIDType;
  __CFString **v6;
  __CFString *v7;

  p_isa = self->_sectionBundleIdentifier;
  if (-[NSString isEqualToString:](p_isa, "isEqualToString:", CFSTR("com.apple.DocumentsApp")))
  {
    v4 = CFSTR("com.apple.CloudDocs.MobileDocumentsFileProvider");

    p_isa = &v4->isa;
  }
  if (-[NSString hasPrefix:](p_isa, "hasPrefix:", CFSTR("com.apple.searchd.syndicated"))
    && !-[NSString isEqualToString:](p_isa, "isEqualToString:", CFSTR("com.apple.searchd.syndicatedLinks")))
  {
    bundleIDType = self->_bundleIDType;
    if ((bundleIDType & 0x40000) != 0)
      goto LABEL_10;
    if ((bundleIDType & 0x4000000) != 0)
    {
      v6 = PRSRankingMessagesBundleString;
      goto LABEL_14;
    }
    if ((bundleIDType & 0x8000000) != 0)
    {
      v6 = PRSRankingNotesBundleString;
      goto LABEL_14;
    }
    if ((bundleIDType & 0x10000000) != 0)
    {
      v6 = PRSRankingFilesBundleString;
      goto LABEL_14;
    }
    if ((bundleIDType & 0x2000000) != 0)
    {
LABEL_10:
      v6 = PRSRankingPhotosAppBundleString;
LABEL_14:
      v7 = *v6;

      p_isa = &v7->isa;
    }
  }
  return p_isa;
}

- (BOOL)isTopHit
{
  return BYTE1(self->_bundleIDType) >> 7;
}

- (unint64_t)attrType:(id)a3 seenAuthorEmail:(BOOL)a4 seenPrimaryRecipientEmail:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v7;
  unint64_t v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CA6158]) & 1) != 0)
  {
    v8 = 2;
    goto LABEL_44;
  }
  if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CA6968]) & 1) != 0)
  {
    v8 = 0x200000000;
    goto LABEL_44;
  }
  if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CA68D8]) & 1) != 0)
  {
    v8 = 4;
    goto LABEL_44;
  }
  if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CA6048]) & 1) != 0)
  {
    v8 = 8;
    goto LABEL_44;
  }
  if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CA5FF0]) & 1) != 0)
  {
    v8 = 16;
    goto LABEL_44;
  }
  if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CA67D8]) & 1) != 0)
  {
    v8 = 32;
    goto LABEL_44;
  }
  if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CA5F80]) & 1) != 0)
  {
    v8 = 64;
    goto LABEL_44;
  }
  if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CA64A0]) & 1) != 0)
  {
    v8 = 0x100000;
    goto LABEL_44;
  }
  if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CA5F90]) & 1) != 0)
  {
    v8 = 128;
    goto LABEL_44;
  }
  if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CA60F0]) & 1) != 0)
  {
    v8 = 0x100000000;
    goto LABEL_44;
  }
  if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CA6150]) & 1) != 0)
  {
    v8 = 0x1000000000;
    goto LABEL_44;
  }
  if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CA64D0]) & 1) != 0)
  {
    v8 = 256;
    goto LABEL_44;
  }
  if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CA6428]) & 1) != 0)
  {
    v8 = 0x200000;
    goto LABEL_44;
  }
  if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CA60A8]) & 1) != 0)
  {
    v8 = 1024;
    goto LABEL_44;
  }
  if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CA63C0]) & 1) != 0)
  {
    v8 = 2048;
    goto LABEL_44;
  }
  if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CA6330]) & 1) != 0)
  {
    v8 = 4096;
    goto LABEL_44;
  }
  if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CA6498]) & 1) != 0)
  {
    v8 = 0x2000;
    goto LABEL_44;
  }
  if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CA5FF8]) & 1) != 0)
  {
    v8 = 0x4000;
    goto LABEL_44;
  }
  if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CA6030]))
  {
    v9 = !v6;
    v10 = 0x8000;
    v11 = 0x10000;
    goto LABEL_41;
  }
  if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CA66F8]))
  {
    v9 = !v5;
    v10 = 0x20000;
    v11 = 0x40000;
LABEL_41:
    if (v9)
      v8 = v10;
    else
      v8 = v11;
    goto LABEL_44;
  }
  if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CA6618]) & 1) != 0)
    goto LABEL_46;
  if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CA6588]) & 1) != 0)
  {
    v8 = 0x4000000;
    goto LABEL_44;
  }
  if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CA6580]) & 1) != 0)
  {
    v8 = 0x800000;
    goto LABEL_44;
  }
  if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CA6610]) & 1) != 0)
  {
LABEL_46:
    v8 = 0x400000000;
  }
  else if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CA65B0]) & 1) != 0)
  {
    v8 = 0x8000000;
  }
  else if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CA65A8]) & 1) != 0)
  {
    v8 = 0x1000000;
  }
  else if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CA65B8]) & 1) != 0)
  {
    v8 = 0x10000000;
  }
  else if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CA6630]) & 1) != 0)
  {
    v8 = 0x800000000;
  }
  else if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CA6678]) & 1) != 0)
  {
    v8 = 0x2000000;
  }
  else if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CA6688]) & 1) != 0)
  {
    v8 = 0x80000;
  }
  else if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CA66A8]) & 1) != 0)
  {
    v8 = 0x40000000;
  }
  else if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CA65D0]) & 1) != 0)
  {
    v8 = 0x80000000;
  }
  else if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CA65F8]) & 1) != 0)
  {
    v8 = 0x20000000;
  }
  else if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CA65D8]) & 1) != 0)
  {
    v8 = 0x2000000000;
  }
  else if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CA65E8]) & 1) != 0)
  {
    v8 = 0x200000000000;
  }
  else if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CA66B0]) & 1) != 0)
  {
    v8 = 0x4000000000;
  }
  else if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CA6598]) & 1) != 0)
  {
    v8 = 0x8000000000;
  }
  else
  {
    v13 = *MEMORY[0x1E0CA5F40];
    if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CA5F40]) & 1) != 0)
    {
      v8 = 0x10000000000;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", v13) & 1) != 0)
    {
      v8 = 0x20000000000;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CA6320]) & 1) != 0)
    {
      v8 = 0x40000000000;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CA6188]) & 1) != 0)
    {
      v8 = 0x80000000000;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CA6170]) & 1) != 0)
    {
      v8 = 0x100000000000;
    }
    else if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CA69E0]))
    {
      v8 = 512;
    }
    else
    {
      v8 = 0;
    }
  }
LABEL_44:

  return v8;
}

- (void)updateAttrCountsPrefix:(unsigned __int16 *)a3 queryTermCount:(unint64_t)a4 attrType:(unint64_t)a5
{
  unint64_t *attrCountsPrefix;
  int64_t queryTermCount;
  int64_t *p_queryTermCount;
  uint64_t v12;

  if (!a4 || !a5)
    return;
  attrCountsPrefix = self->_attrCountsPrefix;
  if (attrCountsPrefix)
  {
    queryTermCount = self->_queryTermCount;
  }
  else
  {
    attrCountsPrefix = (unint64_t *)malloc_type_calloc(a4, 8uLL, 0x100004000313F17uLL);
    self->_attrCountsPrefix = attrCountsPrefix;
    queryTermCount = self->_queryTermCount;
    if (queryTermCount < 0)
    {
      p_queryTermCount = &self->_queryTermCount;
      goto LABEL_11;
    }
  }
  if (queryTermCount == a4)
    goto LABEL_12;
  p_queryTermCount = &self->_queryTermCount;
  if (attrCountsPrefix)
    free(attrCountsPrefix);
  self->_attrCountsPrefix = (unint64_t *)malloc_type_calloc(a4, 8uLL, 0x100004000313F17uLL);
LABEL_11:
  *p_queryTermCount = a4;
LABEL_12:
  if (a3)
  {
    v12 = 0;
    do
    {
      if (a3[v12])
        self->_attrCountsPrefix[v12] |= a5;
      ++v12;
    }
    while (a4 != v12);
  }
}

- (void)updateAttrCountsWord:(unsigned __int16 *)a3 queryTermCount:(unint64_t)a4 attrType:(unint64_t)a5
{
  unint64_t *attrCountsWord;
  int64_t queryTermCount;
  int64_t *p_queryTermCount;
  uint64_t v12;

  if (!a4 || !a5)
    return;
  attrCountsWord = self->_attrCountsWord;
  if (attrCountsWord)
  {
    queryTermCount = self->_queryTermCount;
  }
  else
  {
    attrCountsWord = (unint64_t *)malloc_type_calloc(a4, 8uLL, 0x100004000313F17uLL);
    self->_attrCountsWord = attrCountsWord;
    queryTermCount = self->_queryTermCount;
    if (queryTermCount < 0)
    {
      p_queryTermCount = &self->_queryTermCount;
      goto LABEL_11;
    }
  }
  if (queryTermCount == a4)
    goto LABEL_12;
  p_queryTermCount = &self->_queryTermCount;
  if (attrCountsWord)
    free(attrCountsWord);
  self->_attrCountsWord = (unint64_t *)malloc_type_calloc(a4, 8uLL, 0x100004000313F17uLL);
LABEL_11:
  *p_queryTermCount = a4;
LABEL_12:
  if (a3)
  {
    v12 = 0;
    do
    {
      if (a3[v12])
        self->_attrCountsWord[v12] |= a5;
      ++v12;
    }
    while (a4 != v12);
  }
}

- (void)updateAttrCountsPrefixLast:(unsigned __int16 *)a3 termsDidMatchPrefix:(unsigned __int16 *)a4 queryTermCount:(unint64_t)a5 attrType:(unint64_t)a6
{
  unint64_t *attrCountsPrefixLast;
  int64_t queryTermCount;
  int64_t *p_queryTermCount;
  uint64_t v14;

  if (!a5 || !a6)
    return;
  attrCountsPrefixLast = self->_attrCountsPrefixLast;
  if (attrCountsPrefixLast)
  {
    queryTermCount = self->_queryTermCount;
  }
  else
  {
    attrCountsPrefixLast = (unint64_t *)malloc_type_calloc(a5, 8uLL, 0x100004000313F17uLL);
    self->_attrCountsPrefixLast = attrCountsPrefixLast;
    queryTermCount = self->_queryTermCount;
    if (queryTermCount < 0)
    {
      p_queryTermCount = &self->_queryTermCount;
LABEL_11:
      *p_queryTermCount = a5;
      goto LABEL_12;
    }
  }
  if (queryTermCount != a5)
  {
    p_queryTermCount = &self->_queryTermCount;
    if (attrCountsPrefixLast)
      free(attrCountsPrefixLast);
    self->_attrCountsPrefixLast = (unint64_t *)malloc_type_calloc(a5, 8uLL, 0x100004000313F17uLL);
    goto LABEL_11;
  }
LABEL_12:
  if (a3)
  {
    v14 = 0;
    do
    {
      if (a3[v14])
        self->_attrCountsPrefixLast[v14] |= a6;
      ++v14;
    }
    while (a5 != v14);
  }
  if (a4)
  {
    if (a4[a5 - 1])
      self->_attrCountsPrefixLast[a5 - 1] |= a6;
  }
}

- (void)updateAttrCountsPrefix2:(unsigned __int16 *)a3 queryTermCount:(unint64_t)a4 attrType:(unint64_t)a5
{
  unint64_t *attrCountsPrefix2;
  int64_t queryTermCount;
  int64_t *p_queryTermCount;
  uint64_t v12;

  if (a4 < 2 || !a5)
    return;
  attrCountsPrefix2 = self->_attrCountsPrefix2;
  if (attrCountsPrefix2)
  {
    queryTermCount = self->_queryTermCount;
  }
  else
  {
    attrCountsPrefix2 = (unint64_t *)malloc_type_calloc(a4, 8uLL, 0x100004000313F17uLL);
    self->_attrCountsPrefix2 = attrCountsPrefix2;
    queryTermCount = self->_queryTermCount;
    if (queryTermCount < 0)
    {
      p_queryTermCount = &self->_queryTermCount;
      goto LABEL_11;
    }
  }
  if (queryTermCount == a4)
    goto LABEL_12;
  p_queryTermCount = &self->_queryTermCount;
  if (attrCountsPrefix2)
    free(attrCountsPrefix2);
  self->_attrCountsPrefix2 = (unint64_t *)malloc_type_calloc(a4, 8uLL, 0x100004000313F17uLL);
LABEL_11:
  *p_queryTermCount = a4;
LABEL_12:
  if (a3)
  {
    v12 = 0;
    do
    {
      if (v12 && a3[v12 - 1])
      {
        if (a3[v12])
          self->_attrCountsPrefix2[v12 - 1] |= a5;
      }
      ++v12;
    }
    while (a4 != v12);
  }
}

- (void)updateAttrCountsWord2:(unsigned __int16 *)a3 queryTermCount:(unint64_t)a4 attrType:(unint64_t)a5
{
  unint64_t *attrCountsWord2;
  int64_t queryTermCount;
  int64_t *p_queryTermCount;
  uint64_t v12;

  if (a4 < 2 || !a5)
    return;
  attrCountsWord2 = self->_attrCountsWord2;
  if (attrCountsWord2)
  {
    queryTermCount = self->_queryTermCount;
  }
  else
  {
    attrCountsWord2 = (unint64_t *)malloc_type_calloc(a4, 8uLL, 0x100004000313F17uLL);
    self->_attrCountsWord2 = attrCountsWord2;
    queryTermCount = self->_queryTermCount;
    if (queryTermCount < 0)
    {
      p_queryTermCount = &self->_queryTermCount;
      goto LABEL_11;
    }
  }
  if (queryTermCount == a4)
    goto LABEL_12;
  p_queryTermCount = &self->_queryTermCount;
  if (attrCountsWord2)
    free(attrCountsWord2);
  self->_attrCountsWord2 = (unint64_t *)malloc_type_calloc(a4, 8uLL, 0x100004000313F17uLL);
LABEL_11:
  *p_queryTermCount = a4;
LABEL_12:
  if (a3)
  {
    v12 = 0;
    do
    {
      if (v12 && a3[v12 - 1])
      {
        if (a3[v12])
          self->_attrCountsWord2[v12 - 1] |= a5;
      }
      ++v12;
    }
    while (a4 != v12);
  }
}

- (void)updateAttrCountsPrefixLast2:(unsigned __int16 *)a3 termsDidMatchPrefix:(unsigned __int16 *)a4 queryTermCount:(unint64_t)a5 attrType:(unint64_t)a6
{
  unint64_t v6;
  unint64_t *attrCountsPrefixLast2;
  int64_t queryTermCount;
  int64_t *p_queryTermCount;
  uint64_t v15;

  v6 = a5 - 2;
  if (a5 < 2 || !a6)
    return;
  attrCountsPrefixLast2 = self->_attrCountsPrefixLast2;
  if (attrCountsPrefixLast2)
  {
    queryTermCount = self->_queryTermCount;
  }
  else
  {
    attrCountsPrefixLast2 = (unint64_t *)malloc_type_calloc(a5, 8uLL, 0x100004000313F17uLL);
    self->_attrCountsPrefixLast2 = attrCountsPrefixLast2;
    queryTermCount = self->_queryTermCount;
    if (queryTermCount < 0)
    {
      p_queryTermCount = &self->_queryTermCount;
LABEL_11:
      *p_queryTermCount = a5;
      goto LABEL_12;
    }
  }
  if (queryTermCount != a5)
  {
    p_queryTermCount = &self->_queryTermCount;
    if (attrCountsPrefixLast2)
      free(attrCountsPrefixLast2);
    self->_attrCountsPrefixLast2 = (unint64_t *)malloc_type_calloc(a5, 8uLL, 0x100004000313F17uLL);
    goto LABEL_11;
  }
LABEL_12:
  if (a3)
  {
    v15 = 0;
    do
    {
      if (v15 && a3[v15] && a3[v15 - 1])
        self->_attrCountsPrefixLast2[v15 - 1] |= a6;
      ++v15;
    }
    while (a5 != v15);
  }
  if (a4 && a4[a5 - 1])
  {
    if (a3[v6])
      self->_attrCountsPrefixLast2[v6] |= a6;
  }
}

- (void)updateAttrCountsPrefix3:(unsigned __int16 *)a3 queryTermCount:(unint64_t)a4 attrType:(unint64_t)a5
{
  unint64_t *attrCountsPrefix3;
  int64_t queryTermCount;
  int64_t *p_queryTermCount;
  unint64_t v12;
  unsigned __int16 *v13;

  if (a4 < 3 || !a5)
    return;
  attrCountsPrefix3 = self->_attrCountsPrefix3;
  if (attrCountsPrefix3)
  {
    queryTermCount = self->_queryTermCount;
  }
  else
  {
    attrCountsPrefix3 = (unint64_t *)malloc_type_calloc(a4, 8uLL, 0x100004000313F17uLL);
    self->_attrCountsPrefix3 = attrCountsPrefix3;
    queryTermCount = self->_queryTermCount;
    if (queryTermCount < 0)
    {
      p_queryTermCount = &self->_queryTermCount;
      goto LABEL_11;
    }
  }
  if (queryTermCount == a4)
    goto LABEL_12;
  p_queryTermCount = &self->_queryTermCount;
  if (attrCountsPrefix3)
    free(attrCountsPrefix3);
  self->_attrCountsPrefix3 = (unint64_t *)malloc_type_calloc(a4, 8uLL, 0x100004000313F17uLL);
LABEL_11:
  *p_queryTermCount = a4;
LABEL_12:
  if (a3)
  {
    v12 = 0;
    do
    {
      if (v12 >= 2)
      {
        v13 = &a3[v12];
        if (*(v13 - 2))
        {
          if (*(v13 - 1))
          {
            if (a3[v12])
              self->_attrCountsPrefix3[v12 - 2] |= a5;
          }
        }
      }
      ++v12;
    }
    while (a4 != v12);
  }
}

- (void)updateAttrCountsWord3:(unsigned __int16 *)a3 queryTermCount:(unint64_t)a4 attrType:(unint64_t)a5
{
  unint64_t *attrCountsWord3;
  int64_t queryTermCount;
  int64_t *p_queryTermCount;
  unint64_t v12;
  unsigned __int16 *v13;

  if (a4 < 3 || !a5)
    return;
  attrCountsWord3 = self->_attrCountsWord3;
  if (attrCountsWord3)
  {
    queryTermCount = self->_queryTermCount;
  }
  else
  {
    attrCountsWord3 = (unint64_t *)malloc_type_calloc(a4, 8uLL, 0x100004000313F17uLL);
    self->_attrCountsWord3 = attrCountsWord3;
    queryTermCount = self->_queryTermCount;
    if (queryTermCount < 0)
    {
      p_queryTermCount = &self->_queryTermCount;
      goto LABEL_11;
    }
  }
  if (queryTermCount == a4)
    goto LABEL_12;
  p_queryTermCount = &self->_queryTermCount;
  if (attrCountsWord3)
    free(attrCountsWord3);
  self->_attrCountsWord3 = (unint64_t *)malloc_type_calloc(a4, 8uLL, 0x100004000313F17uLL);
LABEL_11:
  *p_queryTermCount = a4;
LABEL_12:
  if (a3)
  {
    v12 = 0;
    do
    {
      if (v12 >= 2)
      {
        v13 = &a3[v12];
        if (*(v13 - 2))
        {
          if (*(v13 - 1))
          {
            if (a3[v12])
              self->_attrCountsWord3[v12 - 2] |= a5;
          }
        }
      }
      ++v12;
    }
    while (a4 != v12);
  }
}

- (void)updateAttrCountsPrefixLast3:(unsigned __int16 *)a3 termsDidMatchPrefix:(unsigned __int16 *)a4 queryTermCount:(unint64_t)a5 attrType:(unint64_t)a6
{
  unint64_t v6;
  unint64_t *attrCountsPrefixLast3;
  int64_t queryTermCount;
  int64_t *p_queryTermCount;
  unint64_t v15;
  unsigned __int16 *v16;

  v6 = a5 - 3;
  if (a5 < 3 || !a6)
    return;
  attrCountsPrefixLast3 = self->_attrCountsPrefixLast3;
  if (attrCountsPrefixLast3)
  {
    queryTermCount = self->_queryTermCount;
  }
  else
  {
    attrCountsPrefixLast3 = (unint64_t *)malloc_type_calloc(a5, 8uLL, 0x100004000313F17uLL);
    self->_attrCountsPrefixLast3 = attrCountsPrefixLast3;
    queryTermCount = self->_queryTermCount;
    if (queryTermCount < 0)
    {
      p_queryTermCount = &self->_queryTermCount;
LABEL_11:
      *p_queryTermCount = a5;
      goto LABEL_12;
    }
  }
  if (queryTermCount != a5)
  {
    p_queryTermCount = &self->_queryTermCount;
    if (attrCountsPrefixLast3)
      free(attrCountsPrefixLast3);
    self->_attrCountsPrefixLast3 = (unint64_t *)malloc_type_calloc(a5, 8uLL, 0x100004000313F17uLL);
    goto LABEL_11;
  }
LABEL_12:
  if (a3)
  {
    v15 = 0;
    do
    {
      if (v15 >= 2)
      {
        if (a3[v15])
        {
          v16 = &a3[v15];
          if (*(v16 - 2))
          {
            if (*(v16 - 1))
              self->_attrCountsPrefixLast3[v15 - 2] |= a6;
          }
        }
      }
      ++v15;
    }
    while (a5 != v15);
  }
  if (a4 && a4[a5 - 1] && a3[v6])
  {
    if (a3[a5 - 2])
      self->_attrCountsPrefixLast3[v6] |= a6;
  }
}

- (unint64_t)attrCountWord:(unint64_t)a3
{
  unint64_t *attrCountsWord;

  attrCountsWord = self->_attrCountsWord;
  if (attrCountsWord && self->_queryTermCount > (int64_t)a3)
    return attrCountsWord[a3];
  else
    return 0;
}

- (unint64_t)attrCountPrefix:(unint64_t)a3
{
  unint64_t *attrCountsPrefix;

  attrCountsPrefix = self->_attrCountsPrefix;
  if (attrCountsPrefix && self->_queryTermCount > (int64_t)a3)
    return attrCountsPrefix[a3];
  else
    return 0;
}

- (unint64_t)attrCountPrefixLast:(unint64_t)a3
{
  unint64_t *attrCountsPrefixLast;

  attrCountsPrefixLast = self->_attrCountsPrefixLast;
  if (attrCountsPrefixLast && self->_queryTermCount > (int64_t)a3)
    return attrCountsPrefixLast[a3];
  else
    return 0;
}

- (unint64_t)attrCountWord2:(unint64_t)a3
{
  unint64_t *attrCountsWord2;

  attrCountsWord2 = self->_attrCountsWord2;
  if (attrCountsWord2 && self->_queryTermCount > (int64_t)a3)
    return attrCountsWord2[a3];
  else
    return 0;
}

- (unint64_t)attrCountPrefix2:(unint64_t)a3
{
  unint64_t *attrCountsPrefix2;

  attrCountsPrefix2 = self->_attrCountsPrefix2;
  if (attrCountsPrefix2 && self->_queryTermCount > (int64_t)a3)
    return attrCountsPrefix2[a3];
  else
    return 0;
}

- (unint64_t)attrCountPrefixLast2:(unint64_t)a3
{
  unint64_t *attrCountsPrefixLast2;

  attrCountsPrefixLast2 = self->_attrCountsPrefixLast2;
  if (attrCountsPrefixLast2 && self->_queryTermCount > (int64_t)a3)
    return attrCountsPrefixLast2[a3];
  else
    return 0;
}

- (unint64_t)attrCountWord3:(unint64_t)a3
{
  unint64_t *attrCountsWord3;

  attrCountsWord3 = self->_attrCountsWord3;
  if (attrCountsWord3 && self->_queryTermCount > (int64_t)a3)
    return attrCountsWord3[a3];
  else
    return 0;
}

- (unint64_t)attrCountPrefix3:(unint64_t)a3
{
  unint64_t *attrCountsPrefix3;

  attrCountsPrefix3 = self->_attrCountsPrefix3;
  if (attrCountsPrefix3 && self->_queryTermCount > (int64_t)a3)
    return attrCountsPrefix3[a3];
  else
    return 0;
}

- (unint64_t)attrCountPrefixLast3:(unint64_t)a3
{
  unint64_t *attrCountsPrefixLast3;

  attrCountsPrefixLast3 = self->_attrCountsPrefixLast3;
  if (attrCountsPrefixLast3 && self->_queryTermCount > (int64_t)a3)
    return attrCountsPrefixLast3[a3];
  else
    return 0;
}

- (uint64_t)attrCountWord:(uint64_t)a3 queryTermCount:
{
  uint64_t result;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v8;

  result = 0;
  if (a1 && a2)
  {
    v5 = *(uint64_t **)(a1 + 424);
    if (!v5)
      return 0;
    v6 = *(_QWORD *)(a1 + 408);
    if (v6 <= 0 || v6 >= a3)
      v6 = a3;
    if (v6)
    {
      result = 0;
      do
      {
        v8 = *v5++;
        if ((v8 & a2) != 0)
          ++result;
        --v6;
      }
      while (v6);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (uint64_t)attrCountPrefix:(uint64_t)a3 queryTermCount:
{
  uint64_t result;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v8;

  result = 0;
  if (a1 && a2)
  {
    v5 = *(uint64_t **)(a1 + 416);
    if (!v5)
      return 0;
    v6 = *(_QWORD *)(a1 + 408);
    if (v6 <= 0 || v6 >= a3)
      v6 = a3;
    if (v6)
    {
      result = 0;
      do
      {
        v8 = *v5++;
        if ((v8 & a2) != 0)
          ++result;
        --v6;
      }
      while (v6);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (uint64_t)attrCountPrefixLast:(uint64_t)a3 queryTermCount:
{
  uint64_t result;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v8;

  result = 0;
  if (a1 && a2)
  {
    v5 = *(uint64_t **)(a1 + 432);
    if (!v5)
      return 0;
    v6 = *(_QWORD *)(a1 + 408);
    if (v6 <= 0 || v6 >= a3)
      v6 = a3;
    if (v6)
    {
      result = 0;
      do
      {
        v8 = *v5++;
        if ((v8 & a2) != 0)
          ++result;
        --v6;
      }
      while (v6);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (void)setBundleIDType:(unint64_t)a3
{
  self->_bundleIDType = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (float)rawScore
{
  return self->_rawScore;
}

- (void)setRawScore:(float)a3
{
  self->_rawScore = a3;
}

- (float)feedbackScore
{
  return self->_feedbackScore;
}

- (void)setFeedbackScore:(float)a3
{
  self->_feedbackScore = a3;
}

- (float)score
{
  return self->_score;
}

- (void)setScore:(float)a3
{
  self->_score = a3;
}

- (float)withinBundleScore
{
  return self->_withinBundleScore;
}

- (void)setWithinBundleScore:(float)a3
{
  self->_withinBundleScore = a3;
}

- (double)suggestionScore
{
  return self->_suggestionScore;
}

- (void)setSuggestionScore:(double)a3
{
  self->_suggestionScore = a3;
}

- (double)engagementScore
{
  return self->_engagementScore;
}

- (void)setEngagementScore:(double)a3
{
  self->_engagementScore = a3;
}

- (double)topicalityScore
{
  return self->_topicalityScore;
}

- (void)setTopicalityScore:(double)a3
{
  self->_topicalityScore = a3;
}

- (double)freshnessScore
{
  return self->_freshnessScore;
}

- (void)setFreshnessScore:(double)a3
{
  self->_freshnessScore = a3;
}

- (double)likelihood
{
  return self->_likelihood;
}

- (void)setLikelihood:(double)a3
{
  self->_likelihood = a3;
}

- (double)finalTopicality
{
  return self->_finalTopicality;
}

- (void)setFinalTopicality:(double)a3
{
  self->_finalTopicality = a3;
}

- (float)keywordMatchScore
{
  return self->_keywordMatchScore;
}

- (void)setKeywordMatchScore:(float)a3
{
  self->_keywordMatchScore = a3;
}

- (BOOL)exactMatchedLaunchString
{
  return self->_exactMatchedLaunchString;
}

- (void)setExactMatchedLaunchString:(BOOL)a3
{
  self->_exactMatchedLaunchString = a3;
}

- (NSArray)recentSimilarIntentEngagementDates
{
  return self->_recentSimilarIntentEngagementDates;
}

- (void)setRecentSimilarIntentEngagementDates:(id)a3
{
  objc_storeStrong((id *)&self->_recentSimilarIntentEngagementDates, a3);
}

- (double)mostRecentUseInMinutes
{
  return self->_mostRecentUseInMinutes;
}

- (void)setMostRecentUseInMinutes:(double)a3
{
  self->_mostRecentUseInMinutes = a3;
}

- (NSString)sectionBundleIdentifier
{
  return self->_sectionBundleIdentifier;
}

- (void)setSectionBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_sectionBundleIdentifier, a3);
}

- (NSString)firstMatchedAltName
{
  return self->_firstMatchedAltName;
}

- (void)setFirstMatchedAltName:(id)a3
{
  objc_storeStrong((id *)&self->_firstMatchedAltName, a3);
}

- (NSString)exactMatchedKeyword
{
  return self->_exactMatchedKeyword;
}

- (void)setExactMatchedKeyword:(id)a3
{
  objc_storeStrong((id *)&self->_exactMatchedKeyword, a3);
}

- (NSString)displayNameInitials
{
  return self->_displayNameInitials;
}

- (void)setDisplayNameInitials:(id)a3
{
  objc_storeStrong((id *)&self->_displayNameInitials, a3);
}

- (PRSL2FeatureVector)L2FeatureVector
{
  return self->_L2FeatureVector;
}

- (void)setL2FeatureVector:(id)a3
{
  objc_storeStrong((id *)&self->_L2FeatureVector, a3);
}

- (NSData)serverFeaturesJSON
{
  return self->_serverFeaturesJSON;
}

- (void)setServerFeaturesJSON:(id)a3
{
  objc_storeStrong((id *)&self->_serverFeaturesJSON, a3);
}

- (NSData)serverSuggestionsData
{
  return self->_serverSuggestionsData;
}

- (void)setServerSuggestionsData:(id)a3
{
  objc_storeStrong((id *)&self->_serverSuggestionsData, a3);
}

- (NSData)localSuggestionsData
{
  return self->_localSuggestionsData;
}

- (void)setLocalSuggestionsData:(id)a3
{
  objc_storeStrong((id *)&self->_localSuggestionsData, a3);
}

- (BOOL)eligibleForDemotion
{
  return self->_eligibleForDemotion;
}

- (void)setEligibleForDemotion:(BOOL)a3
{
  self->_eligibleForDemotion = a3;
}

- (BOOL)shouldHideUnderShowMore
{
  return self->_shouldHideUnderShowMore;
}

- (void)setShouldHideUnderShowMore:(BOOL)a3
{
  self->_shouldHideUnderShowMore = a3;
}

- (BOOL)shouldHideUnderShowMoreIfNotTophit
{
  return self->_shouldHideUnderShowMoreIfNotTophit;
}

- (void)setShouldHideUnderShowMoreIfNotTophit:(BOOL)a3
{
  self->_shouldHideUnderShowMoreIfNotTophit = a3;
}

- (BOOL)recentForTopHit
{
  return self->_recentForTopHit;
}

- (void)setRecentForTopHit:(BOOL)a3
{
  self->_recentForTopHit = a3;
}

- (BOOL)recentForAboveThresholdTopHit
{
  return self->_recentForAboveThresholdTopHit;
}

- (void)setRecentForAboveThresholdTopHit:(BOOL)a3
{
  self->_recentForAboveThresholdTopHit = a3;
}

- (BOOL)matchedQueryTerms
{
  return self->_matchedQueryTerms;
}

- (void)setMatchedQueryTerms:(BOOL)a3
{
  self->_matchedQueryTerms = a3;
}

- (BOOL)hasPolicyMultipleTermsPhraseMatch
{
  return self->_hasPolicyMultipleTermsPhraseMatch;
}

- (void)setHasPolicyMultipleTermsPhraseMatch:(BOOL)a3
{
  self->_hasPolicyMultipleTermsPhraseMatch = a3;
}

- (BOOL)hasPolicySingleTermPhraseMatch
{
  return self->_hasPolicySingleTermPhraseMatch;
}

- (void)setHasPolicySingleTermPhraseMatch:(BOOL)a3
{
  self->_hasPolicySingleTermPhraseMatch = a3;
}

- (BOOL)hasPolicyMultipleTermsNearMatch
{
  return self->_hasPolicyMultipleTermsNearMatch;
}

- (void)setHasPolicyMultipleTermsNearMatch:(BOOL)a3
{
  self->_hasPolicyMultipleTermsNearMatch = a3;
}

- (BOOL)isSafariTopHit
{
  return self->_isSafariTopHit;
}

- (void)setIsSafariTopHit:(BOOL)a3
{
  self->_isSafariTopHit = a3;
}

- (BOOL)isBundleDemotedForBullseyeCommittedSearch
{
  return self->_isBundleDemotedForBullseyeCommittedSearch;
}

- (void)setIsBundleDemotedForBullseyeCommittedSearch:(BOOL)a3
{
  self->_isBundleDemotedForBullseyeCommittedSearch = a3;
}

- (BOOL)hasShortCut
{
  return self->_hasShortCut;
}

- (void)setHasShortCut:(BOOL)a3
{
  self->_hasShortCut = a3;
}

- (BOOL)wasEngaged
{
  return self->_wasEngaged;
}

- (void)setWasEngaged:(BOOL)a3
{
  self->_wasEngaged = a3;
}

- (BOOL)wasEngagedInSpotlight
{
  return self->_wasEngagedInSpotlight;
}

- (void)setWasEngagedInSpotlight:(BOOL)a3
{
  self->_wasEngagedInSpotlight = a3;
}

- (BOOL)isLocalTopHitCandidate
{
  return self->_isLocalTopHitCandidate;
}

- (void)setIsLocalTopHitCandidate:(BOOL)a3
{
  self->_isLocalTopHitCandidate = a3;
}

- (BOOL)displayNameInitialsPrefixMatchOnly
{
  return self->_displayNameInitialsPrefixMatchOnly;
}

- (void)setDisplayNameInitialsPrefixMatchOnly:(BOOL)a3
{
  self->_displayNameInitialsPrefixMatchOnly = a3;
}

- (BOOL)displayNameInitialsFirstWordAndMoreMatchOnly
{
  return self->_displayNameInitialsFirstWordAndMoreMatchOnly;
}

- (void)setDisplayNameInitialsFirstWordAndMoreMatchOnly:(BOOL)a3
{
  self->_displayNameInitialsFirstWordAndMoreMatchOnly = a3;
}

- (BOOL)vendorNameIsDisplayNamePrefix
{
  return self->_vendorNameIsDisplayNamePrefix;
}

- (void)setVendorNameIsDisplayNamePrefix:(BOOL)a3
{
  self->_vendorNameIsDisplayNamePrefix = a3;
}

- (BOOL)isNotExecutable
{
  return self->_isNotExecutable;
}

- (void)setIsNotExecutable:(BOOL)a3
{
  self->_isNotExecutable = a3;
}

- (BOOL)isKeywordMatch
{
  return self->_isKeywordMatch;
}

- (void)setIsKeywordMatch:(BOOL)a3
{
  self->_isKeywordMatch = a3;
}

- (BOOL)wordMatchedKeyword
{
  return self->_wordMatchedKeyword;
}

- (void)setWordMatchedKeyword:(BOOL)a3
{
  self->_wordMatchedKeyword = a3;
}

- (BOOL)photosMatch
{
  return self->_photosMatch;
}

- (void)setPhotosMatch:(BOOL)a3
{
  self->_photosMatch = a3;
}

- (BOOL)photosExactMatch
{
  return self->_photosExactMatch;
}

- (void)setPhotosExactMatch:(BOOL)a3
{
  self->_photosExactMatch = a3;
}

- (BOOL)isServerAlternativeResult
{
  return self->_isServerAlternativeResult;
}

- (void)setIsServerAlternativeResult:(BOOL)a3
{
  self->_isServerAlternativeResult = a3;
}

- (BOOL)spellCorrectedApp
{
  return self->_spellCorrectedApp;
}

- (void)setSpellCorrectedApp:(BOOL)a3
{
  self->_spellCorrectedApp = a3;
}

- (BOOL)matchedQUIntent
{
  return self->_matchedQUIntent;
}

- (void)setMatchedQUIntent:(BOOL)a3
{
  self->_matchedQUIntent = a3;
}

- (BOOL)quIntentAvailable
{
  return self->_quIntentAvailable;
}

- (void)setQuIntentAvailable:(BOOL)a3
{
  self->_quIntentAvailable = a3;
}

- (float)quIntentScore
{
  return self->_quIntentScore;
}

- (void)setQuIntentScore:(float)a3
{
  self->_quIntentScore = a3;
}

- (int)settingsPreferencePriority
{
  return self->_settingsPreferencePriority;
}

- (void)setSettingsPreferencePriority:(int)a3
{
  self->_settingsPreferencePriority = a3;
}

- (BOOL)isMailCategoryHighImpact
{
  return self->_isMailCategoryHighImpact;
}

- (void)setIsMailCategoryHighImpact:(BOOL)a3
{
  self->_isMailCategoryHighImpact = a3;
}

- (BOOL)isMailCategoryDefault
{
  return self->_isMailCategoryDefault;
}

- (void)setIsMailCategoryDefault:(BOOL)a3
{
  self->_isMailCategoryDefault = a3;
}

- (BOOL)isMailCategoryTransactions
{
  return self->_isMailCategoryTransactions;
}

- (void)setIsMailCategoryTransactions:(BOOL)a3
{
  self->_isMailCategoryTransactions = a3;
}

- (BOOL)isMailCategoryUpdates
{
  return self->_isMailCategoryUpdates;
}

- (void)setIsMailCategoryUpdates:(BOOL)a3
{
  self->_isMailCategoryUpdates = a3;
}

- (BOOL)isMailCategoryPromotions
{
  return self->_isMailCategoryPromotions;
}

- (void)setIsMailCategoryPromotions:(BOOL)a3
{
  self->_isMailCategoryPromotions = a3;
}

- (double)mostRecentUsedDate
{
  return self->_mostRecentUsedDate;
}

- (void)setMostRecentUsedDate:(double)a3
{
  self->_mostRecentUsedDate = a3;
}

- (double)closestUpComingDate
{
  return self->_closestUpComingDate;
}

- (void)setClosestUpComingDate:(double)a3
{
  self->_closestUpComingDate = a3;
}

- (int)topHitReason
{
  return self->_topHitReason;
}

- (void)setTopHitReason:(int)a3
{
  self->_topHitReason = a3;
}

- ($6DEE9A84489E5D5B19B16FA7C1263CD0)attributes
{
  return self->_attributes;
}

- (void)setAttributes:(id *)a3
{
  self->_attributes = a3;
}

- (float)embeddingSimilarity
{
  return self->_embeddingSimilarity;
}

- (void)setEmbeddingSimilarity:(float)a3
{
  self->_embeddingSimilarity = a3;
}

- (NSDate)mailDate
{
  return self->_mailDate;
}

- (void)setMailDate:(id)a3
{
  objc_storeStrong((id *)&self->_mailDate, a3);
}

- (float)pommesL1Score
{
  return self->_pommesL1Score;
}

- (void)setPommesL1Score:(float)a3
{
  self->_pommesL1Score = a3;
}

- (float)pommesCalibratedL1Score
{
  return self->_pommesCalibratedL1Score;
}

- (void)setPommesCalibratedL1Score:(float)a3
{
  self->_pommesCalibratedL1Score = a3;
}

- (int64_t)itemSparseMatchStrengthType
{
  return self->_itemSparseMatchStrengthType;
}

- (void)setItemSparseMatchStrengthType:(int64_t)a3
{
  self->_itemSparseMatchStrengthType = a3;
}

- (NSNumber)retrievalType
{
  return self->_retrievalType;
}

- (void)setRetrievalType:(id)a3
{
  objc_storeStrong((id *)&self->_retrievalType, a3);
}

- (NSDictionary)l2Features
{
  return self->_l2Features;
}

- (void)setL2Features:(id)a3
{
  objc_storeStrong((id *)&self->_l2Features, a3);
}

- (float)l2Score
{
  return self->_l2Score;
}

- (void)setL2Score:(float)a3
{
  self->_l2Score = a3;
}

- (NSData)l2Signals
{
  return self->_l2Signals;
}

- (void)setL2Signals:(id)a3
{
  objc_storeStrong((id *)&self->_l2Signals, a3);
}

- (NSDate)lastUsedDate
{
  return self->_lastUsedDate;
}

- (void)setLastUsedDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastUsedDate, a3);
}

- (int64_t)startDueDateToNowInSeconds
{
  return self->_startDueDateToNowInSeconds;
}

- (void)setStartDueDateToNowInSeconds:(int64_t)a3
{
  self->_startDueDateToNowInSeconds = a3;
}

- (BOOL)isAppEntity
{
  return self->_isAppEntity;
}

- (void)setIsAppEntity:(BOOL)a3
{
  self->_isAppEntity = a3;
}

- (int64_t)itemDenseMatchStrengthType
{
  return self->_itemDenseMatchStrengthType;
}

- (void)setItemDenseMatchStrengthType:(int64_t)a3
{
  self->_itemDenseMatchStrengthType = a3;
}

- (unint64_t)bundleIDType
{
  return self->_bundleIDType;
}

- (uint64_t)importantPropertiesPrefixMatched
{
  if (result)
    return *(_QWORD *)(result + 392);
  return result;
}

- (uint64_t)setImportantPropertiesPrefixMatched:(uint64_t)result
{
  if (result)
    *(_QWORD *)(result + 392) = a2;
  return result;
}

- (uint64_t)importantPropertiesWordMatched
{
  if (result)
    return *(_QWORD *)(result + 400);
  return result;
}

- (uint64_t)setImportantPropertiesWordMatched:(uint64_t)result
{
  if (result)
    *(_QWORD *)(result + 400) = a2;
  return result;
}

- (uint64_t)attrCountsPrefix
{
  if (result)
    return *(_QWORD *)(result + 416);
  return result;
}

- (uint64_t)matchedSenders
{
  if (result)
    return *(_QWORD *)(result + 16);
  return result;
}

- (uint64_t)matchedVipSenders
{
  if (result)
    return *(_QWORD *)(result + 24);
  return result;
}

- (uint64_t)matchedRecipients
{
  if (result)
    return *(_QWORD *)(result + 32);
  return result;
}

- (uint64_t)emailAddresses
{
  if (result)
    return *(_QWORD *)(result + 520);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emailAddresses, 0);
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_spanCalculator, 0);
  objc_storeStrong((id *)&self->_interestingDate, 0);
  objc_storeStrong((id *)&self->_lastUsedDate, 0);
  objc_storeStrong((id *)&self->_l2Signals, 0);
  objc_storeStrong((id *)&self->_l2Features, 0);
  objc_storeStrong((id *)&self->_retrievalType, 0);
  objc_storeStrong((id *)&self->_mailDate, 0);
  objc_storeStrong((id *)&self->_localSuggestionsData, 0);
  objc_storeStrong((id *)&self->_serverSuggestionsData, 0);
  objc_storeStrong((id *)&self->_serverFeaturesJSON, 0);
  objc_storeStrong((id *)&self->_L2FeatureVector, 0);
  objc_storeStrong((id *)&self->_displayNameInitials, 0);
  objc_storeStrong((id *)&self->_exactMatchedKeyword, 0);
  objc_storeStrong((id *)&self->_firstMatchedAltName, 0);
  objc_storeStrong((id *)&self->_sectionBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_recentSimilarIntentEngagementDates, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_matchedRecipients, 0);
  objc_storeStrong((id *)&self->_matchedVipSenders, 0);
  objc_storeStrong((id *)&self->_matchedSenders, 0);
}

- (void)didMatchRankingDescriptor:.cold.1()
{
  __assert_rtn("-[PRSRankingItem didMatchRankingDescriptor:]", "PRSRankingItem.m", 4924, "indexBit < 129");
}

- (void)updateNumScoreDescriptorBundleFeatures:feature:featureScoreInfo:.cold.1()
{
  __assert_rtn("-[PRSRankingItem updateNumScoreDescriptorBundleFeatures:feature:featureScoreInfo:]", "PRSRankingItem.m", 5409, "false");
}

+ (void)rankingDescriptorForBundleFeature:.cold.1()
{
  __assert_rtn("+[PRSRankingItem rankingDescriptorForBundleFeature:]", "PRSRankingItem.m", 5450, "false");
}

- (void)updateAccumulatedBundleFeatures:values:feature:.cold.1()
{
  __assert_rtn("-[PRSRankingItem updateAccumulatedBundleFeatures:values:feature:]", "PRSRankingItem.m", 5517, "false");
}

- (void)updateBundleFeatures:withArrValues:featureScoreInfo:.cold.1()
{
  __assert_rtn("-[PRSRankingItem updateBundleFeatures:withArrValues:featureScoreInfo:]", "PRSRankingItem.m", 5608, "false");
}

- (void)calibrateSemanticScore:queryTokenCount:queryID:.cold.1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[14];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_3();
  v3 = v0;
  OUTLINED_FUNCTION_0_4(&dword_1B86C5000, v1, (uint64_t)v1, "qid=%ld - Unsupported embedding version found (%lu)", v2);
  OUTLINED_FUNCTION_8();
}

- (void)calibrateSemanticScore:(uint64_t)a1 queryTokenCount:(NSObject *)a2 queryID:.cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a1;
  _os_log_error_impl(&dword_1B86C5000, a2, OS_LOG_TYPE_ERROR, "qid=%ld - Unable to get value of _kMDItemTextChunkTokenLength", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_8();
}

- (void)calibrateSemanticScore:queryTokenCount:queryID:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[14];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_3();
  v3 = 0;
  OUTLINED_FUNCTION_0_4(&dword_1B86C5000, v0, v1, "qid=%ld - Invalid MDItemTextChunkTokenLength (%lu)", v2);
  OUTLINED_FUNCTION_8();
}

- (void)populateTextFeatureValuesForProperty:updatingBundleFeatureValues:propertyIndex:withEvaluator:withContext:featureScoreInfo:propertyCanFuzzyMatch:keyboardLanguage:isCJK:featureList:propertyName:seenAuthorEmail:seenPrimaryRecipientEmail:.cold.1()
{
  __assert_rtn("-[PRSRankingItem populateTextFeatureValuesForProperty:updatingBundleFeatureValues:propertyIndex:withEvaluator:withContext:featureScoreInfo:propertyCanFuzzyMatch:keyboardLanguage:isCJK:featureList:propertyName:seenAuthorEmail:seenPrimaryRecipientEmail:]", "PRSRankingItem.m", 10307, "_spanCalculator");
}

+ (void)featureFromVirtualIdx:.cold.1()
{
  __assert_rtn("+[PRSRankingItem featureFromVirtualIdx:]", "PRSRankingItem.m", 10814, "false");
}

@end
