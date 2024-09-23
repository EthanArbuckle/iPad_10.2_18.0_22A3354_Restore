@implementation PDMeasurement

- (PDMeasurement)initWithContainer:(id)a3 dictionary:(id)a4 group:(unint64_t)a5 error:(id *)a6
{
  id v10;
  id v11;
  PDMeasurement *v12;
  PDMeasurement *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  PDMeasurement *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  unint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  char v46;
  void *v47;
  void *v48;
  char v49;
  void *v50;
  void *v51;
  char v52;
  void *v53;
  void *v54;
  char v55;
  void *v56;
  void *v57;
  char v58;
  void *v59;
  void *v60;
  char v61;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t i;
  void *v70;
  unint64_t v71;
  void *v72;
  int v73;
  void *v74;
  int v75;
  id v76;
  void *v77;
  void *v78;
  id *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  void *v83;
  uint64_t v84;
  void *v85;
  id v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  objc_super v95;
  _BYTE v96[128];
  _BYTE v97[128];
  uint64_t v98;

  v98 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v95.receiver = self;
  v95.super_class = (Class)PDMeasurement;
  v12 = -[PDMeasurement init](&v95, sel_init);
  v13 = v12;
  if (v12)
  {
    -[PDMeasurement setContainer:](v12, "setContainer:", v10);
    -[PDMeasurement setMeasurement:](v13, "setMeasurement:", v11);
    -[PDMeasurement setGroup:](v13, "setGroup:", a5);
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("metric"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14 || (v15 = 0x1E0CB3000uLL, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      handle_malformed_data(a6, CFSTR("measurement metric"));
      v24 = (PDMeasurement *)objc_claimAutoreleasedReturnValue();
LABEL_54:

      goto LABEL_55;
    }
    -[PDMeasurement setMetric:](v13, "setMetric:", v14);
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("unit"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      handle_malformed_data(a6, CFSTR("measurement unit"));
      v24 = (PDMeasurement *)objc_claimAutoreleasedReturnValue();
LABEL_53:

      goto LABEL_54;
    }
    v79 = a6;
    -[PDMeasurement setUnitString:](v13, "setUnitString:", v16);
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("variables"));
    v17 = objc_claimAutoreleasedReturnValue();
    v78 = (void *)v17;
    if (v17)
    {
      v18 = v17;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        handle_malformed_data(a6, CFSTR("measurement variables"));
        v24 = (PDMeasurement *)objc_claimAutoreleasedReturnValue();
LABEL_52:

        goto LABEL_53;
      }
      objc_msgSend(v10, "variables");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "count");

      if (!v20)
      {
        -[PDMeasurement setVariables:](v13, "setVariables:", v18);
LABEL_15:
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("labels"));
        v86 = v11;
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        if (v80)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            handle_malformed_data(v79, CFSTR("measurement labels"));
            v24 = (PDMeasurement *)objc_claimAutoreleasedReturnValue();
LABEL_51:

            goto LABEL_52;
          }
          objc_msgSend(v10, "labels");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "count");

          v76 = v10;
          if (v26)
          {
            objc_msgSend(v10, "labels");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = (void *)objc_msgSend(v27, "mutableCopy");
            -[PDMeasurement setLabels:](v13, "setLabels:", v28);

          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            -[PDMeasurement setLabels:](v13, "setLabels:", v27);
          }

          v93 = 0u;
          v94 = 0u;
          v91 = 0u;
          v92 = 0u;
          v30 = v80;
          objc_msgSend(v80, "allKeys");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v84 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v91, v97, 16);
          if (v84)
          {
            v81 = v29;
            v82 = *(_QWORD *)v92;
            while (2)
            {
              v31 = 0;
              do
              {
                if (*(_QWORD *)v92 != v82)
                  objc_enumerationMutation(v29);
                v32 = *(_QWORD *)(*((_QWORD *)&v91 + 1) + 8 * v31);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  handle_malformed_data(v79, CFSTR("measurement label key"));
                  objc_claimAutoreleasedReturnValue();

                  v24 = 0;
                  v10 = v76;
                  goto LABEL_51;
                }
                v33 = v15;
                objc_msgSend(v30, "objectForKeyedSubscript:", v32);
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                -[PDMeasurement labels](v13, "labels");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v35, "objectForKeyedSubscript:", v32);
                v36 = (void *)objc_claimAutoreleasedReturnValue();

                if (v36)
                {
                  objc_msgSend(v36, "addObject:", v34);
                }
                else
                {
                  -[PDMeasurement labels](v13, "labels");
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", v34);
                  v38 = v14;
                  v39 = v16;
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v37, "setValue:forKey:", v40, v32);

                  v16 = v39;
                  v14 = v38;
                  v30 = v80;

                }
                ++v31;
                v15 = v33;
                v11 = v86;
                v29 = v81;
              }
              while (v84 != v31);
              v84 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v91, v97, 16);
              if (v84)
                continue;
              break;
            }
          }
          v10 = v76;
        }
        else
        {
          objc_msgSend(v10, "labels");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[PDMeasurement setLabels:](v13, "setLabels:", v29);
        }

        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("larger_better"));
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        if ((not_a_number(v41, v79, CFSTR("measurement larger_better")) & 1) != 0)
        {
          v24 = 0;
        }
        else
        {
          v85 = v41;
          v42 = v15;
          if (v41)
            v43 = objc_msgSend(v41, "BOOLValue");
          else
            v43 = 0;
          -[PDMeasurement setLargerBetter:](v13, "setLargerBetter:", v43, v10, v78);
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("value"));
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          -[PDMeasurement setValue:](v13, "setValue:", v44);

          -[PDMeasurement value](v13, "value");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = not_a_number(v45, v79, CFSTR("measurement value"));

          if ((v46 & 1) != 0)
            goto LABEL_48;
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("samples"));
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          -[PDMeasurement setSampleCount:](v13, "setSampleCount:", v47);

          -[PDMeasurement sampleCount](v13, "sampleCount");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = not_a_number(v48, v79, CFSTR("measurement samples"));

          if ((v49 & 1) != 0)
            goto LABEL_48;
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("mean"));
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          -[PDMeasurement setMean:](v13, "setMean:", v50);

          -[PDMeasurement mean](v13, "mean");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = not_a_number(v51, v79, CFSTR("measurement mean"));

          if ((v52 & 1) != 0)
            goto LABEL_48;
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("std_dev"));
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          -[PDMeasurement setStandardDeviation:](v13, "setStandardDeviation:", v53);

          -[PDMeasurement standardDeviation](v13, "standardDeviation");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = not_a_number(v54, v79, CFSTR("measurement std_dev"));

          if ((v55 & 1) != 0)
            goto LABEL_48;
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("minimum"));
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          -[PDMeasurement setMinimum:](v13, "setMinimum:", v56);

          -[PDMeasurement minimum](v13, "minimum");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v58 = not_a_number(v57, v79, CFSTR("measurement minimum"));

          if ((v58 & 1) != 0)
            goto LABEL_48;
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("maximum"));
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          -[PDMeasurement setMaximum:](v13, "setMaximum:", v59);

          -[PDMeasurement maximum](v13, "maximum");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          v61 = not_a_number(v60, v79, CFSTR("measurement maximum"));

          if ((v61 & 1) != 0)
          {
LABEL_48:
            v24 = 0;
          }
          else
          {
            v83 = v16;
            v89 = 0u;
            v90 = 0u;
            v87 = 0u;
            v88 = 0u;
            -[PDMeasurement measurement](v13, "measurement");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v63, "objectForKeyedSubscript:", CFSTR("tags"));
            v64 = (void *)objc_claimAutoreleasedReturnValue();

            v65 = v64;
            v66 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v87, v96, 16);
            if (v66)
            {
              v67 = v66;
              v68 = *(_QWORD *)v88;
              do
              {
                for (i = 0; i != v67; ++i)
                {
                  if (*(_QWORD *)v88 != v68)
                    objc_enumerationMutation(v65);
                  v70 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * i);
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    objc_msgSend(*(id *)(v42 + 2368), "stringWithUTF8String:", pdtag_summary);
                    v71 = v42;
                    v72 = (void *)objc_claimAutoreleasedReturnValue();
                    v73 = objc_msgSend(v70, "isEqualToString:", v72);

                    if (v73)
                    {
                      -[PDMeasurement setSummary:](v13, "setSummary:", 1);
                      v42 = v71;
                      v11 = v86;
                    }
                    else
                    {
                      objc_msgSend(*(id *)(v71 + 2368), "stringWithUTF8String:", pdtag_context);
                      v74 = (void *)objc_claimAutoreleasedReturnValue();
                      v75 = objc_msgSend(v70, "isEqualToString:", v74);

                      v42 = v71;
                      v11 = v86;
                      if (v75)
                        -[PDMeasurement setContext:](v13, "setContext:", 1);
                    }
                  }
                }
                v67 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v87, v96, 16);
              }
              while (v67);
            }

            v24 = v13;
            v16 = v83;
          }
          v10 = v77;
          v41 = v85;
        }

        goto LABEL_51;
      }
      objc_msgSend(v10, "variables");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)objc_msgSend(v21, "mutableCopy");
      -[PDMeasurement setVariables:](v13, "setVariables:", v22);

      -[PDMeasurement variables](v13, "variables");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setValuesForKeysWithDictionary:", v18);
    }
    else
    {
      objc_msgSend(v10, "variables");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[PDMeasurement setVariables:](v13, "setVariables:", v23);
    }

    goto LABEL_15;
  }
  v24 = 0;
