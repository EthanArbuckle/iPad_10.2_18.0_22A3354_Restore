@implementation PGGraphCalendarUnitEdge

- (PGGraphCalendarUnitEdge)initWithCalendarUnit:(unint64_t)a3 fromDateNode:(id)a4 toCalendarUnitNode:(id)a5
{
  id v8;
  id v9;
  void *v10;
  PGGraphCalendarUnitEdge *v11;
  PGGraphCalendarUnitEdge *v12;
  objc_super v14;

  v8 = a4;
  v9 = a5;
  if (!a3)
    __assert_rtn("-[PGGraphCalendarUnitEdge initWithCalendarUnit:fromDateNode:toCalendarUnitNode:]", "PGGraphCalendarUnitEdge.m", 53, "calendarUnit != PGGraphCalendarUnitUnitUnknown");
  v10 = v9;
  v14.receiver = self;
  v14.super_class = (Class)PGGraphCalendarUnitEdge;
  v11 = -[PGGraphEdge initWithSourceNode:targetNode:](&v14, sel_initWithSourceNode_targetNode_, v8, v9);
  v12 = v11;
  if (v11)
    *((_BYTE *)v11 + 40) = a3;

  return v12;
}

- (PGGraphCalendarUnitEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  PGGraphCalendarUnitEdge *v14;

  v10 = a3;
  v11 = a5;
  v12 = a4;
  if ((objc_msgSend(v10, "isEqualToString:", CFSTR("DAY")) & 1) != 0)
  {
    v13 = 1;
  }
  else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("MONTH")) & 1) != 0)
  {
    v13 = 2;
  }
  else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("MONTH_DAY")) & 1) != 0)
  {
    v13 = 3;
  }
  else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("YEAR")) & 1) != 0)
  {
    v13 = 4;
  }
  else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("WEEKMONTH")) & 1) != 0)
  {
    v13 = 5;
  }
  else if (objc_msgSend(v10, "isEqualToString:", CFSTR("WEEKYEAR")))
  {
    v13 = 6;
  }
  else
  {
    v13 = 0;
  }

  v14 = -[PGGraphCalendarUnitEdge initWithCalendarUnit:fromDateNode:toCalendarUnitNode:](self, "initWithCalendarUnit:fromDateNode:toCalendarUnitNode:", v13, v12, v11);
  return v14;
}

- (id)label
{
  if (*((unsigned __int8 *)self + 40) - 1 > 5)
    return 0;
  else
    return *off_1E8431DF0[(*((_BYTE *)self + 40) - 1)];
}

- (unsigned)domain
{
  return 400;
}

+ (MAEdgeFilter)dayFilter
{
  return (MAEdgeFilter *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A00]), "initWithLabel:domain:", CFSTR("DAY"), 400);
}

+ (MAEdgeFilter)monthFilter
{
  return (MAEdgeFilter *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A00]), "initWithLabel:domain:", CFSTR("MONTH"), 400);
}

+ (MAEdgeFilter)monthDayFilter
{
  return (MAEdgeFilter *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A00]), "initWithLabel:domain:", CFSTR("MONTH_DAY"), 400);
}

+ (MAEdgeFilter)yearFilter
{
  return (MAEdgeFilter *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A00]), "initWithLabel:domain:", CFSTR("YEAR"), 400);
}

+ (MAEdgeFilter)weekOfYearFilter
{
  return (MAEdgeFilter *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A00]), "initWithLabel:domain:", CFSTR("WEEKYEAR"), 400);
}

+ (MAEdgeFilter)weekOfMonthFilter
{
  return (MAEdgeFilter *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A00]), "initWithLabel:domain:", CFSTR("WEEKMONTH"), 400);
}

+ (MAEdgeFilter)dayOfWeekFilter
{
  return (MAEdgeFilter *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A00]), "initWithLabel:domain:", CFSTR("DAYOFWEEK"), 400);
}

@end
