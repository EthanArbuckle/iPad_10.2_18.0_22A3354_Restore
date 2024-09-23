@implementation _UIKBRTRecognizer

- (_UIKBRTRecognizer)init
{
  _UIKBRTRecognizer *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *touchQueue;
  dispatch_queue_t v6;
  OS_dispatch_queue *delegateQueue;
  uint64_t v8;
  NSMutableArray *touchInfos;
  uint64_t v10;
  NSMutableSet *activeTouches;
  dispatch_queue_t v12;
  OS_dispatch_queue *activeTouchesQueue;
  uint64_t v14;
  NSMutableArray *ignoredTouches;
  dispatch_queue_t v16;
  OS_dispatch_queue *ignoredTouchesQueue;
  uint64_t v18;
  NSMutableSet *definitiveRules;
  uint64_t v20;
  NSMutableSet *averagingRules;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)_UIKBRTRecognizer;
  v2 = -[_UIKBRTRecognizer init](&v23, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("_UIKBRTRecognizerQueue", v3);
    touchQueue = v2->_touchQueue;
    v2->_touchQueue = (OS_dispatch_queue *)v4;

    v6 = dispatch_queue_create("_UIKBRTRecognizerDelegateQueue", v3);
    delegateQueue = v2->_delegateQueue;
    v2->_delegateQueue = (OS_dispatch_queue *)v6;

    v8 = objc_opt_new();
    touchInfos = v2->_touchInfos;
    v2->_touchInfos = (NSMutableArray *)v8;

    v10 = objc_opt_new();
    activeTouches = v2->_activeTouches;
    v2->_activeTouches = (NSMutableSet *)v10;

    v12 = dispatch_queue_create("_UIKBRTRecogizerActiveTouchesQueue", 0);
    activeTouchesQueue = v2->_activeTouchesQueue;
    v2->_activeTouchesQueue = (OS_dispatch_queue *)v12;

    v14 = objc_opt_new();
    ignoredTouches = v2->_ignoredTouches;
    v2->_ignoredTouches = (NSMutableArray *)v14;

    v16 = dispatch_queue_create("_UIKBRTRecognizerIgnoredTouchesQueue", 0);
    ignoredTouchesQueue = v2->_ignoredTouchesQueue;
    v2->_ignoredTouchesQueue = (OS_dispatch_queue *)v16;

    v18 = objc_opt_new();
    definitiveRules = v2->_definitiveRules;
    v2->_definitiveRules = (NSMutableSet *)v18;

    v20 = objc_opt_new();
    averagingRules = v2->_averagingRules;
    v2->_averagingRules = (NSMutableSet *)v20;

    v2->_maximumNonRestMoveDistance = 0.0;
    v2->_clusterRestHaloSize.width = 0.0;
    v2->_clusterRestHaloSize.height = 0.0;

  }
  return v2;
}

- (void)reset
{
  NSObject *touchQueue;
  _QWORD block[5];

  self->_isWaiting = 0;
  touchQueue = self->_touchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26___UIKBRTRecognizer_reset__block_invoke;
  block[3] = &unk_1E16B1B28;
  block[4] = self;
  dispatch_async(touchQueue, block);
}

- (void)setStandardKeyPixelSize:(CGSize)a3
{
  NSObject *touchQueue;
  _QWORD block[5];
  CGSize v5;

  touchQueue = self->_touchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45___UIKBRTRecognizer_setStandardKeyPixelSize___block_invoke;
  block[3] = &unk_1E16B4E70;
  block[4] = self;
  v5 = a3;
  dispatch_async(touchQueue, block);
}

- (void)setDisableHomeRowReturn:(BOOL)a3
{
  NSObject *touchQueue;
  _QWORD v4[5];
  BOOL v5;

  touchQueue = self->_touchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __45___UIKBRTRecognizer_setDisableHomeRowReturn___block_invoke;
  v4[3] = &unk_1E16B1B78;
  v4[4] = self;
  v5 = a3;
  dispatch_async(touchQueue, v4);
}

- (float)letRulesModifyNewTouchInfo:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  float v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  float v17;
  float v18;
  uint64_t j;
  void *v20;
  void *v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v5 = (void *)-[NSMutableSet copy](self->_definitiveRules, "copy");
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v36;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v36 != v8)
          objc_enumerationMutation(v5);
        v10 = objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * i), "recognizer:touchStateForNewTouchInfo:", self, v4);
        if ((_DWORD)v10 != objc_msgSend(v4, "currentTouchState"))
        {
          objc_msgSend(v4, "setCurrentTouchState:", v10);
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  v11 = 1.0;
  if (-[NSMutableSet count](self->_averagingRules, "count"))
  {
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v12 = (void *)-[NSMutableSet copy](self->_averagingRules, "copy", 0);
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    if (v13)
    {
      v14 = v13;
      v15 = 0;
      v16 = *(_QWORD *)v32;
      v17 = 0.0;
      v18 = 0.0;
      do
      {
        for (j = 0; j != v14; ++j)
        {
          if (*(_QWORD *)v32 != v16)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * j), "recognizer:confidenceWhenPendingTouchInfo:", self, v4);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v20;
          if (v20)
          {
            objc_msgSend(v20, "touchConfidence");
            if (v22 <= 1.0)
              v23 = v22;
            else
              v23 = 1.0;
            if (v22 >= 0.0)
              v24 = v23;
            else
              v24 = 0.0;
            objc_msgSend(v21, "restConfidence");
            if (v25 <= 1.0)
              v26 = v25;
            else
              v26 = 1.0;
            if (v25 >= 0.0)
              v27 = v26;
            else
              v27 = 0.0;
            v18 = v18 + v24;
            v17 = v17 + v27;
            ++v15;
            if (v24 >= v27)
              v27 = v24;
            if (v27 > 0.5)
            {
              objc_msgSend(v21, "confidenceCheckTimeout");
              v11 = 1.0 - v28;
            }
          }

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
      }
      while (v14);

      if (v15)
      {
        if (v18 >= v17)
          v29 = v18;
        else
          v29 = v17;
        if ((float)(v29 / (float)v15) > 0.5)
          objc_msgSend(v4, "setCurrentTouchState:", v18 <= v17);
      }
    }
    else
    {

    }
  }

  return v11;
}

