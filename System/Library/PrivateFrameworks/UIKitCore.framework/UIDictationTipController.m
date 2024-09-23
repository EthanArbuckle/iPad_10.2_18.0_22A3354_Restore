@implementation UIDictationTipController

- (UIDictationTipController)init
{
  UIDictationTipController *v2;
  UIDictationTipPresentationHandler *v3;
  UIDictationTipPresentationHandler *dictationTipPresentationHandler;
  UIDictationTipReplacementHandler *v5;
  UIDictationTipReplacementHandler *dictationReplacementTipHandler;
  UIDictationTipDeletionHandler *v7;
  UIDictationTipDeletionHandler *dictationDeletionTipHandler;
  UIDictationTipEmojiHandler *v9;
  UIDictationTipEmojiHandler *dictationEmojiTipHandler;
  UIDictationTipSelectionHandler *v11;
  UIDictationTipSelectionHandler *dictationSelectionTipHandler;
  UIDictationTipInsertionHandler *v13;
  UIDictationTipInsertionHandler *dictationInsertionTipHandler;
  UIDictationTipModelessInputHandler *v15;
  UIDictationTipModelessInputHandler *dictationTipModelessInputHandler;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)UIDictationTipController;
  v2 = -[UIDictationTipController init](&v18, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(UIDictationTipPresentationHandler);
    dictationTipPresentationHandler = v2->_dictationTipPresentationHandler;
    v2->_dictationTipPresentationHandler = v3;

    v5 = -[UIDictationTipReplacementHandler initWithDelegate:]([UIDictationTipReplacementHandler alloc], "initWithDelegate:", v2);
    dictationReplacementTipHandler = v2->_dictationReplacementTipHandler;
    v2->_dictationReplacementTipHandler = v5;

    v7 = -[UIDictationTipDeletionHandler initWithDelegate:]([UIDictationTipDeletionHandler alloc], "initWithDelegate:", v2);
    dictationDeletionTipHandler = v2->_dictationDeletionTipHandler;
    v2->_dictationDeletionTipHandler = v7;

    v9 = objc_alloc_init(UIDictationTipEmojiHandler);
    dictationEmojiTipHandler = v2->_dictationEmojiTipHandler;
    v2->_dictationEmojiTipHandler = v9;

    v11 = -[UIDictationTipSelectionHandler initWithDelegate:]([UIDictationTipSelectionHandler alloc], "initWithDelegate:", v2);
    dictationSelectionTipHandler = v2->_dictationSelectionTipHandler;
    v2->_dictationSelectionTipHandler = v11;

    v13 = -[UIDictationTipInsertionHandler initWithDelegate:]([UIDictationTipInsertionHandler alloc], "initWithDelegate:", v2);
    dictationInsertionTipHandler = v2->_dictationInsertionTipHandler;
    v2->_dictationInsertionTipHandler = v13;

    v15 = -[UIDictationTipModelessInputHandler initWithDelegate:]([UIDictationTipModelessInputHandler alloc], "initWithDelegate:", v2);
    dictationTipModelessInputHandler = v2->_dictationTipModelessInputHandler;
    v2->_dictationTipModelessInputHandler = v15;

  }
  return v2;
}

- (void)resetShowModelessTipSignal
{
  id v2;

  -[UIDictationTipController dictationTipModelessInputHandler](self, "dictationTipModelessInputHandler");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resetDictationTipModelessHandlerSignalFlags");

}

- (UIDictationTipModelessInputHandler)dictationTipModelessInputHandler
{
  return self->_dictationTipModelessInputHandler;
}

+ (id)dictationTipPreferenceKey:(int64_t)a3
{
  if ((unint64_t)a3 > 8)
    return 0;
  else
    return **((id **)&unk_1E16EB060 + a3);
}

- (void)presentDelayedTipIfNeeded
{
  void (**v2)(void);

  if (self->_delayedTip)
  {
    -[UIDictationTipController delayedTip](self, "delayedTip");
    v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v2[2]();

  }
}

- (BOOL)dictationTipShown:(int64_t)a3
{
  return -[UIDictationTipPresentationHandler dictationTipShownOverLimit:](self->_dictationTipPresentationHandler, "dictationTipShownOverLimit:", a3);
}

