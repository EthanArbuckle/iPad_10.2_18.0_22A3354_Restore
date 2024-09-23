@implementation _UIFeedbackEventBehavior

+ (void)eventOccurred:(int64_t)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42___UIFeedbackEventBehavior_eventOccurred___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECD7A560 != -1)
    dispatch_once(&qword_1ECD7A560, block);
  objc_msgSend((id)qword_1ECD7A558, "_activateAndPlayEvent:", a3);
}

+ (void)_privateEventOccurred:(int64_t)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = objc_alloc((Class)a1);
  v5 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithObject:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UINotificationFeedbackGeneratorConfiguration privateConfigurationForTypes:](_UINotificationFeedbackGeneratorConfiguration, "privateConfigurationForTypes:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v4, "initWithConfiguration:", v8);

  objc_msgSend(v9, "_activateAndPlayEvent:", a3);
}

- (void)_activateAndPlayEvent:(int64_t)a3
{
  _QWORD v5[6];

  if (pthread_main_np() == 1)
  {
    -[UINotificationFeedbackGenerator _playEventType:atLocation:](self, "_playEventType:atLocation:", a3, 1.79769313e308, 1.79769313e308);
  }
  else
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __50___UIFeedbackEventBehavior__activateAndPlayEvent___block_invoke;
    v5[3] = &unk_1E16B1888;
    v5[4] = self;
    v5[5] = a3;
    dispatch_async(MEMORY[0x1E0C80D38], v5);
  }
}

- (void)eventOccurred:(int64_t)a3
{
  -[UINotificationFeedbackGenerator _playEventType:atLocation:](self, "_playEventType:atLocation:", a3, 1.79769313e308, 1.79769313e308);
}

- (void)_privateEventOccurred:(int64_t)a3
{
  -[UINotificationFeedbackGenerator _playEventType:atLocation:](self, "_playEventType:atLocation:", a3, 1.79769313e308, 1.79769313e308);
}

@end
