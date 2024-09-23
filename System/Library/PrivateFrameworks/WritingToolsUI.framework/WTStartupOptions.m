@implementation WTStartupOptions

- (NSString)prompt
{
  char *v2;
  void *v3;

  v2 = (char *)self + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_prompt;
  swift_beginAccess();
  if (!*((_QWORD *)v2 + 1))
    return (NSString *)0;
  swift_bridgeObjectRetain();
  v3 = (void *)sub_24A7EB59C();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)setPrompt:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;

  if (a3)
  {
    v4 = sub_24A7EB5A8();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_prompt);
  swift_beginAccess();
  *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (int64_t)requestedTool
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_requestedTool);
  swift_beginAccess();
  return *v2;
}

- (void)setRequestedTool:(int64_t)a3
{
  int64_t *v4;

  v4 = (int64_t *)((char *)self + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_requestedTool);
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)editable
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_editable;
  swift_beginAccess();
  return *v2;
}

- (void)setEditable:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_editable;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)wantsInlineEditing
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_wantsInlineEditing;
  swift_beginAccess();
  return *v2;
}

- (void)setWantsInlineEditing:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_wantsInlineEditing;
  swift_beginAccess();
  *v4 = a3;
}

- (unint64_t)allowedResultOptions
{
  unint64_t *v2;

  v2 = (unint64_t *)((char *)self + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_allowedResultOptions);
  swift_beginAccess();
  return *v2;
}

- (void)setAllowedResultOptions:(unint64_t)a3
{
  unint64_t *v4;

  v4 = (unint64_t *)((char *)self + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_allowedResultOptions);
  swift_beginAccess();
  *v4 = a3;
}

- (WTSmartReplyConfiguration)smartReplyConfiguration
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_smartReplyConfiguration);
  swift_beginAccess();
  return (WTSmartReplyConfiguration *)*v2;
}

- (void)setSmartReplyConfiguration:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_smartReplyConfiguration);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (BOOL)isForInputDashboard
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_isForInputDashboard;
  swift_beginAccess();
  return *v2;
}

- (void)setIsForInputDashboard:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_isForInputDashboard;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)isForAssistant
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_isForAssistant;
  swift_beginAccess();
  return *v2;
}

- (void)setIsForAssistant:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_isForAssistant;
  swift_beginAccess();
  *v4 = a3;
}

- (NSUUID)sessionUUID
{
  return (NSUUID *)sub_24A7E7D88((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_sessionUUID);
}

- (void)setSessionUUID:(id)a3
{
  sub_24A7E7EC8(self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_sessionUUID);
}

- (NSUUID)suggestionUUID
{
  return (NSUUID *)sub_24A7E7D88((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_suggestionUUID);
}

- (void)setSuggestionUUID:(id)a3
{
  sub_24A7E7EC8(self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_suggestionUUID);
}

- (NSUUID)contextUUID
{
  return (NSUUID *)sub_24A7E7D88((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_contextUUID);
}

- (void)setContextUUID:(id)a3
{
  sub_24A7E7EC8(self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_contextUUID);
}

- (BOOL)isQuestionnairePopover
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_isQuestionnairePopover;
  swift_beginAccess();
  return *v2;
}

- (void)setIsQuestionnairePopover:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_isQuestionnairePopover;
  swift_beginAccess();
  *v4 = a3;
}

- (_TtC14WritingToolsUI16WTStartupOptions)init
{
  return (_TtC14WritingToolsUI16WTStartupOptions *)WTStartupOptions.init()();
}

- (id)asBSActionAndReturnError:(id *)a3
{
  _TtC14WritingToolsUI16WTStartupOptions *v4;
  void *v5;

  sub_24A7EA2C0();
  v4 = self;
  v5 = (void *)sub_24A7EB578();

  return v5;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_smartReplyConfiguration));
  sub_24A7E9E90((uint64_t)self + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_sessionUUID);
  sub_24A7E9E90((uint64_t)self + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_suggestionUUID);
  sub_24A7E9E90((uint64_t)self + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_contextUUID);
}

@end
