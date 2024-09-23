@implementation _UIStateMachine

- (_UIStateMachine)initWithSpec:(void *)a3 initialState:(unint64_t)a4
{
  _UIStateMachine *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIStateMachine;
  result = -[_UIStateMachine init](&v7, sel_init);
  if (result)
  {
    result->_spec = (const $17BF4AB3ACB287AFAEEDC1F3737FC617 *)a3;
    result->_state = a4;
    result->_externalSpec = 1;
  }
  return result;
}

- (void)handleEvent:(unint64_t)a3 withContext:(_UIStateContext)a4
{
  handleEvent(&self->_spec->var0.var0, self->_state, a3, (uint64_t)a4.var0, (uint64_t *)&self->_state);
}

- (unint64_t)state
{
  return self->_state;
}

- (_UIStateMachine)initWithStates:(unint64_t)a3 events:(unint64_t)a4 initialState:(unint64_t)a5
{
  unsigned int v6;
  unsigned int v7;
  _UIStateMachine *v8;
  uint64_t v9;
  $17BF4AB3ACB287AFAEEDC1F3737FC617 *v10;
  objc_super v12;

  v6 = a4;
  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_UIStateMachine;
  v8 = -[_UIStateMachine init](&v12, sel_init);
  if (v8)
  {
    v9 = 24 * v6 + 8;
    v10 = ($17BF4AB3ACB287AFAEEDC1F3737FC617 *)malloc_type_calloc(1uLL, v9 * v7 + 32, 0xBEDE849DuLL);
    v10->var0.var0 = v9;
    v10->var0.var1 = v7;
    v10->var0.var2 = v6;
    v8->_spec = v10;
    v8->_state = a5;
    v8->_externalSpec = 0;
  }
  return v8;
}

- (void)dealloc
{
  $17BF4AB3ACB287AFAEEDC1F3737FC617 *spec;
  unint64_t v4;
  $B386367458CBE0D874BD6748C2C6B88D *var2;
  unint64_t var0;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  void **v10;
  void *v11;
  void *v12;
  objc_super v13;

  if (!self->_externalSpec)
  {
    spec = ($17BF4AB3ACB287AFAEEDC1F3737FC617 *)self->_spec;
    if (spec->var0.var1)
    {
      v4 = 0;
      var2 = spec->var2;
      do
      {
        var0 = spec->var0.var0;
        v7 = spec->var0.var0 * v4;
        v8 = *(id *)((char *)&var2->var0 + v7);
        *(id *)((char *)&var2->var0 + v7) = 0;

        if (spec->var0.var2)
        {
          v9 = 0;
          v10 = (id *)((char *)&spec->var2[2].var0 + var0 * v4);
          do
          {
            v11 = *v10;
            *v10 = 0;

            v12 = *(v10 - 1);
            *(v10 - 1) = 0;

            ++v9;
            v10 += 3;
          }
          while (v9 < spec->var0.var2);
        }
        ++v4;
      }
      while (v4 < spec->var0.var1);
    }
    free(spec);
  }
  v13.receiver = self;
  v13.super_class = (Class)_UIStateMachine;
  -[_UIStateMachine dealloc](&v13, sel_dealloc);
}

- (void)setTransitionHandlerForState:(unint64_t)a3 withEvent:(unint64_t)a4 transitionHandler:(id)a5
{
  -[_UIStateMachine setTransitionHandlerForState:withEvent:transitionHandler:postTransitionHandler:](self, "setTransitionHandlerForState:withEvent:transitionHandler:postTransitionHandler:", a3, a4, a5, 0);
}

- (void)setTransitionHandlerForState:(unint64_t)a3 withEvent:(unint64_t)a4 transitionHandler:(id)a5 postTransitionHandler:(id)a6
{
  const $17BF4AB3ACB287AFAEEDC1F3737FC617 *spec;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  spec = self->_spec;
  if (spec->var0.var1 <= a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[_UIStateMachine(Legacy) setTransitionHandlerForState:withEvent:transitionHandler:postTransitionHandler:]");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, CFSTR("_UIStateMachine.m"), 201, CFSTR("Attempting to set transition handler with invalid fromState. State (@lu) is out of range for the initialized stateCount (%lu)"), a3, self->_spec->var0.var1);

    spec = self->_spec;
  }
  if (spec->var0.var2 <= a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[_UIStateMachine(Legacy) setTransitionHandlerForState:withEvent:transitionHandler:postTransitionHandler:]");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, CFSTR("_UIStateMachine.m"), 202, CFSTR("Attempting to set transition handler with invalid event. State (@lu) is out of range for the initialized eventCount (%lu)"), a4, self->_spec->var0.var2);

    spec = self->_spec;
  }
  v12 = (unint64_t)spec + 24 * a4 + spec->var0.var0 * a3;
  v13 = _Block_copy(a6);
  v14 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v13;

  v15 = _Block_copy(a5);
  v16 = *(void **)(v12 + 48);
  *(_QWORD *)(v12 + 48) = v15;

  *(_DWORD *)(v12 + 56) = 16842752;
}

- (void)setStaticTransitionFromState:(unint64_t)a3 withEvent:(unint64_t)a4 toState:(unint64_t)a5
{
  __int16 v5;
  const $17BF4AB3ACB287AFAEEDC1F3737FC617 *spec;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v5 = a5;
  spec = self->_spec;
  if (spec->var0.var1 <= a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[_UIStateMachine(Legacy) setStaticTransitionFromState:withEvent:toState:]");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("_UIStateMachine.m"), 212, CFSTR("Attempting to set static transition with invalid fromState. State (@lu) is out of range for the initialized stateCount (%lu)"), a3, self->_spec->var0.var1);

    spec = self->_spec;
  }
  if (spec->var0.var2 <= a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[_UIStateMachine(Legacy) setStaticTransitionFromState:withEvent:toState:]");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("_UIStateMachine.m"), 213, CFSTR("Attempting to set static transition with invalid event. State (@lu) is out of range for the initialized eventCount (%lu)"), a4, self->_spec->var0.var2);

    spec = self->_spec;
  }
  v10 = (unint64_t)spec + 24 * a4 + spec->var0.var0 * a3;
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = 0;

  v12 = *(void **)(v10 + 48);
  *(_QWORD *)(v10 + 48) = 0;

  *(_WORD *)(v10 + 56) = v5;
}

- (void)setStateChangeObserver:(unint64_t)a3 observer:(id)a4
{
  char *v4;
  void *v5;
  void *v6;
  _QWORD aBlock[5];

  v4 = (char *)self->_spec + self->_spec->var0.var0 * a3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __59___UIStateMachine_Legacy__setStateChangeObserver_observer___block_invoke;
  aBlock[3] = &unk_1E16DF448;
  aBlock[4] = a4;
  v5 = _Block_copy(aBlock);
  v6 = (void *)*((_QWORD *)v4 + 4);
  *((_QWORD *)v4 + 4) = v5;

}

- (void)spec
{
  return (void *)self->_spec;
}

@end
