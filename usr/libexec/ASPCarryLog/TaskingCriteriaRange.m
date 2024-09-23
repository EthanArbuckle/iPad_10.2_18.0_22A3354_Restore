@implementation TaskingCriteriaRange

- (id)initFromTaskingCrit:(id)a3
{
  id v5;
  TaskingCriteriaRange *v6;
  TaskingCriteriaRange *v7;
  TaskingCriteriaRange *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TaskingCriteriaRange;
  v6 = -[TaskingCriteriaRange init](&v10, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_myTaskingCriteria, a3);
    v8 = v7;
  }

  return v7;
}

- (BOOL)validateCriteria
{
  void *v3;
  char *v4;
  BOOL v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  _UNKNOWN **v10;
  uint64_t v11;
  void *i;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v25;
  uint64_t v26;
  id v27;
  void *v28;
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

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TaskingCriteriaRange myTaskingCriteria](self, "myTaskingCriteria"));
  v4 = (char *)objc_msgSend(v3, "count");

  if ((unint64_t)(v4 - 5) < 0xFFFFFFFFFFFFFFFCLL)
    return 0;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TaskingCriteriaRange myTaskingCriteria](self, "myTaskingCriteria"));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = &AnalyticsIsEventUsed_ptr;
    v11 = *(_QWORD *)v34;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v34 != v11)
          objc_enumerationMutation(v6);
        v13 = *(id *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i);

        v14 = objc_opt_class(v10[41]);
        if ((objc_opt_isKindOfClass(v13, v14) & 1) == 0
          || (char *)objc_msgSend(v13, "count") - 5 < (char *)0xFFFFFFFFFFFFFFFCLL)
        {
          v5 = 0;
          goto LABEL_32;
        }
        v31 = 0u;
        v32 = 0u;
        v29 = 0u;
        v30 = 0u;
        v9 = v13;
        v15 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
        if (v15)
        {
          v16 = v15;
          v25 = i;
          v26 = v11;
          v27 = v8;
          v28 = v6;
          v17 = 0;
          v18 = *(_QWORD *)v30;
          while (2)
          {
            v19 = 0;
            v20 = v17;
            do
            {
              if (*(_QWORD *)v30 != v18)
                objc_enumerationMutation(v9);
              v17 = *(id *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)v19);

              v21 = objc_opt_class(NSDictionary);
              if ((objc_opt_isKindOfClass(v17, v21) & 1) == 0)
                goto LABEL_31;
              v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("START_RANGE")));

              if (v22)
              {
                if (!-[TaskingCriteriaRange _validateElement:isOptional:forCriteriaDict:](self, "_validateElement:isOptional:forCriteriaDict:", CFSTR("START_RANGE"), 0, v17))goto LABEL_31;
              }
              v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("END_RANGE"), v25, v26, v27));

              if (v23)
              {
                if (!-[TaskingCriteriaRange _validateElement:isOptional:forCriteriaDict:](self, "_validateElement:isOptional:forCriteriaDict:", CFSTR("END_RANGE"), 0, v17))goto LABEL_31;
              }
              else if (!v22)
              {
                goto LABEL_31;
              }
              if (!-[TaskingCriteriaRange _validateElement:isOptional:forCriteriaDict:](self, "_validateElement:isOptional:forCriteriaDict:", CFSTR("A"), 0, v17)|| !-[TaskingCriteriaRange _validateElement:isOptional:forCriteriaDict:](self, "_validateElement:isOptional:forCriteriaDict:", CFSTR("B"), 0, v17)|| !-[TaskingCriteriaRange _validateElement:isOptional:forCriteriaDict:](self, "_validateElement:isOptional:forCriteriaDict:", CFSTR("C"), 1, v17))
              {
LABEL_31:

                v5 = 0;
                v6 = v28;
                goto LABEL_32;
              }
              v19 = (char *)v19 + 1;
              v20 = v17;
            }
            while (v16 != v19);
            v16 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
            if (v16)
              continue;
            break;
          }

          v8 = v27;
          v6 = v28;
          v10 = &AnalyticsIsEventUsed_ptr;
          i = v25;
          v11 = v26;
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      if (v8)
        continue;
      break;
    }
    v5 = 1;
