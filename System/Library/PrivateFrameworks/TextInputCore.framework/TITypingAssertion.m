@implementation TITypingAssertion

- (void)touchWithReason:(int64_t)a3
{
  -[TITypingAssertion touchWithDuration:reason:](self, "touchWithDuration:reason:", a3, 0.35);
}

+ (id)sharedTypingAssertion
{
  if (sharedTypingAssertion_onceToken != -1)
    dispatch_once(&sharedTypingAssertion_onceToken, &__block_literal_global_16617);
  return (id)sharedTypingAssertion___sharedInstance;
}

- (void)timerFired:(id)a3
{
  void *v4;

  -[TITypingAssertion setActive:](self, "setActive:", 0);
  -[TITypingAssertion timer](self, "timer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  -[TITypingAssertion setTimer:](self, "setTimer:", 0);
}

- (void)touchWithDuration:(double)a3 reason:(int64_t)a4
{
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) != 0)
  {
    if (a4 == 1 && !self->_active)
    {
      -[TITypingAssertion pointerClientController](self, "pointerClientController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "autohidePointerForReason:", 1);

    }
    -[TITypingAssertion setActive:](self, "setActive:", 1);
    -[TITypingAssertion timer](self, "timer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isValid");

    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", a3);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      -[TITypingAssertion timer](self, "timer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "fireDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "laterDate:", v14);
      v12 = (id)objc_claimAutoreleasedReturnValue();

      if (v12 == v14)
      {
        -[TITypingAssertion timer](self, "timer");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setFireDate:", v14);

      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_timerFired_, 0, 0, a3);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      -[TITypingAssertion setTimer:](self, "setTimer:", v14);
    }

  }
  else
  {
    TIDispatchAsync();
  }
}

- (NSTimer)timer
{
  return self->_timer;
}

- (void)setActive:(BOOL)a3
{
  _BOOL4 v5;
  _BOOL8 v6;

  if (self->_active != a3)
  {
    v5 = -[TITypingAssertion isActive](self, "isActive");
    self->_active = a3;
    v6 = -[TITypingAssertion isActive](self, "isActive");
    if (v5 != v6)
      -[TITypingAssertion _sbsSetTypingActive:](self, "_sbsSetTypingActive:", v6);
  }
}

- (BOOL)isActive
{
  return self->_active || (unint64_t)-[NSMutableSet count](self->_restingPathIndices, "count") > 2;
}

- (void)setTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
}

- (void)_sbsSetTypingActive:(BOOL)a3
{
  _BOOL8 v3;
  void (*v4)(_BOOL8);
  TIKeyboardInputManager_mul *v5;
  SEL v6;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void *v11;

  v3 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v4 = (void (*)(_BOOL8))getSBSSetTypingActiveSymbolLoc_ptr;
  v11 = getSBSSetTypingActiveSymbolLoc_ptr;
  if (!getSBSSetTypingActiveSymbolLoc_ptr)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __getSBSSetTypingActiveSymbolLoc_block_invoke;
    v7[3] = &unk_1EA107058;
    v7[4] = &v8;
    __getSBSSetTypingActiveSymbolLoc_block_invoke((uint64_t)v7);
    v4 = (void (*)(_BOOL8))v9[3];
  }
  _Block_object_dispose(&v8, 8);
  if (v4)
  {
    v4(v3);
  }
  else
  {
    dlerror();
    v5 = (TIKeyboardInputManager_mul *)abort_report_np();
    -[TIKeyboardInputManager_mul resume](v5, v6);
  }
}

- (void)restResetTouches
{
  _BOOL4 v3;
  NSMutableSet *restingPathIndices;
  _BOOL8 v5;

  if (self->_restingPathIndices)
  {
    v3 = -[TITypingAssertion isActive](self, "isActive");
    restingPathIndices = self->_restingPathIndices;
    self->_restingPathIndices = 0;

    v5 = -[TITypingAssertion isActive](self, "isActive");
    if (v3 != v5)
      -[TITypingAssertion _sbsSetTypingActive:](self, "_sbsSetTypingActive:", v5);
  }
}

