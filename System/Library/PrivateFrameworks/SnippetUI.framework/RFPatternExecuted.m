@implementation RFPatternExecuted

- (NSString)patternId
{
  return (NSString *)sub_21EF3BDF4(self, (uint64_t)a2, RFPatternExecuted.patternId.getter);
}

- (NSString)patternType
{
  return (NSString *)sub_21EF3BDF4(self, (uint64_t)a2, RFPatternExecuted.patternType.getter);
}

- (NSString)responseViewId
{
  return (NSString *)sub_21EF3BDF4(self, (uint64_t)a2, RFPatternExecuted.responseViewId.getter);
}

- (NSString)responseMode
{
  return (NSString *)sub_21EF3BDF4(self, (uint64_t)a2, RFPatternExecuted.responseMode.getter);
}

- (_TtC9SnippetUI17RFPatternExecuted)initWithPatternId:(id)a3 patternType:(id)a4 responseMode:(id)a5
{
  if (a3)
  {
    sub_21F11369C();
    if (a4)
      goto LABEL_3;
LABEL_6:
    if (!a5)
      return (_TtC9SnippetUI17RFPatternExecuted *)RFPatternExecuted.init(patternId:patternType:responseMode:)();
    goto LABEL_4;
  }
  if (!a4)
    goto LABEL_6;
LABEL_3:
  sub_21F11369C();
  if (a5)
LABEL_4:
    sub_21F11369C();
  return (_TtC9SnippetUI17RFPatternExecuted *)RFPatternExecuted.init(patternId:patternType:responseMode:)();
}

- (_TtC9SnippetUI17RFPatternExecuted)initWithPatternId:(id)a3 patternType:(id)a4 responseViewId:(id)a5 responseMode:(id)a6
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v8 = (uint64_t)a4;
  if (a3)
  {
    v9 = sub_21F11369C();
    v11 = v10;
    if (v8)
      goto LABEL_3;
  }
  else
  {
    v9 = 0;
    v11 = 0;
    if (a4)
    {
LABEL_3:
      v8 = sub_21F11369C();
      v13 = v12;
      if (a5)
        goto LABEL_4;
LABEL_8:
      v15 = 0;
      if (a6)
        goto LABEL_5;
LABEL_9:
      v16 = 0;
      v18 = 0;
      return (_TtC9SnippetUI17RFPatternExecuted *)RFPatternExecuted.init(patternId:patternType:responseViewId:responseMode:)(v9, v11, v8, v13, (uint64_t)a5, v15, v16, v18);
    }
  }
  v13 = 0;
  if (!a5)
    goto LABEL_8;
LABEL_4:
  a5 = (id)sub_21F11369C();
  v15 = v14;
  if (!a6)
    goto LABEL_9;
LABEL_5:
  v16 = sub_21F11369C();
  v18 = v17;
  return (_TtC9SnippetUI17RFPatternExecuted *)RFPatternExecuted.init(patternId:patternType:responseViewId:responseMode:)(v9, v11, v8, v13, (uint64_t)a5, v15, v16, v18);
}

- (void)emitWithTurnIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC9SnippetUI17RFPatternExecuted *v8;
  uint64_t v9;

  v4 = sub_21F10ECA4();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21F10EC8C();
  v8 = self;
  sub_21EF3C248((uint64_t)v7);

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
  _TtC9SnippetUI17RFPatternExecuted *v12;
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
  sub_21EF3C3AC((uint64_t)v11, (uint64_t)v8);

  v13 = *(void (**)(char *, uint64_t))(v6 + 8);
  v13(v8, v5);
  v13(v11, v5);
}

- (_TtC9SnippetUI17RFPatternExecuted)init
{
  RFPatternExecuted.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_26_10();
  OUTLINED_FUNCTION_26_10();
  OUTLINED_FUNCTION_26_10();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SnippetUI17RFPatternExecuted_instrumentationClient);
}

@end
