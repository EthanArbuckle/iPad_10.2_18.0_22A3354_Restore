@implementation RPRSDDeviceInfo_Internal

- (NSString)name
{
  void *v2;

  RSDDeviceInfo.name.getter();
  v2 = (void *)sub_1CF73EEB0();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSUUID)uuid
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void *v6;
  uint64_t v8;

  v2 = sub_1CF73E664();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  RSDDeviceInfo.uuid.getter((uint64_t)v5);
  v6 = (void *)sub_1CF73E640();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (NSUUID *)v6;
}

- (int64_t)hash
{
  RPRSDDeviceInfo_Internal *v2;
  int64_t v3;

  v2 = self;
  v3 = sub_1CF6AD230();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  RPRSDDeviceInfo_Internal *v4;
  RPRSDDeviceInfo_Internal *v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1CF73F2DC();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = sub_1CF6AD2E0((uint64_t)v8);

  sub_1CF68F37C((uint64_t)v8);
  return v6 & 1;
}

- (RPRSDDeviceInfo_Internal)init
{
  RSDDeviceInfo.init()();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR___RPRSDDeviceInfo_Internal_uuid;
  v4 = OUTLINED_FUNCTION_27();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
