@implementation ConfigInternal

- (NSString)userAgent
{
  return (NSString *)sub_1AF23A624((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC20PegasusConfiguration14ConfigInternal_userAgent);
}

- (NSString)clientName
{
  return (NSString *)sub_1AF23A624((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC20PegasusConfiguration14ConfigInternal_clientName);
}

- (BOOL)isEnabled
{
  _TtC20PegasusConfiguration14ConfigInternal *v2;
  BOOL v3;

  v2 = self;
  v3 = sub_1AF23A6C8();

  return v3;
}

- (NSString)firstUseDescriptionText
{
  return (NSString *)sub_1AF23A968(self, (uint64_t)a2, (void (*)(void))sub_1AF23A720);
}

- (BOOL)isExpired
{
  _TtC20PegasusConfiguration14ConfigInternal *v2;
  BOOL v3;

  v2 = self;
  v3 = sub_1AF23A8CC();

  return v3;
}

- (NSString)searchURLString
{
  return (NSString *)sub_1AF23A968(self, (uint64_t)a2, (void (*)(void))sub_1AF23A9CC);
}

- (id)findConfigForUserAgent:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC20PegasusConfiguration14ConfigInternal *v7;
  void *v8;
  void *v9;

  if (a3)
  {
    v4 = sub_1AF241270();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = self;
  sub_1AF23AE18(v4, v6);
  v9 = v8;

  swift_bridgeObjectRelease();
  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC20PegasusConfiguration14ConfigInternal *v5;

  v4 = a3;
  v5 = self;
  sub_1AF23B0C8(v4);

}

- (_TtC20PegasusConfiguration14ConfigInternal)initWithCoder:(id)a3
{
  _TtC20PegasusConfiguration14ConfigInternal *result;

  sub_1AF23B240(a3);
  return result;
}

- (id)valueForKey:(id)a3 shouldConsiderOverrides:(BOOL)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _TtC20PegasusConfiguration14ConfigInternal *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  __int128 v16;
  uint64_t v17;

  v5 = sub_1AF241270();
  v7 = v6;
  v8 = self;
  sub_1AF23B408(v5, v7, &v16);

  swift_bridgeObjectRelease();
  v9 = v17;
  if (!v17)
    return 0;
  v10 = __swift_project_boxed_opaque_existential_1(&v16, v17);
  v11 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v10);
  v13 = (char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v11 + 16))(v13);
  v14 = (void *)sub_1AF241738();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v9);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v16);
  return v14;
}

- (BOOL)configBoolForKey:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC20PegasusConfiguration14ConfigInternal *v7;

  v4 = sub_1AF241270();
  v6 = v5;
  v7 = self;
  LOBYTE(v4) = sub_1AF23A6F8(v4, v6);

  swift_bridgeObjectRelease();
  return v4 & 1;
}

- (id)valueForKey:(id)a3 ofType:(Class)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _TtC20PegasusConfiguration14ConfigInternal *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  _QWORD v16[3];
  uint64_t v17;

  v5 = sub_1AF241270();
  v7 = v6;
  swift_getObjCClassMetadata();
  v8 = self;
  OUTLINED_FUNCTION_32_1(v5, v7, (uint64_t)v16);

  swift_bridgeObjectRelease();
  v9 = v17;
  if (!v17)
    return 0;
  v10 = __swift_project_boxed_opaque_existential_1(v16, v17);
  v11 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v10);
  v13 = (char *)v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v11 + 16))(v13);
  v14 = (void *)sub_1AF241738();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v9);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v16);
  return v14;
}

- (id)valueForKey:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC20PegasusConfiguration14ConfigInternal *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  __int128 v15;
  uint64_t v16;

  v4 = sub_1AF241270();
  v6 = v5;
  v7 = self;
  sub_1AF23C1C0(v4, v6, &v15);

  swift_bridgeObjectRelease();
  v8 = v16;
  if (!v16)
    return 0;
  v9 = __swift_project_boxed_opaque_existential_1(&v15, v16);
  v10 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v10 + 16))(v12);
  v13 = (void *)sub_1AF241738();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v8);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v15);
  return v13;
}

- (_TtC20PegasusConfiguration14ConfigInternal)init
{
  sub_1AF23C2C4();
}

- (void).cxx_destruct
{
  sub_1AF219BC4(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC20PegasusConfiguration14ConfigInternal_data), *(_QWORD *)&self->data[OBJC_IVAR____TtC20PegasusConfiguration14ConfigInternal_data]);
  OUTLINED_FUNCTION_31_2();
  OUTLINED_FUNCTION_31_2();

}

- (id)rawConfig
{
  _TtC20PegasusConfiguration14ConfigInternal *v2;
  id v3;
  void *v4;

  v2 = self;
  v3 = sub_1AF23C384();

  if (v3)
  {
    v4 = (void *)sub_1AF2411EC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

@end
