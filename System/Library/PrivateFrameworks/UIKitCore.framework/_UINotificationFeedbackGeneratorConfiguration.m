@implementation _UINotificationFeedbackGeneratorConfiguration

+ (id)privateConfigurationForTypes:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __78___UINotificationFeedbackGeneratorConfiguration_privateConfigurationForTypes___block_invoke;
  v8[3] = &unk_1E16C5040;
  v9 = v4;
  v5 = v4;
  objc_msgSend(a1, "_configurationWithKey:requiredSupportLevel:preparationBlock:", CFSTR("private"), 0, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIncludePrivateEvents:", 1);

  return v6;
}

- (void)setIncludePrivateEvents:(BOOL)a3
{
  self->_includePrivateEvents = a3;
}

+ (id)defaultConfiguration
{
  return (id)objc_msgSend(a1, "_configurationWithKey:requiredSupportLevel:preparationBlock:", CFSTR("default"), 2, &__block_literal_global_181);
}

+ (id)privateConfiguration
{
  void *v2;

  objc_msgSend(a1, "defaultConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "set_stats_key:", CFSTR("private"));
  objc_msgSend(v2, "setIncludePrivateEvents:", 1);
  objc_msgSend(v2, "setRequiredSupportLevel:", 0);
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UINotificationFeedbackGeneratorConfiguration;
  v4 = -[_UIFeedbackGeneratorConfiguration copyWithZone:](&v8, sel_copyWithZone_, a3);
  v5 = -[NSDictionary copy](self->_feedbacks, "copy");
  v6 = (void *)v4[12];
  v4[12] = v5;

  *((_BYTE *)v4 + 88) = self->_includePrivateEvents;
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  NSDictionary *v7;
  NSDictionary *v8;
  NSDictionary *v9;
  BOOL v10;
  char v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_UINotificationFeedbackGeneratorConfiguration;
  if (-[_UIFeedbackGeneratorConfiguration isEqual:](&v13, sel_isEqual_, v4))
  {
    v5 = v4;
    v6 = (void *)v5[12];
    v7 = self->_feedbacks;
    v8 = v6;
    v9 = v8;
    if (v7 == v8)
    {
      v11 = 1;
    }
    else
    {
      if (v7)
        v10 = v8 == 0;
      else
        v10 = 1;
      if (v10)
        v11 = 0;
      else
        v11 = -[NSDictionary isEqual:](v7, "isEqual:", v8);
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)defaultEnabled
{
  BOOL v2;
  void *v3;
  objc_super v5;
  objc_super v6;

  if (self->_includePrivateEvents)
  {
    v6.receiver = self;
    v6.super_class = (Class)_UINotificationFeedbackGeneratorConfiguration;
    if (-[_UIFeedbackGeneratorConfiguration defaultEnabled](&v6, sel_defaultEnabled))
    {
      return 1;
    }
    else
    {
      +[_UIFeedbackPreferences sharedPreferences](_UIFeedbackPreferences, "sharedPreferences");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = objc_msgSend(v3, "enabledFeedbackTypesForCategory:", 0x1E1721EA0) != 0;

    }
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)_UINotificationFeedbackGeneratorConfiguration;
    return -[_UIFeedbackGeneratorConfiguration defaultEnabled](&v5, sel_defaultEnabled);
  }
  return v2;
}

- (id)feedbackKeyPaths
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UINotificationFeedbackGeneratorConfiguration;
  -[_UIFeedbackGeneratorConfiguration feedbackKeyPaths](&v6, sel_feedbackKeyPaths);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_feedbacks);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByAddingObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setFeedbacks:(id)a3
{
  NSDictionary *v4;
  NSDictionary *feedbacks;

  v4 = (NSDictionary *)a3;
  -[_UIFeedbackGeneratorConfiguration _setupIfNecessary](self, "_setupIfNecessary");
  feedbacks = self->_feedbacks;
  self->_feedbacks = v4;

}

- (NSDictionary)feedbacks
{
  -[_UIFeedbackGeneratorConfiguration _setupIfNecessary](self, "_setupIfNecessary");
  return self->_feedbacks;
}

- (BOOL)includePrivateEvents
{
  return self->_includePrivateEvents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedbacks, 0);
}

@end
