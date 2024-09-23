@implementation PaceFormatter

- (id)stringForObjectValue:(id)a3
{
  _TtC9SeymourUI13PaceFormatter *v4;
  _TtC9SeymourUI13PaceFormatter *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _OWORD v10[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_22BA812E8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v5 = self;
  }
  sub_22B1E5940((uint64_t)v10);
  v7 = v6;

  sub_22B0FB1DC((uint64_t)v10, &qword_255BB2140);
  if (!v7)
    return 0;
  v8 = (void *)sub_22BA8064C();
  swift_bridgeObjectRelease();
  return v8;
}

- (_TtC9SeymourUI13PaceFormatter)init
{
  return (_TtC9SeymourUI13PaceFormatter *)PaceFormatter.init()();
}

- (_TtC9SeymourUI13PaceFormatter)initWithCoder:(id)a3
{
  return (_TtC9SeymourUI13PaceFormatter *)PaceFormatter.init(coder:)(a3);
}

- (void).cxx_destruct
{

}

@end