LABEL_55:

  return v24;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[PDMeasurement metric](self, "metric");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDMeasurement unitString](self, "unitString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("PDMeasurement: %@ (%@)"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)matchesMetricFilter:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  BOOL v11;

  v4 = a3;
  -[PDMeasurement container](self, "container");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  strip_container_prefix(v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  get_metric_filter_metric(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDMeasurement metric](self, "metric");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if (v9)
  {
    get_metric_filter_variables(v6, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      v11 = -[PDMeasurement matchesVariables:ignoringMissing:](self, "matchesVariables:ignoringMissing:", v10, 0);
    else
      v11 = 0;

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)matchesVariables:(id)a3 ignoringMissing:(BOOL)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  BOOL v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = a3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        -[PDMeasurement variables](self, "variables", (_QWORD)v18);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (!a4 && !v13
          || v13
          && (objc_msgSend(v6, "objectForKeyedSubscript:", v11),
              v14 = (void *)objc_claimAutoreleasedReturnValue(),
              v15 = objc_msgSend(v13, "isEqual:", v14),
              v14,
              (v15 & 1) == 0))
        {

          v16 = 0;
          goto LABEL_15;
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      v16 = 1;
      if (v8)
        continue;
      break;
    }
  }
  else
  {
    v16 = 1;
  }
LABEL_15:

  return v16;
}

- (id)metricFilter
{
  void *v3;
  void *v4;

  -[PDMeasurement cachedMetricFilter](self, "cachedMetricFilter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[PDMeasurement metricFilterIgnoringNullableVariables:](self, "metricFilterIgnoringNullableVariables:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDMeasurement setCachedMetricFilter:](self, "setCachedMetricFilter:", v4);

  }
  return -[PDMeasurement cachedMetricFilter](self, "cachedMetricFilter");
}