- (void)letRulesModifyPendingTouchInfo:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  float v16;
  float v17;
  uint64_t j;
  void *v19;
  void *v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  void *v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "currentTouchState") == 3)
  {
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v5 = (void *)-[NSMutableSet copy](self->_definitiveRules, "copy");
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v35;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v35 != v8)
            objc_enumerationMutation(v5);
          v10 = objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * i), "recognizer:touchStateForPendingTouchInfo:", self, v4);
          if ((_DWORD)v10 != objc_msgSend(v4, "currentTouchState"))
          {
            objc_msgSend(v4, "setCurrentTouchState:", v10);
            goto LABEL_12;
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_12:

  }
  if (objc_msgSend(v4, "currentTouchState") == 3)
  {
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v11 = (void *)-[NSMutableSet copy](self->_averagingRules, "copy", 0);
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    if (v12)
    {
      v13 = v12;
      v14 = 0;
      v15 = *(_QWORD *)v31;
      v16 = 0.0;
      v17 = 0.0;
      do
      {
        for (j = 0; j != v13; ++j)
        {
          if (*(_QWORD *)v31 != v15)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * j), "recognizer:confidenceWhenSettingTouchInfo:", self, v4);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v19;
          if (v19)
          {
            objc_msgSend(v19, "touchConfidence");
            if (v21 <= 1.0)
              v22 = v21;
            else
              v22 = 1.0;
            if (v21 >= 0.0)
              v23 = v22;
            else
              v23 = 0.0;
            v17 = v17 + v23;
            objc_msgSend(v20, "restConfidence");
            if (v24 <= 1.0)
              v25 = v24;
            else
              v25 = 1.0;
            if (v24 >= 0.0)
              v26 = v25;
            else
              v26 = 0.0;
            v16 = v16 + v26;
            ++v14;
          }

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
      }
      while (v13);

      if (v14)
      {
        v27 = v17 >= v16 ? v17 : v16;
        if ((float)(v27 / (float)v14) > 0.5)
        {
          v28 = v4;
          if (v17 <= v16)
          {
            if (objc_msgSend(v4, "preRuleTouchState") == 2)
            {
              v28 = v4;
              v29 = 2;
            }
            else
            {
              v28 = v4;
              v29 = 1;
            }
          }
          else
          {
            v29 = 0;
          }
          objc_msgSend(v28, "setCurrentTouchState:", v29);
        }
      }
    }
    else
    {

    }
  }
  if (objc_msgSend(v4, "currentTouchState") == 3)
  {
    objc_msgSend(v4, "setCurrentTouchState:", objc_msgSend(v4, "preRuleTouchState"));
    objc_msgSend(v4, "setPreRuleTouchState:", 0xFFFFFFFFLL);
  }

}

- (void)_doBeginTouchWithTouchInfo:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  NSMutableArray *touchInfos;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  double v18;
  double v19;
  int v20;
  double v21;
  BOOL v22;
  char i;
  char v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  int v35;
  double v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t j;
  void *v42;
  void *v43;
  uint64_t v44;
  unsigned __int8 v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  double v49;
  double v50;
  int v51;
  double v52;
  _BOOL4 v53;
  unsigned int v54;
  unsigned __int8 v55;
  uint64_t v56;
  double v57;
  float v58;
  float v59;
  void *v60;
  int v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  float v74;
  uint64_t v75;
  id v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t k;
  OS_dispatch_queue *touchQueue;
  uint64_t v81;
  unint64_t v82;
  void *v83;
  _QWORD v84[4];
  id v85;
  id location;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  _QWORD v103[5];
  _BYTE v104[128];
  _BYTE v105[128];
  _BYTE v106[128];
  _BYTE v107[128];
  uint64_t v108;

  v108 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "touchIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_UIKBRTRecognizer kbStatusMessage:](self, "kbStatusMessage:", CFSTR("Beginning touch on %@"), v4);
    objc_msgSend(v4, "originalTimestamp");
    v7 = v6;
    -[_UIKBRTRecognizerTouchPointTrackingProtocol addTouchInfo:](self->_touchTracker, "addTouchInfo:", v4);
    objc_msgSend(v4, "currentTimestamp");
    v9 = v8;
    touchInfos = self->_touchInfos;
    v103[0] = MEMORY[0x1E0C809B0];
    v103[1] = 3221225472;
    v103[2] = __48___UIKBRTRecognizer__doBeginTouchWithTouchInfo___block_invoke;
    v103[3] = &__block_descriptor_40_e26_B16__0___UIKBRTTouchInfo_8l;
    *(double *)&v103[4] = v7;
    -[NSMutableArray _uikbrtInsert:beforeItemPassingTest:](touchInfos, "_uikbrtInsert:beforeItemPassingTest:", v4, v103);
    objc_msgSend(v4, "currentTouchPoint");
    v12 = v11;
    v83 = (void *)objc_opt_new();
    v99 = 0u;
    v100 = 0u;
    v101 = 0u;
    v102 = 0u;
    -[NSMutableArray reverseObjectEnumerator](self->_touchInfos, "reverseObjectEnumerator");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v99, v107, 16);
    if (v14)
    {
      v81 = 0;
      v82 = 0;
      v15 = *(_QWORD *)v100;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v100 != v15)
            objc_enumerationMutation(v13);
          v17 = *(id *)(*((_QWORD *)&v99 + 1) + 8 * v16);
          if (v17 != v4)
          {
            objc_msgSend(*(id *)(*((_QWORD *)&v99 + 1) + 8 * v16), "originalTimestamp");
            v19 = v18;
            v20 = _UIInternalPreferenceUsesDefault_1(&_UIInternalPreference__UIKBRT_SetDownTapInterval, (uint64_t)CFSTR("_UIKBRT_SetDownTapInterval"));
            v21 = *(double *)&qword_1EDDA7E08;
            if (v20)
              v21 = 0.04;
            v22 = v7 - v19 > v21 && objc_msgSend(v83, "count") == self->_numProlongedTouches;
            for (i = objc_msgSend(v17, "currentTouchState"); ; i = objc_msgSend(v17, "preRuleTouchState"))
            {
              v24 = i;
              if (i != 3)
                break;
            }
            switch(i)
            {
              case 1:
                ++v82;
                goto LABEL_26;
              case 2:
              case 6:
              case 7:
                if (self->_disableHomeRowReturn)
                  goto LABEL_26;
                objc_msgSend(v17, "currentTouchPoint");
                v26 = v25;
                objc_msgSend(v4, "currentTouchPoint");
                if (vabdd_f64(v26, v27) >= self->_clusterRestHaloSize.width
                  || (objc_msgSend(v17, "currentTouchPoint"), vabdd_f64(v28, v12) >= self->_clusterRestHaloSize.height))
                {
                  if (v24 != 5)
                  {
                    objc_msgSend(v17, "originalTimestamp");
                    v34 = v33;
                    v35 = _UIInternalPreferenceUsesDefault_1(&_UIInternalPreference__UIKBRT_SetDownTapInterval, (uint64_t)CFSTR("_UIKBRT_SetDownTapInterval"));
                    v36 = *(double *)&qword_1EDDA7E08;
                    if (v35)
                      v36 = 0.04;
                    if (v7 - v34 <= v36)
                      ++v82;
                  }
                }
                else
                {
                  ++v81;
                  v22 = objc_msgSend(v83, "count") == self->_numProlongedTouches;
LABEL_26:
                  if (v22)
                    goto LABEL_38;
                }
                break;
              case 5:
                objc_msgSend(v17, "currentTouchPoint");
                v30 = v29;
                objc_msgSend(v4, "currentTouchPoint");
                if (vabdd_f64(v30, v31) < self->_clusterRestHaloSize.width)
                {
                  objc_msgSend(v17, "currentTouchPoint");
                  if (vabdd_f64(v32, v12) < self->_clusterRestHaloSize.height
                    && !-[_UIKBRTRecognizer queryDelegateOfIgnoringTouch:forOtherTouch:](self, "queryDelegateOfIgnoringTouch:forOtherTouch:", v4, 1))
                  {
                    objc_msgSend(v83, "addObject:", v17);
                  }
                }
                goto LABEL_26;
              default:
                goto LABEL_26;
            }
          }
          ++v16;
        }
        while (v16 != v14);
        v37 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v99, v107, 16);
        v14 = v37;
      }
      while (v37);
    }
    else
    {
      v81 = 0;
      v82 = 0;
    }
