@implementation WFActionDragFeedbackGenerator

- (void)draggingStarted
{
  UIAccessibilityNotifications v3;
  void *v4;
  NSDate *v5;
  NSDate *lastDragStartDate;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFActionDragFeedbackGenerator;
  -[WFDragFeedbackGenerator draggingStarted](&v7, sel_draggingStarted);
  if (UIAccessibilityIsVoiceOverRunning())
  {
    v3 = *MEMORY[0x24BEBDDB0];
    WFLocalizedString(CFSTR("dragging"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilityPostNotification(v3, v4);

  }
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v5 = (NSDate *)objc_claimAutoreleasedReturnValue();
  lastDragStartDate = self->_lastDragStartDate;
  self->_lastDragStartDate = v5;

}

- (void)draggingItemSnapped
{
  double v3;
  objc_super v4;

  -[NSDate timeIntervalSinceNow](self->_lastDragStartDate, "timeIntervalSinceNow");
  if (fabs(v3) >= 0.3)
  {
    v4.receiver = self;
    v4.super_class = (Class)WFActionDragFeedbackGenerator;
    -[WFDragFeedbackGenerator draggingItemSnapped](&v4, sel_draggingItemSnapped);
  }
}

- (void)draggingInsertedActions:(id)a3 intoWorkflow:(id)a4 atIndex:(unint64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a3;
  v8 = a4;
  -[WFActionDragFeedbackGenerator draggingItemSnapped](self, "draggingItemSnapped");
  if (UIAccessibilityIsVoiceOverRunning())
  {
    objc_msgSend(v8, "actions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (a5)
    {
      objc_msgSend(v9, "objectAtIndex:", a5 - 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = (void *)MEMORY[0x24BDD17C8];
      WFLocalizedString(CFSTR("added %1$@ to shortcut below %2$@"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "firstObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "accessibilityName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "localizedName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedStringWithFormat:", v13, v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      if (objc_msgSend(v9, "count"))
      {
        objc_msgSend(v8, "actions");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectAtIndex:", 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v11 = 0;
      }

      objc_msgSend(v21, "firstObject");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "accessibilityName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = (void *)MEMORY[0x24BDD17C8];
      if (!v11)
      {
        WFLocalizedString(CFSTR("added %@ to shortcut"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "localizedStringWithFormat:", v14, v13);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_10;
      }
      WFLocalizedString(CFSTR("added %1$@ to shortcut above %2$@"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "accessibilityName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "localizedStringWithFormat:", v14, v13, v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }

LABEL_10:
    UIAccessibilityPostNotification(*MEMORY[0x24BEBDDB0], v17);
    -[WFActionDragFeedbackGenerator playReorderSound](self, "playReorderSound");

  }
}

- (void)draggingRemovedActions:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[WFActionDragFeedbackGenerator draggingItemSnapped](self, "draggingItemSnapped");
  if (UIAccessibilityIsVoiceOverRunning())
  {
    v4 = (void *)MEMORY[0x24BDD17C8];
    WFLocalizedString(CFSTR("removed %@"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accessibilityName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringWithFormat:", v5, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    UIAccessibilityPostNotification(*MEMORY[0x24BEBDDB0], v8);
  }

}

- (void)draggingMovedActions:(id)a3 fromIndexes:(id)a4 toIndexes:(id)a5 inWorkflow:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void *v26;
  id v27;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[WFActionDragFeedbackGenerator draggingItemSnapped](self, "draggingItemSnapped");
  if (UIAccessibilityIsVoiceOverRunning())
  {
    objc_msgSend(v13, "actions");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = MEMORY[0x24BDAC760];
    v24 = 3221225472;
    v25 = __87__WFActionDragFeedbackGenerator_draggingMovedActions_fromIndexes_toIndexes_inWorkflow___block_invoke;
    v26 = &unk_24EE25048;
    v27 = v10;
    objc_msgSend(v14, "if_objectsPassingTest:", &v23);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_msgSend(v11, "lastIndex");
    if (v16 <= objc_msgSend(v12, "lastIndex"))
    {
      objc_msgSend(v15, "objectAtIndex:", objc_msgSend(v12, "firstIndex") - 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)MEMORY[0x24BDD17C8];
      v19 = CFSTR("moved below %@");
    }
    else
    {
      objc_msgSend(v15, "objectAtIndex:", objc_msgSend(v12, "lastIndex") - objc_msgSend(v12, "count") + 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)MEMORY[0x24BDD17C8];
      v19 = CFSTR("moved above %@");
    }
    WFLocalizedString(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "accessibilityName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringWithFormat:", v20, v21, v23, v24, v25, v26);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    UIAccessibilityPostNotification(*MEMORY[0x24BEBDDB0], v22);
    -[WFActionDragFeedbackGenerator playReorderSound](self, "playReorderSound");

  }
}

- (void)draggingActionsEnteredDeletionZone:(id)a3
{
  UIAccessibilityNotifications v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[WFActionDragFeedbackGenerator draggingItemSnapped](self, "draggingItemSnapped");
  if (UIAccessibilityIsVoiceOverRunning())
  {
    v4 = *MEMORY[0x24BEBDDB0];
    v5 = (void *)MEMORY[0x24BDD17C8];
    WFLocalizedString(CFSTR("Release to remove %@"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", v6, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilityPostNotification(v4, v9);

  }
}

- (unsigned)reorderSound
{
  void *v3;
  const __CFURL *v4;

  if (!self->_initializedReorderSound)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "URLForResource:withExtension:", CFSTR("Reorder"), CFSTR("aiff"));
    v4 = (const __CFURL *)objc_claimAutoreleasedReturnValue();

    self->_initializedReorderSound = AudioServicesCreateSystemSoundID(v4, &self->_reorderSound) == 0;
  }
  return self->_reorderSound;
}

- (void)playReorderSound
{
  AudioServicesPlaySystemSoundWithCompletion(-[WFActionDragFeedbackGenerator reorderSound](self, "reorderSound"), 0);
}

- (void)dealloc
{
  objc_super v3;

  if (self->_initializedReorderSound)
    AudioServicesDisposeSystemSoundID(self->_reorderSound);
  v3.receiver = self;
  v3.super_class = (Class)WFActionDragFeedbackGenerator;
  -[WFActionDragFeedbackGenerator dealloc](&v3, sel_dealloc);
}

- (NSDate)lastDragStartDate
{
  return self->_lastDragStartDate;
}

- (void)setLastDragStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastDragStartDate, a3);
}

- (BOOL)initializedReorderSound
{
  return self->_initializedReorderSound;
}

- (void)setInitializedReorderSound:(BOOL)a3
{
  self->_initializedReorderSound = a3;
}

- (void)setReorderSound:(unsigned int)a3
{
  self->_reorderSound = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastDragStartDate, 0);
}

uint64_t __87__WFActionDragFeedbackGenerator_draggingMovedActions_fromIndexes_toIndexes_inWorkflow___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2) ^ 1;
}

@end
