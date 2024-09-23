@implementation SiriSharedUISuggestionsViewProvider

- (id)makeSuggestionsViewWithSuggestionsResizeHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC12SiriSharedUI35SiriSharedUISuggestionsViewProvider *v6;
  _QWORD *v7;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  v7 = sub_1DE10818C((uint64_t)sub_1DE109668, v5);

  swift_release();
  return v7;
}

- (void)makeConversationStarterSuggestionsViewWithDeviceLocked:(BOOL)a3 keyboardShowing:(BOOL)a4 suggestionTapHandler:(id)a5
{
  _BOOL4 v6;
  void *v8;
  uint64_t v9;
  _TtC12SiriSharedUI35SiriSharedUISuggestionsViewProvider *v10;

  v6 = a3;
  v8 = _Block_copy(a5);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  v10 = self;
  sub_1DE10851C(v6, a4, 0, 0, (uint64_t)sub_1DE109804, v9);

  swift_release();
}

- (void)makeConversationStarterSuggestionsViewWithDeviceLocked:(BOOL)a3 keyboardShowing:(BOOL)a4 isVoiceTrigger:(BOOL)a5 suggestionTapHandler:(id)a6
{
  _BOOL4 v6;
  _BOOL4 v8;
  void *v10;
  uint64_t v11;
  _TtC12SiriSharedUI35SiriSharedUISuggestionsViewProvider *v12;

  v6 = a5;
  v8 = a3;
  v10 = _Block_copy(a6);
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v10;
  v12 = self;
  sub_1DE10851C(v8, a4, v6, 0, (uint64_t)sub_1DE109804, v11);

  swift_release();
}

- (void)makeConversationStarterSuggestionsViewWithDeviceLocked:(BOOL)a3 keyboardShowing:(BOOL)a4 isVoiceTrigger:(BOOL)a5 invocationSource:(int64_t)a6 suggestionTapHandler:(id)a7
{
  _BOOL4 v8;
  _BOOL4 v10;
  void *v12;
  uint64_t v13;
  _TtC12SiriSharedUI35SiriSharedUISuggestionsViewProvider *v14;

  v8 = a5;
  v10 = a3;
  v12 = _Block_copy(a7);
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = v12;
  v14 = self;
  sub_1DE10851C(v10, a4, v8, a6, (uint64_t)sub_1DE109804, v13);

  swift_release();
}

- (void)makeConversationContinuerSuggestionsViewWithRequestId:(id)a3 currentMode:(id)a4 deviceLocked:(BOOL)a5 keyboardShowing:(BOOL)a6 suggestionTapHandler:(id)a7
{
  _BOOL4 v8;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  _TtC12SiriSharedUI35SiriSharedUISuggestionsViewProvider *v17;

  v8 = a5;
  v11 = _Block_copy(a7);
  v12 = sub_1DE13095C();
  v14 = v13;
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = v11;
  v16 = a4;
  v17 = self;
  sub_1DE108974(v12, v14, v16, v8, a6, (uint64_t)sub_1DE109658, v15);

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)hideConversationStarterSuggestionsIfNecessary
{
  sub_1DE108D1C(self, (uint64_t)a2, (void (*)(uint64_t))sub_1DE100E18);
}

- (void)showConversationStarterSuggestionsForTwoShot
{
  sub_1DE108D1C(self, (uint64_t)a2, (void (*)(uint64_t))sub_1DE101598);
}

- (void)setShowSuggestions:(BOOL)a3
{
  _TtC12SiriSharedUI35SiriSharedUISuggestionsViewProvider *v4;

  v4 = self;
  swift_retain();
  sub_1DE101B3C(a3);

  swift_release();
}

- (void)filterSuggestionsWithText:(id)a3
{
  sub_1DE13095C();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_1DE13020C();
}

- (_TtC12SiriSharedUI35SiriSharedUISuggestionsViewProvider)init
{
  uint64_t v3;
  _TtC12SiriSharedUI35SiriSharedUISuggestionsViewProvider *v4;
  _QWORD *v5;
  objc_super v7;

  v3 = OBJC_IVAR____TtC12SiriSharedUI35SiriSharedUISuggestionsViewProvider_suggestionsDataModel;
  type metadata accessor for SiriSharedUISuggestionsDataModel();
  swift_allocObject();
  v4 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)sub_1DE10081C();
  v5 = (Class *)((char *)&v4->super.isa
               + OBJC_IVAR____TtC12SiriSharedUI35SiriSharedUISuggestionsViewProvider_suggestionsView);
  *v5 = 0;
  v5[1] = 0;

  v7.receiver = v4;
  v7.super_class = (Class)type metadata accessor for SiriSharedUISuggestionsViewProvider();
  return -[SiriSharedUISuggestionsViewProvider init](&v7, sel_init);
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
}

@end
