@implementation FindMyHandleWaypointRequest

- (_TtC4Maps27FindMyHandleWaypointRequest)initWithHandle:(id)a3 location:(id)a4
{
  id v5;
  id v6;
  _TtC4Maps27FindMyHandleWaypointRequest *v7;

  v5 = a3;
  v6 = a4;
  v7 = (_TtC4Maps27FindMyHandleWaypointRequest *)sub_10000B504(v5, a4);

  return v7;
}

- (CLLocationCoordinate2D)coordinate
{
  void *v2;
  double latitude;
  double longitude;
  CLLocationCoordinate2D result;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps27FindMyHandleWaypointRequest_location);
  if (v2)
  {
    objc_msgSend(v2, "coordinate");
  }
  else
  {
    latitude = kCLLocationCoordinate2DInvalid.latitude;
    longitude = kCLLocationCoordinate2DInvalid.longitude;
  }
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

- (BOOL)isCurrentLocation
{
  return 0;
}

- (MKMapItem)mapItemForLocationComparison
{
  _TtC4Maps27FindMyHandleWaypointRequest *v2;
  id v3;

  v2 = self;
  v3 = sub_1000080AC();

  return (MKMapItem *)v3;
}

- (BOOL)hasCachedResult
{
  return *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps27FindMyHandleWaypointRequest_cachedLoadResult) != 0;
}

- (BOOL)isEquivalentToOtherRequest:(id)a3
{
  _TtC4Maps27FindMyHandleWaypointRequest *v5;
  char v6;

  swift_unknownObjectRetain(a3);
  v5 = self;
  v6 = sub_1000082F8(a3);
  swift_unknownObjectRelease(a3);

  return v6 & 1;
}

- (id)loadComposedWaypointWithTraits:(id)a3 clientResolvedCompletionHandler:(id)a4 completionHandler:(id)a5 networkActivityHandler:(id)a6
{
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  _TtC4Maps27FindMyHandleWaypointRequest *v17;
  id v18;

  v10 = _Block_copy(a4);
  v11 = _Block_copy(a5);
  v12 = _Block_copy(a6);
  if (v10)
  {
    v13 = swift_allocObject(&unk_10119AF10, 24, 7);
    *(_QWORD *)(v13 + 16) = v10;
    v10 = sub_10000BF64;
  }
  else
  {
    v13 = 0;
  }
  v14 = swift_allocObject(&unk_10119AEC0, 24, 7);
  *(_QWORD *)(v14 + 16) = v11;
  if (v12)
  {
    v15 = swift_allocObject(&unk_10119AEE8, 24, 7);
    *(_QWORD *)(v15 + 16) = v12;
    v12 = sub_10000BF84;
  }
  else
  {
    v15 = 0;
  }
  v16 = a3;
  v17 = self;
  v18 = sub_10000B5B8(a3, (uint64_t)sub_10000BF64, v14, (uint64_t)v12, v15);
  sub_10000BF74((uint64_t)v12, v15);
  swift_release(v14);
  sub_10000BF74((uint64_t)v10, v13);

  return v18;
}

- (void)recordRAPInformation:(id)a3
{
  id v4;
  _TtC4Maps27FindMyHandleWaypointRequest *v5;

  v4 = a3;
  v5 = self;
  sub_100008C80(v4);

}

- (id)copyWithZone:(void *)a3
{
  _TtC4Maps27FindMyHandleWaypointRequest *v3;
  uint64_t v4;
  _QWORD *v5;
  void *v6;
  _QWORD v8[3];
  uint64_t v9;

  v3 = self;
  sub_100008FD0(v8);

  v4 = v9;
  v5 = sub_10000BE88(v8, v9);
  v6 = (void *)_bridgeAnythingToObjectiveC<A>(_:)(v5, v4);
  sub_10000BEAC(v8);
  return v6;
}

- (id)waypointIconWithScale:(double)a3
{
  _TtC4Maps27FindMyHandleWaypointRequest *v4;
  id v5;

  v4 = self;
  v5 = sub_100009158(a3);

  return v5;
}

- (NSString)waypointName
{
  _TtC4Maps27FindMyHandleWaypointRequest *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  sub_100113D90();
  v4 = v3;

  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (NSString)waypointNameWhenEditing
{
  _TtC4Maps27FindMyHandleWaypointRequest *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  sub_100113D30();
  if (!v3)
    sub_100113D90();
  v4 = v3;

  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (CNContact)contact
{
  _TtC4Maps27FindMyHandleWaypointRequest *v2;
  id v3;

  v2 = self;
  v3 = sub_100114194();

  return (CNContact *)v3;
}

- (NSString)handleIdentifier
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  _TtC4Maps27FindMyHandleWaypointRequest *v7;
  uint64_t v8;
  uint64_t v9;
  NSString v10;
  uint64_t v12;

  v3 = type metadata accessor for Handle(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v6, *(char **)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps27FindMyHandleWaypointRequest_handle)+ OBJC_IVAR____TtC4Maps16MapsFindMyHandle_handle, v3);
  v7 = self;
  Handle.identifier.getter();
  v9 = v8;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  v10 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v9);
  return (NSString *)v10;
}

- (_TtC4Maps27FindMyHandleWaypointRequest)init
{
  _TtC4Maps27FindMyHandleWaypointRequest *result;

  result = (_TtC4Maps27FindMyHandleWaypointRequest *)_swift_stdlib_reportUnimplementedInitializer("Maps.FindMyHandleWaypointRequest", 32, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
