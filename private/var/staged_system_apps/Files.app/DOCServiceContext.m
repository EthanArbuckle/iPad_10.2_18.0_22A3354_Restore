@implementation DOCServiceContext

+ (id)_extensionAuxiliaryHostProtocol
{
  return sub_10023EFF8((uint64_t)a1, (uint64_t)a2, (SEL *)&selRef_hostProtocol);
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  return sub_10023EFF8((uint64_t)a1, (uint64_t)a2, (SEL *)&selRef_vendorProtocol);
}

- (void)configureAsDocumentBrowserWithHostProxy:(id)a3 configuration:(id)a4 initialUIPBrowserState:(id)a5 completionBlock:(id)a6
{
  void *v10;
  uint64_t v11;
  _QWORD *v12;
  void *v13;
  _QWORD *v14;
  id v15;
  id v16;
  _TtC5Files17DOCServiceContext *v17;
  id v18;
  id v19;
  _TtC5Files17DOCServiceContext *v20;
  _QWORD v21[5];
  _QWORD *v22;

  v10 = _Block_copy(a6);
  v11 = swift_allocObject(&unk_1005D4800, 24, 7);
  *(_QWORD *)(v11 + 16) = v10;
  v12 = (_QWORD *)swift_allocObject(&unk_1005D4828, 64, 7);
  v12[2] = a5;
  v12[3] = a4;
  v12[4] = self;
  v12[5] = a3;
  v12[6] = sub_100241430;
  v12[7] = v11;
  v21[4] = sub_100241484;
  v22 = v12;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 1107296256;
  v21[2] = sub_10004A82C;
  v21[3] = &unk_1005D4840;
  v13 = _Block_copy(v21);
  v14 = v22;
  swift_unknownObjectRetain_n(a3, 2);
  v15 = a4;
  v16 = a5;
  v17 = self;
  v18 = v16;
  v19 = v15;
  v20 = v17;
  swift_retain();
  swift_release(v14);
  DOCRunInMainThread(v13);
  _Block_release(v13);
  swift_unknownObjectRelease(a3);

  swift_release(v11);
}

- (void)updateAppearance:(id)a3 completionBlock:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  _TtC5Files17DOCServiceContext *v9;

  v6 = _Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject(&unk_1005D47D8, 24, 7);
    *(_QWORD *)(v7 + 16) = v6;
    v6 = sub_1001F6B10;
  }
  else
  {
    v7 = 0;
  }
  v8 = a3;
  v9 = self;
  sub_10023F700(v8, (uint64_t)v6, v7);
  sub_100087534((uint64_t)v6, v7);

}

- (void)updateAppearance:(id)a3 shouldFlushCA:(BOOL)a4 completionBlock:(id)a5
{
  void *v8;
  uint64_t v9;
  id v10;
  _TtC5Files17DOCServiceContext *v11;

  v8 = _Block_copy(a5);
  if (v8)
  {
    v9 = swift_allocObject(&unk_1005D47B0, 24, 7);
    *(_QWORD *)(v9 + 16) = v8;
    v8 = sub_1001F6B10;
  }
  else
  {
    v9 = 0;
  }
  v10 = a3;
  v11 = self;
  sub_10023F8D0(v10, a4, (uint64_t)v8, v9);
  sub_100087534((uint64_t)v8, v9);

}

- (void)updateEditingTo:(BOOL)a3 animated:(BOOL)a4
{
  _TtC5Files17DOCServiceContext *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  _QWORD v15[5];
  uint64_t v16;

  v6 = self;
  v7 = -[DOCServiceContext _principalObject](v6, "_principalObject");
  if (v7)
  {
    v8 = v7;
    v9 = type metadata accessor for DOCServiceViewController();
    v10 = (void *)swift_dynamicCastClassUnconditional(v8, v9, 0, 0, 0);
    v11 = swift_allocObject(&unk_1005D4760, 26, 7);
    *(_QWORD *)(v11 + 16) = v10;
    *(_BYTE *)(v11 + 24) = a3;
    *(_BYTE *)(v11 + 25) = a4;
    v15[4] = sub_1002411EC;
    v16 = v11;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 1107296256;
    v15[2] = sub_10004A82C;
    v15[3] = &unk_1005D4778;
    v12 = _Block_copy(v15);
    v13 = v16;
    v14 = v10;
    swift_release(v13);
    DOCRunInMainThread(v12);
    _Block_release(v12);

  }
  else
  {
    __break(1u);
  }
}

- (_TtC5Files17DOCServiceContext)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DOCServiceContext();
  return -[DOCServiceContext init](&v3, "init");
}

- (_TtC5Files17DOCServiceContext)initWithInputItems:(id)a3
{
  uint64_t v4;
  NSArray v5;
  _TtC5Files17DOCServiceContext *v6;
  objc_super v8;

  if (a3)
  {
    v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, (char *)&type metadata for Any + 8);
    v5.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v4);
  }
  else
  {
    v5.super.isa = 0;
  }
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for DOCServiceContext();
  v6 = -[DOCServiceContext initWithInputItems:](&v8, "initWithInputItems:", v5.super.isa);

  if (v6)
  return v6;
}

- (_TtC5Files17DOCServiceContext)initWithInputItems:(id)a3 contextUUID:(id)a4
{
  uint64_t v6;
  __n128 v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  v6 = sub_10006922C((uint64_t *)&unk_1006475C0);
  v7.n128_f64[0] = __chkstk_darwin(v6);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
    a3 = (id)static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, (char *)&type metadata for Any + 8);
  if (a4)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)(a4, v7);
    v10 = type metadata accessor for UUID(0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v9, 0, 1, v10);
  }
  else
  {
    v11 = type metadata accessor for UUID(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v9, 1, 1, v11);
  }
  return (_TtC5Files17DOCServiceContext *)sub_10023FC94((uint64_t)a3, (uint64_t)v9);
}

- (_TtC5Files17DOCServiceContext)initWithInputItems:(id)a3 listenerEndpoint:(id)a4 contextUUID:(id)a5
{
  uint64_t v8;
  __n128 v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v16;

  v8 = sub_10006922C((uint64_t *)&unk_1006475C0);
  v9.n128_f64[0] = __chkstk_darwin(v8);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
    a3 = (id)static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, (char *)&type metadata for Any + 8);
  if (a5)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)(a5, v9);
    v12 = type metadata accessor for UUID(0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v11, 0, 1, v12);
  }
  else
  {
    v13 = type metadata accessor for UUID(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v11, 1, 1, v13);
  }
  v14 = a4;
  return (_TtC5Files17DOCServiceContext *)sub_10023FEBC((uint64_t)a3, a4, (uint64_t)v11);
}

@end
