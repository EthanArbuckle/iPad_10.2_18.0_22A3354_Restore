@implementation PGConsistencyUtility

+ (BOOL)properties:(id)a3 areConsistentWithProperties:(id)a4 toleranceFactor:(int64_t)a5
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  id v22;
  double v23;
  double v24;
  double v25;
  double v26;
  BOOL v27;
  void *v29;
  void *v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEqualToArray:", v9))
  {
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v10 = v8;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v11)
    {
      v12 = v11;
      v29 = v9;
      v30 = v8;
      v13 = *(_QWORD *)v33;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v33 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
          v16 = (void *)MEMORY[0x1CAA4EB2C]();
          objc_msgSend(v6, "objectForKeyedSubscript:", v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "objectForKeyedSubscript:", v15);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v17, "dataType");
          v20 = objc_msgSend(v18, "dataType");
          if (v19 == 2 && v20 == 2)
          {
            v22 = v18;
            objc_msgSend(v17, "value");
            v24 = v23;
            objc_msgSend(v22, "value");
            v26 = v25;

            if (!+[PGConsistencyUtility _doubleValue:isEqualTo:toleranceFactor:](PGConsistencyUtility, "_doubleValue:isEqualTo:toleranceFactor:", a5, v24, v26))
            {
              v18 = v22;
LABEL_20:
              v9 = v29;
              v8 = v30;

              objc_autoreleasePoolPop(v16);
              v27 = 0;
              goto LABEL_21;
            }
          }
          else if (!objc_msgSend(v17, "isEqual:", v18))
          {
            goto LABEL_20;
          }

          objc_autoreleasePoolPop(v16);
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
        if (v12)
          continue;
        break;
      }
      v27 = 1;
      v9 = v29;
      v8 = v30;
    }
    else
    {
      v27 = 1;
    }
LABEL_21:

  }
  else
  {
    v27 = 0;
  }

  return v27;
}

+ (BOOL)_doubleValue:(double)a3 isEqualTo:(double)a4 toleranceFactor:(int64_t)a5
{
  return vabdd_f64(a3, a4) <= 1.0 / __exp10((double)a5);
}

@end
