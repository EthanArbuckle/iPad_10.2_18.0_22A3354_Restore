@implementation ApplicationMessageCoordinator

- (_TtC16MusicApplication29ApplicationMessageCoordinator)init
{
  return (_TtC16MusicApplication29ApplicationMessageCoordinator *)sub_3992C0();
}

- (void)messageDidReportMetricsEvent:(id)a3 eventProperties:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  _TtC16MusicApplication29ApplicationMessageCoordinator *v11;

  v7 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a4, &type metadata for String, (char *)&type metadata for Any + 8, &protocol witness table for String);
  sub_4E684(0, (unint64_t *)&qword_14AD360, OS_dispatch_queue_ptr);
  v8 = swift_allocObject(&unk_135E160, 24, 7);
  *(_QWORD *)(v8 + 16) = v7;
  v9 = a3;
  v10 = a4;
  v11 = self;
  swift_bridgeObjectRetain();
  static OS_dispatch_queue.asyncOnMainIfNeeded(_:)((uint64_t (*)(void))sub_39B0A0, v8);

  swift_bridgeObjectRelease(v7);
  swift_release(v8);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MusicApplication29ApplicationMessageCoordinator_messageCoordinator));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MusicApplication29ApplicationMessageCoordinator_scriptingApplicationMessageGroup));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MusicApplication29ApplicationMessageCoordinator_applicationContextProvider));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16MusicApplication29ApplicationMessageCoordinator_networkConnectivityObserver));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16MusicApplication29ApplicationMessageCoordinator_libraryBannerOptInDidChangeNotificationObserver));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16MusicApplication29ApplicationMessageCoordinator_scriptingBridgeDidFailInitializationDidChangeObserver));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16MusicApplication29ApplicationMessageCoordinator_playEndTotalDurationEventNotificationObserver));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16MusicApplication29ApplicationMessageCoordinator_nowPlayingSubscription));
}

@end
