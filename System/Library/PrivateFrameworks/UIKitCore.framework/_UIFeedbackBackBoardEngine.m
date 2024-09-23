@implementation _UIFeedbackBackBoardEngine

+ (id)_internalQueue
{
  if (qword_1ECD7A700 != -1)
    dispatch_once(&qword_1ECD7A700, &__block_literal_global_411);
  return (id)_MergedGlobals_3_18;
}

+ (id)sharedEngine
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42___UIFeedbackBackBoardEngine_sharedEngine__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECD7A708 != -1)
    dispatch_once(&qword_1ECD7A708, block);
  return (id)qword_1ECD7A710;
}

+ (BOOL)_supportsPlayingIndividualFeedback:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  char v6;

  v3 = a3;
  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[UIDevice _peripheralFeedbackSupportLevel]((uint64_t)v4);

  if (v5 >= 1 && (objc_msgSend(v3, "_effectiveFeedbackTypes") & 0xC) != 0)
    v6 = objc_opt_respondsToSelector();
  else
    v6 = 0;

  return v6 & 1;
}

+ (BOOL)_supportsAbortingDeactivation
{
  return 0;
}

- (void)_internal_dequeueReusableFeedbackPlayerWithCompletionBlock:(id)a3
{
  void (**v4)(id, _UIFeedbackBackBoardEngine *);

  v4 = (void (**)(id, _UIFeedbackBackBoardEngine *))a3;
  objc_msgSend((id)objc_opt_class(), "_internalQueue");

  v4[2](v4, self);
}

- (void)_updateValueForParameters:(id)a3 withKey:(id)a4
{
  unint64_t v4;
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];
  uint8_t buf[16];

  if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_185066000, v6, OS_LOG_TYPE_FAULT, "BackBoard HID feedbacks cannot be updated.", buf, 2u);
    }

  }
  else
  {
    v4 = _updateValueForParameters_withKey____s_category;
    if (!_updateValueForParameters_withKey____s_category)
    {
      v4 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v4, (unint64_t *)&_updateValueForParameters_withKey____s_category);
    }
    v5 = *(NSObject **)(v4 + 8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_ERROR, "BackBoard HID feedbacks cannot be updated.", v7, 2u);
    }
  }
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
  v14[2] = __51___UIFeedbackBackBoardEngine__playFeedback_atTime___block_invoke;
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
  id v8;
  id v9;
  double v10;
  double v11;
  double v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  unint64_t v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  id v24;
  NSObject *v25;
  uint64_t v26;
  NSObject *v28;
  unint64_t v29;
  NSObject *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t v36[128];
  __int128 buf;
  id (*v38)(uint64_t);
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend((id)objc_opt_class(), "_internalQueue");

  -[_UIFeedbackEngine currentTime](self, "currentTime");
  v11 = a5 - v10;
  if (v11 <= 0.0)
    v12 = v11;
  else
    v12 = 0.0;
  if (os_variant_has_internal_diagnostics())
  {
    if (v12 > 0.1)
    {
      __UIFaultDebugAssertLog();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
      {
        LODWORD(buf) = 134217984;
        *(double *)((char *)&buf + 4) = v12;
        _os_log_fault_impl(&dword_185066000, v28, OS_LOG_TYPE_FAULT, "BackBoard HID feedbacks are always played (nearly) immediately and do not support delays. The requested delay of %f will be ignored.", (uint8_t *)&buf, 0xCu);
      }

    }
  }
  else if (v12 > 0.1)
  {
    v29 = qword_1ECD7A718;
    if (!qword_1ECD7A718)
    {
      v29 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v29, (unint64_t *)&qword_1ECD7A718);
    }
    v30 = *(NSObject **)(v29 + 8);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 134217984;
      *(double *)((char *)&buf + 4) = v12;
      _os_log_impl(&dword_185066000, v30, OS_LOG_TYPE_ERROR, "BackBoard HID feedbacks are always played (nearly) immediately and do not support delays. The requested delay of %f will be ignored.", (uint8_t *)&buf, 0xCu);
    }
  }
  v31 = v9;
  -[_UIFeedbackEngine _internal_willPlayFeedback:atTime:](self, "_internal_willPlayFeedback:atTime:", v9, a5);
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v13 = v8;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v33;
    v17 = MEMORY[0x1E0C809B0];
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v33 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * v18), "hidRequest");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
        {
          BKSHIDServicesRequestHapticFeedback();
        }
        else if (os_variant_has_internal_diagnostics())
        {
          __UIFaultDebugAssertLog();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
          {
            LOWORD(buf) = 0;
            _os_log_fault_impl(&dword_185066000, v25, OS_LOG_TYPE_FAULT, "BackBoard HID feedback engine attempted to play feedback data without a request.", (uint8_t *)&buf, 2u);
          }

        }
        else
        {
          v20 = qword_1ECD7A720;
          if (!qword_1ECD7A720)
          {
            v20 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v20, (unint64_t *)&qword_1ECD7A720);
          }
          v21 = *(NSObject **)(v20 + 8);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            LOWORD(buf) = 0;
            _os_log_impl(&dword_185066000, v21, OS_LOG_TYPE_ERROR, "BackBoard HID feedback engine attempted to play feedback data without a request.", (uint8_t *)&buf, 2u);
          }
        }
        kdebug_trace();
        objc_msgSend(v19, "pattern");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v19, "deviceType");
        *(_QWORD *)&buf = v17;
        *((_QWORD *)&buf + 1) = 3221225472;
        v38 = ___sendAnalyticsEvent_block_invoke;
        v39 = &unk_1E16DA8B8;
        v40 = v22;
        v41 = v23;
        v24 = v22;
        AnalyticsSendEventLazy();

        ++v18;
      }
      while (v15 != v18);
      v26 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      v15 = v26;
    }
    while (v26);
  }

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
  block[2] = __44___UIFeedbackBackBoardEngine__stopFeedback___block_invoke;
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

- (id)_stats_key
{
  return CFSTR("backBoard");
}

- (id)invalidationBlock
{
  return self->_invalidationBlock;
}

- (void)setInvalidationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSCountedSet)suspendedSSIDs
{
  return self->_suspendedSSIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suspendedSSIDs, 0);
  objc_storeStrong(&self->_invalidationBlock, 0);
}

@end
