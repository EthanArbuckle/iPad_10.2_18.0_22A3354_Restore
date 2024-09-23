@implementation _UITransitionState

- (_UITransitionState)initWithTransitionDirection:(int64_t)a3 completion:(id)a4
{
  id v6;
  _UITransitionState *v7;
  _UITransitionState *v8;
  uint64_t v9;
  id completion;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_UITransitionState;
  v7 = -[_UITransitionState init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_transitionDirection = a3;
    v9 = objc_msgSend(v6, "copy");
    completion = v8->_completion;
    v8->_completion = (id)v9;

  }
  return v8;
}

- (BOOL)isActive
{
  return self->_completion != 0;
}

- (void)markBeginDate
{
  NSDate *v3;
  NSDate *beginDate;

  v3 = (NSDate *)objc_alloc_init(MEMORY[0x1E0C99D68]);
  beginDate = self->_beginDate;
  self->_beginDate = v3;

}

- (void)cleanupWithFinishedState:(BOOL)a3 completedState:(BOOL)a4
{
  void (**completion)(id, BOOL, BOOL);
  id v6;

  completion = (void (**)(id, BOOL, BOOL))self->_completion;
  if (completion)
  {
    completion[2](completion, a3, a4);
    v6 = self->_completion;
    self->_completion = 0;

  }
}

- (BOOL)isCompatibleWithTransitionInDirection:(int64_t)a3
{
  return -[_UITransitionState effectiveTransitionDirection](self, "effectiveTransitionDirection") == a3;
}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UITransitionState;
  -[_UITransitionState description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "deleteCharactersInRange:", objc_msgSend(v4, "length") - 1, 1);
  objc_msgSend(v4, "appendFormat:", CFSTR("; transitionDirection: %ld>"),
    -[_UITransitionState transitionDirection](self, "transitionDirection"));
  return v4;
}

- (int64_t)transitionDirection
{
  return self->_transitionDirection;
}

- (NSDate)beginDate
{
  return self->_beginDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_beginDate, 0);
  objc_storeStrong(&self->_completion, 0);
}

@end
