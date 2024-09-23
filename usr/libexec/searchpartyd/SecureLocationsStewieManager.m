@implementation SecureLocationsStewieManager

- (_TtC12searchpartyd28SecureLocationsStewieManager)init
{
  _TtC12searchpartyd28SecureLocationsStewieManager *result;

  result = (_TtC12searchpartyd28SecureLocationsStewieManager *)_swift_stdlib_reportUnimplementedInitializer("searchpartyd.SecureLocationsStewieManager", 41, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12searchpartyd28SecureLocationsStewieManager_clientQueue));
  swift_release();

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12searchpartyd28SecureLocationsStewieManager_coreTelephonyClient));
  swift_release();
  swift_release();
  swift_release();
  sub_100004048((uint64_t)self + OBJC_IVAR____TtC12searchpartyd28SecureLocationsStewieManager_location, &qword_101119450);
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  sub_100004048((uint64_t)self + OBJC_IVAR____TtC12searchpartyd28SecureLocationsStewieManager_lastAvailabilityDate, (uint64_t *)&unk_1010EA690);
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12searchpartyd28SecureLocationsStewieManager_locationMonitorDistanceThreshold));
  sub_100004048((uint64_t)self + OBJC_IVAR____TtC12searchpartyd28SecureLocationsStewieManager_lastPublishedLocation, &qword_101119450);
}

- (void)messageReceived:(id)a3 withMetadata:(id)a4 completionBlock:(id)a5
{
  void *v8;
  _TtC12searchpartyd28SecureLocationsStewieManager *v9;

  v8 = _Block_copy(a5);
  if (a4)
    static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a4, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
  swift_unknownObjectRetain(a3);
  v9 = self;
  sub_100C0CED0((uint64_t)a3);
  _Block_release(v8);
  swift_unknownObjectRelease(a3);

  swift_bridgeObjectRelease();
}

- (void)stateChanged:(id)a3
{
  id v4;
  _TtC12searchpartyd28SecureLocationsStewieManager *v5;

  v4 = a3;
  v5 = self;
  sub_100C09338(v4);

}

- (void)connectedServicesChanged:(int64_t)a3
{
  char v3;
  _TtC12searchpartyd28SecureLocationsStewieManager *v4;

  v3 = a3;
  v4 = self;
  sub_100C09670(v3);

}

- (void)stewieSupportChanged
{
  _TtC12searchpartyd28SecureLocationsStewieManager *v2;

  v2 = self;
  sub_100C09B54();

}

@end
