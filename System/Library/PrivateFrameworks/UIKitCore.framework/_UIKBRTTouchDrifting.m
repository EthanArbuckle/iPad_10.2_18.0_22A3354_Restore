@implementation _UIKBRTTouchDrifting

+ (BOOL)isEnabled
{
  BOOL result;

  result = _UIInternalPreferenceUsesDefault(&_UIInternalPreference__UIKBRT_DriftSupport, (uint64_t)CFSTR("_UIKBRT_DriftSupport"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
  if (byte_1EDDA8194)
    return 1;
  return result;
}

- (_UIKBRTTouchDrifting)init
{
  _UIKBRTTouchDrifting *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *touches;
  _UIKBRTTouchHistory *v5;
  _UIKBRTTouchHistory *fHistory;
  _UIKBRTTouchHistory *v7;
  _UIKBRTTouchHistory *jHistory;
  _UIKBRTTouchHistory *v9;
  _UIKBRTTouchHistory *otherHistory;
  _UIKBRTDecayingObject *v11;
  int v12;
  double v13;
  uint64_t v14;
  _UIKBRTDecayingObject *enableLatchObj;
  _UIKBRTDecayingOffset *v16;
  int v17;
  double v18;
  uint64_t v19;
  _UIKBRTDecayingOffset *leftHandDriftOffsetObj;
  _UIKBRTDecayingOffset *v21;
  int v22;
  double v23;
  uint64_t v24;
  _UIKBRTDecayingOffset *leftHandFixedOffsetObj;
  NSMutableSet *v26;
  NSMutableSet *leftDriftLockTouchIDs;
  _UIKBRTDecayingOffset *v28;
  uint64_t v29;
  _UIKBRTDecayingOffset *v30;
  int v31;
  double v32;
  uint64_t v33;
  _UIKBRTDecayingOffset *rightHandDriftOffsetObj;
  _UIKBRTDecayingOffset *v35;
  int v36;
  double v37;
  uint64_t v38;
  _UIKBRTDecayingOffset *rightHandFixedOffsetObj;
  NSMutableSet *v40;
  NSMutableSet *rightDriftLockTouchIDs;
  _UIKBRTDecayingOffset *v42;
  _QWORD v44[4];
  id v45;
  _QWORD v46[4];
  id v47;
  id location;
  objc_super v49;

  v49.receiver = self;
  v49.super_class = (Class)_UIKBRTTouchDrifting;
  v2 = -[_UIKBRTTouchDrifting init](&v49, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    touches = v2->_touches;
    v2->_touches = v3;

    v5 = -[_UIKBRTTouchHistory initWithIsLeftHand:]([_UIKBRTTouchHistory alloc], "initWithIsLeftHand:", 1);
    fHistory = v2->_fHistory;
    v2->_fHistory = v5;

    v7 = -[_UIKBRTTouchHistory initWithIsLeftHand:]([_UIKBRTTouchHistory alloc], "initWithIsLeftHand:", 0);
    jHistory = v2->_jHistory;
    v2->_jHistory = v7;

    v9 = objc_alloc_init(_UIKBRTTouchHistory);
    otherHistory = v2->_otherHistory;
    v2->_otherHistory = v9;

    v11 = [_UIKBRTDecayingObject alloc];
    v12 = _UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference__UIKBRT_DriftReturnTime, (uint64_t)CFSTR("_UIKBRT_DriftReturnTime"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
    v13 = *(double *)&qword_1EDDA81A8;
    if (v12)
      v13 = 2.0;
    v14 = -[_UIKBRTDecayingObject initWithTimeoutDuration:](v11, "initWithTimeoutDuration:", v13);
    enableLatchObj = v2->_enableLatchObj;
    v2->_enableLatchObj = (_UIKBRTDecayingObject *)v14;

    v16 = [_UIKBRTDecayingOffset alloc];
    v17 = _UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference__UIKBRT_DriftReturnTime, (uint64_t)CFSTR("_UIKBRT_DriftReturnTime"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
    v18 = *(double *)&qword_1EDDA81A8;
    if (v17)
      v18 = 2.0;
    v19 = -[_UIKBRTDecayingOffset initWithTimeoutDuration:limitMovement:](v16, "initWithTimeoutDuration:limitMovement:", 1, v18);
    leftHandDriftOffsetObj = v2->_leftHandDriftOffsetObj;
    v2->_leftHandDriftOffsetObj = (_UIKBRTDecayingOffset *)v19;

    v21 = [_UIKBRTDecayingOffset alloc];
    v22 = _UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference__UIKBRT_DriftReturnTime, (uint64_t)CFSTR("_UIKBRT_DriftReturnTime"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
    v23 = *(double *)&qword_1EDDA81A8;
    if (v22)
      v23 = 2.0;
    v24 = -[_UIKBRTDecayingOffset initWithTimeoutDuration:limitMovement:](v21, "initWithTimeoutDuration:limitMovement:", 0, v23);
    leftHandFixedOffsetObj = v2->_leftHandFixedOffsetObj;
    v2->_leftHandFixedOffsetObj = (_UIKBRTDecayingOffset *)v24;

    v26 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    leftDriftLockTouchIDs = v2->_leftDriftLockTouchIDs;
    v2->_leftDriftLockTouchIDs = v26;

    objc_initWeak(&location, v2);
    v28 = v2->_leftHandFixedOffsetObj;
    v29 = MEMORY[0x1E0C809B0];
    v46[0] = MEMORY[0x1E0C809B0];
    v46[1] = 3221225472;
    v46[2] = __28___UIKBRTTouchDrifting_init__block_invoke;
    v46[3] = &unk_1E16B3F40;
    objc_copyWeak(&v47, &location);
    -[_UIKBRTDecayingObject onResetDo:](v28, "onResetDo:", v46);
    v30 = [_UIKBRTDecayingOffset alloc];
    v31 = _UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference__UIKBRT_DriftReturnTime, (uint64_t)CFSTR("_UIKBRT_DriftReturnTime"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
    v32 = *(double *)&qword_1EDDA81A8;
    if (v31)
      v32 = 2.0;
    v33 = -[_UIKBRTDecayingOffset initWithTimeoutDuration:limitMovement:](v30, "initWithTimeoutDuration:limitMovement:", 1, v32);
    rightHandDriftOffsetObj = v2->_rightHandDriftOffsetObj;
    v2->_rightHandDriftOffsetObj = (_UIKBRTDecayingOffset *)v33;

    v35 = [_UIKBRTDecayingOffset alloc];
    v36 = _UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference__UIKBRT_DriftReturnTime, (uint64_t)CFSTR("_UIKBRT_DriftReturnTime"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
    v37 = *(double *)&qword_1EDDA81A8;
    if (v36)
      v37 = 2.0;
    v38 = -[_UIKBRTDecayingOffset initWithTimeoutDuration:limitMovement:](v35, "initWithTimeoutDuration:limitMovement:", 0, v37);
    rightHandFixedOffsetObj = v2->_rightHandFixedOffsetObj;
    v2->_rightHandFixedOffsetObj = (_UIKBRTDecayingOffset *)v38;

    v40 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    rightDriftLockTouchIDs = v2->_rightDriftLockTouchIDs;
    v2->_rightDriftLockTouchIDs = v40;

    v42 = v2->_rightHandFixedOffsetObj;
    v44[0] = v29;
    v44[1] = 3221225472;
    v44[2] = __28___UIKBRTTouchDrifting_init__block_invoke_2;
    v44[3] = &unk_1E16B3F40;
    objc_copyWeak(&v45, &location);
    -[_UIKBRTDecayingObject onResetDo:](v42, "onResetDo:", v44);
    objc_destroyWeak(&v45);
    objc_destroyWeak(&v47);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (_UIKBRTTouchDrifting)initWithParentView:(id)a3
{
  id v4;
  _UIKBRTTouchDrifting *v5;
  _UIKBRTTouchDrifting *v6;

  v4 = a3;
  v5 = -[_UIKBRTTouchDrifting init](self, "init");
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_feedbackParentView, v4);

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[_UIKBRTTouchDrifting _resetFeedback](self, "_resetFeedback");
  v3.receiver = self;
  v3.super_class = (Class)_UIKBRTTouchDrifting;
  -[_UIKBRTTouchDrifting dealloc](&v3, sel_dealloc);
}

- (void)_resetFeedback
{
  NSTimer *feedbackTimer;
  UIView *leftDriftFeedbackView;
  UIView *rightDriftFeedbackView;
  UIView *touchHistoryFeedbackView;
  NSMapTable *touchHistoryViewMap;

  -[NSTimer invalidate](self->_feedbackTimer, "invalidate");
  feedbackTimer = self->_feedbackTimer;
  self->_feedbackTimer = 0;

  -[UIView removeFromSuperview](self->_leftDriftFeedbackView, "removeFromSuperview");
  leftDriftFeedbackView = self->_leftDriftFeedbackView;
  self->_leftDriftFeedbackView = 0;

  -[UIView removeFromSuperview](self->_rightDriftFeedbackView, "removeFromSuperview");
  rightDriftFeedbackView = self->_rightDriftFeedbackView;
  self->_rightDriftFeedbackView = 0;

  -[UIView removeFromSuperview](self->_touchHistoryFeedbackView, "removeFromSuperview");
  touchHistoryFeedbackView = self->_touchHistoryFeedbackView;
  self->_touchHistoryFeedbackView = 0;

  touchHistoryViewMap = self->_touchHistoryViewMap;
  self->_touchHistoryViewMap = 0;

}

- (void)reset
{
  NSArray *indexSearchOrder;
  int v4;
  double v5;
  int v6;
  double v7;
  int v8;
  double v9;
  int v10;
  double v11;
  int v12;
  double v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)_UIKBRTTouchDrifting;
  -[_UIKBRTKeyboardTouchObserver reset](&v14, sel_reset);
  -[_UIKBRTTouchDrifting _resetFeedback](self, "_resetFeedback");
  indexSearchOrder = self->_indexSearchOrder;
  self->_indexSearchOrder = 0;

  self->_supportsDrifting = 0;
  -[_UIKBRTTouchHistory reset](self->_fHistory, "reset");
  -[_UIKBRTTouchHistory reset](self->_jHistory, "reset");
  -[_UIKBRTDecayingObject reset](self->_enableLatchObj, "reset");
  v4 = _UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference__UIKBRT_DriftReturnTime, (uint64_t)CFSTR("_UIKBRT_DriftReturnTime"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
  v5 = *(double *)&qword_1EDDA81A8;
  if (v4)
    v5 = 2.0;
  -[_UIKBRTDecayingObject setTimeoutDuration:](self->_enableLatchObj, "setTimeoutDuration:", v5);
  -[_UIKBRTDecayingOffset reset](self->_leftHandDriftOffsetObj, "reset");
  v6 = _UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference__UIKBRT_DriftReturnTime, (uint64_t)CFSTR("_UIKBRT_DriftReturnTime"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
  v7 = *(double *)&qword_1EDDA81A8;
  if (v6)
    v7 = 2.0;
  -[_UIKBRTDecayingObject setTimeoutDuration:](self->_leftHandDriftOffsetObj, "setTimeoutDuration:", v7);
  -[_UIKBRTDecayingOffset reset](self->_leftHandFixedOffsetObj, "reset");
  v8 = _UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference__UIKBRT_DriftReturnTime, (uint64_t)CFSTR("_UIKBRT_DriftReturnTime"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
  v9 = *(double *)&qword_1EDDA81A8;
  if (v8)
    v9 = 2.0;
  -[_UIKBRTDecayingObject setTimeoutDuration:](self->_leftHandFixedOffsetObj, "setTimeoutDuration:", v9);
  -[_UIKBRTDecayingOffset reset](self->_rightHandDriftOffsetObj, "reset");
  v10 = _UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference__UIKBRT_DriftReturnTime, (uint64_t)CFSTR("_UIKBRT_DriftReturnTime"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
  v11 = *(double *)&qword_1EDDA81A8;
  if (v10)
    v11 = 2.0;
  -[_UIKBRTDecayingObject setTimeoutDuration:](self->_rightHandDriftOffsetObj, "setTimeoutDuration:", v11);
  -[_UIKBRTDecayingOffset reset](self->_rightHandFixedOffsetObj, "reset");
  v12 = _UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference__UIKBRT_DriftReturnTime, (uint64_t)CFSTR("_UIKBRT_DriftReturnTime"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
  v13 = *(double *)&qword_1EDDA81A8;
  if (v12)
    v13 = 2.0;
  -[_UIKBRTDecayingObject setTimeoutDuration:](self->_rightHandFixedOffsetObj, "setTimeoutDuration:", v13);
  -[NSMutableSet removeAllObjects](self->_leftDriftLockTouchIDs, "removeAllObjects");
  -[NSMutableSet removeAllObjects](self->_rightDriftLockTouchIDs, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_touches, "removeAllObjects");
}

- (void)updateWithFCenter:(CGPoint)a3 jCenter:(CGPoint)a4 keySize:(CGSize)a5 rowOffsets:(id)a6 homeRowOffsetIndex:(int)a7
{
  uint64_t v7;
  double height;
  double width;
  double y;
  double x;
  double v12;
  double v13;
  id v15;
  NSArray *indexSearchOrder;
  uint64_t v17;
  id v18;
  uint64_t v19;
  void *v20;
  BOOL v21;
  int v22;
  int v23;
  int v24;
  void *v25;
  NSArray *v26;
  NSArray *v27;
  objc_super v28;

  v7 = *(_QWORD *)&a7;
  height = a5.height;
  width = a5.width;
  y = a4.y;
  x = a4.x;
  v12 = a3.y;
  v13 = a3.x;
  v15 = a6;
  v28.receiver = self;
  v28.super_class = (Class)_UIKBRTTouchDrifting;
  -[_UIKBRTKeyboardTouchObserver updateWithFCenter:jCenter:keySize:rowOffsets:homeRowOffsetIndex:](&v28, sel_updateWithFCenter_jCenter_keySize_rowOffsets_homeRowOffsetIndex_, v15, v7, v13, v12, x, y, width, height);
  -[_UIKBRTTouchDrifting _resetFeedback](self, "_resetFeedback");
  indexSearchOrder = self->_indexSearchOrder;
  self->_indexSearchOrder = 0;

  if ((int)v7 < 1)
  {
    self->_supportsDrifting = 0;
  }
  else
  {
    v17 = objc_msgSend(v15, "count");
    self->_supportsDrifting = v17 - 1 > (unint64_t)v7;
    if (v17 - 1 > (unint64_t)v7)
    {
      v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v19 = (v7 + 1);
      do
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addObject:", v20);

        if ((_DWORD)v19 == 1)
          break;
        v21 = (int)v19 <= (int)v7;
        v19 = (v19 - 1);
      }
      while (!v21);
      v22 = objc_msgSend(v15, "count");
      v23 = v7 + 3;
      if (v22 < (int)v7 + 3)
        v23 = v22;
      if ((int)v7 + 2 <= v23)
      {
        v24 = v23 - 1;
        do
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v7 + 2));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "addObject:", v25);

          LODWORD(v7) = v7 + 1;
        }
        while (v24 != (_DWORD)v7);
      }
      v26 = (NSArray *)objc_msgSend(v18, "copy");
      v27 = self->_indexSearchOrder;
      self->_indexSearchOrder = v26;

      self->_touchError.left = -(width * 0.75);
      self->_touchError.right = width * 0.75;
      self->_touchError.up = height / -3.0;
      self->_touchError.down = height * 0.5;

    }
  }
  -[_UIKBRTTouchDrifting _updateDriftWithTouchInfo:](self, "_updateDriftWithTouchInfo:", 0);

}

- (CGPoint)leftHandDriftOffset
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGPoint result;

  v2 = *MEMORY[0x1E0C9D538];
  v3 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  -[_UIKBRTDecayingOffset offset](self->_leftHandFixedOffsetObj, "offset");
  v5 = v2 + v4;
  v7 = v3 + v6;
  result.y = v7;
  result.x = v5;
  return result;
}

- (CGPoint)rightHandDriftOffset
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGPoint result;

  v2 = *MEMORY[0x1E0C9D538];
  v3 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  -[_UIKBRTDecayingOffset offset](self->_rightHandFixedOffsetObj, "offset");
  v5 = v2 + v4;
  v7 = v3 + v6;
  result.y = v7;
  result.x = v5;
  return result;
}

- (void)addTouchLocation:(CGPoint)a3 withRadius:(double)a4 withTouchTime:(double)a5 withIdentifier:(id)a6
{
  double y;
  double x;
  void *v11;
  _UIKBRTTouchHistoryInfo *v12;
  unint64_t v13;
  _UIKBRTTouchHistoryInfo *v14;
  uint64_t v15;
  int *v16;
  _BOOL4 v17;
  uint64_t v18;
  void *v19;
  id v20;

  y = a3.y;
  x = a3.x;
  v20 = a6;
  -[NSMutableDictionary objectForKey:](self->_touches, "objectForKey:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIKBRTTouchDrifting.m"), 262, CFSTR("Touch already in dictionary!"));

  }
  -[_UIKBRTTouchDrifting _updateHistory](self, "_updateHistory");
  v12 = objc_alloc_init(_UIKBRTTouchHistoryInfo);
  -[_UIKBRTTouchHistoryInfo setTouchIdentifier:](v12, "setTouchIdentifier:", v20);
  -[_UIKBRTTouchHistoryInfo setTouchTime:](v12, "setTouchTime:", a5);
  -[_UIKBRTTouchHistoryInfo setActualLocation:](v12, "setActualLocation:", x, y);
  -[_UIKBRTTouchHistoryInfo setIgnoreTouch:](v12, "setIgnoreTouch:", 1);
  v13 = -[_UIKBRTTouchDriftingDelegate _uikbrtTouchDrifting:fingerIDFortouchIdentifier:](self->_delegate, "_uikbrtTouchDrifting:fingerIDFortouchIdentifier:", self, v20);
  if (v13 <= 0xC)
  {
    if (((1 << v13) & 0xFA) != 0)
    {
      -[_UIKBRTTouchHistoryInfo setIgnoreForDrift:](v12, "setIgnoreForDrift:", 0);
      v14 = v12;
      v15 = 1;
      goto LABEL_8;
    }
    if (((1 << v13) & 0x1F04) != 0)
    {
      -[_UIKBRTTouchHistoryInfo setIgnoreForDrift:](v12, "setIgnoreForDrift:", 0);
      v14 = v12;
      v15 = 0;
LABEL_8:
      -[_UIKBRTTouchHistoryInfo setIsLeftHand:](v14, "setIsLeftHand:", v15);
      goto LABEL_9;
    }
    -[_UIKBRTTouchHistoryInfo setIgnoreForDrift:](v12, "setIgnoreForDrift:", 1);
  }
LABEL_9:
  -[NSMutableDictionary setObject:forKey:](self->_touches, "setObject:forKey:", v12, v20);
  if (-[_UIKBRTTouchHistoryInfo ignoreForDrift](v12, "ignoreForDrift"))
  {
    v16 = &OBJC_IVAR____UIKBRTTouchDrifting__otherHistory;
  }
  else
  {
    v17 = -[_UIKBRTTouchHistoryInfo isLeftHand](v12, "isLeftHand");
    v18 = 2;
    if (v17)
      v18 = 1;
    v16 = &OBJC_IVAR____UIKBRTTouchDrifting__touches[v18];
  }
  objc_msgSend(*(id *)((char *)&self->super.super.isa + *v16), "addInfo:", v12);
  -[_UIKBRTTouchDrifting _updateDriftWithTouchInfo:](self, "_updateDriftWithTouchInfo:", v12);

}

- (void)updateTouchWithIdentifier:(id)a3 withTouchTime:(double)a4 resultingError:(CGPoint)a5 rowOffsetFromHomeRow:(int64_t)a6
{
  double y;
  double x;
  void *v11;
  unint64_t v12;
  void *v13;
  uint64_t v14;
  _UIKBRTTouchHistory **p_jHistory;
  _UIKBRTTouchHistory **p_fHistory;
  id v17;

  y = a5.y;
  x = a5.x;
  v17 = a3;
  -[NSMutableDictionary objectForKey:](self->_touches, "objectForKey:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[_UIKBRTTouchDrifting _updateHistory](self, "_updateHistory");
    objc_msgSend(v11, "setErrorVector:", x, y);
    objc_msgSend(v11, "setTouchTime:", a4);
    objc_msgSend(v11, "setIgnoreTouch:", (unint64_t)(a6 - 2) < 0xFFFFFFFFFFFFFFFDLL);
    v12 = -[_UIKBRTTouchDriftingDelegate _uikbrtTouchDrifting:fingerIDFortouchIdentifier:](self->_delegate, "_uikbrtTouchDrifting:fingerIDFortouchIdentifier:", self, v17);
    if (v12 <= 0xC)
    {
      if (((1 << v12) & 0xFA) != 0)
      {
        objc_msgSend(v11, "setIgnoreForDrift:", 0);
        v13 = v11;
        v14 = 1;
      }
      else
      {
        if (((1 << v12) & 0x1F04) == 0)
        {
          objc_msgSend(v11, "setIgnoreForDrift:", 1);
          goto LABEL_8;
        }
        objc_msgSend(v11, "setIgnoreForDrift:", 0);
        v13 = v11;
        v14 = 0;
      }
      objc_msgSend(v13, "setIsLeftHand:", v14);
    }
LABEL_8:
    if (objc_msgSend(v11, "ignoreForDrift")
      && (p_jHistory = &self->_otherHistory,
          !-[_UIKBRTTouchHistory containsInfo:](self->_otherHistory, "containsInfo:", v11)))
    {
      p_fHistory = &self->_fHistory;
      if (-[_UIKBRTTouchHistory containsInfo:](self->_fHistory, "containsInfo:", v11))
        goto LABEL_20;
    }
    else
    {
      if (-[_UIKBRTTouchHistory containsInfo:](self->_otherHistory, "containsInfo:", v11))
        -[_UIKBRTTouchHistory removeInfo:](self->_otherHistory, "removeInfo:", v11);
      if (!objc_msgSend(v11, "isLeftHand")
        || (p_jHistory = &self->_fHistory, -[_UIKBRTTouchHistory containsInfo:](self->_fHistory, "containsInfo:", v11)))
      {
        if ((objc_msgSend(v11, "isLeftHand") & 1) != 0)
          goto LABEL_22;
        p_jHistory = &self->_jHistory;
        if (-[_UIKBRTTouchHistory containsInfo:](self->_jHistory, "containsInfo:", v11))
          goto LABEL_22;
        p_fHistory = &self->_fHistory;
        if (!-[_UIKBRTTouchHistory containsInfo:](self->_fHistory, "containsInfo:", v11))
        {
LABEL_21:
          -[_UIKBRTTouchHistory addInfo:](*p_jHistory, "addInfo:", v11);
LABEL_22:
          -[_UIKBRTTouchDrifting _updateDriftWithTouchInfo:](self, "_updateDriftWithTouchInfo:", v11);
          goto LABEL_23;
        }
LABEL_20:
        -[_UIKBRTTouchHistory removeInfo:](*p_fHistory, "removeInfo:", v11);
        goto LABEL_21;
      }
    }
    p_fHistory = &self->_jHistory;
    if (!-[_UIKBRTTouchHistory containsInfo:](self->_jHistory, "containsInfo:", v11))
      goto LABEL_21;
    goto LABEL_20;
  }
LABEL_23:

}

- (void)ignoreTouchWithIdentifier:(id)a3 withTouchTime:(double)a4
{
  void *v6;
  char v7;
  _UIKBRTTouchHistory **p_jHistory;
  int *v9;
  _UIKBRTTouchHistory **p_fHistory;
  int *v11;
  int *v12;
  _UIKBRTTouchHistory *v13;
  id v14;
  id v15;
  id v16;

  v16 = a3;
  -[NSMutableDictionary objectForKey:](self->_touches, "objectForKey:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[_UIKBRTTouchDrifting _updateHistory](self, "_updateHistory");
    v7 = objc_msgSend(v6, "ignoreTouch");
    objc_msgSend(v6, "setIgnoreTouch:", 1);
    objc_msgSend(v6, "setTouchTime:", a4);
    if ((v7 & 1) == 0)
    {
      if (((objc_msgSend(v6, "ignoreForDrift") & 1) != 0 || (objc_msgSend(v6, "ignoreTouch") & 1) != 0)
        && (p_jHistory = &self->_otherHistory,
            !-[_UIKBRTTouchHistory containsInfo:](self->_otherHistory, "containsInfo:", v6)))
      {
        v9 = &OBJC_IVAR____UIKBRTTouchDrifting__leftDriftLockTouchIDs;
        p_fHistory = &self->_fHistory;
        if (!-[_UIKBRTTouchHistory containsInfo:](self->_fHistory, "containsInfo:", v6))
          goto LABEL_16;
      }
      else
      {
        if (-[_UIKBRTTouchHistory containsInfo:](self->_otherHistory, "containsInfo:", v6))
          -[_UIKBRTTouchHistory removeInfo:](self->_otherHistory, "removeInfo:", v6);
        if (objc_msgSend(v6, "isLeftHand"))
        {
          p_jHistory = &self->_fHistory;
          if (!-[_UIKBRTTouchHistory containsInfo:](self->_fHistory, "containsInfo:", v6))
          {
LABEL_16:
            v9 = &OBJC_IVAR____UIKBRTTouchDrifting__rightDriftLockTouchIDs;
            p_fHistory = &self->_jHistory;
            if (-[_UIKBRTTouchHistory containsInfo:](self->_jHistory, "containsInfo:", v6))
            {
              v11 = &OBJC_IVAR____UIKBRTTouchDrifting__rightHandDriftOffsetObj;
              v12 = &OBJC_IVAR____UIKBRTTouchDrifting__rightHandFixedOffsetObj;
              goto LABEL_18;
            }
            goto LABEL_21;
          }
        }
        if ((objc_msgSend(v6, "isLeftHand") & 1) != 0)
          goto LABEL_22;
        p_jHistory = &self->_jHistory;
        if (-[_UIKBRTTouchHistory containsInfo:](self->_jHistory, "containsInfo:", v6))
          goto LABEL_22;
        v9 = &OBJC_IVAR____UIKBRTTouchDrifting__leftDriftLockTouchIDs;
        p_fHistory = &self->_fHistory;
        if (!-[_UIKBRTTouchHistory containsInfo:](self->_fHistory, "containsInfo:", v6))
        {
LABEL_21:
          -[_UIKBRTTouchHistory addInfo:](*p_jHistory, "addInfo:", v6);
LABEL_22:
          v15 = 0;
          v14 = 0;
          v13 = 0;
          goto LABEL_23;
        }
      }
      v11 = &OBJC_IVAR____UIKBRTTouchDrifting__leftHandDriftOffsetObj;
      v12 = &OBJC_IVAR____UIKBRTTouchDrifting__leftHandFixedOffsetObj;
LABEL_18:
      v13 = *p_fHistory;
      v14 = *(id *)((char *)&self->super.super.isa + *v12);
      v15 = *(id *)((char *)&self->super.super.isa + *v11);
      -[_UIKBRTTouchHistory removeInfo:](*p_fHistory, "removeInfo:", v6);
      objc_msgSend(*(id *)((char *)&self->super.super.isa + *v9), "removeObject:", v16);
      -[_UIKBRTTouchHistory addInfo:](*p_jHistory, "addInfo:", v6);
      if (v13 && !-[_UIKBRTTouchHistory hasHistory](v13, "hasHistory"))
      {
        objc_msgSend(v14, "reset");
        objc_msgSend(v15, "reset");
LABEL_24:
        -[_UIKBRTTouchDrifting _updateDriftWithTouchInfo:](self, "_updateDriftWithTouchInfo:", v6);

        goto LABEL_25;
      }
LABEL_23:
      -[_UIKBRTTouchHistory lastTime](v13, "lastTime");
      objc_msgSend(v14, "resetDecayTo:");
      -[_UIKBRTTouchHistory lastTime](v13, "lastTime");
      objc_msgSend(v15, "resetDecayTo:");
      goto LABEL_24;
    }
  }
LABEL_25:

}

- (void)moveTouchWithIdentifier:(id)a3 toLocation:(CGPoint)a4 withRadius:(double)a5 atTouchTime:(double)a6
{
  double y;
  double x;
  void *v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  _UIKBRTTouchHistory **p_jHistory;
  int *v15;
  _UIKBRTTouchHistory **p_fHistory;
  id v17;

  y = a4.y;
  x = a4.x;
  v17 = a3;
  -[NSMutableDictionary objectForKey:](self->_touches, "objectForKey:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v10, "setTouchTime:", CFAbsoluteTimeGetCurrent() + *(double *)&sSystemUptimeFromAbsoluteTimeDiff);
    objc_msgSend(v10, "setActualLocation:", x, y);
    objc_msgSend(v10, "setTouchTime:", a6);
    v11 = -[_UIKBRTTouchDriftingDelegate _uikbrtTouchDrifting:fingerIDFortouchIdentifier:](self->_delegate, "_uikbrtTouchDrifting:fingerIDFortouchIdentifier:", self, v17);
    if (v11 <= 0xC)
    {
      if (((1 << v11) & 0xFA) != 0)
      {
        objc_msgSend(v10, "setIgnoreForDrift:", 0);
        v12 = v10;
        v13 = 1;
      }
      else
      {
        if (((1 << v11) & 0x1F04) == 0)
        {
          objc_msgSend(v10, "setIgnoreForDrift:", 1);
          goto LABEL_8;
        }
        objc_msgSend(v10, "setIgnoreForDrift:", 0);
        v12 = v10;
        v13 = 0;
      }
      objc_msgSend(v12, "setIsLeftHand:", v13);
    }
LABEL_8:
    if (objc_msgSend(v10, "ignoreForDrift")
      && (p_jHistory = &self->_otherHistory,
          !-[_UIKBRTTouchHistory containsInfo:](self->_otherHistory, "containsInfo:", v10)))
    {
      v15 = &OBJC_IVAR____UIKBRTTouchDrifting__leftDriftLockTouchIDs;
      p_fHistory = &self->_fHistory;
      if (-[_UIKBRTTouchHistory containsInfo:](self->_fHistory, "containsInfo:", v10))
        goto LABEL_20;
    }
    else
    {
      if (-[_UIKBRTTouchHistory containsInfo:](self->_otherHistory, "containsInfo:", v10))
        -[_UIKBRTTouchHistory removeInfo:](self->_otherHistory, "removeInfo:", v10);
      if (!objc_msgSend(v10, "isLeftHand")
        || (p_jHistory = &self->_fHistory, -[_UIKBRTTouchHistory containsInfo:](self->_fHistory, "containsInfo:", v10)))
      {
        if ((objc_msgSend(v10, "isLeftHand") & 1) != 0)
          goto LABEL_22;
        p_jHistory = &self->_jHistory;
        if (-[_UIKBRTTouchHistory containsInfo:](self->_jHistory, "containsInfo:", v10))
          goto LABEL_22;
        v15 = &OBJC_IVAR____UIKBRTTouchDrifting__leftDriftLockTouchIDs;
        p_fHistory = &self->_fHistory;
        if (!-[_UIKBRTTouchHistory containsInfo:](self->_fHistory, "containsInfo:", v10))
        {
LABEL_21:
          -[_UIKBRTTouchHistory addInfo:](*p_jHistory, "addInfo:", v10);
LABEL_22:
          -[_UIKBRTTouchDrifting _updateDriftWithTouchInfo:](self, "_updateDriftWithTouchInfo:", v10);
          goto LABEL_23;
        }
LABEL_20:
        -[_UIKBRTTouchHistory removeInfo:](*p_fHistory, "removeInfo:", v10);
        objc_msgSend(*(id *)((char *)&self->super.super.isa + *v15), "removeObject:", v17);
        goto LABEL_21;
      }
    }
    v15 = &OBJC_IVAR____UIKBRTTouchDrifting__rightDriftLockTouchIDs;
    p_fHistory = &self->_jHistory;
    if (!-[_UIKBRTTouchHistory containsInfo:](self->_jHistory, "containsInfo:", v10))
      goto LABEL_21;
    goto LABEL_20;
  }
LABEL_23:

}

- (void)removeTouchWithIdentifier:(id)a3 touchCancelled:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  _UIKBRTTouchHistory **p_fHistory;
  _BOOL4 v9;
  _BOOL4 v10;
  int *v11;
  int *v12;
  int *v13;
  int *v14;
  id v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;
  _UIKBRTTouchHistory *v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  id v24;

  v4 = a4;
  v24 = a3;
  -[NSMutableDictionary objectForKey:](self->_touches, "objectForKey:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "setIsActive:", 0);
    p_fHistory = &self->_fHistory;
    v9 = -[_UIKBRTTouchHistory containsInfo:](self->_fHistory, "containsInfo:", v7);
    v10 = -[_UIKBRTTouchHistory containsInfo:](self->_jHistory, "containsInfo:", v7);
    if (v4)
    {
      if (v9)
      {
        v11 = &OBJC_IVAR____UIKBRTTouchDrifting__leftHandDriftOffsetObj;
        v12 = &OBJC_IVAR____UIKBRTTouchDrifting__leftDriftRemovingItems;
        v13 = &OBJC_IVAR____UIKBRTTouchDrifting__leftDriftLockTouchIDs;
        v14 = &OBJC_IVAR____UIKBRTTouchDrifting__leftHandFixedOffsetObj;
      }
      else
      {
        if (!v10)
        {
          -[_UIKBRTTouchHistory removeInfo:](self->_otherHistory, "removeInfo:", v7);
          v21 = 0;
          v20 = 0;
          v19 = 0;
          goto LABEL_16;
        }
        v11 = &OBJC_IVAR____UIKBRTTouchDrifting__rightHandDriftOffsetObj;
        v12 = &OBJC_IVAR____UIKBRTTouchDrifting__rightDriftRemovingItems;
        v13 = &OBJC_IVAR____UIKBRTTouchDrifting__rightDriftLockTouchIDs;
        v14 = &OBJC_IVAR____UIKBRTTouchDrifting__rightHandFixedOffsetObj;
        p_fHistory = &self->_jHistory;
      }
      v19 = *p_fHistory;
      v20 = *(id *)((char *)&self->super.super.isa + *v14);
      v21 = *(id *)((char *)&self->super.super.isa + *v11);
      -[_UIKBRTTouchHistory removeInfo:](*p_fHistory, "removeInfo:", v7);
      v22 = *v13;
      objc_msgSend(*(id *)((char *)&self->super.super.isa + v22), "removeObject:", v24);
      *((_BYTE *)&self->super.super.isa + *v12) = objc_msgSend(*(id *)((char *)&self->super.super.isa + v22), "count") != 0;
      if (v19 && !-[_UIKBRTTouchHistory hasHistory](v19, "hasHistory"))
      {
        objc_msgSend(v20, "reset");
        objc_msgSend(v21, "reset");
LABEL_17:

        v15 = v24;
        goto LABEL_18;
      }
LABEL_16:
      -[_UIKBRTTouchHistory lastTime](v19, "lastTime");
      objc_msgSend(v20, "resetDecayTo:");
      -[_UIKBRTTouchHistory lastTime](v19, "lastTime");
      objc_msgSend(v21, "resetDecayTo:");
      goto LABEL_17;
    }
    v15 = v24;
    if (v9)
    {
      -[NSMutableSet removeObject:](self->_leftDriftLockTouchIDs, "removeObject:", v24);
      v16 = -[NSMutableSet count](self->_leftDriftLockTouchIDs, "count");
      v15 = v24;
      v17 = v16 != 0;
      v18 = 97;
    }
    else
    {
      if (!v10)
      {
LABEL_18:
        -[NSMutableDictionary removeObjectForKey:](self->_touches, "removeObjectForKey:", v15);
        -[_UIKBRTTouchDrifting _updateHistory](self, "_updateHistory");
        -[_UIKBRTTouchDrifting _updateDriftWithTouchInfo:](self, "_updateDriftWithTouchInfo:", 0);
        goto LABEL_19;
      }
      -[NSMutableSet removeObject:](self->_rightDriftLockTouchIDs, "removeObject:", v24);
      v23 = -[NSMutableSet count](self->_rightDriftLockTouchIDs, "count");
      v15 = v24;
      v17 = v23 != 0;
      v18 = 98;
    }
    *((_BYTE *)&self->super.super.isa + v18) = v17;
    goto LABEL_18;
  }
LABEL_19:

}

- (void)_updateHistory
{
  -[_UIKBRTTouchHistory decayHistory](self->_fHistory, "decayHistory");
  -[_UIKBRTTouchHistory decayHistory](self->_jHistory, "decayHistory");
}

- (id)_touchDictWithFingerIds:(id)a3
{
  id v4;
  id v5;
  uint64_t i;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id obj;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v4;
  v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v21)
  {
    v20 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v29 != v20)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        -[_UIKBRTTouchDriftingDelegate _uikbrtTouchDrifting:touchIdentifiersForFingerID:](self->_delegate, "_uikbrtTouchDrifting:touchIdentifiersForFingerID:", self, (int)objc_msgSend(v7, "intValue"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "count"))
        {
          v22 = v8;
          v23 = i;
          v26 = 0u;
          v27 = 0u;
          v24 = 0u;
          v25 = 0u;
          v9 = v8;
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          if (v10)
          {
            v11 = v10;
            v12 = *(_QWORD *)v25;
            do
            {
              for (j = 0; j != v11; ++j)
              {
                if (*(_QWORD *)v25 != v12)
                  objc_enumerationMutation(v9);
                -[NSMutableDictionary objectForKey:](self->_touches, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * j));
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                if (v14)
                {
                  objc_msgSend(v5, "objectForKey:", v7);
                  v15 = (void *)objc_claimAutoreleasedReturnValue();

                  if (!v15)
                  {
                    v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                    objc_msgSend(v5, "setObject:forKey:", v16, v7);

                  }
                  objc_msgSend(v5, "objectForKey:", v7);
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v17, "addObject:", v14);

                }
              }
              v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
            }
            while (v11);
          }

          v8 = v22;
          i = v23;
        }

      }
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v21);
  }

  return v5;
}

