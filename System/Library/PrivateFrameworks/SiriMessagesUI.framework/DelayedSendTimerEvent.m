@implementation DelayedSendTimerEvent

- (BOOL)requiresNewTurn
{
  return 0;
}

- (void)emitWithTurnIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC14SiriMessagesUI21DelayedSendTimerEvent *v8;
  uint64_t v9;

  v4 = sub_246E799E4();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_246E799CC();
  v8 = self;
  sub_246E0AAF8();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)emitWithTurnIdentifier:(id)a3 aceViewId:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  _TtC14SiriMessagesUI21DelayedSendTimerEvent *v12;
  void (*v13)(char *, uint64_t);
  uint64_t v14;

  v5 = sub_246E799E4();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v14 - v10;
  sub_246E799CC();
  sub_246E799CC();
  v12 = self;
  sub_246E0ACC4();

  v13 = *(void (**)(char *, uint64_t))(v6 + 8);
  v13(v9, v5);
  v13(v11, v5);
}

- (_TtC14SiriMessagesUI21DelayedSendTimerEvent)init
{
  sub_246E0B000();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
