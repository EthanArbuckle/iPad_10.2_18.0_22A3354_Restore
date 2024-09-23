@implementation CRLMemoryWriteChannel

- (void)writeData:(id)a3 handler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  void (**v11)(void *, uint64_t, uint64_t, _QWORD);
  id v12;
  _TtC8Freeform21CRLMemoryWriteChannel *v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE v17[24];

  v7 = type metadata accessor for DispatchData(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = &v17[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v11 = (void (**)(void *, uint64_t, uint64_t, _QWORD))_Block_copy(a4);
  static DispatchData._unconditionallyBridgeFromObjectiveC(_:)(a3);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC8Freeform21CRLMemoryWriteChannel_dispatchData, v17, 33, 0);
  v12 = a3;
  v13 = self;
  DispatchData.append(_:)(v10);
  v14 = swift_endAccess(v17);
  v15 = DispatchData.count.getter(v14);
  v11[2](v11, 1, v15, 0);
  (*(void (**)(_BYTE *, uint64_t))(v8 + 8))(v10, v7);
  _Block_release(v11);

}

- (void)flushWithCompletion:(id)a3
{
  _QWORD *v4;
  void (*v5)(_QWORD *, _QWORD);
  _TtC8Freeform21CRLMemoryWriteChannel *v6;

  v4 = _Block_copy(a3);
  v5 = (void (*)(_QWORD *, _QWORD))v4[2];
  v6 = self;
  v5(v4, 0);
  _Block_release(v4);

}

- (void)addBarrier:(id)a3
{
  _QWORD *v4;
  void (*v5)(_QWORD *);
  _TtC8Freeform21CRLMemoryWriteChannel *v6;

  v4 = _Block_copy(a3);
  v5 = (void (*)(_QWORD *))v4[2];
  v6 = self;
  v5(v4);
  _Block_release(v4);

}

- (BOOL)isValid
{
  return 1;
}

- (_TtC8Freeform21CRLMemoryWriteChannel)init
{
  objc_class *ObjectType;
  objc_super v5;

  ObjectType = (objc_class *)swift_getObjectType(self);
  static DispatchData.empty.getter();
  v5.receiver = self;
  v5.super_class = ObjectType;
  return -[CRLMemoryWriteChannel init](&v5, "init");
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR____TtC8Freeform21CRLMemoryWriteChannel_dispatchData;
  v3 = type metadata accessor for DispatchData(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

@end