LABEL_38:

    if (objc_msgSend(v83, "count"))
    {
      objc_msgSend(v83, "count");
      v97 = 0u;
      v98 = 0u;
      v95 = 0u;
      v96 = 0u;
      v38 = v83;
      v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v95, v106, 16);
      if (v39)
      {
        v40 = *(_QWORD *)v96;
        do
        {
          for (j = 0; j != v39; ++j)
          {
            if (*(_QWORD *)v96 != v40)
              objc_enumerationMutation(v38);
            v42 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * j);
            -[_UIKBRTRecognizer makeTouchIgnored:force:](self, "makeTouchIgnored:force:", v42, 1);
            objc_msgSend(v42, "setCurrentTouchState:", 7);
          }
          v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v95, v106, 16);
        }
        while (v39);
      }

      dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_368);
      -[_UIKBRTRecognizer makeTouchIgnored:force:](self, "makeTouchIgnored:force:", v4, 1);
      goto LABEL_102;
    }
    if (v82 < 2)
    {
      if (v81 && !objc_msgSend(v4, "currentTouchState"))
        objc_msgSend(v4, "setCurrentTouchState:", 2);
      if (_UIInternalPreferenceUsesDefault_1(&_UIInternalPreference__UIKBRT_SetDownTapInterval, (uint64_t)CFSTR("_UIKBRT_SetDownTapInterval")))v57 = 0.04;
      else
        v57 = *(double *)&qword_1EDDA7E08;
      objc_msgSend(v4, "setPreRuleTouchState:", objc_msgSend(v4, "currentTouchState"));
      -[_UIKBRTRecognizer letRulesModifyNewTouchInfo:](self, "letRulesModifyNewTouchInfo:", v4);
      v59 = v58;
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = objc_msgSend(v4, "currentTouchState");
      objc_msgSend(v4, "previousTouch");
      v62 = (void *)objc_claimAutoreleasedReturnValue();

      if (v62)
      {
        objc_msgSend(v4, "previousTouch");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "setOfTouchesToIgnoreWhenSettingTouchInfo:toState:", v4, objc_msgSend(v4, "currentTouchState"));
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "setByAddingObjectsFromSet:", v64);
        v65 = objc_claimAutoreleasedReturnValue();

        v60 = (void *)v65;
      }
      objc_msgSend(v4, "nextTouch");
      v66 = (void *)objc_claimAutoreleasedReturnValue();

      if (v66)
      {
        objc_msgSend(v4, "nextTouch");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "setOfTouchesToIgnoreWhenSettingTouchInfo:toState:", v4, objc_msgSend(v4, "currentTouchState"));
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "setByAddingObjectsFromSet:", v68);
        v69 = objc_claimAutoreleasedReturnValue();

        v60 = (void *)v69;
      }
      if (objc_msgSend(v4, "currentTouchState") != v61)
      {
        objc_msgSend(v4, "previousTouch");
        v70 = (void *)objc_claimAutoreleasedReturnValue();

        if (v70)
        {
          objc_msgSend(v4, "previousTouch");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v71, "setOfTouchesToIgnoreWhenSettingTouchInfo:toState:", v4, objc_msgSend(v4, "currentTouchState"));
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "setByAddingObjectsFromSet:", v72);
          v73 = objc_claimAutoreleasedReturnValue();

          v60 = (void *)v73;
        }
        -[_UIKBRTRecognizer letRulesModifyNewTouchInfo:](self, "letRulesModifyNewTouchInfo:", v4);
        if (v59 >= v74)
          v59 = v74;
      }
      if (objc_msgSend(v4, "currentTouchState") == 6)
      {
        objc_msgSend(v60, "setByAddingObject:", v4);
        v75 = objc_claimAutoreleasedReturnValue();

        v60 = (void *)v75;
      }
      else if (-[NSMutableSet count](self->_definitiveRules, "count")
             || -[NSMutableSet count](self->_averagingRules, "count"))
      {
        objc_msgSend(v4, "setPreRuleTouchState:", objc_msgSend(v4, "currentTouchState"));
        objc_msgSend(v4, "setCurrentTouchState:", 3);
      }
      v89 = 0u;
      v90 = 0u;
      v87 = 0u;
      v88 = 0u;
      v76 = v60;
      v77 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v87, v104, 16);
      if (v77)
      {
        v78 = *(_QWORD *)v88;
        do
        {
          for (k = 0; k != v77; ++k)
          {
            if (*(_QWORD *)v88 != v78)
              objc_enumerationMutation(v76);
            -[_UIKBRTRecognizer makeTouchIgnored:force:](self, "makeTouchIgnored:force:", *(_QWORD *)(*((_QWORD *)&v87 + 1) + 8 * k), 1);
          }
          v77 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v87, v104, 16);
        }
        while (v77);
      }

      if (objc_msgSend(v4, "currentTouchState") <= 3)
      {
        if (v59 < 1.0)
          v57 = v57 * 0.25 + v57 * 0.25 * v59 * 3.0 * 0.25;
        objc_initWeak(&location, self);
        touchQueue = self->_touchQueue;
        v84[0] = MEMORY[0x1E0C809B0];
        v84[1] = 3221225472;
        v84[2] = __48___UIKBRTRecognizer__doBeginTouchWithTouchInfo___block_invoke_4;
        v84[3] = &unk_1E16D7F10;
        objc_copyWeak(&v85, &location);
        objc_msgSend(v4, "setTimerWithTimeInterval:onQueue:do:", touchQueue, v84, v7 + v57 - v9);
        objc_destroyWeak(&v85);
        objc_destroyWeak(&location);
      }

      goto LABEL_102;
    }
    v93 = 0u;
    v94 = 0u;
    v91 = 0u;
    v92 = 0u;
    -[NSMutableArray reverseObjectEnumerator](self->_touchInfos, "reverseObjectEnumerator");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v91, v105, 16);
    if (!v44)
    {
LABEL_69:

      dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_27_3);
LABEL_102:

      goto LABEL_103;
    }
    v45 = 0;
    v46 = *(_QWORD *)v92;
LABEL_50:
    v47 = 0;
    while (1)
    {
      if (*(_QWORD *)v92 != v46)
        objc_enumerationMutation(v43);
      v48 = *(id *)(*((_QWORD *)&v91 + 1) + 8 * v47);
      objc_msgSend(v48, "originalTimestamp");
      v50 = v49;
      v51 = _UIInternalPreferenceUsesDefault_1(&_UIInternalPreference__UIKBRT_SetDownTapInterval, (uint64_t)CFSTR("_UIKBRT_SetDownTapInterval"));
      v52 = *(double *)&qword_1EDDA7E08;
      if (v51)
        v52 = 0.04;
      if (((v7 - v50 > v52) & v45) != 0)
        goto LABEL_69;
      v53 = v48 == v4;
      v54 = objc_msgSend(v48, "currentTouchState");
      v45 |= v53;
      if (v54 < 4)
        break;
      if (v54 == 7)
      {
        v55 = v45;
      }
      else
      {
        if (v54 == 5)
          break;
        v55 = 0;
      }
LABEL_58:
      if ((v55 & 1) != 0 || !v53)
      {
        if ((v55 & 1) != 0)
          goto LABEL_69;
      }
      else
      {
        -[_UIKBRTRecognizer makeTouchIgnored:force:](self, "makeTouchIgnored:force:", v48, 1);
        objc_msgSend(v48, "setCurrentTouchState:", 7);
      }
      if (v44 == ++v47)
      {
        v56 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v91, v105, 16);
        v44 = v56;
        if (v56)
          goto LABEL_50;
        goto LABEL_69;
      }
    }
    v55 = 0;
    v53 = 1;
    goto LABEL_58;
  }
  -[_UIKBRTRecognizer makeTouchIgnored:force:](self, "makeTouchIgnored:force:", v4, 1);
