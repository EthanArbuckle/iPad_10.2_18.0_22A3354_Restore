@implementation HIDVirtualServiceDelegate

- (BOOL)setProperty:(id)a3 forKey:(id)a4 forService:(id)a5
{
  id v9;
  _TtC11EnsembleHIDP33_70A939F407EA708C436DF5A2641C5F4325HIDVirtualServiceDelegate *v10;
  uint64_t v11;
  id v12;
  _TtC11EnsembleHIDP33_70A939F407EA708C436DF5A2641C5F4325HIDVirtualServiceDelegate *v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  char v17;
  _QWORD v19[4];
  _OWORD v20[2];

  if (a3)
  {
    v9 = a4;
    swift_unknownObjectRetain(a5);
    v10 = self;
    swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v20, v11);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v20, 0, sizeof(v20));
    v12 = a4;
    swift_unknownObjectRetain(a5);
    v13 = self;
  }
  v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v16 = v15;

  _bridgeAnyObjectToAny(_:)(v19, a5);
  swift_unknownObjectRelease(a5);
  v17 = sub_1001E5EB4((uint64_t)v20, v14, v16);

  swift_bridgeObjectRelease();
  sub_100005988(v19);
  sub_1000C2C88((uint64_t)v20, &qword_1002B34C0);
  return v17 & 1;
}

- (id)propertyForKey:(id)a3 forService:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _TtC11EnsembleHIDP33_70A939F407EA708C436DF5A2641C5F4325HIDVirtualServiceDelegate *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  __n128 v13;
  uint64_t v14;
  char *v15;
  void *v16;
  _QWORD v18[4];
  __int128 v19;
  uint64_t v20;

  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v8 = v7;
  swift_unknownObjectRetain(a4);
  v9 = self;
  _bridgeAnyObjectToAny(_:)(v18, a4);
  swift_unknownObjectRelease(a4);
  sub_1001E6058(v6, v8, &v19);

  swift_bridgeObjectRelease();
  sub_100005988(v18);
  v10 = v20;
  if (!v20)
    return 0;
  v11 = sub_10000DBE4(&v19, v20);
  v12 = *(_QWORD *)(v10 - 8);
  v13 = __chkstk_darwin(v11);
  v15 = (char *)v18 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, __n128))(v12 + 16))(v15, v13);
  v16 = (void *)_bridgeAnythingToObjectiveC<A>(_:)(v15, v10);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v10);
  sub_100005988(&v19);
  return v16;
}

- (id)copyEventMatching:(id)a3 forService:(id)a4
{
  _TtC11EnsembleHIDP33_70A939F407EA708C436DF5A2641C5F4325HIDVirtualServiceDelegate *v6;
  void *v7;
  _QWORD v9[4];

  if (a3)
    static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
  swift_unknownObjectRetain(a4);
  v6 = self;
  _bridgeAnyObjectToAny(_:)(v9, a4);
  swift_unknownObjectRelease(a4);
  v7 = (void *)static UInt64.logicalMinimum.getter();

  swift_bridgeObjectRelease();
  sub_100005988(v9);
  return v7;
}

- (BOOL)setOutputEvent:(id)a3 forService:(id)a4
{
  id v6;
  _TtC11EnsembleHIDP33_70A939F407EA708C436DF5A2641C5F4325HIDVirtualServiceDelegate *v7;
  _QWORD v9[4];

  v6 = a3;
  swift_unknownObjectRetain(a4);
  v7 = self;
  _bridgeAnyObjectToAny(_:)(v9, a4);
  swift_unknownObjectRelease(a4);
  LOBYTE(a4) = static HIDFixed.zero.getter();

  sub_100005988(v9);
  return a4 & 1;
}

- (void)notification:(int64_t)a3 withProperty:(id)a4 forService:(id)a5
{
  _TtC11EnsembleHIDP33_70A939F407EA708C436DF5A2641C5F4325HIDVirtualServiceDelegate *v8;
  _QWORD v9[4];

  if (a4)
    static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a4, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
  swift_unknownObjectRetain(a5);
  v8 = self;
  _bridgeAnyObjectToAny(_:)(v9, a5);
  swift_unknownObjectRelease(a5);
  CGSize.init(_:)(a3);

  swift_bridgeObjectRelease();
  sub_100005988(v9);
}

- (_TtC11EnsembleHIDP33_70A939F407EA708C436DF5A2641C5F4325HIDVirtualServiceDelegate)init
{
  return (_TtC11EnsembleHIDP33_70A939F407EA708C436DF5A2641C5F4325HIDVirtualServiceDelegate *)sub_1001E63F0();
}

- (void).cxx_destruct
{
  swift_weakDestroy((char *)self + OBJC_IVAR____TtC11EnsembleHIDP33_70A939F407EA708C436DF5A2641C5F4325HIDVirtualServiceDelegate_service);
}

@end
