@implementation OnSnippetInteractionPerformed

- (void)emitWithTurnIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC14SiriMessagesUI29OnSnippetInteractionPerformed *v8;
  uint64_t v9;

  v4 = sub_246E799E4();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_246E799CC();
  v8 = self;
  sub_246E6CD30();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)emitWithTurnIdentifier:(id)a3 aceViewId:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  _TtC14SiriMessagesUI29OnSnippetInteractionPerformed *v12;
  void (*v13)(char *, uint64_t);
  uint64_t v14;

  v5 = sub_246E799E4();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v14 - v10;
  sub_246E799CC();
  sub_246E799CC();
  v12 = self;
  sub_246E6CEFC();

  v13 = *(void (**)(char *, uint64_t))(v6 + 8);
  v13(v8, v5);
  v13(v11, v5);
}

- (_TtC14SiriMessagesUI29OnSnippetInteractionPerformed)init
{
  sub_246E6D33C();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC14SiriMessagesUI29OnSnippetInteractionPerformed_interactionType;
  v4 = OUTLINED_FUNCTION_6_14();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
}

@end