LABEL_103:

}

- (void)touchDown:(id)a3 withIdentifier:(id)a4 canLogTouch:(BOOL)a5
{
  void *v6;
  NSObject *touchQueue;
  id v8;
  _QWORD v9[5];
  id v10;

  +[_UIKBRTTouchInfo createTouchInfoForTouch:withIdentifier:canLogTouch:](_UIKBRTTouchInfo, "createTouchInfoForTouch:withIdentifier:canLogTouch:", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIKBRTRecognizerTouchLoggingProtocol logTouchInfo:withPhase:](self->_touchLogger, "logTouchInfo:withPhase:", v6, 0);
  touchQueue = self->_touchQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58___UIKBRTRecognizer_touchDown_withIdentifier_canLogTouch___block_invoke;
  v9[3] = &unk_1E16B1B50;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(touchQueue, v9);

}

- (void)_doMovedTouchWithTouchInfo:(id)a3
{
  id v4;

  v4 = a3;
  if ((-[NSMutableArray containsObject:](self->_ignoredTouches, "containsObject:") & 1) != 0)
  {
    -[_UIKBRTRecognizer notifyDelegateOfMovedIgnoredTouch:](self, "notifyDelegateOfMovedIgnoredTouch:", v4);
    -[_UIKBRTRecognizerTouchPointTrackingProtocol moveTouchInfo:](self->_touchTracker, "moveTouchInfo:", v4);
  }
  else
  {
    -[_UIKBRTRecognizer kbStatusMessage:](self, "kbStatusMessage:", CFSTR("Moving touch on %@"), v4);
    -[_UIKBRTRecognizerTouchPointTrackingProtocol moveTouchInfo:](self->_touchTracker, "moveTouchInfo:", v4);
    if (!-[_UIKBRTRecognizer notifyDelegateOfMovedTouch:](self, "notifyDelegateOfMovedTouch:", v4))
      -[_UIKBRTRecognizer makeTouchIgnored:force:](self, "makeTouchIgnored:force:", v4, 1);
  }

}

- (void)touchDragged:(id)a3 withIdentifier:(id)a4
{
  void *v5;
  NSObject *touchQueue;
  _QWORD v7[5];
  id v8;

  +[_UIKBRTTouchInfo touchInfoForTouch:withIdentifier:](_UIKBRTTouchInfo, "touchInfoForTouch:withIdentifier:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[_UIKBRTRecognizerTouchLoggingProtocol logTouchInfo:withPhase:](self->_touchLogger, "logTouchInfo:withPhase:", v5, 1);
    touchQueue = self->_touchQueue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __49___UIKBRTRecognizer_touchDragged_withIdentifier___block_invoke;
    v7[3] = &unk_1E16B1B50;
    v7[4] = self;
    v8 = v5;
    dispatch_async(touchQueue, v7);

  }
}