- (void)_updateDriftWithTouchInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t, void *, _BYTE *);
  void *v18;
  id v19;
  uint64_t *v20;
  _QWORD v21[4];
  id v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  double *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  _QWORD v36[5];
  _QWORD v37[5];

  v4 = a3;
  if (self->_supportsDrifting)
  {
    -[_UIKBRTTouchDrifting _touchDictWithFingerIds:](self, "_touchDictWithFingerIds:", &unk_1E1A94268);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIKBRTTouchDrifting _touchDictWithFingerIds:](self, "_touchDictWithFingerIds:", &unk_1E1A94280);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[_UIKBRTDecayingObject isActive](self->_enableLatchObj, "isActive");
    -[_UIKBRTDecayingObject startOrUpdateDecay](self->_enableLatchObj, "startOrUpdateDecay");
    if (v4)
    {
      if (-[_UIKBRTDecayingObject isActive](self->_enableLatchObj, "isActive"))
      {
        objc_msgSend(v5, "keysOfEntriesPassingTest:", &__block_literal_global_372);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "keysOfEntriesPassingTest:", &__block_literal_global_35_1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setByAddingObjectsFromSet:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v10, "count"))
          -[_UIKBRTDecayingObject resetDecayTo:](self->_enableLatchObj, "resetDecayTo:", CFAbsoluteTimeGetCurrent() + *(double *)&sSystemUptimeFromAbsoluteTimeDiff);
        else
          -[_UIKBRTDecayingObject startOrUpdateDecay](self->_enableLatchObj, "startOrUpdateDecay");

      }
      else if ((unint64_t)objc_msgSend(v5, "count") >= 2 && (unint64_t)objc_msgSend(v6, "count") >= 2)
      {
        v11 = objc_msgSend(v5, "count");
        if ((unint64_t)(objc_msgSend(v6, "count") + v11) >= 5)
        {
          v30 = 0;
          v31 = (double *)&v30;
          v32 = 0x2020000000;
          v12 = MEMORY[0x1E0C809B0];
          v33 = 0;
          v37[0] = MEMORY[0x1E0C809B0];
          v37[1] = 3221225472;
          v37[2] = __50___UIKBRTTouchDrifting__updateDriftWithTouchInfo___block_invoke;
          v37[3] = &unk_1E16D81A8;
          v37[4] = &v30;
          objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v37);
          v36[0] = v12;
          v36[1] = 3221225472;
          v36[2] = __50___UIKBRTTouchDrifting__updateDriftWithTouchInfo___block_invoke_3;
          v36[3] = &unk_1E16D81A8;
          v36[4] = &v30;
          objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v36);
          -[_UIKBRTDecayingObject resetDecayTo:](self->_enableLatchObj, "resetDecayTo:", v31[3]);
          _Block_object_dispose(&v30, 8);
        }
      }
    }
    if (-[_UIKBRTDecayingObject isActive](self->_enableLatchObj, "isActive"))
    {
      v30 = 0;
      v31 = (double *)&v30;
      v32 = 0x3032000000;
      v33 = __Block_byref_object_copy__137;
      v34 = __Block_byref_object_dispose__137;
      v35 = 0;
      v24 = 0;
      v25 = &v24;
      v26 = 0x3032000000;
      v27 = __Block_byref_object_copy__137;
      v28 = __Block_byref_object_dispose__137;
      v29 = 0;
      v13 = MEMORY[0x1E0C809B0];
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __50___UIKBRTTouchDrifting__updateDriftWithTouchInfo___block_invoke_37;
      v21[3] = &unk_1E16D8238;
      v14 = v4;
      v22 = v14;
      v23 = &v30;
      objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v21);
      v15 = v13;
      v16 = 3221225472;
      v17 = __50___UIKBRTTouchDrifting__updateDriftWithTouchInfo___block_invoke_3_39;
      v18 = &unk_1E16D8238;
      v19 = v14;
      v20 = &v24;
      objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", &v15);
      -[_UIKBRTTouchDrifting _updateDriftForFingers:leftHand:newestTouch:](self, "_updateDriftForFingers:leftHand:newestTouch:", v5, 1, *((_QWORD *)v31 + 5), v15, v16, v17, v18);
      -[_UIKBRTTouchDrifting _updateDriftForFingers:leftHand:newestTouch:](self, "_updateDriftForFingers:leftHand:newestTouch:", v6, 0, v25[5]);

      _Block_object_dispose(&v24, 8);
      _Block_object_dispose(&v30, 8);

    }
    else
    {
      -[_UIKBRTTouchHistory reset](self->_fHistory, "reset");
      -[_UIKBRTTouchHistory reset](self->_jHistory, "reset");
      if (v7)
      {
        -[_UIKBRTDecayingOffset reset](self->_leftHandDriftOffsetObj, "reset");
        -[_UIKBRTDecayingOffset reset](self->_leftHandFixedOffsetObj, "reset");
        -[_UIKBRTDecayingOffset reset](self->_rightHandDriftOffsetObj, "reset");
        -[_UIKBRTDecayingOffset reset](self->_rightHandFixedOffsetObj, "reset");
        -[_UIKBRTTouchDriftingDelegate _uikbrtTouchDriftingStateChanged:](self->_delegate, "_uikbrtTouchDriftingStateChanged:", self);
      }
    }

  }
  -[_UIKBRTTouchDrifting _updateDriftView](self, "_updateDriftView");

}

