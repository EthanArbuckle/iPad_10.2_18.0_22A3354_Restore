@implementation UINotificationFeedbackGenerator

+ (Class)_configurationClass
{
  return (Class)objc_opt_class();
}

- (id)_categoryForType:(int64_t)a3
{
  if ((a3 | 2) == 0x3EA)
    return CFSTR("lock");
  else
    return 0;
}

- (double)_preparationTimeoutForStyle:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  double result;
  objc_super v6;
  uint64_t v7;
  uint64_t v8;

  result = 0.0;
  if (a3 != 2)
  {
    v7 = v3;
    v8 = v4;
    v6.receiver = self;
    v6.super_class = (Class)UINotificationFeedbackGenerator;
    -[UIFeedbackGenerator _preparationTimeoutForStyle:](&v6, sel__preparationTimeoutForStyle_, 0.0);
  }
  return result;
}

- (void)_playEventType:(void *)a3 senderID:(void *)a4 powerSourceID:(double)a5 atLocation:(double)a6
{
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a4;
  if (a1)
  {
    objc_msgSend(a1, "_clientDidUpdateGeneratorWithSelector:", sel__playEventType_senderID_powerSourceID_atLocation_);
    objc_msgSend(a1, "_eventConfiguration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "feedbacks");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (v18)
        v15 = v18;
      else
        v15 = a3;
      objc_msgSend(v14, "completeFeedbackPatternWithSenderID:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1, "_categoryForType:", a2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "_setCategory:", v17);

      objc_msgSend(a1, "_playFeedback:atLocation:", v16, a5, a6);
      v14 = v16;
    }

  }
}

- (void)_playEventType:(int64_t)a3 atLocation:(CGPoint)a4
{
  double y;
  double x;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  y = a4.y;
  x = a4.x;
  -[UIFeedbackGenerator _clientDidUpdateGeneratorWithSelector:](self, "_clientDidUpdateGeneratorWithSelector:", a2);
  -[UINotificationFeedbackGenerator _eventConfiguration](self, "_eventConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "feedbacks");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v10);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  -[UINotificationFeedbackGenerator _categoryForType:](self, "_categoryForType:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_setCategory:", v11);

  -[UIFeedbackGenerator _playFeedback:atLocation:](self, "_playFeedback:atLocation:", v12, x, y);
}

- (void)_stopEventType:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[UINotificationFeedbackGenerator _eventConfiguration](self, "_eventConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "feedbacks");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[UIFeedbackGenerator _stopFeedback:](self, "_stopFeedback:", v8);
}

- (void)notificationOccurred:(UINotificationFeedbackType)notificationType
{
  -[UINotificationFeedbackGenerator _playEventType:atLocation:](self, "_playEventType:atLocation:", notificationType, 1.79769313e308, 1.79769313e308);
}

- (void)_notificationOccurred:(int64_t)a3 atLocation:(CGPoint)a4
{
  -[UINotificationFeedbackGenerator _playEventType:atLocation:](self, "_playEventType:atLocation:", a3, 1.79769313e308, 1.79769313e308);
}

- (void)_privateNotificationOccurred:(int64_t)a3
{
  -[UINotificationFeedbackGenerator _playEventType:atLocation:](self, "_playEventType:atLocation:", a3, 1.79769313e308, 1.79769313e308);
}

- (void)_privateNotificationOccurred:(int64_t)a3 atLocation:(CGPoint)a4 senderID:(unint64_t)a5
{
  -[UINotificationFeedbackGenerator _playEventType:senderID:powerSourceID:atLocation:](self, a3, (void *)a5, 0, a4.x, a4.y);
}

- (void)_privateNotificationOccurred:(int64_t)a3 atLocation:(CGPoint)a4 powerSourceID:(id)a5
{
  -[UINotificationFeedbackGenerator _playEventType:senderID:powerSourceID:atLocation:](self, a3, 0, a5, a4.x, a4.y);
}

- (id)_stats_key
{
  return CFSTR("notification");
}

@end
