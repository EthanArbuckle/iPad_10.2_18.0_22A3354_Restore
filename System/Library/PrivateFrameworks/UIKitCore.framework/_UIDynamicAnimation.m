@implementation _UIDynamicAnimation

+ (void)_updateAnimations:(id)a3 timer:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  id v22;
  id v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (qword_1ECD79CC0)
  {
    objc_msgSend((id)qword_1ECD79CC0, "enumerateObjectsUsingBlock:", &__block_literal_global_23);

    qword_1ECD79CC0 = 0;
  }
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v6 = (void *)qword_1ECD79CD0;
  v7 = objc_msgSend((id)qword_1ECD79CD0, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v30;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v30 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
        if (a3 && *(id *)(v11 + 16) == a3 || a4 && *(id *)(v11 + 24) == a4)
        {
          if (*(_BYTE *)(v11 + 48))
            sched_yield();
          if (a3)
            objc_msgSend(a3, "timestamp");
          else
            v12 = CACurrentMediaTime();
          v13 = v12;
          v14 = *(double *)(v11 + 40);
          v15 = (void *)objc_msgSend(*(id *)(v11 + 32), "copy");
          v25 = 0u;
          v26 = 0u;
          v27 = 0u;
          v28 = 0u;
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
          if (v16)
          {
            v17 = v16;
            v18 = v13 - v14;
            v19 = *(_QWORD *)v26;
            do
            {
              for (j = 0; j != v17; ++j)
              {
                if (*(_QWORD *)v26 != v19)
                  objc_enumerationMutation(v15);
                v21 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * j);
                if (objc_msgSend(v21, "_usesNSTimer"))
                  v22 = a3;
                else
                  v22 = a4;
                if (!v22)
                {
                  v23 = v21;
                  if (objc_msgSend(v21, "_animateForInterval:", v18))
                  {
                    v24 = (void *)qword_1ECD79CC0;
                    if (!qword_1ECD79CC0)
                    {
                      v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0);
                      qword_1ECD79CC0 = (uint64_t)v24;
                    }
                    objc_msgSend(v24, "addObject:", v21);
                  }

                }
              }
              v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
            }
            while (v17);
          }

          *(double *)(v11 + 40) = v13;
          return;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      if (v8)
        continue;
      break;
    }
  }
  objc_msgSend(a3, "invalidate");
  objc_msgSend(a4, "invalidate");
}

+ (void)_updateAnimations:(id)a3
{
  objc_msgSend(a1, "_updateAnimations:timer:", a3, 0);
}

+ (void)_updateAnimationsWithTimer:(id)a3
{
  objc_msgSend(a1, "_updateAnimations:timer:", 0, a3);
}