- (void)_updateDriftForFingers:(id)a3 leftHand:(BOOL)a4 newestTouch:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  int *v17;
  int *v18;
  int *v19;
  id v20;
  id *v21;
  _UIKBRTTouchHistoryInfo *v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  int *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  int v46;
  CFAbsoluteTime v47;
  void *v48;
  BOOL v49;
  int v50;
  CFAbsoluteTime v51;
  id v52;
  void *v53;
  uint64_t v54;
  int v55;
  uint64_t v56;
  id v57;
  id v58;
  _QWORD v59[4];
  id v60;
  uint64_t *v61;
  uint64_t v62;
  char v63;
  _QWORD v64[6];
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  uint64_t v72;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v10 = 2;
  if (v6)
    v10 = 1;
  v11 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____UIKBRTTouchDrifting__touches[v10]);
  if (v6)
    v12 = 5;
  else
    v12 = 8;
  v13 = 1;
  if (!v6)
    v13 = 2;
  v54 = v13;
  v14 = 9;
  if (v6)
    v14 = 6;
  v56 = v14;
  if (v6)
    v15 = 6;
  else
    v15 = 9;
  v58 = v11;
  v16 = *(id *)((char *)&self->super.super.isa + OBJC_IVAR____UIKBRTTouchDrifting__touches[v12]);
  v57 = *(id *)((char *)&self->super.super.isa + OBJC_IVAR____UIKBRTTouchDrifting__touches[v15]);
  if (v6)
  {
    -[_UIKBRTKeyboardTouchObserver fCenter](self, "fCenter");
    v17 = &OBJC_IVAR____UIKBRTTouchDrifting__leftDriftLockTouchIDs;
    v18 = &OBJC_IVAR____UIKBRTTouchDrifting__leftDriftRemovingItems;
    v19 = &OBJC_IVAR____UIKBRTTouchDrifting__leftIndexFingerInfo;
  }
  else
  {
    -[_UIKBRTKeyboardTouchObserver jCenter](self, "jCenter");
    v17 = &OBJC_IVAR____UIKBRTTouchDrifting__rightDriftLockTouchIDs;
    v18 = &OBJC_IVAR____UIKBRTTouchDrifting__rightDriftRemovingItems;
    v19 = &OBJC_IVAR____UIKBRTTouchDrifting__rightIndexFingerInfo;
  }
  v20 = *(id *)((char *)&self->super.super.isa + *v17);
  v55 = *((unsigned __int8 *)&self->super.super.isa + *v18);
  v21 = (id *)((char *)&self->super.super.isa + *v19);
  v22 = (_UIKBRTTouchHistoryInfo *)*v21;
  v23 = *v21;
  *v21 = 0;

  v69 = 0;
  v70 = &v69;
  v71 = 0x2020000000;
  v72 = 0;
  v65 = 0;
  v66 = &v65;
  v67 = 0x2020000000;
  v68 = 0;
  v24 = MEMORY[0x1E0C809B0];
  v64[0] = MEMORY[0x1E0C809B0];
  v64[1] = 3221225472;
  v64[2] = __68___UIKBRTTouchDrifting__updateDriftForFingers_leftHand_newestTouch___block_invoke;
  v64[3] = &unk_1E16D8288;
  v64[4] = &v65;
  v64[5] = &v69;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v64);
  if ((unint64_t)v70[3] < 3)
  {
    v29 = v16;
  }
  else
  {
    v52 = v9;
    v53 = v20;
    v25 = v8;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v56);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objectForKey:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "firstObject");
    v18 = (int *)objc_claimAutoreleasedReturnValue();

    v59[0] = v24;
    v59[1] = 3221225472;
    v59[2] = __68___UIKBRTTouchDrifting__updateDriftForFingers_leftHand_newestTouch___block_invoke_3;
    v59[3] = &unk_1E16D82B0;
    v63 = v55;
    v62 = v54;
    v60 = v53;
    v61 = &v65;
    objc_msgSend(v25, "enumerateKeysAndObjectsUsingBlock:", v59);
    if (v18)
    {
      v28 = v18;

      v22 = (_UIKBRTTouchHistoryInfo *)v28;
    }
    else if (!v22)
    {
      v22 = objc_alloc_init(_UIKBRTTouchHistoryInfo);
      -[_UIKBRTTouchHistoryInfo setIsLeftHand:](v22, "setIsLeftHand:", v6);
    }
    -[_UIKBRTTouchHistoryInfo touchIdentifier](v22, "touchIdentifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = v16;
    if (!v30)
    {
      -[_UIKBRTTouchDriftingDelegate _uikbrtTouchDrifting:touchCenterForFingerID:](self->_delegate, "_uikbrtTouchDrifting:touchCenterForFingerID:", self, v56);
      -[_UIKBRTTouchHistoryInfo setActualLocation:](v22, "setActualLocation:");
    }

    v8 = v25;
    v9 = v52;
    v20 = v53;
  }
  v31 = v57;
  v32 = v66[3];
  if (v22)
  {
    if (v32)
    {
      objc_storeStrong(v21, v22);
      if (v66[3])
      {
        -[_UIKBRTTouchHistoryInfo touchIdentifier](v22, "touchIdentifier");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        if (v33)
        {
          -[_UIKBRTTouchHistoryInfo touchIdentifier](v22, "touchIdentifier");
          v18 = (int *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v20, "containsObject:", v18))
          {

LABEL_51:
            -[_UIKBRTTouchHistoryInfo actualLocation](v22, "actualLocation");
            v31 = v57;
            -[_UIKBRTTouchDrifting _offsetForPoint:fromPoint:](self, "_offsetForPoint:fromPoint:");
            -[_UIKBRTTouchDrifting _pinOffset:](self, "_pinOffset:");
            objc_msgSend(v57, "updateOffsetTo:");
            objc_msgSend(v29, "updateOffsetTo:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
            objc_msgSend(v58, "clearHistory");
            -[_UIKBRTTouchDriftingDelegate _uikbrtTouchDriftingStateChanged:](self->_delegate, "_uikbrtTouchDriftingStateChanged:", self);
            goto LABEL_54;
          }
        }
        -[_UIKBRTTouchHistoryInfo touchIdentifier](v22, "touchIdentifier");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        if (v55)
          v49 = 0;
        else
          v49 = v48 == 0;
        v50 = v49;

        if (v33)
        {

          if ((v50 & 1) != 0)
            goto LABEL_51;
        }
        else if (v50)
        {
          goto LABEL_51;
        }
        v31 = v57;
        v51 = CFAbsoluteTimeGetCurrent() + *(double *)&sSystemUptimeFromAbsoluteTimeDiff;
        objc_msgSend(v57, "resetDecayTo:", v51);
        objc_msgSend(v29, "resetDecayTo:", v51);
        goto LABEL_54;
      }
    }
  }
  else if (v32)
  {
    objc_msgSend(v58, "historyOffset");
    v35 = v34;
    v37 = v36;
    if (v34 * v34 + v36 * v36 <= 0.0)
    {
      v47 = CFAbsoluteTimeGetCurrent() + *(double *)&sSystemUptimeFromAbsoluteTimeDiff;
      objc_msgSend(v57, "resetDecayTo:", v47);
      objc_msgSend(v29, "resetDecayTo:", v47);
    }
    else
    {
      objc_msgSend(v57, "originalOffset");
      v39 = v38;
      v41 = v40;
      -[_UIKBRTTouchDrifting _pinOffset:](self, "_pinOffset:", v35 + v38, v37 + v40);
      v43 = v42;
      v45 = v44;
      objc_msgSend(v57, "updateOffsetTo:");
      objc_msgSend(v29, "updateOffsetTo:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
      objc_msgSend(v58, "adjustHistoryOffset:", v43 - v39, v45 - v41);
    }
    goto LABEL_41;
  }
  if ((objc_msgSend(v57, "isActive") & 1) != 0)
    v46 = 1;
  else
    v46 = objc_msgSend(v29, "isActive");
  objc_msgSend(v57, "startOrUpdateDecay");
  objc_msgSend(v29, "startOrUpdateDecay");
  if (objc_msgSend(v57, "isActive"))
  {
    if ((v46 & 1) != 0)
      goto LABEL_54;
    goto LABEL_41;
  }
  if (v46 != objc_msgSend(v29, "isActive"))
LABEL_41:
    -[_UIKBRTTouchDriftingDelegate _uikbrtTouchDriftingStateChanged:](self->_delegate, "_uikbrtTouchDriftingStateChanged:", self);
LABEL_54:
  _Block_object_dispose(&v65, 8);
  _Block_object_dispose(&v69, 8);

}

