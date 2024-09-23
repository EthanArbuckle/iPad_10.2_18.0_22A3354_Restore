@implementation _UIFeedbackCoreHapticsEngine

- (_UIFeedbackCoreHapticsEngine)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIFeedbackCoreHapticsEngine;
  return -[_UIFeedbackEngine init](&v3, sel_init);
}

- (void)_internal_coreHapticsEngineFinishedWithError:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t);
  unint64_t v8;
  NSObject *v9;
  void *v10;
  _UIFeedbackCoreHapticsEngine *v11;
  NSObject *v12;
  void *v13;
  unint64_t v14;
  NSObject *v15;
  void *v16;
  _UIFeedbackCoreHapticsEngine *v17;
  NSObject *v18;
  void *v19;
  unint64_t v20;
  NSObject *v21;
  void *v22;
  _UIFeedbackCoreHapticsEngine *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  _QWORD v28[5];
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, uint64_t))a4;
  objc_msgSend((id)objc_opt_class(), "_internalQueue");

  if (!_UIFeedbackLoggingDisabled)
  {
    v8 = qword_1ECD7A998;
    if (!qword_1ECD7A998)
    {
      v8 = __UILogCategoryGetNode("Feedback", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v8, (unint64_t *)&qword_1ECD7A998);
    }
    v9 = *(NSObject **)(v8 + 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (void *)MEMORY[0x1E0CB3940];
      v11 = self;
      v12 = v9;
      objc_msgSend(v10, "stringWithFormat:", CFSTR("<%s: %p>"), object_getClassName(v11), v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      *(_DWORD *)buf = 138412290;
      v30 = v13;
      _os_log_impl(&dword_185066000, v12, OS_LOG_TYPE_DEFAULT, "core haptics engine finished for %@", buf, 0xCu);

    }
  }
  if (v6)
  {
    if (!_UIFeedbackLoggingDisabled)
    {
      v14 = qword_1ECD7A9A0;
      if (!qword_1ECD7A9A0)
      {
        v14 = __UILogCategoryGetNode("Feedback", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v14, (unint64_t *)&qword_1ECD7A9A0);
      }
      v15 = *(NSObject **)(v14 + 8);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = (void *)MEMORY[0x1E0CB3940];
        v17 = self;
        v18 = v15;
        objc_msgSend(v16, "stringWithFormat:", CFSTR("<%s: %p>"), object_getClassName(v17), v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        *(_DWORD *)buf = 138412546;
        v30 = v19;
        v31 = 2112;
        v32 = v6;
        _os_log_impl(&dword_185066000, v18, OS_LOG_TYPE_ERROR, "core haptics engine finished for %@ with error: %@", buf, 0x16u);

      }
    }
    -[_UIFeedbackCoreHapticsEngine _internal_resetCoreHapticsEngine](self, "_internal_resetCoreHapticsEngine");
  }
  else if (-[_UIFeedbackEngine _state](self, "_state") != 5)
  {
    v27 = 0;
    goto LABEL_20;
  }
  if (!_UIFeedbackLoggingDisabled)
  {
    v20 = qword_1ECD7A9A8;
    if (!qword_1ECD7A9A8)
    {
      v20 = __UILogCategoryGetNode("Feedback", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v20, (unint64_t *)&qword_1ECD7A9A8);
    }
    v21 = *(NSObject **)(v20 + 8);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = (void *)MEMORY[0x1E0CB3940];
      v23 = self;
      v24 = v21;
      objc_msgSend(v22, "stringWithFormat:", CFSTR("<%s: %p>"), object_getClassName(v23), v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      *(_DWORD *)buf = 138412290;
      v30 = v25;
      _os_log_impl(&dword_185066000, v24, OS_LOG_TYPE_DEFAULT, "stopping core haptics engine for %@", buf, 0xCu);

    }
  }
  -[_UIFeedbackCoreHapticsEngine coreHapticsEngine](self, "coreHapticsEngine");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __88___UIFeedbackCoreHapticsEngine__internal_coreHapticsEngineFinishedWithError_completion___block_invoke;
  v28[3] = &unk_1E16BB768;
  v28[4] = self;
  objc_msgSend(v26, "stopWithCompletionHandler:", v28);

  v27 = 1;
LABEL_20:
  v7[2](v7, v27);

}

