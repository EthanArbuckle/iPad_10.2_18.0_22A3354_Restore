@implementation CarPlayNoContentView

- (_TtC5Music20CarPlayNoContentView)initWithTitle:(id)a3 subtitle:(id)a4 buttonTitle:(id)a5 buttonHandler:(id)a6
{
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)();
  uint64_t v24;
  id v25;
  _TtC5Music20CarPlayNoContentView *v26;
  uint64_t v27;
  objc_class *ObjectType;
  uint64_t v30;

  ObjectType = (objc_class *)swift_getObjectType();
  v11 = _Block_copy(a6);
  v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v14 = v13;
  if (a4)
  {
    v15 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v30 = v16;
    if (a5)
      goto LABEL_3;
LABEL_7:
    if (v11)
    {
      v22 = swift_allocObject(&unk_1010B86A8, 24, 7);
      v20 = 0;
      v19 = 0;
      v23 = 0;
      v24 = 0;
      *(_QWORD *)(v22 + 16) = v11;
LABEL_12:
      v11 = sub_100253D40;
      goto LABEL_17;
    }
    v22 = 0;
    goto LABEL_14;
  }
  v15 = 0;
  v30 = 0;
  if (!a5)
    goto LABEL_7;
LABEL_3:
  v17 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v19 = v18;
  if (!v11)
  {
    if (!v18)
    {
      v22 = 0;
      v11 = 0;
      v20 = 0;
      goto LABEL_16;
    }
    swift_bridgeObjectRelease(v18);
    v22 = 0;
    v11 = 0;
LABEL_14:
    v20 = 0;
    v19 = 0;
LABEL_16:
    v23 = 0;
    v24 = 0;
    goto LABEL_17;
  }
  v20 = v17;
  v21 = swift_allocObject(&unk_1010B86A8, 24, 7);
  v22 = v21;
  *(_QWORD *)(v21 + 16) = v11;
  if (!v19)
  {
    v20 = 0;
    v23 = 0;
    v24 = 0;
    goto LABEL_12;
  }
  swift_retain(v21);
  v11 = sub_100253D40;
  v23 = sub_100253D40;
  v24 = v22;
LABEL_17:
  v25 = objc_allocWithZone(ObjectType);
  v26 = (_TtC5Music20CarPlayNoContentView *)sub_100252E38(v12, v14, v15, v30, v20, v19, (uint64_t)v23, v24);
  sub_10004BA30((uint64_t)v11, v22);
  v27 = swift_getObjectType();
  swift_deallocPartialClassInstance(self, v27, 8, 7);
  return v26;
}

- (_TtC5Music20CarPlayNoContentView)initWithCoder:(id)a3
{
  _TtC5Music20CarPlayNoContentView *result;

  result = (_TtC5Music20CarPlayNoContentView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100E2B820, "Music/CarPlayNoContentView.swift", 32, 2, 104, 0);
  __break(1u);
  return result;
}

- (_TtC5Music20CarPlayNoContentView)initWithFrame:(CGRect)a3
{
  _TtC5Music20CarPlayNoContentView *result;

  result = (_TtC5Music20CarPlayNoContentView *)_swift_stdlib_reportUnimplementedInitializer("Music.CarPlayNoContentView", 26, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

@end