- (id)metricFilterIgnoringNullableVariables:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PDMeasurement container](self, "container");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  -[PDMeasurement metric](self, "metric");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR(".%@"), v8);

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[PDMeasurement variables](self, "variables");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sortedArrayUsingSelector:", sel_compare_);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v21;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v15);
        if (!v4 || (objc_msgSend(v4, "containsObject:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v15)) & 1) == 0)
        {
          -[PDMeasurement variables](self, "variables");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectForKeyedSubscript:", v16);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "appendFormat:", CFSTR(",%@=%@"), v16, v18);

        }
        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v13);
  }

  return v7;
}

- (BOOL)isComparableTo:(id)a3
{
  return -[PDMeasurement isComparableTo:ignoringNullableVariables:](self, "isComparableTo:ignoringNullableVariables:", a3, 0);
}

- (BOOL)isLike:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) == 0 || -[PDMeasurement isComparableTo:](self, "isComparableTo:", v4);

  return v5;
}

- (BOOL)isComparableTo:(id)a3 ignoringNullableVariables:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  char v15;

  v6 = a3;
  v7 = a4;
  -[PDMeasurement metric](self, "metric");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "metric");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "isEqualToString:", v9))
  {
    v15 = 0;
LABEL_10:

    goto LABEL_11;
  }
  -[PDMeasurement container](self, "container");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "container");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isComparableTo:", v11);

  if (v12)
  {
    if (v7 && objc_msgSend(v7, "count"))
    {
      -[PDMeasurement variables](self, "variables");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v13, "mutableCopy");

      objc_msgSend(v8, "removeObjectsForKeys:", v7);
      objc_msgSend(v6, "variables");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v14, "mutableCopy");

      objc_msgSend(v9, "removeObjectsForKeys:", v7);
    }
    else
    {
      -[PDMeasurement variables](self, "variables");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "variables");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v15 = objc_msgSend(v8, "isEqualToDictionary:", v9);
    goto LABEL_10;
  }
  v15 = 0;
LABEL_11:

  return v15;
}