- (void)_internal_activateUnderlyingPlayerWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD);
  unint64_t v5;
  NSObject *v6;
  void *v7;
  _UIFeedbackCoreHapticsEngine *v8;
  NSObject *v9;
  void *v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  objc_msgSend((id)objc_opt_class(), "_internalQueue");

  if (!_UIFeedbackLoggingDisabled)
  {
    v5 = _internal_activateUnderlyingPlayerWithCompletion____s_category;
    if (!_internal_activateUnderlyingPlayerWithCompletion____s_category)
    {
      v5 = __UILogCategoryGetNode("Feedback", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v5, (unint64_t *)&_internal_activateUnderlyingPlayerWithCompletion____s_category);
    }
    v6 = *(NSObject **)(v5 + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (void *)MEMORY[0x1E0CB3940];
      v8 = self;
      v9 = v6;
      objc_msgSend(v7, "stringWithFormat:", CFSTR("<%s: %p>"), object_getClassName(v8), v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      *(_DWORD *)buf = 138412290;
      v12 = v10;
      _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_DEFAULT, "starting core haptics engine for %@", buf, 0xCu);

    }
  }
  if (-[_UIFeedbackCoreHapticsEngine _internal_initializeCoreHapticsEngine](self, "_internal_initializeCoreHapticsEngine")&& -[_UIFeedbackEngine _state](self, "_state")&& -[_UIFeedbackEngine _state](self, "_state") != 2)
  {
    -[_UIFeedbackCoreHapticsEngine _internal_startRunningFeedbackPlayerWithCompletion:](self, "_internal_startRunningFeedbackPlayerWithCompletion:", v4);
  }
  else
  {
    v4[2](v4, 0);
  }

}

+ (id)_internalQueue
{
  if (qword_1ECD7A970 != -1)
    dispatch_once(&qword_1ECD7A970, &__block_literal_global_192);
  return (id)qword_1ECD7A968;
}

- (void)_internal_teardownUnderlyingPlayerIfPossibleWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t);
  unint64_t v5;
  NSObject *v6;
  void *v7;
  _UIFeedbackCoreHapticsEngine *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  NSMutableSet *playersToInvalidate;
  void *v14;
  void *v15;
  _QWORD v16[5];
  void (**v17)(id, uint64_t);
  id v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t))a3;
  objc_msgSend((id)objc_opt_class(), "_internalQueue");

  if (!_UIFeedbackLoggingDisabled)
  {
    v5 = _internal_teardownUnderlyingPlayerIfPossibleWithCompletion____s_category[0];
    if (!_internal_teardownUnderlyingPlayerIfPossibleWithCompletion____s_category[0])
    {
      v5 = __UILogCategoryGetNode("Feedback", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v5, _internal_teardownUnderlyingPlayerIfPossibleWithCompletion____s_category);
    }
    v6 = *(NSObject **)(v5 + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (void *)MEMORY[0x1E0CB3940];
      v8 = self;
      v9 = v6;
      objc_msgSend(v7, "stringWithFormat:", CFSTR("<%s: %p>"), object_getClassName(v8), v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      *(_DWORD *)buf = 138412290;
      v20 = v10;
      _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_DEFAULT, "_internal_teardownUnderlyingPlayerIfPossible %@", buf, 0xCu);

    }
  }
  if (!-[_UIFeedbackEngine _state](self, "_state")
    || (-[_UIFeedbackCoreHapticsEngine coreHapticsEngine](self, "coreHapticsEngine"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = v11 == 0,
        v11,
        v12))
  {
    v4[2](v4, 1);
  }
  else
  {
    -[_UIFeedbackEngine _setState:](self, "_setState:", 5);
    playersToInvalidate = self->_playersToInvalidate;
    -[NSMutableSet allObjects](self->_playersInUse, "allObjects");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet addObjectsFromArray:](playersToInvalidate, "addObjectsFromArray:", v14);

    -[NSMutableSet removeAllObjects](self->_playersInUse, "removeAllObjects");
    objc_initWeak((id *)buf, self);
    -[_UIFeedbackCoreHapticsEngine coreHapticsEngine](self, "coreHapticsEngine");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __91___UIFeedbackCoreHapticsEngine__internal_teardownUnderlyingPlayerIfPossibleWithCompletion___block_invoke;
    v16[3] = &unk_1E16C5C28;
    objc_copyWeak(&v18, (id *)buf);
    v16[4] = self;
    v17 = v4;
    objc_msgSend(v15, "notifyWhenPlayersFinished:", v16);

    objc_destroyWeak(&v18);
    objc_destroyWeak((id *)buf);
  }

}

