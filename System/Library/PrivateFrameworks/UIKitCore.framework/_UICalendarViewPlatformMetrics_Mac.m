@implementation _UICalendarViewPlatformMetrics_Mac

- (_UICalendarViewPlatformMetrics_Mac)init
{
  _UICalendarViewPlatformMetrics_Mac *v2;
  _UICalendarViewPlatformMetrics_Mac *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UICalendarViewPlatformMetrics_Mac;
  v2 = -[_UICalendarViewPlatformMetrics init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[_UICalendarViewPlatformMetrics setDateViewCellBackgroundSize:](v2, "setDateViewCellBackgroundSize:", 32.0);
  return v3;
}

@end