LABEL_32:

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (BOOL)_validateElement:(id)a3 isOptional:(BOOL)isKindOfClass forCriteriaDict:(id)a5
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  char v13;
  void *v14;
  uint64_t v15;
  int v16;
  void *v17;
  uint64_t v18;
  int v19;
  void *v20;
  uint64_t v21;

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a5, "objectForKeyedSubscript:", a3));
  v7 = v6;
  if (!v6)
  {
    v8 = 0;
    goto LABEL_11;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("TYPE")));
  if (!objc_msgSend(v8, "isEqualToString:", CFSTR("TYPE_STAT")))
  {
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("TYPE_CONST")))
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("VALUE")));
      v21 = objc_opt_class(NSNumber);
      isKindOfClass = objc_opt_isKindOfClass(v20, v21);

      goto LABEL_11;
    }
    goto LABEL_10;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("STAT_ID")));
  v10 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v9, v10) & 1) == 0)
  {

    goto LABEL_10;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("STAT_TIME_DELTA")));
  v12 = objc_opt_class(NSNumber);
  v13 = objc_opt_isKindOfClass(v11, v12);

  if ((v13 & 1) == 0)
  {
LABEL_10:
    isKindOfClass = 0;
    goto LABEL_11;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("START_IDX")));
  v15 = objc_opt_class(NSNumber);
  v16 = objc_opt_isKindOfClass(v14, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("END_IDX")));
  v18 = objc_opt_class(NSNumber);
  v19 = v16 ^ objc_opt_isKindOfClass(v17, v18);

  isKindOfClass = v19 ^ 1;
LABEL_11:

  return isKindOfClass;
}

- (BOOL)_checkForWholeCriteriaArray:(id)a3
{
  unsigned int (**v4)(id, id);
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  BOOL v18;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];

  v4 = (unsigned int (**)(id, id))a3;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TaskingCriteriaRange myTaskingCriteria](self, "myTaskingCriteria"));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v26;
    v20 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v26 != v9)
          objc_enumerationMutation(v5);
        v11 = *(id *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);

        v23 = 0u;
        v24 = 0u;
        v21 = 0u;
        v22 = 0u;
        v8 = v11;
        v12 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (v12)
        {
          v13 = v12;
          v14 = 0;
          v15 = *(_QWORD *)v22;
          while (2)
          {
            v16 = 0;
            v17 = v14;
            do
            {
              if (*(_QWORD *)v22 != v15)
                objc_enumerationMutation(v8);
              v14 = *(id *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v16);

              if (!v4[2](v4, v14))
              {

                v18 = 0;
                goto LABEL_19;
              }
              v16 = (char *)v16 + 1;
              v17 = v14;
            }
            while (v13 != v16);
            v13 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
            if (v13)
              continue;
            break;
          }

          v9 = v20;
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v7);
    v18 = 1;
LABEL_19:

  }
  else
  {
    v18 = 1;
  }

  return v18;
}

- (BOOL)_evaluateWholeCriteriaArray:(id)a3
{
  uint64_t (**v4)(id, id);
  id v5;
  char v6;
  void *i;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  int v13;
  void *v14;
  void *v15;
  id obj;
  uint64_t v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];

  v4 = (uint64_t (**)(id, id))a3;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[TaskingCriteriaRange myTaskingCriteria](self, "myTaskingCriteria"));
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v19)
  {
    v5 = 0;
    v6 = 0;
    v18 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(_QWORD *)v25 != v18)
          objc_enumerationMutation(obj);
        v8 = *(id *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);

        v22 = 0u;
        v23 = 0u;
        v20 = 0u;
        v21 = 0u;
        v5 = v8;
        v9 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
        if (v9)
        {
          v10 = v9;
          v11 = 0;
          v12 = *(_QWORD *)v21;
          v13 = 1;
          do
          {
            v14 = 0;
            v15 = v11;
            do
            {
              if (*(_QWORD *)v21 != v12)
                objc_enumerationMutation(v5);
              v11 = *(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v14);

              v13 &= v4[2](v4, v11);
              v14 = (char *)v14 + 1;
              v15 = v11;
            }
            while (v10 != v14);
            v10 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
          }
          while (v10);

        }
        else
        {
          LOBYTE(v13) = 1;
        }

        v6 |= v13;
      }
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v19);

  }
  else
  {
    v6 = 0;
  }

  return v6 & 1;
}

