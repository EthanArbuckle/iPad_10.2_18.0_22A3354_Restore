@implementation _UIClickPresentationFeedbackGeneratorConfiguration

+ (id)defaultConfiguration
{
  return (id)objc_msgSend(a1, "_configurationWithKey:preparationBlock:", CFSTR("default"), &__block_literal_global_7_11);
}

- (int64_t)requiredSupportLevel
{
  return 1;
}

- (int64_t)requiredPeripheralSupportLevel
{
  return 1;
}

- (_UIFeedbackDiscretePlayable)previewedPattern
{
  if (qword_1ECD81BE8 != -1)
    dispatch_once(&qword_1ECD81BE8, &__block_literal_global_566);
  return (_UIFeedbackDiscretePlayable *)(id)_MergedGlobals_1260;
}

- (_UIFeedbackDiscretePlayable)draggedPattern
{
  if (qword_1ECD81BF8 != -1)
    dispatch_once(&qword_1ECD81BF8, &__block_literal_global_2_17);
  return (_UIFeedbackDiscretePlayable *)(id)qword_1ECD81BF0;
}

- (NSString)hidPreviewedPatternName
{
  return (NSString *)CFSTR("context_menu");
}

- (NSString)hidDraggedPatternName
{
  return (NSString *)CFSTR("drag_drop_table_edit");
}

- (id)_alternateFeedback:(id)a3 forDevice:(int64_t)a4 senderID:(unint64_t)a5
{
  id v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;

  v8 = a3;
  -[_UIClickPresentationFeedbackGeneratorConfiguration previewedPattern](self, "previewedPattern");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqual:", v9);

  if (v10)
    -[_UIClickPresentationFeedbackGeneratorConfiguration hidPreviewedPatternName](self, "hidPreviewedPatternName");
  else
    -[_UIClickPresentationFeedbackGeneratorConfiguration hidDraggedPatternName](self, "hidDraggedPatternName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIFeedbackBackBoardHIDPattern feedbackPatternWithName:deviceType:senderID:](_UIFeedbackBackBoardHIDPattern, "feedbackPatternWithName:deviceType:senderID:", v11, a4, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)feedbackKeyPaths
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)_UIClickPresentationFeedbackGeneratorConfiguration;
  -[_UIFeedbackGeneratorUserInteractionDrivenConfiguration feedbackKeyPaths](&v9, sel_feedbackKeyPaths);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_previewedPattern);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  NSStringFromSelector(sel_poppedPattern);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  NSStringFromSelector(sel_draggedPattern);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByAddingObjectsFromArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)hidFeedbackPatternNameKeyPaths
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)_UIClickPresentationFeedbackGeneratorConfiguration;
  -[_UIFeedbackGeneratorConfiguration hidFeedbackPatternNameKeyPaths](&v9, sel_hidFeedbackPatternNameKeyPaths);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_hidPreviewedPatternName);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  NSStringFromSelector(sel_hidPoppedPatternName);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  NSStringFromSelector(sel_hidDraggedPatternName);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByAddingObjectsFromArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
