@implementation SBScreenTimeTrackingController

- (void)layoutMonitor:(id)a3 didUpdateDisplayLayout:(id)a4 withContext:(id)a5
{
  id v7;
  id v8;
  NSObject *queue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v7 = a4;
  v8 = a5;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83__SBScreenTimeTrackingController_layoutMonitor_didUpdateDisplayLayout_withContext___block_invoke;
  block[3] = &unk_1E288E060;
  block[4] = self;
  v13 = v7;
  v14 = v8;
  v10 = v8;
  v11 = v7;
  dispatch_async(queue, block);

}

void __83__SBScreenTimeTrackingController_layoutMonitor_didUpdateDisplayLayout_withContext___block_invoke(id *a1)
{
  uint64_t v2;
  dispatch_time_t v3;
  id v4;
  NSObject *v5;
  _QWORD block[5];

  objc_storeStrong((id *)a1[4] + 7, a1[5]);
  objc_storeStrong((id *)a1[4] + 8, a1[6]);
  v2 = _block_invoke_requestCount;
  if (!_block_invoke_requestCount)
  {
    objc_msgSend(a1[4], "_queue_handleNewLayout:withContext:", a1[5], a1[6]);
    v3 = dispatch_time(0, 250000000);
    v4 = a1[4];
    v5 = *((_QWORD *)v4 + 2);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __83__SBScreenTimeTrackingController_layoutMonitor_didUpdateDisplayLayout_withContext___block_invoke_2;
    block[3] = &unk_1E288DFC0;
    block[4] = v4;
    dispatch_after(v3, v5, block);
    v2 = _block_invoke_requestCount;
  }
  _block_invoke_requestCount = v2 + 1;
}

