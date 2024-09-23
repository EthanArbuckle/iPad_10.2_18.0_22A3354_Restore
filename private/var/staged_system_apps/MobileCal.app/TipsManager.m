@implementation TipsManager

- (_TtC9MobileCal11TipsManager)init
{
  objc_super v4;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9MobileCal11TipsManager_tipObservationTask) = 0;
  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC9MobileCal11TipsManager_tipPopoverController, 0);
  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC9MobileCal11TipsManager_todayBarButtonItem, 0);
  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC9MobileCal11TipsManager_presentingController, 0);
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC9MobileCal11TipsManager____lazy_storage___jumpToTodayTip) = 1;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for TipsManager();
  return -[TipsManager init](&v4, "init");
}

- (void)addTipObserversFor:(id)a3 todayButton:(id)a4
{
  id v6;
  _TtC9MobileCal11TipsManager *v7;
  id fora;

  fora = a3;
  v6 = a4;
  v7 = self;
  TipsManager.addTipObservers(for:todayButton:)((UIViewController)fora, (UIBarButtonItem)v6);

}

+ (_TtC9MobileCal11TipsManager)shared
{
  if (qword_1001F5868 != -1)
    swift_once(&qword_1001F5868, sub_1000033B0);
  return (_TtC9MobileCal11TipsManager *)(id)static TipsManager.shared;
}

- (uint64_t)configureTipsCenter
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v0 = type metadata accessor for Tips.ConfigurationOption.AnalyticsEngine(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin();
  v3 = (char *)&v19 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for Tips.ConfigurationOption.DatastoreLocation(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin();
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for Tips.ConfigurationOption.DisplayFrequency(0);
  v9 = *(_QWORD *)(v8 - 8);
  result = __chkstk_darwin();
  v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((byte_1001F5B70 & 1) == 0)
  {
    v21 = v1;
    v22 = v0;
    byte_1001F5B70 = 1;
    v13 = sub_10000EDD8(&qword_1001F5C40);
    v23 = type metadata accessor for Tips.ConfigurationOption(0);
    v14 = *(_QWORD *)(v23 - 8);
    v15 = *(unsigned __int8 *)(v14 + 80);
    v20 = *(_QWORD *)(v14 + 72);
    v16 = swift_allocObject(v13, ((v15 + 32) & ~v15) + 3 * v20, v15 | 7);
    *(_OWORD *)(v16 + 16) = xmmword_1001A1CF0;
    static Tips.ConfigurationOption.DisplayFrequency.system.getter();
    static Tips.ConfigurationOption.displayFrequency(_:)(v12);
    v17 = (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v12, v8);
    static Tips.ConfigurationOption.DatastoreLocation.tipsGroupContainer.getter(v17);
    static Tips.ConfigurationOption.datastoreLocation(_:)(v7);
    v18 = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    static Tips.ConfigurationOption.AnalyticsEngine.coreAnalytics.getter(v18);
    static Tips.ConfigurationOption.analyticsEngine(_:)(v3);
    (*(void (**)(char *, uint64_t))(v21 + 8))(v3, v22);
    static Tips.configure(_:)(v16);
    return swift_bridgeObjectRelease(v16);
  }
  return result;
}

- (void)setIsSelectedDateFiveDaysAwayFromTodayTo:(BOOL)a3
{
  sub_10000EA8C(self, (uint64_t)a2, a3, &qword_1001F5888, (uint64_t)qword_1001F6D08, (uint64_t)sub_10001CDF8);
}

- (void)setIsPortraitOrientationTo:(BOOL)a3
{
  sub_10000EA8C(self, (uint64_t)a2, a3, &qword_1001F5880, (uint64_t)qword_1001F6CF0, (uint64_t)sub_10001CDC4);
}

- (void)updatePresentedController:(id)a3
{
  char *v5;
  void *Strong;
  id v7;
  _TtC9MobileCal11TipsManager *v8;

  if (byte_1001F5B70 == 1)
  {
    v5 = (char *)self + OBJC_IVAR____TtC9MobileCal11TipsManager_presentingController;
    Strong = (void *)swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC9MobileCal11TipsManager_presentingController);
    v7 = a3;
    v8 = self;

    if (!Strong)
      swift_unknownObjectWeakAssign(v5, v7);

  }
}

- (void)dismissTipIfPresentedWithCompletionBlock:(id)a3
{
  void *v4;
  _TtC9MobileCal11TipsManager *v5;

  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_10012531C((uint64_t)v5, (void (**)(_QWORD))v4);
  _Block_release(v4);
  _Block_release(v4);

}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9MobileCal11TipsManager_tipObservationTask));
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC9MobileCal11TipsManager_tipPopoverController);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC9MobileCal11TipsManager_todayBarButtonItem);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC9MobileCal11TipsManager_presentingController);
}

- (void)jumpToTodayActionPerformed
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  unint64_t v7;
  _TtC9MobileCal11TipsManager *v8;
  uint64_t v9;

  v3 = type metadata accessor for Tips.InvalidationReason(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001CE80();
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v6, enum case for Tips.InvalidationReason.actionPerformed(_:), v3);
  v7 = sub_10001CD7C();
  v8 = self;
  Tip.invalidate(reason:)(v6, &type metadata for JumpToTodayTip, v7);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

}

- (void)setShouldDisplayJumpToTodayTipTo:(BOOL)a3
{
  sub_10000EA8C(self, (uint64_t)a2, a3, &qword_1001F5878, (uint64_t)qword_1001F6CD8, (uint64_t)sub_10001CE20);
}

@end