- (int64_t)getDictationTipSignaled
{
  return -[UIDictationTipPresentationHandler getDictationTipSignaled](self->_dictationTipPresentationHandler, "getDictationTipSignaled");
}

- (void)showDictationTipWithTitle:(id)a3 description:(id)a4 dictationTipType:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16[2];
  id location;

  v8 = a3;
  v9 = a4;
  +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isDictationPaused");
  if (a5 == 7 || !v11)
  {

  }
  else
  {

    if (a5 != 5)
    {
      objc_initWeak(&location, self);
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __83__UIDictationTipController_showDictationTipWithTitle_description_dictationTipType___block_invoke;
      v13[3] = &unk_1E16E2FF0;
      objc_copyWeak(v16, &location);
      v14 = v8;
      v15 = v9;
      v16[1] = (id)a5;
      -[UIDictationTipController setDelayedTip:](self, "setDelayedTip:", v13);

      objc_destroyWeak(v16);
      objc_destroyWeak(&location);
      goto LABEL_10;
    }
  }
  if (!-[UIDictationTipPresentationHandler isShowingTip](self->_dictationTipPresentationHandler, "isShowingTip")
    && (objc_msgSend(v9, "_containsEmoji") & 1) == 0)
  {
    -[UIDictationTipPresentationHandler signalTipPresentedInCurrentDictationSession](self->_dictationTipPresentationHandler, "signalTipPresentedInCurrentDictationSession");
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "presentDictationMenuTipWithTitle:description:", v8, v9);

    -[UIDictationTipController incrementDictationTipDisplayCount:stopFutureShowing:](self, "incrementDictationTipDisplayCount:stopFutureShowing:", a5, 0);
    -[UIDictationTipController emitTipShowingInstrumentation:](self, "emitTipShowingInstrumentation:", a5);
    -[UIDictationTipController setDelayedTip:](self, "setDelayedTip:", 0);
  }
  -[UIDictationTipPresentationHandler resetDictationTipSignal](self->_dictationTipPresentationHandler, "resetDictationTipSignal");
LABEL_10:

}

void __83__UIDictationTipController_showDictationTipWithTitle_description_dictationTipType___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "showDictationTipWithTitle:description:dictationTipType:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));

}

- (void)dictationCommandUsed:(unint64_t)a3 firstTargetString:(id)a4 secondTargetString:(id)a5
{
  unint64_t v8;
  id v9;

  v9 = a5;
  if ((objc_msgSend(a4, "_containsEmoji") & 1) != 0 || objc_msgSend(v9, "_containsEmoji"))
    -[UIDictationTipController incrementDictationTipDisplayCount:stopFutureShowing:](self, "incrementDictationTipDisplayCount:stopFutureShowing:", 3, 1);
  v8 = a3 - 1;
  if (a3 - 1 <= 0x13 && ((0x8603Bu >> v8) & 1) != 0)
    -[UIDictationTipController markDictationTipPreferenceToShown:](self, "markDictationTipPreferenceToShown:", qword_186685518[v8]);

}

- (void)incrementDictationTipDisplayCount:(int64_t)a3 stopFutureShowing:(BOOL)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  if (a4)
  {
    +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "valueForPreferenceKey:", *MEMORY[0x1E0DBDEE0]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "integerValue");
  }
  else
  {
    -[UIDictationTipController dictationTipPresentationHandler](self, "dictationTipPresentationHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "dictationTipDisplayCount:", a3) + 1;
  }

  +[UIDictationTipController dictationTipPreferenceKey:](UIDictationTipController, "dictationTipPreferenceKey:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v12 = v8;
    +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "preferencesActions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "updateDictationTipDisplayCount:dictationTipKey:", v11, v12);

    v8 = v12;
  }

}

- (void)markDictationTipPreferenceToShown:(int64_t)a3
{
  if (a3 != 9)
    -[UIDictationTipController incrementDictationTipDisplayCount:stopFutureShowing:](self, "incrementDictationTipDisplayCount:stopFutureShowing:", a3, 1);
}