- (void)_internal_startRunningFeedbackPlayerWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "_internalQueue");

  -[_UIFeedbackCoreHapticsEngine coreHapticsEngine](self, "coreHapticsEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __83___UIFeedbackCoreHapticsEngine__internal_startRunningFeedbackPlayerWithCompletion___block_invoke;
  v7[3] = &unk_1E16C2F70;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "startWithCompletionHandler:", v7);

}

- (void)_internal_prewarmUnderlyingPlayerWithCompletion:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "_internalQueue");

  if (-[_UIFeedbackCoreHapticsEngine _internal_initializeCoreHapticsEngine](self, "_internal_initializeCoreHapticsEngine")&& -[_UIFeedbackEngine _state](self, "_state"))
  {
    -[_UIFeedbackCoreHapticsEngine coreHapticsEngine](self, "coreHapticsEngine");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __80___UIFeedbackCoreHapticsEngine__internal_prewarmUnderlyingPlayerWithCompletion___block_invoke;
    v6[3] = &unk_1E16C2F70;
    v6[4] = self;
    v7 = v4;
    objc_msgSend(v5, "prewarmWithCompletionHandler:", v6);

  }
  else
  {
    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
  }

}

+ (BOOL)_supportsAbortingDeactivation
{
  return 1;
}

- (id)_stats_key
{
  return CFSTR("haptic");
}

+ (BOOL)_supportsPlayingIndividualFeedback:(id)a3 allowsIgnoreCapture:(BOOL)a4
{
  int v4;
  id v5;
  void *v6;
  uint64_t v7;
  char v8;
  char v9;
  char v10;
  void *v11;

  v4 = a4;
  v5 = a3;
  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "_feedbackSupportLevel");

  if (v7 < 2)
  {
LABEL_2:
    LOBYTE(v4) = 0;
    goto LABEL_7;
  }
  if ((~objc_msgSend(v5, "hapticOutputMode") & 5) != 0 || v4)
  {
    if ((objc_msgSend(v5, "_effectiveFeedbackTypes") & 3) != 0)
    {
      v8 = objc_opt_respondsToSelector();
      v9 = objc_opt_respondsToSelector();
      v10 = objc_opt_respondsToSelector();
      _coreHapticsEventTypeForEffectiveEventType(objc_msgSend(v5, "_effectiveEventType"), 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v4) = v9 | v10 | v8 | (v11 != 0);

      goto LABEL_7;
    }
    goto LABEL_2;
  }
LABEL_7:

  return v4 & 1;
}

- (void)_internal_dequeueReusableFeedbackPlayerWithCompletionBlock:(id)a3
{
  id v4;
  id v5;
  void (**v6)(void *, _QWORD);
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, int);
  void *v10;
  _UIFeedbackCoreHapticsEngine *v11;
  id v12;

  v4 = a3;
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __91___UIFeedbackCoreHapticsEngine__internal_dequeueReusableFeedbackPlayerWithCompletionBlock___block_invoke;
  v10 = &unk_1E16BC218;
  v11 = self;
  v12 = v4;
  v5 = v4;
  v6 = (void (**)(void *, _QWORD))_Block_copy(&v7);
  switch(-[_UIFeedbackEngine _state](self, "_state", v7, v8, v9, v10, v11))
  {
    case 0:
    case 1:
    case 2:
    case 5:
      v6[2](v6, 0);
      break;
    case 3:
      -[_UIFeedbackEngine _internal_performAtState:block:](self, "_internal_performAtState:block:", 4, v6);
      break;
    case 4:
      v6[2](v6, 1);
      break;
    default:
      break;
  }

}