- (float)_getElementValue:(id)a3 forElementName:(id)a4 criteriaDict:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  float v11;
  float v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  float v22;

  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a5, "objectForKeyedSubscript:", a4));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("TYPE")));
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("TYPE_CONST")))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("VALUE")));
    objc_msgSend(v10, "floatValue");
    v12 = v11;

  }
  else
  {
    v12 = 1.0;
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("TYPE_STAT")))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("STAT_ID")));
      v14 = objc_msgSend(v13, "integerValue");

      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("STAT_TIME_DELTA")));
      v16 = objc_msgSend(v15, "unsignedIntValue");

      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("START_IDX")));
      if (v17)
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("START_IDX")));
        v19 = objc_msgSend(v18, "unsignedIntValue");

        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("END_IDX")));
        v21 = objc_msgSend(v20, "unsignedIntValue");

        objc_msgSend(v7, "getStatsDeltaForArr:startIdx:endIdx::", v14, v19, v21, v16);
      }
      else
      {
        objc_msgSend(v7, "getStatsDelta::", v14, v16);
      }
      v12 = v22;
    }
  }

  return v12;
}

- (float)getCriteriaValueUsingStatsProvider:(id)a3 forCriteriaDict:(id)a4
{
  id v6;
  id v7;
  float v8;
  float v9;
  float v10;
  float v11;
  void *v12;
  float v13;
  float v14;

  v6 = a3;
  v7 = a4;
  -[TaskingCriteriaRange _getElementValue:forElementName:criteriaDict:](self, "_getElementValue:forElementName:criteriaDict:", v6, CFSTR("A"), v7);
  v9 = v8;
  -[TaskingCriteriaRange _getElementValue:forElementName:criteriaDict:](self, "_getElementValue:forElementName:criteriaDict:", v6, CFSTR("B"), v7);
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("C")));

  if (!v12)
  {
    v13 = 1.0;
LABEL_5:
    v14 = (float)(v9 - v11) / v13;
    goto LABEL_6;
  }
  -[TaskingCriteriaRange _getElementValue:forElementName:criteriaDict:](self, "_getElementValue:forElementName:criteriaDict:", v6, CFSTR("C"), v7);
  v14 = 0.0;
  if (v13 != 0.0)
    goto LABEL_5;
LABEL_6:

  return v14;
}

- (BOOL)_elementPassesWhiteListCheck:(id)a3 whiteListRef:(id)a4 forCriteriaDict:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  void *v16;
  unsigned __int8 v17;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v7));
  if (v10
    && (v11 = (void *)v10,
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v7)),
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("TYPE"))),
        v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("TYPE_STAT")),
        v13,
        v12,
        v11,
        v14))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v7));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("STAT_ID")));
    v17 = objc_msgSend(v8, "containsObject:", v16);

  }
  else
  {
    v17 = 1;
  }

  return v17;
}

- (BOOL)passWhiteListCheck
{
  void *v3;
  _QWORD v5[4];
  _UNKNOWN **v6;
  TaskingCriteriaRange *v7;
  _UNKNOWN **v8;

  v3 = objc_autoreleasePoolPush();
  v5[0] = _NSConcreteStackBlock;
  v5[2] = sub_1000116A8;
  v5[3] = &unk_10008CA80;
  v5[1] = 3221225472;
  v6 = &off_1000BCF18;
  v7 = self;
  v8 = &off_1000BCF00;
  LOBYTE(self) = -[TaskingCriteriaRange _checkForWholeCriteriaArray:](self, "_checkForWholeCriteriaArray:", v5);

  objc_autoreleasePoolPop(v3);
  return (char)self;
}

