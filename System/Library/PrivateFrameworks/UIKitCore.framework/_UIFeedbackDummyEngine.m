@implementation _UIFeedbackDummyEngine

+ (id)sharedEngine
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38___UIFeedbackDummyEngine_sharedEngine__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECD7B8B0 != -1)
    dispatch_once(&qword_1ECD7B8B0, block);
  return (id)qword_1ECD7B8B8;
}

- (void)_internal_activateUnderlyingPlayerWithCompletion:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  dispatch_time_t v8;
  id v9;
  _QWORD block[4];
  id v11;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "_internalQueue");

  objc_msgSend((id)objc_opt_class(), "_internalQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    v6 = MEMORY[0x1E0C80D38];
    v7 = MEMORY[0x1E0C80D38];
  }

  v8 = dispatch_time(0, 100000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75___UIFeedbackDummyEngine__internal_activateUnderlyingPlayerWithCompletion___block_invoke;
  block[3] = &unk_1E16B1BF8;
  v11 = v3;
  v9 = v3;
  dispatch_after(v8, v6, block);

}

- (void)_internal_dequeueReusableFeedbackPlayerWithCompletionBlock:(id)a3
{
  (*((void (**)(id, _UIFeedbackDummyEngine *))a3 + 2))(a3, self);
}

- (void)_playFeedback:(id)a3 atTime:(double)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  double v17;

  v6 = a3;
  objc_msgSend(v6, "_effectiveFeedbackData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_internalQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __47___UIFeedbackDummyEngine__playFeedback_atTime___block_invoke;
  v14[3] = &unk_1E16C5CA0;
  v14[4] = self;
  v15 = v7;
  v16 = v6;
  v17 = a4;
  v9 = v8;
  if (!v8)
  {
    v9 = MEMORY[0x1E0C80D38];
    v10 = MEMORY[0x1E0C80D38];
  }
  v11 = v8;
  v12 = v6;
  v13 = v7;
  dispatch_async(v9, v14);

}

- (BOOL)_internal_playFeedbackData:(id)a3 forFeedback:(id)a4 atTime:(double)a5
{
  id v7;

  v7 = a4;
  objc_msgSend((id)objc_opt_class(), "_internalQueue");

  -[_UIFeedbackEngine _internal_willPlayFeedback:atTime:](self, "_internal_willPlayFeedback:atTime:", v7, a5);
  return 1;
}

- (void)_stopFeedback:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v4 = a3;
  objc_msgSend(v4, "_effectiveFeedbackData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_internalQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40___UIFeedbackDummyEngine__stopFeedback___block_invoke;
  block[3] = &unk_1E16B47A8;
  block[4] = self;
  v13 = v5;
  v14 = v4;
  v7 = v6;
  if (!v6)
  {
    v7 = MEMORY[0x1E0C80D38];
    v8 = MEMORY[0x1E0C80D38];
  }
  v9 = v6;
  v10 = v4;
  v11 = v5;
  dispatch_async(v7, block);

}

- (void)_internal_stopFeedbackData:(id)a3 forFeedback:(id)a4
{
  id v5;

  v5 = a4;
  objc_msgSend((id)objc_opt_class(), "_internalQueue");

  -[_UIFeedbackEngine _internal_willCancelFeedback:](self, "_internal_willCancelFeedback:", v5);
}

- (id)_stats_key
{
  return CFSTR("dummy");
}

- (id)invalidationBlock
{
  return self->_invalidationBlock;
}

- (void)setInvalidationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationBlock, 0);
}

@end
