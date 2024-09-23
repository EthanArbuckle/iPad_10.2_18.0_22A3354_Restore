@implementation ATXShortcutsEditorGroupedUIFeedbackPublisher

- (ATXShortcutsEditorGroupedUIFeedbackPublisher)initWithUIFeedbackPublisher:(id)a3
{
  id v5;
  ATXShortcutsEditorGroupedUIFeedbackPublisher *v6;
  ATXShortcutsEditorGroupedUIFeedbackPublisher *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXShortcutsEditorGroupedUIFeedbackPublisher;
  v6 = -[ATXShortcutsEditorGroupedUIFeedbackPublisher init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_uiFeedbackPublisher, a3);

  return v7;
}

- (id)shortcutsEditorUIFeedbackPublisher
{
  void *v3;
  BPSPublisher *uiFeedbackPublisher;
  id v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = (void *)objc_opt_new();
  uiFeedbackPublisher = self->_uiFeedbackPublisher;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __82__ATXShortcutsEditorGroupedUIFeedbackPublisher_shortcutsEditorUIFeedbackPublisher__block_invoke;
  v9[3] = &unk_1E57CFD80;
  v10 = v3;
  v5 = v3;
  -[BPSPublisher scanWithInitial:nextPartialResult:](uiFeedbackPublisher, "scanWithInitial:nextPartialResult:", v5, v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "filterWithIsIncluded:", &__block_literal_global_21);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __82__ATXShortcutsEditorGroupedUIFeedbackPublisher_shortcutsEditorUIFeedbackPublisher__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  char isKindOfClass;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sessionMetadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v6, "session");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sessionMetadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v5, "isGroupSessionComplete"))
    {
      v12 = (void *)objc_opt_new();

      objc_msgSend(v12, "setNumShortcutsAtStart:", objc_msgSend(v11, "numStepsInShortcutAtStart"));
      v5 = v12;
    }
    objc_msgSend(v5, "startDateOfFirstSession");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
      objc_msgSend(v5, "setNumShortcutsAtStart:", objc_msgSend(v11, "numStepsInShortcutAtStart"));
    objc_msgSend(v5, "updateWithIntermediateSessionResults:", v6);
    if (objc_msgSend(v11, "stepWasManuallyAdded"))
      objc_msgSend(v5, "setNumManuallyAddedSteps:", objc_msgSend(v5, "numManuallyAddedSteps") + 1);
    if (objc_msgSend(v11, "isLastSession"))
    {
      objc_msgSend(v5, "setIsGroupSessionComplete:", 1);
      objc_msgSend(v5, "setNumShortcutsAtEnd:", objc_msgSend(v11, "numStepsInShortcutAtEnd"));
    }
    v5 = v5;

    v14 = v5;
  }
  else
  {
    __atxlog_handle_blending();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      __82__ATXShortcutsEditorGroupedUIFeedbackPublisher_shortcutsEditorUIFeedbackPublisher__block_invoke_cold_1(v15);

    v14 = *(id *)(a1 + 32);
  }

  return v14;
}

uint64_t __82__ATXShortcutsEditorGroupedUIFeedbackPublisher_shortcutsEditorUIFeedbackPublisher__block_invoke_58(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isGroupSessionComplete");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uiFeedbackPublisher, 0);
}

void __82__ATXShortcutsEditorGroupedUIFeedbackPublisher_shortcutsEditorUIFeedbackPublisher__block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1AA841000, log, OS_LOG_TYPE_FAULT, "There was no session on the feedbackResult while processing Shortcuts Editor feedback.", v1, 2u);
}

@end