+ (id)dynamicAnimationForView:(id)a3 withInitialValue:(double)a4 velocity:(double)a5 type:(int)a6 anchorPoint:(CGPoint)a7
{
  CGFloat y;
  CGFloat x;
  _UIDynamicValueAnimation *v13;
  double v14;
  _UIDynamicValueAnimation *v15;
  uint64_t (*v16)(uint64_t, double, double);
  uint64_t v17;
  uint64_t (*v18)(uint64_t, double, double);
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, double, double);
  void *v23;
  id v24;
  _QWORD *v25;
  _QWORD *v26;
  _QWORD v27[6];
  _QWORD v28[4];

  y = a7.y;
  x = a7.x;
  v13 = [_UIDynamicValueAnimation alloc];
  if ((a6 - 6) >= 7)
    v14 = 1.0;
  else
    v14 = 0.0001;
  v15 = -[_UIDynamicValueAnimation initWithValue:velocity:unitSize:](v13, "initWithValue:velocity:unitSize:", a4, a5, v14);
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x2020000000;
  *(double *)&v28[3] = a4;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3010000000;
  v27[3] = &unk_18685B0AF;
  *(CGFloat *)&v27[4] = x;
  *(CGFloat *)&v27[5] = y;
  switch(a6)
  {
    case 0:
      v20 = MEMORY[0x1E0C809B0];
      v21 = 3221225472;
      v16 = ___CreateDefaultAnimationApplier_block_invoke_8;
      goto LABEL_12;
    case 1:
      v20 = MEMORY[0x1E0C809B0];
      v21 = 3221225472;
      v16 = ___CreateDefaultAnimationApplier_block_invoke_9;
      goto LABEL_12;
    case 2:
      v20 = MEMORY[0x1E0C809B0];
      v21 = 3221225472;
      v16 = ___CreateDefaultAnimationApplier_block_invoke_10;
      goto LABEL_12;
    case 3:
      v20 = MEMORY[0x1E0C809B0];
      v21 = 3221225472;
      v16 = (uint64_t (*)(uint64_t, double, double))___CreateDefaultAnimationApplier_block_invoke_11;
      goto LABEL_12;
    case 4:
      v20 = MEMORY[0x1E0C809B0];
      v21 = 3221225472;
      v16 = ___CreateDefaultAnimationApplier_block_invoke_12;
      goto LABEL_12;
    case 5:
      v20 = MEMORY[0x1E0C809B0];
      v21 = 3221225472;
      v16 = ___CreateDefaultAnimationApplier_block_invoke_13;
LABEL_12:
      v22 = v16;
      v23 = &unk_1E16B4230;
      v24 = a3;
      goto LABEL_20;
    case 6:
      v20 = MEMORY[0x1E0C809B0];
      v21 = 3221225472;
      v18 = ___CreateDefaultAnimationApplier_block_invoke_2;
      goto LABEL_19;
    case 7:
      v20 = MEMORY[0x1E0C809B0];
      v21 = 3221225472;
      v18 = ___CreateDefaultAnimationApplier_block_invoke_3;
      goto LABEL_19;
    case 8:
      v20 = MEMORY[0x1E0C809B0];
      v21 = 3221225472;
      v18 = ___CreateDefaultAnimationApplier_block_invoke_4;
      goto LABEL_19;
    case 9:
      v20 = MEMORY[0x1E0C809B0];
      v21 = 3221225472;
      v18 = ___CreateDefaultAnimationApplier_block_invoke_5;
      goto LABEL_19;
    case 10:
      v20 = MEMORY[0x1E0C809B0];
      v21 = 3221225472;
      v18 = ___CreateDefaultAnimationApplier_block_invoke_6;
      goto LABEL_19;
    case 11:
      v20 = MEMORY[0x1E0C809B0];
      v21 = 3221225472;
      v18 = ___CreateDefaultAnimationApplier_block_invoke_7;
LABEL_19:
      v22 = v18;
      v23 = &unk_1E16B4208;
      v24 = a3;
      v25 = v27;
      v26 = v28;
      goto LABEL_20;
    case 12:
      v20 = MEMORY[0x1E0C809B0];
      v21 = 3221225472;
      v22 = ___CreateDefaultAnimationApplier_block_invoke;
      v23 = &unk_1E16B41E0;
      v24 = a3;
      v25 = v27;
LABEL_20:
      v17 = objc_msgSend(&v20, "copy");
      break;
    default:
      v17 = 0;
      break;
  }
  _Block_object_dispose(v27, 8);
  _Block_object_dispose(v28, 8);
  v15->_viewApplier = (id)v17;
  return v15;
}