- (void)_doEndedTouchWithTouchInfo:(id)a3
{
  NSObject *ignoredTouchesQueue;
  id v5;
  double v6;
  double v7;
  const __CFString *v8;
  void *v9;
  double v10;
  double v11;
  int v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  float v21;
  double v22;
  double v23;
  double v24;
  char v25;
  void *v26;
  double v27;
  void *v30;
  void *v31;
  id v32;
  _QWORD block[5];
  id v34;

  v32 = a3;
  -[_UIKBRTRecognizer letRulesModifyPendingTouchInfo:](self, "letRulesModifyPendingTouchInfo:");
  if (!-[NSMutableArray containsObject:](self->_ignoredTouches, "containsObject:", v32))
  {
    v8 = &stru_1E16EDF20;
    objc_msgSend(v32, "touchIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v26
      || objc_msgSend(v32, "currentTouchState")
      || -[_UIKBRTRecognizer makeTouchActive:](self, "makeTouchActive:", v32))
    {
      v25 = 0;
    }
    else
    {
      v25 = 1;
      -[_UIKBRTRecognizer makeTouchIgnored:force:](self, "makeTouchIgnored:force:", v32, 1);
      v8 = CFSTR("initially-active ");
    }
    goto LABEL_29;
  }
  ignoredTouchesQueue = self->_ignoredTouchesQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48___UIKBRTRecognizer__doEndedTouchWithTouchInfo___block_invoke;
  block[3] = &unk_1E16B1B50;
  block[4] = self;
  v5 = v32;
  v34 = v5;
  dispatch_sync(ignoredTouchesQueue, block);

  objc_msgSend(v5, "currentTimestamp");
  v7 = v6;
  v8 = CFSTR("ignored ");
  objc_msgSend(v5, "touchIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
    goto LABEL_28;
  v10 = _UIInternalPreferenceUsesDefault_1((int *)&_UIInternalPreference__UIKBRT_MinimumRestHoldInterval, (uint64_t)CFSTR("_UIKBRT_MinimumRestHoldInterval"))? 0.0: *(double *)&qword_1EDDA7E28;
  v11 = _UIInternalPreferenceUsesDefault_1((int *)&_UIInternalPreference__UIKBRT_MaximumRestHoldInterval, (uint64_t)CFSTR("_UIKBRT_MaximumRestHoldInterval"))? 0.25: *(double *)&qword_1EDDA7E38;
  v12 = objc_msgSend(v5, "currentTouchState");
  if (v12 != 1 && v12 != 6)
    goto LABEL_28;
  objc_msgSend(v5, "currentTouchPoint");
  v14 = v13;
  objc_msgSend(v5, "originalTouchPoint");
  v16 = v15;
  objc_msgSend(v5, "currentTouchPoint");
  v18 = v17;
  objc_msgSend(v5, "originalTouchPoint");
  v20 = v19;
  objc_msgSend(v5, "originalTimestamp");
  v21 = (v14 - v16) * (v14 - v16) + (v18 - v20) * (v18 - v20);
  v22 = sqrtf(v21);
  v24 = v7 - v23;
  if (self->_maximumNonRestMoveDistance <= v22)
  {
    objc_msgSend(v5, "maximumRadius");
    if (v27 <= v22 || v10 > v24 || v24 > v11)
      goto LABEL_28;
    goto LABEL_26;
  }
  v25 = 1;
  if (v10 <= v24 && v24 <= v11)
  {
LABEL_26:
    if (-[_UIKBRTRecognizer queryDelegateToBeginTouch:forBeginState:restartIfNecessary:](self, "queryDelegateToBeginTouch:forBeginState:restartIfNecessary:", v5, 1, 1))
    {
      objc_msgSend(v5, "setCurrentTouchState:", 1);
      v25 = 0;
      v8 = CFSTR("initially-ignored ");
      goto LABEL_29;
    }
LABEL_28:
    v25 = 1;
  }
LABEL_29:
  -[_UIKBRTRecognizer queryDelegateToBeginTouch:forBeginState:restartIfNecessary:](self, "queryDelegateToBeginTouch:forBeginState:restartIfNecessary:", v32, 2, 0);
  if ((v25 & 1) != 0
    || (objc_msgSend(v32, "touchIdentifier"), v30 = (void *)objc_claimAutoreleasedReturnValue(), v30, !v30))
  {
    objc_msgSend(v32, "touchIdentifier");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
      -[_UIKBRTRecognizer notifyDelegateOfCancelledTouch:](self, "notifyDelegateOfCancelledTouch:", v32);
  }
  else
  {
    -[_UIKBRTRecognizer processTouchInfo:](self, "processTouchInfo:", v32);
  }
  objc_msgSend(v32, "cleanup");
  -[_UIKBRTRecognizer kbStatusMessage:](self, "kbStatusMessage:", CFSTR("Ended %@touch on %@"), v8, v32);

}

- (void)touchUp:(id)a3 withIdentifier:(id)a4
{
  void *v5;
  NSObject *touchQueue;
  _QWORD v7[5];
  id v8;

  +[_UIKBRTTouchInfo touchInfoForTouch:withIdentifier:](_UIKBRTTouchInfo, "touchInfoForTouch:withIdentifier:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[_UIKBRTRecognizerTouchLoggingProtocol logTouchInfo:withPhase:](self->_touchLogger, "logTouchInfo:withPhase:", v5, 3);
    objc_msgSend(v5, "invalidateTimer");
    touchQueue = self->_touchQueue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __44___UIKBRTRecognizer_touchUp_withIdentifier___block_invoke;
    v7[3] = &unk_1E16B1B50;
    v7[4] = self;
    v8 = v5;
    dispatch_async(touchQueue, v7);

  }
}

- (void)_doCancelledTouchWithTouchInfo:(id)a3
{
  NSObject *ignoredTouchesQueue;
  id v5;
  void *v6;
  id v7;
  _QWORD block[5];
  id v9;

  v7 = a3;
  -[_UIKBRTRecognizer kbStatusMessage:](self, "kbStatusMessage:", CFSTR("Cancelling touch on %@"), v7);
  ignoredTouchesQueue = self->_ignoredTouchesQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52___UIKBRTRecognizer__doCancelledTouchWithTouchInfo___block_invoke;
  block[3] = &unk_1E16B1B50;
  block[4] = self;
  v5 = v7;
  v9 = v5;
  dispatch_sync(ignoredTouchesQueue, block);
  objc_msgSend(v5, "touchIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    -[_UIKBRTRecognizer cancelTouchOnLayoutWithTouchInfo:](self, "cancelTouchOnLayoutWithTouchInfo:", v5);

  objc_msgSend(v7, "cleanup");
  -[_UIKBRTRecognizer kbStatusMessage:](self, "kbStatusMessage:", CFSTR("Cancelled %@touch on %@"), &stru_1E16EDF20, v7);

}

- (void)touchCancelled:(id)a3 withIdentifier:(id)a4
{
  void *v5;
  NSObject *touchQueue;
  _QWORD v7[5];
  id v8;

  +[_UIKBRTTouchInfo touchInfoForTouch:withIdentifier:](_UIKBRTTouchInfo, "touchInfoForTouch:withIdentifier:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[_UIKBRTRecognizerTouchLoggingProtocol logTouchInfo:withPhase:](self->_touchLogger, "logTouchInfo:withPhase:", v5, 4);
    objc_msgSend(v5, "invalidateTimer");
    touchQueue = self->_touchQueue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __51___UIKBRTRecognizer_touchCancelled_withIdentifier___block_invoke;
    v7[3] = &unk_1E16B1B50;
    v7[4] = self;
    v8 = v5;
    dispatch_async(touchQueue, v7);

  }
}

- (void)_doMarkTouchProcessedWithTouchInfo:(id)a3
{
  id v4;
  NSObject *ignoredTouchesQueue;
  id v6;
  id v7;
  _QWORD block[5];
  id v9;

  v4 = a3;
  if (v4)
  {
    v7 = v4;
    objc_msgSend(v4, "invalidateTimer");
    ignoredTouchesQueue = self->_ignoredTouchesQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56___UIKBRTRecognizer__doMarkTouchProcessedWithTouchInfo___block_invoke;
    block[3] = &unk_1E16B1B50;
    block[4] = self;
    v6 = v7;
    v9 = v6;
    dispatch_sync(ignoredTouchesQueue, block);
    if (-[_UIKBRTRecognizer removedFromActiveTouches:](self, "removedFromActiveTouches:", v6))
      -[_UIKBRTRecognizerTouchLoggingProtocol closeTouchInfo:](self->_touchLogger, "closeTouchInfo:", v6);
    objc_msgSend(v6, "cleanup");

    v4 = v7;
  }

}

- (void)markTouchProcessed:(id)a3 withIdentifier:(id)a4
{
  void *v5;
  NSObject *touchQueue;
  id v7;
  _QWORD v8[5];
  id v9;

  +[_UIKBRTTouchInfo touchInfoForTouch:withIdentifier:](_UIKBRTTouchInfo, "touchInfoForTouch:withIdentifier:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  touchQueue = self->_touchQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55___UIKBRTRecognizer_markTouchProcessed_withIdentifier___block_invoke;
  v8[3] = &unk_1E16B1B50;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(touchQueue, v8);

}

- (void)_doIgnoreTouchWithTouchInfo:(id)a3
{
  _UIKBRTRecognizerTouchLoggingProtocol *touchLogger;
  id v5;

  if (a3)
  {
    touchLogger = self->_touchLogger;
    v5 = a3;
    -[_UIKBRTRecognizerTouchLoggingProtocol logTouchInfo:withPhase:](touchLogger, "logTouchInfo:withPhase:", v5, 4);
    objc_msgSend(v5, "invalidateTimer");
    -[_UIKBRTRecognizer makeTouchIgnored:force:](self, "makeTouchIgnored:force:", v5, 1);

  }
}

- (void)explicitlyIgnoreTouch:(id)a3 withIdentifier:(id)a4
{
  void *v5;
  NSObject *touchQueue;
  id v7;
  _QWORD v8[5];
  id v9;

  +[_UIKBRTTouchInfo touchInfoForTouch:withIdentifier:](_UIKBRTTouchInfo, "touchInfoForTouch:withIdentifier:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  touchQueue = self->_touchQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58___UIKBRTRecognizer_explicitlyIgnoreTouch_withIdentifier___block_invoke;
  v8[3] = &unk_1E16B1B50;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(touchQueue, v8);

}

- (void)updateIgnoredTouchesForTouchInfo:(id)a3 whenTouchInfo:(id)a4 changesStateTo:(char)a5
{
  uint64_t v5;
  NSObject *ignoredTouchesQueue;
  id v9;
  _QWORD block[5];
  id v11;

  v5 = a5;
  v9 = a3;
  if (objc_msgSend(v9, "willChangeTouchInfo:toState:", a4, v5))
  {
    ignoredTouchesQueue = self->_ignoredTouchesQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __83___UIKBRTRecognizer_updateIgnoredTouchesForTouchInfo_whenTouchInfo_changesStateTo___block_invoke;
    block[3] = &unk_1E16B1B50;
    block[4] = self;
    v11 = v9;
    dispatch_sync(ignoredTouchesQueue, block);

  }
}

- (void)processTouchInfo:(id)a3
{
  int v4;
  uint64_t v5;
  int v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  objc_msgSend(v12, "invalidateTimer");
  v4 = objc_msgSend(v12, "currentTouchState");
  if (v4 == 3 || v4 == 6)
  {
    v6 = 0;
    v5 = 6;
  }
  else
  {
    if (v4 == 5)
      --self->_numProlongedTouches;
    v5 = 8;
    v6 = 1;
  }
  v7 = objc_msgSend(v12, "currentTouchState");
  v8 = v12;
  if (v7 != (_DWORD)v5)
  {
    objc_msgSend(v12, "previousTouch");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIKBRTRecognizer updateIgnoredTouchesForTouchInfo:whenTouchInfo:changesStateTo:](self, "updateIgnoredTouchesForTouchInfo:whenTouchInfo:changesStateTo:", v9, v12, v5);

    objc_msgSend(v12, "nextTouch");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIKBRTRecognizer updateIgnoredTouchesForTouchInfo:whenTouchInfo:changesStateTo:](self, "updateIgnoredTouchesForTouchInfo:whenTouchInfo:changesStateTo:", v10, v12, v5);

    objc_msgSend(v12, "setCurrentTouchState:", v5);
    if (v6)
    {
      -[_UIKBRTRecognizer notifyDelegateOfSuccessfulTouch:](self, "notifyDelegateOfSuccessfulTouch:", v12);
LABEL_12:
      v8 = v12;
      goto LABEL_13;
    }
    objc_msgSend(v12, "touchIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = v12;
    if (v11)
    {
      -[_UIKBRTRecognizer notifyDelegateOfCancelledTouch:](self, "notifyDelegateOfCancelledTouch:", v12);
      goto LABEL_12;
    }
  }
LABEL_13:

}

- (BOOL)addedToActiveTouches:(id)a3
{
  id v4;
  NSObject *activeTouchesQueue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  activeTouchesQueue = self->_activeTouchesQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42___UIKBRTRecognizer_addedToActiveTouches___block_invoke;
  block[3] = &unk_1E16B9698;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(activeTouchesQueue, block);
  LOBYTE(activeTouchesQueue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)activeTouchesQueue;
}

- (BOOL)removedFromActiveTouches:(id)a3
{
  id v4;
  NSObject *activeTouchesQueue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  activeTouchesQueue = self->_activeTouchesQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46___UIKBRTRecognizer_removedFromActiveTouches___block_invoke;
  block[3] = &unk_1E16B9698;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(activeTouchesQueue, block);
  LOBYTE(activeTouchesQueue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)activeTouchesQueue;
}

- (BOOL)queryDelegateToBeginTouch:(id)a3 forBeginState:(unint64_t)a4 restartIfNecessary:(BOOL)a5
{
  id v8;
  dispatch_semaphore_t v9;
  NSObject *delegateQueue;
  NSObject *v11;
  dispatch_time_t v12;
  BOOL v13;
  _QWORD v15[5];
  id v16;
  NSObject *v17;
  uint64_t *v18;
  unint64_t v19;
  BOOL v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v8 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  if (self->_delegate)
  {
    v9 = dispatch_semaphore_create(0);
    delegateQueue = self->_delegateQueue;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __80___UIKBRTRecognizer_queryDelegateToBeginTouch_forBeginState_restartIfNecessary___block_invoke;
    v15[3] = &unk_1E16D7F60;
    v15[4] = self;
    v18 = &v21;
    v19 = a4;
    v16 = v8;
    v11 = v9;
    v17 = v11;
    v20 = a5;
    dispatch_async(delegateQueue, v15);
    self->_isWaiting = 1;
    do
    {
      if (!self->_isWaiting)
        break;
      v12 = dispatch_time(0, 1000000000);
    }
    while (dispatch_semaphore_wait(v11, v12));
    self->_isWaiting = 0;

    v13 = *((_BYTE *)v22 + 24) != 0;
  }
  else
  {
    v13 = 0;
  }
  _Block_object_dispose(&v21, 8);

  return v13;
}

- (void)notifyDelegateOfSuccessfulTouch:(id)a3
{
  id v5;
  void *v6;
  dispatch_semaphore_t v7;
  NSObject *delegateQueue;
  NSObject *v9;
  dispatch_time_t v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD block[5];
  id v15;
  NSObject *v16;

  v5 = a3;
  objc_msgSend(v5, "touchIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIKBRTRecognizer.m"), 983, CFSTR("Can't succeed on a touch that we're supposed to be ignoring!"));

  }
  if ((-[NSMutableSet containsObject:](self->_activeTouches, "containsObject:", v5) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIKBRTRecognizer.m"), 984, CFSTR("Can't succeed on a touch that isn't already active!"));

  }
  if (-[NSMutableArray containsObject:](self->_ignoredTouches, "containsObject:", v5))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIKBRTRecognizer.m"), 985, CFSTR("Can't succeed on a touch that we're supposed to be ignoring!"));

  }
  if (self->_delegate)
  {
    v7 = dispatch_semaphore_create(0);
    delegateQueue = self->_delegateQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __53___UIKBRTRecognizer_notifyDelegateOfSuccessfulTouch___block_invoke;
    block[3] = &unk_1E16B47A8;
    block[4] = self;
    v15 = v5;
    v9 = v7;
    v16 = v9;
    dispatch_async(delegateQueue, block);
    self->_isWaiting = 1;
    do
    {
      if (!self->_isWaiting)
        break;
      v10 = dispatch_time(0, 1000000000);
    }
    while (dispatch_semaphore_wait(v9, v10));
    self->_isWaiting = 0;

  }
}

- (void)notifyDelegateOfCancelledTouch:(id)a3
{
  id v5;
  void *v6;
  dispatch_semaphore_t v7;
  NSObject *delegateQueue;
  NSObject *v9;
  dispatch_time_t v10;
  void *v11;
  _QWORD block[5];
  id v13;
  NSObject *v14;

  v5 = a3;
  objc_msgSend(v5, "touchIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIKBRTRecognizer.m"), 1006, CFSTR("Can't succeed on a touch that we're supposed to be ignoring!"));

  }
  if (-[NSMutableSet containsObject:](self->_activeTouches, "containsObject:", v5) && self->_delegate)
  {
    v7 = dispatch_semaphore_create(0);
    delegateQueue = self->_delegateQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __52___UIKBRTRecognizer_notifyDelegateOfCancelledTouch___block_invoke;
    block[3] = &unk_1E16B47A8;
    block[4] = self;
    v13 = v5;
    v9 = v7;
    v14 = v9;
    dispatch_async(delegateQueue, block);
    self->_isWaiting = 1;
    do
    {
      if (!self->_isWaiting)
        break;
      v10 = dispatch_time(0, 1000000000);
    }
    while (dispatch_semaphore_wait(v9, v10));
    self->_isWaiting = 0;

  }
}

