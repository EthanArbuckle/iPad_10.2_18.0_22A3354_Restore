@implementation CRLPasteboardReadChannel

- (void)readFromOffset:(uint64_t)a3 length:(uint64_t)a4 handler:(void *)aBlock
{
  void *v8;
  id v9;

  v8 = _Block_copy(aBlock);
  _Block_copy(v8);
  v9 = a1;
  sub_10085A984(a3, a4, (uint64_t)v9, (uint64_t)v8);
  _Block_release(v8);
  _Block_release(v8);

}

- (void)close
{
  char *v3;
  _TtC8Freeform24CRLPasteboardReadChannel *v4;
  _BYTE v5[24];
  _OWORD v6[2];
  uint64_t v7;

  v7 = 0;
  memset(v6, 0, sizeof(v6));
  v3 = (char *)self + OBJC_IVAR____TtC8Freeform24CRLPasteboardReadChannel_pasteboardDataManaging;
  swift_beginAccess((char *)self + OBJC_IVAR____TtC8Freeform24CRLPasteboardReadChannel_pasteboardDataManaging, v5, 33, 0);
  v4 = self;
  sub_10085A93C((uint64_t)v6, (uint64_t)v3);
  swift_endAccess(v5);

}

- (void)addBarrier:(id)a3
{
  _QWORD *v4;
  void (*v5)(_QWORD *);
  _TtC8Freeform24CRLPasteboardReadChannel *v6;

  v4 = _Block_copy(a3);
  v5 = (void (*)(_QWORD *))v4[2];
  v6 = self;
  v5(v4);
  _Block_release(v4);

}

- (BOOL)isValid
{
  char *v2;
  _QWORD v4[5];
  _BYTE v5[24];

  v2 = (char *)self + OBJC_IVAR____TtC8Freeform24CRLPasteboardReadChannel_pasteboardDataManaging;
  swift_beginAccess((char *)self + OBJC_IVAR____TtC8Freeform24CRLPasteboardReadChannel_pasteboardDataManaging, v5, 0, 0);
  sub_10085B500((uint64_t)v2, (uint64_t)v4);
  LOBYTE(v2) = v4[3] != 0;
  sub_10085B548((uint64_t)v4);
  return (char)v2;
}

- (void)readWithHandler:(void *)aBlock
{
  void *v4;
  id v5;

  v4 = _Block_copy(aBlock);
  _Block_copy(v4);
  v5 = a1;
  sub_10085A984(0, 0x7FFFFFFFFFFFFFFFLL, (uint64_t)v5, (uint64_t)v4);
  _Block_release(v4);
  _Block_release(v4);

}

- (_TtC8Freeform24CRLPasteboardReadChannel)init
{
  _TtC8Freeform24CRLPasteboardReadChannel *result;

  result = (_TtC8Freeform24CRLPasteboardReadChannel *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLPasteboardReadChannel", 33, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10085B548((uint64_t)self + OBJC_IVAR____TtC8Freeform24CRLPasteboardReadChannel_pasteboardDataManaging);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
