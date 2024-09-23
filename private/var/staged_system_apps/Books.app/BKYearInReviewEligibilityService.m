@implementation BKYearInReviewEligibilityService

- (BKYearInReviewEligibilityService)init
{
  return (BKYearInReviewEligibilityService *)YearInReviewEligibilityService.init()();
}

- (void)dealloc
{
  objc_class *ObjectType;
  void *v4;
  BKYearInReviewEligibilityService *v5;
  id v6;
  BKYearInReviewEligibilityService *v7;
  void *v8;
  objc_super v9;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = (void *)objc_opt_self(NSNotificationCenter);
  v5 = self;
  v6 = objc_msgSend(v4, "defaultCenter");
  v7 = v5;
  v8 = (void *)static NSNotificationName.rcDataContainerConfigDidChange.getter(v7);
  objc_msgSend(v6, "removeObserver:name:object:", v7, v8, 0);

  v9.receiver = v7;
  v9.super_class = ObjectType;
  -[BKYearInReviewEligibilityService dealloc](&v9, "dealloc");
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR___BKYearInReviewEligibilityService__setupState));

  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR___BKYearInReviewEligibilityService_eligibilityProvider));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR___BKYearInReviewEligibilityService_notificationScheduler));

}

- (void)onConfigurationChange:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  BKYearInReviewEligibilityService *v9;
  uint64_t v10;

  v5 = type metadata accessor for Notification(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  sub_10053E4CC();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (BSUIDynamicValue)topPicksIsEligible
{
  _QWORD *v2;
  _BYTE v4[24];

  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___BKYearInReviewEligibilityService_topPicksObserver);
  swift_beginAccess((char *)self + OBJC_IVAR___BKYearInReviewEligibilityService_topPicksObserver, v4, 0, 0);
  if (*v2)
    return (BSUIDynamicValue *)objc_autoreleaseReturnValue(objc_retain(*(id *)(*v2
                                                                             + OBJC_IVAR____TtC5Books29TopPicksCardConditionObserver_isEligible)));
  else
    return (BSUIDynamicValue *)0;
}

- (JSValue)topPicksIsEligiblePromise
{
  BKYearInReviewEligibilityService *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_10053F160();
  v4 = v3;

  return (JSValue *)v4;
}

- (NSNumber)activeYear
{
  uint64_t v2;
  NSNumber *v3;
  char v4;
  char v5;
  NSNumber v6;

  v2 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR___BKYearInReviewEligibilityService_eligibilityProvider);
  if (v2)
  {
    v3 = self;
    swift_retain(v2);
    sub_10001C038();
    v5 = v4;
    swift_release(v2);
    if ((v5 & 1) != 0)
      v6.super.super.isa = 0;
    else
      v6.super.super.isa = Int._bridgeToObjectiveC()().super.super.isa;

    return (NSNumber *)v6.super.super.isa;
  }
  else
  {
    __break(1u);
  }
  return self;
}

- (id)isActiveEntryPoint:(id)a3
{
  id v4;
  BKYearInReviewEligibilityService *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = self;
  sub_10053F640(v4);
  v7 = v6;

  return v7;
}

- (id)isEligibleForEntryConditionPromise:(id)a3
{
  id v4;
  BKYearInReviewEligibilityService *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = self;
  sub_10053F83C(v4);
  v7 = v6;

  return v7;
}

@end
