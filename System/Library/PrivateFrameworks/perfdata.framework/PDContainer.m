@implementation PDContainer

- (PDContainer)initWithPath:(id)a3 error:(id *)a4
{
  void *v6;
  PDContainer *v7;

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", a3, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PDContainer initWithFileURL:error:](self, "initWithFileURL:error:", v6, a4);

  return v7;
}

+ (PDContainer)containerWithPath:(id)a3 error:(id *)a4
{
  id v5;
  PDContainer *v6;

  v5 = a3;
  v6 = -[PDContainer initWithPath:error:]([PDContainer alloc], "initWithPath:error:", v5, a4);

  return v6;
}

- (PDContainer)initWithFileURL:(id)a3 error:(id *)a4
{
  id v6;
  PDContainer *v7;
  PDContainer *v8;
  void *v9;
  void *v10;
  PDContainer *v11;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PDContainer;
  v7 = -[PDContainer init](&v13, sel_init);
  if (v7)
  {
    v8 = v7;
    objc_msgSend(MEMORY[0x1E0C99DB0], "inputStreamWithURL:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "open");
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithStream:options:error:", v9, 3, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "close");
    if (v10)
    {
      v8 = -[PDContainer initWithJSONDictionary:error:](v8, "initWithJSONDictionary:error:", v10, a4);
      v11 = v8;
    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (PDContainer)containerWithFileURL:(id)a3 error:(id *)a4
{
  id v5;
  PDContainer *v6;

  v5 = a3;
  v6 = -[PDContainer initWithFileURL:error:]([PDContainer alloc], "initWithFileURL:error:", v5, a4);

  return v6;
}

- (PDContainer)initWithJSONData:(id)a3 error:(id *)a4
{
  id v6;
  PDContainer *v7;
  PDContainer *v8;
  void *v9;
  PDContainer *v10;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PDContainer;
  v7 = -[PDContainer init](&v12, sel_init);
  if (v7)
  {
    v8 = v7;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v6, 3, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v8 = -[PDContainer initWithJSONDictionary:error:](v8, "initWithJSONDictionary:error:", v9, a4);
      v10 = v8;
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (PDContainer)containerWithJSONData:(id)a3 error:(id *)a4
{
  id v5;
  PDContainer *v6;

  v5 = a3;
  v6 = -[PDContainer initWithJSONData:error:]([PDContainer alloc], "initWithJSONData:error:", v5, a4);

  return v6;
}

- (PDContainer)initWithJSONDictionary:(id)a3 error:(id *)p_isa
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char isKindOfClass;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  __CFString *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  char v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  char v40;
  __CFString *v41;
  PDContainer *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  char v54;
  uint64_t v55;
  _QWORD v56[2];

  v56[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[PDContainer setPerfdata:](self, "setPerfdata:", v6);
    -[PDContainer perfdata](self, "perfdata");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("$schema"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      || (objc_msgSend(v8, "hasPrefix:", CFSTR("https://perfdata.apple.com/schema/")) & 1) == 0)
    {
      if (p_isa)
      {
        v26 = (void *)MEMORY[0x1E0CB35C8];
        v55 = *MEMORY[0x1E0CB2D50];
        v56[0] = CFSTR("schema is not perfdata");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v56, &v55, 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "errorWithDomain:code:userInfo:", CFSTR("PDError"), 3, v27);
        *p_isa = (id)objc_claimAutoreleasedReturnValue();

        p_isa = 0;
      }
      goto LABEL_17;
    }
    -[PDContainer perfdata](self, "perfdata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("name"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDContainer setName:](self, "setName:", v10);

    -[PDContainer name](self, "name");
    v11 = objc_claimAutoreleasedReturnValue();
    if (!v11
      || (v12 = (void *)v11,
          -[PDContainer name](self, "name"),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          isKindOfClass = objc_opt_isKindOfClass(),
          v13,
          v12,
          (isKindOfClass & 1) == 0))
    {
      handle_malformed_data(p_isa, CFSTR("perfdata name"));
      p_isa = (id *)objc_claimAutoreleasedReturnValue();
LABEL_17:

      goto LABEL_18;
    }
    -[PDContainer perfdata](self, "perfdata");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("version"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      -[PDContainer setVersion:](self, "setVersion:", objc_msgSend(v16, "unsignedIntegerValue"));
      -[PDContainer perfdata](self, "perfdata");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("description"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PDContainer setTestDescription:](self, "setTestDescription:", v18);

      -[PDContainer testDescription](self, "testDescription");
      v19 = objc_claimAutoreleasedReturnValue();
      if (!v19
        || (v20 = (void *)v19,
            -[PDContainer testDescription](self, "testDescription"),
            v21 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_opt_class(),
            v22 = objc_opt_isKindOfClass(),
            v21,
            v20,
            (v22 & 1) != 0))
      {
        -[PDContainer perfdata](self, "perfdata");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("larger_better"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (v24)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v41 = CFSTR("perfdata larger_better");
            goto LABEL_31;
          }
          v25 = objc_msgSend(v24, "BOOLValue");
        }
        else
        {
          v25 = 0;
        }
        -[PDContainer setLargerBetter:](self, "setLargerBetter:", v25);
        -[PDContainer perfdata](self, "perfdata");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("primary_metric"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[PDContainer setPrimaryMetricFilter:](self, "setPrimaryMetricFilter:", v31);

        -[PDContainer primaryMetricFilter](self, "primaryMetricFilter");
        v32 = objc_claimAutoreleasedReturnValue();
        if (v32)
        {
          v33 = (void *)v32;
          -[PDContainer primaryMetricFilter](self, "primaryMetricFilter");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v35 = objc_opt_isKindOfClass();

          if ((v35 & 1) == 0)
          {
            v41 = CFSTR("perfdata primary_metric");
            goto LABEL_31;
          }
        }
        -[PDContainer perfdata](self, "perfdata");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("generator"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[PDContainer setGenerator:](self, "setGenerator:", v37);

        -[PDContainer generator](self, "generator");
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        if (v38)
        {
          -[PDContainer generator](self, "generator");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v40 = objc_opt_isKindOfClass();

          if ((v40 & 1) == 0)
          {
            v41 = CFSTR("perfdata generator");
            goto LABEL_31;
          }
        }
        else
        {
          -[PDContainer setGenerator:](self, "setGenerator:", CFSTR("<unknown>"));
        }
        -[PDContainer perfdata](self, "perfdata");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        expect_dictionary(v43, (uint64_t)CFSTR("variables"), p_isa, CFSTR("perfdata variables"));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        -[PDContainer setVariables:](self, "setVariables:", v44);

        -[PDContainer variables](self, "variables");
        v45 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v45)
          goto LABEL_41;
        -[PDContainer perfdata](self, "perfdata");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        expect_dictionary(v46, (uint64_t)CFSTR("configuration"), p_isa, CFSTR("perfdata configuration"));
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        -[PDContainer setConfiguration:](self, "setConfiguration:", v47);

        -[PDContainer configuration](self, "configuration");
        v48 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v48)
        {
LABEL_41:
          p_isa = 0;
          goto LABEL_33;
        }
        -[PDContainer perfdata](self, "perfdata");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("notes"));
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        -[PDContainer setNotes:](self, "setNotes:", v50);

        -[PDContainer notes](self, "notes");
        v51 = objc_claimAutoreleasedReturnValue();
        if (!v51
          || (v52 = (void *)v51,
              -[PDContainer notes](self, "notes"),
              v53 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_opt_class(),
              v54 = objc_opt_isKindOfClass(),
              v53,
              v52,
              (v54 & 1) != 0))
        {
          v42 = self;
          goto LABEL_32;
        }
        v41 = CFSTR("perfdata notes");
LABEL_31:
        handle_malformed_data(p_isa, v41);
        v42 = (PDContainer *)objc_claimAutoreleasedReturnValue();
LABEL_32:
        p_isa = (id *)&v42->super.isa;
LABEL_33:

        goto LABEL_34;
      }
      v29 = CFSTR("perfdata description");
    }
    else
    {
      v29 = CFSTR("perfdata version");
    }
    handle_malformed_data(p_isa, v29);
    p_isa = (id *)objc_claimAutoreleasedReturnValue();
LABEL_34:

    goto LABEL_17;
  }
  handle_malformed_data(p_isa, CFSTR("perfdata object"));
  p_isa = (id *)objc_claimAutoreleasedReturnValue();
LABEL_18:

  return (PDContainer *)p_isa;
}

+ (PDContainer)containerWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v5;
  PDContainer *v6;

  v5 = a3;
  v6 = -[PDContainer initWithJSONDictionary:error:]([PDContainer alloc], "initWithJSONDictionary:error:", v5, a4);

  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[PDContainer name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("PerfData: %@ v%lu"), v4, -[PDContainer version](self, "version"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isComparableTo:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  v5 = -[PDContainer version](self, "version");
  if (v5 == objc_msgSend(v4, "version"))
  {
    -[PDContainer name](self, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isLike:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) == 0 || -[PDContainer isComparableTo:](self, "isComparableTo:", v4);

  return v5;
}

- (unint64_t)measurementCount
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[PDContainer perfdata](self, "perfdata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("data"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v4 = v3;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v5)
    {
      v6 = v5;
      v7 = 0;
      v8 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v4);
          v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
          if (v10)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v7 += objc_msgSend(v10, "count", (_QWORD)v12);
          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v6);
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)enumerateMeasurementsWithError:(id *)a3 usingBlock:(id)a4
{
  return -[PDContainer enumerateMeasurementsMatchingNullableFilter:error:usingBlock:](self, "enumerateMeasurementsMatchingNullableFilter:error:usingBlock:", 0, a3, a4);
}

- (BOOL)enumerateMeasurementsMatchingNullableFilter:(id)a3 error:(id *)a4 usingBlock:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  BOOL v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  uint64_t v25;
  id *v26;
  PDMeasurement *v27;
  PDMeasurement *v28;
  void *v29;
  void *v30;
  int v31;
  id v32;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  void *v39;
  id v40;
  id obj;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  char v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  -[PDContainer perfdata](self, "perfdata");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("data"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (!v8)
      {
        v44 = 0;
        v14 = 0;
        goto LABEL_10;
      }
      if (objc_msgSend(v8, "length"))
      {
        strip_container_prefix(self, v8);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        get_metric_filter_metric(v12);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        get_metric_filter_variables(v12, a4);
        v13 = objc_claimAutoreleasedReturnValue();
        if (!v13)
        {
          v15 = 0;
          v8 = v12;
LABEL_42:

          goto LABEL_43;
        }
        v14 = (void *)v13;
        v8 = v12;
LABEL_10:
        v52 = 0u;
        v53 = 0u;
        v50 = 0u;
        v51 = 0u;
        v17 = v11;
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
        if (v18)
        {
          v43 = 0;
          v19 = *(_QWORD *)v51;
          v39 = v17;
          v37 = *(_QWORD *)v51;
          while (2)
          {
            v20 = 0;
            v36 = v18;
            do
            {
              if (*(_QWORD *)v51 != v19)
                objc_enumerationMutation(v17);
              v21 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v20);
              if (!v21 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
              {
                v34 = (id)handle_malformed_data(a4, CFSTR("perfdata group"));
                v15 = 0;
                v17 = v39;
                goto LABEL_41;
              }
              v48 = 0u;
              v49 = 0u;
              v46 = 0u;
              v47 = 0u;
              obj = v21;
              v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
              if (v22)
              {
                v23 = v22;
                v42 = *(_QWORD *)v47;
                v40 = v9;
                v38 = v8;
                v35 = v20;
                while (2)
                {
                  for (i = 0; i != v23; ++i)
                  {
                    if (*(_QWORD *)v47 != v42)
                      objc_enumerationMutation(obj);
                    v25 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * i);
                    if (!v25 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                    {
                      v32 = (id)handle_malformed_data(a4, CFSTR("perfdata measurement"));
                      v15 = 0;
LABEL_40:

                      v17 = v39;
                      v9 = v40;
                      v8 = v38;
                      goto LABEL_41;
                    }
                    v26 = a4;
                    v27 = -[PDMeasurement initWithContainer:dictionary:group:error:]([PDMeasurement alloc], "initWithContainer:dictionary:group:error:", self, v25, v43, a4);
                    v28 = v27;
                    v15 = v27 != 0;
                    if (!v27)
                      goto LABEL_39;
                    if (!v44
                      || (-[PDMeasurement metric](v27, "metric"),
                          v29 = v14,
                          v30 = (void *)objc_claimAutoreleasedReturnValue(),
                          v31 = objc_msgSend(v30, "isEqualToString:", v44),
                          v30,
                          v14 = v29,
                          v31))
                    {
                      if (!v14
                        || -[PDMeasurement matchesVariables:ignoringMissing:](v28, "matchesVariables:ignoringMissing:", v14, 0))
                      {
                        v45 = 0;
                        (*((void (**)(id, PDMeasurement *, char *))v40 + 2))(v40, v28, &v45);
                        if (v45)
                        {
LABEL_39:

                          goto LABEL_40;
                        }
                      }
                    }

                    a4 = v26;
                  }
                  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
                  v9 = v40;
                  v8 = v38;
                  v20 = v35;
                  if (v23)
                    continue;
                  break;
                }
              }

              ++v43;
              ++v20;
              v19 = v37;
              v17 = v39;
            }
            while (v20 != v36);
            v18 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
            v19 = v37;
            v15 = 1;
            if (v18)
              continue;
            break;
          }
        }
        else
        {
          v15 = 1;
        }
LABEL_41:

        goto LABEL_42;
      }
      v15 = 1;

    }
    else
    {
      v16 = (id)handle_malformed_data(a4, CFSTR("perfdata data"));
      v15 = 0;
    }
  }
  else
  {
    v15 = 1;
  }
LABEL_43:

  return v15;
}

- (BOOL)enumerateAggregatedMeasurementsIgnoringVariables:(id)a3 error:(id *)a4 usingBlock:(id)a5
{
  return -[PDContainer enumerateAggregatedMeasurementsMatchingNullableFilter:ignoringVariables:error:usingBlock:](self, "enumerateAggregatedMeasurementsMatchingNullableFilter:ignoringVariables:error:usingBlock:", 0, a3, a4, a5);
}

- (BOOL)enumerateAggregatedMeasurementsMatchingNullableFilter:(id)a3 ignoringVariables:(id)a4 error:(id *)a5 usingBlock:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, void *, _BYTE *);
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  _BOOL4 v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v28;
  id v29;
  unsigned __int8 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD v35[4];
  id v36;
  id v37;
  PDContainer *v38;
  id v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, void *, _BYTE *))a6;
  v13 = (void *)objc_opt_new();
  v14 = (void *)objc_opt_new();
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __104__PDContainer_enumerateAggregatedMeasurementsMatchingNullableFilter_ignoringVariables_error_usingBlock___block_invoke;
  v35[3] = &unk_1E7143AE8;
  v15 = v11;
  v36 = v15;
  v16 = v13;
  v37 = v16;
  v38 = self;
  v17 = v14;
  v39 = v17;
  v18 = -[PDContainer enumerateMeasurementsMatchingNullableFilter:error:usingBlock:](self, "enumerateMeasurementsMatchingNullableFilter:error:usingBlock:", v10, a5, v35);
  if (v18)
  {
    v28 = v15;
    v29 = v10;
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v19 = v17;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v32;
LABEL_4:
      v23 = 0;
      while (1)
      {
        if (*(_QWORD *)v32 != v22)
          objc_enumerationMutation(v19);
        objc_msgSend(v16, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v23));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v24)
          -[PDContainer enumerateAggregatedMeasurementsMatchingNullableFilter:ignoringVariables:error:usingBlock:].cold.1();
        v25 = v24;
        v30 = 0;
        objc_msgSend(v24, "measurement");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v12[2](v12, v26, &v30);

        LODWORD(v26) = v30;
        if ((_DWORD)v26)
          break;
        if (v21 == ++v23)
        {
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
          if (v21)
            goto LABEL_4;
          break;
        }
      }
    }

    v15 = v28;
    v10 = v29;
  }

  return v18;
}