- (void)_queue_handleNewLayout:(id)a3 withContext:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  unint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t queue_activeContext;
  uint64_t v25;
  SBScreenTimeTrackingController *v26;
  id v27;
  void *v28;
  id v29;
  uint64_t v30;
  id v31;
  id v32;
  int v33;
  uint64_t v34;
  unint64_t v35;
  id v36;
  id v37;
  id v38;
  id v39;
  uint64_t v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v26 = self;
  v27 = a4;
  BSDispatchQueueAssert();
  v28 = v6;
  objc_msgSend(v6, "elements");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sortedArrayUsingComparator:", &__block_literal_global_16);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
  if (v10)
  {
    v11 = v10;
    v31 = 0;
    v32 = 0;
    v12 = 0;
    v36 = 0;
    v37 = 0;
    v35 = 0;
    v38 = 0;
    v39 = 0;
    v13 = 0;
    v14 = 0;
    v41 = 0;
    v15 = 0;
    v16 = *(_QWORD *)v43;
    v40 = *MEMORY[0x1E0D22C78];
    v34 = *MEMORY[0x1E0D22C70];
    v30 = *MEMORY[0x1E0D22C88];
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v43 != v16)
          objc_enumerationMutation(v9);
        v18 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v17);
        objc_msgSend(v18, "identifier", v26);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v19;
        if (v15 || !objc_msgSend(v19, "isEqualToString:", v40))
        {
          if (v13 || !objc_msgSend(v20, "isEqualToString:", CFSTR("com.apple.InCallService")))
          {
            if (objc_msgSend(v18, "layoutRole") == 3)
            {
              v21 = v18;

              v14 = v21;
            }
            else if (v41
                   || !objc_msgSend(v20, "isEqualToString:", CFSTR("com.apple.springboard.home-screen")))
            {
              if (v39 || !objc_msgSend(v20, "isEqualToString:", v34))
              {
                if (v38 || !objc_msgSend(v20, "isEqualToString:", v30))
                {
                  if (v37
                    || !objc_msgSend(v20, "isEqualToString:", CFSTR("com.apple.springboard.today-view")))
                  {
                    if (v36
                      || !objc_msgSend(v20, "isEqualToString:", CFSTR("com.apple.springboard.spotlight")))
                    {
                      if (v35
                        || !objc_msgSend(v20, "isEqualToString:", CFSTR("com.apple.springboard.passcode")))
                      {
                        if (v12
                          || !objc_msgSend(v20, "isEqualToString:", CFSTR("com.apple.springboard.app-switcher")))
                        {
                          if (!v31
                            && objc_msgSend(v18, "isUIApplicationElement")
                            && objc_msgSend(v18, "layoutRole") == 1)
                          {
                            v31 = v18;
                          }
                          else if (!v32)
                          {
                            if (objc_msgSend(v18, "isUIApplicationElement")
                              && objc_msgSend(v18, "layoutRole") == 6)
                            {
                              v29 = v12;
                              objc_msgSend(v18, "bundleIdentifier");
                              v22 = (void *)objc_claimAutoreleasedReturnValue();
                              v33 = objc_msgSend(v22, "isEqualToString:", CFSTR("com.apple.camera"));

                              if (v33)
                                v32 = v18;
                              else
                                v32 = 0;
                              v12 = v29;
                            }
                            else
                            {
                              v32 = 0;
                            }
                          }
                        }
                        else
                        {
                          v12 = v18;
                        }
                      }
                      else
                      {
                        v35 = v18;
                      }
                    }
                    else
                    {
                      v36 = v18;
                    }
                  }
                  else
                  {
                    v37 = v18;
                  }
                }
                else
                {
                  v38 = v18;
                }
              }
              else
              {
                v39 = v18;
              }
            }
            else
            {
              v41 = v18;
            }
          }
          else
          {
            v13 = v18;

            v14 = (void *)v13;
          }
        }
        else
        {
          v15 = v18;
        }

        ++v17;
      }
      while (v11 != v17);
      v23 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
      v11 = v23;
    }
    while (v23);
  }
  else
  {
    v31 = 0;
    v32 = 0;
    v12 = 0;
    v36 = 0;
    v37 = 0;
    v35 = 0;
    v38 = 0;
    v39 = 0;
    v13 = 0;
    v14 = 0;
    v41 = 0;
    v15 = 0;
  }

  -[SBScreenTimeTrackingController _queue_setPhoneOrFaceTimeActive:](v26, "_queue_setPhoneOrFaceTimeActive:", v13 != 0);
  -[SBScreenTimeTrackingController _queue_setScreenOn:withContext:](v26, "_queue_setScreenOn:withContext:", objc_msgSend(v28, "displayBacklightLevel") > 0, v27);
  if (!v26->_queue_isScreenOn)
  {
    queue_activeContext = 0;
    v25 = 0;
    goto LABEL_86;
  }
  if (!v14)
  {
    if (v15)
    {
      if (v38)
      {
        v25 = 14;
      }
      else
      {
        if (v35)
          v25 = 15;
        else
          v25 = 13;
        if (!(v35 | v13))
        {
          if (v32)
          {
            v25 = 11;
          }
          else if (v36)
          {
            v25 = 16;
          }
          else if (v37)
          {
            v25 = 17;
          }
          else
          {
            v25 = 9;
          }
        }
      }
      queue_activeContext = 3;
      goto LABEL_80;
    }
    if (v31)
    {
      v25 = 3;
      queue_activeContext = 2;
      goto LABEL_80;
    }
    if (v41)
    {
      if (v36)
      {
        v25 = 18;
      }
      else if (v37)
      {
        v25 = 19;
      }
      else
      {
        v25 = 2;
      }
      queue_activeContext = 1;
      goto LABEL_80;
    }
  }
  queue_activeContext = 0;
  v25 = 1;
LABEL_80:
  if (v39)
  {
    v25 = 5;
LABEL_85:
    queue_activeContext = v26->_queue_activeContext;
    goto LABEL_86;
  }
  if (!v15 && v12)
  {
    v25 = 4;
    goto LABEL_85;
  }
LABEL_86:
  -[SBScreenTimeTrackingController _queue_setActiveCategory:context:](v26, "_queue_setActiveCategory:context:", v25, queue_activeContext, v26);

}

