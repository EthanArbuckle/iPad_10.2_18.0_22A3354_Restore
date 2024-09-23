@implementation UEIKeyboardInvocationEvent

- (BOOL)requiresNewTurn
{
  return 1;
}

- (void)emitWithTurnIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC9SnippetUI26UEIKeyboardInvocationEvent *v8;
  uint64_t v9;

  v4 = sub_21F10ECA4();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21F10EC8C();
  v8 = self;
  sub_21EF9489C((uint64_t)v7);

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
  _TtC9SnippetUI26UEIKeyboardInvocationEvent *v12;
  void (*v13)(char *, uint64_t);
  uint64_t v14;

  v5 = sub_21F10ECA4();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v14 - v10;
  sub_21F10EC8C();
  sub_21F10EC8C();
  v12 = self;
  sub_21EF949EC();

  v13 = *(void (**)(char *, uint64_t))(v6 + 8);
  v13(v8, v5);
  v13(v11, v5);
}

- (_TtC9SnippetUI26UEIKeyboardInvocationEvent)init
{
  return (_TtC9SnippetUI26UEIKeyboardInvocationEvent *)UEIKeyboardInvocationEvent.init()();
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SnippetUI26UEIKeyboardInvocationEvent_instrumentationClient);
  swift_bridgeObjectRelease();
}

@end
