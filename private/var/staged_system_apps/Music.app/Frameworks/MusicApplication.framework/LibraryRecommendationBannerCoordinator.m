@implementation LibraryRecommendationBannerCoordinator

- (NSString)targetIdentifier
{
  uint64_t v2;
  NSString v3;

  v2 = *(_QWORD *)&self->didInteractWithBannerHandler[OBJC_IVAR____TtC16MusicApplication38LibraryRecommendationBannerCoordinator_targetIdentifier];
  swift_bridgeObjectRetain(v2);
  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  return (NSString *)v3;
}

- (void)messageCoordinator:(id)a3 didUpdatePriorityMessage:(id)a4 forTarget:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  _TtC16MusicApplication38LibraryRecommendationBannerCoordinator *v15;

  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v11 = v10;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = self;
  sub_904D30(a4, v9, v11);

  swift_bridgeObjectRelease();
}

- (_TtC16MusicApplication38LibraryRecommendationBannerCoordinator)init
{
  return (_TtC16MusicApplication38LibraryRecommendationBannerCoordinator *)sub_8FD3A0();
}

- (void).cxx_destruct
{
  sub_5C198(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC16MusicApplication38LibraryRecommendationBannerCoordinator_didInteractWithBannerHandler), *(_QWORD *)&self->didInteractWithBannerHandler[OBJC_IVAR____TtC16MusicApplication38LibraryRecommendationBannerCoordinator_didInteractWithBannerHandler]);
  sub_5C198(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC16MusicApplication38LibraryRecommendationBannerCoordinator_shouldDisplayRecommendationBannerDidChangeHandler), *(_QWORD *)&self->didInteractWithBannerHandler[OBJC_IVAR____TtC16MusicApplication38LibraryRecommendationBannerCoordinator_shouldDisplayRecommendationBannerDidChangeHandler]);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MusicApplication38LibraryRecommendationBannerCoordinator_viewController));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MusicApplication38LibraryRecommendationBannerCoordinator_pendingMessage));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MusicApplication38LibraryRecommendationBannerCoordinator_currentMessage));
}

@end