- (CGPoint)_offsetForPoint:(CGPoint)a3 fromPoint:(CGPoint)a4
{
  double v4;
  double v5;
  CGPoint result;

  v4 = a3.x - a4.x;
  v5 = a3.y - a4.y;
  result.y = v5;
  result.x = v4;
  return result;
}

- (CGPoint)_pointFromPoint:(CGPoint)a3 plusOffset:(CGPoint)a4
{
  double v4;
  double v5;
  CGPoint result;

  v4 = a3.x + a4.x;
  v5 = a3.y + a4.y;
  result.y = v5;
  result.x = v4;
  return result;
}

- (CGPoint)_pinOffset:(CGPoint)a3
{
  $0DA52F09BD1218B914A54A682A019838 *p_touchError;
  double left;
  double right;
  uint64_t v6;
  double v7;
  uint64_t v8;
  double v9;
  double v10;
  CGPoint result;

  p_touchError = &self->_touchError;
  left = self->_touchError.left;
  if (a3.x < left || (right = self->_touchError.right, right < a3.x))
  {
    if (a3.y < p_touchError->up || self->_touchError.down < a3.y)
    {
      v6 = 24;
      if (a3.x < 0.0)
        v6 = 16;
      v7 = *(double *)((char *)&p_touchError->up + v6) / a3.x;
      if (v7 >= *(&p_touchError->up + (a3.y >= 0.0)) / a3.y)
        v7 = *(&p_touchError->up + (a3.y >= 0.0)) / a3.y;
      if (v7 > 1.0)
        v7 = 1.0;
      goto LABEL_21;
    }
    if (a3.x < left)
      goto LABEL_15;
    right = self->_touchError.right;
  }
  if (right < a3.x)
  {
LABEL_15:
    v8 = 24;
    if (a3.x < 0.0)
      v8 = 16;
    v7 = *(double *)((char *)&p_touchError->up + v8) / a3.x;
    goto LABEL_21;
  }
  if (a3.y < p_touchError->up || (v7 = 1.0, self->_touchError.down < a3.y))
    v7 = *(&p_touchError->up + (a3.y >= 0.0)) / a3.y;
LABEL_21:
  v9 = a3.x * v7;
  v10 = a3.y * v7;
  result.y = v10;
  result.x = v9;
  return result;
}