- (BOOL)_internal_initializeCoreHapticsEngine
{
  void *v3;
  void *v4;
  unint64_t v6;
  NSObject *v7;
  void *v8;
  _UIFeedbackCoreHapticsEngine *v9;
  NSObject *v10;
  void *v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "_internalQueue");

  -[_UIFeedbackCoreHapticsEngine coreHapticsEngine](self, "coreHapticsEngine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3
    || (-[_UIFeedbackCoreHapticsEngine _internal_createCoreHapticsEngine](self, "_internal_createCoreHapticsEngine"),
        (v4 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    -[_UIFeedbackCoreHapticsEngine coreHapticsEngine](self, "coreHapticsEngine");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
      return 1;
  }
  if (!_UIFeedbackLoggingDisabled)
  {
    v6 = _internal_initializeCoreHapticsEngine___s_category;
    if (!_internal_initializeCoreHapticsEngine___s_category)
    {
      v6 = __UILogCategoryGetNode("Feedback", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v6, (unint64_t *)&_internal_initializeCoreHapticsEngine___s_category);
    }
    v7 = *(NSObject **)(v6 + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = (void *)MEMORY[0x1E0CB3940];
      v9 = self;
      v10 = v7;
      objc_msgSend(v8, "stringWithFormat:", CFSTR("<%s: %p>"), object_getClassName(v9), v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      *(_DWORD *)buf = 138412546;
      v13 = v11;
      v14 = 2112;
      v15 = v4;
      _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_ERROR, "failed initializing core haptics engine for %@: %@", buf, 0x16u);

    }
  }
  -[_UIFeedbackCoreHapticsEngine _internal_resetCoreHapticsEngine](self, "_internal_resetCoreHapticsEngine");

  return 0;
}

- (CHHapticEngine)coreHapticsEngine
{
  return self->_coreHapticsEngine;
}

- (id)_internal_createCoreHapticsEngine
{
  unint64_t v3;
  NSObject *v4;
  void *v5;
  _UIFeedbackCoreHapticsEngine *v6;
  NSObject *v7;
  void *v8;
  CHHapticEngine *v9;
  id v10;
  void *v11;
  id *v12;
  void *v13;
  id v14;
  id *v15;
  void *v16;
  id v17;
  id *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  NSMutableSet *v26;
  NSMutableSet *playersInUse;
  NSMutableSet *v28;
  NSMutableSet *playersToInvalidate;
  CHHapticEngine *coreHapticsEngine;
  CHHapticEngine *v31;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD v39[4];
  id v40;
  _QWORD v41[4];
  id v42;
  id v43;
  _QWORD v44[2];
  id v45;
  id v46;
  __int128 buf;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "_internalQueue");

  if (!_UIFeedbackLoggingDisabled)
  {
    v3 = qword_1ECD7A990;
    if (!qword_1ECD7A990)
    {
      v3 = __UILogCategoryGetNode("Feedback", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v3, (unint64_t *)&qword_1ECD7A990);
    }
    v4 = *(NSObject **)(v3 + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = (void *)MEMORY[0x1E0CB3940];
      v6 = self;
      v7 = v4;
      objc_msgSend(v5, "stringWithFormat:", CFSTR("<%s: %p>"), object_getClassName(v6), v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v8;
      _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_DEFAULT, "creating core haptics engine for %@", (uint8_t *)&buf, 0xCu);

    }
  }
  if (_MergedGlobals_5_7)
  {
    (*(void (**)(void))(_MergedGlobals_5_7 + 16))();
    v9 = (CHHapticEngine *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    goto LABEL_20;
  }
  getCHHapticEngineOptionKeyLocality();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = v11;
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v48 = 0x2020000000;
  v12 = (id *)qword_1ECD7AA88;
  v49 = qword_1ECD7AA88;
  if (!qword_1ECD7AA88)
  {
    v13 = CoreHapticsLibrary_1();
    v12 = (id *)dlsym(v13, "CHHapticLocalityFullGamut");
    *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v12;
    qword_1ECD7AA88 = (uint64_t)v12;
  }
  _Block_object_dispose(&buf, 8);
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CHHapticLocality getCHHapticLocalityFullGamut(void)");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInFunction:file:lineNumber:description:", v34, CFSTR("_UIFeedbackCoreHapticsEngineUtilities.h"), 29, CFSTR("%s"), dlerror());

    goto LABEL_27;
  }
  v14 = *v12;
  v45 = v14;
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v48 = 0x2020000000;
  v15 = (id *)qword_1ECD7AA90;
  v49 = qword_1ECD7AA90;
  if (!qword_1ECD7AA90)
  {
    v16 = CoreHapticsLibrary_1();
    v15 = (id *)dlsym(v16, "CHHapticEngineOptionKeyUsageCategory");
    *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v15;
    qword_1ECD7AA90 = (uint64_t)v15;
  }
  _Block_object_dispose(&buf, 8);
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CHHapticEngineOptionKey getCHHapticEngineOptionKeyUsageCategory(void)");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInFunction:file:lineNumber:description:", v36, CFSTR("_UIFeedbackCoreHapticsEngineUtilities.h"), 31, CFSTR("%s"), dlerror());

    goto LABEL_27;
  }
  v17 = *v15;
  v44[1] = v17;
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v48 = 0x2020000000;
  v18 = (id *)qword_1ECD7AA98;
  v49 = qword_1ECD7AA98;
  if (!qword_1ECD7AA98)
  {
    v19 = CoreHapticsLibrary_1();
    v18 = (id *)dlsym(v19, "CHHapticUsageCategoryUIFeedback");
    *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v18;
    qword_1ECD7AA98 = (uint64_t)v18;
  }
  _Block_object_dispose(&buf, 8);
  if (!v18)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CHHapticUsageCategory getCHHapticUsageCategoryUIFeedback(void)");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInFunction:file:lineNumber:description:", v38, CFSTR("_UIFeedbackCoreHapticsEngineUtilities.h"), 32, CFSTR("%s"), dlerror());

