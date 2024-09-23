@implementation FMDeviceAnnotation

- (NSString)debugDescription
{
  _TtC6FindMy18FMDeviceAnnotation *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  sub_1003446AC();
  v4 = v3;

  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC6FindMy18FMDeviceAnnotation_device;
  v4 = type metadata accessor for FMIPDevice(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_1000051EC((uint64_t)self + OBJC_IVAR____TtC6FindMy18FMDeviceAnnotation_part, (uint64_t *)&unk_1005D3AA0);

}

@end