- (void)_updateDriftView
{
  id WeakRetained;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  UIView *v12;
  UIView *v13;
  UIView *leftDriftFeedbackView;
  void *v15;
  void *v16;
  int i;
  int v18;
  uint64_t v19;
  void *v20;
  unint64_t v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  int v27;
  _UIKBRTTouchDrifingFingerCircleView *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  void *v35;
  id v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t k;
  void *v42;
  id v43;
  id v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  void *v58;
  void *v59;
  double v60;
  double v61;
  double v62;
  UIView *v63;
  UIView *v64;
  UIView *rightDriftFeedbackView;
  void *v66;
  void *v67;
  uint64_t m;
  int v69;
  uint64_t v70;
  void *v71;
  unint64_t v72;
  void *v73;
  void *v74;
  double v75;
  double v76;
  int v77;
  double v78;
  _UIKBRTTouchDrifingFingerCircleView *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t n;
  void *v86;
  id v87;
  id v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t ii;
  void *v93;
  id v94;
  id v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  UIView *v107;
  UIView *v108;
  UIView *touchHistoryFeedbackView;
  void *v110;
  NSMapTable *v111;
  NSMapTable *touchHistoryViewMap;
  _UIKBRTTouchHistory *jHistory;
  void *v114;
  NSTimer *v115;
  NSTimer *feedbackTimer;
  void *v117;
  double v118;
  id v119;
  _QWORD v120[5];
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  _QWORD v137[2];
  _BYTE v138[128];
  _BYTE v139[128];
  _BYTE v140[128];
  _BYTE v141[128];
  uint64_t v142;

  v142 = *MEMORY[0x1E0C80C00];
  if ((_UIInternalPreferenceUsesDefault(&_UIInternalPreference__UIKBRT_DriftFeedback, (uint64_t)CFSTR("_UIKBRT_DriftFeedback"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool) & 1) != 0|| !byte_1EDDA819C|| !self->_supportsDrifting)
  {
    -[_UIKBRTTouchDrifting _resetFeedback](self, "_resetFeedback");
    return;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_feedbackParentView);
  if (WeakRetained)
  {
    -[_UIKBRTKeyboardTouchObserver keySize](self, "keySize");
    v5 = v4;
    v7 = v6;
    -[_UIKBRTKeyboardTouchObserver rowOffsets](self, "rowOffsets");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndex:", -[_UIKBRTKeyboardTouchObserver homeRowOffsetIndex](self, "homeRowOffsetIndex") - 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "doubleValue");
    v11 = v10;

    if (!self->_leftDriftFeedbackView)
    {
      v12 = [UIView alloc];
      v13 = -[UIView initWithFrame:](v12, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      leftDriftFeedbackView = self->_leftDriftFeedbackView;
      self->_leftDriftFeedbackView = v13;

      +[UIColor clearColor](UIColor, "clearColor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](self->_leftDriftFeedbackView, "setBackgroundColor:", v15);

      -[UIView setUserInteractionEnabled:](self->_leftDriftFeedbackView, "setUserInteractionEnabled:", 0);
      objc_msgSend(WeakRetained, "addSubview:", self->_leftDriftFeedbackView);
      +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.75, 0.25);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      for (i = -1; i != 2; ++i)
      {
        v18 = -[_UIKBRTKeyboardTouchObserver homeRowOffsetIndex](self, "homeRowOffsetIndex");
        v19 = (v18 + i);
        if (v18 + i >= 0)
        {
          -[_UIKBRTKeyboardTouchObserver rowOffsets](self, "rowOffsets");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "count");

          if (v21 > v19)
          {
            -[_UIKBRTKeyboardTouchObserver rowOffsets](self, "rowOffsets");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "objectAtIndex:", v19);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "doubleValue");
            v25 = v24;

            v26 = 0.0;
            v27 = 5;
            do
            {
              v28 = -[_UIKBRTTouchDrifingFingerCircleView initWithFrame:]([_UIKBRTTouchDrifingFingerCircleView alloc], "initWithFrame:", v25 + v5 * v26 - v11, v7 * (double)(i + 1), v5, v7);
              -[UIView setBackgroundColor:](v28, "setBackgroundColor:", v16);
              -[UIView addSubview:](self->_leftDriftFeedbackView, "addSubview:", v28);

              v26 = v26 + 1.0;
              --v27;
            }
            while (v27);
          }
        }
      }

    }
    v119 = WeakRetained;
    if (-[_UIKBRTDecayingObject isDecaying](self->_leftHandDriftOffsetObj, "isDecaying")
      || -[_UIKBRTDecayingObject isDecaying](self->_leftHandFixedOffsetObj, "isDecaying"))
    {
      +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.5, 1.0, 1.0, 0.25);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v133 = 0u;
      v134 = 0u;
      v135 = 0u;
      v136 = 0u;
      -[UIView subviews](self->_leftDriftFeedbackView, "subviews");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v133, v141, 16);
      if (!v31)
        goto LABEL_36;
      v32 = v31;
      v33 = *(_QWORD *)v134;
      do
      {
        for (j = 0; j != v32; ++j)
        {
          if (*(_QWORD *)v134 != v33)
            objc_enumerationMutation(v30);
          v35 = *(void **)(*((_QWORD *)&v133 + 1) + 8 * j);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v36 = objc_retainAutorelease(v29);
            v37 = v35;
            objc_msgSend(v37, "setBorderColor:", objc_msgSend(v36, "CGColor"));

          }
        }
        v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v133, v141, 16);
      }
      while (v32);
    }
    else
    {
      +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.0, 1.0, 1.0, 0.25);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v129 = 0u;
      v130 = 0u;
      v131 = 0u;
      v132 = 0u;
      -[UIView subviews](self->_leftDriftFeedbackView, "subviews");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v129, v140, 16);
      if (!v38)
        goto LABEL_36;
      v39 = v38;
      v40 = *(_QWORD *)v130;
      do
      {
        for (k = 0; k != v39; ++k)
        {
          if (*(_QWORD *)v130 != v40)
            objc_enumerationMutation(v30);
          v42 = *(void **)(*((_QWORD *)&v129 + 1) + 8 * k);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v43 = objc_retainAutorelease(v29);
            v44 = v42;
            objc_msgSend(v44, "setBorderColor:", objc_msgSend(v43, "CGColor"));

          }
        }
        v39 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v129, v140, 16);
      }
      while (v39);
    }
    WeakRetained = v119;
