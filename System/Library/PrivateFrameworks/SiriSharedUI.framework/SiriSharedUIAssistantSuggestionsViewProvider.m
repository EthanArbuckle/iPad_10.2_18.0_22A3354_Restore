@implementation SiriSharedUIAssistantSuggestionsViewProvider

- (_TtC12SiriSharedUI44SiriSharedUIAssistantSuggestionsViewProvider)initWithTapHandler:(id)a3
{
  void *v3;
  char *v4;

  v3 = _Block_copy(a3);
  v4 = sub_1DE117874();
  _Block_release(v3);
  return (_TtC12SiriSharedUI44SiriSharedUIAssistantSuggestionsViewProvider *)v4;
}

- (_TtC12SiriSharedUI44SiriSharedUIAssistantSuggestionsViewProvider)initWithPressDownHandler:(id)a3 pressUpHandler:(id)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;

  v5 = _Block_copy(a3);
  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v5;
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = v6;
  v9 = sub_1DE117A5C((uint64_t)sub_1DE11882C, v7, (uint64_t)sub_1DE118ACC, v8);
  swift_release();
  swift_release();
  return (_TtC12SiriSharedUI44SiriSharedUIAssistantSuggestionsViewProvider *)v9;
}

- (void)fetchConversationStarterViewsWithDeviceLocked:(BOOL)a3 isVoiceTrigger:(BOOL)a4 invocationSource:(int64_t)a5 isFirstInvocationSinceOSInstalled:(BOOL)a6 completion:(id)a7
{
  void *v11;
  uint64_t v12;
  _TtC12SiriSharedUI44SiriSharedUIAssistantSuggestionsViewProvider *v13;

  v11 = _Block_copy(a7);
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = v11;
  v13 = self;
  sub_1DE117CC4(a3, a5, a6, (uint64_t)sub_1DE118AA4, v12);
  swift_release();

}

- (void)fetchConversationContinuerViewsWithRequestId:(id)a3 currentMode:(id)a4 deviceLocked:(BOOL)a5 completion:(id)a6
{
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _TtC12SiriSharedUI44SiriSharedUIAssistantSuggestionsViewProvider *v14;
  id v15;

  v9 = _Block_copy(a6);
  v10 = sub_1DE13095C();
  v12 = v11;
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = v9;
  v15 = a4;
  v14 = self;
  sub_1DE114EEC(v10, v12, v15, a5, (uint64_t)sub_1DE118804, v13);
  swift_release();
  swift_bridgeObjectRelease();

}

- (void)fetchAutoCompletionViewsWithQuery:(id)a3 deviceLocked:(BOOL)a4 completion:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _TtC12SiriSharedUI44SiriSharedUIAssistantSuggestionsViewProvider *v17;
  uint64_t v18;
  os_log_type_t v19;
  uint64_t v20;
  uint64_t v21;
  _TtC12SiriSharedUI44SiriSharedUIAssistantSuggestionsViewProvider *v22;
  uint64_t v23;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F0433458);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a5);
  v12 = sub_1DE13095C();
  v14 = v13;
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = v11;
  v16 = qword_1F0432E68;
  v17 = self;
  if (v16 != -1)
    swift_once();
  v18 = sub_1DE1301A0();
  __swift_project_value_buffer(v18, (uint64_t)qword_1F0434700);
  v19 = sub_1DE130A94();
  sub_1DE106320(v19, 0, 0xD000000000000038, 0x80000001DE13B820, 0xD00000000000002ELL, 0x80000001DE13B860);
  v20 = sub_1DE130A40();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(v10, 1, 1, v20);
  v21 = swift_allocObject();
  *(_QWORD *)(v21 + 16) = 0;
  *(_QWORD *)(v21 + 24) = 0;
  *(_QWORD *)(v21 + 32) = v17;
  *(_QWORD *)(v21 + 40) = v12;
  *(_QWORD *)(v21 + 48) = v14;
  *(_BYTE *)(v21 + 56) = a4;
  *(_QWORD *)(v21 + 64) = sub_1DE1186D4;
  *(_QWORD *)(v21 + 72) = v15;
  v22 = v17;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1DE108048((uint64_t)v10, (uint64_t)&unk_1F04354A0, v21);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

}

- (id)getSuggestionViewsWithText:(id)a3
{
  _TtC12SiriSharedUI44SiriSharedUIAssistantSuggestionsViewProvider *v3;
  void *v4;

  v3 = self;
  sub_1DE118048();
  swift_bridgeObjectRetain();

  sub_1DE1005A8(0, (unint64_t *)&qword_1F0435290);
  v4 = (void *)sub_1DE1309B0();
  swift_bridgeObjectRelease();
  return v4;
}

- (id)getInitialSuggestionViews
{
  _TtC12SiriSharedUI44SiriSharedUIAssistantSuggestionsViewProvider *v2;
  void *v3;

  v2 = self;
  sub_1DE118048();
  swift_bridgeObjectRetain();

  sub_1DE1005A8(0, (unint64_t *)&qword_1F0435290);
  v3 = (void *)sub_1DE1309B0();
  swift_bridgeObjectRelease();
  return v3;
}

- (void)resetSuggestions
{
  _QWORD *v3;
  uint64_t v4;
  _TtC12SiriSharedUI44SiriSharedUIAssistantSuggestionsViewProvider *v5;
  _QWORD *v6;

  v3 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtC12SiriSharedUI44SiriSharedUIAssistantSuggestionsViewProvider_suggestionViews);
  swift_beginAccess();
  v4 = MEMORY[0x1E0DEE9D8];
  *v3 = MEMORY[0x1E0DEE9D8];
  v5 = self;
  swift_bridgeObjectRelease();
  v6 = (Class *)((char *)&v5->super.isa
               + OBJC_IVAR____TtC12SiriSharedUI44SiriSharedUIAssistantSuggestionsViewProvider_suggestionsList);
  swift_beginAccess();
  *v6 = v4;

  swift_bridgeObjectRelease();
}

- (void)suggestionsWereShownForCallback
{
  _TtC12SiriSharedUI44SiriSharedUIAssistantSuggestionsViewProvider *v2;

  v2 = self;
  sub_1DE117204();

}

- (_TtC12SiriSharedUI44SiriSharedUIAssistantSuggestionsViewProvider)init
{
  _TtC12SiriSharedUI44SiriSharedUIAssistantSuggestionsViewProvider *result;

  result = (_TtC12SiriSharedUI44SiriSharedUIAssistantSuggestionsViewProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1DE0EDB88((uint64_t)self + OBJC_IVAR____TtC12SiriSharedUI44SiriSharedUIAssistantSuggestionsViewProvider_requestId, &qword_1F0433BB8);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12SiriSharedUI44SiriSharedUIAssistantSuggestionsViewProvider_suggestionsProvider));
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
}

@end
