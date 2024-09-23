@implementation FMDeviceDetailContentViewController

- (_TtC6FindMy35FMDeviceDetailContentViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1001CFAD4();
}

- (void)viewDidLoad
{
  _TtC6FindMy35FMDeviceDetailContentViewController *v2;
  id v3;
  void *v4;
  objc_super v5;

  v2 = self;
  v3 = -[FMDeviceDetailContentViewController view](v2, "view");
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "setFrame:", 0.0, 0.0, 100.0, 100.0);

    v5.receiver = v2;
    v5.super_class = (Class)type metadata accessor for FMDeviceDetailContentViewController(0);
    -[FMBaseContentViewController viewDidLoad](&v5, "viewDidLoad");

  }
  else
  {
    __break(1u);
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC6FindMy35FMDeviceDetailContentViewController *v4;

  v4 = self;
  sub_10019941C(a3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FMDeviceDetailContentViewController(0);
  v4 = v5.receiver;
  -[FMDeviceDetailContentViewController viewDidAppear:](&v5, "viewDidAppear:", v3);
  sub_1001A3414();

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC6FindMy35FMDeviceDetailContentViewController *v4;

  v4 = self;
  sub_100199EF8(a3);

}

- (void)viewDidLayoutSubviews
{
  _TtC6FindMy35FMDeviceDetailContentViewController *v2;

  v2 = self;
  sub_10019ACD4();

}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  double v5;
  double v6;
  _TtC6FindMy35FMDeviceDetailContentViewController *v7;

  v4 = a3;
  v7 = self;
  sub_100228580(v4);
  objc_msgSend(v4, "contentOffset");
  v6 = 1.0 / v5;
  if (v5 <= 0.0)
    v6 = INFINITY;
  if (v6 < 0.01)
    v6 = 0.0;
  objc_msgSend(*(id *)((char *)&v7->super.super.super.super.isa+ OBJC_IVAR____TtC6FindMy27FMBaseContentViewController_batteryIndicatorView), "setAlpha:", v6);

}

- (void)handlePlaySound
{
  _TtC6FindMy35FMDeviceDetailContentViewController *v2;

  v2 = self;
  sub_1001ABB58();

}

- (void)handleStopSound
{
  _TtC6FindMy35FMDeviceDetailContentViewController *v2;

  v2 = self;
  sub_1001AE864();

}

- (void)handleMuteLeft
{
  _TtC6FindMy35FMDeviceDetailContentViewController *v2;

  v2 = self;
  sub_1001B00BC();

}

- (void)handleMuteRight
{
  _TtC6FindMy35FMDeviceDetailContentViewController *v2;

  v2 = self;
  sub_1001B04B8();

}

- (void)showSoundPending
{
  _TtC6FindMy35FMDeviceDetailContentViewController *v2;

  v2 = self;
  sub_1001B7198();

}

- (void)handleDirections
{
  _TtC6FindMy35FMDeviceDetailContentViewController *v2;

  v2 = self;
  sub_1001B9564();

}

- (void)handleFind
{
  _TtC6FindMy35FMDeviceDetailContentViewController *v2;

  v2 = self;
  sub_1001B9A00();

}

- (void)handleLostMode
{
  _TtC6FindMy35FMDeviceDetailContentViewController *v2;

  v2 = self;
  sub_1001BBF2C();

}

- (void)handleLock
{
  _TtC6FindMy35FMDeviceDetailContentViewController *v2;

  v2 = self;
  sub_1001BC364();

}

- (void)showSoundPendingLearnMore
{
  _TtC6FindMy35FMDeviceDetailContentViewController *v2;

  v2 = self;
  sub_1001BC794();

}

- (void)showMismatchLearnMore
{
  _TtC6FindMy35FMDeviceDetailContentViewController *v2;

  v2 = self;
  sub_1001BCC7C();

}

- (void)handleErase
{
  _TtC6FindMy35FMDeviceDetailContentViewController *v2;

  v2 = self;
  sub_1001BD390();

}

- (void)handleCancelErase
{
  _TtC6FindMy35FMDeviceDetailContentViewController *v2;

  v2 = self;
  sub_1001BD6B0();

}

- (void)handleInnaccurateLocationAttentionTap
{
  _TtC6FindMy35FMDeviceDetailContentViewController *v2;

  v2 = self;
  sub_1001BDC8C();

}

- (void)handleSeparation
{
  _TtC6FindMy35FMDeviceDetailContentViewController *v2;

  v2 = self;
  sub_1001C32B0();

}

- (void)removeOrRepairDevice
{
  _TtC6FindMy35FMDeviceDetailContentViewController *v2;

  v2 = self;
  sub_1001C4654();

}

