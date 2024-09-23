@implementation PGTripLocationScore

- (PGGraphNamedLocationNode)locationNode
{
  return (PGGraphNamedLocationNode *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                             + OBJC_IVAR___PGTripLocationScore_locationNode));
}

- (double)score
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR___PGTripLocationScore__score);
}

- (PGTripLocationScore)initWithLocationNode:(id)a3 score:(double)a4 momentNodes:(id)a5
{
  objc_class *v8;
  id v9;
  objc_super v11;

  sub_1CA24EEC0(0, (unint64_t *)&qword_1EF94AB50);
  v8 = (objc_class *)sub_1CA85B7B0();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___PGTripLocationScore_locationNode) = (Class)a3;
  *(double *)((char *)&self->super.isa + OBJC_IVAR___PGTripLocationScore__score) = a4;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___PGTripLocationScore_momentNodes) = v8;
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for TripLocationScore();
  v9 = a3;
  return -[PGTripLocationScore init](&v11, sel_init);
}

- (NSString)description
{
  return (NSString *)sub_1CA4434A4(self, (uint64_t)a2, (void (*)(void))sub_1CA4387AC);
}

- (PGTripLocationScore)init
{
  PGTripLocationScore *result;

  result = (PGTripLocationScore *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
}

@end