LABEL_27:
    __break(1u);
  }
  v46 = *v18;
  v20 = (void *)MEMORY[0x1E0C99D80];
  v21 = v46;
  objc_msgSend(v20, "dictionaryWithObjects:forKeys:count:", &v45, v44, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "_additionalEngineOptions");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    objc_msgSend(v22, "bs_dictionaryByAddingEntriesFromDictionary:", v23);
    v24 = objc_claimAutoreleasedReturnValue();

    v22 = (void *)v24;
  }
  v43 = 0;
  v9 = (CHHapticEngine *)objc_msgSend(objc_alloc((Class)getCHHapticEngineClass()), "initWithAudioSession:sessionIsShared:options:error:", 0, 0, v22, &v43);
  v10 = v43;

LABEL_20:
  if (!v10 && v9)
  {
    objc_initWeak((id *)&buf, self);
    v25 = MEMORY[0x1E0C809B0];
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __65___UIFeedbackCoreHapticsEngine__internal_createCoreHapticsEngine__block_invoke;
    v41[3] = &unk_1E16B42F8;
    objc_copyWeak(&v42, (id *)&buf);
    -[CHHapticEngine setStoppedHandler:](v9, "setStoppedHandler:", v41);
    v39[0] = v25;
    v39[1] = 3221225472;
    v39[2] = __65___UIFeedbackCoreHapticsEngine__internal_createCoreHapticsEngine__block_invoke_12;
    v39[3] = &unk_1E16B3F40;
    objc_copyWeak(&v40, (id *)&buf);
    -[CHHapticEngine setResetHandler:](v9, "setResetHandler:", v39);
    objc_destroyWeak(&v40);
    objc_destroyWeak(&v42);
    objc_destroyWeak((id *)&buf);
  }
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v26 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
  playersInUse = self->_playersInUse;
  self->_playersInUse = v26;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v28 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
  playersToInvalidate = self->_playersToInvalidate;
  self->_playersToInvalidate = v28;

  coreHapticsEngine = self->_coreHapticsEngine;
  self->_coreHapticsEngine = v9;
  v31 = v9;

  return v10;
}

+ (id)_additionalEngineOptions
{
  return 0;
}

+ (id)sharedEngine
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44___UIFeedbackCoreHapticsEngine_sharedEngine__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECD7A978 != -1)
    dispatch_once(&qword_1ECD7A978, block);
  return (id)qword_1ECD7A980;
}

+ (BOOL)_supportsPlayingIndividualFeedback:(id)a3
{
  return objc_msgSend(a1, "_supportsPlayingIndividualFeedback:allowsIgnoreCapture:", a3, 0);
}

+ (BOOL)_supportsPlayingFeedbackPatternsDirectly
{
  return 1;
}

+ (void)_setHapticEngineCreationBlock:(id)a3
{
  void *v3;
  void *v4;

  v3 = _Block_copy(a3);
  v4 = (void *)_MergedGlobals_5_7;
  _MergedGlobals_5_7 = (uint64_t)v3;

}

+ (void)_setHapticPatternClass:(Class)a3
{
  qword_1ECD7A988 = (uint64_t)a3;
}

