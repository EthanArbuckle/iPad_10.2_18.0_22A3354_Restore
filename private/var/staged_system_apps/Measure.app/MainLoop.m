@implementation MainLoop

- (void)session:(id)a3 didFailWithError:(id)a4
{
  id v6;
  _TtC7Measure8MainLoop *v7;
  id v8;

  v6 = a3;
  v8 = a4;
  v7 = self;
  sub_1000E57C8((unint64_t)v8);

}

- (void)sessionWasInterrupted:(id)a3
{
  id v4;
  _TtC7Measure8MainLoop *v5;

  v4 = a3;
  v5 = self;
  sub_1000E59C0();

}

- (void)sessionInterruptionEnded:(id)a3
{
  id v4;
  _TtC7Measure8MainLoop *v5;

  v4 = a3;
  v5 = self;
  sub_1000E5B44();

}

- (BOOL)sessionShouldAttemptRelocalization:(id)a3
{
  uint64_t v3;
  BOOL result;

  v3 = *(_QWORD *)((char *)self + qword_100482C00);
  if (*(_BYTE *)(v3 + 24) != 1)
    return byte_1004AF778;
  result = 0;
  *(_BYTE *)(v3 + 24) = 0;
  return result;
}

- (void)session:(id)a3 cameraDidChangeTrackingState:(id)a4
{
  id v6;
  id v7;
  _TtC7Measure8MainLoop *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1000E3F78(v6);

}

- (void)session:(id)a3 didUpdateFrame:(id)a4
{
  id v6;
  id v7;
  _TtC7Measure8MainLoop *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1000E460C(v6, v7);

}

- (void)session:(id)a3 didUpdateAnchors:(id)a4
{
  uint64_t v7;
  void *v8;
  id v9;
  _TtC7Measure8MainLoop *v10;
  Swift::OpaquePointer v11;

  v7 = sub_100018148(0, (unint64_t *)&unk_100482ED0, ARAnchor_ptr);
  v8 = (void *)static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v7);
  v9 = a3;
  v10 = self;
  v11._rawValue = v8;
  sub_1000E5C1C(v9, v11);

  swift_bridgeObjectRelease(v8);
}

- (void)session:(id)a3 didRemoveAnchors:(id)a4
{
  uint64_t v7;
  Swift::OpaquePointer v8;
  id v9;
  _TtC7Measure8MainLoop *v10;

  v7 = sub_100018148(0, (unint64_t *)&unk_100482ED0, ARAnchor_ptr);
  v8._rawValue = (void *)static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v7);
  v9 = a3;
  v10 = self;
  MeasureCore.shared.unsafeMutableAddressor(v10);
  swift_retain();
  MeasureCore.didRemove(anchors:)(v8);
  swift_release();
  type metadata accessor for WorldAnchor(0);
  static WorldAnchor.didRemove(anchors:)(v8._rawValue);

  swift_bridgeObjectRelease(v8._rawValue);
}

- (void)session:(id)a3 didAddAnchors:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  id v9;
  _TtC7Measure8MainLoop *v10;

  v7 = sub_100018148(0, (unint64_t *)&unk_100482ED0, ARAnchor_ptr);
  v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v7);
  v9 = a3;
  v10 = self;
  sub_1000E5DF8(v8);

  swift_bridgeObjectRelease(v8);
}

@end