- (unint64_t)histogramBucketCount
{
  void *v2;
  void *v3;
  void *v4;
  PDBucket *v5;
  PDBucket *v6;
  _BOOL8 v7;
  unint64_t v8;

  -[PDMeasurement measurement](self, "measurement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("histogram"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", objc_msgSend(v3, "count") - 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = -[PDBucket initWithDictionary:error:]([PDBucket alloc], "initWithDictionary:error:", v4, 0);
      v6 = v5;
      if (v5)
      {
        v7 = -[PDBucket count](v5, "count") == 0;
        v8 = objc_msgSend(v3, "count") - v7;
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

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)enumerateHistogramBucketsWithError:(id *)a3 usingBlock:(id)a4
{
  void (**v6)(id, void *, _BYTE *);
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  PDBucket *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  PDBucket *v19;
  uint64_t v20;
  PDBucket *v21;
  BOOL v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  PDMeasurement *v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  id obj;
  char v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, void *, _BYTE *))a4;
  -[PDMeasurement measurement](self, "measurement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("histogram"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = objc_msgSend(v8, "count");
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v10 = v8;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      if (v11)
      {
        v12 = v11;
        v13 = 0;
        v14 = 0;
        v15 = *(_QWORD *)v35;
        v16 = v9 - 1;
        v31 = 1;
        obj = v10;
        v28 = self;
        v29 = v9 - 1;
        while (2)
        {
          v17 = 0;
          v18 = v16 - v13;
          v30 = v13 + v12;
          v19 = v14;
          do
          {
            if (*(_QWORD *)v35 != v15)
              objc_enumerationMutation(obj);
            v20 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v17);
            if (!v20 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              v26 = (id)handle_malformed_data(a3, CFSTR("histogram bucket"));
              v22 = 0;
LABEL_25:

              goto LABEL_26;
            }
            v21 = -[PDBucket initWithDictionary:error:]([PDBucket alloc], "initWithDictionary:error:", v20, a3);
            v14 = v21;
            v22 = v21 != 0;
            if (!v21)
              goto LABEL_24;
            if (v19)
            {
              if (v18 == v17)
                v31 &= -[PDBucket count](v21, "count") != 0;
              -[PDBucket lowerInclusiveBound](v14, "lowerInclusiveBound", v28);
              -[PDBucket setUpperBound:](v19, "setUpperBound:");
              -[PDBucket setHasInclusiveUpperBound:](v19, "setHasInclusiveUpperBound:", 0);
              v33 = 0;
              v6[2](v6, v19, &v33);
              if (v33)
              {
LABEL_24:

                goto LABEL_25;
              }
            }

            ++v17;
            v19 = v14;
          }
          while (v12 != v17);
          v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
          v16 = v29;
          v13 = v30;
          if (v12)
            continue;
          break;
        }

        if ((v31 & 1) != 0)
        {
          -[PDMeasurement maximum](v28, "maximum");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (v23)
          {
            -[PDMeasurement maximum](v28, "maximum");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "doubleValue");
            -[PDBucket setUpperBound:](v14, "setUpperBound:");

          }
          else
          {
            -[PDBucket setUpperBound:](v14, "setUpperBound:", 1.79769313e308);
          }

          v22 = 1;
          -[PDBucket setHasInclusiveUpperBound:](v14, "setHasInclusiveUpperBound:", 1);
          v33 = 0;
          v6[2](v6, v14, &v33);
        }
        else
        {
          v22 = 1;
        }
        v19 = v14;
      }
      else
      {

        v19 = 0;
        v22 = 1;
      }
LABEL_26:

    }
    else
    {
      v25 = (id)handle_malformed_data(a3, CFSTR("measurement histogram"));
      v22 = 0;
    }
  }
  else
  {
    v22 = 1;
  }

  return v22;
}

- (unint64_t)percentileCount
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[PDMeasurement measurement](self, "measurement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("percentiles"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v4 = objc_msgSend(v3, "count");
  else
    v4 = 0;

  return v4;
}