- (void)reset
{
  -[UIDictationTipPresentationHandler resetHandler](self->_dictationTipPresentationHandler, "resetHandler");
  -[UIDictationTipReplacementHandler resetHandler](self->_dictationReplacementTipHandler, "resetHandler");
  -[UIDictationTipDeletionHandler resetHandler](self->_dictationDeletionTipHandler, "resetHandler");
  -[UIDictationTipInsertionHandler resetHandler](self->_dictationInsertionTipHandler, "resetHandler");
}

- (int64_t)activeTipType
{
  return -[UIDictationTipPresentationHandler getDictationTipSignaled](self->_dictationTipPresentationHandler, "getDictationTipSignaled");
}

- (void)logDictationTipDimissialInstrumentation
{
  unint64_t v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  objc_class *v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v2 = -[UIDictationTipController dismissalReasonType](self, "dismissalReasonType");
  v3 = objc_alloc_init((Class)getSISchemaUEIDictationDiscoveryToolTipDisplayContextClass());
  v4 = objc_alloc((Class)getSISchemaUUIDClass_0());
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_sessionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithNSUUID:", v6);
  objc_msgSend(v3, "setContextId:", v7);

  v15 = 0;
  v16 = &v15;
  v17 = 0x2050000000;
  v8 = (void *)getSISchemaUEIDictationDiscoveryToolTipDismissedClass_softClass;
  v18 = getSISchemaUEIDictationDiscoveryToolTipDismissedClass_softClass;
  if (!getSISchemaUEIDictationDiscoveryToolTipDismissedClass_softClass)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __getSISchemaUEIDictationDiscoveryToolTipDismissedClass_block_invoke;
    v14[3] = &unk_1E16B14C0;
    v14[4] = &v15;
    __getSISchemaUEIDictationDiscoveryToolTipDismissedClass_block_invoke((uint64_t)v14);
    v8 = (void *)v16[3];
  }
  if (v2 == 2)
    v9 = 2;
  else
    v9 = v2 == 1;
  v10 = objc_retainAutorelease(v8);
  _Block_object_dispose(&v15, 8);
  v11 = objc_alloc_init(v10);
  objc_msgSend(v11, "setDismissalReason:", v9);
  objc_msgSend(v3, "setEnded:", v11);
  +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "currentInstrumentationContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "emitInstrumentation:", v3);

}

- (void)emitTipShowingInstrumentation:(int64_t)a3
{
  void *v4;
  objc_class *v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v17 = 0;
  v18 = &v17;
  v19 = 0x2050000000;
  v4 = (void *)getSISchemaUEIDictationDiscoveryToolTipShownClass_softClass;
  v20 = getSISchemaUEIDictationDiscoveryToolTipShownClass_softClass;
  if (!getSISchemaUEIDictationDiscoveryToolTipShownClass_softClass)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __getSISchemaUEIDictationDiscoveryToolTipShownClass_block_invoke;
    v16[3] = &unk_1E16B14C0;
    v16[4] = &v17;
    __getSISchemaUEIDictationDiscoveryToolTipShownClass_block_invoke((uint64_t)v16);
    v4 = (void *)v18[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v17, 8);
  v6 = objc_alloc_init(v5);
  v7 = v6;
  if ((unint64_t)a3 > 6)
    v8 = 0;
  else
    v8 = dword_1866855B8[a3];
  objc_msgSend(v6, "setToolTipShown:", v8);
  v9 = objc_alloc_init((Class)getSISchemaUEIDictationDiscoveryToolTipDisplayContextClass());
  v10 = objc_alloc((Class)getSISchemaUUIDClass_0());
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_sessionIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v10, "initWithNSUUID:", v12);
  objc_msgSend(v9, "setContextId:", v13);

  objc_msgSend(v9, "setStartedOrChanged:", v7);
  +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "currentInstrumentationContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "emitInstrumentation:", v9);

}

- (id)replaceEmojiInStringWithEmojiDictationCommand:(id)a3
{
  return -[UIDictationTipEmojiHandler replaceEmojiInStringWithEmojiDictationCommand:](self->_dictationEmojiTipHandler, "replaceEmojiInStringWithEmojiDictationCommand:", a3);
}

