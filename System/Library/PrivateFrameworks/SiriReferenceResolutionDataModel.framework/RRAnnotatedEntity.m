@implementation RRAnnotatedEntity

- (NSString)id
{
  return (NSString *)sub_21CC5E56C((uint64_t)self, (uint64_t)a2, RRAnnotatedEntity.id.getter);
}

- (NSString)appBundleId
{
  return (NSString *)sub_21CC5E56C((uint64_t)self, (uint64_t)a2, RRAnnotatedEntity.appBundleId.getter);
}

- (NSString)dataType
{
  return (NSString *)sub_21CC5EC68((uint64_t)self, (uint64_t)a2, RRAnnotatedEntity.dataType.getter);
}

- (NSData)data
{
  uint64_t v2;
  unint64_t v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;

  RRAnnotatedEntity.data.getter();
  if (v3 >> 60 == 15)
  {
    v4 = 0;
  }
  else
  {
    v5 = v2;
    v6 = v3;
    v4 = (void *)sub_21CC74F88();
    sub_21CC553BC(v5, v6);
  }
  return (NSData *)v4;
}

- (double)score
{
  return sub_21CC5E788();
}

- (void)setScore:(double)a3
{
  sub_21CC5E7E4(a3);
}

- (NSDate)saliencyComputedAt
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  void *v6;
  uint64_t v8;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254072900);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21CC5E91C();
  v5 = sub_21CC74FD0();
  v6 = 0;
  if (__swift_getEnumTagSinglePayload((uint64_t)v4, 1, v5) != 1)
  {
    v6 = (void *)sub_21CC74FAC();
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  }
  return (NSDate *)v6;
}

- (void)setSaliencyComputedAt:(id)a3
{
  sub_21CC5FBFC(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_21CC5E96C);
}

- (NSString)userId
{
  return (NSString *)sub_21CC5EC68((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_21CC5ECA4);
}

- (void)setUserId:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity *v7;

  if (a3)
  {
    v4 = sub_21CC751C8();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = self;
  sub_21CC5ED54(v4, v6);

}

- (NSString)description
{
  _TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity *v2;
  void *v3;

  v2 = self;
  sub_21CC5EE74();

  v3 = (void *)sub_21CC751BC();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (NSDate)mentionedAt
{
  return (NSDate *)sub_21CC5FB50(self, (uint64_t)a2, (void (*)(void))sub_21CC5F2C8);
}

- (void)setMentionedAt:(id)a3
{
  sub_21CC5FBFC(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_21CC5F2E4);
}

- (NSDate)onscreenAt
{
  return (NSDate *)sub_21CC5FB50(self, (uint64_t)a2, (void (*)(void))sub_21CC5F678);
}

- (void)setOnscreenAt:(id)a3
{
  sub_21CC5FBFC(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_21CC5F7B8);
}

- (NSDate)foregroundedAt
{
  return (NSDate *)sub_21CC5FB50(self, (uint64_t)a2, (void (*)(void))sub_21CC5F8EC);
}

- (void)setForegroundedAt:(id)a3
{
  sub_21CC5FBFC(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_21CC5F908);
}

- (NSDate)nearbyAt
{
  return (NSDate *)sub_21CC5FB50(self, (uint64_t)a2, (void (*)(void))sub_21CC5F9AC);
}

- (void)setNearbyAt:(id)a3
{
  sub_21CC5FBFC(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_21CC5F9D0);
}

- (NSDate)notificationReceivedAt
{
  return (NSDate *)sub_21CC5FB50(self, (uint64_t)a2, (void (*)(void))sub_21CC5FA78);
}

- (void)setNotificationReceivedAt:(id)a3
{
  sub_21CC5FBFC(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_21CC5FAA0);
}

- (NSDate)nowPlayingAt
{
  return (NSDate *)sub_21CC5FB50(self, (uint64_t)a2, (void (*)(void))sub_21CC5FBE0);
}

- (void)setNowPlayingAt:(id)a3
{
  sub_21CC5FBFC(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_21CC5FC90);
}

- (void)setDateAnnotationWithKey:(id)a3 value:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity *v14;
  uint64_t v15;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254072900);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_21CC751C8();
  v11 = v10;
  if (a4)
  {
    sub_21CC74FC4();
    v12 = sub_21CC74FD0();
    v13 = 0;
  }
  else
  {
    v12 = sub_21CC74FD0();
    v13 = 1;
  }
  __swift_storeEnumTagSinglePayload((uint64_t)v8, v13, 1, v12);
  v14 = self;
  sub_21CC5FD24(v9, v11, (uint64_t)v8);

  swift_bridgeObjectRelease();
  sub_21CC6221C((uint64_t)v8, &qword_254072900);
}

- (BOOL)isEqual:(id)a3
{
  _TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity *v4;
  _TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity *v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_21CC752B8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = sub_21CC61B48((uint64_t)v8);

  sub_21CC6221C((uint64_t)v8, &qword_25531D050);
  return v6 & 1;
}

- (_TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity)init
{
  RRAnnotatedEntity.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_71_0();
  swift_release();
  sub_21CC6221C((uint64_t)self + OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_typedValue, &qword_254072918);
  OUTLINED_FUNCTION_71_0();
  sub_21CC553BC(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_data), *(_QWORD *)&self->id[OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_data]);
  OUTLINED_FUNCTION_71_0();
  swift_bridgeObjectRelease();
  sub_21CC6221C((uint64_t)self + OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_saliencyComputedAt, &qword_254072900);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
