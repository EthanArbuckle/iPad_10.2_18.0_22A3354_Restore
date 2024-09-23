@implementation AssessmentPayloadStore

+ (_TtC3asd22AssessmentPayloadStore)shared
{
  return (_TtC3asd22AssessmentPayloadStore *)static AssessmentPayloadStore.shared.getter();
}

- (void)fetchFor:(NSString *)a3 withBindings:(NSDictionary *)a4 completionHandler:(id)a5
{
  void *v8;
  _QWORD *v9;
  NSString *v10;
  NSDictionary *v11;
  _TtC3asd22AssessmentPayloadStore *v12;

  v8 = _Block_copy(a5);
  v9 = (_QWORD *)swift_allocObject(&unk_1004D2CD0, 48, 7);
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = v8;
  v9[5] = self;
  v10 = a3;
  v11 = a4;
  v12 = self;
  sub_10008F82C((uint64_t)&unk_100505F18, (uint64_t)v9);
}

- (_TtC3asd22AssessmentPayloadStore)init
{
  AssessmentPayloadStore.init()();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC3asd22AssessmentPayloadStore_logger;
  v4 = sub_1000357DC();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

  sub_100091898((uint64_t)self + OBJC_IVAR____TtC3asd22AssessmentPayloadStore_assessmentPayloadFilter, type metadata accessor for AssessmentPayloadFilter);
}

@end
