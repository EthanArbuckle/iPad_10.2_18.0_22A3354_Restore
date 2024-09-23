@implementation DOCPinchZoomTestParameters

- (NSString)testName
{
  uint64_t v2;
  NSString v3;

  v2 = *(_QWORD *)&self->testName[OBJC_IVAR____TtC5Files26DOCPinchZoomTestParameters_testName];
  if (v2)
  {
    swift_bridgeObjectRetain(*(_QWORD *)&self->testName[OBJC_IVAR____TtC5Files26DOCPinchZoomTestParameters_testName]);
    v3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v2);
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (void)setTestName:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;

  if (a3)
  {
    v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  }
  else
  {
    v4 = 0;
    v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR____TtC5Files26DOCPinchZoomTestParameters_testName);
  v7 = *(_QWORD *)&self->testName[OBJC_IVAR____TtC5Files26DOCPinchZoomTestParameters_testName];
  *v6 = v4;
  v6[1] = v5;
  swift_bridgeObjectRelease(v7);
}

- (id)completionHandler
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  _QWORD v6[5];
  uint64_t v7;

  if (!*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files26DOCPinchZoomTestParameters_completionHandler))
    return 0;
  v2 = *(_QWORD *)&self->testName[OBJC_IVAR____TtC5Files26DOCPinchZoomTestParameters_completionHandler];
  v6[4] = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files26DOCPinchZoomTestParameters_completionHandler);
  v7 = v2;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 1107296256;
  v6[2] = sub_10004A82C;
  v6[3] = &unk_1005EB4A8;
  v3 = _Block_copy(v6);
  v4 = v7;
  swift_retain();
  swift_release(v4);
  return v3;
}

- (void)setCompletionHandler:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t (*v6)();
  uint64_t (**v7)();
  uint64_t v8;
  uint64_t v9;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v4 = (_QWORD *)swift_allocObject(&unk_1005EB490, 24, 7);
    v4[2] = v5;
    v6 = sub_1000E62C0;
  }
  else
  {
    v6 = 0;
  }
  v7 = (uint64_t (**)())((char *)self + OBJC_IVAR____TtC5Files26DOCPinchZoomTestParameters_completionHandler);
  v9 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files26DOCPinchZoomTestParameters_completionHandler);
  v8 = *(_QWORD *)&self->testName[OBJC_IVAR____TtC5Files26DOCPinchZoomTestParameters_completionHandler];
  *v7 = v6;
  v7[1] = (uint64_t (*)())v4;
  sub_100087534(v9, v8);
}

- (id)composerBlock
{
  CGFloat v2;
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  _TtC5Files26DOCPinchZoomTestParameters *v6;
  double MidX;
  CGFloat MidY;
  double v9;
  uint64_t v10;
  void *v11;
  _QWORD v13[5];
  uint64_t v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;

  v2 = *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files26DOCPinchZoomTestParameters_bounds);
  v3 = *(double *)&self->testName[OBJC_IVAR____TtC5Files26DOCPinchZoomTestParameters_bounds];
  v4 = *(double *)&self->testName[OBJC_IVAR____TtC5Files26DOCPinchZoomTestParameters_bounds + 8];
  v5 = *(double *)&self->bounds[OBJC_IVAR____TtC5Files26DOCPinchZoomTestParameters_bounds];
  v6 = self;
  v15.origin.x = v2;
  v15.origin.y = v3;
  v15.size.width = v4;
  v15.size.height = v5;
  MidX = CGRectGetMidX(v15);
  v16.origin.x = v2;
  v16.origin.y = v3;
  v16.size.width = v4;
  v16.size.height = v5;
  MidY = CGRectGetMidY(v16);
  v17.origin.x = v2;
  v17.origin.y = v3;
  v17.size.width = v4;
  v17.size.height = v5;
  v9 = MidX + CGRectGetWidth(v17) / 10.0;
  v10 = swift_allocObject(&unk_1005EB440, 48, 7);
  *(double *)(v10 + 16) = MidX;
  *(CGFloat *)(v10 + 24) = MidY;
  *(double *)(v10 + 32) = v9;
  *(CGFloat *)(v10 + 40) = MidY;

  v13[4] = sub_10042A7F4;
  v14 = v10;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 1107296256;
  v13[2] = sub_100018CC0;
  v13[3] = &unk_1005EB458;
  v11 = _Block_copy(v13);
  swift_release(v14);
  return v11;
}

- (_TtC5Files26DOCPinchZoomTestParameters)init
{
  _TtC5Files26DOCPinchZoomTestParameters *result;

  result = (_TtC5Files26DOCPinchZoomTestParameters *)_swift_stdlib_reportUnimplementedInitializer("Files.DOCPinchZoomTestParameters", 32, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->testName[OBJC_IVAR____TtC5Files26DOCPinchZoomTestParameters_testName]);
  sub_100087534(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files26DOCPinchZoomTestParameters_completionHandler), *(_QWORD *)&self->testName[OBJC_IVAR____TtC5Files26DOCPinchZoomTestParameters_completionHandler]);
}

@end
