@implementation PGGraphCalendarUnitNode

- (PGGraphCalendarUnitNode)initWithCalendarUnit:(unint64_t)a3 value:(int64_t)a4
{
  __int16 v4;
  char v5;
  PGGraphCalendarUnitNode *result;
  objc_super v7;

  v4 = a4;
  v5 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PGGraphCalendarUnitNode;
  result = -[PGGraphNode init](&v7, sel_init);
  if (result)
  {
    *((_BYTE *)result + 34) = v5;
    *((_WORD *)result + 16) = v4;
  }
  return result;
}

- (PGGraphCalendarUnitNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  PGGraphCalendarUnitNode *v13;

  v7 = a3;
  v8 = a5;
  v9 = v7;
  if ((objc_msgSend(v9, "isEqualToString:", CFSTR("Day")) & 1) != 0)
  {
    v10 = 1;
  }
  else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("Month")) & 1) != 0)
  {
    v10 = 2;
  }
  else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("MonthDay")) & 1) != 0)
  {
    v10 = 3;
  }
  else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("Year")) & 1) != 0)
  {
    v10 = 4;
  }
  else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("WeekMonth")) & 1) != 0)
  {
    v10 = 5;
  }
  else
  {
    if ((objc_msgSend(v9, "isEqualToString:", CFSTR("WeekYear")) & 1) == 0)
    {

      __assert_rtn("-[PGGraphCalendarUnitNode initWithLabel:domain:properties:]", "PGGraphCalendarUnitNode.m", 101, "calendarUnit != PGGraphCalendarUnitUnitUnknown");
    }
    v10 = 6;
  }

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("name"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "integerValue");

  v13 = -[PGGraphCalendarUnitNode initWithCalendarUnit:value:](self, "initWithCalendarUnit:value:", v10, v12);
  return v13;
}

- (BOOL)hasProperties:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("name"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = !v6 || objc_msgSend(v6, "integerValue") == *((__int16 *)self + 16);

  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (id)propertyDictionary
{
  uint64_t v2;
  void *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6 = CFSTR("name");
  v2 = *((__int16 *)self + 16);
  if (v2 == -1)
  {
    v3 = &unk_1E84E4A90;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_DWORD)v2 != -1)

  return v4;
}

- (id)propertyForKey:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("name")))
  {
    if (*((__int16 *)self + 16) == -1)
      v5 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v5 = *((__int16 *)self + 16);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      v8 = 138412290;
      v9 = v4;
      _os_log_fault_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Unsupported property '%@' accessed on PGGraphCalendarUnitNode.", (uint8_t *)&v8, 0xCu);
    }
    v6 = 0;
  }

  return v6;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[PGGraphCalendarUnitNode label](self, "label");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (%d)"), v4, *((__int16 *)self + 16));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (id)label
{
  if (*((unsigned __int8 *)self + 34) - 1 > 5)
    return 0;
  else
    return *off_1E8431DC0[(*((_BYTE *)self + 34) - 1)];
}

- (unsigned)domain
{
  return 400;
}

- (MANodeFilter)uniquelyIdentifyingFilter
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0D42A50]);
  -[PGGraphCalendarUnitNode label](self, "label");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PGGraphCalendarUnitNode domain](self, "domain");
  -[PGGraphCalendarUnitNode propertyDictionary](self, "propertyDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithLabel:domain:properties:", v4, v5, v6);

  return (MANodeFilter *)v7;
}

- (id)name
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), *((__int16 *)self + 16));
}

- (unint64_t)featureType
{
  uint64_t v3;
  uint64_t v5;

  v3 = *((unsigned __int8 *)self + 34);
  if (+[PGGraphYearNodeCollection calendarUnit](PGGraphYearNodeCollection, "calendarUnit") == v3)
    return 1;
  v5 = *((unsigned __int8 *)self + 34);
  if (+[PGGraphMonthDayNodeCollection calendarUnit](PGGraphMonthDayNodeCollection, "calendarUnit") == v5)
    return 29;
  else
    return 0;
}

- (NSString)featureIdentifier
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGGraphCalendarUnitNode label](self, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@|%@|%d"), v5, v6, *((__int16 *)self + 16));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (id)collection
{
  return -[MANodeCollection initWithNode:]([PGGraphCalendarUnitNodeCollection alloc], "initWithNode:", self);
}

- (int64_t)calendarUnitValue
{
  return *((__int16 *)self + 16);
}

+ (id)propertiesForMonth:(int64_t)a3 day:(int64_t)a4
{
  return (id)objc_msgSend(a1, "propertiesWithCalendarUnitValue:", objc_msgSend(a1, "encodedMonthDayForMonth:day:", a3, a4));
}

+ (id)propertiesWithCalendarUnitValue:(int64_t)a3
{
  void *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6 = CFSTR("name");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (PGCalendarUnitMonthDayValue)monthDayValueForMonthDayNodeCalendarUnitValue:(int64_t)a3
{
  int64_t v3;
  int64_t v4;
  PGCalendarUnitMonthDayValue result;

  v3 = a3 / 100;
  v4 = a3 % 100;
  result.var1 = v4;
  result.var0 = v3;
  return result;
}

+ (PGCalendarUnitMonthDayValue)monthDayValueForMonthDayNode:(id)a3
{
  int64_t v3;
  int64_t v4;
  PGCalendarUnitMonthDayValue result;

  v3 = objc_msgSend(a1, "monthDayValueForMonthDayNodeCalendarUnitValue:", objc_msgSend(a3, "calendarUnitValue"));
  result.var1 = v4;
  result.var0 = v3;
  return result;
}

+ (int64_t)encodedMonthDayForMonth:(int64_t)a3 day:(int64_t)a4
{
  return a4 + 100 * a3;
}

+ (MANodeFilter)dayFilter
{
  return (MANodeFilter *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A50]), "initWithLabel:domain:", CFSTR("Day"), 400);
}

+ (MANodeFilter)monthFilter
{
  return (MANodeFilter *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A50]), "initWithLabel:domain:", CFSTR("Month"), 400);
}

+ (MANodeFilter)monthDayFilter
{
  return (MANodeFilter *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A50]), "initWithLabel:domain:", CFSTR("MonthDay"), 400);
}

+ (MANodeFilter)yearFilter
{
  return (MANodeFilter *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A50]), "initWithLabel:domain:", CFSTR("Year"), 400);
}

+ (MANodeFilter)weekOfMonthFilter
{
  return (MANodeFilter *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A50]), "initWithLabel:domain:", CFSTR("WeekMonth"), 400);
}

+ (MANodeFilter)weekOfYearFilter
{
  return (MANodeFilter *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A50]), "initWithLabel:domain:", CFSTR("WeekYear"), 400);
}

@end
