@implementation RETimeline

- (RETimeline)init
{
  RETimeline *v2;
  void *v3;
  uint64_t v4;
  NSArray *transitionDates;
  NSArray *values;
  objc_super v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v8.receiver = self;
  v8.super_class = (Class)RETimeline;
  v2 = -[RETimeline init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v3;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
    v4 = objc_claimAutoreleasedReturnValue();
    transitionDates = v2->_transitionDates;
    v2->_transitionDates = (NSArray *)v4;

    values = v2->_values;
    v2->_values = (NSArray *)MEMORY[0x24BDBD1A8];

  }
  return v2;
}

- (RETimeline)initWithStartDate:(id)a3 values:(id)a4 durations:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  RETimeline *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  NSArray *transitionDates;
  uint64_t v32;
  NSArray *values;
  objc_super v35;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v9, "count");
  if (v11 != objc_msgSend(v10, "count"))
  {
    v12 = (void *)*MEMORY[0x24BDBCAB8];
    v13 = objc_msgSend(v9, "count");
    objc_msgSend(v10, "count");
    RERaiseInternalException(v12, CFSTR("Number of values (%lu) must match number of durations (%lu)"), v14, v15, v16, v17, v18, v19, v13);
  }
  v35.receiver = self;
  v35.super_class = (Class)RETimeline;
  v20 = -[RETimeline init](&v35, sel_init);
  if (v20)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v9, "count") + 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v9, "count"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObject:", v8);
    if (objc_msgSend(v9, "count"))
    {
      v23 = 0;
      do
      {
        objc_msgSend(v10, "objectAtIndexedSubscript:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "doubleValue");
        v26 = v25;

        if (v26 > 0.0)
        {
          objc_msgSend(v21, "lastObject");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "dateByAddingTimeInterval:", v26);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "addObject:", v28);

          objc_msgSend(v9, "objectAtIndexedSubscript:", v23);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "addObject:", v29);

        }
        ++v23;
      }
      while (v23 < objc_msgSend(v9, "count"));
    }
    v30 = objc_msgSend(v21, "copy");
    transitionDates = v20->_transitionDates;
    v20->_transitionDates = (NSArray *)v30;

    v32 = objc_msgSend(v22, "copy");
    values = v20->_values;
    v20->_values = (NSArray *)v32;

  }
  return v20;
}

- (NSArray)transitionDates
{
  return self->_transitionDates;
}

