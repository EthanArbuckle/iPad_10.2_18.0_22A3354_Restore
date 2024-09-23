@implementation AbbreviatedOneHourIsSixtyMinDateComponentsFormatter

- (_TtC13SleepHealthUI51AbbreviatedOneHourIsSixtyMinDateComponentsFormatter)init
{
  _TtC13SleepHealthUI51AbbreviatedOneHourIsSixtyMinDateComponentsFormatter *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for AbbreviatedOneHourIsSixtyMinDateComponentsFormatter();
  v2 = -[BriefOneHourIsSixtyMinDateComponentsFormatter init](&v4, sel_init);
  -[NSDateComponentsFormatter setUnitsStyle:](v2, sel_setUnitsStyle_, 1);
  -[NSDateComponentsFormatter setAllowedUnits:](v2, sel_setAllowedUnits_, 96);

  return v2;
}

@end
