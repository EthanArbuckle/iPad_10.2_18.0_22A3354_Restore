@implementation PeopleUserDefaults

- (_TtC6People18PeopleUserDefaults)initWithSuiteName:(id)a3
{
  void *v4;
  _TtC6People18PeopleUserDefaults *v5;
  objc_super v7;

  if (a3)
  {
    sub_1C0747930();
    v4 = (void *)sub_1C074790C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for PeopleUserDefaults();
  v5 = -[PeopleUserDefaults initWithSuiteName:](&v7, sel_initWithSuiteName_, v4);

  if (v5)
  return v5;
}

@end