- (BOOL)notifyDelegateOfMovedTouch:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  NSObject *delegateQueue;
  NSObject *v7;
  dispatch_time_t v8;
  char v9;
  _QWORD v11[5];
  id v12;
  NSObject *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  -[_UIKBRTRecognizer queryDelegateToBeginTouch:forBeginState:restartIfNecessary:](self, "queryDelegateToBeginTouch:forBeginState:restartIfNecessary:", v4, 1, 0);
  if (self->_delegate)
  {
    v5 = dispatch_semaphore_create(0);
    delegateQueue = self->_delegateQueue;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __48___UIKBRTRecognizer_notifyDelegateOfMovedTouch___block_invoke;
    v11[3] = &unk_1E16BCFE0;
    v11[4] = self;
    v12 = v4;
    v14 = &v15;
    v7 = v5;
    v13 = v7;
    dispatch_async(delegateQueue, v11);
    self->_isWaiting = 1;
    do
    {
      if (!self->_isWaiting)
        break;
      v8 = dispatch_time(0, 1000000000);
    }
    while (dispatch_semaphore_wait(v7, v8));
    self->_isWaiting = 0;

  }
  v9 = *((_BYTE *)v16 + 24);
  _Block_object_dispose(&v15, 8);

  return v9;
}

- (void)notifyDelegateOfMovedIgnoredTouch:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  NSObject *delegateQueue;
  NSObject *v7;
  dispatch_time_t v8;
  _QWORD block[5];
  id v10;
  NSObject *v11;

  v4 = a3;
  -[_UIKBRTRecognizer queryDelegateToBeginTouch:forBeginState:restartIfNecessary:](self, "queryDelegateToBeginTouch:forBeginState:restartIfNecessary:", v4, 0, 0);
  if (self->_delegate)
  {
    v5 = dispatch_semaphore_create(0);
    delegateQueue = self->_delegateQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __55___UIKBRTRecognizer_notifyDelegateOfMovedIgnoredTouch___block_invoke;
    block[3] = &unk_1E16B47A8;
    block[4] = self;
    v10 = v4;
    v7 = v5;
    v11 = v7;
    dispatch_async(delegateQueue, block);
    self->_isWaiting = 1;
    do
    {
      if (!self->_isWaiting)
        break;
      v8 = dispatch_time(0, 1000000000);
    }
    while (dispatch_semaphore_wait(v7, v8));
    self->_isWaiting = 0;

  }
}

