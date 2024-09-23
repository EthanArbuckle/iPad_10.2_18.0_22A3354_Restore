@implementation _UIKBRTTouchHistory

- (_UIKBRTTouchHistory)initWithIsLeftHand:(BOOL)a3
{
  _UIKBRTTouchHistory *v4;
  _UIKBRTTouchHistory *v5;
  NSMutableArray *v6;
  NSMutableArray *history;

  v4 = -[_UIKBRTTouchHistory init](self, "init");
  v5 = v4;
  if (v4)
  {
    v4->_isLeftHand = a3;
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    history = v5->_history;
    v5->_history = v6;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;

  v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = -[NSMutableArray mutableCopy](self->_history, "mutableCopy");
  v6 = (void *)v4[1];
  v4[1] = v5;

  *((_OWORD *)v4 + 1) = self->_historyOffset;
  return v4;
}

- (void)dealloc
{
  NSMutableArray *history;
  objc_super v4;

  -[_UIKBRTTouchHistory reset](self, "reset");
  history = self->_history;
  self->_history = 0;

  v4.receiver = self;
  v4.super_class = (Class)_UIKBRTTouchHistory;
  -[_UIKBRTTouchHistory dealloc](&v4, sel_dealloc);
}

- (BOOL)hasHistory
{
  void *v3;
  int v4;

  -[_UIKBRTTouchHistory decayHistory](self, "decayHistory");
  if (-[NSMutableArray count](self->_history, "count"))
  {
    -[NSMutableArray lastObject](self->_history, "lastObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "isActive") & 1) != 0)
    {
      LOBYTE(v4) = 1;
    }
    else if ((objc_msgSend(v3, "ignoreTouch") & 1) != 0)
    {
      LOBYTE(v4) = 0;
    }
    else
    {
      v4 = objc_msgSend(v3, "ignoreForDrift") ^ 1;
    }

  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (double)lastTime
{
  uint64_t v3;
  void *v4;
  double v5;
  double v6;

  v3 = -[NSMutableArray indexOfObjectWithOptions:passingTest:](self->_history, "indexOfObjectWithOptions:passingTest:", 2, &__block_literal_global_343);
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndex:](self->_history, "objectAtIndex:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "touchTime");
  v6 = v5;

  return v6;
}

- (CGPoint)historyOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_historyOffset.x;
  y = self->_historyOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (BOOL)containsInfo:(id)a3
{
  return -[NSMutableArray containsObject:](self->_history, "containsObject:", a3);
}

- (void)addInfo:(id)a3
{
  -[NSMutableArray addObject:](self->_history, "addObject:", a3);
  -[_UIKBRTTouchHistory _updateOffset](self, "_updateOffset");
}

- (void)removeInfo:(id)a3
{
  id v4;

  v4 = a3;
  if (-[NSMutableArray containsObject:](self->_history, "containsObject:"))
  {
    -[NSMutableArray removeObject:](self->_history, "removeObject:", v4);
    -[_UIKBRTTouchHistory _updateOffset](self, "_updateOffset");
  }

}

- (void)adjustHistoryOffset:(CGPoint)a3
{
  double y;
  double x;
  NSMutableArray *history;
  CGFloat v7;
  _QWORD v8[4];
  CGPoint v9;

  y = a3.y;
  x = a3.x;
  history = self->_history;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __43___UIKBRTTouchHistory_adjustHistoryOffset___block_invoke;
  v8[3] = &__block_descriptor_48_e40_v32__0___UIKBRTTouchHistoryInfo_8Q16_B24l;
  v9 = a3;
  -[NSMutableArray enumerateObjectsWithOptions:usingBlock:](history, "enumerateObjectsWithOptions:usingBlock:", 2, v8);
  v7 = self->_historyOffset.y - y;
  self->_historyOffset.x = self->_historyOffset.x - x;
  self->_historyOffset.y = v7;
}

- (void)clearHistory
{
  NSMutableArray *history;
  void *v4;

  history = self->_history;
  -[NSMutableArray indexesOfObjectsPassingTest:](history, "indexesOfObjectsPassingTest:", &__block_literal_global_345);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray removeObjectsAtIndexes:](history, "removeObjectsAtIndexes:", v4);

  -[_UIKBRTTouchHistory _updateOffset](self, "_updateOffset");
}

- (void)decayHistory
{
  -[_UIKBRTTouchHistory _decayHistoryToSize:](self, "_decayHistoryToSize:", 12);
}

- (void)_sortHistory
{
  id v3;

  -[NSMutableArray indexesOfObjectsPassingTest:](self->_history, "indexesOfObjectsPassingTest:", &__block_literal_global_346);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
    -[NSMutableArray removeObjectsAtIndexes:](self->_history, "removeObjectsAtIndexes:", v3);
  -[NSMutableArray sortUsingComparator:](self->_history, "sortUsingComparator:", &__block_literal_global_348);

}

- (void)_decayHistoryToSize:(unint64_t)a3
{
  CFAbsoluteTime v5;
  double v6;
  NSMutableArray *v7;
  void *v8;
  int v9;
  double v10;
  NSMutableArray *history;
  id v12;
  _QWORD v13[6];
  _QWORD v14[7];
  _QWORD v15[3];
  unint64_t v16;

  -[_UIKBRTTouchHistory _sortHistory](self, "_sortHistory");
  v5 = CFAbsoluteTimeGetCurrent() + *(double *)&sSystemUptimeFromAbsoluteTimeDiff;
  if (v5 - self->_lastDecayTime >= 0.05)
  {
    self->_lastDecayTime = v5;
    if (-[NSMutableArray count](self->_history, "count") <= a3)
    {
      if (-[NSMutableArray count](self->_history, "count"))
      {
        v9 = _UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference__UIKBRT_DriftReturnTime, (uint64_t)CFSTR("_UIKBRT_DriftReturnTime"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
        v10 = *(double *)&qword_1EDDA81A8 + *(double *)&qword_1EDDA81A8;
        if (v9)
          v10 = 4.0;
        history = self->_history;
        v13[0] = MEMORY[0x1E0C809B0];
        v13[1] = 3221225472;
        v13[2] = __43___UIKBRTTouchHistory__decayHistoryToSize___block_invoke_2;
        v13[3] = &__block_descriptor_48_e40_B32__0___UIKBRTTouchHistoryInfo_8Q16_B24l;
        *(CFAbsoluteTime *)&v13[4] = v5;
        *(double *)&v13[5] = v10;
        -[NSMutableArray indexesOfObjectsPassingTest:](history, "indexesOfObjectsPassingTest:", v13);
        v12 = (id)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "count"))
        {
          -[NSMutableArray removeObjectsAtIndexes:](self->_history, "removeObjectsAtIndexes:", v12);
          -[_UIKBRTTouchHistory _updateOffset](self, "_updateOffset");
        }

      }
    }
    else
    {
      if (_UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference__UIKBRT_DriftReturnTime, (uint64_t)CFSTR("_UIKBRT_DriftReturnTime"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble))v6 = 2.0;
      else
        v6 = *(double *)&qword_1EDDA81A8;
      v15[0] = 0;
      v15[1] = v15;
      v15[2] = 0x2020000000;
      v16 = 0;
      v16 = -[NSMutableArray count](self->_history, "count") - a3;
      v7 = self->_history;
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __43___UIKBRTTouchHistory__decayHistoryToSize___block_invoke;
      v14[3] = &unk_1E16D8360;
      *(CFAbsoluteTime *)&v14[5] = v5;
      *(double *)&v14[6] = v6;
      v14[4] = v15;
      -[NSMutableArray indexesOfObjectsPassingTest:](v7, "indexesOfObjectsPassingTest:", v14);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "count"))
      {
        -[NSMutableArray removeObjectsAtIndexes:](self->_history, "removeObjectsAtIndexes:", v8);
        -[_UIKBRTTouchHistory _updateOffset](self, "_updateOffset");
      }

      _Block_object_dispose(v15, 8);
    }
  }
}

