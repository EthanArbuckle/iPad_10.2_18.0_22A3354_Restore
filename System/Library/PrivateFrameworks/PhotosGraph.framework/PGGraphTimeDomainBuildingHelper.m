@implementation PGGraphTimeDomainBuildingHelper

- (PGGraphTimeDomainBuildingHelper)initWithGraph:(id)a3
{
  id v5;
  PGGraphTimeDomainBuildingHelper *v6;
  PGGraphTimeDomainBuildingHelper *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *calendarUnitNodeByValueByUnit;
  NSMutableDictionary *v10;
  NSMutableDictionary *seasonNodeBySeasonName;
  NSMutableDictionary *v12;
  NSMutableDictionary *dayOfWeekNodeByDayOfWeek;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PGGraphTimeDomainBuildingHelper;
  v6 = -[PGGraphTimeDomainBuildingHelper init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_graph, a3);
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    calendarUnitNodeByValueByUnit = v7->_calendarUnitNodeByValueByUnit;
    v7->_calendarUnitNodeByValueByUnit = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    seasonNodeBySeasonName = v7->_seasonNodeBySeasonName;
    v7->_seasonNodeBySeasonName = v10;

    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    dayOfWeekNodeByDayOfWeek = v7->_dayOfWeekNodeByDayOfWeek;
    v7->_dayOfWeekNodeByDayOfWeek = v12;

  }
  return v7;
}

- (id)calendarUnitNodeForCalendarUnit:(unint64_t)a3 value:(int64_t)a4
{
  NSMutableDictionary *calendarUnitNodeByValueByUnit;
  void *v8;
  id v9;
  NSMutableDictionary *v10;
  void *v11;
  void *v12;
  PGGraphCalendarUnitNode *v13;
  void *v14;

  calendarUnitNodeByValueByUnit = self->_calendarUnitNodeByValueByUnit;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](calendarUnitNodeByValueByUnit, "objectForKeyedSubscript:", v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v10 = self->_calendarUnitNodeByValueByUnit;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v9, v11);

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v12);
  v13 = (PGGraphCalendarUnitNode *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    v13 = -[PGGraphCalendarUnitNode initWithCalendarUnit:value:]([PGGraphCalendarUnitNode alloc], "initWithCalendarUnit:value:", a3, a4);
    -[MAGraph addUniqueNode:didInsert:](self->_graph, "addUniqueNode:didInsert:", v13, 0);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v13, v14);

  }
  return v13;
}

- (id)seasonNodeForSeasonName:(id)a3
{
  id v4;
  PGGraphSeasonNode *v5;

  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_seasonNodeBySeasonName, "objectForKeyedSubscript:", v4);
  v5 = (PGGraphSeasonNode *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v5 = -[PGGraphSeasonNode initWithName:]([PGGraphSeasonNode alloc], "initWithName:", v4);
    -[MAGraph addUniqueNode:didInsert:](self->_graph, "addUniqueNode:didInsert:", v5, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_seasonNodeBySeasonName, "setObject:forKeyedSubscript:", v5, v4);
  }

  return v5;
}

- (id)dayOfWeekNodeForDayOfWeek:(int64_t)a3
{
  NSMutableDictionary *dayOfWeekNodeByDayOfWeek;
  void *v6;
  PGGraphDayOfWeekNode *v7;
  NSMutableDictionary *v8;
  void *v9;

  dayOfWeekNodeByDayOfWeek = self->_dayOfWeekNodeByDayOfWeek;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](dayOfWeekNodeByDayOfWeek, "objectForKeyedSubscript:", v6);
  v7 = (PGGraphDayOfWeekNode *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v7 = -[PGGraphDayOfWeekNode initWithDayOfWeek:]([PGGraphDayOfWeekNode alloc], "initWithDayOfWeek:", a3);
    -[MAGraph addUniqueNode:didInsert:](self->_graph, "addUniqueNode:didInsert:", v7, 0);
    v8 = self->_dayOfWeekNodeByDayOfWeek;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v7, v9);

  }
  return v7;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<PGGraphTimeDomainBuildingHelper: %@, %@, %@>"), self->_calendarUnitNodeByValueByUnit, self->_seasonNodeBySeasonName, self->_dayOfWeekNodeByDayOfWeek);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dayOfWeekNodeByDayOfWeek, 0);
  objc_storeStrong((id *)&self->_seasonNodeBySeasonName, 0);
  objc_storeStrong((id *)&self->_calendarUnitNodeByValueByUnit, 0);
  objc_storeStrong((id *)&self->_graph, 0);
}

@end
