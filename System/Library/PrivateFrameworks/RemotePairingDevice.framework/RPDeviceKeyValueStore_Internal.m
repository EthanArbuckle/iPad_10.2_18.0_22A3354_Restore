@implementation RPDeviceKeyValueStore_Internal

- (RPDeviceKeyValueStore_Internal)init
{
  RPDeviceKeyValueStore_Internal *result;

  DeviceKeyValueStore.init()();
  return result;
}

- (NSString)description
{
  RPDeviceKeyValueStore_Internal *v2;
  void *v3;

  v2 = self;
  sub_1CF6AF354();

  v3 = (void *)sub_1CF73EEB0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (id)getValueWithDomain:(id)a3 key:(id)a4
{
  return sub_1CF6AFE54(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (void (*)(uint64_t))sub_1CF6AF828);
}

- (id)getKeyValuePairsWithDomain:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  RPDeviceKeyValueStore_Internal *v7;
  uint64_t v8;
  void *v9;

  if (a3)
  {
    v4 = sub_1CF73EED4();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = self;
  v8 = sub_1CF6AF8F4(v4, v6);

  swift_bridgeObjectRelease();
  if (v8)
  {
    v9 = (void *)sub_1CF73EE14();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (id)isValueSensitiveWithDomain:(id)a3 key:(id)a4
{
  return sub_1CF6AFE54(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (void (*)(uint64_t))sub_1CF6AFD78);
}

- (BOOL)isEqual:(id)a3
{
  RPDeviceKeyValueStore_Internal *v4;
  RPDeviceKeyValueStore_Internal *v5;
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
  v6 = sub_1CF6B0B40((uint64_t)v8);

  sub_1CF693ED8((uint64_t)v8, &qword_1ED8F7C80);
  return v6 & 1;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
