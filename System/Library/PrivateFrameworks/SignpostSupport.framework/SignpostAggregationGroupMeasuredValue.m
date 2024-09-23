@implementation SignpostAggregationGroupMeasuredValue

- (SignpostAggregationGroupMeasuredValue)initWithGroupName:(id)a3 type:(id)a4 unit:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  SignpostAggregationGroupMeasuredValue *v13;
  SignpostAggregationGroupMeasuredValue *v14;
  SignpostAggregationGroupMeasuredValue *v15;
  SignpostAggregationValueStats *v16;
  SignpostAggregationValueStats *stats;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  v13 = 0;
  if (v9 && v10 && v11)
  {
    v19.receiver = self;
    v19.super_class = (Class)SignpostAggregationGroupMeasuredValue;
    v14 = -[SignpostAggregationGroupMeasuredValue init](&v19, sel_init);
    v15 = v14;
    if (v14)
    {
      objc_storeStrong((id *)&v14->_groupName, a3);
      objc_storeStrong((id *)&v15->_type, a4);
      objc_storeStrong((id *)&v15->_unit, a5);
      v16 = objc_alloc_init(SignpostAggregationValueStats);
      stats = v15->_stats;
      v15->_stats = v16;

    }
    self = v15;
    v13 = self;
  }

  return v13;
}