- (void)_resetCoreHapticsEngine
{
  NSObject *v3;
  NSObject *v4;
  id v5;
  NSObject *v6;
  _QWORD block[5];

  objc_msgSend((id)objc_opt_class(), "_internalQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55___UIFeedbackCoreHapticsEngine__resetCoreHapticsEngine__block_invoke;
  block[3] = &unk_1E16B1B28;
  block[4] = self;
  v4 = v3;
  if (!v3)
  {
    v4 = MEMORY[0x1E0C80D38];
    v5 = MEMORY[0x1E0C80D38];
  }
  v6 = v3;
  dispatch_async(v4, block);

}

- (void)_internal_resetCoreHapticsEngine
{
  NSMutableSet *playersToInvalidate;
  void *v4;
  NSMutableSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  void (**v12)(void);
  CHHapticEngine *coreHapticsEngine;
  NSMutableSet *v14;
  NSMutableSet *playersInUse;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "_internalQueue");

  playersToInvalidate = self->_playersToInvalidate;
  -[NSMutableSet allObjects](self->_playersInUse, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet addObjectsFromArray:](playersToInvalidate, "addObjectsFromArray:", v4);

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = self->_playersToInvalidate;
  v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(id *)(*((_QWORD *)&v16 + 1) + 8 * v9);
        objc_msgSend(v10, "invalidationBlock", (_QWORD)v16);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          objc_msgSend(v10, "invalidationBlock");
          v12 = (void (**)(void))objc_claimAutoreleasedReturnValue();
          v12[2]();

          objc_msgSend(v10, "setInvalidationBlock:", 0);
        }

        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  coreHapticsEngine = self->_coreHapticsEngine;
  self->_coreHapticsEngine = 0;

  v14 = self->_playersToInvalidate;
  self->_playersToInvalidate = 0;

  playersInUse = self->_playersInUse;
  self->_playersInUse = 0;

  -[_UIFeedbackEngine _setState:](self, "_setState:", 0);
  -[_UIFeedbackEngine _internal_teardownBackgroundTask](self, "_internal_teardownBackgroundTask");
}

- (void)_coreHapticsEngineStoppedForReason:(int64_t)a3
{
  NSObject *v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  _QWORD v9[6];

  objc_msgSend((id)objc_opt_class(), "_internalQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __67___UIFeedbackCoreHapticsEngine__coreHapticsEngineStoppedForReason___block_invoke;
  v9[3] = &unk_1E16B1888;
  v9[4] = self;
  v9[5] = a3;
  v6 = v5;
  if (!v5)
  {
    v6 = MEMORY[0x1E0C80D38];
    v7 = MEMORY[0x1E0C80D38];
  }
  v8 = v5;
  dispatch_async(v6, v9);

}

- (void)_internal_coreHapticsEngineStoppedForReason:(int64_t)a3
{
  objc_msgSend((id)objc_opt_class(), "_internalQueue");

  if ((unint64_t)(a3 + 1) <= 5 && ((1 << (a3 + 1)) & 0x2D) != 0)
    -[_UIFeedbackEngine _setState:](self, "_setState:", 0);
}

- (void)_internal_cooldownUnderlyingPlayerIfPossibleWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t);
  unint64_t v5;
  NSObject *v6;
  void *v7;
  _UIFeedbackCoreHapticsEngine *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t))a3;
  objc_msgSend((id)objc_opt_class(), "_internalQueue");

  if (!_UIFeedbackLoggingDisabled)
  {
    v5 = _internal_cooldownUnderlyingPlayerIfPossibleWithCompletion____s_category;
    if (!_internal_cooldownUnderlyingPlayerIfPossibleWithCompletion____s_category)
    {
      v5 = __UILogCategoryGetNode("Feedback", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v5, (unint64_t *)&_internal_cooldownUnderlyingPlayerIfPossibleWithCompletion____s_category);
    }
    v6 = *(NSObject **)(v5 + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (void *)MEMORY[0x1E0CB3940];
      v8 = self;
      v9 = v6;
      objc_msgSend(v7, "stringWithFormat:", CFSTR("<%s: %p>"), object_getClassName(v8), v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      *(_DWORD *)buf = 138412290;
      v13 = v10;
      _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_DEFAULT, "_internal_cooldownUnderlyingPlayerIfPossible %@", buf, 0xCu);

    }
  }
  -[_UIFeedbackCoreHapticsEngine coreHapticsEngine](self, "coreHapticsEngine");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stopPrewarm");

  v4[2](v4, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coreHapticsEngine, 0);
  objc_storeStrong((id *)&self->_playersToInvalidate, 0);
  objc_storeStrong((id *)&self->_playersInUse, 0);
}

@end
