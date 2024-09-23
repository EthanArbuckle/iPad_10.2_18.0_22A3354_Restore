@implementation BoxScorerCompatible

- (_TtC18VisualIntelligence19BoxScorerCompatible)initWithGranularity:(int64_t)a3 xMean:(double)a4 yMean:(double)a5 std:(double)a6
{
  _TtC18VisualIntelligence19BoxScorerCompatible *v11;
  objc_super v13;

  type metadata accessor for BoxScorer();
  swift_allocObject();
  v11 = self;
  *(Class *)((char *)&v11->super.isa + OBJC_IVAR____TtC18VisualIntelligence19BoxScorerCompatible_boxScorer) = (Class)sub_1D47E39E8(a3, a4, a5, a6);

  v13.receiver = v11;
  v13.super_class = (Class)type metadata accessor for BoxScorerCompatible();
  return -[BoxScorerCompatible init](&v13, sel_init);
}

- (double)scoreWithXTopLeft:(double)a3 yTopLeft:(double)a4 width:(double)a5 height:(double)a6
{
  _TtC18VisualIntelligence19BoxScorerCompatible *v10;
  double v11;
  double v12;

  v10 = self;
  sub_1D47E3B50(a3, a4, a5, a6);
  v12 = v11;

  return v12;
}

- (_TtC18VisualIntelligence19BoxScorerCompatible)init
{
  _TtC18VisualIntelligence19BoxScorerCompatible *result;

  result = (_TtC18VisualIntelligence19BoxScorerCompatible *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
}

@end