- (void)_queue_setScreenOn:(BOOL)a3 withContext:(id)a4
{
  _BOOL4 v4;
  void *v6;
  const __CFString *v7;
  id v8;

  v4 = a3;
  v8 = a4;
  BSDispatchQueueAssert();
  if (self->_queue_isScreenOn != v4)
  {
    self->_queue_isScreenOn = v4;
    if (v4)
    {
      objc_msgSend(v8, "transitionReason");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.SpringBoard.backlight.transitionReason.homeButton")) & 1) != 0
        || (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.SpringBoard.backlight.transitionReason.lockButton")) & 1) != 0
        || (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.SpringBoard.backlight.transitionReason.smartCover")) & 1) != 0
        || (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.SpringBoard.backlight.transitionReason.magicKeyboardExtended")) & 1) != 0|| (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.SpringBoard.backlight.transitionReason.volumeButton")) & 1) != 0|| (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.SpringBoard.backlight.transitionReason.otherButton")) & 1) != 0|| (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.SpringBoard.backlight.transitionReason.liftToWake")) & 1) != 0)
      {
        v7 = CFSTR("user");
      }
      else if (self->_queue_isPhoneOrFaceTimeActive
             && (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.SpringBoard.backlight.transitionReason.fullScreenAlert")) & 1) != 0)
      {
        v7 = CFSTR("phone");
      }
      else
      {
        if ((objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.SpringBoard.backlight.transitionReason.notification")) & 1) == 0&& !objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.SpringBoard.transitionReason.notification")))
        {
          goto LABEL_12;
        }
        v7 = CFSTR("push");
      }
      soft_ADClientAddValueForScalarKey(objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.springboard.lockscreen.%@.wakeCount"), v7));
LABEL_12:

    }
  }

}

- (void)_queue_setPhoneOrFaceTimeActive:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  BSDispatchQueueAssert();
  if (self->_queue_isPhoneOrFaceTimeActive != v3)
    self->_queue_isPhoneOrFaceTimeActive = v3;
}

- (void)_queue_setActiveCategory:(int)a3 context:(int)a4
{
  uint64_t v4;
  uint64_t v5;
  unsigned int queue_activeCategory;
  uint64_t queue_activeContext;
  void *v9;
  void *v10;
  char *v11;
  void *v12;
  uint64_t v13;
  unint64_t queue_thisCategoryStartTime;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  void *v25;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  BSDispatchQueueAssert();
  queue_activeCategory = self->_queue_activeCategory;
  if (queue_activeCategory != (_DWORD)v5)
  {
    queue_activeContext = self->_queue_activeContext;
    self->_queue_activeContext = v4;
    self->_queue_activeCategory = v5;
    _SBFScreenTimeNameForCategory(queue_activeCategory);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBScreenTimeTrackingController _nameForContext:](self, "_nameForContext:", queue_activeContext);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = "BoardCameraSwipeFailedLargestPresentExtent";
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v9, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.springboard.%@.screenOnTime"), v12);
      queue_thisCategoryStartTime = self->_queue_thisCategoryStartTime;
      v22 = 0;
      v23 = &v22;
      v24 = 0x2020000000;
      v15 = getADPushTimeIntervalForDistributionKeySinceStartTimeSymbolLoc_ptr;
      v25 = getADPushTimeIntervalForDistributionKeySinceStartTimeSymbolLoc_ptr;
      if (!getADPushTimeIntervalForDistributionKeySinceStartTimeSymbolLoc_ptr)
      {
        v16 = (void *)AggregateDictionaryLibrary();
        v15 = dlsym(v16, "ADPushTimeIntervalForDistributionKeySinceStartTime");
        v23[3] = (uint64_t)v15;
        getADPushTimeIntervalForDistributionKeySinceStartTimeSymbolLoc_ptr = v15;
      }
      _Block_object_dispose(&v22, 8);
      if (!v15)
        -[SBScreenTimeTrackingController _queue_setActiveCategory:context:].cold.2();
      ((void (*)(uint64_t, unint64_t))v15)(v13, queue_thisCategoryStartTime);
      v11 = "kSBSAnalyticsEventTypeDashBoardCameraSwipeFailedLargestPresentExtent" + 26;
    }
    else
    {
      v12 = 0;
    }
    _SBFScreenTimeNameForCategory(v5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBScreenTimeTrackingController _nameForContext:](self, "_nameForContext:", v4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      soft_ADClientAddValueForScalarKey(objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.springboard.%@.activationCount"), v19));
    }
    else
    {
      v19 = 0;
    }
    _SBFScreenTimePostExternalChangeNotification(v5);
    v22 = 0;
    v23 = &v22;
    v24 = *((_QWORD *)v11 + 101);
    v20 = getADMonotonicTimeGetCurrentSymbolLoc_ptr;
    v25 = getADMonotonicTimeGetCurrentSymbolLoc_ptr;
    if (!getADMonotonicTimeGetCurrentSymbolLoc_ptr)
    {
      v21 = (void *)AggregateDictionaryLibrary();
      v20 = dlsym(v21, "ADMonotonicTimeGetCurrent");
      v23[3] = (uint64_t)v20;
      getADMonotonicTimeGetCurrentSymbolLoc_ptr = v20;
    }
    _Block_object_dispose(&v22, 8);
    if (!v20)
      -[SBScreenTimeTrackingController _queue_setActiveCategory:context:].cold.1();
    self->_queue_thisCategoryStartTime = ((uint64_t (*)(void))v20)();
    self->_queue_lastCategoryChangeTime = CFAbsoluteTimeGetCurrent();

  }
}

