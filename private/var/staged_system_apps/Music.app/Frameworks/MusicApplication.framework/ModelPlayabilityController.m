@implementation ModelPlayabilityController

+ (_TtC16MusicApplication26ModelPlayabilityController)shared
{
  if (qword_14AAC38 != -1)
    swift_once(&qword_14AAC38, sub_27AC88);
  return (_TtC16MusicApplication26ModelPlayabilityController *)(id)qword_157FC30;
}

- (_TtC16MusicApplication26ModelPlayabilityController)init
{
  return (_TtC16MusicApplication26ModelPlayabilityController *)sub_27ACF4();
}

- (void)dealloc
{
  void *v3;
  _TtC16MusicApplication26ModelPlayabilityController *v4;
  id v5;
  objc_super v6;

  v3 = (void *)objc_opt_self(ICEnvironmentMonitor);
  v4 = self;
  v5 = objc_msgSend(v3, "sharedMonitor");
  objc_msgSend(v5, "unregisterObserver:", v4);

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for ModelPlayabilityController();
  -[ModelPlayabilityController dealloc](&v6, "dealloc");
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16MusicApplication26ModelPlayabilityController_playerSubscription));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16MusicApplication26ModelPlayabilityController_accountStoreNotificationObserver));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16MusicApplication26ModelPlayabilityController_cellularNetworkingAllowedNotificationObserver));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16MusicApplication26ModelPlayabilityController_cellularNetworkingAllowedVideosNotificationObserver));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16MusicApplication26ModelPlayabilityController_explicitContentRestrictionNotificationObserver));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16MusicApplication26ModelPlayabilityController_fairPlaySubscriptionStatusNotificationObserver));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16MusicApplication26ModelPlayabilityController_subscriptionStatusNotificationObserver));
}

+ (id)requiredPropertiesForModelClass:(Class)a3
{
  uint64_t ObjCClassMetadata;

  ObjCClassMetadata = swift_getObjCClassMetadata(a3);
  return sub_27F814(ObjCClassMetadata);
}

- (int64_t)calculatePlayabilityStatusWithModel:(id)a3
{
  id v5;
  _TtC16MusicApplication26ModelPlayabilityController *v6;
  int64_t v7;

  v5 = a3;
  v6 = self;
  v7 = sub_27BE18(a3);

  return v7;
}

- (void)environmentMonitorDidChangeNetworkType:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  _TtC16MusicApplication26ModelPlayabilityController *v9;
  id v10;
  __n128 v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;

  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_14AD5A0);
  __chkstk_darwin(v5);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 1, 1, v8);
  type metadata accessor for MainActor(0);
  v9 = self;
  v10 = a3;
  v12 = static MainActor.shared.getter(v11);
  v13 = (_QWORD *)swift_allocObject(&unk_1354C38, 40, 7);
  v13[2] = v12;
  v13[3] = &protocol witness table for MainActor;
  v13[4] = v9;
  v14 = sub_2223C8((uint64_t)v7, (uint64_t)&unk_14BD420, (uint64_t)v13);

  swift_release(v14);
}

@end
