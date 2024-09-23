@implementation ProactiveSuggestionProvider

- (void)hksp_suggestedSleepScheduleWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  _TtC13SleepHealthUI27ProactiveSuggestionProvider *v7;
  id v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[6];

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = objc_allocWithZone(MEMORY[0x1E0CF90D0]);
  v7 = self;
  v8 = objc_msgSend(v6, sel_init);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = sub_1A9BB6660;
  *(_QWORD *)(v9 + 24) = v5;
  v11[4] = sub_1A9BB714C;
  v11[5] = v9;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 1107296256;
  v11[2] = sub_1A9BB6368;
  v11[3] = &block_descriptor_11;
  v10 = _Block_copy(v11);
  swift_retain();
  swift_release();
  objc_msgSend(v8, sel_predictedSleepSuggestionWithCompletionHandler_, v10);
  _Block_release(v10);

  swift_release();
}

- (_TtC13SleepHealthUI27ProactiveSuggestionProvider)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ProactiveSuggestionProvider();
  return -[ProactiveSuggestionProvider init](&v3, sel_init);
}

@end