- (_UIDynamicAnimation)init
{
  _UIDynamicAnimation *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIDynamicAnimation;
  v2 = -[_UIDynamicAnimation init](&v4, sel_init);
  if (v2)
  {
    if (qword_1ECD79CC8 != -1)
      dispatch_once(&qword_1ECD79CC8, &__block_literal_global_14);
    *((_BYTE *)v2 + 20) = *((_BYTE *)v2 + 20) & 0xDF | (32 * _MergedGlobals_1);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIDynamicAnimation;
  -[_UIDynamicAnimation dealloc](&v3, sel_dealloc);
}

- (void)_stopAnimation
{

  self->_completion = 0;
  *((_BYTE *)self + 20) &= 0xFCu;
  self->_state = 0;
}

- (BOOL)_animateForInterval:(double)a3
{
  return 1;
}

- (void)_callAppliers:(id)a3 additionalEndAppliers:(id)a4 done:(BOOL)a5
{
  _BOOL4 v5;
  char v8;

  v5 = a5;
  self->_state = 2;
  v8 = *((_BYTE *)self + 20);
  if ((v8 & 1) != 0)
  {
    if (a5)
      self->_state = 3;
    (*((void (**)(id))a3 + 2))(a3);
  }
  else
  {
    self->_state = 1;
    *((_BYTE *)self + 20) = v8 | 1;
    (*((void (**)(id, uint64_t))a3 + 2))(a3, 1);
    if (v5)
    {
      self->_state = 3;
      if (a4)
        (*((void (**)(id))a4 + 2))(a4);
      else
        (*((void (**)(id))a3 + 2))(a3);
    }
  }
}

- (void)runWithCompletion:(id)a3 forScreen:(id)a4 runLoopMode:(id)a5
{
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _UIDynamicAnimationState *v14;
  NSMutableArray *activeAnimations;
  CADisplayLink *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if ((*((_BYTE *)self + 20) & 0x10) != 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("%@ is grouped. Grouped dynamic animations may not be run independent of their group"), self);
  if (!a4)
    a4 = +[UIScreen mainScreen](UIScreen, "mainScreen");
  if (!a5)
    a5 = (id)*MEMORY[0x1E0C99860];
  if ((*((_BYTE *)self + 20) & 2) == 0)
  {

    self->_completion = (id)objc_msgSend(a3, "copy");
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v9 = (void *)qword_1ECD79CD0;
    v10 = objc_msgSend((id)qword_1ECD79CD0, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v18;
LABEL_10:
      v13 = 0;
      while (1)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_UIDynamicAnimationState **)(*((_QWORD *)&v17 + 1) + 8 * v13);
        if (v14->_screen == a4)
          break;
        if (v11 == ++v13)
        {
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
          if (v11)
            goto LABEL_10;
          goto LABEL_16;
        }
      }
    }
    else
    {
LABEL_16:
      if (!qword_1ECD79CD0)
        qword_1ECD79CD0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0);
      v14 = objc_alloc_init(_UIDynamicAnimationState);
      objc_msgSend((id)qword_1ECD79CD0, "addObject:", v14);

    }
    if ((*((_BYTE *)self + 20) & 8) != 0)
      v14->_shouldSchedYield = 1;
    activeAnimations = v14->_activeAnimations;
    if (!activeAnimations)
    {
      activeAnimations = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v14->_activeAnimations = activeAnimations;
    }
    -[NSMutableArray addObject:](activeAnimations, "addObject:", self);
    if (!-[_UIDynamicAnimation _usesNSTimer](self, "_usesNSTimer") && !v14->_displayLink)
    {
      v16 = (CADisplayLink *)(id)objc_msgSend(a4, "displayLinkWithTarget:selector:", objc_opt_class(), sel__updateAnimations_);
      v14->_displayLink = v16;
      -[CADisplayLink addToRunLoop:forMode:](v16, "addToRunLoop:forMode:", objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop"), a5);
      v14->_lastUpdateTime = CACurrentMediaTime();
    }
    if (-[_UIDynamicAnimation _usesNSTimer](self, "_usesNSTimer"))
    {
      if (!v14->_timer)
      {
        v14->_timer = (NSTimer *)(id)objc_msgSend(MEMORY[0x1E0C99E88], "timerWithTimeInterval:target:selector:userInfo:repeats:", objc_opt_class(), sel__updateAnimationsWithTimer_, 0, 1, 0.0166666667);
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop"), "addTimer:forMode:", v14->_timer, a5);
        v14->_lastUpdateTime = CACurrentMediaTime();
      }
    }
    *((_BYTE *)self + 20) |= 2u;
  }
}

- (void)runWithCompletion:(id)a3
{
  -[_UIDynamicAnimation runWithCompletion:forScreen:runLoopMode:](self, "runWithCompletion:forScreen:runLoopMode:", a3, 0, 0);
}

- (void)stop
{
  _UIDynamicAnimation *v2;

  v2 = self;
  if ((*((_BYTE *)self + 20) & 2) != 0)
    -[_UIDynamicAnimation _completeWithFinished:](self, "_completeWithFinished:", 0);
  else
    -[_UIDynamicAnimation _stopAnimation](self, "_stopAnimation");

}

