@implementation BriefOneHourIsSixtyMinDateComponentsFormatter

- (_TtC13SleepHealthUI45BriefOneHourIsSixtyMinDateComponentsFormatter)init
{
  _TtC13SleepHealthUI45BriefOneHourIsSixtyMinDateComponentsFormatter *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for BriefOneHourIsSixtyMinDateComponentsFormatter();
  v2 = -[ForceDoubleZerosDateComponentsFormatter init](&v4, sel_init);
  -[NSDateComponentsFormatter setZeroFormattingBehavior:](v2, sel_setZeroFormattingBehavior_, 0x10000);
  -[NSDateComponentsFormatter setUnitsStyle:](v2, sel_setUnitsStyle_, 5);

  return v2;
}

- (_TtC13SleepHealthUI45BriefOneHourIsSixtyMinDateComponentsFormatter)initWithCoder:(id)a3
{
  _TtC13SleepHealthUI45BriefOneHourIsSixtyMinDateComponentsFormatter *result;

  result = (_TtC13SleepHealthUI45BriefOneHourIsSixtyMinDateComponentsFormatter *)sub_1A9CE8A84();
  __break(1u);
  return result;
}

- (id)stringFromTimeInterval:(double)a3
{
  uint64_t v4;
  _TtC13SleepHealthUI45BriefOneHourIsSixtyMinDateComponentsFormatter *v5;
  id v6;
  void *v7;
  void *v8;
  objc_super v10;

  if (a3 > 3600.0)
    v4 = 96;
  else
    v4 = 64;
  v5 = self;
  -[NSDateComponentsFormatter setAllowedUnits:](v5, sel_setAllowedUnits_, v4);
  v10.receiver = v5;
  v10.super_class = (Class)type metadata accessor for BriefOneHourIsSixtyMinDateComponentsFormatter();
  v6 = -[ForceDoubleZerosDateComponentsFormatter stringFromTimeInterval:](&v10, sel_stringFromTimeInterval_, a3);
  if (v6)
  {
    v7 = v6;
    sub_1A9CE82E0();

    v8 = (void *)sub_1A9CE82B0();
    swift_bridgeObjectRelease();
  }
  else
  {

    v8 = 0;
  }
  return v8;
}

- (id)stringFromDateComponents:(id)a3
{
  return sub_1A9C0E4E8(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_1A9C0E074);
}

@end