- (void)handleNotificationsOffAttentionTap
{
  _TtC6FindMy35FMDeviceDetailContentViewController *v2;

  v2 = self;
  sub_1001D3BA8(0xD000000000000031, 0x80000001004A5750);

}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC6FindMy35FMDeviceDetailContentViewController_dataSource));
  sub_10005E190((uint64_t)self + OBJC_IVAR____TtC6FindMy35FMDeviceDetailContentViewController_delegate);
  sub_10005E190((uint64_t)self + OBJC_IVAR____TtC6FindMy35FMDeviceDetailContentViewController_playSoundDelegate);
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC6FindMy35FMDeviceDetailContentViewController_conditionsSubscription));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMDeviceDetailContentViewController_playSoundButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMDeviceDetailContentViewController_muteLeftButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMDeviceDetailContentViewController_muteRightButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMDeviceDetailContentViewController_stopSoundButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMDeviceDetailContentViewController_directionsButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMDeviceDetailContentViewController_findingExperienceCoordinator));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMDeviceDetailContentViewController_itemConnectionManager));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMDeviceDetailContentViewController_findButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMDeviceDetailContentViewController_findingExperiencePresenter));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMDeviceDetailContentViewController_btDeviceDiscoveryToken));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMDeviceDetailContentViewController____lazy_storage___ownerSession));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC6FindMy35FMDeviceDetailContentViewController_connectionMaterialTask));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMDeviceDetailContentViewController_localFindableConnectionMaterialMonitoringSession));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMDeviceDetailContentViewController_connectionMaterialUpdateQueue));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMDeviceDetailContentViewController_errorConditionsAttentionModule));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMDeviceDetailContentViewController_notificationsView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMDeviceDetailContentViewController_showContactDetailsView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMDeviceDetailContentViewController_showContactDetailsWelcomeScreenViewController));
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.mediator[OBJC_IVAR____TtC6FindMy35FMDeviceDetailContentViewController_showContactDetailsPhoneNumber]);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMDeviceDetailContentViewController_trustedLocationsDetailViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMDeviceDetailContentViewController_separationAttention));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMDeviceDetailContentViewController_markAsLostView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMDeviceDetailContentViewController_cancelEraseDeviceButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMDeviceDetailContentViewController_eraseDeviceButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMDeviceDetailContentViewController_removeDeviceButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMDeviceDetailContentViewController_inaccurateAttention));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMDeviceDetailContentViewController_soundPendingAttention));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMDeviceDetailContentViewController_mismatchAttention));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMDeviceDetailContentViewController_pairingIncompleteAttention));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMDeviceDetailContentViewController_pairingStatusDebugView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMDeviceDetailContentViewController_notificationsOffAttention));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMDeviceDetailContentViewController_repairModeAttention));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMDeviceDetailContentViewController_firstButtonsStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMDeviceDetailContentViewController_actionButtonsStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMDeviceDetailContentViewController_verticalStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMDeviceDetailContentViewController_verticalStackBottomConstraint));
  sub_1000051EC((uint64_t)self + OBJC_IVAR____TtC6FindMy35FMDeviceDetailContentViewController_playSoundInFlight, (uint64_t *)&unk_1005D3320);
  sub_1000051EC((uint64_t)self + OBJC_IVAR____TtC6FindMy35FMDeviceDetailContentViewController_canShowQueueAlert, (uint64_t *)&unk_1005D3320);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC6FindMy35FMDeviceDetailContentViewController_lastPlayAction));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC6FindMy35FMDeviceDetailContentViewController_cancelOnlinePlaySoundWorkItem));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMDeviceDetailContentViewController_actionQueue));
  sub_1000051EC((uint64_t)self + OBJC_IVAR____TtC6FindMy35FMDeviceDetailContentViewController_pendingPlaySoundAnalytics, &qword_1005D9940);
  sub_1000051EC((uint64_t)self + OBJC_IVAR____TtC6FindMy35FMDeviceDetailContentViewController_pendingSafeLocation, (uint64_t *)&unk_1005E2270);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.mediator[OBJC_IVAR____TtC6FindMy35FMDeviceDetailContentViewController_separationAddress]);
  sub_1000051EC((uint64_t)self + OBJC_IVAR____TtC6FindMy35FMDeviceDetailContentViewController_separationEvent, &qword_1005E4440);
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC6FindMy35FMDeviceDetailContentViewController_geocodingCache));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMDeviceDetailContentViewController_soundPendingTimer));
}

- (uint64_t)showPairingIncompleteLearnMore
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t result;
  id v13;
  NSURL *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  Class isa;
  uint64_t v19;

  v0 = sub_100053F2C((uint64_t *)&unk_1005D3470);
  __chkstk_darwin(v0);
  v2 = (char *)&v19 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for URL(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1005D1DE8 != -1)
    swift_once(&qword_1005D1DE8, sub_100005ADC);
  v7 = type metadata accessor for Logger(0);
  v8 = sub_100056D88(v7, (uint64_t)qword_1005F5748);
  v9 = Logger.logObject.getter(v8);
  v10 = static os_log_type_t.default.getter(v9);
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "FMDeviceDetailContentViewController: Showing pairing incomplete learn more", v11, 2u);
    swift_slowDealloc(v11, -1, -1);
  }

  URL.init(string:)(0xD000000000000055, 0x80000001004B2AF0);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v6, v2, v3);
    v13 = objc_msgSend((id)objc_opt_self(UIApplication), "sharedApplication");
    URL._bridgeToObjectiveC()(v14);
    v16 = v15;
    v17 = sub_10011D84C((uint64_t)_swiftEmptyArrayStorage);
    type metadata accessor for OpenExternalURLOptionsKey(0);
    sub_100008000((unint64_t *)&qword_1005D2610, (uint64_t (*)(uint64_t))type metadata accessor for OpenExternalURLOptionsKey, (uint64_t)&unk_1004814BC);
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    objc_msgSend(v13, "openURL:options:completionHandler:", v16, isa, 0, swift_bridgeObjectRelease(v17).n128_f64[0]);

    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  return result;
}

@end