- (void)signalDictationReplacementTip:(id)a3
{
  void *v4;
  int v5;
  id v6;

  v6 = a3;
  +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isDictationPaused");

  if (v5
    && -[UIDictationTipPresentationHandler shouldSignalDictationTip:](self->_dictationTipPresentationHandler, "shouldSignalDictationTip:", 0))
  {
    -[UIDictationTipReplacementHandler startRecodingReplacementText:](self->_dictationReplacementTipHandler, "startRecodingReplacementText:", v6);
  }

}

- (void)recordDictationTipReplacementText:(id)a3
{
  -[UIDictationTipReplacementHandler recordDictationTipReplacementText:](self->_dictationReplacementTipHandler, "recordDictationTipReplacementText:", a3);
}

- (void)finalizeTextWithTipType:(int64_t)a3 title:(id)a4 andTipDescription:(id)a5
{
  -[UIDictationTipController showDictationTipWithTitle:description:dictationTipType:](self, "showDictationTipWithTitle:description:dictationTipType:", a4, a5, a3);
}

- (void)recordDictationTipDeletionText:(id)a3
{
  -[UIDictationTipDeletionHandler recordDictationTipDeletionText:](self->_dictationDeletionTipHandler, "recordDictationTipDeletionText:", a3);
}

- (void)signalDictationDeletionTip:(id)a3
{
  void *v4;
  int v5;
  id v6;

  v6 = a3;
  +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isDictationPaused");

  if (v5)
  {
    if (-[UIDictationTipPresentationHandler shouldSignalDictationTip:](self->_dictationTipPresentationHandler, "shouldSignalDictationTip:", 1))
    {
      -[UIDictationTipDeletionHandler startRecodingDeletionText:](self->_dictationDeletionTipHandler, "startRecodingDeletionText:", v6);
    }
    else if (-[UIDictationTipPresentationHandler getDictationTipSignaled](self->_dictationTipPresentationHandler, "getDictationTipSignaled") == 1)
    {
      -[UIDictationTipDeletionHandler recordDictationTipDeletionText:](self->_dictationDeletionTipHandler, "recordDictationTipDeletionText:", v6);
    }
  }

}

- (void)resetDeletionEventCount
{
  -[UIDictationTipDeletionHandler resetDeletionEventCount](self->_dictationDeletionTipHandler, "resetDeletionEventCount");
}

- (void)addDeletionEventCount:(id)a3 deletedTextRange:(_NSRange)a4
{
  -[UIDictationTipDeletionHandler addDeletionEventCount:deletedTextRange:](self->_dictationDeletionTipHandler, "addDeletionEventCount:deletedTextRange:", a3, a4.location, a4.length);
}

- (int64_t)currentDeletionEventCount
{
  return -[UIDictationTipDeletionHandler currentDeletionEventCount](self->_dictationDeletionTipHandler, "currentDeletionEventCount");
}