- (void)_completeWithFinished:(BOOL)a3
{
  char v4;
  id completion;
  _BOOL8 v6;
  void (**v7)(id, _BOOL8);
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if ((*((_BYTE *)self + 20) & 4) == 0)
  {
    v4 = *((_BYTE *)self + 20) | 4;
    *((_BYTE *)self + 20) = v4;
    completion = self->_completion;
    if (completion)
    {
      v6 = a3;
      v7 = (void (**)(id, _BOOL8))completion;
      v7[2](v7, v6);

      v4 = *((_BYTE *)self + 20);
    }
    *((_BYTE *)self + 20) = v4 & 0xFB;
    -[_UIDynamicAnimation _stopAnimation](self, "_stopAnimation", a3);
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v8 = (void *)qword_1ECD79CD0;
    v9 = objc_msgSend((id)qword_1ECD79CD0, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v9)
    {
      v10 = v9;
      v19 = 0;
      v11 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v25 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
          objc_msgSend(*(id *)(v13 + 32), "removeObject:", self);
          if (objc_msgSend(*(id *)(v13 + 32), "count"))
          {
            *(_BYTE *)(v13 + 48) = 0;
            v22 = 0u;
            v23 = 0u;
            v20 = 0u;
            v21 = 0u;
            v14 = *(void **)(v13 + 32);
            v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
            if (v15)
            {
              v16 = v15;
              v17 = *(_QWORD *)v21;
              while (2)
              {
                for (j = 0; j != v16; ++j)
                {
                  if (*(_QWORD *)v21 != v17)
                    objc_enumerationMutation(v14);
                  if ((*(_BYTE *)(*(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * j) + 20) & 8) != 0)
                  {
                    *(_BYTE *)(v13 + 48) = 1;
                    goto LABEL_21;
                  }
                }
                v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
                if (v16)
                  continue;
                break;
              }
            }
          }
          else
          {
            objc_msgSend(*(id *)(v13 + 16), "invalidate");

            *(_QWORD *)(v13 + 16) = 0;
            objc_msgSend(*(id *)(v13 + 24), "invalidate");

            *(_QWORD *)(v13 + 24) = 0;
            *(_QWORD *)(v13 + 32) = 0;
            v19 = v13;
          }
LABEL_21:
          ;
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v10);
    }
    else
    {
      v19 = 0;
    }
    objc_msgSend((id)qword_1ECD79CD0, "removeObject:", v19);
    if (!objc_msgSend((id)qword_1ECD79CD0, "count"))
    {

      qword_1ECD79CD0 = 0;
    }
  }
}

- (void)_cancelWithAppliers:(id)a3
{
  if ((*((_BYTE *)self + 20) & 2) != 0)
  {
    self->_state = 4;
    (*((void (**)(id, SEL))a3 + 2))(a3, a2);
    -[_UIDynamicAnimation stop](self, "stop");
  }
}

- (int)state
{
  return self->_state;
}

- (BOOL)_shouldYield
{
  return (*((unsigned __int8 *)self + 20) >> 3) & 1;
}

- (void)_setShouldYield:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *((_BYTE *)self + 20) = *((_BYTE *)self + 20) & 0xF7 | v3;
}

- (BOOL)_usesNSTimer
{
  return (*((unsigned __int8 *)self + 20) >> 5) & 1;
}

- (void)_setUsesNSTimer:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *((_BYTE *)self + 20) = *((_BYTE *)self + 20) & 0xDF | v3;
}

- (BOOL)_isGrouped
{
  return (*((unsigned __int8 *)self + 20) >> 4) & 1;
}

- (void)_setGrouped:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *((_BYTE *)self + 20) = *((_BYTE *)self + 20) & 0xEF | v3;
}

- (BOOL)_isRunning
{
  return (*((unsigned __int8 *)self + 20) >> 1) & 1;
}

- (void)_appendDescriptionToString:(id)a3 atLevel:(int)a4
{
  uint64_t v4;
  unint64_t v7;
  uint64_t v8;
  void *i;
  uint64_t state;
  __CFString *v11;
  id v12;

  v4 = *(_QWORD *)&a4;
  v12 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  if (objc_msgSend(a3, "length"))
    objc_msgSend(a3, "appendString:", CFSTR("\n"));
  if ((_DWORD)v4)
  {
    v7 = 1;
    do
    {
      objc_msgSend(a3, "appendString:", CFSTR("    "));
      ++v7;
    }
    while (v7 <= (int)v4);
  }
  objc_msgSend(a3, "appendFormat:", CFSTR("<%@: %p"), objc_opt_class(), self);
  v8 = objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  for (i = (void *)objc_opt_class();
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", i) != v8;
        i = (void *)objc_msgSend(i, "superclass"))
  {
    if (i == (void *)objc_opt_class())
      break;
  }
  if ((void *)objc_opt_class() != i)
    objc_msgSend(a3, "appendFormat:", CFSTR("; baseClass = %@"), NSStringFromClass((Class)i));
  state = self->_state;
  if (state > 4)
    v11 = 0;
  else
    v11 = off_1E16B4250[state];
  objc_msgSend(a3, "appendFormat:", CFSTR("; state = %@"), v11);
  -[_UIDynamicAnimation _appendSubclassDescription:atLevel:](self, "_appendSubclassDescription:atLevel:", a3, v4);
  objc_msgSend(a3, "appendFormat:", CFSTR(">"));

}

- (id)description
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  -[_UIDynamicAnimation _appendDescriptionToString:atLevel:](self, "_appendDescriptionToString:atLevel:", v3, 0);
  return v3;
}

@end