- (id)_initWithParser:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  SignpostAggregationGroupMeasuredValue *v8;

  v4 = a3;
  objc_msgSend(v4, "group");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unit");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[SignpostAggregationGroupMeasuredValue initWithGroupName:type:unit:](self, "initWithGroupName:type:unit:", v5, v6, v7);
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  SignpostAggregationGroupMeasuredValue *v3;
  SignpostAggregationGroupMeasuredValue *v5;
  SignpostAggregationGroupMeasuredValue *v6;
  SignpostAggregationGroupMeasuredValue *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  BOOL v12;
  void *v13;
  void *v14;
  SignpostAggregationGroupMeasuredValue *v15;
  void *v16;
  char v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  SignpostAggregationGroupMeasuredValue *v28;
  void *v29;
  char v30;
  void *v31;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  SignpostAggregationGroupMeasuredValue *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  SignpostAggregationGroupMeasuredValue *v42;

  v5 = (SignpostAggregationGroupMeasuredValue *)a3;
  v6 = v5;
  if (v5)
  {
    if (v5 == self)
    {
      v12 = 1;
      goto LABEL_53;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v6;
      -[SignpostAggregationGroupMeasuredValue groupName](self, "groupName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SignpostAggregationGroupMeasuredValue groupName](v7, "groupName");
      v9 = objc_claimAutoreleasedReturnValue();
      if (v8 == (void *)v9)
      {

        goto LABEL_21;
      }
      v10 = (void *)v9;
      -[SignpostAggregationGroupMeasuredValue groupName](self, "groupName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        -[SignpostAggregationGroupMeasuredValue groupName](v7, "groupName");
        v42 = (SignpostAggregationGroupMeasuredValue *)objc_claimAutoreleasedReturnValue();
        if (!v42)
          goto LABEL_39;
      }
      -[SignpostAggregationGroupMeasuredValue groupName](self, "groupName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13
        || (-[SignpostAggregationGroupMeasuredValue groupName](v7, "groupName"),
            (v18 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
      {
        -[SignpostAggregationGroupMeasuredValue groupName](self, "groupName");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v7;
        -[SignpostAggregationGroupMeasuredValue groupName](v7, "groupName");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v14, "isEqual:", v16) ^ 1;

        if (v13)
        {

          v7 = v15;
          v3 = v42;
          if (!v11)
          {
LABEL_20:

            if ((v17 & 1) != 0)
            {
LABEL_51:
              v12 = 0;
LABEL_52:

              goto LABEL_53;
            }
LABEL_21:
            -[SignpostAggregationGroupMeasuredValue type](self, "type");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            -[SignpostAggregationGroupMeasuredValue type](v7, "type");
            v19 = objc_claimAutoreleasedReturnValue();
            if (v8 == (void *)v19)
            {

              goto LABEL_36;
            }
            v10 = (void *)v19;
            -[SignpostAggregationGroupMeasuredValue type](self, "type");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            if (v11)
            {
              -[SignpostAggregationGroupMeasuredValue type](v7, "type");
              v42 = (SignpostAggregationGroupMeasuredValue *)objc_claimAutoreleasedReturnValue();
              if (!v42)
                goto LABEL_39;
            }
            -[SignpostAggregationGroupMeasuredValue type](self, "type");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            if (v20
              || (-[SignpostAggregationGroupMeasuredValue type](v7, "type"),
                  (v24 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
            {
              -[SignpostAggregationGroupMeasuredValue type](self, "type");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v3 = v7;
              -[SignpostAggregationGroupMeasuredValue type](v7, "type");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = objc_msgSend(v21, "isEqual:", v22) ^ 1;

              if (v20)
              {

                v7 = v3;
                goto LABEL_33;
              }
              v24 = 0;
              v7 = v3;
            }
            else
            {
              v23 = 1;
            }

LABEL_33:
            if (v11)
            {

            }
            if ((v23 & 1) != 0)
              goto LABEL_51;
LABEL_36:
            -[SignpostAggregationGroupMeasuredValue unit](self, "unit");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            -[SignpostAggregationGroupMeasuredValue unit](v7, "unit");
            v25 = objc_claimAutoreleasedReturnValue();
            if (v8 == (void *)v25)
            {

              goto LABEL_54;
            }
            v10 = (void *)v25;
            -[SignpostAggregationGroupMeasuredValue unit](self, "unit");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            if (v11)
            {
              -[SignpostAggregationGroupMeasuredValue unit](v7, "unit");
              v42 = (SignpostAggregationGroupMeasuredValue *)objc_claimAutoreleasedReturnValue();
              if (!v42)
              {
LABEL_39:

                goto LABEL_51;
              }
            }
            -[SignpostAggregationGroupMeasuredValue unit](self, "unit");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            if (v26
              || (-[SignpostAggregationGroupMeasuredValue unit](v7, "unit"),
                  (v31 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
            {
              -[SignpostAggregationGroupMeasuredValue unit](self, "unit");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = v7;
              -[SignpostAggregationGroupMeasuredValue unit](v7, "unit");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v30 = objc_msgSend(v27, "isEqual:", v29) ^ 1;

              if (v26)
              {

                v7 = v28;
                v3 = v42;
                if (!v11)
                {
LABEL_50:

                  if ((v30 & 1) != 0)
                    goto LABEL_51;
LABEL_54:
                  -[SignpostAggregationGroupMeasuredValue stats](self, "stats");
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  -[SignpostAggregationGroupMeasuredValue stats](v7, "stats");
                  v34 = objc_claimAutoreleasedReturnValue();
                  if (v33 == (void *)v34)
                  {

                    v12 = 1;
                    goto LABEL_52;
                  }
                  v35 = (void *)v34;
                  -[SignpostAggregationGroupMeasuredValue stats](self, "stats");
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v36)
                  {
                    -[SignpostAggregationGroupMeasuredValue stats](v7, "stats");
                    v3 = (SignpostAggregationGroupMeasuredValue *)objc_claimAutoreleasedReturnValue();
                    if (!v3)
                    {
                      v37 = v7;
                      LOBYTE(v7) = 1;
                      goto LABEL_68;
                    }
                  }
                  -[SignpostAggregationGroupMeasuredValue stats](self, "stats");
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v38
                    || (-[SignpostAggregationGroupMeasuredValue stats](v7, "stats"),
                        (v41 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
                  {
                    -[SignpostAggregationGroupMeasuredValue stats](self, "stats");
                    v39 = (void *)objc_claimAutoreleasedReturnValue();
                    v37 = v7;
                    -[SignpostAggregationGroupMeasuredValue stats](v7, "stats");
                    v40 = (void *)objc_claimAutoreleasedReturnValue();
                    LODWORD(v7) = objc_msgSend(v39, "isEqual:", v40) ^ 1;

                    if (v38)
                    {

                      if (v36)
                        goto LABEL_68;
                      goto LABEL_62;
                    }
                    v41 = 0;
                  }
                  else
                  {
                    v37 = v7;
                    LODWORD(v7) = 1;
                  }

                  if (v36)
                  {
LABEL_68:

                    if ((v7 & 1) != 0)
                      goto LABEL_69;
                    goto LABEL_63;
                  }
LABEL_62:

                  if ((_DWORD)v7)
                  {
LABEL_69:
                    v12 = 0;
                    goto LABEL_70;
                  }
LABEL_63:
                  v12 = 1;
LABEL_70:
                  v7 = v37;
                  goto LABEL_52;
                }
LABEL_49:

                goto LABEL_50;
              }
              v31 = 0;
              v7 = v28;
            }
            else
            {
              v30 = 1;
            }
            v3 = v42;

            if (!v11)
              goto LABEL_50;
            goto LABEL_49;
          }
LABEL_19:

          goto LABEL_20;
        }
        v18 = 0;
        v7 = v15;
      }
      else
      {
        v17 = 1;
      }
      v3 = v42;

      if (!v11)
        goto LABEL_20;
      goto LABEL_19;
    }
  }
  v12 = 0;
LABEL_53:

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SignpostAggregationGroupMeasuredValue *v4;
  void *v5;
  void *v6;
  void *v7;
  SignpostAggregationGroupMeasuredValue *v8;
  void *v9;
  uint64_t v10;
  SignpostAggregationValueStats *stats;

  v4 = [SignpostAggregationGroupMeasuredValue alloc];
  -[SignpostAggregationGroupMeasuredValue groupName](self, "groupName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SignpostAggregationGroupMeasuredValue type](self, "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SignpostAggregationGroupMeasuredValue unit](self, "unit");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SignpostAggregationGroupMeasuredValue initWithGroupName:type:unit:](v4, "initWithGroupName:type:unit:", v5, v6, v7);

  -[SignpostAggregationGroupMeasuredValue stats](self, "stats");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "copy");
  stats = v8->_stats;
  v8->_stats = (SignpostAggregationValueStats *)v10;

  return v8;
}

- (NSNumber)total
{
  void *v2;
  void *v3;
  void *v4;
  NSNumber *v5;

  -[SignpostAggregationGroupMeasuredValue stats](self, "stats");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "total");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = &unk_1E462E900;
  v5 = v3;

  return v5;
}

- (unint64_t)count
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[SignpostAggregationGroupMeasuredValue stats](self, "stats");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "count");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedLongLongValue");

  return v4;
}

- (NSNumber)average
{
  void *v2;
  void *v3;
  void *v4;
  NSNumber *v5;

  -[SignpostAggregationGroupMeasuredValue stats](self, "stats");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "average");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = &unk_1E462E900;
  v5 = v3;

  return v5;
}

- (NSNumber)min
{
  void *v2;
  void *v3;

  -[SignpostAggregationGroupMeasuredValue stats](self, "stats");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "min");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (NSNumber)max
{
  void *v2;
  void *v3;

  -[SignpostAggregationGroupMeasuredValue stats](self, "stats");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "max");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (NSNumber)stddev
{
  void *v2;
  void *v3;

  -[SignpostAggregationGroupMeasuredValue stats](self, "stats");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stddev");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (id)_coreAnalyticsTotalFieldName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[SignpostAggregationGroupMeasuredValue groupName](self, "groupName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SignpostAggregationGroupMeasuredValue type](self, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@__%@__TotalValue"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_coreAnalyticsMinFieldName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[SignpostAggregationGroupMeasuredValue groupName](self, "groupName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SignpostAggregationGroupMeasuredValue type](self, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@__%@__MinValue"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_coreAnalyticsMaxFieldName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[SignpostAggregationGroupMeasuredValue groupName](self, "groupName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SignpostAggregationGroupMeasuredValue type](self, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@__%@__MaxValue"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_coreAnalyticsStdDevFieldName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[SignpostAggregationGroupMeasuredValue groupName](self, "groupName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SignpostAggregationGroupMeasuredValue type](self, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@__%@__ValueStdDev"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)shouldAdd
{
  return 1;
}

+ (id)_sumOfValue0:(id)a3 value1:(id)a4 errorOut:(id *)a5
{
  unint64_t v7;
  unint64_t v8;
  void *v9;
  BOOL v10;
  _BOOL4 v11;
  char v12;
  id *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v30;

  v7 = (unint64_t)a3;
  v8 = (unint64_t)a4;
  v9 = (void *)v8;
  if (a5)
  {
    *a5 = 0;
    v10 = v7 == 0;
    v11 = v8 == 0;
    if (!(v7 | v8))
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithCode:description:", 9, CFSTR("Cannot add nil measured values"));
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
  }
  else
  {
    v10 = v7 == 0;
    v11 = v8 == 0;
  }
  if (v7 && v11)
  {
    v8 = v7;
LABEL_11:
    v13 = (id *)objc_msgSend((id)v8, "copy");
    goto LABEL_24;
  }
  v12 = !v10;
  if (!v8)
    v12 = 1;
  if ((v12 & 1) == 0)
    goto LABEL_11;
LABEL_12:
  objc_msgSend((id)v7, "groupName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "groupName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "isEqualToString:", v15);

  if ((v16 & 1) != 0)
  {
    objc_msgSend((id)v7, "type");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "type");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v17, "isEqualToString:", v18);

    if ((v19 & 1) != 0)
    {
      objc_msgSend((id)v7, "stats");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stats");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 0;
      +[SignpostAggregationValueStats sumOfStats0:stats1:errorOut:](SignpostAggregationValueStats, "sumOfStats0:stats1:errorOut:", v20, v21, &v30);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v30;

      if (v22)
      {
        v13 = (id *)objc_msgSend((id)v7, "copy");
        objc_storeStrong(v13 + 5, v22);
      }
      else
      {
        v13 = 0;
        if (a5)
          *a5 = objc_retainAutorelease(v23);
      }

      goto LABEL_24;
    }
    v27 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend((id)v7, "type");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "type");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "stringWithFormat:", CFSTR("Tried to add measured values with different type: %@ vs. %@"), v25, v26);
  }
  else
  {
    v24 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend((id)v7, "groupName");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "groupName");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "stringWithFormat:", CFSTR("Tried to add measured values with different group names: %@ vs. %@"), v25, v26);
  }
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithCode:description:", 9, v28);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  v13 = 0;
LABEL_24:

  return v13;
}