- (BOOL)queryDelegateOfIgnoringTouch:(id)a3 forOtherTouch:(BOOL)a4
{
  id v6;
  dispatch_semaphore_t v7;
  NSObject *delegateQueue;
  NSObject *v9;
  dispatch_time_t v10;
  char v11;
  _QWORD block[5];
  id v14;
  NSObject *v15;
  uint64_t *v16;
  BOOL v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v6 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 1;
  -[_UIKBRTRecognizer queryDelegateToBeginTouch:forBeginState:restartIfNecessary:](self, "queryDelegateToBeginTouch:forBeginState:restartIfNecessary:", v6, 0, 0);
  if (self->_delegate)
  {
    v7 = dispatch_semaphore_create(0);
    delegateQueue = self->_delegateQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64___UIKBRTRecognizer_queryDelegateOfIgnoringTouch_forOtherTouch___block_invoke;
    block[3] = &unk_1E16D7FD8;
    block[4] = self;
    v17 = a4;
    v14 = v6;
    v16 = &v18;
    v9 = v7;
    v15 = v9;
    dispatch_async(delegateQueue, block);
    self->_isWaiting = 1;
    do
    {
      if (!self->_isWaiting)
        break;
      v10 = dispatch_time(0, 1000000000);
    }
    while (dispatch_semaphore_wait(v9, v10));
    self->_isWaiting = 0;

  }
  v11 = *((_BYTE *)v19 + 24);
  _Block_object_dispose(&v18, 8);

  return v11;
}

- (BOOL)queryDelegateOfRestingTouch:(id)a3
{
  return -[_UIKBRTRecognizer queryDelegateOfIgnoringTouch:forOtherTouch:](self, "queryDelegateOfIgnoringTouch:forOtherTouch:", a3, 0);
}

- (void)notifyDelegateOfIgnoringTouch:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  NSObject *delegateQueue;
  NSObject *v7;
  dispatch_time_t v8;
  _QWORD block[5];
  id v10;
  NSObject *v11;

  v4 = a3;
  -[_UIKBRTRecognizer queryDelegateToBeginTouch:forBeginState:restartIfNecessary:](self, "queryDelegateToBeginTouch:forBeginState:restartIfNecessary:", v4, 0, 0);
  if (self->_delegate)
  {
    v5 = dispatch_semaphore_create(0);
    delegateQueue = self->_delegateQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51___UIKBRTRecognizer_notifyDelegateOfIgnoringTouch___block_invoke;
    block[3] = &unk_1E16B47A8;
    block[4] = self;
    v10 = v4;
    v7 = v5;
    v11 = v7;
    dispatch_async(delegateQueue, block);
    self->_isWaiting = 1;
    do
    {
      if (!self->_isWaiting)
        break;
      v8 = dispatch_time(0, 1000000000);
    }
    while (dispatch_semaphore_wait(v7, v8));
    self->_isWaiting = 0;

  }
}

- (void)notifyDelegateOfRestingTouch:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "touchIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIKBRTRecognizer.m"), 1132, CFSTR("Can't rest on a touch that we're supposed to be ignoring!"));

  }
  -[_UIKBRTRecognizer makeTouchIgnored:force:](self, "makeTouchIgnored:force:", v7, 1);

}

- (void)cancelTouchOnLayoutWithTouchInfo:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  NSObject *delegateQueue;
  NSObject *v7;
  dispatch_time_t v8;
  _QWORD block[5];
  id v10;
  NSObject *v11;

  v4 = a3;
  if (self->_delegate)
  {
    v5 = dispatch_semaphore_create(0);
    delegateQueue = self->_delegateQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __54___UIKBRTRecognizer_cancelTouchOnLayoutWithTouchInfo___block_invoke;
    block[3] = &unk_1E16B47A8;
    block[4] = self;
    v10 = v4;
    v7 = v5;
    v11 = v7;
    dispatch_async(delegateQueue, block);
    self->_isWaiting = 1;
    do
    {
      if (!self->_isWaiting)
        break;
      v8 = dispatch_time(0, 1000000000);
    }
    while (dispatch_semaphore_wait(v7, v8));
    self->_isWaiting = 0;

  }
}

- (BOOL)makeTouchActive:(id)a3
{
  id v5;
  void *v6;
  int v7;
  double v8;
  double v9;
  double v10;
  int v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  OS_dispatch_queue *touchQueue;
  BOOL v17;
  void *v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  id location;

  v5 = a3;
  objc_msgSend(v5, "touchIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIKBRTRecognizer.m"), 1165, CFSTR("Can't rest on a touch that we're supposed to be ignoring!"));

  }
  if (-[NSMutableArray containsObject:](self->_ignoredTouches, "containsObject:", v5))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIKBRTRecognizer.m"), 1166, CFSTR("Can't rest on a touch that we're supposed to be ignoring!"));

  }
  objc_msgSend(v5, "invalidateTimer");
  v7 = -[NSMutableSet containsObject:](self->_activeTouches, "containsObject:", v5);
  if (-[_UIKBRTRecognizer queryDelegateToBeginTouch:forBeginState:restartIfNecessary:](self, "queryDelegateToBeginTouch:forBeginState:restartIfNecessary:", v5, 1, 0))
  {
    objc_msgSend(v5, "setCurrentTouchState:", 4);
    objc_msgSend(v5, "originalTimestamp");
    v9 = v8;
    objc_initWeak(&location, self);
    if (_UIInternalPreferenceUsesDefault_1((int *)&_UIInternalPreference__UIKBRT_KeyHoldCancelInterval, (uint64_t)CFSTR("_UIKBRT_KeyHoldCancelInterval")))v10 = 0.5;
    else
      v10 = *(double *)&qword_1EDDA7E18;
    v11 = _UIInternalPreferenceUsesDefault_1(&_UIInternalPreference__UIKBRT_SetDownTapInterval, (uint64_t)CFSTR("_UIKBRT_SetDownTapInterval"));
    v12 = qword_1EDDA7E08;
    v13 = CFAbsoluteTimeGetCurrent() + *(double *)&sSystemUptimeFromAbsoluteTimeDiff;
    v14 = 0.04;
    if (!v11)
      v14 = *(double *)&v12;
    v15 = v10 + v14 + v13 - v9;
    touchQueue = self->_touchQueue;
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __37___UIKBRTRecognizer_makeTouchActive___block_invoke;
    v21[3] = &unk_1E16D8000;
    objc_copyWeak(&v22, &location);
    v21[4] = self;
    objc_msgSend(v5, "setTimerWithTimeInterval:onQueue:do:", touchQueue, v21, v15);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
  else
  {
    if (!v7)
    {
      v17 = 0;
      goto LABEL_16;
    }
    objc_msgSend(v5, "setCurrentTouchState:", 4);
  }
  v17 = 1;
LABEL_16:

  return v17;
}

