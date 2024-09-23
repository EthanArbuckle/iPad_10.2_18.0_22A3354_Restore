@implementation CompactMonthWeekDayData

+ (id)dayDataWithEventCount:(unint64_t)a3 dayType:(int64_t)a4
{
  CompactMonthWeekDayData *v6;

  v6 = objc_alloc_init(CompactMonthWeekDayData);
  -[CompactMonthWeekDayData setEventCount:](v6, "setEventCount:", a3);
  -[CompactMonthWeekDayData setDayType:](v6, "setDayType:", a4);
  return v6;
}

- (unint64_t)eventCount
{
  return self->_eventCount;
}

- (void)setEventCount:(unint64_t)a3
{
  self->_eventCount = a3;
}

- (int64_t)dayType
{
  return self->_dayType;
}

- (void)setDayType:(int64_t)a3
{
  self->_dayType = a3;
}

- (UIColor)dayTypeBadgeColor
{
  return self->_dayTypeBadgeColor;
}

- (void)setDayTypeBadgeColor:(id)a3
{
  objc_storeStrong((id *)&self->_dayTypeBadgeColor, a3);
}

- (NSString)dayTypeBadgeLocale
{
  return self->_dayTypeBadgeLocale;
}

- (void)setDayTypeBadgeLocale:(id)a3
{
  objc_storeStrong((id *)&self->_dayTypeBadgeLocale, a3);
}

- (NSArray)eventSummaryData
{
  return self->_eventSummaryData;
}

- (void)setEventSummaryData:(id)a3
{
  objc_storeStrong((id *)&self->_eventSummaryData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventSummaryData, 0);
  objc_storeStrong((id *)&self->_dayTypeBadgeLocale, 0);
  objc_storeStrong((id *)&self->_dayTypeBadgeColor, 0);
}

@end
