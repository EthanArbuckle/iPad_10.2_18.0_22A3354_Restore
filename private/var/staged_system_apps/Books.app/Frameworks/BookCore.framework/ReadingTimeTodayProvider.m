@implementation ReadingTimeTodayProvider

- (id)dynamicProgressForKind:(id)a3 instance:(id)a4 parameters:(id)a5
{
  _TtC8BookCore24ReadingTimeTodayProvider *v8;
  _TtC8BookCore24ReadingTimeTodayProvider *v9;
  void *v10;
  _OWORD v12[2];
  _OWORD v13[2];

  if (!a4)
  {
    memset(v13, 0, sizeof(v13));
    swift_unknownObjectRetain(a5);
    v9 = self;
    if (a5)
      goto LABEL_3;
LABEL_5:
    memset(v12, 0, sizeof(v12));
    goto LABEL_6;
  }
  swift_unknownObjectRetain(a5);
  v8 = self;
  swift_unknownObjectRetain(a4);
  _bridgeAnyObjectToAny(_:)(v13);
  swift_unknownObjectRelease(a4);
  if (!a5)
    goto LABEL_5;
LABEL_3:
  _bridgeAnyObjectToAny(_:)(v12);
  swift_unknownObjectRelease(a5);
LABEL_6:
  v10 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8BookCore24ReadingTimeTodayProvider_dynamicProgress);
  swift_unknownObjectRetain(v10);

  sub_1766A8((uint64_t)v12, &qword_30ABB0);
  sub_1766A8((uint64_t)v13, &qword_30ABB0);
  return v10;
}

- (_TtC8BookCore24ReadingTimeTodayProvider)init
{
  _TtC8BookCore24ReadingTimeTodayProvider *result;

  result = (_TtC8BookCore24ReadingTimeTodayProvider *)_swift_stdlib_reportUnimplementedInitializer("BookCore.ReadingTimeTodayProvider", 33, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC8BookCore24ReadingTimeTodayProvider_dynamicProgress));
}

@end
