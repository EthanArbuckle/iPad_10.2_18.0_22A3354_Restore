@implementation SPSearchFeedbackSender

+ (void)initialize
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  dispatch_queue_t v6;
  void *v7;

  objc_opt_self();
  v3 = (id)objc_claimAutoreleasedReturnValue();

  if (v3 == a1)
  {
    dispatch_queue_attr_make_initially_inactive(0);
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_BACKGROUND, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("feedback queue", v5);
    v7 = (void *)sFeedbackQueue;
    sFeedbackQueue = (uint64_t)v6;

    dispatch_activate((dispatch_object_t)sFeedbackQueue);
  }
}

+ (id)feedbackQueue
{
  return (id)sFeedbackQueue;
}

+ (void)_gatherFeedbackListeners
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;

  if (_gatherFeedbackListeners_onceToken != -1)
    dispatch_once(&_gatherFeedbackListeners_onceToken, &__block_literal_global_183);
  v17 = (id)objc_opt_new();
  +[SPCoreParsecInterface sharedFeedbackListener](SPCoreParsecInterface, "sharedFeedbackListener");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    +[SPFeedbackListenerWrapper wrapperWithFeedbackListener:](SPFeedbackListenerWrapper, "wrapperWithFeedbackListener:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "supportedTypes"))
      objc_msgSend(v17, "addObject:", v3);
  }
  else
  {
    v3 = 0;
  }
  if (NSClassFromString(CFSTR("ATXSearchFeedbackListener")))
  {
    v4 = objc_alloc_init(MEMORY[0x24BE041D0]);

    if (v4)
    {
      +[SPFeedbackListenerWrapper wrapperWithFeedbackListener:](SPFeedbackListenerWrapper, "wrapperWithFeedbackListener:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v5, "supportedTypes"))
        objc_msgSend(v17, "addObject:", v5);
      v3 = v5;
    }
  }
  else
  {
    v4 = v2;
  }
  if (_gatherFeedbackListeners_suggestionsFeedbackListener)
  {
    +[SPFeedbackListenerWrapper wrapperWithFeedbackListener:](SPFeedbackListenerWrapper, "wrapperWithFeedbackListener:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "supportedTypes"))
      objc_msgSend(v17, "addObject:", v6);
  }
  else
  {
    v6 = v3;
  }
  +[SDFeedbackInterceptor sharedInstance](SDFeedbackInterceptor, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    +[SPFeedbackListenerWrapper wrapperWithFeedbackListener:](SPFeedbackListenerWrapper, "wrapperWithFeedbackListener:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v8, "supportedTypes"))
      objc_msgSend(v17, "addObject:", v8);
  }
  else
  {
    v8 = v6;
  }
  +[SDCoreSpotlightFeedbackHandler sharedInstance](SDCoreSpotlightFeedbackHandler, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    +[SPFeedbackListenerWrapper wrapperWithFeedbackListener:](SPFeedbackListenerWrapper, "wrapperWithFeedbackListener:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v10, "supportedTypes"))
      objc_msgSend(v17, "addObject:", v10);
  }
  else
  {
    v10 = v8;
  }
  v11 = (void *)objc_opt_new();

  if (v11)
  {
    +[SPFeedbackListenerWrapper wrapperWithFeedbackListener:](SPFeedbackListenerWrapper, "wrapperWithFeedbackListener:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v12, "supportedTypes"))
      objc_msgSend(v17, "addObject:", v12);
  }
  else
  {
    v12 = v10;
  }
  v13 = (void *)objc_opt_new();

  if (v13)
  {
    +[SPFeedbackListenerWrapper wrapperWithFeedbackListener:](SPFeedbackListenerWrapper, "wrapperWithFeedbackListener:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v14, "supportedTypes"))
      objc_msgSend(v17, "addObject:", v14);
  }
  else
  {
    v14 = v12;
  }
  v15 = objc_msgSend(v17, "copy");
  v16 = (void *)sFeedbackListeners;
  sFeedbackListeners = v15;

}

void __50__SPSearchFeedbackSender__gatherFeedbackListeners__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BEB2CF8]);
  v1 = (void *)_gatherFeedbackListeners_suggestionsFeedbackListener;
  _gatherFeedbackListeners_suggestionsFeedbackListener = (uint64_t)v0;

}

+ (void)updateFeedbackListeners
{
  NSObject *v3;
  os_log_type_t v4;
  _QWORD block[5];
  uint8_t buf[16];

  SPLogForSPLogCategoryDefault();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v3, v4))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_213202000, v3, v4, "[FEEDBACK-DEBUG] (gatherFeedbackListeners) updateFeedbackListeners called", buf, 2u);
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__SPSearchFeedbackSender_updateFeedbackListeners__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  dispatch_async((dispatch_queue_t)sFeedbackQueue, block);
}

uint64_t __49__SPSearchFeedbackSender_updateFeedbackListeners__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_gatherFeedbackListeners");
}

+ (id)feedbackListeners
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__SPSearchFeedbackSender_feedbackListeners__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (feedbackListeners_onceToken != -1)
    dispatch_once(&feedbackListeners_onceToken, block);
  return (id)sFeedbackListeners;
}

uint64_t __43__SPSearchFeedbackSender_feedbackListeners__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend((id)sFeedbackListeners, "count");
  if (!result)
    return objc_msgSend(*(id *)(a1 + 32), "_gatherFeedbackListeners");
  return result;
}

+ (void)synchronizedBlock:(id)a3
{
  dispatch_async((dispatch_queue_t)sFeedbackQueue, a3);
}

@end