void __104__PDContainer_enumerateAggregatedMeasurementsMatchingNullableFilter_ignoringVariables_error_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  PDAggregateMeasurement *v5;
  void *v6;
  PDAggregateMeasurement *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v3 = a2;
  v11 = v3;
  if (*(_QWORD *)(a1 + 32))
    objc_msgSend(v3, "metricFilterIgnoringVariables:");
  else
    objc_msgSend(v3, "metricFilter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v4);
  v5 = (PDAggregateMeasurement *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v6 = *(void **)(a1 + 40);
    v7 = [PDAggregateMeasurement alloc];
    v8 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v11, "metric");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "unitString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[PDAggregateMeasurement initWithContainer:metric:unitString:](v7, "initWithContainer:metric:unitString:", v8, v9, v10);
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, v4);

    objc_msgSend(*(id *)(a1 + 56), "addObject:", v4);
  }
  -[PDAggregateMeasurement updateWithMeasurement:](v5, "updateWithMeasurement:", v11);

}

- (id)aggregateMeasurementsMatchingFilter:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v6 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy_;
  v14 = __Block_byref_object_dispose_;
  v15 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __57__PDContainer_aggregateMeasurementsMatchingFilter_error___block_invoke;
  v9[3] = &unk_1E7143B10;
  v9[4] = self;
  v9[5] = &v10;
  if (-[PDContainer enumerateMeasurementsMatchingFilter:error:usingBlock:](self, "enumerateMeasurementsMatchingFilter:error:usingBlock:", v6, a4, v9))
  {
    objc_msgSend((id)v11[5], "measurement");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __57__PDContainer_aggregateMeasurementsMatchingFilter_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  PDAggregateMeasurement *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (!v3)
  {
    v4 = [PDAggregateMeasurement alloc];
    v5 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v11, "metric");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "unitString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[PDAggregateMeasurement initWithContainer:metric:unitString:](v4, "initWithContainer:metric:unitString:", v5, v6, v7);
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  }
  objc_msgSend(v3, "updateWithMeasurement:", v11);

}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (unint64_t)version
{
  return self->_version;
}