- (id)_nameForContext:(int)a3
{
  if ((a3 - 1) > 2)
    return CFSTR("other");
  else
    return off_1E288E0B8[a3 - 1];
}

uint64_t __83__SBScreenTimeTrackingController_layoutMonitor_didUpdateDisplayLayout_withContext___block_invoke_2(uint64_t result)
{
  unint64_t v1;

  v1 = _block_invoke_requestCount;
  _block_invoke_requestCount = 0;
  if (v1 >= 2)
    return objc_msgSend(*(id *)(result + 32), "_queue_handleNewLayout:withContext:", *(_QWORD *)(*(_QWORD *)(result + 32) + 56), *(_QWORD *)(*(_QWORD *)(result + 32) + 64));
  return result;
}

uint64_t __69__SBScreenTimeTrackingController__queue_handleNewLayout_withContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a3;
  v5 = objc_msgSend(a2, "level");
  v6 = objc_msgSend(v4, "level");

  if (v5 > v6)
    return 1;
  else
    return -1;
}

- (SBScreenTimeTrackingController)init
{
  SBScreenTimeTrackingController *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  uint64_t v5;
  FBSDisplayLayoutMonitor *layoutMonitor;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBScreenTimeTrackingController;
  v2 = -[SBScreenTimeTrackingController init](&v8, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.power.screenTimeTracking", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0D230D0]), "initWithDisplayType:", 0);
    layoutMonitor = v2->_layoutMonitor;
    v2->_layoutMonitor = (FBSDisplayLayoutMonitor *)v5;

    -[FBSDisplayLayoutMonitor addObserver:](v2->_layoutMonitor, "addObserver:", v2);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[FBSDisplayLayoutMonitor invalidate](self->_layoutMonitor, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBScreenTimeTrackingController;
  -[SBScreenTimeTrackingController dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue_lastLayoutTransitionContext, 0);
  objc_storeStrong((id *)&self->_queue_lastLayout, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_layoutMonitor, 0);
}

- (void)_queue_setActiveCategory:context:.cold.1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "ADMonotonicTime soft_ADMonotonicTimeGetCurrent(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("SBScreenTimeTrackingController.m"), 21, CFSTR("%s"), OUTLINED_FUNCTION_0_1());

  __break(1u);
}

- (void)_queue_setActiveCategory:context:.cold.2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "ADTimeInterval soft_ADPushTimeIntervalForDistributionKeySinceStartTime(CFStringRef, ADMonotonicTime)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("SBScreenTimeTrackingController.m"), 23, CFSTR("%s"), OUTLINED_FUNCTION_0_1());

  __break(1u);
}

@end