- (id)_dictionaryRepresentation
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[SignpostAggregationGroupMeasuredValue type](self, "type");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, kAggTypeKey);

  -[SignpostAggregationGroupMeasuredValue unit](self, "unit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, kAggUnitOfMeasureKey);

  -[SignpostAggregationGroupMeasuredValue total](self, "total");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, kAggTotalKey);

  -[SignpostAggregationGroupMeasuredValue average](self, "average");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, kAggAverageKey);

  -[SignpostAggregationGroupMeasuredValue min](self, "min");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[SignpostAggregationGroupMeasuredValue min](self, "min");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, kAggMinValueKey);

  }
  -[SignpostAggregationGroupMeasuredValue max](self, "max");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[SignpostAggregationGroupMeasuredValue max](self, "max");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, kAggMaxValueKey);

  }
  -[SignpostAggregationGroupMeasuredValue stddev](self, "stddev");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[SignpostAggregationGroupMeasuredValue stddev](self, "stddev");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, kAggValueStdDevKey);

  }
  return v3;
}

- (NSString)groupName
{
  return self->_groupName;
}

- (NSString)type
{
  return self->_type;
}

- (NSString)unit
{
  return self->_unit;
}

- (SignpostAggregationValueStats)stats
{
  return self->_stats;
}

- (BOOL)telemetryEnabled
{
  return self->_telemetryEnabled;
}

- (void)setTelemetryEnabled:(BOOL)a3
{
  self->_telemetryEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stats, 0);
  objc_storeStrong((id *)&self->_unit, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_groupName, 0);
}

@end