- (void)setVersion:(unint64_t)a3
{
  self->_version = a3;
}

- (NSDictionary)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (NSMutableDictionary)extensions
{
  return self->_extensions;
}

- (void)setExtensions:(id)a3
{
  objc_storeStrong((id *)&self->_extensions, a3);
}

- (NSString)testDescription
{
  return self->_testDescription;
}

- (void)setTestDescription:(id)a3
{
  objc_storeStrong((id *)&self->_testDescription, a3);
}

- (NSString)notes
{
  return self->_notes;
}

- (void)setNotes:(id)a3
{
  objc_storeStrong((id *)&self->_notes, a3);
}

- (NSString)primaryMetricFilter
{
  return self->_primaryMetricFilter;
}

- (void)setPrimaryMetricFilter:(id)a3
{
  objc_storeStrong((id *)&self->_primaryMetricFilter, a3);
}

- (NSString)generator
{
  return self->_generator;
}

- (void)setGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_generator, a3);
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

- (NSMutableDictionary)perfdata
{
  return self->_perfdata;
}

- (void)setPerfdata:(id)a3
{
  objc_storeStrong((id *)&self->_perfdata, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_perfdata, 0);
  objc_storeStrong((id *)&self->_labels, 0);
  objc_storeStrong((id *)&self->_variables, 0);
  objc_storeStrong((id *)&self->_generator, 0);
  objc_storeStrong((id *)&self->_primaryMetricFilter, 0);
  objc_storeStrong((id *)&self->_notes, 0);
  objc_storeStrong((id *)&self->_testDescription, 0);
  objc_storeStrong((id *)&self->_extensions, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)enumerateAggregatedMeasurementsMatchingNullableFilter:ignoringVariables:error:usingBlock:.cold.1()
{
  const void *v0;
  CFTypeRef v1;

  _os_assert_log();
  v0 = (const void *)_os_crash();
  __break(1u);
  CFEqual(v0, v1);
}

@end