- (void)dealloc
{
  objc_super v3;

  -[NSTimer invalidate](self->_timer, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)TITypingAssertion;
  -[TITypingAssertion dealloc](&v3, sel_dealloc);
}

- (TITypingAssertion)init
{
  TITypingAssertion *v2;
  TITypingAssertion *v3;
  void *v4;
  objc_class *v5;
  id v6;
  objc_super v8;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v8.receiver = self;
  v8.super_class = (Class)TITypingAssertion;
  v2 = -[TITypingAssertion init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    -[TITypingAssertion _sbsSetTypingActive:](v2, "_sbsSetTypingActive:", 0);
    v10 = 0;
    v11 = &v10;
    v12 = 0x2050000000;
    v4 = (void *)getPSPointerClientControllerClass_softClass;
    v13 = getPSPointerClientControllerClass_softClass;
    if (!getPSPointerClientControllerClass_softClass)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __getPSPointerClientControllerClass_block_invoke;
      v9[3] = &unk_1EA107058;
      v9[4] = &v10;
      __getPSPointerClientControllerClass_block_invoke((uint64_t)v9);
      v4 = (void *)v11[3];
    }
    v5 = objc_retainAutorelease(v4);
    _Block_object_dispose(&v10, 8);
    v6 = objc_alloc_init(v5);
    -[TITypingAssertion setPointerClientController:](v3, "setPointerClientController:", v6);

  }
  return v3;
}

- (void)restTouchStartWithPathIndex:(int64_t)a3
{
  NSMutableSet *v5;
  NSMutableSet *restingPathIndices;
  _BOOL4 v7;
  NSMutableSet *v8;
  void *v9;
  _BOOL8 v10;

  if (!self->_restingPathIndices)
  {
    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    restingPathIndices = self->_restingPathIndices;
    self->_restingPathIndices = v5;

  }
  v7 = -[TITypingAssertion isActive](self, "isActive");
  v8 = self->_restingPathIndices;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet addObject:](v8, "addObject:", v9);

  v10 = -[TITypingAssertion isActive](self, "isActive");
  if (v7 != v10)
    -[TITypingAssertion _sbsSetTypingActive:](self, "_sbsSetTypingActive:", v10);
}

- (void)restTouchEndWithPathIndex:(int64_t)a3
{
  _BOOL4 v5;
  NSMutableSet *restingPathIndices;
  void *v7;
  _BOOL8 v8;

  if (self->_restingPathIndices)
  {
    v5 = -[TITypingAssertion isActive](self, "isActive");
    restingPathIndices = self->_restingPathIndices;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet removeObject:](restingPathIndices, "removeObject:", v7);

    v8 = -[TITypingAssertion isActive](self, "isActive");
    if (v5 != v8)
      -[TITypingAssertion _sbsSetTypingActive:](self, "_sbsSetTypingActive:", v8);
  }
}

- (id)__restingPathIndices
{
  return self->_restingPathIndices;
}

- (PSPointerClientController)pointerClientController
{
  return self->_pointerClientController;
}

- (void)setPointerClientController:(id)a3
{
  objc_storeStrong((id *)&self->_pointerClientController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pointerClientController, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_restingPathIndices, 0);
}

uint64_t __46__TITypingAssertion_touchWithDuration_reason___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "touchWithDuration:reason:", *(_QWORD *)(a1 + 48), *(double *)(a1 + 40));
}

void __42__TITypingAssertion_sharedTypingAssertion__block_invoke()
{
  TITypingAssertion *v0;
  void *v1;

  v0 = objc_alloc_init(TITypingAssertion);
  v1 = (void *)sharedTypingAssertion___sharedInstance;
  sharedTypingAssertion___sharedInstance = (uint64_t)v0;

}

@end