- (void)signalDictationClearAllTip
{
  void *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;

  +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isDictationPaused");

  if (v4)
  {
    -[UIDictationTipController reset](self, "reset");
    if (-[UIDictationTipPresentationHandler shouldSignalDictationTip:](self->_dictationTipPresentationHandler, "shouldSignalDictationTip:", 5))
    {
      _UILocalizedFormat(CFSTR("Dictation Clear All Tip Body"), (uint64_t)CFSTR("Description of the clear all tip"), CFSTR("While dictating, just say 'Clear all...'"), v5, v6, v7, v8, v9, v11);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      _UILocalizedString(CFSTR("Dictation Clear All Tip Title"), (uint64_t)CFSTR("Title of the Clear All tip"), CFSTR("Clear All"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIDictationTipController finalizeTextWithTipType:title:andTipDescription:](self, "finalizeTextWithTipType:title:andTipDescription:", 5, v10, v12);

    }
  }
}

- (void)signalDictationSelectionTip:(id)a3
{
  void *v4;
  int v5;
  id v6;

  v6 = a3;
  +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isDictationPaused");

  if (v5
    && -[UIDictationTipPresentationHandler shouldSignalDictationTip:](self->_dictationTipPresentationHandler, "shouldSignalDictationTip:", 4))
  {
    -[UIDictationTipSelectionHandler signalSelectedText:](self->_dictationSelectionTipHandler, "signalSelectedText:", v6);
  }

}

- (void)finalizeSelectionTip
{
  if (-[UIDictationTipPresentationHandler getDictationTipSignaled](self->_dictationTipPresentationHandler, "getDictationTipSignaled") == 4)-[UIDictationTipSelectionHandler finalizeSelectionTip](self->_dictationSelectionTipHandler, "finalizeSelectionTip");
}

- (void)signalDictationSendMessageTip
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;

  -[UIDictationTipController reset](self, "reset");
  if (-[UIDictationTipPresentationHandler shouldSignalDictationTip:](self->_dictationTipPresentationHandler, "shouldSignalDictationTip:", 7))
  {
    _UILocalizedFormat(CFSTR("Dictation Send Message Tip Body"), (uint64_t)CFSTR("Description of the send message tip"), CFSTR("When you're done dictating a message, just say 'Send it'"), v3, v4, v5, v6, v7, v9);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    _UILocalizedString(CFSTR("Dictation Send Message Tip Title"), (uint64_t)CFSTR("Title of the Send Message tip"), CFSTR("Send It"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIDictationTipController finalizeTextWithTipType:title:andTipDescription:](self, "finalizeTextWithTipType:title:andTipDescription:", 5, v8, v10);

  }
}

- (void)signalDictationEmojiTip:(id)a3
{
  UIDictationTipEmojiHandler *dictationEmojiTipHandler;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  -[UIDictationTipController reset](self, "reset");
  if (-[UIDictationTipPresentationHandler shouldSignalDictationTip:](self->_dictationTipPresentationHandler, "shouldSignalDictationTip:", 3))
  {
    dictationEmojiTipHandler = self->_dictationEmojiTipHandler;
    -[UIDictationTipEmojiHandler replaceEmojiInStringWithEmojiDictationCommand:](dictationEmojiTipHandler, "replaceEmojiInStringWithEmojiDictationCommand:", v14);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIDictationTipEmojiHandler replaceEmojiInStringWithEmojiDictationCommand:](dictationEmojiTipHandler, "replaceEmojiInStringWithEmojiDictationCommand:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _UILocalizedFormat(CFSTR("Dictation Emoji Tip Body"), (uint64_t)CFSTR("Description of the emoji tip"), CFSTR("While dictating, just say '%@'"), v7, v8, v9, v10, v11, (uint64_t)v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    _UILocalizedString(CFSTR("Dictation Emoji Tip Title"), (uint64_t)CFSTR("Title of the Emoji tip"), CFSTR("Speak Emoji"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIDictationTipController finalizeTextWithTipType:title:andTipDescription:](self, "finalizeTextWithTipType:title:andTipDescription:", 3, v13, v12);

  }
}

- (void)signalDictationInsertionTip:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  int64_t v7;
  id v8;

  v8 = a3;
  +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isDictationPaused");

  v6 = v8;
  if (v5)
  {
    if (!-[UIDictationTipController dictationTipShown:](self, "dictationTipShown:", 3)
      && objc_msgSend(v8, "_containsEmojiOnly"))
    {
      -[UIDictationTipController signalDictationEmojiTip:](self, "signalDictationEmojiTip:", v8);
LABEL_9:
      v6 = v8;
      goto LABEL_10;
    }
    if (-[UIDictationTipPresentationHandler shouldSignalDictationTip:](self->_dictationTipPresentationHandler, "shouldSignalDictationTip:", 2))
    {
      -[UIDictationTipInsertionHandler startRecodingText:](self->_dictationInsertionTipHandler, "startRecodingText:", v8);
      goto LABEL_9;
    }
    v7 = -[UIDictationTipPresentationHandler getDictationTipSignaled](self->_dictationTipPresentationHandler, "getDictationTipSignaled");
    v6 = v8;
    if (v7 == 2)
    {
      -[UIDictationTipInsertionHandler recordDictationTipText:](self->_dictationInsertionTipHandler, "recordDictationTipText:", v8);
      goto LABEL_9;
    }
  }
LABEL_10:

}

