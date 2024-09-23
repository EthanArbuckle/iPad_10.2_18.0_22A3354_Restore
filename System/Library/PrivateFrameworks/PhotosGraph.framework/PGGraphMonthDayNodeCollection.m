@implementation PGGraphMonthDayNodeCollection

- (PGGraphPersonNodeCollection)birthdayPersonNodes
{
  void *v3;
  void *v4;
  void *v5;

  +[PGGraphBirthdayMonthDayEdge filter](PGGraphBirthdayMonthDayEdge, "filter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inRelation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphPersonNodeCollection, "nodesRelatedToNodes:withRelation:", self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphPersonNodeCollection *)v5;
}

- (PGGraphPersonNodeCollection)anniversaryPersonNodes
{
  void *v3;
  void *v4;
  void *v5;

  +[PGGraphAnniversaryMonthDayEdge filter](PGGraphAnniversaryMonthDayEdge, "filter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inRelation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphPersonNodeCollection, "nodesRelatedToNodes:withRelation:", self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphPersonNodeCollection *)v5;
}

+ (unint64_t)calendarUnit
{
  return 3;
}

+ (id)monthDayNodesForMonth:(int64_t)a3 day:(int64_t)a4 inGraph:(id)a5
{
  id v8;
  void *v9;

  v8 = a5;
  objc_msgSend(a1, "calendarUnitNodesForUnitValue:inGraph:", +[PGGraphCalendarUnitNode encodedMonthDayForMonth:day:](PGGraphCalendarUnitNode, "encodedMonthDayForMonth:day:", a3, a4), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)monthDayNodesForLocalDate:(id)a3 inGraph:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (void *)MEMORY[0x1E0D4B130];
  v7 = a4;
  objc_msgSend(v6, "components:fromDate:", 24, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "calendarUnitNodesForUnitValue:inGraph:", +[PGGraphCalendarUnitNode encodedMonthDayForMonth:day:](PGGraphCalendarUnitNode, "encodedMonthDayForMonth:day:", objc_msgSend(v8, "month"), objc_msgSend(v8, "day")), v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
