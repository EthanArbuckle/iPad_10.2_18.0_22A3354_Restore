@implementation PPTHostedPageGoToSeeAllTest

- (PPTHostedPageGoToSeeAllTest)initWithName:(id)a3 options:(id)a4 testDefinition:(id)a5 isMainTest:(BOOL)a6
{
  void *v9;
  objc_class *v10;
  objc_class *v11;
  uint64_t v12;

  v9 = (void *)static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v11 = v10;
  if (a4)
    a4 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a4, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
  v12 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a5, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
  return (PPTHostedPageGoToSeeAllTest *)sub_100239528(v9, v11, (uint64_t)a4, v12, a6);
}

- (void)startTest
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  PPTHostedPageGoToSeeAllTest *v6;
  uint64_t v7;
  PPTHostedPageGoToSeeAllTest *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;

  v3 = sub_10004CFD4(&qword_1009D3150);
  __chkstk_darwin(v3);
  v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = self;
  -[PPTBasicTest setTestTimeout:](v6, "setTestTimeout:", 30);
  -[PPTBasicTest setRunning:](v6, "setRunning:", 1);
  -[PPTBasicTest startPPTTest](v6, "startPPTTest");
  v7 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5, 1, 1, v7);
  type metadata accessor for MainActor(0);
  v8 = v6;
  v9 = static MainActor.shared.getter(v8);
  v10 = (_QWORD *)swift_allocObject(&unk_1008F5CC0, 40, 7);
  v10[2] = v9;
  v10[3] = &protocol witness table for MainActor;
  v10[4] = v8;
  v11 = sub_100488750((uint64_t)v5, (uint64_t)&unk_1009D4248, (uint64_t)v10);

  swift_release(v11);
}

- (PPTHostedPageGoToSeeAllTest)init
{
  PPTHostedPageGoToSeeAllTest *result;

  result = (PPTHostedPageGoToSeeAllTest *)_swift_stdlib_reportUnimplementedInitializer("Books.PPTHostedPageGoToSeeAllTest", 33, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
