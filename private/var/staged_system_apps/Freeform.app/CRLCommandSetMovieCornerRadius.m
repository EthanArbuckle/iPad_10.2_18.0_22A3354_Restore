@implementation CRLCommandSetMovieCornerRadius

- (NSUUID)id
{
  return (NSUUID *)UUID._bridgeToObjectiveC()().super.isa;
}

- (float)cornerRadius
{
  return *(float *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC8Freeform30CRLCommandSetMovieCornerRadius_cornerRadius);
}

- (_TtC8Freeform30CRLCommandSetMovieCornerRadius)initWithId:(id)a3 cornerRadius:(float)a4
{
  return (_TtC8Freeform30CRLCommandSetMovieCornerRadius *)sub_1008A10A8((char *)self, a4, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC8Freeform30CRLCommandSetMovieCornerRadius_id, &OBJC_IVAR____TtC8Freeform30CRLCommandSetMovieCornerRadius_cornerRadius, type metadata accessor for CRLCommandSetMovieCornerRadius);
}

- (_TtC8Freeform30CRLCommandSetMovieCornerRadius)initWithMovieItem:(id)a3 cornerRadius:(float)a4
{
  return (_TtC8Freeform30CRLCommandSetMovieCornerRadius *)sub_1008A11A4(self, a4, (uint64_t)a2, (char *)a3, (SEL *)&selRef_initWithId_cornerRadius_);
}

- (_TtC8Freeform30CRLCommandSetMovieCornerRadius)init
{
  _TtC8Freeform30CRLCommandSetMovieCornerRadius *result;

  result = (_TtC8Freeform30CRLCommandSetMovieCornerRadius *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLCommandSetMovieCornerRadius", 39, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1008A1A60((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8Freeform30CRLCommandSetMovieCornerRadius_id);
}

@end
