@implementation REConstants

+ (double)headerHeight
{
  return sub_100479050((uint64_t)a1, (uint64_t)a2, &qword_1009CE5A0, (uint64_t)&static REConstants.headerHeight, (uint64_t)sub_100478F3C);
}

+ (double)sampleHeaderHeight
{
  return sub_100479050((uint64_t)a1, (uint64_t)a2, &qword_1009CE5A8, (uint64_t)&static REConstants.sampleHeaderHeight, (uint64_t)sub_100478FC4);
}

- (_TtC5Books11REConstants)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for REConstants();
  return -[REConstants init](&v3, "init");
}

@end
