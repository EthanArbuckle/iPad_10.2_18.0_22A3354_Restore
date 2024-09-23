@implementation CRLMemoryReadChannel

- (void)readFromOffset:(uint64_t)a3 length:(uint64_t)a4 handler:(void *)aBlock
{
  void *v8;
  id v9;

  v8 = _Block_copy(aBlock);
  _Block_copy(v8);
  v9 = a1;
  sub_1009ED3B4(a3, a4, (uint64_t)v9);
  _Block_release(v8);
  _Block_release(v8);

}

- (void)addBarrier:(id)a3
{
  _QWORD *v4;
  void (*v5)(_QWORD *);
  _TtC8Freeform20CRLMemoryReadChannel *v6;

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

- (void)readWithHandler:(id)a3
{
  void (**v4)(void *, uint64_t, id, _QWORD);
  Class isa;
  id v6;
  _TtC8Freeform20CRLMemoryReadChannel *v7;

  v4 = (void (**)(void *, uint64_t, id, _QWORD))_Block_copy(a3);
  v7 = self;
  isa = Data._bridgeToObjectiveC()().super.isa;
  v6 = -[objc_class crl_dispatchData](isa, "crl_dispatchData");

  v4[2](v4, 1, v6, 0);
  _Block_release(v4);

}

- (void)readWithHandlerAndWait:(id)a3
{
  void (**v4)(void *, uint64_t, id, _QWORD);
  Class isa;
  id v6;
  _TtC8Freeform20CRLMemoryReadChannel *v7;

  v4 = (void (**)(void *, uint64_t, id, _QWORD))_Block_copy(a3);
  v7 = self;
  isa = Data._bridgeToObjectiveC()().super.isa;
  v6 = -[objc_class crl_dispatchData](isa, "crl_dispatchData");

  v4[2](v4, 1, v6, 0);
  _Block_release(v4);

}

- (_TtC8Freeform20CRLMemoryReadChannel)init
{
  _TtC8Freeform20CRLMemoryReadChannel *result;

  result = (_TtC8Freeform20CRLMemoryReadChannel *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLMemoryReadChannel", 29, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1004BBBC8(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform20CRLMemoryReadChannel_data), *(_QWORD *)&self->data[OBJC_IVAR____TtC8Freeform20CRLMemoryReadChannel_data]);
}

@end
