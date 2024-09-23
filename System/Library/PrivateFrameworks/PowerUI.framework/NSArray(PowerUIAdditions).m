@implementation NSArray(PowerUIAdditions)

- (double)mean
{
  double v2;
  void *v3;
  char isKindOfClass;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v2 = 0.0;
  if (objc_msgSend(a1, "count"))
  {
    objc_msgSend(a1, "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v14 = 0u;
      v15 = 0u;
      v12 = 0u;
      v13 = 0u;
      v5 = a1;
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v13;
        do
        {
          v9 = 0;
          do
          {
            if (*(_QWORD *)v13 != v8)
              objc_enumerationMutation(v5);
            objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "doubleValue", (_QWORD)v12);
            v2 = v2 + v10;
            ++v9;
          }
          while (v7 != v9);
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        }
        while (v7);
      }

      return v2 / (double)(unint64_t)objc_msgSend(v5, "count");
    }
  }
  return v2;
}

- (double)standardDeviation
{
  double v2;
  void *v3;
  char isKindOfClass;
  double v5;
  double v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  uint64_t i;
  double v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v2 = 0.0;
  if ((unint64_t)objc_msgSend(a1, "count") >= 2)
  {
    objc_msgSend(a1, "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(a1, "mean");
      v6 = v5;
      v15 = 0u;
      v16 = 0u;
      v17 = 0u;
      v18 = 0u;
      v7 = a1;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v16;
        v11 = 0.0;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v16 != v10)
              objc_enumerationMutation(v7);
            objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "doubleValue", (_QWORD)v15);
            v11 = v11 + (v13 - v6) * (v13 - v6);
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        }
        while (v9);
      }
      else
      {
        v11 = 0.0;
      }

      return sqrt(v11 / (double)(unint64_t)(objc_msgSend(v7, "count") - 1));
    }
  }
  return v2;
}

- (uint64_t)median
{
  return objc_msgSend(a1, "percentile:", 0.5);
}

- (double)percentile:()PowerUIAdditions
{
  uint64_t v4;
  double v5;
  unint64_t v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  double v10;
  void *v11;
  int v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  uint64_t v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  void *v26;
  double v27;

  v4 = objc_msgSend(a1, "count");
  v5 = 0.0;
  if (v4)
  {
    v6 = v4;
    objc_msgSend(a1, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      if (v6 == 1)
      {
        objc_msgSend(a1, "firstObject");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "doubleValue");
        v5 = v10;
LABEL_12:

        return v5;
      }
      objc_msgSend(a1, "sortedArrayUsingSelector:", sel_compare_);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v11;
      if (a2 >= 1.0)
      {
        objc_msgSend(a1, "lastObject");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (a2 > 0.0)
        {
          v12 = (int)((double)(v6 - 1) * a2);
          v13 = (double)v6 + -1.0;
          v14 = (double)v12 / v13;
          v15 = (double)(v12 + 1) / v13;
          v16 = a2 - v14;
          objc_msgSend(v11, "objectAtIndexedSubscript:", v12 + 1);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "doubleValue");
          v19 = v18;
          v20 = v12;
          objc_msgSend(v9, "objectAtIndexedSubscript:", v12);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "doubleValue");
          v23 = v19 - v22;

          objc_msgSend(v9, "objectAtIndexedSubscript:", v20);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "doubleValue");
          v5 = v16 * v23 / (v15 - v14) + v25;
LABEL_11:

          goto LABEL_12;
        }
        objc_msgSend(a1, "firstObject");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v24 = v26;
      objc_msgSend(v26, "doubleValue");
      v5 = v27;
      goto LABEL_11;
    }
  }
  return v5;
}

- (id)percentiles:()PowerUIAdditions
{
  id v4;
  unint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  double v12;
  double v13;
  double v14;
  void *v15;
  char isKindOfClass;
  int v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  void *v25;
  double v26;
  void *v27;
  id v29;
  void *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(a1, "count");
  v6 = (void *)objc_opt_new();
  objc_msgSend(a1, "sortedArrayUsingSelector:", sel_compare_);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v33;
    v29 = v7;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v33 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "doubleValue");
        v13 = 0.0;
        if (v5)
        {
          v14 = v12;
          objc_msgSend(a1, "firstObject");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) != 0)
          {
            if (v5 == 1)
              goto LABEL_12;
            if (v14 >= 1.0)
            {
              objc_msgSend(a1, "lastObject");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              if (v14 > 0.0)
              {
                v17 = (int)(v14 * (double)(v5 - 1));
                objc_msgSend(v30, "objectAtIndexedSubscript:", v17 + 1);
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "doubleValue");
                v19 = v18;
                objc_msgSend(v30, "objectAtIndexedSubscript:", v17);
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "doubleValue");
                v22 = v19 - v21;

                v7 = v29;
                objc_msgSend(v30, "objectAtIndexedSubscript:", v17);
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "doubleValue");
                v13 = (v14 - (double)v17 / ((double)v5 + -1.0))
                    * v22
                    / ((double)(v17 + 1) / ((double)v5 + -1.0) - (double)v17 / ((double)v5 + -1.0))
                    + v24;
LABEL_15:

                goto LABEL_16;
              }
LABEL_12:
              objc_msgSend(a1, "firstObject");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
            }
            v23 = v25;
            objc_msgSend(v25, "doubleValue");
            v13 = v26;
            goto LABEL_15;
          }
        }
LABEL_16:
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v13);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v27);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v9);
  }

  return v6;
}

@end
