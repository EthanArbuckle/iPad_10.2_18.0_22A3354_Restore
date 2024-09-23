@implementation MapsService.CapabilityFetcherObserver

- (void)capabilityLevelsDidUpdate
{
  _TtCC7SiriGeo11MapsService25CapabilityFetcherObserver *v2;

  v2 = self;
  MapsService.CapabilityFetcherObserver.capabilityLevelsDidUpdate()();

}

- (_TtCC7SiriGeo11MapsService25CapabilityFetcherObserver)init
{
  _TtCC7SiriGeo11MapsService25CapabilityFetcherObserver *result;

  result = (_TtCC7SiriGeo11MapsService25CapabilityFetcherObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC7SiriGeo11MapsService25CapabilityFetcherObserver_logObject));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC7SiriGeo11MapsService25CapabilityFetcherObserver_levelFetcher));
  outlined consume of (@escaping @callee_guaranteed (@guaranteed [EnhancedMSPSharedTripContact]) -> ())?(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtCC7SiriGeo11MapsService25CapabilityFetcherObserver_completion));
  swift_bridgeObjectRelease();
}

@end
