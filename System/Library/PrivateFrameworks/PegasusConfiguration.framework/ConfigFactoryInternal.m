@implementation ConfigFactoryInternal

- (id)loadWithUrl:(id)a3 userAgent:(id)a4 userDefaults:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  void *v13;
  _TtC20PegasusConfiguration21ConfigFactoryInternal *v14;
  id v15;
  id v16;
  uint64_t v18;

  v8 = sub_1AF240E2C();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AF240DD8();
  if (a4)
  {
    v12 = sub_1AF241270();
    a4 = v13;
  }
  else
  {
    v12 = 0;
  }
  v14 = self;
  v15 = a5;
  v16 = ConfigFactoryInternal.load(url:userAgent:userDefaults:)((uint64_t)v11, v12, (uint64_t)a4, a5);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return v16;
}

- (id)loadWithData:(id)a3 userAgent:(id)a4 userDefaults:(id)a5
{
  id v8;
  _TtC20PegasusConfiguration21ConfigFactoryInternal *v9;
  id v10;
  id v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;

  v8 = a3;
  v9 = self;
  v10 = a4;
  v11 = a5;
  v12 = sub_1AF240E5C();
  v14 = v13;

  if (v10)
  {
    v15 = sub_1AF241270();
    v17 = v16;

  }
  else
  {
    v15 = 0;
    v17 = 0;
  }
  ConfigFactoryInternal.load(data:userAgent:userDefaults:)(v12, v14, v15, v17, v11);
  v19 = v18;
  swift_bridgeObjectRelease();
  sub_1AF219BC4(v12, v14);

  return v19;
}

- (_TtC20PegasusConfiguration21ConfigFactoryInternal)init
{
  return (_TtC20PegasusConfiguration21ConfigFactoryInternal *)ConfigFactoryInternal.init()();
}

@end
