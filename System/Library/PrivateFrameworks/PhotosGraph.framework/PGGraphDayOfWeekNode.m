@implementation PGGraphDayOfWeekNode

- (PGGraphDayOfWeekNode)initWithDayOfWeek:(int64_t)a3
{
  PGGraphDayOfWeekNode *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PGGraphDayOfWeekNode;
  result = -[PGGraphNode init](&v5, sel_init);
  if (result)
    result->_dayOfWeek = a3;
  return result;
}

- (PGGraphDayOfWeekNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5
{
  void *v6;
  PGGraphDayOfWeekNode *v7;

  objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("name"), a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PGGraphDayOfWeekNode initWithDayOfWeek:](self, "initWithDayOfWeek:", objc_msgSend((id)objc_opt_class(), "dayOfWeekForName:", v6));

  return v7;
}

- (BOOL)hasProperties:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    objc_msgSend((id)objc_opt_class(), "nameForDayOfWeek:", self->_dayOfWeek);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("name"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = !v7 || objc_msgSend(v7, "isEqual:", v6);

  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (id)propertyDictionary
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "nameForDayOfWeek:", self->_dayOfWeek);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = CFSTR("name");
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)description
{
  void *v2;
  void *v3;

  objc_msgSend((id)objc_opt_class(), "nameForDayOfWeek:", self->_dayOfWeek);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PGGraphDayOfWeekNode (%@)"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)label
{
  __CFString *v2;

  v2 = CFSTR("DayOfWeek");
  return CFSTR("DayOfWeek");
}

- (unsigned)domain
{
  return 400;
}

- (MANodeFilter)uniquelyIdentifyingFilter
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0D42A50]);
  -[PGGraphDayOfWeekNode propertyDictionary](self, "propertyDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithLabel:domain:properties:", CFSTR("DayOfWeek"), 400, v4);

  return (MANodeFilter *)v5;
}

- (NSString)name
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "nameForDayOfWeek:", self->_dayOfWeek);
}

- (int64_t)dayOfWeek
{
  int64_t result;
  void *v4;

  result = self->_dayOfWeek;
  if (!result)
  {
    -[PGGraphDayOfWeekNode name](self, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    self->_dayOfWeek = objc_msgSend((id)objc_opt_class(), "dayOfWeekForName:", v4);

    return self->_dayOfWeek;
  }
  return result;
}

+ (id)filter
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A50]), "initWithLabel:domain:", CFSTR("DayOfWeek"), 400);
}

+ (int64_t)dayOfWeekForName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int64_t v6;

  v3 = a3;
  if (dayOfWeekForName__onceToken != -1)
    dispatch_once(&dayOfWeekForName__onceToken, &__block_literal_global_6932);
  objc_msgSend((id)dayOfWeekForName__dayOfWeekByDescription, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "integerValue");
  else
    v6 = -1;

  return v6;
}

+ (id)nameForDayOfWeek:(int64_t)a3
{
  __CFString *v4;

  if (nameForDayOfWeek__onceToken != -1)
    dispatch_once(&nameForDayOfWeek__onceToken, &__block_literal_global_27);
  if ((unint64_t)a3 > 7)
  {
    v4 = CFSTR("UnknownDayOfWeek");
  }
  else
  {
    objc_msgSend((id)nameForDayOfWeek__descriptionByDayOfWeekIndex, "objectAtIndexedSubscript:", a3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

void __41__PGGraphDayOfWeekNode_nameForDayOfWeek___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[9];

  v2[8] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("UnknownDayOfWeek");
  v2[1] = CFSTR("Sunday");
  v2[2] = CFSTR("Monday");
  v2[3] = CFSTR("Tuesday");
  v2[4] = CFSTR("Wednesday");
  v2[5] = CFSTR("Thursday");
  v2[6] = CFSTR("Friday");
  v2[7] = CFSTR("Saturday");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)nameForDayOfWeek__descriptionByDayOfWeekIndex;
  nameForDayOfWeek__descriptionByDayOfWeekIndex = v0;

}

void __41__PGGraphDayOfWeekNode_dayOfWeekForName___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[7];
  _QWORD v3[8];

  v3[7] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("Monday");
  v2[1] = CFSTR("Tuesday");
  v3[0] = &unk_1E84E2E10;
  v3[1] = &unk_1E84E2E28;
  v2[2] = CFSTR("Wednesday");
  v2[3] = CFSTR("Thursday");
  v3[2] = &unk_1E84E2E40;
  v3[3] = &unk_1E84E2E58;
  v2[4] = CFSTR("Friday");
  v2[5] = CFSTR("Saturday");
  v3[4] = &unk_1E84E2E70;
  v3[5] = &unk_1E84E2E88;
  v2[6] = CFSTR("Sunday");
  v3[6] = &unk_1E84E2EA0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 7);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)dayOfWeekForName__dayOfWeekByDescription;
  dayOfWeekForName__dayOfWeekByDescription = v0;

}

@end
