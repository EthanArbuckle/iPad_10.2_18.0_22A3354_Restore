@implementation CRLOneEuroFilterPoint

- (CGPoint)currValue
{
  double *v3;
  double v4;
  double *v5;
  double v6;
  double v7;
  uint64_t v8;
  _BYTE v9[24];
  CGPoint result;

  v3 = (double *)(*(char **)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform21CRLOneEuroFilterPoint_xFilter)
                + *(_QWORD *)((**(_QWORD **)((char *)&self->super.isa
                                           + OBJC_IVAR____TtC8Freeform21CRLOneEuroFilterPoint_xFilter) & swift_isaMask)
                            + 0x98));
  swift_beginAccess(v3, v9, 0, 0);
  v4 = *v3;
  v5 = (double *)(*(char **)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform21CRLOneEuroFilterPoint_yFilter)
                + *(_QWORD *)((swift_isaMask & **(_QWORD **)((char *)&self->super.isa
                                                           + OBJC_IVAR____TtC8Freeform21CRLOneEuroFilterPoint_yFilter))
                            + 0x98));
  swift_beginAccess(v5, &v8, 0, 0);
  v6 = *v5;
  v7 = v4;
  result.y = v6;
  result.x = v7;
  return result;
}

- (CGPoint)prevValue
{
  double *v3;
  double v4;
  double *v5;
  double v6;
  double v7;
  uint64_t v8;
  _BYTE v9[24];
  CGPoint result;

  v3 = (double *)(*(char **)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform21CRLOneEuroFilterPoint_xFilter)
                + *(_QWORD *)((**(_QWORD **)((char *)&self->super.isa
                                           + OBJC_IVAR____TtC8Freeform21CRLOneEuroFilterPoint_xFilter) & swift_isaMask)
                            + 0xA0));
  swift_beginAccess(v3, v9, 0, 0);
  v4 = *v3;
  v5 = (double *)(*(char **)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform21CRLOneEuroFilterPoint_yFilter)
                + *(_QWORD *)((swift_isaMask & **(_QWORD **)((char *)&self->super.isa
                                                           + OBJC_IVAR____TtC8Freeform21CRLOneEuroFilterPoint_yFilter))
                            + 0xA0));
  swift_beginAccess(v5, &v8, 0, 0);
  v6 = *v5;
  v7 = v4;
  result.y = v6;
  result.x = v7;
  return result;
}

- (_TtC8Freeform21CRLOneEuroFilterPoint)initWithFreq:(double)a3 mincutoff:(double)a4 beta:(double)a5 dcutoff:(double)a6
{
  objc_class *v11;
  id v12;
  _TtC8Freeform21CRLOneEuroFilterPoint *v13;
  id v14;
  objc_super v16;

  v11 = (objc_class *)sub_1004B804C(qword_1013E83E0);
  v12 = objc_allocWithZone(v11);
  v13 = self;
  *(Class *)((char *)&v13->super.isa + OBJC_IVAR____TtC8Freeform21CRLOneEuroFilterPoint_xFilter) = (Class)sub_10061C09C(a3, a4, a5, a6);
  v14 = objc_allocWithZone(v11);
  *(Class *)((char *)&v13->super.isa + OBJC_IVAR____TtC8Freeform21CRLOneEuroFilterPoint_yFilter) = (Class)sub_10061C09C(a3, a4, a5, a6);

  v16.receiver = v13;
  v16.super_class = (Class)type metadata accessor for CRLOneEuroFilterPoint();
  return -[CRLOneEuroFilterPoint init](&v16, "init");
}

- (void)updateParamsWithFreq:(double)a3 mincutoff:(double)a4 beta:(double)a5 dcutoff:(double)a6
{
  _TtC8Freeform21CRLOneEuroFilterPoint *v10;

  v10 = self;
  CRLOneEuroFilterPoint.updateParams(freq:mincutoff:beta:dcutoff:)(a3, a4, a5, a6);

}

- (CGPoint)filterWithValue:(CGPoint)a3 timestamp:(double)a4
{
  double y;
  double x;
  _TtC8Freeform21CRLOneEuroFilterPoint *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v7 = self;
  v8 = CRLOneEuroFilterPoint.filter(value:timestamp:)(x, y, a4);
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.y = v12;
  result.x = v11;
  return result;
}

- (_TtC8Freeform21CRLOneEuroFilterPoint)init
{
  _TtC8Freeform21CRLOneEuroFilterPoint *result;

  result = (_TtC8Freeform21CRLOneEuroFilterPoint *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLOneEuroFilterPoint", 30, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