LABEL_36:

    -[_UIKBRTDecayingOffset offset](self->_leftHandDriftOffsetObj, "offset");
    v46 = v45;
    v48 = v47;
    -[_UIKBRTDecayingOffset offset](self->_leftHandFixedOffsetObj, "offset");
    v50 = v49;
    v52 = v11 + v46 + v51;
    -[_UIKBRTKeyboardTouchObserver fCenter](self, "fCenter");
    v54 = v53 + v52 + v5 * -3.5;
    -[_UIKBRTKeyboardTouchObserver fCenter](self, "fCenter");
    v56 = v7 * 1.5;
    v57 = v48 + v50 + v55 - v7 * 1.5;
    -[_UIKBRTKeyboardTouchObserver rowOffsets](self, "rowOffsets");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "objectAtIndex:", -[_UIKBRTKeyboardTouchObserver homeRowOffsetIndex](self, "homeRowOffsetIndex") + 1);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "doubleValue");
    v61 = v5 * 5.0 + v60;
    v62 = v7 * 3.0;

    -[UIView setFrame:](self->_leftDriftFeedbackView, "setFrame:", v54, v57, v61, v7 * 3.0);
    objc_msgSend(WeakRetained, "bringSubviewToFront:", self->_leftDriftFeedbackView);
    if (_updateDriftView_onceToken != -1)
      dispatch_once(&_updateDriftView_onceToken, &__block_literal_global_44);
    if (!self->_rightDriftFeedbackView)
    {
      v118 = v7 * 3.0;
      v63 = [UIView alloc];
      v64 = -[UIView initWithFrame:](v63, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      rightDriftFeedbackView = self->_rightDriftFeedbackView;
      self->_rightDriftFeedbackView = v64;

      +[UIColor clearColor](UIColor, "clearColor");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](self->_rightDriftFeedbackView, "setBackgroundColor:", v66);

      -[UIView setUserInteractionEnabled:](self->_rightDriftFeedbackView, "setUserInteractionEnabled:", 0);
      objc_msgSend(WeakRetained, "addSubview:", self->_rightDriftFeedbackView);
      +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.75, 0.25);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      for (m = -1; m != 2; ++m)
      {
        v69 = -[_UIKBRTKeyboardTouchObserver homeRowOffsetIndex](self, "homeRowOffsetIndex", *(_QWORD *)&v118);
        v70 = (v69 + m);
        if (v69 + (int)m >= 0)
        {
          -[_UIKBRTKeyboardTouchObserver rowOffsets](self, "rowOffsets");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          v72 = objc_msgSend(v71, "count");

          if (v72 > v70)
          {
            -[_UIKBRTKeyboardTouchObserver rowOffsets](self, "rowOffsets");
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v73, "objectAtIndex:", v70);
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v74, "doubleValue");
            v76 = v75;

            v77 = *((_DWORD *)&_MergedGlobals_11 + m + 3);
            if (v77 >= 1)
            {
              v78 = 0.0;
              do
              {
                v79 = -[_UIKBRTTouchDrifingFingerCircleView initWithFrame:]([_UIKBRTTouchDrifingFingerCircleView alloc], "initWithFrame:", v76 + v5 * v78 - v11, v7 * (double)((int)m + 1), v5, v7);
                -[UIView setBackgroundColor:](v79, "setBackgroundColor:", v67);
                -[UIView addSubview:](self->_rightDriftFeedbackView, "addSubview:", v79);

                v78 = v78 + 1.0;
                --v77;
              }
              while (v77);
            }
          }
        }
      }

      WeakRetained = v119;
      v62 = v118;
      v56 = v7 * 1.5;
    }
    if (-[_UIKBRTDecayingObject isDecaying](self->_rightHandDriftOffsetObj, "isDecaying")
      || -[_UIKBRTDecayingObject isDecaying](self->_rightHandFixedOffsetObj, "isDecaying"))
    {
      +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.5, 1.0, 1.0, 0.25);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      v125 = 0u;
      v126 = 0u;
      v127 = 0u;
      v128 = 0u;
      -[UIView subviews](self->_rightDriftFeedbackView, "subviews");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      v82 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v125, v139, 16);
      if (v82)
      {
        v83 = v82;
        v84 = *(_QWORD *)v126;
        do
        {
          for (n = 0; n != v83; ++n)
          {
            if (*(_QWORD *)v126 != v84)
              objc_enumerationMutation(v81);
            v86 = *(void **)(*((_QWORD *)&v125 + 1) + 8 * n);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v87 = objc_retainAutorelease(v80);
              v88 = v86;
              objc_msgSend(v88, "setBorderColor:", objc_msgSend(v87, "CGColor"));

            }
          }
          v83 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v125, v139, 16);
        }
        while (v83);