- (BOOL)_elementExistsInStats:(id)a3 statsProvider:(id)a4 forCriteriaDict:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  unsigned __int8 v23;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v7));
  if (v10
    && (v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v7)),
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("TYPE"))),
        v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("TYPE_STAT")),
        v12,
        v11,
        v13))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("STAT_ID")));
    v15 = objc_msgSend(v14, "integerValue");

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("STAT_TIME_DELTA")));
    v17 = objc_msgSend(v16, "unsignedIntValue");

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("START_IDX")));
    if (v18)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("START_IDX")));
      v20 = objc_msgSend(v19, "unsignedIntValue");

      v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("END_IDX")));
      v21 = objc_msgSend((id)v22, "unsignedIntValue");

      LOBYTE(v22) = objc_msgSend(v8, "doesStatIdExistOnDeviceForArr:startIdx:endIdx:timeAgo:", v15, v20, v21, 0);
      if ((_DWORD)v17)
      {
        v23 = objc_msgSend(v8, "doesStatIdExistOnDeviceForArr:startIdx:endIdx:timeAgo:", v15, v20, v21, v17);
LABEL_9:
        LOBYTE(v22) = v22 & v23;
      }
    }
    else
    {
      v22 = objc_msgSend(v8, "doesStatIdExistOnDevice:timeAgo:", v15, 0);
      if ((_DWORD)v17)
      {
        v23 = objc_msgSend(v8, "doesStatIdExistOnDevice:timeAgo:", v15, v17);
        goto LABEL_9;
      }
    }
  }
  else
  {
    LOBYTE(v22) = 1;
  }

  return v22;
}

- (BOOL)allStatIdsExistInStatsProvider:(id)a3
{
  id v3;
  unsigned __int8 v4;
  _QWORD v6[4];
  _UNKNOWN **v7;
  TaskingCriteriaRange *v8;
  id v9;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100011A6C;
  v6[3] = &unk_10008CA80;
  v7 = &off_1000BCF30;
  v8 = self;
  v9 = a3;
  v3 = v9;
  v4 = -[TaskingCriteriaRange _checkForWholeCriteriaArray:](v8, "_checkForWholeCriteriaArray:", v6);

  return v4;
}

- (BOOL)evaluateCriteriaUsingStatsProvider:(id)a3 doWhiteListCheck:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  BOOL v7;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;

  v4 = a4;
  v6 = a3;
  if (!-[TaskingCriteriaRange validateCriteria](self, "validateCriteria"))
  {
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("CriteriaValidationFail"), CFSTR("Tasking criteria failed basic validation"), 0)));
    objc_exception_throw(v9);
  }
  if (v4 && !-[TaskingCriteriaRange passWhiteListCheck](self, "passWhiteListCheck"))
  {
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NonWhitelistedStatsKey"), CFSTR("Non-whitelisted key exists in tasking information"), 0)));
    objc_exception_throw(v11);
  }
  if (!-[TaskingCriteriaRange allStatIdsExistInStatsProvider:](self, "allStatIdsExistInStatsProvider:", v6))
  {
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("StatsKeyNotOnDevice"), CFSTR("Stat key absent from device stats exists in tasking information"), 0)));
    objc_exception_throw(v10);
  }
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100011E7C;
  v12[3] = &unk_10008CAA8;
  v12[4] = self;
  v13 = v6;
  v7 = -[TaskingCriteriaRange _evaluateWholeCriteriaArray:](self, "_evaluateWholeCriteriaArray:", v12);

  return v7;
}

- (NSArray)myTaskingCriteria
{
  return self->_myTaskingCriteria;
}

- (void)setMyTaskingCriteria:(id)a3
{
  objc_storeStrong((id *)&self->_myTaskingCriteria, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_myTaskingCriteria, 0);
}

@end