- (BOOL)enumeratePercentilesWithError:(id *)a3 usingBlock:(id)a4
{
  uint64_t i;
  void (**v7)(id, _BYTE *, double, double);
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  char v20;
  char v21;
  id v22;
  id v23;
  id v24;
  id v25;
  char v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v7 = (void (**)(id, _BYTE *, double, double))a4;
  -[PDMeasurement measurement](self, "measurement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("percentiles"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v21 = 1;
    goto LABEL_28;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v22 = (id)handle_malformed_data(a3, CFSTR("measurement percentiles"));
    v21 = 0;
    goto LABEL_28;
  }
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (!v11)
  {
    v20 = 1;
    goto LABEL_27;
  }
  v12 = v11;
  v13 = *(_QWORD *)v29;
  while (2)
  {
    for (i = 0; i != v12; ++i)
    {
      if (*(_QWORD *)v29 != v13)
        objc_enumerationMutation(v10);
      v14 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
      if (!v14 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        v23 = (id)handle_malformed_data(a3, CFSTR("measurement percentile"));
LABEL_23:
        v20 = 0;
        LOBYTE(i) = 0;
        goto LABEL_27;
      }
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("%"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v15 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        v24 = (id)handle_malformed_data(a3, CFSTR("percentile %"));

        goto LABEL_23;
      }
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("value"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v16 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        v25 = (id)handle_malformed_data(a3, CFSTR("percentile value"));
        LOBYTE(i) = 0;
LABEL_26:

        v20 = 0;
        goto LABEL_27;
      }
      v27 = 0;
      objc_msgSend(v15, "doubleValue");
      v18 = v17;
      objc_msgSend(v16, "doubleValue");
      v7[2](v7, &v27, v18, v19);
      if (v27)
      {
        LOBYTE(i) = 1;
        goto LABEL_26;
      }

    }
    v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    v20 = 1;
    if (v12)
      continue;
    break;
  }
LABEL_27:

  v21 = v20 | i;
LABEL_28:

  return v21 & 1;
}

- (NSString)metric
{
  return self->_metric;
}

- (void)setMetric:(id)a3
{
  objc_storeStrong((id *)&self->_metric, a3);
}

- (NSString)unitString
{
  return self->_unitString;
}

- (void)setUnitString:(id)a3
{
  objc_storeStrong((id *)&self->_unitString, a3);
}

- (NSDictionary)variables
{
  return self->_variables;
}

- (void)setVariables:(id)a3
{
  objc_storeStrong((id *)&self->_variables, a3);
}

- (NSDictionary)labels
{
  return self->_labels;
}

- (void)setLabels:(id)a3
{
  objc_storeStrong((id *)&self->_labels, a3);
}

- (BOOL)largerBetter
{
  return self->_largerBetter;
}

- (void)setLargerBetter:(BOOL)a3
{
  self->_largerBetter = a3;
}

- (unint64_t)group
{
  return self->_group;
}

- (void)setGroup:(unint64_t)a3
{
  self->_group = a3;
}

- (NSNumber)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_storeStrong((id *)&self->_value, a3);
}

- (NSNumber)sampleCount
{
  return self->_sampleCount;
}

- (void)setSampleCount:(id)a3
{
  objc_storeStrong((id *)&self->_sampleCount, a3);
}

- (NSNumber)mean
{
  return self->_mean;
}

- (void)setMean:(id)a3
{
  objc_storeStrong((id *)&self->_mean, a3);
}

- (NSNumber)standardDeviation
{
  return self->_standardDeviation;
}

- (void)setStandardDeviation:(id)a3
{
  objc_storeStrong((id *)&self->_standardDeviation, a3);
}

- (NSNumber)minimum
{
  return self->_minimum;
}

- (void)setMinimum:(id)a3
{
  objc_storeStrong((id *)&self->_minimum, a3);
}

- (NSNumber)maximum
{
  return self->_maximum;
}

- (void)setMaximum:(id)a3
{
  objc_storeStrong((id *)&self->_maximum, a3);
}

- (BOOL)isSummary
{
  return self->_summary;
}

- (void)setSummary:(BOOL)a3
{
  self->_summary = a3;
}

- (BOOL)isContext
{
  return self->_context;
}

- (void)setContext:(BOOL)a3
{
  self->_context = a3;
}

- (NSDictionary)measurement
{
  return self->_measurement;
}

- (void)setMeasurement:(id)a3
{
  objc_storeStrong((id *)&self->_measurement, a3);
}

- (PDContainer)container
{
  return (PDContainer *)objc_loadWeakRetained((id *)&self->_container);
}

- (void)setContainer:(id)a3
{
  objc_storeWeak((id *)&self->_container, a3);
}

- (NSString)cachedMetricFilter
{
  return self->_cachedMetricFilter;
}

- (void)setCachedMetricFilter:(id)a3
{
  objc_storeStrong((id *)&self->_cachedMetricFilter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedMetricFilter, 0);
  objc_destroyWeak((id *)&self->_container);
  objc_storeStrong((id *)&self->_measurement, 0);
  objc_storeStrong((id *)&self->_maximum, 0);
  objc_storeStrong((id *)&self->_minimum, 0);
  objc_storeStrong((id *)&self->_standardDeviation, 0);
  objc_storeStrong((id *)&self->_mean, 0);
  objc_storeStrong((id *)&self->_sampleCount, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_labels, 0);
  objc_storeStrong((id *)&self->_variables, 0);
  objc_storeStrong((id *)&self->_unitString, 0);
  objc_storeStrong((id *)&self->_metric, 0);
}

@end
