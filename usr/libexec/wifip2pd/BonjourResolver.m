@implementation BonjourResolver

- (void)datapathFailedToStartWithError:(int64_t)a3
{
  uint64_t *v3;
  void (*v4)(uint64_t);
  uint64_t v5;
  _TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB15BonjourResolver *v6;
  uint64_t v7;
  uint64_t v8;
  _TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB15BonjourResolver *v9;
  uint64_t v10;

  v3 = (uint64_t *)((char *)self
                 + OBJC_IVAR____TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB15BonjourResolver_terminationHandler);
  v4 = *(void (**)(uint64_t))((char *)&self->super.isa
                                      + OBJC_IVAR____TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB15BonjourResolver_terminationHandler);
  if (v4)
  {
    v5 = v3[1];
    v6 = self;
    v7 = sub_1000339E4((uint64_t)v4, v5);
    v4(v7);
    sub_100012318((uint64_t)v4, v5);
    v8 = *v3;
  }
  else
  {
    v9 = self;
    v8 = 0;
  }
  v10 = v3[1];
  *v3 = 0;
  v3[1] = 0;
  sub_100012318(v8, v10);

}

- (void)datapathConfirmedForPeerDataAddress:(id)a3 serviceSpecificInfo:(id)a4
{
  id v6;
  id v7;
  _TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB15BonjourResolver *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_10002C16C((uint64_t)v6, a4);

}

- (void)datapathUpdatedServiceSpecificInfo:(id)a3
{
  id v5;
  _TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB15BonjourResolver *v6;

  v5 = a3;
  v6 = self;
  sub_10002C8CC(a3);

}

- (void)datapathTerminatedWithReason:(int64_t)a3
{
  _TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB15BonjourResolver *v3;

  v3 = self;
  sub_100032FD8();

}

- (_TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB15BonjourResolver)init
{
  _TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB15BonjourResolver *result;

  result = (_TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB15BonjourResolver *)_swift_stdlib_reportUnimplementedInitializer("CoreP2P.BonjourResolver", 23, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = (char *)self + OBJC_IVAR____TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB15BonjourResolver_logger;
  v4 = type metadata accessor for Logger(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = *(_QWORD *)&self->service[OBJC_IVAR____TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB15BonjourResolver_service];
  swift_bridgeObjectRelease(*(_QWORD *)&self->service[OBJC_IVAR____TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB15BonjourResolver_service
                                                    + 16]);
  swift_bridgeObjectRelease(v5);
  sub_100033A84((uint64_t)self + OBJC_IVAR____TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB15BonjourResolver_srv, &qword_100404B80);
  sub_100032C48(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB15BonjourResolver_aaaa), *(_QWORD *)&self->service[OBJC_IVAR____TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB15BonjourResolver_aaaa], *(_QWORD *)&self->service[OBJC_IVAR____TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB15BonjourResolver_aaaa + 8], *(_QWORD *)&self->service[OBJC_IVAR____TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB15BonjourResolver_aaaa + 16], *(_QWORD *)&self->service[OBJC_IVAR____TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB15BonjourResolver_aaaa + 24], *(_QWORD *)&self->service[OBJC_IVAR____TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB15BonjourResolver_aaaa + 32], *(_QWORD *)&self->aaaa[OBJC_IVAR____TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB15BonjourResolver_aaaa + 6], *(_QWORD *)&self->aaaa[OBJC_IVAR____TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB15BonjourResolver_aaaa + 14]);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB15BonjourResolver_delegate));
  sub_100012318(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB15BonjourResolver_terminationHandler), *(_QWORD *)&self->service[OBJC_IVAR____TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB15BonjourResolver_terminationHandler]);
}

@end