- (void)makeTouchIgnored:(id)a3 force:(BOOL)a4 because:(id)a5
{
  _BOOL8 v5;
  objc_class *v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;

  v5 = a4;
  v8 = (objc_class *)MEMORY[0x1E0CB3940];
  v9 = a5;
  v10 = a3;
  v11 = (void *)objc_msgSend([v8 alloc], "initWithFormat:arguments:", v9, &v12);

  -[_UIKBRTRecognizer makeTouchIgnored:force:withMessage:](self, "makeTouchIgnored:force:withMessage:", v10, v5, v11);
}

- (void)makeTouchIgnored:(id)a3 force:(BOOL)a4 withMessage:(id)a5
{
  _BOOL4 v5;
  char v7;
  unsigned int v8;
  void *v9;
  void *v10;
  char v11;
  uint64_t v12;
  char v13;
  NSObject *ignoredTouchesQueue;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;

  v5 = a4;
  v16 = a3;
  v7 = -[NSMutableArray containsObject:](self->_ignoredTouches, "containsObject:", v16);
  objc_msgSend(v16, "invalidateTimer");
  v8 = objc_msgSend(v16, "currentTouchState");
  if (v8 > 5)
    goto LABEL_11;
  if (((1 << v8) & 0x31) == 0)
  {
    objc_msgSend(v16, "touchIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      -[_UIKBRTRecognizer notifyDelegateOfIgnoringTouch:](self, "notifyDelegateOfIgnoringTouch:", v16);
    goto LABEL_11;
  }
  objc_msgSend(v16, "touchIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
    goto LABEL_9;
  if (v5)
  {
    -[_UIKBRTRecognizer notifyDelegateOfIgnoringTouch:](self, "notifyDelegateOfIgnoringTouch:", v16);
    goto LABEL_9;
  }
  if (-[_UIKBRTRecognizer queryDelegateOfIgnoringTouch:forOtherTouch:](self, "queryDelegateOfIgnoringTouch:forOtherTouch:", v16, 0))
  {
LABEL_9:
    if (objc_msgSend(v16, "currentTouchState") == 5)
    {
      v11 = 0;
      --self->_numProlongedTouches;
LABEL_12:
      v12 = 6;
      goto LABEL_13;
    }
LABEL_11:
    v11 = 0;
    goto LABEL_12;
  }
  v12 = objc_msgSend(v16, "currentTouchState");
  v11 = 1;
LABEL_13:
  objc_msgSend(v16, "setCurrentTouchState:", v12);
  if ((_DWORD)v12 == 6)
    v13 = v7;
  else
    v13 = 1;
  if ((v11 & 1) == 0 && (v13 & 1) == 0)
  {
    ignoredTouchesQueue = self->_ignoredTouchesQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56___UIKBRTRecognizer_makeTouchIgnored_force_withMessage___block_invoke;
    block[3] = &unk_1E16B1B50;
    block[4] = self;
    v15 = v16;
    v18 = v15;
    dispatch_sync(ignoredTouchesQueue, block);
    -[_UIKBRTRecognizerTouchPointTrackingProtocol ignoreTouchInfo:](self->_touchTracker, "ignoreTouchInfo:", v15);

  }
}

- (void)makeTouchIgnored:(id)a3 force:(BOOL)a4
{
  -[_UIKBRTRecognizer makeTouchIgnored:force:withMessage:](self, "makeTouchIgnored:force:withMessage:", a3, a4, &stru_1E16EDF20);
}

- (_UIKBRTRecognizerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (_UIKBRTRecognizerDelegate *)a3;
}

- (_UIKBRTRecognizerTouchLoggingProtocol)touchLogger
{
  return self->_touchLogger;
}

- (void)setTouchLogger:(id)a3
{
  objc_storeStrong((id *)&self->_touchLogger, a3);
}

- (_UIKBRTRecognizerTouchPointTrackingProtocol)touchTracker
{
  return self->_touchTracker;
}

- (void)setTouchTracker:(id)a3
{
  objc_storeStrong((id *)&self->_touchTracker, a3);
}

- (NSMutableSet)definitiveRules
{
  return self->_definitiveRules;
}

- (NSMutableSet)averagingRules
{
  return self->_averagingRules;
}

- (BOOL)disableHomeRowReturn
{
  return self->_disableHomeRowReturn;
}

- (CGSize)clusterRestHaloSize
{
  double width;
  double height;
  CGSize result;

  width = self->_clusterRestHaloSize.width;
  height = self->_clusterRestHaloSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setClusterRestHaloSize:(CGSize)a3
{
  self->_clusterRestHaloSize = a3;
}

- (double)maximumNonRestMoveDistance
{
  return self->_maximumNonRestMoveDistance;
}

- (void)setMaximumNonRestMoveDistance:(double)a3
{
  self->_maximumNonRestMoveDistance = a3;
}

- (OS_dispatch_queue)touchQueue
{
  return self->_touchQueue;
}

- (void)setTouchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_touchQueue, a3);
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_delegateQueue, a3);
}

- (NSMutableArray)touchInfos
{
  return self->_touchInfos;
}

- (void)setTouchInfos:(id)a3
{
  objc_storeStrong((id *)&self->_touchInfos, a3);
}

- (NSMutableSet)activeTouches
{
  return self->_activeTouches;
}

- (void)setActiveTouches:(id)a3
{
  objc_storeStrong((id *)&self->_activeTouches, a3);
}

- (OS_dispatch_queue)activeTouchesQueue
{
  return self->_activeTouchesQueue;
}

- (void)setActiveTouchesQueue:(id)a3
{
  objc_storeStrong((id *)&self->_activeTouchesQueue, a3);
}

- (NSMutableArray)ignoredTouches
{
  return self->_ignoredTouches;
}

- (void)setIgnoredTouches:(id)a3
{
  objc_storeStrong((id *)&self->_ignoredTouches, a3);
}

- (OS_dispatch_queue)ignoredTouchesQueue
{
  return self->_ignoredTouchesQueue;
}

- (void)setIgnoredTouchesQueue:(id)a3
{
  objc_storeStrong((id *)&self->_ignoredTouchesQueue, a3);
}

- (unint64_t)numProlongedTouches
{
  return self->_numProlongedTouches;
}

- (void)setNumProlongedTouches:(unint64_t)a3
{
  self->_numProlongedTouches = a3;
}

- (double)touchIntervalAverage
{
  return self->_touchIntervalAverage;
}

- (void)setTouchIntervalAverage:(double)a3
{
  self->_touchIntervalAverage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ignoredTouchesQueue, 0);
  objc_storeStrong((id *)&self->_ignoredTouches, 0);
  objc_storeStrong((id *)&self->_activeTouchesQueue, 0);
  objc_storeStrong((id *)&self->_activeTouches, 0);
  objc_storeStrong((id *)&self->_touchInfos, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_touchQueue, 0);
  objc_storeStrong((id *)&self->_averagingRules, 0);
  objc_storeStrong((id *)&self->_definitiveRules, 0);
  objc_storeStrong((id *)&self->_touchTracker, 0);
  objc_storeStrong((id *)&self->_touchLogger, 0);
}

@end