LABEL_68:
        WeakRetained = v119;
      }
    }
    else
    {
      +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.0, 1.0, 1.0, 0.25);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      v121 = 0u;
      v122 = 0u;
      v123 = 0u;
      v124 = 0u;
      -[UIView subviews](self->_rightDriftFeedbackView, "subviews");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      v89 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v121, v138, 16);
      if (v89)
      {
        v90 = v89;
        v91 = *(_QWORD *)v122;
        do
        {
          for (ii = 0; ii != v90; ++ii)
          {
            if (*(_QWORD *)v122 != v91)
              objc_enumerationMutation(v81);
            v93 = *(void **)(*((_QWORD *)&v121 + 1) + 8 * ii);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v94 = objc_retainAutorelease(v80);
              v95 = v93;
              objc_msgSend(v95, "setBorderColor:", objc_msgSend(v94, "CGColor"));

            }
          }
          v90 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v121, v138, 16);
        }
        while (v90);
        goto LABEL_68;
      }
    }

    -[_UIKBRTDecayingOffset offset](self->_rightHandDriftOffsetObj, "offset");
    v97 = v96;
    v99 = v98;
    -[_UIKBRTDecayingOffset offset](self->_rightHandFixedOffsetObj, "offset");
    v101 = v100;
    v103 = v11 + v97 + v102;
    -[_UIKBRTKeyboardTouchObserver jCenter](self, "jCenter");
    v105 = v104 + v103 + v5 * -1.5;
    -[_UIKBRTKeyboardTouchObserver jCenter](self, "jCenter");
    -[UIView setFrame:](self->_rightDriftFeedbackView, "setFrame:", v105, v99 + v101 + v106 - v56, v5 * *(double *)&_MergedGlobals_11, v62);
    objc_msgSend(WeakRetained, "bringSubviewToFront:", self->_rightDriftFeedbackView);
    if (!self->_touchHistoryFeedbackView)
    {
      v107 = [UIView alloc];
      v108 = -[UIView initWithFrame:](v107, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      touchHistoryFeedbackView = self->_touchHistoryFeedbackView;
      self->_touchHistoryFeedbackView = v108;

      +[UIColor clearColor](UIColor, "clearColor");
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](self->_touchHistoryFeedbackView, "setBackgroundColor:", v110);

      -[UIView setUserInteractionEnabled:](self->_touchHistoryFeedbackView, "setUserInteractionEnabled:", 0);
      objc_msgSend(WeakRetained, "addSubview:", self->_touchHistoryFeedbackView);
    }
    if (!self->_touchHistoryViewMap)
    {
      v111 = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 5, 5, 0);
      touchHistoryViewMap = self->_touchHistoryViewMap;
      self->_touchHistoryViewMap = v111;

    }
    objc_msgSend(WeakRetained, "bounds");
    -[UIView setFrame:](self->_touchHistoryFeedbackView, "setFrame:");
    jHistory = self->_jHistory;
    v137[0] = self->_fHistory;
    v137[1] = jHistory;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v137, 2);
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    v120[0] = MEMORY[0x1E0C809B0];
    v120[1] = 3221225472;
    v120[2] = __40___UIKBRTTouchDrifting__updateDriftView__block_invoke_2;
    v120[3] = &unk_1E16D82D8;
    v120[4] = self;
    objc_msgSend(v114, "enumerateObjectsUsingBlock:", v120);

    if ((-[_UIKBRTDecayingObject isActive](self->_leftHandDriftOffsetObj, "isActive")
       || -[_UIKBRTDecayingObject isActive](self->_leftHandFixedOffsetObj, "isActive")
       || -[_UIKBRTDecayingObject isActive](self->_rightHandDriftOffsetObj, "isActive")
       || -[_UIKBRTDecayingObject isActive](self->_rightHandFixedOffsetObj, "isActive")
       || -[_UIKBRTTouchHistory hasHistory](self->_fHistory, "hasHistory")
       || -[_UIKBRTTouchHistory hasHistory](self->_jHistory, "hasHistory"))
      && !self->_feedbackTimer)
    {
      objc_msgSend(MEMORY[0x1E0C99E88], "timerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__updateDriftViewTimer_, 0, 1, 0.1);
      v115 = (NSTimer *)objc_claimAutoreleasedReturnValue();
      feedbackTimer = self->_feedbackTimer;
      self->_feedbackTimer = v115;

      objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v117, "addTimer:forMode:", self->_feedbackTimer, *MEMORY[0x1E0C99860]);

    }
  }

}

