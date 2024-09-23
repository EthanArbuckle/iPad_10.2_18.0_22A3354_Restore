@implementation AlarmRepeatSchedule

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AlarmRepeatSchedule)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if (a3)
  {
    v6 = sub_24738A58C();
    v8 = v7;
  }
  else
  {
    v6 = 0;
    v8 = 0;
  }
  v9 = sub_24738A58C();
  v11 = v10;
  if (a5)
  {
    v12 = sub_24738A58C();
    v14 = v13;
  }
  else
  {
    v12 = 0;
    v14 = 0;
  }
  return (AlarmRepeatSchedule *)AlarmRepeatSchedule.init(identifier:display:pronunciationHint:)(v6, v8, v9, v11, v12, v14);
}

- (AlarmRepeatSchedule)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for AlarmRepeatSchedule();
  return -[AlarmRepeatSchedule initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