- (BOOL)modelessTipShown
{
  return -[UIDictationTipPresentationHandler dictationTipShownOverLimit:](self->_dictationTipPresentationHandler, "dictationTipShownOverLimit:", 6);
}

- (void)triggerModelessInputTipDictationStoppedSignal
{
  id v2;

  -[UIDictationTipController dictationTipModelessInputHandler](self, "dictationTipModelessInputHandler");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setModelessInputTipDictationStoppedSignal:", 1);

}

- (void)processSoftwareKeyboardInteraction
{
  id v2;

  -[UIDictationTipController dictationTipModelessInputHandler](self, "dictationTipModelessInputHandler");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "processSoftwareKeyboardInteraction");

}

- (void)processUserInteractionEnded
{
  id v3;

  if (-[UIDictationTipPresentationHandler shouldSignalDictationTip:](self->_dictationTipPresentationHandler, "shouldSignalDictationTip:", 6))
  {
    -[UIDictationTipController dictationTipModelessInputHandler](self, "dictationTipModelessInputHandler");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "processUserInteractionEnded");

  }
}

- (void)signalShowModelessTipIfNeeded
{
  id v2;

  -[UIDictationTipController dictationTipModelessInputHandler](self, "dictationTipModelessInputHandler");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setShouldAttemptToShowModelessTip:", 1);

}

- (unint64_t)dismissalReasonType
{
  return self->_dismissalReasonType;
}

- (void)setDismissalReasonType:(unint64_t)a3
{
  self->_dismissalReasonType = a3;
}

- (UIDictationTipPresentationHandler)dictationTipPresentationHandler
{
  return self->_dictationTipPresentationHandler;
}

- (void)setDictationTipPresentationHandler:(id)a3
{
  objc_storeStrong((id *)&self->_dictationTipPresentationHandler, a3);
}

- (UIDictationTipReplacementHandler)dictationReplacementTipHandler
{
  return self->_dictationReplacementTipHandler;
}

- (void)setDictationReplacementTipHandler:(id)a3
{
  objc_storeStrong((id *)&self->_dictationReplacementTipHandler, a3);
}

- (UIDictationTipDeletionHandler)dictationDeletionTipHandler
{
  return self->_dictationDeletionTipHandler;
}

- (void)setDictationDeletionTipHandler:(id)a3
{
  objc_storeStrong((id *)&self->_dictationDeletionTipHandler, a3);
}

- (UIDictationTipEmojiHandler)dictationEmojiTipHandler
{
  return self->_dictationEmojiTipHandler;
}

- (void)setDictationEmojiTipHandler:(id)a3
{
  objc_storeStrong((id *)&self->_dictationEmojiTipHandler, a3);
}

- (UIDictationTipSelectionHandler)dictationSelectionTipHandler
{
  return self->_dictationSelectionTipHandler;
}

- (void)setDictationSelectionTipHandler:(id)a3
{
  objc_storeStrong((id *)&self->_dictationSelectionTipHandler, a3);
}

- (UIDictationTipInsertionHandler)dictationInsertionTipHandler
{
  return self->_dictationInsertionTipHandler;
}

- (void)setDictationInsertionTipHandler:(id)a3
{
  objc_storeStrong((id *)&self->_dictationInsertionTipHandler, a3);
}

- (void)setDictationTipModelessInputHandler:(id)a3
{
  objc_storeStrong((id *)&self->_dictationTipModelessInputHandler, a3);
}

- (id)delayedTip
{
  return self->_delayedTip;
}

- (void)setDelayedTip:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_delayedTip, 0);
  objc_storeStrong((id *)&self->_dictationTipModelessInputHandler, 0);
  objc_storeStrong((id *)&self->_dictationInsertionTipHandler, 0);
  objc_storeStrong((id *)&self->_dictationSelectionTipHandler, 0);
  objc_storeStrong((id *)&self->_dictationEmojiTipHandler, 0);
  objc_storeStrong((id *)&self->_dictationDeletionTipHandler, 0);
  objc_storeStrong((id *)&self->_dictationReplacementTipHandler, 0);
  objc_storeStrong((id *)&self->_dictationTipPresentationHandler, 0);
}

@end