- (void)_updateDriftViewTimer:(id)a3
{
  double Current;
  double v5;
  _BOOL4 v6;
  double v7;
  void *v8;
  uint64_t v9;
  _UIKBRTDecayingOffset *leftHandDriftOffsetObj;
  void *v11;
  uint64_t v12;
  _UIKBRTDecayingOffset *rightHandDriftOffsetObj;
  _BOOL4 v14;
  _UIKBRTDecayingObject *enableLatchObj;
  NSTimer *feedbackTimer;

  if (self->_feedbackTimer != a3)
    return;
  Current = CFAbsoluteTimeGetCurrent();
  v5 = *(double *)&sSystemUptimeFromAbsoluteTimeDiff;
  v6 = -[_UIKBRTDecayingObject isActive](self->_leftHandFixedOffsetObj, "isActive")
    || -[_UIKBRTDecayingObject isActive](self->_leftHandDriftOffsetObj, "isActive")
    || -[_UIKBRTDecayingObject isActive](self->_rightHandFixedOffsetObj, "isActive")
    || -[_UIKBRTDecayingObject isActive](self->_rightHandDriftOffsetObj, "isActive");
  v7 = Current + v5;
  -[_UIKBRTTouchDrifting _updateHistory](self, "_updateHistory");
  -[_UIKBRTTouchDrifting _touchDictWithFingerIds:](self, "_touchDictWithFingerIds:", &unk_1E1A94298);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  leftHandDriftOffsetObj = self->_leftHandDriftOffsetObj;
  if (v9)
  {
    -[_UIKBRTDecayingObject resetActiveDecayTo:](leftHandDriftOffsetObj, "resetActiveDecayTo:", v7);
    -[_UIKBRTDecayingObject resetActiveDecayTo:](self->_leftHandFixedOffsetObj, "resetActiveDecayTo:", v7);
  }
  else
  {
    -[_UIKBRTDecayingObject startOrUpdateDecay](leftHandDriftOffsetObj, "startOrUpdateDecay");
    -[_UIKBRTDecayingObject startOrUpdateDecay](self->_leftHandFixedOffsetObj, "startOrUpdateDecay");
  }
  -[_UIKBRTTouchDrifting _touchDictWithFingerIds:](self, "_touchDictWithFingerIds:", &unk_1E1A942B0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  rightHandDriftOffsetObj = self->_rightHandDriftOffsetObj;
  if (v12)
  {
    -[_UIKBRTDecayingObject resetActiveDecayTo:](rightHandDriftOffsetObj, "resetActiveDecayTo:", v7);
    -[_UIKBRTDecayingObject resetActiveDecayTo:](self->_rightHandFixedOffsetObj, "resetActiveDecayTo:", v7);
  }
  else
  {
    -[_UIKBRTDecayingObject startOrUpdateDecay](rightHandDriftOffsetObj, "startOrUpdateDecay");
    -[_UIKBRTDecayingObject startOrUpdateDecay](self->_rightHandFixedOffsetObj, "startOrUpdateDecay");
  }
  if (!-[_UIKBRTDecayingObject isActive](self->_leftHandFixedOffsetObj, "isActive")
    && !-[_UIKBRTDecayingObject isActive](self->_leftHandDriftOffsetObj, "isActive")
    && !-[_UIKBRTDecayingObject isActive](self->_rightHandFixedOffsetObj, "isActive"))
  {
    v14 = -[_UIKBRTDecayingObject isActive](self->_rightHandDriftOffsetObj, "isActive");
    if (v6)
      goto LABEL_17;
LABEL_22:
    -[_UIKBRTTouchDrifting _updateDriftView](self, "_updateDriftView");
    if (v14)
      return;
    goto LABEL_23;
  }
  v14 = 1;
  if (!v6)
    goto LABEL_22;
LABEL_17:
  enableLatchObj = self->_enableLatchObj;
  if (v14)
  {
    -[_UIKBRTDecayingObject resetActiveDecayTo:](enableLatchObj, "resetActiveDecayTo:", v7);
    -[_UIKBRTTouchDrifting _updateDriftView](self, "_updateDriftView");
    return;
  }
  -[_UIKBRTDecayingObject reset](enableLatchObj, "reset");
  -[_UIKBRTTouchDriftingDelegate _uikbrtTouchDriftingStateChanged:](self->_delegate, "_uikbrtTouchDriftingStateChanged:", self);
  -[_UIKBRTTouchDrifting _updateDriftView](self, "_updateDriftView");
LABEL_23:
  if (!-[_UIKBRTTouchHistory hasHistory](self->_fHistory, "hasHistory")
    && !-[_UIKBRTTouchHistory hasHistory](self->_jHistory, "hasHistory"))
  {
    -[NSTimer invalidate](self->_feedbackTimer, "invalidate");
    feedbackTimer = self->_feedbackTimer;
    self->_feedbackTimer = 0;

  }
}

- (_UIKBRTTouchDriftingDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (_UIKBRTTouchDriftingDelegate *)a3;
}

- (NSArray)indexSearchOrder
{
  return self->_indexSearchOrder;
}

- (void)setIndexSearchOrder:(id)a3
{
  objc_storeStrong((id *)&self->_indexSearchOrder, a3);
}

- (NSMutableDictionary)touches
{
  return self->_touches;
}

- (void)setTouches:(id)a3
{
  objc_storeStrong((id *)&self->_touches, a3);
}

- (_UIKBRTTouchHistory)fHistory
{
  return self->_fHistory;
}

- (void)setFHistory:(id)a3
{
  objc_storeStrong((id *)&self->_fHistory, a3);
}

- (_UIKBRTTouchHistory)jHistory
{
  return self->_jHistory;
}

- (void)setJHistory:(id)a3
{
  objc_storeStrong((id *)&self->_jHistory, a3);
}

- (_UIKBRTTouchHistory)otherHistory
{
  return self->_otherHistory;
}

- (void)setOtherHistory:(id)a3
{
  objc_storeStrong((id *)&self->_otherHistory, a3);
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)touchError
{
  double up;
  double down;
  double left;
  double right;
  $01BB1521EC52D44A8E7628F5261DCEC8 result;

  up = self->_touchError.up;
  down = self->_touchError.down;
  left = self->_touchError.left;
  right = self->_touchError.right;
  result.var3 = right;
  result.var2 = left;
  result.var1 = down;
  result.var0 = up;
  return result;
}

- (void)setTouchError:(id)a3
{
  self->_touchError = ($0DA52F09BD1218B914A54A682A019838)a3;
}

- (BOOL)supportsDrifting
{
  return self->_supportsDrifting;
}

- (void)setSupportsDrifting:(BOOL)a3
{
  self->_supportsDrifting = a3;
}

- (_UIKBRTDecayingObject)enableLatchObj
{
  return self->_enableLatchObj;
}

- (void)setEnableLatchObj:(id)a3
{
  objc_storeStrong((id *)&self->_enableLatchObj, a3);
}

- (_UIKBRTDecayingOffset)leftHandDriftOffsetObj
{
  return self->_leftHandDriftOffsetObj;
}

- (void)setLeftHandDriftOffsetObj:(id)a3
{
  objc_storeStrong((id *)&self->_leftHandDriftOffsetObj, a3);
}

- (_UIKBRTDecayingOffset)leftHandFixedOffsetObj
{
  return self->_leftHandFixedOffsetObj;
}

- (void)setLeftHandFixedOffsetObj:(id)a3
{
  objc_storeStrong((id *)&self->_leftHandFixedOffsetObj, a3);
}

- (_UIKBRTDecayingOffset)rightHandDriftOffsetObj
{
  return self->_rightHandDriftOffsetObj;
}

- (void)setRightHandDriftOffsetObj:(id)a3
{
  objc_storeStrong((id *)&self->_rightHandDriftOffsetObj, a3);
}

- (_UIKBRTDecayingOffset)rightHandFixedOffsetObj
{
  return self->_rightHandFixedOffsetObj;
}

- (void)setRightHandFixedOffsetObj:(id)a3
{
  objc_storeStrong((id *)&self->_rightHandFixedOffsetObj, a3);
}

- (_UIKBRTTouchHistoryInfo)leftIndexFingerInfo
{
  return self->_leftIndexFingerInfo;
}

- (void)setLeftIndexFingerInfo:(id)a3
{
  objc_storeStrong((id *)&self->_leftIndexFingerInfo, a3);
}

- (NSMutableSet)leftDriftLockTouchIDs
{
  return self->_leftDriftLockTouchIDs;
}

- (void)setLeftDriftLockTouchIDs:(id)a3
{
  objc_storeStrong((id *)&self->_leftDriftLockTouchIDs, a3);
}

- (BOOL)leftDriftRemovingItems
{
  return self->_leftDriftRemovingItems;
}

- (void)setLeftDriftRemovingItems:(BOOL)a3
{
  self->_leftDriftRemovingItems = a3;
}

- (_UIKBRTTouchHistoryInfo)rightIndexFingerInfo
{
  return self->_rightIndexFingerInfo;
}

- (void)setRightIndexFingerInfo:(id)a3
{
  objc_storeStrong((id *)&self->_rightIndexFingerInfo, a3);
}

- (NSMutableSet)rightDriftLockTouchIDs
{
  return self->_rightDriftLockTouchIDs;
}

- (void)setRightDriftLockTouchIDs:(id)a3
{
  objc_storeStrong((id *)&self->_rightDriftLockTouchIDs, a3);
}

- (BOOL)rightDriftRemovingItems
{
  return self->_rightDriftRemovingItems;
}

- (void)setRightDriftRemovingItems:(BOOL)a3
{
  self->_rightDriftRemovingItems = a3;
}

- (UIView)feedbackParentView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_feedbackParentView);
}

- (void)setFeedbackParentView:(id)a3
{
  objc_storeWeak((id *)&self->_feedbackParentView, a3);
}

- (NSTimer)feedbackTimer
{
  return self->_feedbackTimer;
}

- (void)setFeedbackTimer:(id)a3
{
  objc_storeStrong((id *)&self->_feedbackTimer, a3);
}

- (UIView)leftDriftFeedbackView
{
  return self->_leftDriftFeedbackView;
}

- (void)setLeftDriftFeedbackView:(id)a3
{
  objc_storeStrong((id *)&self->_leftDriftFeedbackView, a3);
}

- (UIView)rightDriftFeedbackView
{
  return self->_rightDriftFeedbackView;
}

- (void)setRightDriftFeedbackView:(id)a3
{
  objc_storeStrong((id *)&self->_rightDriftFeedbackView, a3);
}

- (UIView)touchHistoryFeedbackView
{
  return self->_touchHistoryFeedbackView;
}

- (void)setTouchHistoryFeedbackView:(id)a3
{
  objc_storeStrong((id *)&self->_touchHistoryFeedbackView, a3);
}

- (NSMapTable)touchHistoryViewMap
{
  return self->_touchHistoryViewMap;
}

- (void)setTouchHistoryViewMap:(id)a3
{
  objc_storeStrong((id *)&self->_touchHistoryViewMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touchHistoryViewMap, 0);
  objc_storeStrong((id *)&self->_touchHistoryFeedbackView, 0);
  objc_storeStrong((id *)&self->_rightDriftFeedbackView, 0);
  objc_storeStrong((id *)&self->_leftDriftFeedbackView, 0);
  objc_storeStrong((id *)&self->_feedbackTimer, 0);
  objc_destroyWeak((id *)&self->_feedbackParentView);
  objc_storeStrong((id *)&self->_rightDriftLockTouchIDs, 0);
  objc_storeStrong((id *)&self->_rightIndexFingerInfo, 0);
  objc_storeStrong((id *)&self->_leftDriftLockTouchIDs, 0);
  objc_storeStrong((id *)&self->_leftIndexFingerInfo, 0);
  objc_storeStrong((id *)&self->_rightHandFixedOffsetObj, 0);
  objc_storeStrong((id *)&self->_rightHandDriftOffsetObj, 0);
  objc_storeStrong((id *)&self->_leftHandFixedOffsetObj, 0);
  objc_storeStrong((id *)&self->_leftHandDriftOffsetObj, 0);
  objc_storeStrong((id *)&self->_enableLatchObj, 0);
  objc_storeStrong((id *)&self->_otherHistory, 0);
  objc_storeStrong((id *)&self->_jHistory, 0);
  objc_storeStrong((id *)&self->_fHistory, 0);
  objc_storeStrong((id *)&self->_touches, 0);
  objc_storeStrong((id *)&self->_indexSearchOrder, 0);
}

@end
