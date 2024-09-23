@implementation _UIStatesFeedbackGeneratorConfiguration

- (NSString)initialState
{
  return self->_initialState;
}

- (void)setInitialState:(id)a3
{
  objc_storeStrong((id *)&self->_initialState, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialState, 0);
  objc_storeStrong((id *)&self->_stateChangeConfigurations, 0);
}

+ (id)keyFromState:(id)a3 toState:(id)a4
{
  const __CFString *v4;
  const __CFString *v5;

  v4 = CFSTR("any");
  if (a3)
    v5 = (const __CFString *)a3;
  else
    v5 = CFSTR("any");
  if (a4)
    v4 = (const __CFString *)a4;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@->%@"), v5, v4);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_UIStatesFeedbackGeneratorConfiguration;
  v4 = -[_UIFeedbackGeneratorConfiguration copyWithZone:](&v10, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_initialState, "copy");
  v6 = (void *)v4[12];
  v4[12] = v5;

  v7 = -[NSDictionary copy](self->_stateChangeConfigurations, "copy");
  v8 = (void *)v4[11];
  v4[11] = v7;

  return v4;
}

- (id)feedbackKeyPaths
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_UIStatesFeedbackGeneratorConfiguration;
  -[_UIFeedbackGeneratorConfiguration feedbackKeyPaths](&v10, sel_feedbackKeyPaths);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[_UIStatesFeedbackGeneratorConfiguration stateChangeConfigurations](self, "stateChangeConfigurations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59___UIStatesFeedbackGeneratorConfiguration_feedbackKeyPaths__block_invoke;
  v8[3] = &unk_1E16C5398;
  v6 = v4;
  v9 = v6;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v8);

  return v6;
}

- (id)hidFeedbackPatternNameKeyPaths
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_UIStatesFeedbackGeneratorConfiguration;
  -[_UIFeedbackGeneratorConfiguration hidFeedbackPatternNameKeyPaths](&v10, sel_hidFeedbackPatternNameKeyPaths);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[_UIStatesFeedbackGeneratorConfiguration stateChangeConfigurations](self, "stateChangeConfigurations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __73___UIStatesFeedbackGeneratorConfiguration_hidFeedbackPatternNameKeyPaths__block_invoke;
  v8[3] = &unk_1E16C5398;
  v6 = v4;
  v9 = v6;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v8);

  return v6;
}

- (id)_alternateFeedback:(id)a3 forDevice:(int64_t)a4 senderID:(unint64_t)a5
{
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  objc_super v15;
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v8 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__78;
  v23 = __Block_byref_object_dispose__78;
  v24 = 0;
  -[_UIStatesFeedbackGeneratorConfiguration stateChangeConfigurations](self, "stateChangeConfigurations");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __81___UIStatesFeedbackGeneratorConfiguration__alternateFeedback_forDevice_senderID___block_invoke;
  v16[3] = &unk_1E16C53C0;
  v10 = v8;
  v17 = v10;
  v18 = &v19;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v16);

  v11 = v20[5];
  if (v11)
  {
    +[_UIFeedbackBackBoardHIDPattern feedbackPatternWithName:deviceType:senderID:](_UIFeedbackBackBoardHIDPattern, "feedbackPatternWithName:deviceType:senderID:", v11, a4, a5);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)_UIStatesFeedbackGeneratorConfiguration;
    -[_UIFeedbackGeneratorConfiguration _alternateFeedback:forDevice:senderID:](&v15, sel__alternateFeedback_forDevice_senderID_, v10, a4, a5);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v13 = (void *)v12;

  _Block_object_dispose(&v19, 8);
  return v13;
}

- (void)setStateChangeConfigurations:(id)a3
{
  NSDictionary *v4;
  NSDictionary *stateChangeConfigurations;

  v4 = (NSDictionary *)a3;
  -[_UIFeedbackGeneratorConfiguration _setupIfNecessary](self, "_setupIfNecessary");
  stateChangeConfigurations = self->_stateChangeConfigurations;
  self->_stateChangeConfigurations = v4;

}

- (NSDictionary)stateChangeConfigurations
{
  -[_UIFeedbackGeneratorConfiguration _setupIfNecessary](self, "_setupIfNecessary");
  return self->_stateChangeConfigurations;
}

@end