- (id)valueForDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  NSUInteger v21;

  v4 = a3;
  if (v4 && -[NSArray count](self->_transitionDates, "count") >= 2)
  {
    -[RETimeline startDate](self, "startDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[RETimeline endDate](self, "endDate");
    v7 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v7;
    if (v6 && v7)
    {
      v15 = objc_alloc(MEMORY[0x24BDD1508]);
      -[RETimeline startDate](self, "startDate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[RETimeline endDate](self, "endDate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)objc_msgSend(v15, "initWithStartDate:endDate:", v16, v17);

      if (objc_msgSend(v18, "containsDate:", v4)
        && (-[RETimeline endDate](self, "endDate"),
            v19 = (void *)objc_claimAutoreleasedReturnValue(),
            v20 = objc_msgSend(v4, "isEqual:", v19),
            v19,
            (v20 & 1) == 0))
      {
        v21 = -[NSArray indexOfObject:inSortedRange:options:usingComparator:](self->_transitionDates, "indexOfObject:inSortedRange:options:usingComparator:", v4, 0, -[NSArray count](self->_transitionDates, "count"), 256, &__block_literal_global_84);
        if (v21 == 0x7FFFFFFFFFFFFFFFLL)
          v21 = -[NSArray indexOfObject:inSortedRange:options:usingComparator:](self->_transitionDates, "indexOfObject:inSortedRange:options:usingComparator:", v4, 0, -[NSArray count](self->_transitionDates, "count"), 1024, &__block_literal_global_7_0)- 1;
        -[NSArray objectAtIndexedSubscript:](self->_values, "objectAtIndexedSubscript:", v21);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v5 = 0;
      }

    }
    else
    {
      RERaiseInternalException((void *)*MEMORY[0x24BDBCAB0], CFSTR("startDate(%@) and endDate(%@) must be non-nil."), v8, v9, v10, v11, v12, v13, (uint64_t)v6);
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t __27__RETimeline_valueForDate___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

uint64_t __27__RETimeline_valueForDate___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (NSDate)startDate
{
  void *v2;
  void *v3;

  -[RETimeline transitionDates](self, "transitionDates");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (NSDate)endDate
{
  void *v2;
  void *v3;

  -[RETimeline transitionDates](self, "transitionDates");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[RETimeline initWithTimeline:](+[RETimeline allocWithZone:](RETimeline, "allocWithZone:", a3), "initWithTimeline:", self);
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[RETimeline transitionDates](self, "transitionDates");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  RETimeline *v4;
  BOOL v5;

  v4 = (RETimeline *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[RETimeline isEqualToTimeline:](self, "isEqualToTimeline:", v4);
  }

  return v5;
}

- (BOOL)isEqualToTimeline:(id)a3
{
  RETimeline *v4;
  RETimeline *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  char v15;
  BOOL v16;

  v4 = (RETimeline *)a3;
  v5 = v4;
  if (self == v4)
  {
    v16 = 1;
  }
  else
  {
    if (v4)
    {
      -[RETimeline transitionDates](self, "transitionDates");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[RETimeline transitionDates](v5, "transitionDates");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "count");
      if (v8 == objc_msgSend(v7, "count"))
      {
        if (!objc_msgSend(v6, "count"))
        {
LABEL_12:
          v16 = 1;
LABEL_17:

          goto LABEL_18;
        }
        v9 = 0;
        while (1)
        {
          objc_msgSend(v6, "objectAtIndexedSubscript:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "objectAtIndexedSubscript:", v9);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v10, "isEqualToDate:", v11))
            break;
          -[RETimeline valueForDate:](self, "valueForDate:", v10);
          v12 = (id)objc_claimAutoreleasedReturnValue();
          -[RETimeline valueForDate:](v5, "valueForDate:", v11);
          v13 = (id)objc_claimAutoreleasedReturnValue();
          if (v12 == v13)
          {

          }
          else
          {
            v14 = v13;
            v15 = objc_msgSend(v12, "isEqual:", v13);

            if ((v15 & 1) == 0)
              goto LABEL_16;
          }
          if (++v9 >= (unint64_t)objc_msgSend(v6, "count"))
            goto LABEL_12;
        }

      }
LABEL_16:
      v16 = 0;
      goto LABEL_17;
    }
    v16 = 0;
  }
LABEL_18:

  return v16;
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  RETimeline *v12;
  id v13;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("<%@: %p>"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RETimeline transitionDates](self, "transitionDates");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __25__RETimeline_description__block_invoke;
  v10[3] = &unk_24CF8BEA0;
  v11 = v4;
  v12 = self;
  v5 = v3;
  v13 = v5;
  v6 = v4;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v10);
  v7 = v13;
  v8 = v5;

  return v8;
}

void __25__RETimeline_description__block_invoke(id *a1, void *a2, unint64_t a3)
{
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  if (objc_msgSend(a1[4], "count") - 1 > a3)
  {
    objc_msgSend(a1[4], "objectAtIndexedSubscript:", a3 + 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "valueForDate:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[6], "appendFormat:", CFSTR("\t%@ - %@ : %@\n"), v7, v5, v6);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_transitionDates, 0);
}

- (RETimeline)initWithTimeline:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  RETimeline *v18;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *, uint64_t);
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;

  v4 = a3;
  objc_msgSend(v4, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "transitionDates");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x24BDBCEB8];
    v8 = objc_msgSend(v6, "count");
    if (v8 <= 1)
      v9 = 1;
    else
      v9 = v8;
    objc_msgSend(v7, "arrayWithCapacity:", v9 - 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x24BDBCEB8];
    v12 = objc_msgSend(v6, "count");
    if (v12 <= 1)
      v13 = 1;
    else
      v13 = v12;
    objc_msgSend(v11, "arrayWithCapacity:", v13 - 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = MEMORY[0x24BDAC760];
    v21 = 3221225472;
    v22 = __51__RETimeline_REExtendedTimeline__initWithTimeline___block_invoke;
    v23 = &unk_24CF91438;
    v24 = v6;
    v25 = v4;
    v26 = v10;
    v27 = v14;
    v15 = v14;
    v16 = v10;
    v17 = v6;
    objc_msgSend(v17, "enumerateObjectsUsingBlock:", &v20);
    v18 = -[RETimeline initWithStartDate:values:durations:](self, "initWithStartDate:values:durations:", v5, v15, v16, v20, v21, v22, v23);

  }
  else
  {
    v18 = -[RETimeline init](self, "init");
  }

  return v18;
}

void __51__RETimeline_REExtendedTimeline__initWithTimeline___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "count") - 1 != a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3 + 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSinceDate:", v12);
    v7 = v6;
    objc_msgSend(v12, "dateByAddingTimeInterval:", v6 * 0.5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "valueForDate:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(void **)(a1 + 48);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v11);

    objc_msgSend(*(id *)(a1 + 56), "addObject:", v9);
  }

}

@end
