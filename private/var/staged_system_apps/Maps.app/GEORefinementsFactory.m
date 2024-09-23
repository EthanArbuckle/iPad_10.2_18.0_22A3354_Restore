@implementation GEORefinementsFactory

+ (id)barResultRefinementsWith:(id)a3
{
  id v3;
  _QWORD *v4;
  NSArray v5;

  v3 = a3;
  v4 = sub_1001AF2E8((uint64_t)v3);

  if (v4)
  {
    sub_10000E4BC(0, &qword_10149A658, GEOResultRefinement_ptr);
    v5.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v4);
  }
  else
  {
    v5.super.isa = 0;
  }
  return v5.super.isa;
}

+ (id)allRefinementsSectionsWith:(id)a3
{
  id v4;
  uint64_t v5;
  NSArray v6;

  swift_getObjCClassMetadata(a1);
  v4 = a3;
  v5 = sub_1001AE180(v4);

  if (v5)
  {
    sub_10000E4BC(0, &qword_10149B2B8, GEOResultRefinementSection_ptr);
    v6.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v5);
  }
  else
  {
    v6.super.isa = 0;
  }
  return v6.super.isa;
}

+ (id)barMultiSelectResultRefinementsWith:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  sub_1001AFA18(v3);
  v5 = v4;

  return v5;
}

+ (id)updatedOpenOptionResultRefinementWith:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = sub_1001AF498(v3);

  return v4;
}

- (_TtC4Maps21GEORefinementsFactory)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for GEORefinementsFactory();
  return -[GEORefinementsFactory init](&v3, "init");
}

@end
