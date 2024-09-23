@implementation RenderLoop

- (void)renderer:(id)a3 updateAtTime:(double)a4
{
  _TtC7Measure10RenderLoop *v7;

  swift_unknownObjectRetain(a3);
  v7 = self;
  sub_10016580C((uint64_t)a3, a4);
  swift_unknownObjectRelease(a3);

}

- (void)renderer:(id)a3 didAddNode:(id)a4 forAnchor:(id)a5
{
  sub_100166358(self, (uint64_t)a2, (uint64_t)a3, a4, a5, sub_100166458);
}

- (id)renderer:(id)a3 nodeForAnchor:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  _TtC7Measure10RenderLoop *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  Swift::String v22;
  uint64_t v23;
  NSString v24;
  _QWORD v26[2];

  v7 = type metadata accessor for UUID(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin();
  v10 = (char *)v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = objc_opt_self(ARPlaneAnchor);
  v12 = swift_dynamicCastObjCClass(a4, v11);
  if (!v12)
    return 0;
  v13 = (void *)v12;
  v14 = objc_allocWithZone((Class)SCNNode);
  v15 = a4;
  swift_unknownObjectRetain(a3);
  v16 = self;
  v17 = objc_msgSend(v14, "init");
  strcpy((char *)v26, "arkit_plane_");
  BYTE5(v26[1]) = 0;
  HIWORD(v26[1]) = -5120;
  v18 = objc_msgSend(v13, "identifier", v26[0]);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();

  v19 = UUID.uuidString.getter();
  v21 = v20;
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  v22._countAndFlagsBits = v19;
  v22._object = v21;
  String.append(_:)(v22);
  swift_bridgeObjectRelease(v21);
  v23 = v26[1];
  v24 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v23);
  objc_msgSend(v17, "setName:", v24);
  swift_unknownObjectRelease(a3);

  return v17;
}

- (void)renderer:(id)a3 didUpdateNode:(id)a4 forAnchor:(id)a5
{
  sub_100166358(self, (uint64_t)a2, (uint64_t)a3, a4, a5, sub_100166720);
}

- (void)renderer:(id)a3 didRemoveNode:(id)a4 forAnchor:(id)a5
{
  id v9;
  id v10;
  _TtC7Measure10RenderLoop *v11;

  swift_unknownObjectRetain(a3);
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_100166B58(v10);
  swift_unknownObjectRelease(a3);

}

@end
