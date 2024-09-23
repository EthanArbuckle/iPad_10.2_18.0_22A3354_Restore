@implementation CarPlayNoContentView

- (_TtC16MusicApplication20CarPlayNoContentView)initWithTitle:(id)a3 subtitle:(id)a4 buttonTitle:(id)a5 buttonHandler:(id)a6
{
  uint64_t ObjectType;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  objc_class *v22;
  uint64_t v23;
  id v24;
  uint64_t (*v25)();
  uint64_t (*v26)();
  uint64_t v27;
  id v28;
  id v29;
  id v30;
  _TtC16MusicApplication20CarPlayNoContentView *v31;
  uint64_t v32;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  ObjectType = swift_getObjectType();
  v12 = _Block_copy(a6);
  v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v15 = v14;
  if (a4)
  {
    v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  }
  else
  {
    v16 = 0;
    v17 = 0;
  }
  v35 = v16;
  v36 = v13;
  v34 = v17;
  if (!a5)
  {
    v22 = (objc_class *)ObjectType;
    if (v12)
    {
      v23 = swift_allocObject(&unk_138D3F0, 24, 7);
      *(_QWORD *)(v23 + 16) = v12;
      goto LABEL_10;
    }
LABEL_13:
    v23 = 0;
    v25 = 0;
    goto LABEL_14;
  }
  v18 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v20 = v19;
  if (!v12)
  {
    v22 = (objc_class *)ObjectType;
    if (v19)
    {
      v28 = a3;
      swift_bridgeObjectRelease();
      v23 = 0;
      v25 = 0;
LABEL_15:
      v21 = 0;
      v20 = 0;
      v26 = 0;
      v27 = 0;
      goto LABEL_16;
    }
    goto LABEL_13;
  }
  v21 = v18;
  v22 = (objc_class *)ObjectType;
  v23 = swift_allocObject(&unk_138D3F0, 24, 7);
  *(_QWORD *)(v23 + 16) = v12;
  if (!v20)
  {
LABEL_10:
    v25 = sub_112F24;
LABEL_14:
    v29 = a3;
    goto LABEL_15;
  }
  v24 = a3;
  v25 = sub_112F24;
  sub_A9DEC((uint64_t)sub_112F24, v23);
  v26 = sub_112F24;
  v27 = v23;
LABEL_16:
  v30 = objc_allocWithZone(v22);
  v31 = (_TtC16MusicApplication20CarPlayNoContentView *)sub_90DAF8(v36, v15, v35, v34, v21, v20, (uint64_t)v26, v27);
  sub_90E5F4(v21, v20, (uint64_t)v26, v27);
  swift_bridgeObjectRelease();
  sub_5C198((uint64_t)v25, v23);
  v32 = swift_getObjectType();
  swift_deallocPartialClassInstance(self, v32, 8, 7);

  return v31;
}

- (_TtC16MusicApplication20CarPlayNoContentView)initWithCoder:(id)a3
{
  _TtC16MusicApplication20CarPlayNoContentView *result;

  result = (_TtC16MusicApplication20CarPlayNoContentView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000000010C4100, "MusicApplication/CarPlayNoContentView.swift", 43, 2, 104, 0);
  __break(1u);
  return result;
}

- (_TtC16MusicApplication20CarPlayNoContentView)initWithFrame:(CGRect)a3
{
  _TtC16MusicApplication20CarPlayNoContentView *result;

  result = (_TtC16MusicApplication20CarPlayNoContentView *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.CarPlayNoContentView", 37, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

@end
