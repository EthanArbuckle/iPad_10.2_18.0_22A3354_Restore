@implementation PhotoLibraryPicker.Coordinator

- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  _TtCV5Music18PhotoLibraryPicker11Coordinator *v12;

  type metadata accessor for InfoKey(0);
  v8 = v7;
  v9 = sub_100048748(&qword_10119D890, (uint64_t (*)(uint64_t))type metadata accessor for InfoKey, (uint64_t)&unk_100EA7854);
  v10 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a4, v8, (char *)&type metadata for Any + 8, v9);
  v11 = a3;
  v12 = self;
  sub_10076B944(v10);

  swift_bridgeObjectRelease();
}

- (_TtCV5Music18PhotoLibraryPicker11Coordinator)init
{
  _TtCV5Music18PhotoLibraryPicker11Coordinator *result;

  result = (_TtCV5Music18PhotoLibraryPicker11Coordinator *)_swift_stdlib_reportUnimplementedInitializer("Music.Coordinator", 17, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10076B908((uint64_t)self + OBJC_IVAR____TtCV5Music18PhotoLibraryPicker11Coordinator_representable);
}

@end
