@implementation _UIDatePickerCalendarTimeLabelStateMachineContext

- (_UIDatePickerCalendarTimeLabelStateMachineContext)initWithUpdateHandler:(id)a3
{
  id v5;
  _UIDatePickerCalendarTimeLabelStateMachineContext *v6;
  _UIDatePickerCalendarTimeLabelStateMachineContext *v7;
  void *v8;
  id updateHandler;
  void *v11;
  objc_super v12;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDatePickerCalendarTimeLabelStateMachine.m"), 20, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("updateHandler"));

  }
  v12.receiver = self;
  v12.super_class = (Class)_UIDatePickerCalendarTimeLabelStateMachineContext;
  v6 = -[_UIDatePickerCalendarTimeLabelStateMachineContext init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_currentState = 1;
    v8 = _Block_copy(v5);
    updateHandler = v7->_updateHandler;
    v7->_updateHandler = v8;

  }
  return v7;
}

- (void)_updateFromState:(unint64_t)a3
{
  if (self->_currentState != a3)
    self->_lastDistinctState = a3;
  self->_previousState = a3;
  (*((void (**)(void))self->_updateHandler + 2))();
}

- (unint64_t)currentStateRef
{
  return &self->_currentState;
}

- (BOOL)currentSateCanTransitionWithEvents:(id)a3
{
  id v4;
  unint64_t currentState;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v4 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  currentState = self->_currentState;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __88___UIDatePickerCalendarTimeLabelStateMachineContext_currentSateCanTransitionWithEvents___block_invoke;
  v7[3] = &unk_1E16BF5E8;
  v7[4] = &v8;
  v7[5] = currentState;
  objc_msgSend(v4, "enumerateIndexesUsingBlock:", v7);
  LOBYTE(self) = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);

  return (char)self;
}

- (unint64_t)currentState
{
  return self->_currentState;
}

- (unint64_t)lastDistinctState
{
  return self->_lastDistinctState;
}

- (unint64_t)previousState
{
  return self->_previousState;
}

- (BOOL)isFirstResponder
{
  return self->_isFirstResponder;
}

- (void)setIsFirstResponder:(BOOL)a3
{
  self->_isFirstResponder = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updateHandler, 0);
}

@end