- (void)reset
{
  -[NSMutableArray removeAllObjects](self->_history, "removeAllObjects");
  self->_historyOffset = (CGPoint)*MEMORY[0x1E0C9D538];
}

- (void)_updateOffset
{
  uint64_t v3;
  void *v4;
  NSMutableArray *history;
  id v6;
  CGPoint *v7;
  float64x2_t v13;
  _QWORD v15[4];
  id v16;
  _QWORD *v17;
  _QWORD v18[3];
  int v19;
  _QWORD aBlock[5];
  uint64_t v21;
  float64x2_t *v22;
  uint64_t v23;
  void *v24;
  __int128 v25;

  -[_UIKBRTTouchHistory _sortHistory](self, "_sortHistory");
  v21 = 0;
  v22 = (float64x2_t *)&v21;
  v23 = 0x3010000000;
  v24 = &unk_18685B0AF;
  v3 = MEMORY[0x1E0C809B0];
  v25 = *MEMORY[0x1E0C9D538];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __36___UIKBRTTouchHistory__updateOffset__block_invoke;
  aBlock[3] = &unk_1E16D83A8;
  aBlock[4] = &v21;
  v4 = _Block_copy(aBlock);
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  v19 = 0;
  history = self->_history;
  v15[0] = v3;
  v15[1] = 3221225472;
  v15[2] = __36___UIKBRTTouchHistory__updateOffset__block_invoke_2;
  v15[3] = &unk_1E16D83D0;
  v6 = v4;
  v16 = v6;
  v17 = v18;
  -[NSMutableArray enumerateObjectsWithOptions:usingBlock:](history, "enumerateObjectsWithOptions:usingBlock:", 2, v15);
  v7 = (CGPoint *)v22;
  __asm { FMOV            V1.2D, #10.0 }
  v13 = vdivq_f64(v22[2], _Q1);
  __asm { FMOV            V1.2D, #0.5 }
  v22[2] = vrndq_f64(vaddq_f64(v13, _Q1));
  self->_historyOffset = v7[2];

  _Block_object_dispose(v18, 8);
  _Block_object_dispose(&v21, 8);
}

- (BOOL)isLeftHand
{
  return self->_isLeftHand;
}

- (void)setIsLeftHand:(BOOL)a3
{
  self->_isLeftHand = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_history, 0);
}

@end
